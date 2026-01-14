// AudioPeer.cs
using UnityEngine;
using System.Collections;

[RequireComponent(typeof(AudioSource))]
public class AudioPeer : MonoBehaviour
{
    public int bandCount = 8;
    public int quantizeLevels = 10;
    public float multiplier = 10f;
    public float startLevel = 0.1f;
    public float maxLevel = 1f;

    public FFTWindow fftWindow = FFTWindow.BlackmanHarris;


    [Header("Smoothing Settings")]
    public bool enableSmoothing = true;
    [Range(0.01f, 1f)]
    public float smoothSpeed = 0.15f; // Düşük = daha yumuşak, Yüksek = daha 

    // MOD SEÇİMİ: Inspector'dan ayarla
    [Tooltip("TRUE = Peak (step'li), FALSE = Average (smooth)")]
    public bool usePeakMode = false;

    private AudioSource _audioSource;

    // PUBLIC ama STATIC DEĞİL! Diğer scriptler buna erişecek
    public float[] freqBand;

    private float[] _samples = new float[512];
    private float[] _averageBands;
    private float[] _peakBands;
    private float[] _prevValues; // Önceki frame değerleri

    void Start()
    {
        _audioSource = GetComponent<AudioSource>();
        freqBand = new float[bandCount];
        _averageBands = new float[bandCount];
        _peakBands = new float[bandCount];
        _prevValues = new float[bandCount];
    }

    void Update()
    {
        GetSpectrumAudioSource();
        MakeFrequencyBands();
        ApplySmoothingAndCopy();

        /*
        // Sadece seçilen modu freqBand'e kopyala
        if (usePeakMode)
            System.Array.Copy(_peakBands, freqBand, bandCount);
        else
            System.Array.Copy(_averageBands, freqBand, bandCount);
        */
    }

    void GetSpectrumAudioSource()
    {
        _audioSource.GetSpectrumData(_samples, 0, fftWindow);
    }

    void MakeFrequencyBands()
    {
        int count = 0;

        for (int i = 0; i < bandCount; i++)
        {
            int sampleCount = (int)Mathf.Pow(2, i * (8f / bandCount)) * 2;
            if (i == bandCount - 1) sampleCount += 2;

            float sum = 0;
            float peak = 0;

            for (int j = 0; j < sampleCount && count < 512; j++)
            {
                float val = _samples[count] * (count + 1);
                sum += val;
                if (val > peak) peak = val;
                count++;
            }

            if (maxLevel <= 0f) maxLevel = 0.0000001f;

            // AYRI HESAPLA
            _averageBands[i] = Mathf.Clamp01((sum / sampleCount) / maxLevel);

            float peakNormalized = Mathf.Clamp01(peak / maxLevel);
            _peakBands[i] = Quantize(peakNormalized, 0f, 1f, quantizeLevels);
        }
    }

    void ApplySmoothingAndCopy()
    {
        // Smoothing kapalıysa direkt kopyala
        if (!enableSmoothing)
        {
            if (usePeakMode)
                System.Array.Copy(_peakBands, freqBand, bandCount);
            else
                System.Array.Copy(_averageBands, freqBand, bandCount);
            return;
        }

        // Her iki modda da smoothing uygula
        float[] targetValues = usePeakMode ? _peakBands : _averageBands;

        for (int i = 0; i < bandCount; i++)
        {
            // Quantized değerler de smoothlansın, ama step yapısı korunsun
            freqBand[i] = Mathf.Lerp(_prevValues[i], targetValues[i], smoothSpeed);
            _prevValues[i] = freqBand[i]; // Sonraki frame için kaydet
        }
    }

    float Quantize(float value, float min, float max, int divide)
    {
        if (divide <= 0) divide = 1;
        float step = (max - min) / divide;
        return Mathf.Floor((value - min) / step) * step + min;
    }
}
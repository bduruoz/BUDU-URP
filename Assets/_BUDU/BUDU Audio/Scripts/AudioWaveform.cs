using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class AudioWaveform : MonoBehaviour
{
    public AudioSource audioSource;
    public int sampleCount = 256;
    public float height = 10f;
    public float width = 100f;

    [Header("Smoothing")]
    public bool enableSmoothing = true;
    [Range(0.01f, 1f)]
    public float smoothSpeed = 0.15f;

    private LineRenderer _lineRenderer;
    private float[] _samples;
    private float[] _smoothedSamples; // Buffer: Smoothlanmış değerler

    void Start()
    {
        _samples = new float[sampleCount];
        _smoothedSamples = new float[sampleCount]; // Başlangıçta 0 dolu
        _lineRenderer = GetComponent<LineRenderer>();
        _lineRenderer.positionCount = sampleCount;
        _lineRenderer.useWorldSpace = false;
    }

    void Update()
    {
        if (audioSource == null) return;

        audioSource.GetOutputData(_samples, 0);


        // Her bir örnek için smooth uygula
        if (enableSmoothing)
        {
            for (int i = 0; i < sampleCount; i++)
            {
                _smoothedSamples[i] = Mathf.Lerp(_smoothedSamples[i], _samples[i], smoothSpeed);
            }
        }
        else
        {
            // Smoothing kapalıysa ham veri
            System.Array.Copy(_samples, _smoothedSamples, sampleCount);
        }

        // Waveform'u çiz (smoothlanmış veri ile)
        for (int i = 0; i < sampleCount; i++)
        {
            float x = Mathf.Lerp(-width / 2f, width / 2f, (float)i / sampleCount);
            float y = _smoothedSamples[i] * height;

            _lineRenderer.SetPosition(i, new Vector3(x, y, 0));
        }



        //for (int i = 0; i < sampleCount; i++)
        //{
        //    float x = Mathf.Lerp(-width / 2f, width / 2f, (float)i / sampleCount);
        //    float y = _samples[i] * height;

        //    _lineRenderer.SetPosition(i, new Vector3(x, y, 0));
        //}
    }
}
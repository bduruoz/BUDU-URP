using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class VUMeter : MonoBehaviour
{
    public AudioPeer audioPeer; // Inspector'dan bağla
    public VUMode mode = VUMode.Average;

    [Header("Line Settings")]
    public float lineWidth = 0.1f;
    public float maxLength = 5f;
    public bool horizontal = true; // TRUE = yatay, FALSE = dikey

    [Header("Smoothing")]
    public bool enableSmoothing = true;
    public float smoothSpeed = 0.15f;

    [Header("Color")]
    public Color lowColor = Color.green;
    public Color midColor = Color.yellow;
    public Color highColor = Color.red;

    private LineRenderer _lineRenderer;
    private float currentValue = 0f;
    private Vector3 _direction;

    void Start()
    {
        _lineRenderer = GetComponent<LineRenderer>();
        _lineRenderer.positionCount = 2; // Başlangıç ve bitiş noktası
        _lineRenderer.startWidth = lineWidth;
        _lineRenderer.endWidth = lineWidth;

        // Yön belirle
        _direction = horizontal ? Vector3.right : Vector3.up;

        // Başlangıç pozisyonunu ayarla (objenin local pozisyonu)
        _lineRenderer.SetPosition(0, Vector3.zero);
    }

    void Update()
    {
        if (audioPeer == null) return;

        // Hedef değer hesapla (Average veya Peak)
        float targetValue = CalculateTargetValue();

        // Smooth uygula
        if (enableSmoothing)
            currentValue = Mathf.Lerp(currentValue, targetValue, smoothSpeed);
        else
            currentValue = targetValue;

        // Line uzunluğunu ayarla
        float lineLength = currentValue * maxLength;
        Vector3 endPoint = _direction * lineLength;

        _lineRenderer.SetPosition(1, endPoint);

        // Renk ayarla (seçime bağlı)
        //UpdateColor(currentValue);
    }

    float CalculateTargetValue()
    {
        float target = 0f;
        int bandCount = audioPeer.freqBand.Length;

        if (mode == VUMode.Peak)
        {
            for (int i = 0; i < bandCount; i++)
            {
                if (audioPeer.freqBand[i] > target)
                    target = audioPeer.freqBand[i];
            }
        }
        else // Average
        {
            float sum = 0f;
            for (int i = 0; i < bandCount; i++)
                sum += audioPeer.freqBand[i];
            target = sum / bandCount;
        }

        return Mathf.Clamp01(target);
    }

    void UpdateColor(float value)
    {
        // 0-0.5: green->yellow, 0.5-1: yellow->red
        Color color;
        if (value < 0.5f)
            color = Color.Lerp(lowColor, midColor, value * 20f);
        else
            color = Color.Lerp(midColor, highColor, (value - 0.5f) * 20f);

        _lineRenderer.startColor = color;
        _lineRenderer.endColor = color;
    }

    public enum VUMode { Average, Peak }
}
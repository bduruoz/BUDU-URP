// BUDU Games 2024 - 2025
// VU Meter Needle

using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class VUMeterNeedle : MonoBehaviour
{
    public AudioPeer audioPeer;
    public Transform pivotPoint; // İbrenin döneceği nokta (boş GameObject)

    [Header("Angle Settings")]
    public float minAngle = -45f; // Sol başlangıç açısı
    public float maxAngle = 45f;  // Sağ bitiş açısı
    public bool clockwise = true; // Açı artışı saat yönünde mi?

    [Header("Needle")]
    public float needleLength = 3f;
    public float needleWidth = 0.1f;
    public float needleTipWidth = 0.02f;


    [Header("Smoothing")]
    public bool enableSmoothing = true;
    public float smoothSpeed = 0.1f; // VU meter için daha yavaş

    [Header("Colors")]
    public Color needleColor = Color.white;

    private LineRenderer _lineRenderer;
    private float currentAngle = 0f;
    private float currentValue = 0f;

    void Start()
    {
        _lineRenderer = GetComponent<LineRenderer>();
        _lineRenderer.positionCount = 2;
        _lineRenderer.startWidth = needleWidth;
        _lineRenderer.endWidth = needleTipWidth; // Sivri uç
        _lineRenderer.startColor = needleColor;
        _lineRenderer.endColor = needleColor;
        _lineRenderer.useWorldSpace = false; // Pivot'un local space'inde çalış

        // Başlangıç pozisyonunu ayarla
        UpdateNeedlePosition(0f);
    }

    void Update()
    {
        if (audioPeer == null || pivotPoint == null) return;

        // Hedef değeri hesapla (tüm bandların ortalaması/peaki)
        float targetValue = CalculateTargetValue();

        // Smooth uygula
        if (enableSmoothing)
            currentValue = Mathf.Lerp(currentValue, targetValue, smoothSpeed);
        else
            currentValue = targetValue;

        // İbre açısını güncelle
        UpdateNeedlePosition(currentValue);
    }

    void UpdateNeedlePosition(float value)
    {
        // 0-1 arası değeri açıya çevir
        float targetAngle = Mathf.Lerp(minAngle, maxAngle, value);

        // Pivot'un local rotasyonunu ayarla
        pivotPoint.localRotation = Quaternion.Euler(0, 0, clockwise ? -targetAngle : targetAngle);

        // İbre çizgisini çiz (pivot'tan uzayan)
        Vector3 needleStart = Vector3.zero; // Pivot'un merkezi
        Vector3 needleEnd = new Vector3(0, needleLength, 0); // Yukarı uzayan

        _lineRenderer.SetPosition(0, needleStart);
        _lineRenderer.SetPosition(1, needleEnd);
    }

    float CalculateTargetValue()
    {
        float target = 0f;
        int bandCount = audioPeer.freqBand.Length;

        // Ortalama seviye (VU meter için ideal)
        float sum = 0f;
        for (int i = 0; i < bandCount; i++)
            sum += audioPeer.freqBand[i];
        target = sum / bandCount;

        return Mathf.Clamp01(target);
    }
}
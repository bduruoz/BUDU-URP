// © BUDU Games | 2020 - 2026
// LightIntensityControl.cs

using UnityEngine;

#if UNITY_EDITOR
[ExecuteInEditMode]
#endif
public class LightIntensityControl : MonoBehaviour
{
    public float noiseSpeed = 1.0f;
    public float noiseScale = 1.0f;
    public float baseIntensity = 1.0f;
    public float intensityVariation = 0.5f;
    private float originalIntensity = 0f;

    private Light targetLight;
    private float noiseOffset;

    void Start()
    {
        targetLight = GetComponent<Light>();
        originalIntensity = targetLight.intensity;
        noiseOffset = Random.Range(0f, 100f); // Start different noise for each object
    }

    void Update()
    {
        float time = Time.time * noiseSpeed + noiseOffset;
        float noiseValue = Mathf.PerlinNoise(time, 0f); // 0–1
        float dynamicIntensity = baseIntensity + (noiseValue - 0.5f) * 2f * intensityVariation;
        targetLight.intensity = Mathf.Max(dynamicIntensity, 0f) * originalIntensity; // Not Negative
    }
}

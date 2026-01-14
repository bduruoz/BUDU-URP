// BUDU Games 2024 - 2025
using UnityEngine;

[ExecuteAlways] 
public class Shaker : MonoBehaviour 
{ 
    public enum sType { Sin, Cos, SinCos, CosSin, Perlin };
    public sType ShakeType = sType.Perlin; 
    
    [Header("Master Control")] 
    public bool enableEditorShake = true;
    public bool enableShake = false; 
    [Range(0f, 1f)] public float intensity = 0f; 
    [Range(0f, 1f)] public float blend2Init = 0f; // 0 = full shake, 1 = full initial

    [Header("Position Shake Settings")] 
    public bool PositionShake = true; 
    public Vector3 posFrequency = new Vector3(1f, 1f, 1f); // noise hızları
    public Vector3 posAmplitude = new Vector3(0.1f, 0.1f, 0.1f);
    public Vector3 posMin; // başlangıçtan minimum
    public Vector3 posMax; // başlangıçtan maximum

    [Header("Rotation Shake Settings")] 
    public bool RotationShake = true; 
    public Vector3 rotFrequency = new Vector3(1f, 1f, 1f); 
    public Vector3 rotAmplitude = new Vector3(2f, 2f, 2f);
    public Vector3 rotMin;
    public Vector3 rotMax;

    Vector3 animPos; 
    Quaternion animRot; 

    [SerializeField, HideInInspector] private Vector3 initialLocalPos; 
    [SerializeField, HideInInspector] private Quaternion initialLocalRot; 

    Vector3 posOffset = Vector3.zero; 
    Vector3 rotOffset = Vector3.zero; 

    public void CaptureInitial() 
    {
        initialLocalPos = transform.localPosition;
        initialLocalRot = transform.localRotation;
        posMin = initialLocalPos - posAmplitude;
        posMax = initialLocalPos + posAmplitude;
        rotMin = initialLocalRot.eulerAngles - rotAmplitude;
        rotMax = initialLocalRot.eulerAngles + rotAmplitude;
    }

    private void Awake()
    {
        if(enableShake) ResetShake();
    }

    void LateUpdate()
    {
        if (!enableShake || intensity <= 0f) return;

        #if UNITY_EDITOR
        if (!Application.isPlaying && !enableEditorShake) return;
#endif

        // Animasyon / timeline pozisyonunu al
        //animPos = transform.localPosition;
        //animRot = transform.localRotation;
        animPos = initialLocalPos;
        animRot = initialLocalRot;

        float t = Time.time;

        // Shake offset hesapla
        switch (ShakeType)
        {
            case sType.Sin:
                posOffset = new Vector3(
                    Mathf.Sin(t * posFrequency.x),
                    Mathf.Sin(t * posFrequency.y),
                    Mathf.Sin(t * posFrequency.z)
                );
                rotOffset = new Vector3(
                    Mathf.Sin(t * rotFrequency.x),
                    Mathf.Sin(t * rotFrequency.y),
                    Mathf.Sin(t * rotFrequency.z)
                );
                break;
            case sType.Cos:
                posOffset = new Vector3(
                    Mathf.Cos(t * posFrequency.x),
                    Mathf.Cos(t * posFrequency.y),
                    Mathf.Cos(t * posFrequency.z)
                );
                rotOffset = new Vector3(
                    Mathf.Cos(t * rotFrequency.x),
                    Mathf.Cos(t * rotFrequency.y),
                    Mathf.Cos(t * rotFrequency.z)
                );
                break;
            case sType.SinCos:
                posOffset = new Vector3(
                    Mathf.Sin(t * posFrequency.x),
                    Mathf.Sin(t * posFrequency.y),
                    Mathf.Sin(t * posFrequency.z)
                );
                rotOffset = new Vector3(
                    Mathf.Cos(t * rotFrequency.x),
                    Mathf.Cos(t * rotFrequency.y),
                    Mathf.Cos(t * rotFrequency.z)
                );
                break;
            case sType.CosSin:
                posOffset = new Vector3(
                    Mathf.Cos(t * posFrequency.x),
                    Mathf.Cos(t * posFrequency.y),
                    Mathf.Cos(t * posFrequency.z)
                );
                rotOffset = new Vector3(
                    Mathf.Sin(t * rotFrequency.x),
                    Mathf.Sin(t * rotFrequency.y),
                    Mathf.Sin(t * rotFrequency.z)
                );
                break;
            case sType.Perlin:
                posOffset = new Vector3(
                    (Mathf.PerlinNoise(t * posFrequency.x, 10f) - 0.5f) * 2f,
                    (Mathf.PerlinNoise(t * posFrequency.y, 20f) - 0.5f) * 2f,
                    (Mathf.PerlinNoise(t * posFrequency.z, 30f) - 0.5f) * 2f
                );
                rotOffset = new Vector3(
                    (Mathf.PerlinNoise(t * rotFrequency.x, 40f) - 0.5f) * 2f,
                    (Mathf.PerlinNoise(t * rotFrequency.y, 50f) - 0.5f) * 2f,
                    (Mathf.PerlinNoise(t * rotFrequency.z, 60f) - 0.5f) * 2f
                );
                break;
        }

        // Apply amplitude and intensity
        posOffset = Vector3.Scale(posOffset, posAmplitude) * intensity;
        rotOffset = Vector3.Scale(rotOffset, rotAmplitude) * intensity;

        // Add delta to the animation value, apply the ±amplitude limit
        Vector3 finalPos = animPos; 
        if (PositionShake) 
        {
            posOffset.x = Mathf.Clamp(posOffset.x, -posAmplitude.x * intensity, posAmplitude.x * intensity);
            posOffset.y = Mathf.Clamp(posOffset.y, -posAmplitude.y * intensity, posAmplitude.y * intensity);
            posOffset.z = Mathf.Clamp(posOffset.z, -posAmplitude.z * intensity, posAmplitude.z * intensity);

            Vector3 shakeDelta = posOffset;

            // Final pozisyon = animPos + delta
            finalPos = animPos + shakeDelta;

            // Blend to initial
            transform.localPosition = Vector3.Lerp(finalPos, animPos, blend2Init);
        }
        else
        {
            transform.localPosition = animPos;
        }

        if (RotationShake)
        {
            // Clamp rotOffset ±amplitude
            rotOffset.x = Mathf.Clamp(rotOffset.x, -rotAmplitude.x, rotAmplitude.x);
            rotOffset.y = Mathf.Clamp(rotOffset.y, -rotAmplitude.y, rotAmplitude.y);
            rotOffset.z = Mathf.Clamp(rotOffset.z, -rotAmplitude.z, rotAmplitude.z);

            Quaternion deltaQuat = Quaternion.Euler(rotOffset);
            Quaternion targetQuat = animRot * deltaQuat;

            // Blend to initial
            transform.localRotation = Quaternion.Slerp(targetQuat, animRot, blend2Init);
        }
        else
        {
            transform.localRotation = animRot;
        }
    }

    /// <summary> 
    /// Resets the object completely to its initial position/rotation. 
    /// </summary> 
    public void ResetShake() 
    {
        transform.localPosition = initialLocalPos; 
        transform.localRotation = initialLocalRot; 
    }

    // Getters for the editor
    public Vector3 GetInitialPos() => initialLocalPos; 
    public Vector3 GetInitialRot() => initialLocalRot.eulerAngles; 
}
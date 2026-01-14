// BUDU Games 2024 - 2025
using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

[System.Serializable]
public class MotionData
{
    public bool enabled = true;
    public bool speedEnabled = true;
    public float speed = 1f;
    public MotionType motionType = MotionType.Sine;
    public AnimationCurve customCurve = AnimationCurve.EaseInOut(0f, 0f, 1f, 1f);
    public float amplitude = 1f;
    [Range(0.01f, 10f)]
    public float frequency = 1f;
    [Range(-6.28f, 6.28f)]
    public float phaseOffset = 0f;
    [Range(-10f, 10f)]
    public float timeOffset = 0f; // Saniye cinsinden gecikme
    [Range(-1f, 1f)]
    public float centerOffset = 0f; // Hareket merkezini kaydırma (-1,1 arası)
}

public enum MotionType
{
    Sine,
    Cosine,
    Tangent,
    Linear,
    CustomCurve
}

[ExecuteAlways]
public class MotionControl : MonoBehaviour
{
    private bool reseted = false;

    [Header("Master Toggles")]
    public bool positionEnabled = true;
    public bool rotationEnabled = true;
    public bool scaleEnabled = true;

    [Header("Position")]
    public MotionData positionX = new MotionData();
    public MotionData positionY = new MotionData();
    public MotionData positionZ = new MotionData();

    [Header("Rotation")]
    public MotionData rotationX = new MotionData();
    public MotionData rotationY = new MotionData();
    public MotionData rotationZ = new MotionData();

    [Header("Scale")]
    public MotionData scaleX = new MotionData();
    public MotionData scaleY = new MotionData();
    public MotionData scaleZ = new MotionData();
    public bool uniformScale = true;

    [Header("Editor Settings")]
    public bool updateInEditor = true;
    [Range(0f, 5f)]
    public float editorTimeScale = 1f;

    private Vector3 initialPosition;
    private Vector3 initialRotation;
    private Vector3 initialScale;

    private void OnEnable()
    {
        StoreInitialValues();
#if UNITY_EDITOR
        EditorApplication.update += EditorUpdate;
#endif
    }

    private void OnDisable()
    {
#if UNITY_EDITOR
        EditorApplication.update -= EditorUpdate;
#endif
    }

    private void Start()
    {
        StoreInitialValues();
    }

    private void Update()
    {
        if (Application.isPlaying)
        {
            UpdateMotion(Time.time);
        }
    }

#if UNITY_EDITOR
    private void EditorUpdate()
    {
        if (!Application.isPlaying && updateInEditor)
        {
            reseted = false;
            UpdateMotion((float)EditorApplication.timeSinceStartup * editorTimeScale);
        }
        else
        {
            if(!reseted)
            {
                ResetToInitial();
            }
        }
    }
#endif

    private void StoreInitialValues()
    {
        initialPosition = transform.localPosition;
        initialRotation = transform.localEulerAngles;
        initialScale = transform.localScale;
    }

    private void UpdateMotion(float time)
    {
        Vector3 newPosition = initialPosition;
        Vector3 newRotation = initialRotation;
        Vector3 newScale = initialScale;

        if (positionEnabled)
        {
            if (positionX.enabled) newPosition.x = initialPosition.x + GetMotionValue(positionX, time);
            if (positionY.enabled) newPosition.y = initialPosition.y + GetMotionValue(positionY, time);
            if (positionZ.enabled) newPosition.z = initialPosition.z + GetMotionValue(positionZ, time);
        }

        if (rotationEnabled)
        {
            if (rotationX.enabled) newRotation.x = initialRotation.x + GetMotionValue(rotationX, time);
            if (rotationY.enabled) newRotation.y = initialRotation.y + GetMotionValue(rotationY, time);
            if (rotationZ.enabled) newRotation.z = initialRotation.z + GetMotionValue(rotationZ, time);
        }

        if (scaleEnabled)
        {
            if (uniformScale)
            {
                if (scaleX.enabled || scaleY.enabled || scaleZ.enabled)
                {
                    float scaleValue = GetMotionValue(scaleX.enabled ? scaleX : scaleY.enabled ? scaleY : scaleZ, time);
                    newScale = initialScale * (1f + scaleValue);
                }
            }
            else
            {
                if (scaleX.enabled) newScale.x = initialScale.x * (1f + GetMotionValue(scaleX, time));
                if (scaleY.enabled) newScale.y = initialScale.y * (1f + GetMotionValue(scaleY, time));
                if (scaleZ.enabled) newScale.z = initialScale.z * (1f + GetMotionValue(scaleZ, time));
            }
        }

        transform.localPosition = newPosition;
        transform.localEulerAngles = newRotation;
        transform.localScale = newScale;
    }

    private float GetMotionValue(MotionData data, float time)
    {
        if (!data.enabled || !data.speedEnabled) return 0f;

        float t = (time - data.timeOffset) * data.speed;
        float baseValue = 0f;

        switch (data.motionType)
        {
            case MotionType.Sine:
                baseValue = Mathf.Sin(t * data.frequency + data.phaseOffset);
                break;
            case MotionType.Cosine:
                baseValue = Mathf.Cos(t * data.frequency + data.phaseOffset);
                break;
            case MotionType.Tangent:
                baseValue = Mathf.Tan(t * data.frequency + data.phaseOffset);
                break;
            case MotionType.Linear:
                baseValue = (t * data.frequency + data.phaseOffset) % 1f * 2f - 1f; // -1 to 1
                break;
            case MotionType.CustomCurve:
                baseValue = data.customCurve.Evaluate((t * data.frequency + data.phaseOffset) % 1f) * 2f - 1f; // -1 to 1
                break;
        }

        // Center offset ile hareket aralığını kaydır
        // Örn: base -1..1 ise, centerOffset 0.3 ise -> -0.7..1.3
        return (baseValue * data.amplitude) + (data.amplitude * data.centerOffset);
    }

    public void ResetToInitial()
    {
        transform.localPosition = initialPosition;
        transform.localEulerAngles = initialRotation;
        transform.localScale = initialScale;
        reseted = true;
    }

    public void StoreCurrentAsInitial()
    {
        initialPosition = transform.localPosition;
        initialRotation = transform.localEulerAngles;
        initialScale = transform.localScale;
    }
}
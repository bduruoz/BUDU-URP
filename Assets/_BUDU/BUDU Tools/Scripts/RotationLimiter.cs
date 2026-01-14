// BUDU Games 2024 - 2025
using UnityEngine;

public class RotationLimiterReliable : MonoBehaviour
{
    [Header("Limits (relative to start rotation)")]
    public bool limitX = true;
    public float minX = -45f;
    public float maxX = 45f;

    public bool limitY = true;
    public float minY = -105f;
    public float maxY = 105f;

    public bool limitZ = false;
    public float minZ = -30f;
    public float maxZ = 30f;

    // Eğer debug istersen true yap
    public bool debugPrint = false;

    Vector3 baseEuler; // başlangıç (local) euler açıları, -180..180 aralığında

    void Start()
    {
        baseEuler = NormalizeAngles(transform.localEulerAngles);
    }

    void LateUpdate()
    {
        Vector3 cur = NormalizeAngles(transform.localEulerAngles);
        Vector3 result = cur;

        if (limitX) result.x = ClampRelative(baseEuler.x, cur.x, minX, maxX);
        if (limitY) result.y = ClampRelative(baseEuler.y, cur.y, minY, maxY);
        if (limitZ) result.z = ClampRelative(baseEuler.z, cur.z, minZ, maxZ);

        transform.localEulerAngles = To360(result);
    }

    Vector3 NormalizeAngles(Vector3 a)
    {
        a.x = NormalizeAngle(a.x);
        a.y = NormalizeAngle(a.y);
        a.z = NormalizeAngle(a.z);
        return a;
    }

    float NormalizeAngle(float angle)
    {
        angle %= 360f;
        if (angle > 180f) angle -= 360f;
        return angle;
    }

    float ClampRelative(float baseA, float curA, float minRel, float maxRel)
    {
        // cur-base arası (signed, -180..180)
        float rel = Mathf.DeltaAngle(baseA, curA);
        float clampedRel = Mathf.Clamp(rel, minRel, maxRel);
        float newAngle = baseA + clampedRel;

        if (debugPrint)
            Debug.Log($"{name} axis base:{baseA} cur:{curA} rel:{rel} clamped:{clampedRel} -> new:{newAngle}");

        return newAngle;
    }

    // Vector3 içindeki açıları 0..360 aralığına çevir
    Vector3 To360(Vector3 v)
    {
        v.x = To360(v.x);
        v.y = To360(v.y);
        v.z = To360(v.z);
        return v;
    }

    float To360(float a)
    {
        a %= 360f;
        if (a < 0) a += 360f;
        return a;
    }
}

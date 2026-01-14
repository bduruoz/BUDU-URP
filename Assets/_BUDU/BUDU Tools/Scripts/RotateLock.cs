// BUDU Games 2024 - 2025
using UnityEngine;

[ExecuteInEditMode]
public class RotateLock : MonoBehaviour
{
    [System.Flags]
    public enum Axis
    {
        None = 0,
        X = 1,
        Y = 2,
        Z = 4
    }

    public Axis allowedAxes = Axis.X | Axis.Y | Axis.Z;

    private Quaternion initialRotation;

    void Awake()
    {
        initialRotation = transform.localRotation;
    }

    void LateUpdate()
    {
        Vector3 currentEuler = transform.localEulerAngles;
        Vector3 initialEuler = initialRotation.eulerAngles;

        if ((allowedAxes & Axis.X) == 0)
            currentEuler.x = initialEuler.x;

        if ((allowedAxes & Axis.Y) == 0)
            currentEuler.y = initialEuler.y;

        if ((allowedAxes & Axis.Z) == 0)
            currentEuler.z = initialEuler.z;

        transform.localRotation = Quaternion.Euler(currentEuler);
    }
}

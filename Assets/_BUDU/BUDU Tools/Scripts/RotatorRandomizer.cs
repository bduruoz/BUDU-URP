// BUDU Games 2024 - 2025
using UnityEngine;

public class RotatorRandomizer : MonoBehaviour
{
    [Header("Select Axis")]
    public bool randomizeX = false;
    public bool randomizeY = false;
    public bool randomizeZ = true;

    [Header("Angle Ranges")]
    public Vector2 xAngleRange = new Vector2(-360f, 360f);
    public Vector2 yAngleRange = new Vector2(-360f, 360f);
    public Vector2 zAngleRange = new Vector2(-360f, 360f);

    void Start()
    {
        RandRotator();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            RandRotator();
        }
    }

    void RandRotator()
    {
        Vector3 currentRotation = transform.eulerAngles;

        if (randomizeX)
            currentRotation.x = Random.Range(xAngleRange.x, xAngleRange.y);

        if (randomizeY)
            currentRotation.y = Random.Range(yAngleRange.x, yAngleRange.y);

        if (randomizeZ)
            currentRotation.z = Random.Range(zAngleRange.x, zAngleRange.y);

        transform.eulerAngles = currentRotation;
    }
}

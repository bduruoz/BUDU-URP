using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BGrassBakeSettings", menuName = "BUDU/BGrassBakeSettings")]
public class BGrassBakeSettings : ScriptableObject
{
    public Mesh sourceMesh;
    public int sourceSubMeshIndex;
    public Vector3 scale;
    public Vector3 rotation;
    public Vector3 randomOffset;
    public int numGrassSegments;
    public float curvature;
    public float maxBendAngle;
    public float height;
    public float heightVariance;
    public float width;
    public float widthVariance;
}

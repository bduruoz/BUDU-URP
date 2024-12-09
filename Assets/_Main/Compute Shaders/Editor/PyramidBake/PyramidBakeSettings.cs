using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "PyramidBakeSettings", menuName = "BUDU/PyramidBakeSettings")]
public class PyramidBakeSettings : ScriptableObject
{
    [Tooltip("The source mesh to build off of")]
    public Mesh sourceMesh;
    public int sourceSubMeshIndex;
    public Vector3 scale;
    public Vector3 rotation;
    public float pyramidHeight;
}

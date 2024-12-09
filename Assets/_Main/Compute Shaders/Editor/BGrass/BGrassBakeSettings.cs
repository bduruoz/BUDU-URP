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
    public float height;
    public float width;
}

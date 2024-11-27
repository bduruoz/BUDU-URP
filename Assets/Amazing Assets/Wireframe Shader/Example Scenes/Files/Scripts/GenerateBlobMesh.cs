// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.WireframeShader.Examples
{
    [DefaultExecutionOrder(1)]
    public class GenerateBlobMesh : MonoBehaviour
    {
        MCBlob mcBlob;
        MeshFilter meshFilter;


        void Start()
        {
            meshFilter = GetComponent<MeshFilter>();

            mcBlob = new MCBlob(meshFilter);
        }

        void Update()
        {
            mcBlob.Update();

            meshFilter.sharedMesh = mcBlob.finalMesh;           
        }
    }
}
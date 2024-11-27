// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.IO;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.TextureCreator
{
    internal class BatchObject
    {
        public Mesh mesh;
        public string parent;

        public bool hasUV0;
        public bool hasBakedWireframe;  //uv4

        public string exception;

        public string savePath;
        public bool hasOverwrittenConflict;

        public BatchObject(Mesh mesh)
        {
            this.mesh = mesh;

            parent = AssetDatabase.GetAssetPath(mesh);

            hasUV0 = (mesh.uv != null && mesh.uv.Length == mesh.vertexCount);
            hasBakedWireframe = (mesh.uv4 != null && mesh.uv4.Length == mesh.vertexCount);

            UpdateSavePath();
            hasOverwrittenConflict = false;
        }

        public void UpdateSavePath()
        {
            string assetName = EditorWindow.active.editorSettings.GetSaveAssetName(mesh, true);
            string assetSaveDirectory = EditorWindow.active.editorSettings.GetAssetSaveDirectory(mesh, true, true);

            savePath = Path.Combine(assetSaveDirectory, assetName);
        }
    }
}
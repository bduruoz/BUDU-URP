// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.IO;
using System.Linq;
using System.Collections.Generic;

using UnityEngine;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{
    internal class BatchObject
    {
        public class Enum
        {
            public enum OptionsState { Same, Different, Mixed }
        }


        public GameObject gameObject;
        public bool isExpanded;

        public string savePath;
        public bool hasOverwrittenConflict;
        public string exception;
        public GameObject cloneGameObject;

        public List<BatchObjectMeshInfo> meshInfo;

        public Enum.OptionsState isMeshAssetFormat;
        public string submeshCount;
        public string vertexCountOriginal;
        public string vertexCountWireframe;

        public int wireframeMeshIndexFormat;
        public UnityEngine.Rendering.IndexFormat combinedMeshesIndexFormat;


        public BatchObject(UnityEngine.Object unityObject, bool expand)
        {
            gameObject = (GameObject)unityObject;
            this.isExpanded = expand;

            UpdateSavePath();
            hasOverwrittenConflict = false;
            exception = string.Empty;
            cloneGameObject = null;

            meshInfo = new List<BatchObjectMeshInfo>();
            {
                MeshFilter[] meshFilters = gameObject.GetComponentsInChildren<MeshFilter>(true);
                if (meshFilters != null && meshFilters.Length > 0)
                {
                    for (int i = 0; i < meshFilters.Length; i++)
                    {
                        if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                        {
                            meshInfo.Add(new BatchObjectMeshInfo(meshFilters[i], null, meshFilters[i].gameObject.GetComponent<Renderer>()));
                        }
                    }
                }

                SkinnedMeshRenderer[] skinnedMeshRenderer = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>(true);
                if (skinnedMeshRenderer != null && skinnedMeshRenderer.Length > 0)
                {
                    for (int i = 0; i < skinnedMeshRenderer.Length; i++)
                    {
                        if (skinnedMeshRenderer[i] != null && skinnedMeshRenderer[i].sharedMesh != null)
                        {
                            meshInfo.Add(new BatchObjectMeshInfo(null, skinnedMeshRenderer[i], skinnedMeshRenderer[i]));
                        }
                    }
                }
            }


            if (meshInfo.Count > 0)
            {
                isMeshAssetFormat = Enum.OptionsState.Mixed;
                if (meshInfo.All(c => c.isMeshAssetFormat)) isMeshAssetFormat = Enum.OptionsState.Same;
                else if (meshInfo.All(c => c.isMeshAssetFormat == false)) isMeshAssetFormat = Enum.OptionsState.Different;


                int submeshCountMin = meshInfo.Min(c => c.mesh.subMeshCount);
                int submeshCountMax = meshInfo.Max(c => c.mesh.subMeshCount);
                submeshCount = submeshCountMin == submeshCountMax ? submeshCountMin.ToString() : string.Format("{0} - {1}", submeshCountMin, submeshCountMax);


                int verticesSum = meshInfo.Sum(c => c.mesh.vertexCount);
                int trianglesSum = meshInfo.Sum(c => c.mesh.triangles.Length);
                vertexCountOriginal = string.Format("{0} / {1}", verticesSum.ToString("N0"), (trianglesSum / 3).ToString("N0"));


                int increasePercent = (int)(((float)trianglesSum - verticesSum) / verticesSum * 100);
                vertexCountWireframe = trianglesSum.ToString("N0") + (increasePercent == 0 ? string.Empty : $" (+{increasePercent}%)");


                wireframeMeshIndexFormat = -1;
                if (meshInfo.All(c => c.wireframeMeshIndexFormat == UnityEngine.Rendering.IndexFormat.UInt16)) wireframeMeshIndexFormat = (int)UnityEngine.Rendering.IndexFormat.UInt16;
                else if (meshInfo.All(c => c.wireframeMeshIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32)) wireframeMeshIndexFormat = (int)UnityEngine.Rendering.IndexFormat.UInt32;

                combinedMeshesIndexFormat = UnityEngine.Rendering.IndexFormat.UInt16;
                if (meshInfo.Any(c => c.wireframeMeshIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32 || meshInfo.Sum(s => s.mesh.triangles.Length) >= Constants.Mesh16BitsVertexCountLimit))
                    combinedMeshesIndexFormat = UnityEngine.Rendering.IndexFormat.UInt32;                             
            }            
        }

        public void UpdateSavePath()
        {
            string assetName = EditorWindow.active.editorSettings.GetSaveAssetName(gameObject, true);
            string assetSaveDirectory = EditorWindow.active.editorSettings.GetAssetSaveDirectory(gameObject, true, true);

            savePath = Path.Combine(assetSaveDirectory, assetName);
        }
    }

    internal class BatchObjectMeshInfo
    {
        public MeshFilter meshFilter;
        public SkinnedMeshRenderer skinnedMeshRenderer;

        public Mesh mesh;
        public bool isMeshAssetFormat;

        public string vertexCountOriginal;
        public string vertexCountWireframe;
        public UnityEngine.Rendering.IndexFormat wireframeMeshIndexFormat;
        


        public BatchObjectMeshInfo(MeshFilter meshFilter, SkinnedMeshRenderer skinnedMeshRenderer, Renderer renderer)
        {
            this.meshFilter = meshFilter;
            this.skinnedMeshRenderer = skinnedMeshRenderer;

            if (meshFilter != null)
                mesh = meshFilter.sharedMesh;
            else
                mesh = skinnedMeshRenderer.sharedMesh;

            isMeshAssetFormat = Path.GetExtension(UnityEditor.AssetDatabase.GetAssetPath(mesh)).Contains(".asset");

            vertexCountOriginal = string.Format("{0} / {1}", mesh.vertexCount.ToString("N0"), (mesh.triangles.Length / 3).ToString("N0"));

            int increasePercent = (int)(((float)mesh.triangles.Length - mesh.vertexCount) / mesh.vertexCount * 100);
            vertexCountWireframe = mesh.triangles.Length.ToString("N0") + string.Format("  ({0}{1}%)", (increasePercent == 0 ? string.Empty : "+"), increasePercent);

            wireframeMeshIndexFormat = mesh.triangles.Length >= Constants.Mesh16BitsVertexCountLimit ? UnityEngine.Rendering.IndexFormat.UInt32 : UnityEngine.Rendering.IndexFormat.UInt16;            
        }
    }
}
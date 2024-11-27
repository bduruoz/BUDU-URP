// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.Collections.Generic;

using UnityEngine;


namespace AmazingAssets.WireframeShader
{
    static public class Extensions
    {
        static public Mesh GenerateWireframeMesh(this Mesh sourceMesh, bool normalizeEdges, bool tryQuad)
        {
            if (sourceMesh == null)
            {
                Utilities.Log(LogType.Error, "Can not generte wireframe from empty mesh.", null);
                return null;
            }

            if (sourceMesh.isReadable == false)
            {
                Utilities.Log(LogType.Error, "Can not generate wireframe for '" + sourceMesh + "' mesh. Not allowed to access triangles/indices (isReadable is false; Read/Write must be enabled in import settings).", null, sourceMesh);
                return null;
            }

            if (sourceMesh.vertexCount < 3 || sourceMesh.triangles.Length < 3)
            {
                Utilities.Log(LogType.Error, "Can not generate wireframe for '" + sourceMesh + "' mesh. Triangle/Vertice indices are incorrect.", null, sourceMesh);
                return null;
            }

            if (SystemInfo.supports32bitsIndexBuffer == false && sourceMesh.triangles.Length > (Constants.Mesh16BitsVertexCountLimit / 3))
            {
                Utilities.Log(LogType.Error, $"Can not generate wireframe for '{sourceMesh}' mesh. Vertex count would be more then {Constants.Mesh16BitsVertexCountLimit} and target device does not support 32bit index buffer.", null, sourceMesh);
                return null;
            }



            bool hasUV0 = sourceMesh.uv != null && sourceMesh.uv.Length == sourceMesh.vertexCount;
            bool hasUV2 = sourceMesh.uv2 != null && sourceMesh.uv2.Length == sourceMesh.vertexCount;
            bool hasUV3 = sourceMesh.uv3 != null && sourceMesh.uv3.Length == sourceMesh.vertexCount;
            //bool hasUV4 = always true. Here is saved triangle mass data
            bool hasUV5 = sourceMesh.uv5 != null && sourceMesh.uv5.Length == sourceMesh.vertexCount;
            bool hasUV6 = sourceMesh.uv6 != null && sourceMesh.uv6.Length == sourceMesh.vertexCount;
            bool hasUV7 = sourceMesh.uv7 != null && sourceMesh.uv7.Length == sourceMesh.vertexCount;
            bool hasUV8 = sourceMesh.uv8 != null && sourceMesh.uv8.Length == sourceMesh.vertexCount;

            bool hasNormal = sourceMesh.normals != null && sourceMesh.normals.Length == sourceMesh.vertexCount;
            bool hasTangent = sourceMesh.tangents != null && sourceMesh.tangents.Length == sourceMesh.vertexCount;
            bool hasColor = sourceMesh.colors != null && sourceMesh.colors.Length == sourceMesh.vertexCount;
            bool hasSkin = sourceMesh.boneWeights != null && sourceMesh.boneWeights.Length == sourceMesh.vertexCount;
            bool hasBlendShapes = sourceMesh.blendShapeCount > 0;



            Vector3[] mVertices = sourceMesh.vertices;

            List<Vector4> mUV0 = new List<Vector4>(); if (hasUV0) sourceMesh.GetUVs(0, mUV0);
            List<Vector4> mUV2 = new List<Vector4>(); if (hasUV2) sourceMesh.GetUVs(1, mUV2);
            List<Vector4> mUV3 = new List<Vector4>(); if (hasUV3) sourceMesh.GetUVs(2, mUV3);
            List<Vector4> mUV4 = new List<Vector4>(); sourceMesh.GetUVs(3, mUV4);
            if (mUV4 == null || mUV4.Count != sourceMesh.vertexCount)
            {
                mUV4 = new List<Vector4>(sourceMesh.vertexCount);
                for (int i = 0; i < sourceMesh.vertexCount; i++)
                    mUV4.Add(Vector4.zero);
            }
            List<Vector4> mUV5 = new List<Vector4>(); if (hasUV5) sourceMesh.GetUVs(4, mUV5);
            List<Vector4> mUV6 = new List<Vector4>(); if (hasUV6) sourceMesh.GetUVs(5, mUV6);
            List<Vector4> mUV7 = new List<Vector4>(); if (hasUV7) sourceMesh.GetUVs(6, mUV7);
            List<Vector4> mUV8 = new List<Vector4>(); if (hasUV8) sourceMesh.GetUVs(7, mUV8);

            Vector3[] mNormals = hasNormal ? sourceMesh.normals : null;
            Vector4[] mTangents = hasTangent ? sourceMesh.tangents : null;
            Color[] mColors = hasColor ? sourceMesh.colors : null;
            BoneWeight[] mBoneWeights = hasSkin ? sourceMesh.boneWeights : null;
            Matrix4x4[] mBinedPoses = hasSkin ? sourceMesh.bindposes : null;



            Mesh newMesh = new Mesh();
            newMesh.name = sourceMesh.name;

            newMesh.indexFormat = (sourceMesh.triangles.Length > (Constants.Mesh16BitsVertexCountLimit / 3)) ? UnityEngine.Rendering.IndexFormat.UInt32 : UnityEngine.Rendering.IndexFormat.UInt16;

            int dataCount = sourceMesh.triangles.Length;


            Vector3[] newVertices = new Vector3[dataCount];
            List<int[]> newTriangles = new List<int[]>();

            Vector4[] newUV0 = new Vector4[hasUV0 ? dataCount : 0];
            Vector4[] newUV2 = new Vector4[hasUV2 ? dataCount : 0];
            Vector4[] newUV3 = new Vector4[hasUV3 ? dataCount : 0];
            Vector4[] newUV4 = new Vector4[dataCount];
            Vector4[] newUV5 = new Vector4[hasUV5 ? dataCount : 0];
            Vector4[] newUV6 = new Vector4[hasUV6 ? dataCount : 0];
            Vector4[] newUV7 = new Vector4[hasUV7 ? dataCount : 0];
            Vector4[] newUV8 = new Vector4[hasUV8 ? dataCount : 0];

            Vector3[] newNormals = new Vector3[hasNormal ? dataCount : 0];
            Vector4[] newTangents = new Vector4[hasTangent ? dataCount : 0];
            Color[] newColor = new Color[hasColor ? dataCount : 0];
            BoneWeight[] newBoneWeigths = new BoneWeight[hasSkin ? dataCount : 0];

            Dictionary<int, int> blensShapesIndexMap = hasBlendShapes ? new Dictionary<int, int>() : null;



            //Dublicate mesh
            int tIndex = 0;
            int dataIndex = -1;
            for (int i = 0; i < sourceMesh.subMeshCount; i++)
            {
                int vCount = sourceMesh.GetTriangles(i).Length;

                int[] newT = new int[vCount];

                int[] mT = sourceMesh.GetTriangles(i);


                for (int j = 0; j < vCount; j++)
                {
                    int index = mT[j];

                    //Vertices
                    newVertices[++dataIndex] = mVertices[index];

                    //Triangles
                    newT[j] = tIndex++;


                    //UV                        
                    if (hasUV0) newUV0[dataIndex] = mUV0[index];
                    if (hasUV2) newUV2[dataIndex] = mUV2[index];
                    if (hasUV3) newUV3[dataIndex] = mUV3[index];
                    //hasUV4 filled with wireframe data later
                    if (hasUV5) newUV5[dataIndex] = mUV5[index];
                    if (hasUV6) newUV6[dataIndex] = mUV6[index];
                    if (hasUV7) newUV7[dataIndex] = mUV7[index];
                    if (hasUV8) newUV8[dataIndex] = mUV8[index];

                    //Normals & tangnets
                    if (hasNormal)
                        newNormals[dataIndex] = mNormals[index];

                    if (hasTangent)
                        newTangents[dataIndex] = mTangents[index];

                    //Color
                    if (hasColor)
                        newColor[dataIndex] = mColors[index];

                    //Skinn
                    if (hasSkin)
                        newBoneWeigths[dataIndex] = mBoneWeights[index];

                    //Blendshape
                    if (hasBlendShapes) blensShapesIndexMap.Add(dataIndex, index);
                }

                newTriangles.Add(newT);
            }


            //Generate traingle mass
            for (int i = 0; i < newTriangles.Count; i++)
            {
                for (int j = 0; j < newTriangles[i].Length; j += 3)
                {
                    Vector4 uv1, uv2, uv3;
                    BakeTriangleMassToUV(newVertices[newTriangles[i][j]], newVertices[newTriangles[i][j + 1]], newVertices[newTriangles[i][j + 2]], normalizeEdges, tryQuad, out uv1, out uv2, out uv3);

                    newUV4[newTriangles[i][j]] = uv1;
                    newUV4[newTriangles[i][j + 1]] = uv2;
                    newUV4[newTriangles[i][j + 2]] = uv3;
                }
            }


            newMesh.vertices = newVertices;

            if (hasUV0) newMesh.SetUVs(0, new List<Vector4>(newUV0));
            if (hasUV2) newMesh.SetUVs(1, new List<Vector4>(newUV2));
            if (hasUV3) newMesh.SetUVs(2, new List<Vector4>(newUV3));
            newMesh.SetUVs(3, new List<Vector4>(newUV4));
            if (hasUV5) newMesh.SetUVs(4, new List<Vector4>(newUV5));
            if (hasUV6) newMesh.SetUVs(5, new List<Vector4>(newUV6));
            if (hasUV7) newMesh.SetUVs(6, new List<Vector4>(newUV7));
            if (hasUV8) newMesh.SetUVs(7, new List<Vector4>(newUV8));

            newMesh.normals = newNormals;
            newMesh.tangents = newTangents;
            newMesh.colors = newColor;

            if (hasSkin == true)
            {
                newMesh.boneWeights = newBoneWeigths;
                newMesh.bindposes = mBinedPoses;
            }

            if (hasBlendShapes)
            {
                var deltaVertices = new Vector3[sourceMesh.vertexCount];
                var deltaNormals = new Vector3[sourceMesh.vertexCount];
                var deltaTangents = new Vector3[sourceMesh.vertexCount];
                var newDeltaVertices = new Vector3[dataCount];
                var newDeltaNormals = new Vector3[dataCount];
                var newDeltaTangents = new Vector3[dataCount];
                for (int shapeIndex = 0; shapeIndex < sourceMesh.blendShapeCount; shapeIndex++)
                {
                    var shapeName = sourceMesh.GetBlendShapeName(shapeIndex);
                    var frameCount = sourceMesh.GetBlendShapeFrameCount(shapeIndex);

                    for (int frameIndex = 0; frameIndex < frameCount; frameIndex++)
                    {
                        var frameWeight = sourceMesh.GetBlendShapeFrameWeight(shapeIndex, frameIndex);
                        sourceMesh.GetBlendShapeFrameVertices(shapeIndex, frameIndex, deltaVertices, deltaNormals, deltaTangents);

                        for (int newIdx = 0; newIdx < dataCount; newIdx++)
                        {
                            int idx = blensShapesIndexMap[newIdx];
                            newDeltaVertices[newIdx] = deltaVertices[idx];
                            newDeltaNormals[newIdx] = deltaNormals[idx];
                            newDeltaTangents[newIdx] = deltaNormals[idx];
                        }

                        newMesh.AddBlendShapeFrame(shapeName, frameWeight, newDeltaVertices, newDeltaNormals, newDeltaTangents);
                    }
                }
            }


            newMesh.subMeshCount = newTriangles.Count;
            for (int i = 0; i < newTriangles.Count; i++)
                newMesh.SetTriangles(newTriangles[i], i);

            return newMesh;
        }
        static float DistanceToEdge(Vector3 a, Vector3 b, Vector3 c)
        {
            return Vector3.Magnitude(Vector3.Cross(a - b, a - c));
        }
        static void BakeTriangleMassToUV(Vector3 vertex1, Vector3 vertex2, Vector3 vertex3, bool normalizeEdges, bool tryQuad, out Vector4 uv1, out Vector4 uv2, out Vector4 uv3)
        {
            if (normalizeEdges)
            {
                float d1 = Vector3.Distance(vertex1, vertex2);
                float d2 = Vector3.Distance(vertex2, vertex3);
                float d3 = Vector3.Distance(vertex3, vertex1);

                Vector4 b = new Vector4(0, DistanceToEdge(vertex3, vertex1, vertex2) / d1, DistanceToEdge(vertex1, vertex2, vertex3) / d2, DistanceToEdge(vertex2, vertex1, vertex3) / d3);
                b /= Mathf.Min(b.y, b.z, b.w);


                uv1 = new Vector4(b.x, b.z, b.x, 0);
                uv2 = new Vector4(b.x, b.x, b.w, 0);
                uv3 = new Vector4(b.y, b.x, b.x, 0);

                if (tryQuad)
                {
                    uv1.x = ((d1 > d2) && (d1 > d3)) ? 10000 : 0;
                    uv1.z = ((d3 >= d1) && (d3 > d2)) ? 10000 : 0;
                    uv2.y = ((d2 >= d1) && (d2 >= d3)) ? 10000 : 0;
                }
            }
            else
            {
                if (tryQuad)
                {
                    float d1 = Vector3.Distance(vertex1, vertex2);
                    float d2 = Vector3.Distance(vertex2, vertex3);
                    float d3 = Vector3.Distance(vertex3, vertex1);

                    Vector4 offset = Vector4.zero;
                    if (d1 > d2 && d1 > d3)
                        offset.y = 1;
                    else if (d2 > d3 && d2 > d1)
                        offset.x = 1;
                    else
                        offset.z = 1;

                    uv1 = new Vector4(1, 0, 0, 0) + offset;
                    uv2 = new Vector4(0, 0, 1, 0) + offset;
                    uv3 = new Vector4(0, 1, 0, 0) + offset;
                }
                else
                {
                    uv1 = new Vector4(1, 0, 0, 0);
                    uv2 = new Vector4(0, 1, 0, 0);
                    uv3 = new Vector4(0, 0, 1, 0);
                }
            }

        }


        static public Texture2D GenerateWireframeTexture(this Mesh mesh, bool useGeometryShader, int submeshIndex, bool normalizeEdges, bool tryQuad, float thickness, float smoothness, int resolution)
        {
            #region Check
            if (mesh == null)
            {
                Utilities.Log(LogType.Error, "Mesh is null.", null);
                return null;
            }

            if (mesh.vertexCount < 3)
            {
                Utilities.Log(LogType.Error, "Mesh '" + mesh.name + "' has no vertices.", null, mesh);
                return null;
            }

            if(mesh.uv == null || mesh.uv.Length != mesh.vertexCount)
            {
                Utilities.Log(LogType.Error, "Mesh '" + mesh.name + "' has no UV0.", null, mesh);
                return null;
            }

            if (useGeometryShader == false && (mesh.uv4 == null || mesh.uv4.Length != mesh.vertexCount))
            {
                Utilities.Log(LogType.Error, "Mesh '" + mesh.name + "' has no baked wireframe.", null, mesh);
                return null;
            }

            Shader shader = Shader.Find(Constants.shaderTextureExporter);
            if (shader == null)
            {
                Utilities.Log(LogType.Error, "Shader '" + Constants.shaderTextureExporter + "' is missing.", null);
                return null;
            }

            if (submeshIndex >= mesh.subMeshCount)
            {
                Utilities.Log(LogType.Error, "Mesh '" + mesh.name + "' submesh count is less then requested index (" + submeshIndex + ")", null, mesh);
                return null;
            }
            #endregion


            if (submeshIndex < -1)
                submeshIndex = -1;

            resolution = Mathf.Clamp(Mathf.ClosestPowerOfTwo(resolution), 16, 8192);



            //Save
            RenderTexture saveRT = RenderTexture.active;


            RenderTexture renderTexture = RenderTexture.GetTemporary(resolution, resolution, 0, RenderTextureFormat.Default, RenderTextureReadWrite.Default, 4);
            renderTexture.wrapMode = TextureWrapMode.Clamp;

            RenderTexture.active = renderTexture;


            Material material = new Material(shader);
            if (useGeometryShader)
            {
                material.EnableKeyword("WIREFRAME_CALCULATE_USING_GEOMETRY_SHADER");

                if (normalizeEdges)
                    material.EnableKeyword("WIREFRAME_NORMALIZE_EDGES_ON");
                if (tryQuad)
                    material.EnableKeyword("WIREFRAME_TRY_QUAD_ON");
            }

            material.SetFloat("_WireframeShader_Thickness", Mathf.Clamp01(thickness));
            material.SetFloat("_WireframeShader_Smoothness", Mathf.Clamp01(smoothness));

            GL.Clear(false, true, Color.clear, 1.0f);


            //Render mesh RGB
            material.SetPass(0);
            Graphics.DrawMeshNow(mesh, Vector3.zero, Quaternion.identity, submeshIndex);



            //Create texture
            Texture2D texture = new Texture2D(resolution, resolution);
            texture.wrapMode = TextureWrapMode.Clamp;
            texture.name = mesh.name;


            //Read final
            texture.ReadPixels(new Rect(0, 0, resolution, resolution), 0, 0, true);
            texture.Apply(true);


            //Cleanup
            RenderTexture.ReleaseTemporary(renderTexture);

            GameObject.DestroyImmediate(material);


            if (Application.isEditor)
                RenderTexture.active = null;
            else
                RenderTexture.active = saveRT;

            return texture;
        }
    }
}
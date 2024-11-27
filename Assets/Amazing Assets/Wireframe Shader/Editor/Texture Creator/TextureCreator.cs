// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.TextureCreator
{
    internal static class TextureCreator
    {
        static List<BatchObject> listBatchObjects;
        static EditorSettings editorSettings;

        static int progressBarTotalCount;
        static int progressBarCurrentIndex;
        static bool progressBarCanceled;


        static public void Execute()
        {
            listBatchObjects = EditorWindow.active.listBatchObjects;
            editorSettings = EditorWindow.active.editorSettings;

            BatchObject currentBatchObject = null;


            progressBarTotalCount = editorSettings.combineSubmesh ? listBatchObjects.Sum(c => c.mesh.subMeshCount) : listBatchObjects.Count;
            progressBarCurrentIndex = 0;
            progressBarCanceled = false;


            //Delete temp directory
            EditorUtilities.DeleteTempDirectory();


            try
            {
                for (int i = 0; i < listBatchObjects.Count; i++)
                {
                    currentBatchObject = listBatchObjects[i];
                    ExecuteInLoop(i);

                    if (progressBarCanceled)
                        break;
                }
            }
            catch (Exception e)
            {
                if (currentBatchObject == null || currentBatchObject.mesh == null)
                    Utilities.Log(LogType.Error, "Encountered an unknown error.", null);
                else
                {
                    Utilities.Log(LogType.Error, string.Format("Encountered an error with mesh '{0}'.\n{1}", currentBatchObject.mesh, e.Message), null);

                    EditorWindow.active.problematicBatchObject = currentBatchObject;
                    EditorWindow.active.problematicBatchObject.exception = e.Message;
                }
            }


            UnityEditor.EditorUtility.UnloadUnusedAssetsImmediate();

            UnityEditor.EditorUtility.ClearProgressBar();

            AssetDatabase.Refresh();
        }

        static void ExecuteInLoop(int loopIndex)
        {
            if (listBatchObjects[loopIndex] == null ||
                listBatchObjects[loopIndex].mesh == null)
                return;


            string progressBarName = "Hold On" + (listBatchObjects.Count == 1 ? string.Empty : string.Format("[{0}/{1}]", loopIndex + 1, listBatchObjects.Count));


            Mesh currentMesh = listBatchObjects[loopIndex].mesh;



            string prefabName = editorSettings.GetSaveAssetName(currentMesh, true);
            string saveDirectory = editorSettings.GetAssetSaveDirectory(currentMesh, false, true);
            try
            {
                Directory.CreateDirectory(saveDirectory);
            }
            catch
            {
                Utilities.Log(LogType.Error, "Can not create directory at \"" + saveDirectory + "\". Try another save location.", null);
                return;
            }




            //Save list of all generated assets
            List<string> generatedAssetsPath = new List<string>();


            //Generate and save meshes
            EditorUtilities.MakeMeshReadable(currentMesh);

            int resolution = (int)Mathf.Pow(2, (int)editorSettings.saveFileResolution + 4);

            ExportTexture(currentMesh, resolution, saveDirectory, prefabName, ref generatedAssetsPath);


            //Select last saved file 
            if (generatedAssetsPath.Count == 0)
                EditorWindow.active.lastSavedFilePath = string.Empty;
            else
            {
                EditorWindow.active.lastSavedFilePath = generatedAssetsPath[generatedAssetsPath.Count - 1];

                GeneratedAssetsImporter.ReimportTextures(generatedAssetsPath.ToArray(), resolution);
            }
        }


        static void ExportTexture(Mesh mesh, int resolution, string saveDirectory, string prefabName, ref List<string> generatedAssetsPath)
        {
            if (editorSettings.combineSubmesh)
            {
                ++progressBarCurrentIndex;

                if (UnityEditor.EditorUtility.DisplayCancelableProgressBar("Hold On", mesh.name, (float)progressBarCurrentIndex / progressBarTotalCount))
                    progressBarCanceled = true;


                Texture2D texture = mesh.GenerateWireframeTexture(editorSettings.renderMode == EditorSettings.Enum.RenderMode.UseGeometryShader, -1, editorSettings.normalizeEdges, editorSettings.tryQuad, editorSettings.thickness, editorSettings.smoothness, resolution);

                SaveTexture(texture, editorSettings.saveFileFormat, saveDirectory, prefabName, ref generatedAssetsPath);


                if (progressBarCanceled)
                    return; 
            }
            else
            {
                for (int s = 0; s < mesh.subMeshCount; s++)
                {
                    ++progressBarCurrentIndex;

                    if (UnityEditor.EditorUtility.DisplayCancelableProgressBar("Hold On", mesh.name, (float)progressBarCurrentIndex / progressBarTotalCount))
                        progressBarCanceled = true;


                    Texture2D texture = mesh.GenerateWireframeTexture(editorSettings.renderMode == EditorSettings.Enum.RenderMode.UseGeometryShader, s, editorSettings.normalizeEdges, editorSettings.tryQuad, editorSettings.thickness, editorSettings.smoothness, resolution);

                    string submeshName = string.Empty;
                    if (mesh.subMeshCount > 1)
                        submeshName = " (" + s + ")";

                    SaveTexture(texture, editorSettings.saveFileFormat, saveDirectory, prefabName + submeshName, ref generatedAssetsPath);


                    if (progressBarCanceled)
                        return;
                }
            }

        }
        static void SaveTexture(Texture2D texture, EditorSettings.Enum.SaveFileFormat fileFormat, string saveDirectory, string fileName, ref List<string> generatedAssetsPath)
        {
            if (texture == null)
                return;


            byte[] bytes = null;


            switch (fileFormat)
            {
                case EditorSettings.Enum.SaveFileFormat.JPG: bytes = texture.EncodeToJPG(100); break;
                case EditorSettings.Enum.SaveFileFormat.PNG: bytes = texture.EncodeToPNG(); break;
                case EditorSettings.Enum.SaveFileFormat.TGA: bytes = texture.EncodeToTGA(); break;

                default:
                    break;
            }


            if (bytes != null)
            {
                string saveFileName = Path.Combine(saveDirectory, fileName + "." + fileFormat.ToString().ToLower());
                generatedAssetsPath.Add(saveFileName);

                File.WriteAllBytes(saveFileName, bytes);
            }


            GameObject.DestroyImmediate(texture);
        }
    }
}
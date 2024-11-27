// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{
    internal static class MeshCreator
    {
        static List<BatchObject> listBatchObjects;
        static EditorSettings editorSettings;

        static Material generatedMaterial;
        static int progressBarTotalCount;
        static int progressBarCurrentIndex;
        static bool progressBarCanceled;


        static public void Execute()
        {
            listBatchObjects = EditorWindow.active.listBatchObjects;
            editorSettings = EditorWindow.active.editorSettings;


            bool conversionFailed = false;
            BatchObject currentBatchObject = null;


            progressBarTotalCount = listBatchObjects.Sum(c => c.meshInfo.Count);
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
                conversionFailed = true;


                if (currentBatchObject == null || currentBatchObject.gameObject == null)
                    Utilities.Log(LogType.Error, "Encountered an unknown error.", null);
                else
                {
                    Utilities.Log(LogType.Error, string.Format("Encountered an error with object '{0}'.\n{1}", currentBatchObject.gameObject, e.Message), null);

                    EditorWindow.active.problematicBatchObject = currentBatchObject;
                    EditorWindow.active.problematicBatchObject.exception = e.Message;
                }
            }

            if (conversionFailed)
            {
                if (EditorWindow.active.problematicBatchObject.cloneGameObject != null)
                    GameObject.DestroyImmediate(EditorWindow.active.problematicBatchObject.cloneGameObject);

                if (Directory.Exists(AssetInfo.tempFolder))
                    Directory.Delete(AssetInfo.tempFolder, true);

                string metaFile = AssetInfo.tempFolder + ".meta";
                if (File.Exists(metaFile))
                    File.Delete(metaFile);

                AssetDatabase.Refresh(ImportAssetOptions.ForceUpdate);
            }
            else
            {
                //Copy files to custom location
                if (editorSettings.saveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder && Directory.Exists(AssetInfo.tempFolder))
                {
                    EditorWindow.active.lastSavedFilePath = EditorUtilities.CopyTempFolderToDestination(editorSettings.saveFolderCustomPath);

                    AssetDatabase.Refresh(ImportAssetOptions.ForceUpdate);
                }
            }


            UnityEditor.EditorUtility.UnloadUnusedAssetsImmediate();

            UnityEditor.EditorUtility.ClearProgressBar();
        }


        static void ExecuteInLoop(int loopIndex)
        {
            if (listBatchObjects[loopIndex] == null ||
                listBatchObjects[loopIndex].gameObject == null)
                return;


            string progressBarName = "Hold On" + (listBatchObjects.Count == 1 ? string.Empty : string.Format("[{0}/{1}]", loopIndex + 1, listBatchObjects.Count));


            GameObject currentBatchGameObject = listBatchObjects[loopIndex].gameObject;


            //Create clone and do all modification with it only
            GameObject cloneGameObject = GameObject.Instantiate(currentBatchGameObject);
            cloneGameObject.SetActive(true);



            //Remove all non.asset meshes
            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
            {
                MeshFilter[] meshFilters = cloneGameObject.GetComponentsInChildren<MeshFilter>();
                for (int i = 0; i < meshFilters.Length; i++)
                {
                    if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                    {
                        if (Path.GetExtension(AssetDatabase.GetAssetPath(meshFilters[i].sharedMesh)).Contains(".asset") == false)
                            meshFilters[i].sharedMesh = null;
                    }
                }

                //Remove similar meshes as they will be overwritten
                for (int i = 0; i < meshFilters.Length; i++)
                {
                    if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                    {
                        for (int j = i + 1; j < meshFilters.Length; j++)
                        {
                            if (meshFilters[j] != null && meshFilters[j].sharedMesh == meshFilters[i].sharedMesh)
                                meshFilters[j].sharedMesh = null;
                        }
                    }
                }



                SkinnedMeshRenderer[] skinnedMeshRenderers = cloneGameObject.GetComponentsInChildren<SkinnedMeshRenderer>();
                for (int i = 0; i < skinnedMeshRenderers.Length; i++)
                {
                    if (skinnedMeshRenderers[i] != null && skinnedMeshRenderers[i].sharedMesh != null)
                    {
                        if (Path.GetExtension(AssetDatabase.GetAssetPath(skinnedMeshRenderers[i].sharedMesh)).Contains(".asset") == false)
                            skinnedMeshRenderers[i].sharedMesh = null;
                    }
                }

                //Remove similar meshes as they will be overwritten
                for (int i = 0; i < skinnedMeshRenderers.Length; i++)
                {
                    if (skinnedMeshRenderers[i] != null && skinnedMeshRenderers[i].sharedMesh != null)
                    {
                        for (int j = i + 1; j < skinnedMeshRenderers.Length; j++)
                        {
                            if (skinnedMeshRenderers[j] != null && skinnedMeshRenderers[j].sharedMesh == skinnedMeshRenderers[i].sharedMesh)
                                skinnedMeshRenderers[j].sharedMesh = null;
                        }
                    }
                }


                int finalMeshCount = meshFilters.Count(c => c != null && c.sharedMesh != null) + skinnedMeshRenderers.Count(c => c != null && c.sharedMesh != null);
                if (finalMeshCount == 0)
                {
                    GameObject.DestroyImmediate(cloneGameObject);

                    Utilities.Log(LogType.Error, "'" + listBatchObjects[loopIndex].gameObject.name + "' has no mesh in .asset format to overwrite.", null, listBatchObjects[loopIndex].gameObject);
                    return;
                }
            }


            cloneGameObject.name = EditorUtilities.RemoveInvalidCharacters(cloneGameObject.name);


            //Save reference to the clone and in the case of conversion fail we can Destroy it
            listBatchObjects[loopIndex].cloneGameObject = cloneGameObject;




            string prefabName = string.Empty;
            string saveDirectory = string.Empty;
            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab || editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly)
            {
                prefabName = editorSettings.GetSaveAssetName(currentBatchGameObject, true);
                saveDirectory = editorSettings.GetAssetSaveDirectory(currentBatchGameObject, true, true);

                try
                {
                    Directory.CreateDirectory(saveDirectory);
                }
                catch
                {
                    Utilities.Log(LogType.Error, "Can not create directory at \"" + saveDirectory + "\". Try another save location.", null);
                    return;
                }
            }


            cloneGameObject.name = prefabName;

            if (currentBatchGameObject.transform.parent != null)
            {
                cloneGameObject.transform.position = currentBatchGameObject.transform.position;
                cloneGameObject.transform.rotation = currentBatchGameObject.transform.rotation;
                cloneGameObject.transform.localScale = currentBatchGameObject.transform.lossyScale;
            }


            //Save list of all generated assets
            List<string> generatedAssetsPath = new List<string>();


            //Generate and save meshes
            if (RunMeshCoverter(cloneGameObject, saveDirectory, prefabName, ref generatedAssetsPath) == false)
            {
                if (cloneGameObject != null)
                    GameObject.DestroyImmediate(cloneGameObject);

                if (generatedMaterial != null)
                    GameObject.DestroyImmediate(generatedMaterial);

                return;
            }

            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly ||
                editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
            {
                AssetDatabase.Refresh(ImportAssetOptions.ForceUpdate);

                //Cleanup
                GameObject.DestroyImmediate(cloneGameObject);
            }
            else
            {

                //Save generated material and update renderer if nessesary
                SaveAssetMaterial(ref cloneGameObject, generatedMaterial, saveDirectory, prefabName, ref generatedAssetsPath);


                //Create cuplicate materials
                if(editorSettings.meshCombine != EditorSettings.Enum.MeshCombine.FullHierarchy && 
                   editorSettings.materialType == EditorSettings.Enum.MaterialType.CreateDuplicates)
                {
                    Dictionary<int, Material> dictionaryMaterials = new Dictionary<int, Material>();

                    //We nead renderers only from Mesh and Skin
                    List<Renderer> renderers = new List<Renderer>();
                    foreach (MeshFilter item in cloneGameObject.GetComponentsInChildren<MeshFilter>())
                    {
                        Renderer renderer = item.GetComponent<Renderer>();
                        if (renderer != null)
                            renderers.Add(renderer);
                    }
                    foreach (SkinnedMeshRenderer item in cloneGameObject.GetComponentsInChildren<SkinnedMeshRenderer>())
                    {
                        Renderer renderer = item.GetComponent<Renderer>();
                        if (renderer != null)
                            renderers.Add(renderer);
                    }



                    for (int i = 0; i < renderers.Count; i++)
                    {
                        if(renderers[i] != null && renderers[i].sharedMaterials != null && renderers[i].sharedMaterials.Length > 0)
                        {
                            Material[] sharedMaterials = new Material[renderers[i].sharedMaterials.Length];
                            for (int m = 0; m < renderers[i].sharedMaterials.Length; m++)
                            {
                                if (renderers[i].sharedMaterials[m] != null)
                                {
                                    int instanceID = renderers[i].sharedMaterials[m].GetInstanceID();

                                    if (dictionaryMaterials.ContainsKey(instanceID))
                                    {
                                        sharedMaterials[m] = dictionaryMaterials[instanceID];
                                    }
                                    else
                                    {
                                        sharedMaterials[m] = new Material(editorSettings.defaultShader);
                                        sharedMaterials[m].name = renderers[i].sharedMaterials[m].name + " (" + renderers[i].sharedMaterials[m].GetInstanceID() +  ")";

                                        dictionaryMaterials.Add(instanceID, sharedMaterials[m]);

                                        sharedMaterials[m].CopyPropertiesFromMaterial(renderers[i].sharedMaterials[m]);
                                    }                                    
                                }
                            }

                            renderers[i].sharedMaterials = sharedMaterials;
                        }                        
                    }

                    foreach (KeyValuePair<int, Material> item in dictionaryMaterials)
                    {
                        string assetName = editorSettings.AddPrefixAndSuffix(item.Value.name);

                        SaveAssetMaterial(ref cloneGameObject, item.Value, saveDirectory, assetName, ref generatedAssetsPath); 
                    }

                }


                //Remove missing scripts
                EditorUtilities.RemoveMissingScripts(cloneGameObject);


                //Save prefab
                GameObject prefab = SaveAssetMainPrefab(cloneGameObject, saveDirectory, prefabName, ref generatedAssetsPath);


                //If source object is not part of current scene, destroy it
                if (currentBatchGameObject.gameObject.scene != UnityEngine.SceneManagement.SceneManager.GetActiveScene() ||
                    (editorSettings.saveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder && EditorUtilities.IsPathProjectRelative(editorSettings.saveFolderCustomPath) == false) ||
                    WireframeMeshConversionDetailsEditor.FindPrefabReferencesInScene(prefab) > 1)
                {
                    GameObject.DestroyImmediate(cloneGameObject);
                }



                AssetDatabase.Refresh(ImportAssetOptions.ForceUpdate);



                if (editorSettings.saveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder &&
                    EditorUtilities.IsPathProjectRelative(editorSettings.saveFolderCustomPath) == false)
                {
                    UnityEditor.EditorUtility.UnloadUnusedAssetsImmediate();
                }
            }


            //Select last saved file 
            if (generatedAssetsPath.Count == 0)
                EditorWindow.active.lastSavedFilePath = string.Empty;
            else
                EditorWindow.active.lastSavedFilePath = generatedAssetsPath[generatedAssetsPath.Count - 1];
        }
        static bool RunMeshCoverter(GameObject gameObject, string saveDirectory, string prefabName, ref List<string> generatedAssetsPath)
        {
            EditorUtilities.MakeMeshesReadable(gameObject);


            generatedMaterial = null;

            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab)
            {
                switch (editorSettings.meshCombine)
                {
                    case EditorSettings.Enum.MeshCombine.Nothing:
                        {
                            if (editorSettings.materialType == EditorSettings.Enum.MaterialType.CreateNew)
                                generatedMaterial = new Material(editorSettings.defaultShader);
                        }
                        break;
                    case EditorSettings.Enum.MeshCombine.Submeshes:
                        {
                            if (editorSettings.materialType == EditorSettings.Enum.MaterialType.CreateNew)
                                generatedMaterial = new Material(editorSettings.defaultShader);
                        }
                        break;

                    case EditorSettings.Enum.MeshCombine.FullHierarchy:
                        generatedMaterial = new Material(editorSettings.defaultShader);
                        break;

                    default:
                        break;
                }
            }

            bool mergeSubmeshes = editorSettings.meshCombine != EditorSettings.Enum.MeshCombine.Nothing;


            Dictionary<Mesh, Mesh> generatedMeshes = GenerateMainMeshes(gameObject, mergeSubmeshes);
            if (generatedMeshes == null || generatedMeshes.Count == 0 || generatedMeshes.All(c => c.Value == null))
                return false;


            MeshFilter[] meshFilters = gameObject.GetComponentsInChildren<MeshFilter>();
            SkinnedMeshRenderer[] skinnedMeshrenderers = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>(true);
            if ((editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab || editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly) &&
                editorSettings.meshCombine == EditorSettings.Enum.MeshCombine.FullHierarchy && skinnedMeshrenderers != null && skinnedMeshrenderers.Length > 0)
            {
                Utilities.Log(LogType.Warning, "GameObject '" + gameObject + "' contains SkinnedMeshRenderer components that can not be combined.", null);
            }


            if ((editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab || editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly) &&
                editorSettings.meshCombine == EditorSettings.Enum.MeshCombine.FullHierarchy && (skinnedMeshrenderers == null || skinnedMeshrenderers.Length == 0))
            {
                List<Mesh> combinedMeshes = CombineGameObjects(gameObject, generatedMaterial, prefabName, (UnityEngine.Rendering.IndexFormat)editorSettings.combineMeshIndexFormat);

                if (combinedMeshes != null && combinedMeshes.Count > 0)
                {
                    //After saving mesh assets we may loose connection to them.
                    //We need to re-assign saved mesh.
                    Dictionary<Mesh, List<MeshFilter>> directoryMeshFilter = new Dictionary<Mesh, List<MeshFilter>>();
                    Dictionary<Mesh, List<SkinnedMeshRenderer>> directorySkinnedMeshRenderer = new Dictionary<Mesh, List<SkinnedMeshRenderer>>();
                    if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab)
                    {
                        meshFilters = gameObject.GetComponentsInChildren<MeshFilter>();
                        skinnedMeshrenderers = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>(true);

                        for (int i = 0; i < meshFilters.Length; i++)
                        {
                            if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                            {
                                if (directoryMeshFilter.ContainsKey(meshFilters[i].sharedMesh))
                                    directoryMeshFilter[meshFilters[i].sharedMesh].Add(meshFilters[i]);
                                else
                                    directoryMeshFilter.Add(meshFilters[i].sharedMesh, new List<MeshFilter>() { meshFilters[i] });
                            }
                        }

                        for (int i = 0; i < skinnedMeshrenderers.Length; i++)
                        {
                            if (skinnedMeshrenderers[i] != null && skinnedMeshrenderers[i].sharedMesh != null)
                                if (directorySkinnedMeshRenderer.ContainsKey(skinnedMeshrenderers[i].sharedMesh))
                                    directorySkinnedMeshRenderer[skinnedMeshrenderers[i].sharedMesh].Add(skinnedMeshrenderers[i]);
                                else
                                    directorySkinnedMeshRenderer.Add(skinnedMeshrenderers[i].sharedMesh, new List<SkinnedMeshRenderer>() { skinnedMeshrenderers[i] });
                        }
                    }


                    //Save meshes
                    for (int i = 0; i < combinedMeshes.Count; i++)
                    {
                        string assetSavePath = Path.Combine(saveDirectory, combinedMeshes[i].name + ".asset");

                        generatedAssetsPath.Add(assetSavePath);


                        Mesh savedMesh = SaveAssetMesh(combinedMeshes[i], assetSavePath);

                        //Re-assign saved mesh
                        if (savedMesh != null)
                        {
                            if (directoryMeshFilter.ContainsKey(combinedMeshes[i]))
                            {
                                foreach (MeshFilter item in directoryMeshFilter[combinedMeshes[i]])
                                {
                                    item.sharedMesh = savedMesh;
                                }
                            }

                            if (directorySkinnedMeshRenderer.ContainsKey(combinedMeshes[i]))
                            {
                                foreach (SkinnedMeshRenderer item in directorySkinnedMeshRenderer[combinedMeshes[i]])
                                {
                                    item.sharedMesh = savedMesh;
                                }
                            }
                        }
                    }


                    //Clear
                    foreach (KeyValuePair<Mesh, Mesh> item in generatedMeshes)
                    {
                        if (item.Value != null)
                        {
                            item.Value.Clear(false);

                            GameObject.DestroyImmediate(item.Value);
                        }
                    }

                    generatedMeshes.Clear();


                    //Replace Mesh Colliders
                    if (editorSettings.replaceMeshColliders)
                    {
                        for (int i = 0; i < meshFilters.Length; i++)
                        {
                            if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                            {
                                meshFilters[i].gameObject.AddComponent<MeshCollider>().sharedMesh = meshFilters[i].sharedMesh;
                            }
                        }
                    }
                }
                else
                {
                    Utilities.Log(LogType.Error, "Can not combine meshes.", null, gameObject);

                    return false;
                }
            }
            else
            {
                //Make sure all names are unique
                if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab ||
                    editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly)
                {
                    foreach (KeyValuePair<Mesh, Mesh> item in generatedMeshes)
                    {
                        if (item.Value != null)
                        {
                            string meshName = item.Value.name;

                            Mesh[] meshesWithSimilarNames = generatedMeshes.Where(c => c.Value != null && c.Value.name == meshName).Select(x => x.Value).ToArray();
                            if (meshesWithSimilarNames != null && meshesWithSimilarNames.Length > 1)
                            {
                                for (int m = 0; m < meshesWithSimilarNames.Length; m++)
                                {
                                    meshesWithSimilarNames[m].name += " (" + meshesWithSimilarNames[m].GetInstanceID() + ")";
                                }
                            }
                        }
                    }
                }


                //After saving mesh assets we may loose connection to them.
                //We need to re-assign saved meshes.
                Dictionary<Mesh, List<MeshFilter>> directoryMeshFilter = new Dictionary<Mesh, List<MeshFilter>>();
                Dictionary<Mesh, List<SkinnedMeshRenderer>> directorySkinnedMeshRenderer = new Dictionary<Mesh, List<SkinnedMeshRenderer>>();
                if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab)
                {
                    meshFilters = gameObject.GetComponentsInChildren<MeshFilter>();
                    skinnedMeshrenderers = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>(true);

                    for (int i = 0; i < meshFilters.Length; i++)
                    {
                        if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                        {
                            if (directoryMeshFilter.ContainsKey(meshFilters[i].sharedMesh))
                                directoryMeshFilter[meshFilters[i].sharedMesh].Add(meshFilters[i]);
                            else
                                directoryMeshFilter.Add(meshFilters[i].sharedMesh, new List<MeshFilter>() { meshFilters[i] });
                        }
                    }

                    for (int i = 0; i < skinnedMeshrenderers.Length; i++)
                    {
                        if (skinnedMeshrenderers[i] != null && skinnedMeshrenderers[i].sharedMesh != null)
                            if (directorySkinnedMeshRenderer.ContainsKey(skinnedMeshrenderers[i].sharedMesh))
                                directorySkinnedMeshRenderer[skinnedMeshrenderers[i].sharedMesh].Add(skinnedMeshrenderers[i]);
                            else
                                directorySkinnedMeshRenderer.Add(skinnedMeshrenderers[i].sharedMesh, new List<SkinnedMeshRenderer>() { skinnedMeshrenderers[i] });
                    }
                }


                //Save meshes
                foreach (KeyValuePair<Mesh, Mesh> item in generatedMeshes)
                {
                    if (item.Value != null)
                    {
                        string assetSavePath;
                        if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                            assetSavePath = AssetDatabase.GetAssetPath(item.Key);
                        else
                            assetSavePath = Path.Combine(saveDirectory, prefabName + " " + item.Value.name + ".asset");


                        generatedAssetsPath.Add(assetSavePath);

                        Mesh savedMesh = SaveAssetMesh(item.Value, assetSavePath);

                        //Re-assign saved mesh
                        if (savedMesh != null)
                        {
                            if (directoryMeshFilter.ContainsKey(item.Value))
                            {
                                foreach (MeshFilter mItem in directoryMeshFilter[item.Value])
                                {
                                    mItem.sharedMesh = savedMesh;
                                }
                            }

                            if (directorySkinnedMeshRenderer.ContainsKey(item.Value))
                            {
                                foreach (SkinnedMeshRenderer sItem in directorySkinnedMeshRenderer[item.Value])
                                {
                                    sItem.sharedMesh = savedMesh;
                                }
                            }
                        }
                    }
                }


                //Replace mesh colliders 
                if (editorSettings.replaceMeshColliders)
                {
                    MeshCollider[] meshColliders = gameObject.GetComponentsInChildren<MeshCollider>();
                    for (int i = 0; i < meshColliders.Length; i++)
                    {
                        if (meshColliders[i] != null && meshColliders[i].sharedMesh != null)
                        {
                            MeshFilter meshFilter = meshColliders[i].GetComponent<MeshFilter>();
                            if (meshFilter != null && meshFilter.sharedMesh != null)
                                meshColliders[i].sharedMesh = meshFilter.sharedMesh;
                        }
                    }
                }
            }


            return true;
        }


        static void SaveAssetMaterial(ref GameObject gameObject, Material material, string saveDirectory, string prefabName, ref List<string> generatedAssetsPath)
        {
            if (material != null)
            {
                string assetSavePath = Path.Combine(saveDirectory, prefabName + ".mat");

                generatedAssetsPath.Add(assetSavePath);


                if (File.Exists(assetSavePath))
                {
                    //We need to update all renderers to use this 'oldMaterial'
                    Dictionary<Renderer, List<int>> dictionryRenderers = new Dictionary<Renderer, List<int>>();
                    foreach (Renderer renderer in gameObject.GetComponentsInChildren<Renderer>())
                    {
                        if (renderer != null && renderer.sharedMaterials != null && renderer.sharedMaterials.Length > 0)
                        {
                            for (int m = 0; m < renderer.sharedMaterials.Length; m++)
                            {
                                if(renderer.sharedMaterials[m] == material)
                                {
                                    if (dictionryRenderers.ContainsKey(renderer) == false)
                                        dictionryRenderers.Add(renderer, new List<int>());

                                    dictionryRenderers[renderer].Add(m);
                                }
                            }
                        }
                    }


                    //Rewrite
                    Material oldMaterial = (Material)AssetDatabase.LoadAssetAtPath(assetSavePath, typeof(Material));

                    if (oldMaterial.shader != editorSettings.defaultShader)
                    {
                        oldMaterial.shader = editorSettings.defaultShader;
                    }

                    oldMaterial.CopyPropertiesFromMaterial(material);

                    UnityEditor.EditorUtility.SetDirty(material);
                    UnityEditor.AssetDatabase.SaveAssets();


                    //Update renderers
                    foreach (KeyValuePair<Renderer, List<int>> item in dictionryRenderers)
                    {
                        Material[] sharedMaterials = item.Key.sharedMaterials;

                        for (int i = 0; i < item.Value.Count; i++)
                        {
                            sharedMaterials[item.Value[i]] = oldMaterial;
                        }

                        item.Key.sharedMaterials = sharedMaterials;
                    }
                }
                else
                {
                    AssetDatabase.CreateAsset(material, assetSavePath);
                }
            }
        }
        static GameObject SaveAssetMainPrefab(GameObject gameObject, string saveDirectory, string prefabName, ref List<string> generatedAssetsPath)
        {
            string prefabPath = Path.Combine(saveDirectory, prefabName + ".prefab");
            generatedAssetsPath.Add(prefabPath);


            //Flags
            if (editorSettings.useStaticFlags)
            {
                if (editorSettings.useStaticFlagsForHierarchy)
                {
                    foreach (Transform transform in gameObject.GetComponentsInChildren<Transform>(true))
                    {
                        GameObjectUtility.SetStaticEditorFlags(transform.gameObject, editorSettings.staticEditorFlags);
                    }
                }
                else
                {
                    GameObjectUtility.SetStaticEditorFlags(gameObject, editorSettings.staticEditorFlags);
                }
            }
            if (editorSettings.useTag)
            {
                if (editorSettings.useTagForHierarchy)
                {
                    foreach (Transform transform in gameObject.GetComponentsInChildren<Transform>(true))
                    {
                        transform.gameObject.tag = editorSettings.tag;
                    }
                }
                else
                {
                    gameObject.tag = editorSettings.tag;
                }
            }
            if (editorSettings.useLayer)
            {
                if (editorSettings.useLayerForHierarchy)
                {
                    foreach (Transform transform in gameObject.GetComponentsInChildren<Transform>(true))
                    {
                        transform.gameObject.layer = editorSettings.layer;
                    }
                }
                else
                {
                    gameObject.layer = editorSettings.layer;
                }
            }


            GameObject prefab = PrefabUtility.SaveAsPrefabAssetAndConnect(gameObject, prefabPath, InteractionMode.AutomatedAction);


            WireframeShader.WireframeShaderPrefab wireframeShaderPrefab = prefab.AddComponent<WireframeShader.WireframeShaderPrefab>();
            wireframeShaderPrefab.prefabProjectPath = AssetDatabase.GetAssetPath(prefab);
            PrefabUtility.SavePrefabAsset(prefab);


            return prefab;
        }
        static Mesh SaveAssetMesh(Mesh mesh, string assetSavePath)
        {
            if (mesh != null)
            {
                //Make sure name is correct
                mesh.name = Path.GetFileNameWithoutExtension(assetSavePath);

                if (editorSettings.useMeshOptimizeDefaultFlags == false)
                {
                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV0) != MeshComponentsPopup.Flags.None))
                        mesh.uv = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV1) != MeshComponentsPopup.Flags.None))
                        mesh.uv2 = null;
                    
                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV2) != MeshComponentsPopup.Flags.None))
                        mesh.uv3 = null;

                    //Wireframe data is saved inside here
                    //if (!((editorSettings.meshOptimizeFlags & MeshOptimizePopup.Flags.UV3) != MeshOptimizePopup.Flags.None))
                    //    mesh.uv4 = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV4) != MeshComponentsPopup.Flags.None))
                        mesh.uv5 = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV5) != MeshComponentsPopup.Flags.None))
                        mesh.uv6 = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV6) != MeshComponentsPopup.Flags.None))
                        mesh.uv7 = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.UV7) != MeshComponentsPopup.Flags.None))
                        mesh.uv8 = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.Color) != MeshComponentsPopup.Flags.None))
                        mesh.colors = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.Normal) != MeshComponentsPopup.Flags.None))
                        mesh.normals = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.Tangent) != MeshComponentsPopup.Flags.None))
                        mesh.tangents = null;

                    if (!((editorSettings.meshOptimizeFlags & MeshComponentsPopup.Flags.Skin) != MeshComponentsPopup.Flags.None))
                    {
                        mesh.bindposes = null;
                        mesh.boneWeights = null;
                        mesh.ClearBlendShapes();
                    }
                }


                //Compress
                if (editorSettings.meshCompression != ModelImporterMeshCompression.Off)
                    MeshUtility.SetMeshCompression(mesh, editorSettings.meshCompression);


                //Save
                if (File.Exists(assetSavePath))
                {
                    //Rewrite
                    Mesh oldMesh = (Mesh)AssetDatabase.LoadAssetAtPath(assetSavePath, typeof(Mesh));


                    oldMesh.Clear(false);
                    oldMesh.vertices = null;
                    oldMesh.triangles = null;
                    oldMesh.tangents = null;
                    oldMesh.normals = null;
                    oldMesh.vertices = null;
                    oldMesh.bindposes = null;
                    oldMesh.boneWeights = null;

                    UnityEditor.EditorUtility.CopySerialized(mesh, oldMesh);
                    UnityEditor.EditorUtility.SetDirty(oldMesh);
                    UnityEditor.AssetDatabase.SaveAssets();

                    return oldMesh;
                }
                else
                {
                    AssetDatabase.CreateAsset(mesh, assetSavePath);
                }
            }


            return null;
        }


        static internal List<Mesh> CombineGameObjects(GameObject parentGameObject, Material material, string meshName, UnityEngine.Rendering.IndexFormat indexFormat)
        {
            if (parentGameObject == null)
            {
                Utilities.Log(LogType.Warning, "Can not combine empty objects", null);
                return null;
            }

            MeshFilter[] meshFilters = parentGameObject.GetComponentsInChildren<MeshFilter>();
            if (meshFilters == null || meshFilters.Length == 0)
            {
                Utilities.Log(LogType.Warning, "Can not combine empty objects", null);
                return null;
            }


            //Destroy LOD Groups
            DestroyLODGroupRenderers(parentGameObject);

            //Read new meshFilters 
            meshFilters = parentGameObject.GetComponentsInChildren<MeshFilter>();


            if (indexFormat == UnityEngine.Rendering.IndexFormat.UInt32)
            {
                if (SystemInfo.supports32bitsIndexBuffer == false)
                {
                    Utilities.Log(LogType.Warning, "Can not combine mesh objects with 32bits index buffer. System does not support it.", null, parentGameObject);
                    return null;
                }
            }
            else
            {
                for (int m = 0; m < meshFilters.Length; m++)
                {
                    if (meshFilters[m].sharedMesh != null && meshFilters[m].sharedMesh.vertexCount >= Constants.Mesh16BitsVertexCountLimit)
                    {
                        if (SystemInfo.supports32bitsIndexBuffer)
                        {
                            Utilities.Log(LogType.Warning, "Combined mesh will use 32bits index buffer.", null, parentGameObject);
                            indexFormat = UnityEngine.Rendering.IndexFormat.UInt32;

                            break;
                        }
                        else
                        {
                            Utilities.Log(LogType.Warning, "Can not combine mesh objects with 32bits index buffer. System does not support it.", null, parentGameObject);
                            return null;
                        }
                    }
                }
            }


            //Save parent transform
            Vector3 savePosition = parentGameObject.transform.position;
            Quaternion saveRotation = parentGameObject.transform.rotation;
            Vector3 saveScale = parentGameObject.transform.localScale;

            parentGameObject.transform.position = Vector3.zero;
            parentGameObject.transform.rotation = Quaternion.identity;
            parentGameObject.transform.localScale = Vector3.one;



            if (parentGameObject.GetComponentsInChildren<SkinnedMeshRenderer>().Length > 0)
            {
                Utilities.Log(LogType.Warning, "GameObject '" + parentGameObject + "' contains SkinnedMeshRenderer components. Mesh combiner may produce incorrect results.", null);
                return null;
            }



            List<CombineInstance> listCombines = new List<CombineInstance>();

            List<Mesh> generatedMeshes = new List<Mesh>();


            int combineCounter = 1;
            int index = 0;
            int vertexCounter = 0;
            while (index < meshFilters.Length)
            {
                if (meshFilters[index] != null && meshFilters[index].sharedMesh != null)
                {
                    if (indexFormat == UnityEngine.Rendering.IndexFormat.UInt16 && vertexCounter + meshFilters[index].sharedMesh.vertexCount >= Constants.Mesh16BitsVertexCountLimit)
                    {
                        string nameSuffix = string.Format(" [Part {0}]", combineCounter);

                        generatedMeshes.Add(CombineGameObjects(listCombines, material, meshName + nameSuffix, indexFormat));

                        listCombines.Clear();
                        vertexCounter = 0;
                        combineCounter += 1;
                    }




                    CombineInstance combine = new CombineInstance();
                    combine.mesh = meshFilters[index].sharedMesh;
                    combine.transform = meshFilters[index].transform.localToWorldMatrix;

                    listCombines.Add(combine);

                    vertexCounter += meshFilters[index].sharedMesh.vertexCount;
                }

                index += 1;
            }


            //Generate last left mesh
            if (listCombines.Count != 0)
            {
                string nameSuffix = combineCounter == 1 ? string.Empty : string.Format(" [Part {0}]", combineCounter);

                generatedMeshes.Add(CombineGameObjects(listCombines, material, meshName + nameSuffix, indexFormat));
            }

            listCombines.Clear();



            //Destroy all childs
            while (parentGameObject.transform.childCount > 0)
            {
                GameObject.DestroyImmediate(parentGameObject.transform.GetChild(0).gameObject);
            }

            //Destroy all render components
            meshFilters = parentGameObject.GetComponentsInChildren<MeshFilter>();
            for (int i = 0; i < meshFilters.Length; i++)
            {
                GameObject.DestroyImmediate(meshFilters[i]);
            }

            Renderer[] renderers = parentGameObject.GetComponentsInChildren<Renderer>();
            for (int i = 0; i < renderers.Length; i++)
            {
                GameObject.DestroyImmediate(renderers[i]);
            }

            //Destroy colliders
            Collider[] colliders = parentGameObject.GetComponentsInChildren<Collider>();
            for (int i = 0; i < colliders.Length; i++)
            {
                GameObject.DestroyImmediate(colliders[i]);
            }



            if (generatedMeshes.Count == 1)
            {
                parentGameObject.AddComponent<MeshFilter>().sharedMesh = generatedMeshes[0];
                parentGameObject.AddComponent<MeshRenderer>().sharedMaterials = new Material[] { material };
            }
            else
            {
                for (int i = 0; i < generatedMeshes.Count; i++)
                {
                    GameObject gameObject = new GameObject(generatedMeshes[i].name);
                    gameObject.transform.parent = parentGameObject.transform;

                    gameObject.AddComponent<MeshFilter>().sharedMesh = generatedMeshes[i];
                    gameObject.AddComponent<MeshRenderer>().sharedMaterials = new Material[] { material };
                }

            }


            //Restore transform
            parentGameObject.transform.position = savePosition;
            parentGameObject.transform.rotation = saveRotation;
            parentGameObject.transform.localScale = saveScale;


            return generatedMeshes;
        }
        static Mesh CombineGameObjects(List<CombineInstance> listCombines, Material material, string meshName, UnityEngine.Rendering.IndexFormat indexFormat)
        {
            Mesh newMesh = new Mesh();
            newMesh.indexFormat = indexFormat;
            newMesh.CombineMeshes(listCombines.ToArray(), true, true);
            newMesh.name = meshName;

            return newMesh;
        }
        static void DestroyLODGroupRenderers(GameObject parent)
        {
            LODGroup[] lodGroup = parent.GetComponentsInChildren<LODGroup>();
            for (int i = 0; i < lodGroup.Length; i++)
            {
                if (lodGroup[i] != null)
                {
                    LOD[] lods = lodGroup[i].GetLODs();

                    if (lods != null && lods.Length > 1)
                    {
                        for (int j = 1; j < lods.Length; j++)   // Check LODs compared to LOD[0]
                        {
                            if (lods[j].renderers != null && lods[j].renderers.Length > 0)
                            {
                                for (int k = 0; k < lods[j].renderers.Length; k++)
                                {
                                    Renderer currentRenderer = lods[j].renderers[k];

                                    //If current renderer is not part of LOD[0] - destroy it
                                    if (currentRenderer != null && lods[0].renderers != null && lods[0].renderers.Contains(currentRenderer) == false)
                                    {
                                        GameObject.DestroyImmediate(currentRenderer.GetComponent<MeshFilter>());

                                        GameObject.DestroyImmediate(currentRenderer);
                                    }
                                }
                            }
                        }
                    }
                }


                GameObject.DestroyImmediate(lodGroup[i]);
            }
        }


        static bool CallBackConversionyProgress(string name, float value)
        {
            if (progressBarTotalCount > 1)
                progressBarCanceled = UnityEditor.EditorUtility.DisplayCancelableProgressBar("Hold On", string.Format("[{0} / {1}] {2}", progressBarCurrentIndex, progressBarTotalCount, name), value);
            else
                progressBarCanceled = UnityEditor.EditorUtility.DisplayCancelableProgressBar("Hold On", name, value);


            return progressBarCanceled;
        }
        static Dictionary<Mesh, Mesh> GenerateMainMeshes(GameObject gameObject, bool mergeSubMeshes)
        {
            if (gameObject == null)
                return null;


            Dictionary<int, Mesh> dictionaryMeshByMaterialHash = new Dictionary<int, Mesh>(); //key = (mesh.GetinstanceID() + materials.ID).GetShashCode();
            Dictionary<Mesh, Mesh> dictionayMesh = new Dictionary<Mesh, Mesh>();


            //MeshFilters
            MeshFilter[] meshFilters = gameObject.GetComponentsInChildren<MeshFilter>(true);
            for (int i = 0; i < meshFilters.Length; i++)
            {
                if (meshFilters != null && meshFilters[i].sharedMesh != null)
                {
                    MeshRenderer renderer = meshFilters[i].gameObject.GetComponent<MeshRenderer>();

                    if (renderer != null && renderer.sharedMaterials != null && renderer.sharedMaterials.Length != 0 && renderer.sharedMaterials.All(c => c == null) == false)
                    {
                        Material[] materials = renderer.sharedMaterials;

                        int meshMaterialsHashCode = GenerateMeshMaterialsHashCode(meshFilters[i].sharedMesh, materials);


                        ++progressBarCurrentIndex;
                        CallBackConversionyProgress(meshFilters[i].sharedMesh.name, (float)progressBarCurrentIndex / progressBarTotalCount);

                        if (progressBarCanceled)
                            break;


                        Mesh newMesh = null;

                        if (dictionaryMeshByMaterialHash.ContainsKey(meshMaterialsHashCode) == false)
                        {
                            newMesh = meshFilters[i].sharedMesh.GenerateWireframeMesh(editorSettings.normalizeEdges, editorSettings.tryQuad);

                            //Merge submeshes
                            if (mergeSubMeshes)
                            {
                                newMesh.SetTriangles(newMesh.triangles, 0);
                                newMesh.subMeshCount = 1;
                            }


                            dictionaryMeshByMaterialHash.Add(meshMaterialsHashCode, newMesh);


                            //When overwritting mesh we need to track the source too
                            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                                dictionayMesh.Add(meshFilters[i].sharedMesh, newMesh);
                            else
                                dictionayMesh.Add(new Mesh(), newMesh); //Just use new mesh for the 'key' purpose only
                        }
                        else
                        {
                            newMesh = dictionaryMeshByMaterialHash[meshMaterialsHashCode];
                        }


                        //Set mesh
                        meshFilters[i].sharedMesh = newMesh;


                        //Set material
                        if (generatedMaterial != null)
                        {
                            Material[] newSharedMaterials = new Material[mergeSubMeshes ? 1 : renderer.sharedMaterials.Length];
                            for (int r = 0; r < newSharedMaterials.Length; r++)
                            {
                                newSharedMaterials[r] = generatedMaterial;
                            }

                            renderer.sharedMaterials = newSharedMaterials;
                        }
                        else if(mergeSubMeshes)
                        {
                            if (renderer.sharedMaterials != null && renderer.sharedMaterials.Length > 0)
                                renderer.sharedMaterials = new Material[] { renderer.sharedMaterials[0] };
                        }
                    }
                }
            }


            //SkinnedMeshes
            if (progressBarCanceled == false)
            {
                SkinnedMeshRenderer[] skinnedMeshRenderers = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>(true);
                for (int i = 0; i < skinnedMeshRenderers.Length; i++)
                {
                    if (skinnedMeshRenderers != null && skinnedMeshRenderers[i].sharedMesh != null)
                    {
                        Renderer renderer = skinnedMeshRenderers[i].gameObject.GetComponent<Renderer>();

                        if (renderer != null && renderer.sharedMaterials != null && renderer.sharedMaterials.Length != 0 && renderer.sharedMaterials.All(c => c == null) == false)
                        {
                            Material[] materials = renderer.sharedMaterials;

                            int meshMaterialsHashCode = GenerateMeshMaterialsHashCode(skinnedMeshRenderers[i].sharedMesh, materials);


                            ++progressBarCurrentIndex;
                            CallBackConversionyProgress(skinnedMeshRenderers[i].sharedMesh.name, (float)progressBarCurrentIndex / progressBarTotalCount);

                            if (progressBarCanceled)
                                break;


                            Mesh newMesh = null;

                            if (dictionaryMeshByMaterialHash.ContainsKey(meshMaterialsHashCode) == false)
                            {
                                newMesh = skinnedMeshRenderers[i].sharedMesh.GenerateWireframeMesh(editorSettings.normalizeEdges, editorSettings.tryQuad);

                                //Merge submeshes
                                if (mergeSubMeshes)
                                {
                                    newMesh.SetTriangles(newMesh.triangles, 0);
                                    newMesh.subMeshCount = 1;
                                }

                                dictionaryMeshByMaterialHash.Add(meshMaterialsHashCode, newMesh);



                                //When overwritting mesh we need to track the source too
                                if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                                    dictionayMesh.Add(skinnedMeshRenderers[i].sharedMesh, newMesh);
                                else
                                    dictionayMesh.Add(new Mesh(), newMesh); //Just use new mesh for the 'key' purpose only
                            }
                            else
                            {
                                newMesh = dictionaryMeshByMaterialHash[meshMaterialsHashCode];
                            }


                            //Set mesh
                            skinnedMeshRenderers[i].sharedMesh = newMesh;


                            //Set material
                            if (generatedMaterial != null)
                            {
                                Material[] newSharedMaterials = new Material[mergeSubMeshes ? 1 : renderer.sharedMaterials.Length];
                                for (int r = 0; r < newSharedMaterials.Length; r++)
                                {
                                    newSharedMaterials[r] = generatedMaterial;
                                }

                                renderer.sharedMaterials = newSharedMaterials;
                            }
                            else if (mergeSubMeshes)
                            {
                                if (renderer.sharedMaterials != null && renderer.sharedMaterials.Length > 0)
                                    renderer.sharedMaterials = new Material[] { renderer.sharedMaterials[0] };
                            }
                        }
                    }
                }
            }


            if (progressBarCanceled)
            {
                foreach (KeyValuePair<int, Mesh> item in dictionaryMeshByMaterialHash)
                {
                    item.Value.Clear(false);
                }

                dictionaryMeshByMaterialHash.Clear();
                dictionaryMeshByMaterialHash = null;
            }


            //Remove invalid characters from mesh name
            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.Prefab ||
                editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.MeshOnly)
            {
                foreach (KeyValuePair<int, Mesh> item in dictionaryMeshByMaterialHash)
                {
                    item.Value.name = EditorUtilities.RemoveInvalidCharacters(item.Value.name);
                }
            }


            return dictionayMesh.Count == 0 ? null : dictionayMesh;
        }
        static int GenerateMeshMaterialsHashCode(Mesh mesh, Material[] materials)
        {
            materials = materials.OrderBy(c => c == null ? 0 : c.GetInstanceID()).ToArray();

            string hashCode = mesh.GetInstanceID() + "_";
            for (int i = 0; i < materials.Length; i++)
            {
                hashCode += (materials[i] == null ? "null" : materials[i].GetInstanceID().ToString()) + "_";
            }

            return hashCode.GetHashCode();
        }
    }
}
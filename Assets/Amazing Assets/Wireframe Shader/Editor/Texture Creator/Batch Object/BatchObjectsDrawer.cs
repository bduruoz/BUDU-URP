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
    internal class BatchObjectsDrawer
    {
        enum SortBy { None, ObjectName, SubmeshCount, UV0, BakedWireframe }


        static Vector2 scrollBatchObjects;
        static SortBy sortBy = SortBy.None;
        static bool sortByAscending = true;    


        internal static void Draw()
        {
            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;


            Rect rectObjectData = new Rect();
            Rect rectSubmeshCount = new Rect();
            Rect rectUV0 = new Rect();
            Rect rectBakedWireframe = new Rect();

            Rect rectRefresh = new Rect();

             
            int singleLineHeight = 20;            
            int renderObjectsCount = listBatchObjects.Count + 1;

            Rect toolbarRect;
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox, GUILayout.MaxHeight(renderObjectsCount * singleLineHeight + 12)))
            {
                toolbarRect = EditorGUILayout.GetControlRect(false, singleLineHeight);

                scrollBatchObjects = EditorGUILayout.BeginScrollView(scrollBatchObjects);
                {
                    for (int i = 0; i < listBatchObjects.Count; i++)
                    {
                        BatchObject currentBatchObject = listBatchObjects[i];


                        //Rect for current raw
                        Rect currentRowRect = EditorGUILayout.GetControlRect();


                        if (i == 0)
                            SplitControlRect(currentRowRect, out rectObjectData, out rectSubmeshCount, out rectUV0, out rectBakedWireframe, out rectRefresh);


                        if (currentBatchObject == null || currentBatchObject.mesh == null)
                        {
                            using (new EditorGUIHelper.GUIBackgroundColor(Color.yellow))
                            {
                                EditorGUI.ObjectField(new Rect(rectObjectData.xMin, currentRowRect.yMin, rectObjectData.width, currentRowRect.height), null, typeof(Mesh), false);
                            }
                        }
                        else
                        {
                            //Catch mouse click. Using 'Foldout' in this case is better than, Event check that is not always executing.
                            EditorGUI.BeginChangeCheck();
                            using (new EditorGUIHelper.GUIBackgroundColor(Color.clear))
                            {
                                EditorGUI.Foldout(new Rect(rectObjectData.xMax, currentRowRect.yMin, rectRefresh.xMin - rectObjectData.xMax, currentRowRect.height), false, GUIContent.none, true);
                            }
                            if (EditorGUI.EndChangeCheck())
                            {
                                EditorWindow.active.selectedBatchObjectIndex = i;

                                EditorWindow.active.editorSettings.RenderPreviewTextures();
                            }


                            //Higlight selected row
                            if (EditorWindow.active.selectedBatchObjectIndex == i)
                                EditorGUI.DrawRect(new Rect(rectObjectData.xMax + 5, currentRowRect.yMin, rectRefresh.xMin - rectObjectData.xMax - 7, currentRowRect.height), Color.green * 0.2f);



                            //Gameobject or ProjectObject
                            Color backgroundColor = Color.white;
                            if (currentBatchObject.hasOverwrittenConflict)
                                backgroundColor = Color.yellow;
                            if (EditorWindow.active.problematicBatchObject != null && EditorWindow.active.problematicBatchObject.mesh == currentBatchObject.mesh)
                                backgroundColor = Color.red;


                            Rect rectObjectField = new Rect(rectObjectData.xMin, currentRowRect.yMin, rectObjectData.width, currentRowRect.height);
                            using (new EditorGUIHelper.GUIBackgroundColor(backgroundColor))
                            {
                                EditorGUI.ObjectField(rectObjectField, currentBatchObject.mesh, typeof(Mesh), false);
                            }


                            //Submesh
                            EditorGUI.LabelField(new Rect(rectSubmeshCount.xMin, currentRowRect.yMin, rectSubmeshCount.width, currentRowRect.height), currentBatchObject.mesh.subMeshCount.ToString(), EditorResources.GUIStyleMiniLabel);

                            //UV0
                            GUI.DrawTexture(new Rect(rectUV0.xMin + rectUV0.width / 2 - 6, currentRowRect.yMin + 2, 12, 12), currentBatchObject.hasUV0 ? EditorResources.IconYes : EditorResources.IconNo);

                            //Vertex Color
                            GUI.DrawTexture(new Rect(rectBakedWireframe.xMin + rectBakedWireframe.width / 2 - 6, currentRowRect.yMin + 2, 12, 12), currentBatchObject.hasBakedWireframe ? EditorResources.IconYes : EditorResources.IconNo);

                            //Remove
                            if (GUI.Button(new Rect(rectRefresh.xMin, currentRowRect.yMin, rectRefresh.width, currentRowRect.height), new GUIContent("-", "Remove"), EditorStyles.toolbarButton))
                            {
                                RemoveSelectedBatchObject(i);

                                break;
                            }


                        }



                        //Draw line
                        if (i != listBatchObjects.Count - 1)
                        {
                            EditorGUI.DrawRect(new Rect(rectObjectData.xMax + 5, currentRowRect.yMax, rectRefresh.xMax - rectObjectData.xMax - 5, 1), Color.gray * (UnityEditor.EditorGUIUtility.isProSkin ? 1 : 0.5f));
                        }

                    }
                }
                EditorGUILayout.EndScrollView();
            }


            //Toolbar
            {
                int offset = 7;

                GUI.Box(new Rect(rectObjectData.xMin + 1, toolbarRect.yMin, rectRefresh.xMax - rectObjectData.xMin + offset - 1, singleLineHeight), string.Empty, EditorStyles.toolbar);

                DrawSortByButton(new Rect(rectObjectData.xMin + offset, toolbarRect.yMin, rectObjectData.width, singleLineHeight), "Target", SortBy.ObjectName);
                DrawSortByButton(new Rect(rectSubmeshCount.xMin + offset, toolbarRect.yMin, rectSubmeshCount.width, singleLineHeight), "Submesh", SortBy.SubmeshCount);
                DrawSortByButton(new Rect(rectUV0.xMin + offset, toolbarRect.yMin, rectUV0.width, singleLineHeight), "UV0", SortBy.UV0);
                DrawSortByButton(new Rect(rectBakedWireframe.xMin + offset, toolbarRect.yMin, rectBakedWireframe.width, singleLineHeight), "Baked Wireframe", SortBy.BakedWireframe);

                if (GUI.Button(new Rect(rectRefresh.xMin + offset, toolbarRect.yMin, rectRefresh.width, singleLineHeight), " ", EditorStyles.toolbarButton))
                {
                    EditorWindow.active.CallbackContextMenu(EditorWindow.ContextMenuOption.Reload);
                }
                GUI.Label(new Rect(rectRefresh.xMin + offset, toolbarRect.yMin, rectRefresh.width, singleLineHeight), new GUIContent("↻", "Reload"), EditorResources.GUIStyleMiniLabel);
            }
        }
        internal static void SaveEditorData()
        {
            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;


            if (listBatchObjects != null)
            {
                string instanceIDs = $"{(int)sortBy},{(sortByAscending ? 1 : 0)}|";
                for (int i = 0; i < listBatchObjects.Count; i++)
                {
                    if (listBatchObjects[i] != null && listBatchObjects[i].mesh != null)
                    {
                        instanceIDs += listBatchObjects[i].mesh.GetInstanceID() + ";";
                    }
                }

                EditorPrefs.SetString(GetEditorPreferencesPath(), instanceIDs);
            }
        }
        internal static void LoadEditorData()
        {
            if (EditorWindow.active.listBatchObjects != null)
                EditorWindow.active.listBatchObjects.Clear();

            //ID
            string gameObjectsID = EditorPrefs.GetString(GetEditorPreferencesPath());
            if (string.IsNullOrEmpty(gameObjectsID) == false)
            {
                string[] options = gameObjectsID.Split('|')[0].Split(',');
                if (int.TryParse(options[0], out int iValue))
                    sortBy = (SortBy)iValue;
                if (int.TryParse(options[1], out iValue))
                    sortByAscending = iValue == 1;


                options = gameObjectsID.Split('|')[1].Split(';');

                for (int i = 0; i < options.Length; i++)
                {
                    if (string.IsNullOrEmpty(options[i]))
                        continue;


                    if (int.TryParse(options[i], out iValue))
                    {
                        UnityEngine.Object uObject = UnityEditor.EditorUtility.InstanceIDToObject(iValue);

                        if(uObject != null)
                            AddBatchObjectToArray(uObject as Mesh, false);
                    }
                }

                SortBatchObjects();
            }
        }
        static string GetEditorPreferencesPath()
        {
            return AssetInfo.assetNameTrimmed + "TextureCreator_ObjectsID_" + Application.dataPath.GetHashCode();
        }

        static void SplitControlRect(Rect controlRect, out Rect rectObjectData, out Rect rectSubmeshCount, out Rect rectUV0, out Rect rectBakedWireframe, out Rect rectRefresh)
        {
            float controlWidth = controlRect.width - 20;    //20 is for refresh button
            
            rectObjectData = new Rect(controlRect);
            rectObjectData.width = controlWidth * 0.62f;

            rectSubmeshCount = new Rect(controlRect);
            rectSubmeshCount.xMin = rectObjectData.xMax;
            rectSubmeshCount.width = controlWidth * 0.11f;

            rectUV0 = new Rect(controlRect);
            rectUV0.xMin = rectSubmeshCount.xMax;
            rectUV0.width = controlWidth * 0.1f;

            rectBakedWireframe = new Rect(controlRect);
            rectBakedWireframe.xMin = rectUV0.xMax;
            rectBakedWireframe.width = controlWidth * 0.17f;

            rectRefresh = new Rect(controlRect);
            rectRefresh.xMin = rectBakedWireframe.xMax;
            rectRefresh.width = 20;
        }
        static void DrawSortByButton(Rect rect, string label, SortBy sortByOnClickEvent)
        {
            if (GUI.Button(rect, " ", EditorStyles.toolbarButton))
            {
                sortBy = sortByOnClickEvent;
                sortByAscending = !sortByAscending;

                SortBatchObjects();

                SaveEditorData();

                EditorWindow.active.Repaint();
            }

            GUI.Label(rect, label, EditorResources.GUIStyleMiniLabel);
        }

        internal static void ResetSort()
        {
            sortBy = SortBy.None;
        }
        internal static void SortBatchObjects()
        {
            string N0 = (1000).ToString("N0").Replace("1", string.Empty).Replace("0", string.Empty);

            switch (sortBy)
            {
                case SortBy.ObjectName: SortBatchObjects(r => r.mesh.name, null); break;
                case SortBy.SubmeshCount: SortBatchObjects(r => r.mesh.subMeshCount, r => r.mesh.name); break;
                case SortBy.UV0: SortBatchObjects(r => r.hasUV0, r => r.mesh.name); break;
                case SortBy.BakedWireframe: SortBatchObjects(r => r.hasBakedWireframe, r => r.mesh.name); break;
                default:
                    break;
            }
        }
        static void SortBatchObjects(Func<BatchObject, System.Object> orderRoot, Func<BatchObject, System.Object> orderRootThen)
        {
            if (EditorWindow.active.listBatchObjects == null)
                return;


            //Save batch object and reselect it after sorting;
            BatchObject selectedBatchObject = null;
            if (EditorWindow.active.selectedBatchObjectIndex != -1 && EditorWindow.active.listBatchObjects.Count > EditorWindow.active.selectedBatchObjectIndex)
                selectedBatchObject = EditorWindow.active.listBatchObjects[EditorWindow.active.selectedBatchObjectIndex];


            if (sortByAscending)
            {
                if (orderRoot != null)
                {
                    if (orderRootThen != null)
                        EditorWindow.active.listBatchObjects = EditorWindow.active.listBatchObjects.OrderBy(orderRoot).ThenBy(orderRootThen).ToList();
                    else
                        EditorWindow.active.listBatchObjects = EditorWindow.active.listBatchObjects.OrderBy(orderRoot).ToList();
                }
            }
            else
            {
                if (orderRoot != null)
                {
                    if (orderRootThen != null)
                        EditorWindow.active.listBatchObjects = EditorWindow.active.listBatchObjects.OrderByDescending(orderRoot).ThenBy(orderRootThen).ToList();
                    else
                        EditorWindow.active.listBatchObjects = EditorWindow.active.listBatchObjects.OrderByDescending(orderRoot).ToList();
                }
            }


            //Restore selection
            if (selectedBatchObject != null)
            {
                EditorWindow.active.selectedBatchObjectIndex = EditorWindow.active.listBatchObjects.IndexOf(selectedBatchObject);
            }
        }


        internal static void AddDrops(UnityEngine.Object[] drops, bool checkDirectory)
        {
            if (drops == null || drops.Length == 0)
                return;


            for (int i = 0; i < drops.Length; i++)
            {
                if (drops[i] == null)
                    continue;

                UnityEditor.EditorUtility.DisplayProgressBar("Hold On", drops[i].name, (float)i / drops.Length);


                string dropPath = AssetDatabase.GetAssetPath(drops[i]);
                string dropExtension = Path.GetExtension(dropPath).ToLowerInvariant();

                GameObject gameobject = drops[i] as GameObject;
                Mesh mesh = drops[i] as Mesh;

                if (gameobject != null)
                {
                    AddObjectToBatchArray(gameobject, false);
                }
                else if (mesh != null)
                {
                    AddBatchObjectToArray(mesh, false);
                }
                else if (string.IsNullOrEmpty(dropExtension))
                {
                    //May be it is a folder ?
                    if (checkDirectory)
                        AddBatchObjectToArray(dropPath, false);
                }
            }

            SortBatchObjects();
        }
        internal static void AddObjectToBatchArray(GameObject gameobject, bool sort)
        {
            if (gameobject != null)
            {
                MeshFilter[] meshFilters = gameobject.GetComponentsInChildren<MeshFilter>();
                for (int m = 0; m < meshFilters.Length; m++)
                {
                    if (meshFilters[m] != null && meshFilters[m].sharedMesh != null)
                        AddBatchObjectToArray(meshFilters[m].sharedMesh, false);
                }

                SkinnedMeshRenderer[] skinnedMeshRenderers = gameobject.GetComponentsInChildren<SkinnedMeshRenderer>();
                for (int m = 0; m < skinnedMeshRenderers.Length; m++)
                {
                    if (skinnedMeshRenderers[m] != null && skinnedMeshRenderers[m].sharedMesh != null)
                        AddBatchObjectToArray(skinnedMeshRenderers[m].sharedMesh, false);
                }

                if (sort)
                    SortBatchObjects();
            }
        }
        internal static BatchObject AddBatchObjectToArray(Mesh mesh, bool sort)
        {
            if (EditorWindow.active.listBatchObjects == null)
                EditorWindow.active.listBatchObjects = new List<BatchObject>();

            if (mesh != null && EditorWindow.active.listBatchObjects.Any(x => x.mesh.GetInstanceID() == mesh.GetInstanceID()) == false)
            {
                string assetName = EditorWindow.active.editorSettings.GetSaveAssetName(mesh, true);
                string assetSaveDirectory = EditorWindow.active.editorSettings.GetAssetSaveDirectory(mesh, true, true);
                string savePath = Path.Combine(assetSaveDirectory, assetName);


                BatchObject batchObject = new BatchObject(mesh);

                EditorWindow.active.listBatchObjects.Add(batchObject);

                //Check if there are overwritten conflicts
                List<BatchObject> objects = EditorWindow.active.listBatchObjects.Where(c => c.savePath == savePath).ToList();
                if (objects.Count > 1)
                    objects.ForEach(c => c.hasOverwrittenConflict = true);


                if (sort)
                    SortBatchObjects();


                SceneView.RepaintAll();
                return batchObject;
            }

            return null;
        }
        internal static void AddBatchObjectToArray(string folderPath, bool sort)
        {
            string[] guids = AssetDatabase.FindAssets("t:Prefab t:Model t:Mesh", string.IsNullOrEmpty(folderPath) ? null : new string[] { folderPath });
            for (int i = 0; i < guids.Length; i++)
            {
                string path = AssetDatabase.GUIDToAssetPath(guids[i]);

                UnityEditor.EditorUtility.DisplayProgressBar("Hold On", path, (float)i / guids.Length);

                if (string.IsNullOrEmpty(path) == false)
                {
                    GameObject gameobject = (GameObject)AssetDatabase.LoadAssetAtPath(path, typeof(GameObject));
                    if (gameobject != null)
                        AddObjectToBatchArray(gameobject, false);
                    else
                    {
                        Mesh mesh = (Mesh)AssetDatabase.LoadAssetAtPath(path, typeof(Mesh));
                        if (mesh != null)
                            AddBatchObjectToArray(mesh, false);
                    }
                }

            }

            if (sort)
                SortBatchObjects();

            SaveEditorData();

            UnityEditor.EditorUtility.ClearProgressBar();
        }
        internal static void RemoveSelectedBatchObject(int i)
        {
            if (i >= 0 && i < EditorWindow.active.listBatchObjects.Count)
            {
                if (EditorWindow.active.problematicBatchObject != null && EditorWindow.active.problematicBatchObject == EditorWindow.active.listBatchObjects[i])
                    EditorWindow.active.problematicBatchObject = null;

                EditorWindow.active.listBatchObjects.Remove(EditorWindow.active.listBatchObjects[i]);

                if (i == EditorWindow.active.selectedBatchObjectIndex)
                    EditorWindow.active.selectedBatchObjectIndex = -1;
                else if (i <= EditorWindow.active.selectedBatchObjectIndex)
                    EditorWindow.active.selectedBatchObjectIndex -= 1;

                EditorWindow.active.UpdateBatchObjectsSavePath();

                EditorWindow.active.Repaint();

                SceneView.RepaintAll();
            }
        }
        internal static void CatchDragAndDrop()
        {
            Rect drop_area = new Rect(0, 0, EditorWindow.active.position.width, EditorWindow.active.position.height);

            Event evt = Event.current;
            switch (evt.type)
            {
                case EventType.DragUpdated:
                case EventType.DragPerform:
                    if (!drop_area.Contains(evt.mousePosition))
                        return;

                    DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                    if (evt.type == EventType.DragPerform)
                    {
                        DragAndDrop.AcceptDrag();

                        AddDrops(DragAndDrop.objectReferences, true);

                        SaveEditorData();
                        EditorWindow.active.editorSettings.SaveEditorData();
                        UnityEditor.EditorUtility.ClearProgressBar();
                        EditorWindow.active.Repaint();
                    }
                    break;
            }
        }
    }
}
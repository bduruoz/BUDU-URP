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
    internal class BatchObjectsDrawer
    {
        enum SortBy { None, ObjectName, MeshCount, AssetFormat, SubmeshCount, CountOriginal, CountWireframe, IndexFormat }


        static Vector2 scrollBatchObjects;
        static SortBy sortBy = SortBy.None;
        static bool sortByAscending = true;    
        static Color groupHighLightColor = UnityEditor.EditorGUIUtility.isProSkin ? (new Color(0, 0, 0, 0.3f)) : (Color.gray * 0.15f);


        internal static void Draw()
        {
            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;
            EditorSettings editorSettings = EditorWindow.active.editorSettings;


            Rect rectObjectData = new Rect();
            Rect rectMeshCount = new Rect();
            Rect rectAssetFormat = new Rect();
            Rect rectSubmeshCount = new Rect();
            Rect rectVertexTriangleCountOrig = new Rect();
            Rect rectVertexTriangleCountWireframe = new Rect();
            Rect rectIndexFormat = new Rect();
            Rect rectRefresh = new Rect();


            int singleLineHeight = 20;            
            int renderObjectsCount = listBatchObjects.Count + listBatchObjects.Where(c => c.meshInfo != null && c.isExpanded).Sum(c => c.meshInfo.Count) + 1;


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
                            SplitControlRect(currentRowRect, out rectObjectData, out rectMeshCount, editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh, out rectAssetFormat, out rectSubmeshCount, out rectVertexTriangleCountOrig, out rectVertexTriangleCountWireframe, out rectIndexFormat, out rectRefresh);


                        if (currentBatchObject == null || currentBatchObject.gameObject == null || currentBatchObject.meshInfo == null || currentBatchObject.meshInfo.Count == 0)
                        {
                            using (new EditorGUIHelper.GUIBackgroundColor(Color.yellow))
                            {
                                EditorGUI.ObjectField(new Rect(rectObjectData.xMin + 16, currentRowRect.yMin, rectObjectData.width - 16, currentRowRect.height), null, typeof(GameObject), false);
                            }
                        }
                        else
                        {
                            //Catch mouse click. Using 'Foldout' in this case is better than Event check that is not always executing.
                            EditorGUI.BeginChangeCheck();
                            using (new EditorGUIHelper.GUIBackgroundColor(Color.clear))
                            {
                                EditorGUI.Foldout(new Rect(rectObjectData.xMax, currentRowRect.yMin, rectRefresh.xMin - rectObjectData.xMax, currentRowRect.height), false, GUIContent.none, true);
                            }
                            if (EditorGUI.EndChangeCheck())
                            {
                                EditorWindow.active.selectedBatchObjectIndex = i;
                            }



                            //Higlight selected row
                            if (EditorWindow.active.selectedBatchObjectIndex == i)
                                EditorGUI.DrawRect(new Rect(rectObjectData.xMax + 5, currentRowRect.yMin, rectRefresh.xMin - rectObjectData.xMax - 7, currentRowRect.height), Color.green * 0.2f);


                            EditorGUI.BeginChangeCheck();
                            currentBatchObject.isExpanded = EditorGUI.Foldout(new Rect(rectObjectData.xMin, currentRowRect.yMin, 18, currentRowRect.height), currentBatchObject.isExpanded, string.Empty);
                            if (EditorGUI.EndChangeCheck())
                            {
                                if (Event.current.alt)
                                {
                                    listBatchObjects.ForEach(c => c.isExpanded = currentBatchObject.isExpanded);                                    
                                }
                            }


                            //Gameobject or ProjectObject
                            Color backgroundColor = Color.white;
                            if (currentBatchObject.gameObject.scene == null || currentBatchObject.gameObject.scene.name == null || currentBatchObject.gameObject.scene.path == null)
                                backgroundColor = EditorResources.projectRelatedPathColor;
                            if (currentBatchObject.hasOverwrittenConflict)
                                backgroundColor = Color.yellow;
                            if (EditorWindow.active.problematicBatchObject != null && EditorWindow.active.problematicBatchObject.gameObject == currentBatchObject.gameObject)
                                backgroundColor = Color.red;


                            Rect rectObjectField = new Rect(rectObjectData.xMin + 16, currentRowRect.yMin, rectObjectData.width - 16, currentRowRect.height);
                            using (new EditorGUIHelper.GUIBackgroundColor(backgroundColor))
                            {
                                EditorGUI.ObjectField(rectObjectField, currentBatchObject.gameObject, typeof(GameObject), false);
                            }


                            //Mesh count
                            EditorGUI.LabelField(new Rect(rectMeshCount.xMin, currentRowRect.yMin, rectMeshCount.width, currentRowRect.height), currentBatchObject.meshInfo.Count.ToString("N0"), EditorResources.GUIStyleMiniLabel);

                            //.asset format
                            if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                            {
                                Rect assetFormatDrawRect = new Rect(rectAssetFormat.xMin + rectAssetFormat.width / 2 - 6, currentRowRect.yMin + 2, 12, 12);
                                switch (currentBatchObject.isMeshAssetFormat)
                                {
                                    case BatchObject.Enum.OptionsState.Same: GUI.DrawTexture(assetFormatDrawRect, EditorResources.IconYes); break;
                                    case BatchObject.Enum.OptionsState.Different: GUI.DrawTexture(assetFormatDrawRect, EditorResources.IconNo); break;
                                    case BatchObject.Enum.OptionsState.Mixed: EditorGUI.LabelField(assetFormatDrawRect, "-", EditorResources.GUIStyleMiniLabel); break;
                                }
                            }

                            //Submesh
                            EditorGUI.LabelField(new Rect(rectSubmeshCount.xMin, currentRowRect.yMin, rectSubmeshCount.width, currentRowRect.height), currentBatchObject.submeshCount, EditorResources.GUIStyleMiniLabel);

                            //Vertex & triangle count source
                            EditorGUI.LabelField(new Rect(rectVertexTriangleCountOrig.xMin, currentRowRect.yMin, rectVertexTriangleCountOrig.width, currentRowRect.height), currentBatchObject.vertexCountOriginal, EditorResources.GUIStyleMiniLabel);

                            //Vertex & triangle count wireframe
                            EditorGUI.LabelField(new Rect(rectVertexTriangleCountWireframe.xMin, currentRowRect.yMin, rectVertexTriangleCountWireframe.width, currentRowRect.height), currentBatchObject.vertexCountWireframe, EditorResources.GUIStyleMiniLabel);

                            //IndexFormat
                            EditorGUI.DrawRect(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), Color.gray * 0.1f);
                            if (editorSettings.meshCombine == EditorSettings.Enum.MeshCombine.FullHierarchy)
                            {
                                EditorGUI.LabelField(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), currentBatchObject.combinedMeshesIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32 ? "32 Bits" : "16 Bits",
                                                                                                                                    currentBatchObject.combinedMeshesIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32 ? EditorResources.GUIMeshIndexFormat : EditorResources.GUIStyleMiniLabel);
                            }
                            else
                            {
                                if (currentBatchObject.wireframeMeshIndexFormat == -1)
                                    EditorGUI.LabelField(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), "-", EditorResources.GUIMeshIndexFormat);
                                else
                                    EditorGUI.LabelField(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), currentBatchObject.wireframeMeshIndexFormat == (int)UnityEngine.Rendering.IndexFormat.UInt32 ? "32 Bits" : "16 Bits",
                                                                                                                                        currentBatchObject.wireframeMeshIndexFormat == (int)UnityEngine.Rendering.IndexFormat.UInt32 ? EditorResources.GUIMeshIndexFormat : EditorResources.GUIStyleMiniLabel);
                            }

                            //Remove
                            if (GUI.Button(new Rect(rectRefresh.xMin, currentRowRect.yMin, rectRefresh.width, currentRowRect.height), new GUIContent("-", "Remove"), EditorStyles.toolbarButton))
                            {
                                RemoveSelectedBatchObject(i);

                                break;
                            }


                            if (currentBatchObject.isExpanded)
                            {
                                int expandedCount = 1 + currentBatchObject.meshInfo.Count;
                                EditorGUI.DrawRect(new Rect(rectObjectField.xMax + 5, rectObjectField.yMin - 2, rectRefresh.xMax - rectObjectData.xMax - 5, (rectObjectField.height + 2) * expandedCount), groupHighLightColor);


                                for (int m = 0; m < currentBatchObject.meshInfo.Count; m++)
                                {
                                    currentRowRect = EditorGUILayout.GetControlRect();

                                    //Draw line
                                    if (m == 0)
                                        EditorGUI.DrawRect(new Rect(rectObjectData.xMax + 5, currentRowRect.yMin, rectRefresh.xMax - rectObjectData.xMax - 5, 1), Color.gray * (UnityEditor.EditorGUIUtility.isProSkin ? 0.7f : 0.2f));



                                    using (new EditorGUIHelper.GUIEnabled(false))
                                    {
                                        //MeshFilter / SkinnedMeshRenderer
                                        if (currentBatchObject.meshInfo[m].meshFilter == null)
                                            EditorGUI.ObjectField(new Rect(rectObjectData.xMin + 32, currentRowRect.yMin, (rectObjectData.width - 32) * 0.5f, currentRowRect.height), currentBatchObject.meshInfo[m].skinnedMeshRenderer, typeof(SkinnedMeshRenderer), false);
                                        else
                                            EditorGUI.ObjectField(new Rect(rectObjectData.xMin + 32, currentRowRect.yMin, (rectObjectData.width - 32) * 0.5f, currentRowRect.height), currentBatchObject.meshInfo[m].meshFilter, typeof(MeshFilter), false);


                                        //Mesh
                                        using (new EditorGUIHelper.GUIBackgroundColor(currentBatchObject.meshInfo[m].mesh == null ? Color.red : Color.white))
                                        {
                                            EditorGUI.ObjectField(new Rect(rectObjectData.xMin + 32 + (rectObjectData.width - 32) * 0.5f, currentRowRect.yMin, (rectObjectData.width - 32) * 0.5f, currentRowRect.height), currentBatchObject.meshInfo[m].mesh, typeof(Mesh), false);
                                        }

                                        //.asset mesh
                                        if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                                            GUI.DrawTexture(new Rect(rectAssetFormat.xMin + rectAssetFormat.width / 2 - 6, currentRowRect.yMin + 2, 12, 12), currentBatchObject.meshInfo[m].isMeshAssetFormat ? EditorResources.IconYes : EditorResources.IconNo);

                                        //Submesh count
                                        if (currentBatchObject.meshInfo[m].mesh == null)
                                            EditorGUI.LabelField(new Rect(rectSubmeshCount.xMin, currentRowRect.yMin, rectSubmeshCount.width, currentRowRect.height), "0", EditorResources.GUIStyleMiniLabel);
                                        else
                                            EditorGUI.LabelField(new Rect(rectSubmeshCount.xMin, currentRowRect.yMin, rectSubmeshCount.width, currentRowRect.height), currentBatchObject.meshInfo[m].mesh.subMeshCount.ToString(), EditorResources.GUIStyleMiniLabel);


                                        //Original vertex/triangles original
                                        EditorGUI.LabelField(new Rect(rectVertexTriangleCountOrig.xMin, currentRowRect.yMin, rectVertexTriangleCountOrig.width, currentRowRect.height), currentBatchObject.meshInfo[m].vertexCountOriginal, EditorResources.GUIStyleMiniLabel);

                                        //Original vertex/Triangle wireframe
                                        EditorGUI.LabelField(new Rect(rectVertexTriangleCountWireframe.xMin, currentRowRect.yMin, rectVertexTriangleCountWireframe.width, currentRowRect.height), currentBatchObject.meshInfo[m].vertexCountWireframe, EditorResources.GUIStyleMiniLabel);

                                        //IndexFormat
                                        EditorGUI.DrawRect(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), Color.gray * 0.1f);
                                        if (currentBatchObject.meshInfo[m].mesh == null)
                                            EditorGUI.LabelField(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), "-", EditorResources.GUIStyleMiniLabel);
                                        else
                                            EditorGUI.LabelField(new Rect(rectIndexFormat.xMin, currentRowRect.yMin, rectIndexFormat.width, currentRowRect.height), currentBatchObject.meshInfo[m].wireframeMeshIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32 ? "32 Bits" : "16 Bits",
                                                                                                                                                currentBatchObject.meshInfo[m].wireframeMeshIndexFormat == UnityEngine.Rendering.IndexFormat.UInt32 ? EditorResources.GUIMeshIndexFormat : EditorResources.GUIStyleMiniLabel);


                                        //Draw line
                                        if (m != currentBatchObject.meshInfo.Count - 1)
                                        {
                                            EditorGUI.DrawRect(new Rect(rectObjectData.xMax + 5, currentRowRect.yMax, rectRefresh.xMin - rectObjectData.xMax - 5, 1), Color.gray * (UnityEditor.EditorGUIUtility.isProSkin ? 0.8f : 0.2f));
                                        }
                                    }
                                }
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

                GUI.Box(toolbarRect, string.Empty, EditorStyles.toolbar);


                DrawSortByButton(new Rect(rectObjectData.xMin + offset, toolbarRect.yMin, rectObjectData.width, singleLineHeight), "Target", SortBy.ObjectName);
                DrawSortByButton(new Rect(rectMeshCount.xMin + offset, toolbarRect.yMin, rectMeshCount.width, singleLineHeight), "Mesh", SortBy.MeshCount);

                if (editorSettings.assetSaveType == EditorSettings.Enum.AssetSaveType.OverwriteOriginalMesh)
                    DrawSortByButton(new Rect(rectAssetFormat.xMin + offset, toolbarRect.yMin, rectAssetFormat.width, singleLineHeight), ".asset", SortBy.AssetFormat);

                DrawSortByButton(new Rect(rectSubmeshCount.xMin + offset, toolbarRect.yMin, rectSubmeshCount.width, singleLineHeight), "Submesh", SortBy.SubmeshCount);
                DrawSortByButton(new Rect(rectVertexTriangleCountOrig.xMin + offset, toolbarRect.yMin, rectVertexTriangleCountOrig.width, singleLineHeight), "Vertices & Triangles", SortBy.CountOriginal);
                DrawSortByButton(new Rect(rectVertexTriangleCountWireframe.xMin + offset, toolbarRect.yMin, rectVertexTriangleCountWireframe.width, singleLineHeight), "Wireframe Vertices", SortBy.CountWireframe);

                if (editorSettings.meshCombine == EditorSettings.Enum.MeshCombine.FullHierarchy)
                    DrawSortByButton(new Rect(rectIndexFormat.xMin + offset, toolbarRect.yMin, rectIndexFormat.width, singleLineHeight), "Index", SortBy.IndexFormat);
                else
                    DrawSortByButton(new Rect(rectIndexFormat.xMin + offset, toolbarRect.yMin, rectIndexFormat.width, singleLineHeight), "Index", SortBy.IndexFormat);


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
                    if (listBatchObjects[i] != null && listBatchObjects[i].gameObject != null)
                    {
                        instanceIDs += string.Format("{0},{1};", listBatchObjects[i].isExpanded ? 1 : 0, listBatchObjects[i].gameObject.GetInstanceID());
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


                    string[] values = options[i].Split(',');

                    if (values != null && values.Length == 2)
                    {
                        bool mainExpand = false;
                        if (int.TryParse(values[0], out iValue))
                            mainExpand = iValue == 1;


                        if (int.TryParse(values[1], out iValue))
                        {
                            UnityEngine.Object uObject = UnityEditor.EditorUtility.InstanceIDToObject(iValue);
                            if (uObject != null)
                            {
                                BatchObject obj = AddObjectToBatchArray(uObject as GameObject, mainExpand, false);
                            }
                        }
                    }
                }


                SortBatchObjects();
            }
        }
        static string GetEditorPreferencesPath()
        {
            return AssetInfo.assetNameTrimmed + "MeshCreator_ObjectsID_" + Application.dataPath.GetHashCode();
        }

        static void SplitControlRect(Rect controlRect, out Rect rectObjectData, out Rect rectMeshCount, bool needRectAssetFormat, out Rect rectAssetFormat, out Rect rectSubmeshCount, out Rect rectVertexTriangleCountOrig, out Rect rectVertexTriangleCountWireframe, out Rect rectIndexFormat, out Rect rectRefresh)
        {
            float controlWidth = controlRect.width - 20;    //20 is for refresh button
            if (needRectAssetFormat == false)
                controlWidth += controlWidth * 0.066f;

            rectObjectData = new Rect(controlRect);
            rectObjectData.width = controlWidth * 0.43f;

            rectMeshCount = new Rect(controlRect);
            rectMeshCount.xMin = rectObjectData.xMax;
            rectMeshCount.width = controlWidth * 0.066f;

            rectAssetFormat = new Rect(controlRect);
            if (needRectAssetFormat)
            {
                rectAssetFormat.xMin = rectMeshCount.xMax;
                rectAssetFormat.width = controlWidth * 0.066f;
            }

            rectSubmeshCount = new Rect(controlRect);
            rectSubmeshCount.xMin = needRectAssetFormat ? rectAssetFormat.xMax : rectMeshCount.xMax;
            rectSubmeshCount.width = controlWidth * 0.076f;

            rectVertexTriangleCountOrig = new Rect(controlRect);
            rectVertexTriangleCountOrig.xMin = rectSubmeshCount.xMax;
            rectVertexTriangleCountOrig.width = controlWidth * 0.16f;

            rectVertexTriangleCountWireframe = new Rect(controlRect);
            rectVertexTriangleCountWireframe.xMin = rectVertexTriangleCountOrig.xMax;
            rectVertexTriangleCountWireframe.width = controlWidth * 0.154f;

            rectIndexFormat = new Rect(controlRect);
            rectIndexFormat.xMin = rectVertexTriangleCountWireframe.xMax;
            rectIndexFormat.width = controlWidth * 0.051f;

            rectRefresh = new Rect(controlRect);
            rectRefresh.xMin = rectIndexFormat.xMax;
            rectRefresh.width = 20;
        }
        static void DrawSortByButton(Rect rect, string label, SortBy sortByOnClickEvent)
        {
            if (GUI.Button(rect, label, sortBy == sortByOnClickEvent ? EditorResources.GUIStyleToolbarMiniLabelBold : EditorResources.GUIStyleToolbarMiniLabel))
            {
                sortBy = sortByOnClickEvent;
                sortByAscending = !sortByAscending;                

                SortBatchObjects();

                SaveEditorData();

                EditorWindow.active.Repaint();
            }
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
                case SortBy.ObjectName: SortBatchObjects(r => r.gameObject.name, null, c => c.mesh.name, null); break;
                case SortBy.MeshCount: SortBatchObjects(r => EditorUtilities.PadNumbers(r.meshInfo.Count.ToString()), r => r.gameObject.name, c => c.mesh.name, null); break;
                case SortBy.AssetFormat: SortBatchObjects(r => r.isMeshAssetFormat, r => r.gameObject.name, c => c.isMeshAssetFormat, c => c.mesh.name); break;
                case SortBy.SubmeshCount: SortBatchObjects(r => r.submeshCount, r => r.gameObject.name, c => c.mesh.subMeshCount.ToString(), c => c.mesh.name); break;
                case SortBy.CountOriginal: SortBatchObjects(r => EditorUtilities.PadNumbers(r.vertexCountOriginal.Replace(N0, string.Empty)),
                                                                                                  r => r.gameObject.name,
                                                                                                  c => EditorUtilities.PadNumbers(c.vertexCountOriginal.Replace(N0, string.Empty)),
                                                                                                  c => c.mesh.name); break;
                case SortBy.CountWireframe: SortBatchObjects(r => EditorUtilities.PadNumbers(r.vertexCountWireframe.Replace(N0, string.Empty)),
                                                                   r => r.gameObject.name,
                                                                   c => EditorUtilities.PadNumbers(c.vertexCountWireframe.Replace(N0, string.Empty)),
                                                                   c => c.mesh.name); break;
                case SortBy.IndexFormat:
                    if (EditorWindow.active.editorSettings.meshCombine == EditorSettings.Enum.MeshCombine.FullHierarchy) 
                        SortBatchObjects(r => r.combinedMeshesIndexFormat, r => r.gameObject.name, c => c.wireframeMeshIndexFormat, c => c.mesh.name); 
                    else
                        SortBatchObjects(r => r.wireframeMeshIndexFormat, r => r.gameObject.name, c => c.wireframeMeshIndexFormat, c => c.mesh.name);
                    break;

                default:
                    break;
            }
        }
        static void SortBatchObjects(Func<BatchObject, System.Object> orderRoot, Func<BatchObject, System.Object> orderRootThen, Func<BatchObjectMeshInfo, System.Object> orderChild, Func<BatchObjectMeshInfo, System.Object> orderChildThen)
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

                if (orderChild != null)
                {
                    for (int i = 0; i < EditorWindow.active.listBatchObjects.Count; i++)
                    {
                        if (orderChildThen != null)
                            EditorWindow.active.listBatchObjects[i].meshInfo = EditorWindow.active.listBatchObjects[i].meshInfo.OrderBy(orderChild).ThenBy(orderChildThen).ToList();
                        else
                            EditorWindow.active.listBatchObjects[i].meshInfo = EditorWindow.active.listBatchObjects[i].meshInfo.OrderBy(orderChild).ToList();
                    }
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

                if (orderChild != null)
                {
                    for (int i = 0; i < EditorWindow.active.listBatchObjects.Count; i++)
                    {
                        if (orderChildThen != null)
                            EditorWindow.active.listBatchObjects[i].meshInfo = EditorWindow.active.listBatchObjects[i].meshInfo.OrderByDescending(orderChild).ThenBy(orderChildThen).ToList();
                        else
                            EditorWindow.active.listBatchObjects[i].meshInfo = EditorWindow.active.listBatchObjects[i].meshInfo.OrderByDescending(orderChild).ToList();
                    }
                }
            }


            //Restore selection
            if(selectedBatchObject != null)
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

                if (gameobject != null)
                {
                    AddObjectToBatchArray(gameobject, false, false);
                }
                else if (string.IsNullOrEmpty(dropExtension))
                {
                    //May be it is a folder ?
                    if (checkDirectory)
                        AddBatchObjectToArray(dropPath);
                }
            }

            SortBatchObjects();
        }
        internal static BatchObject AddObjectToBatchArray(GameObject gameObject, bool expand, bool sort)
        {
            if (EditorWindow.active == null)
                return null;


            if (EditorWindow.active.listBatchObjects == null)
                EditorWindow.active.listBatchObjects = new List<BatchObject>();

            if (EditorWindow.active.editorSettings == null)
                EditorWindow.active.editorSettings = new EditorSettings();



            if (gameObject != null && EditorWindow.active.listBatchObjects.Any(x => x != null && x.gameObject != null && x.gameObject.GetInstanceID() == gameObject.GetInstanceID()) == false)
            {
                string assetName = EditorWindow.active.editorSettings.GetSaveAssetName(gameObject, true);
                string assetSaveDirectory = EditorWindow.active.editorSettings.GetAssetSaveDirectory(gameObject, true, true);
                string savePath = Path.Combine(assetSaveDirectory, assetName);



                if (string.IsNullOrWhiteSpace(savePath) == false)                    
                {
                    BatchObject batchObject = new BatchObject(gameObject, expand);

                    if (batchObject.meshInfo.Count > 0)
                    {
                        EditorWindow.active.listBatchObjects.Add(batchObject);

                        //Check if there are overwritten conflicts
                        List<BatchObject> objects = EditorWindow.active.listBatchObjects.Where(c => c.savePath == savePath).ToList();
                        if (objects.Count > 1)
                            objects.ForEach(c => c.hasOverwrittenConflict = true);


                        if(sort)
                            SortBatchObjects();


                        SceneView.RepaintAll();
                        return batchObject;
                    }
                }
            }

            return null;
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
        internal static void AddBatchObjectToArray(string folderPath)
        {
            string[] guids = AssetDatabase.FindAssets("t:Prefab t:Model", string.IsNullOrEmpty(folderPath) ? null : new string[] { folderPath });
            for (int i = 0; i < guids.Length; i++)
            {
                string path = AssetDatabase.GUIDToAssetPath(guids[i]);

                UnityEditor.EditorUtility.DisplayProgressBar("Hold On", path, (float)i / guids.Length);

                if (string.IsNullOrEmpty(path) == false)
                    AddObjectToBatchArray((GameObject)AssetDatabase.LoadAssetAtPath(path, typeof(GameObject)), false, false);
            }

            SortBatchObjects();

            SaveEditorData();

            UnityEditor.EditorUtility.ClearProgressBar();
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
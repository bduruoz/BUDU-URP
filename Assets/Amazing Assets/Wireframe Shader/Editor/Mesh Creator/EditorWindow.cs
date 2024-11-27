// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.IO;
using System.Linq;
using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{  
    internal class EditorWindow : UnityEditor.EditorWindow
    {
        internal enum ContextMenuOption { OpenCustomSaveFolder, Reset, SelectLastSavedFile, Reload, LoadSettingsFromSystemMemory, ExportSelectedBatchObject }

        internal static EditorWindow active;


        internal EditorSettings editorSettings;

        internal List<BatchObject> listBatchObjects;
        internal BatchObject problematicBatchObject;

        static GameObject objectPicker;
        readonly int objectPickerID = 443101;
        protected internal int selectedBatchObjectIndex = -1;        

        Vector2 scrollSettings;                
        internal string lastSavedFilePath;              


        [MenuItem("Window/Amazing Assets/Wireframe Shader/Mesh Creator", false, 3101)]
        static public void ShowWindow()
        {
            EditorWindow window = GetWindow<EditorWindow>("Wireframe Mesh Creator");

            BatchObjectsDrawer.ResetSort();

            window.Show();
        }        
        void OnEnable()
        {
            active = this;
            
            LoadEditorData();
        }        
        void OnDisable()
        {
            active = this;

            SaveEditorData();
        }        
        void OnDestroy()
        {
            active = this;

            if (listBatchObjects != null)
                listBatchObjects.Clear();


            SaveEditorData();
        }        
        void OnFocus()
        {
            active = this;

            LoadEditorData();

            UnityEditor.EditorUtility.ClearProgressBar();
        }        
        void OnLostFocus()
        {
            active = this;

            SaveEditorData();
        }        
        void OnGUI()
        {
            LoadResources();

            scrollSettings = EditorGUILayout.BeginScrollView(scrollSettings);
            {
                //This will force to display horizontal scrollbar after window width becomes less then 'minwidth' pixels.
                EditorGUILayout.GetControlRect(false, 1, GUILayout.MinWidth(720));

                editorSettings.Draw();                

                DrawBatchObjectsArray();
            }
            EditorGUILayout.EndScrollView();

            DrawRunButton();



            CatchInput();

            CatchContextMenu();

            BatchObjectsDrawer.CatchDragAndDrop();
            EditorSettingsBase.CatchDragAndDrop(new Rect(0, 0, position.width, position.height), editorSettings.LoadEditorDataFromCopyBuffer);

            if (objectPicker != null)
            {
                BatchObjectsDrawer.AddObjectToBatchArray(objectPicker, false, true);
                SaveEditorData();
                objectPicker = null;
                Repaint();
            }

            CatchObjectPicker();
        }


        void DrawBatchObjectsArray()
        {
            GUILayout.Space(5);


            using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
            {
                int buttonHeight = 30;

                using (new EditorGUIHelper.GUIEnabled((Selection.transforms != null && Selection.transforms.Length > 0)))
                {
                    if (GUILayout.Button("Add Selected", GUILayout.Height(buttonHeight)))
                    {
                        for (int i = 0; i < Selection.transforms.Length; i++)
                        {
                            if(Selection.transforms[i] != null)
                                BatchObjectsDrawer.AddObjectToBatchArray(Selection.transforms[i].gameObject, false, false);
                        }

                        BatchObjectsDrawer.SortBatchObjects();

                        SaveEditorData();
                    }
                }

                if (GUILayout.Button("Add Custom Prefab", GUILayout.Height(buttonHeight)))
                {
                    UnityEditor.EditorGUIUtility.ShowObjectPicker<GameObject>(null, true, string.Empty, objectPickerID);
                }


                using (new EditorGUIHelper.GUIEnabled(listBatchObjects != null && listBatchObjects.Count > 0))
                {
                    if (GUILayout.Button("Remove All", GUILayout.Height(buttonHeight)))
                    {
                        if (listBatchObjects != null)
                            listBatchObjects.Clear();

                        listBatchObjects = null;
                        selectedBatchObjectIndex = -1;

                        problematicBatchObject = null;

                        SaveEditorData();

                        Repaint();
                    }
                }
            }

             

            if (listBatchObjects == null || listBatchObjects.Count == 0)
            {
                EditorGUILayout.HelpBox("Drag and drop GameObjects and Prefabs from Hierarchy and Project windows here.", MessageType.Warning);
            }
            else
            {
                BatchObjectsDrawer.Draw();
            }
        }
        void DrawRunButton()
        {
            GUILayout.Space(10);
            Rect controlRect = EditorGUILayout.GetControlRect(false, 70);
            GUILayout.Space(5);

            string buttonName = "Run";
            if (listBatchObjects != null)
            {
                if (listBatchObjects.Any(c => c.hasOverwrittenConflict))
                    buttonName = "Files overwriting detected";
                else if (listBatchObjects.Count > 1)
                    buttonName += " (" + listBatchObjects.Count + " Objects / " + listBatchObjects.Sum(c => c.meshInfo.Count) + " Meshes)";
            }
                

            using (new EditorGUIHelper.GUIEnabled(IsReadeToGenerate()))
            {
                if (GUI.Button(new Rect(controlRect.xMin + 2, this.position.height - 54, controlRect.width - 4 - (problematicBatchObject == null ? 0 : 150), 45), buttonName))
                {
                    MeshCreator.Execute();
                }

                if (problematicBatchObject != null)
                {
                    using (new EditorGUIHelper.GUIBackgroundColor(Color.red))
                    {
                        if (GUI.Button(new Rect(controlRect.xMax - 147, this.position.height - 54, 147, 45), "Export"))
                        {
                            EditorUtilities.ExportObjectInfoToPackage(problematicBatchObject.gameObject, editorSettings.SaveEditorData(), problematicBatchObject.exception);

                            problematicBatchObject = null;
                        }
                    }
                }
            }
        }

        void LoadResources()
        {
            active = this;
            
            
            if (listBatchObjects == null)
                listBatchObjects = new List<BatchObject>();

            if (editorSettings == null)
                editorSettings = new EditorSettings();
        }
        void SaveEditorData()
        {
            BatchObjectsDrawer.SaveEditorData();

            if(editorSettings != null)
                editorSettings.SaveEditorData();
        }
        void LoadEditorData()
        {
            if (editorSettings == null)
                editorSettings = new EditorSettings();

            BatchObjectsDrawer.LoadEditorData();
        }        

        bool IsReadeToGenerate()
        {
            if (listBatchObjects == null || listBatchObjects.Count == 0 || listBatchObjects.Any(c => c.hasOverwrittenConflict))
                return false;

            return editorSettings.IsReady();
        }
        internal void UpdateBatchObjectsSavePath()
        {
            listBatchObjects.ForEach(c => { c.hasOverwrittenConflict = false; c.UpdateSavePath(); });

            foreach (var group in listBatchObjects.GroupBy(c => c.savePath).Where(c => c.Count() > 1).ToList())
            {
                foreach (var item in group)
                {
                    item.hasOverwrittenConflict = true;
                }
            }
        }

        void CatchInput()
        {
            if (listBatchObjects != null && listBatchObjects.Count > 0 && Event.current != null)
            {
                if (Event.current.type == EventType.KeyDown)
                {
                    if (Event.current.keyCode == KeyCode.UpArrow)
                    {
                        if (selectedBatchObjectIndex > 0)
                        {
                            selectedBatchObjectIndex -= 1;

                            Repaint();
                        }
                        else if (selectedBatchObjectIndex == -1)
                        {
                            selectedBatchObjectIndex = listBatchObjects.Count - 1;

                            Repaint();
                        }
                    }

                    if (Event.current.keyCode == KeyCode.DownArrow)
                    {
                        if (selectedBatchObjectIndex < listBatchObjects.Count - 1)
                        {
                            selectedBatchObjectIndex += 1;

                            Repaint();
                        }
                    }

                    if(Event.current.keyCode == KeyCode.Delete)
                    {
                        BatchObjectsDrawer.RemoveSelectedBatchObject(selectedBatchObjectIndex);
                    }
                }
            }
        }
        void CatchContextMenu()
        {
            var evt = Event.current;
            var contextRect = new Rect(10, 10, this.position.width, this.position.height);
            if (evt != null && evt.type == EventType.ContextClick)
            {
                var mousePos = evt.mousePosition;
                if (contextRect.Contains(mousePos))
                {
                    GenericMenu menu = new GenericMenu();

                    if (listBatchObjects != null && listBatchObjects.Count >= 0)
                    {
                        if (editorSettings.saveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder)
                        {
                            if (string.IsNullOrEmpty(editorSettings.saveFolderCustomPath) == false && Directory.Exists(editorSettings.saveFolderCustomPath))
                                menu.AddItem(new GUIContent("Open Save Folder"), false, CallbackContextMenu, ContextMenuOption.OpenCustomSaveFolder);
                            else
                                menu.AddDisabledItem(new GUIContent("Open Save Folder"));
                        }

                        if (string.IsNullOrEmpty(lastSavedFilePath) == false && File.Exists(lastSavedFilePath))
                            menu.AddItem(new GUIContent("Highlight Last Saved File"), false, CallbackContextMenu, ContextMenuOption.SelectLastSavedFile);
                        else
                            menu.AddDisabledItem(new GUIContent("Highlight Last Saved File"));

                        menu.AddSeparator(string.Empty);
                        if (selectedBatchObjectIndex >= 0 && selectedBatchObjectIndex < listBatchObjects.Count)
                            menu.AddItem(new GUIContent("Export Selected Object"), false, CallbackContextMenu, ContextMenuOption.ExportSelectedBatchObject);
                        else
                            menu.AddDisabledItem(new GUIContent("Export Selected Object"));


                        menu.AddSeparator(string.Empty);
                    }

                    menu.AddItem(new GUIContent("Reset"), false, CallbackContextMenu, ContextMenuOption.Reset);


                    //
                    if (evt.control && evt.shift)
                    {
                        menu.AddSeparator(string.Empty);
                        menu.AddItem(new GUIContent("Load Settings From System Copy Buffer"), false, CallbackContextMenu, ContextMenuOption.LoadSettingsFromSystemMemory);
                    }


                    menu.ShowAsContext();
                }
            }
        }
        void CatchObjectPicker()
        {
            if (Event.current.commandName == "ObjectSelectorUpdated")
            {
                if (UnityEditor.EditorGUIUtility.GetObjectPickerControlID() == objectPickerID)
                {
                    if (UnityEditor.EditorGUIUtility.GetObjectPickerObject() != null)
                    {
                        objectPicker = UnityEditor.EditorGUIUtility.GetObjectPickerObject() as GameObject;
                    }
                }
            }
        }
        internal void CallbackContextMenu(object obj)
        {
            if (obj == null)
                return;

            switch ((ContextMenuOption)obj)
            {
                case ContextMenuOption.Reset:
                    {
                        editorSettings.Reset();
                        Repaint();
                        SceneView.RepaintAll();
                    }
                    break;

                case ContextMenuOption.SelectLastSavedFile:
                    {
                        EditorUtilities.SelectFile(lastSavedFilePath);
                    }
                    break;

                case ContextMenuOption.OpenCustomSaveFolder:
                    {
                        EditorUtilities.OpenFolder(editorSettings.saveFolderCustomPath);
                    }
                    break;

                case ContextMenuOption.Reload:
                    {
                        BatchObjectsDrawer.ResetSort();

                        SaveEditorData();

                        if (listBatchObjects != null)
                            listBatchObjects.Clear();

                        problematicBatchObject = null;

                        LoadEditorData();
                        Repaint();
                        SceneView.RepaintAll();
                    }
                    break;

                case ContextMenuOption.LoadSettingsFromSystemMemory:
                    {
                        editorSettings.LoadEditorDataFromCopyBuffer();
                    }
                    break;

                case ContextMenuOption.ExportSelectedBatchObject:
                    {
                        if (listBatchObjects != null &&
                            listBatchObjects.Count > 0 &&
                            selectedBatchObjectIndex >= 0 &&
                            selectedBatchObjectIndex < listBatchObjects.Count)
                        {
                            EditorUtilities.ExportObjectInfoToPackage(listBatchObjects[selectedBatchObjectIndex].gameObject,
                                                                      editorSettings.SaveEditorData(),
                                                                      listBatchObjects[selectedBatchObjectIndex].exception);
                        }
                    }
                    break;

                default:
                    break;
            }
        }
    }
}
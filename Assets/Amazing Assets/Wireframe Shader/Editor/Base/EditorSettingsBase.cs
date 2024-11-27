// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System;
using System.IO;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    internal abstract class EditorSettingsBase
    {
        public static class Enum
        {
            public enum SaveLocation { SameFolder, SameSubfolder, CustomFolder }
            public enum UseSourceObjectName { AsSubfolderName, InAssetName, _, DoNotUse }
        }


        static Texture2D[] useSourceObjectNameIcons = new Texture2D[] { EditorResources.IconFolder, EditorResources.IconFont, null, EditorResources.IconNone };


        #region Settings
        public Enum.SaveLocation saveLocation = Enum.SaveLocation.SameSubfolder;
        public Enum.UseSourceObjectName useSourceObjectName = Enum.UseSourceObjectName.DoNotUse;
        public string saveFolderCustomPath = string.Empty;
        public string filePrefix = string.Empty;
        public string fileSuffix = string.Empty;
        public string subfolderName = string.Empty;
        public bool saveFolderStructure = false;
        #endregion

        #region Tabs
        bool drawTabHelp = false;
        #endregion


        public EditorSettingsBase()
        {
            LoadEditorData();
        }



        public void Draw()
        {
            int labelWidth = 152;

            Rect controlRect = EditorGUILayout.GetControlRect();
            controlRect.xMin += 10;
            controlRect.width -= 10;

            float controlsWidth = (controlRect.width - labelWidth) / 3f;

            Rect collumnRect1, collumnRect2, collumnRect3, collumnRect4;
            collumnRect1 = new Rect(controlRect.xMin, controlRect.yMin, labelWidth, controlRect.height);
            collumnRect2 = new Rect(controlRect.xMin + labelWidth, controlRect.yMin, controlsWidth, controlRect.height);
            collumnRect3 = new Rect(controlRect.xMin + labelWidth + controlsWidth + 10, controlRect.yMin, controlsWidth - 10, controlRect.height);
            collumnRect4 = new Rect(controlRect.xMin + labelWidth + controlsWidth + controlsWidth + 10, controlRect.yMin, controlsWidth - 10, controlRect.height);


            GUILayout.Space(-15);
            DrawCustomSettings(collumnRect1, collumnRect2, collumnRect3, collumnRect4);


            GUILayout.Space(5);
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                drawTabHelp = EditorGUILayout.Foldout(drawTabHelp, "Help", false, EditorResources.GUIStyleFoldoutBold);

                if (drawTabHelp)
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal(EditorStyles.helpBox))
                    {
                        int buttonHeight = 30;

                        if (GUILayout.Button(new GUIContent("Documentation", EditorResources.IconManual), GUILayout.MaxHeight(buttonHeight)))
                        {
                            Application.OpenURL(AssetInfo.assetManualLocation);
                        }

                        if (GUILayout.Button(new GUIContent("Forum", EditorResources.IconForum), GUILayout.MaxHeight(buttonHeight)))
                        {
                            Application.OpenURL(AssetInfo.assetForumPath);
                        }

                        if (GUILayout.Button(new GUIContent("Support & Bug Report", EditorResources.IconSupport, AssetInfo.assetSupportMail + "\nRight click to copy to the clipboard"), GUILayout.MaxHeight(buttonHeight)))
                        {
                            if (Event.current.button == 1)   //Right click
                            {
                                TextEditor te = new TextEditor();
                                te.text = AssetInfo.assetSupportMail;
                                te.SelectAll();
                                te.Copy();



                                StackTraceLogType save = Application.GetStackTraceLogType(LogType.Log);
                                Application.SetStackTraceLogType(LogType.Log, StackTraceLogType.None);

                                Utilities.Log(AssetInfo.assetSupportMail);

                                Application.SetStackTraceLogType(LogType.Log, save);
                            }
                            else
                            {
                                Application.OpenURL("mailto:" + AssetInfo.assetSupportMail);
                            }
                        }


                        if (GUILayout.Button(new GUIContent("Rate Asset", EditorResources.IconRate), GUILayout.MaxHeight(buttonHeight)))
                        {
                            Application.OpenURL(AssetInfo.assetStorePathShortLink);
                        }

                        if (GUILayout.Button(new GUIContent("More Assets ", EditorResources.IconMore), GUILayout.MaxHeight(buttonHeight)))
                        {
                            Application.OpenURL(AssetInfo.publisherPage);
                        }
                    }

                    EditorGUILayout.LabelField($"{AssetInfo.assetName} ({AssetInfo.assetVersion})", EditorStyles.centeredGreyMiniLabel);
                }
            }
        }
        public void DrawSaveOptions(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4, int nameLabelWidth)
        {
            Rect rect = EditorGUILayout.GetControlRect();
            collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
            collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

            EditorGUI.LabelField(collumnRect1, "Name");


            bool bothAreInvalid = false;
            if (saveLocation == Enum.SaveLocation.SameFolder && useSourceObjectName == Enum.UseSourceObjectName.DoNotUse)
            {
                if (string.IsNullOrWhiteSpace(filePrefix) && string.IsNullOrWhiteSpace(fileSuffix))
                    bothAreInvalid = true;
            }


            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(nameLabelWidth))
            {
                using (new EditorGUIHelper.GUIBackgroundColor((EditorUtilities.ContainsInvalidFileNameCharacters(filePrefix) || bothAreInvalid) ? Color.red : Color.white))
                {
                    filePrefix = EditorGUI.TextField(collumnRect2, "Prefix", filePrefix);
                }
            }
            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(nameLabelWidth))
            {
                using (new EditorGUIHelper.GUIBackgroundColor((EditorUtilities.ContainsInvalidFileNameCharacters(fileSuffix) || bothAreInvalid) ? Color.red : Color.white))
                {
                    fileSuffix = EditorGUI.TextField(collumnRect3, "Suffix", fileSuffix);
                }
            }



            rect = EditorGUILayout.GetControlRect();
            collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
            collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

            EditorGUI.LabelField(collumnRect1, "Location");
            saveLocation = (Enum.SaveLocation)EditorGUI.EnumPopup(new Rect(collumnRect2.xMin, collumnRect2.yMin, collumnRect2.width - 51, collumnRect2.height), string.Empty, saveLocation);



            Rect rectUseSourceObjectName = new Rect(collumnRect2.xMax - 50, collumnRect2.yMin, 50, collumnRect2.height);


            using (new EditorGUIHelper.GUIBackgroundColor(Color.clear))
            {
                useSourceObjectName = (Enum.UseSourceObjectName)EditorGUI.EnumPopup(rectUseSourceObjectName, useSourceObjectName);
            }
            GUI.Button(rectUseSourceObjectName, new GUIContent(useSourceObjectNameIcons[(int)useSourceObjectName], "Use source object's name as subfolder name or include it in the file name?"));


            if (saveLocation == Enum.SaveLocation.SameSubfolder)
            {
                using (new EditorGUIHelper.GUIBackgroundColor(EditorUtilities.ContainsInvalidFileNameCharacters(subfolderName) ? Color.red : Color.white))
                {
                    subfolderName = EditorGUI.TextField(collumnRect3, string.Empty, subfolderName);
                }

                if (string.IsNullOrWhiteSpace(subfolderName))
                {
                    using (new EditorGUIHelper.GUIColor(UnityEditor.EditorGUIUtility.isProSkin ? (Color.white * 0.5f) : (Color.white * 0.25f)))
                    {
                        EditorGUI.TextField(collumnRect3, string.Empty, AssetInfo.assetName);
                    }
                }
            }
            else if (saveLocation == Enum.SaveLocation.CustomFolder)
            {
                using (new EditorGUIHelper.GUIBackgroundColor((Directory.Exists(saveFolderCustomPath) == false) ? Color.red : (EditorUtilities.IsPathProjectRelative(saveFolderCustomPath) ? EditorResources.projectRelatedPathColor : Color.white)))
                {
                    saveFolderCustomPath = EditorGUI.TextField(new Rect(collumnRect3.xMin, collumnRect3.yMin, collumnRect3.width - 25, collumnRect3.height), saveFolderCustomPath);
                }

                if (GUI.Button(new Rect(collumnRect3.xMax - 24, collumnRect3.yMin, 25, collumnRect3.height), "..."))
                {
                    GUIUtility.keyboardControl = 0;

                    string newPathName = saveFolderCustomPath;
                    newPathName = UnityEditor.EditorUtility.OpenFolderPanel("Select Folder", Directory.Exists(saveFolderCustomPath) ? saveFolderCustomPath : Application.dataPath, string.Empty);
                    if (string.IsNullOrWhiteSpace(newPathName) == false)
                    {
                        saveFolderCustomPath = newPathName;

                        if (EditorUtilities.IsPathProjectRelative(saveFolderCustomPath))
                            saveFolderCustomPath = EditorUtilities.ConvertPathToProjectRelative(saveFolderCustomPath);
                    }
                }

                saveFolderStructure = EditorGUIHelper.ToggleAsButton(collumnRect4, saveFolderStructure, "Save Folder Structure");
            }
        }
        protected virtual void DrawCustomSettings(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4) { }



        public virtual void Reset()
        {
            saveLocation = Enum.SaveLocation.SameSubfolder;
            useSourceObjectName = Enum.UseSourceObjectName.DoNotUse;
            saveFolderCustomPath = string.Empty;
            filePrefix = string.Empty;
            fileSuffix = string.Empty;
            subfolderName = string.Empty;
            saveFolderStructure = true;


            drawTabHelp = false;    //Hide help tab
        }


        public virtual bool IsReady()
        {
            if (EditorUtilities.ContainsInvalidFileNameCharacters(filePrefix) || EditorUtilities.ContainsInvalidFileNameCharacters(fileSuffix))
                return false;

            if (saveLocation == Enum.SaveLocation.SameFolder && useSourceObjectName == Enum.UseSourceObjectName.DoNotUse)
            {
                if (string.IsNullOrWhiteSpace(filePrefix) && string.IsNullOrWhiteSpace(fileSuffix))
                {
                    return false;
                }
            }

            if (saveLocation == Enum.SaveLocation.SameSubfolder && EditorUtilities.ContainsInvalidFileNameCharacters(subfolderName))
                return false;

            if (saveLocation == Enum.SaveLocation.CustomFolder && Directory.Exists(saveFolderCustomPath) == false)
                return false;

            return true;
        }



        public virtual string SaveEditorData()
        {
            //Convert to Json
            string jsonData = JsonUtility.ToJson(this);

            //Save Json string
            EditorPrefs.SetString(GetEditorPreferencesPath(), jsonData);

            return jsonData;
        }
        public virtual void LoadEditorData()
        {
            //Reset first
            Reset();

            //Load saved Json
            string jsonData = EditorPrefs.GetString(GetEditorPreferencesPath());

            //Read Json
            if (string.IsNullOrWhiteSpace(jsonData) == false)
            {
                try
                {
                    JsonUtility.FromJsonOverwrite(jsonData, this);
                }
                catch
                {
                    Utilities.Log(LogType.Warning, "Can not load settings.", null);
                }
            }
        }
        public void LoadEditorDataFromCopyBuffer()
        {
            if (string.IsNullOrWhiteSpace(GUIUtility.systemCopyBuffer))
            {
                Utilities.Log(LogType.Warning, "GUIUtility.systemCopyBuffer is empty.", null);
                return;
            }

            EditorPrefs.SetString(GetEditorPreferencesPath(), GUIUtility.systemCopyBuffer);

            LoadEditorData();
        }



        public abstract string GetEditorPreferencesName();
        protected string GetEditorPreferencesPath()
        {
            return $"{AssetInfo.assetNameTrimmed}_{GetEditorPreferencesName()}_{Application.dataPath.GetHashCode()}";
        }



        public string GetSaveSubfolderName()
        {
            if (string.IsNullOrWhiteSpace(subfolderName))
                return AssetInfo.assetName;
            else
                return subfolderName;
        }
        public string GetAssetSaveDirectory(UnityEngine.Object obj, bool useTempFolder, bool useExtension)
        {
            string parentAssetPath = GetParentAssetPath(obj);

            string parentAssetName = Path.GetFileName(parentAssetPath);


            string finalPath = string.Empty;
            switch (saveLocation)
            {
                case Enum.SaveLocation.SameFolder:
                    {
                        finalPath = Path.GetDirectoryName(parentAssetPath);
                    }
                    break;

                case Enum.SaveLocation.SameSubfolder:
                    {
                        finalPath = Path.Combine(Path.Combine(Path.GetDirectoryName(parentAssetPath), GetSaveSubfolderName()));
                    }
                    break;

                case Enum.SaveLocation.CustomFolder:
                    {
                        if (saveFolderCustomPath == "Assets" && saveFolderStructure)
                        {
                            finalPath = Path.GetDirectoryName(parentAssetPath);
                        }
                        else
                        {
                            if (EditorUtilities.IsPathProjectRelative(saveFolderCustomPath))
                                finalPath = EditorUtilities.ConvertPathToProjectRelative(saveFolderCustomPath);
                            else
                                finalPath = useTempFolder ? AssetInfo.tempFolder : saveFolderCustomPath;


                            if (saveFolderStructure)
                                finalPath = Path.Combine(finalPath, Path.GetDirectoryName(parentAssetPath));
                        }
                    }
                    break;

                default:
                    goto case Enum.SaveLocation.SameFolder;
            }


            if (useSourceObjectName == Enum.UseSourceObjectName.AsSubfolderName)
            {
                finalPath = Path.Combine(finalPath, AddPrefixAndSuffix(Path.GetFileNameWithoutExtension(parentAssetName) +                                                       // folder name
                                                                       (useExtension ? ("_" + Path.GetExtension(parentAssetName).Replace(".", string.Empty)) : string.Empty)));  // extension

            }



            return finalPath;
        }
        public string GetSaveAssetName(UnityEngine.Object obj, bool useExtension)
        {
            string assetName = EditorUtilities.RemoveInvalidCharacters(obj.name).Trim();
            if (string.IsNullOrWhiteSpace(assetName))
                assetName = "ID " + obj.GetInstanceID();


            //Add parent name
            if (useSourceObjectName == Enum.UseSourceObjectName.InAssetName)
            {
                assetName = Path.GetFileNameWithoutExtension(GetParentAssetPath(obj)) +
                            (useExtension ? ("_" + Path.GetExtension(GetParentAssetPath(obj)).Replace(".", string.Empty)) : string.Empty) +
                            " " + assetName;
            }


            //Add prefix & suffix
            assetName = AddPrefixAndSuffix(assetName);

            return assetName;
        }
        public string AddPrefixAndSuffix(string name)
        {
            name = (string.IsNullOrWhiteSpace(filePrefix) ? string.Empty : filePrefix.Trim()) +
                   name +
                   (string.IsNullOrWhiteSpace(fileSuffix) ? string.Empty : fileSuffix.Trim());

            return name;
        }
        public string GetParentAssetPath(UnityEngine.Object obj)
        {
            string assetPath = AssetDatabase.GetAssetPath(obj);

            //Is it a scene object
            if (string.IsNullOrWhiteSpace(assetPath))
            {
                UnityEngine.Object prefab = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);
                if (prefab != null)
                {
                    prefab = PrefabUtility.GetCorrespondingObjectFromOriginalSource(prefab);
                    assetPath = AssetDatabase.GetAssetPath(prefab);
                }
            }

            //Asset does not exist on disk or can not be loaded
            if (string.IsNullOrWhiteSpace(assetPath) || string.IsNullOrWhiteSpace(Path.GetExtension(assetPath)))
            {
                UnityEngine.SceneManagement.Scene currentScene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
                assetPath = Path.Combine("Assets", "Generated Assets", currentScene == null ? "Untitled" : currentScene.name, obj.name) + ".asset";
            }


            return assetPath;
        }


        internal static void CatchDragAndDrop(Rect dropArea, Action LoadEditorDataFromCopyBuffer)
        {
            Event evt = Event.current;
            switch (evt.type)
            {
                case EventType.DragUpdated:
                case EventType.DragPerform:
                    {
                        if (!dropArea.Contains(evt.mousePosition))
                            return;

                        DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                        if (evt.type == EventType.DragPerform)
                        {
                            DragAndDrop.AcceptDrag();


                            //Read drop
                            if (DragAndDrop.objectReferences != null && DragAndDrop.objectReferences.Length == 1)
                            {
                                string dropPath = AssetDatabase.GetAssetPath(DragAndDrop.objectReferences[0]);

                                if (Path.GetFileName(dropPath) == (AssetInfo.assetNameTrimmed + "EditorSettings.txt"))
                                {
                                    var lines = File.ReadLines(dropPath);
                                    foreach (var line in lines)
                                    {
                                        if (line.Contains("m_Script:"))
                                        {
                                            string settingsLine = line.Replace("m_Script:", string.Empty).Trim();
                                            if (settingsLine.Length > 3)
                                            {
                                                GUIUtility.systemCopyBuffer = settingsLine.Substring(1, settingsLine.Length - 2);

                                                LoadEditorDataFromCopyBuffer();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    break;
            }
        }
    }
}
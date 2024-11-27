// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{
    internal class EditorSettings : EditorSettingsBase
    {
        new public static class Enum
        {
            public enum MeshSaveFormat { UnityMesh, FBX }
            public enum IndexFormat { _16Bits, _32Bits }
            public enum MeshCombine { Nothing, Submeshes, FullHierarchy }
            public enum AssetSaveType { Prefab, MeshOnly, OverwriteOriginalMesh }
            public enum MaterialType { UseOriginal, CreateNew, CreateDuplicates }
        }

        static GUIContent guiContentPrefabFlags = new GUIContent(EditorResources.IconHierarchy, "Replace flag for all child GameObjects.");

        static public string defaultShaderName
        {
            get
            {
                switch (Utilities.GetCurrentRenderPipeline())
                {
                    case WireframeShader.Enum.RenderPipeline.Universal: return "Amazing Assets/Wireframe Shader/Standard";
                    case WireframeShader.Enum.RenderPipeline.HighDefinition: return "Amazing Assets/Wireframe Shader/Standard";

                    default: return "Amazing Assets/Wireframe Shader/Physically Based";
                }
            }
        }



        #region Settings
        public bool normalizeEdges = true;
        public bool tryQuad = false;

        public Enum.MeshCombine meshCombine = Enum.MeshCombine.Nothing;
        public Enum.IndexFormat combineMeshIndexFormat = Enum.IndexFormat._16Bits;
        public Enum.AssetSaveType assetSaveType = Enum.AssetSaveType.Prefab;
        public bool replaceMeshColliders = false;
        public Enum.MaterialType materialType = Enum.MaterialType.CreateNew;
        public Shader defaultShader = Shader.Find(defaultShaderName);

        public bool useStaticFlags = false;
        public bool useStaticFlagsForHierarchy = true;
        public StaticEditorFlags staticEditorFlags = 0;
        public bool useTag = false;
        public bool useTagForHierarchy = true;
        public string tag = string.Empty;
        public bool useLayer = false;
        public bool useLayerForHierarchy = true;
        public int layer;

        public Enum.MeshSaveFormat meshSaveFormat = Enum.MeshSaveFormat.UnityMesh;
        public ModelImporterMeshCompression meshCompression = ModelImporterMeshCompression.Low;
        public bool useMeshOptimizeDefaultFlags = true;
        public MeshComponentsPopup.Flags meshOptimizeFlags = (MeshComponentsPopup.Flags)~0;
        #endregion

        #region Tabs
        public bool drawTabBake = true;
        public bool drawTabGenerate = true;
        public bool drawTabSave = true;
        #endregion


        public EditorSettings()
            : base()
        {

        }
        public override string GetEditorPreferencesName()
        {
            return "MeshCreator";
        }
        protected override void DrawCustomSettings(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4)
        {
            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;


            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                drawTabBake = EditorGUILayout.Foldout(drawTabBake, "Settings", false, EditorResources.GUIStyleFoldoutBold);

                if (drawTabBake)
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {

                        EditorGUILayout.LabelField("Wireframe Style");

                        Rect rect = GUILayoutUtility.GetLastRect();
                        collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                        collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

                        normalizeEdges = EditorGUIHelper.ToggleAsButton(collumnRect2, normalizeEdges, "Normalize Edges");
                        tryQuad = EditorGUIHelper.ToggleAsButton(collumnRect3, tryQuad, "Try Quad");
                    }
                }
            }


            DrawAdditionalSettings(collumnRect1, collumnRect2, collumnRect3, collumnRect4);
        }
        void DrawAdditionalSettings(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4)
        {
            GUILayout.Space(5);
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                drawTabGenerate = EditorGUILayout.Foldout(drawTabGenerate, "Generate", false, EditorResources.GUIStyleFoldoutBold);

                if (drawTabGenerate)
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {
                        Rect rect = EditorGUILayout.GetControlRect();
                        collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                        collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;


                        using (new EditorGUIHelper.GUIBackgroundColor(assetSaveType == Enum.AssetSaveType.OverwriteOriginalMesh ? Color.yellow : Color.white))
                        {
                            assetSaveType = (Enum.AssetSaveType)EditorGUI.EnumPopup(new Rect(collumnRect1.xMin, collumnRect1.yMin, 120, collumnRect1.height), assetSaveType, EditorStyles.toolbarPopup);
                        }

                        if (assetSaveType == Enum.AssetSaveType.OverwriteOriginalMesh)
                        {
                            GUI.DrawTexture(new Rect(collumnRect2.xMin, collumnRect2.yMin, 20, 20), EditorResources.IconError);

                            EditorGUI.LabelField(new Rect(collumnRect2.xMin + 20, collumnRect2.yMin, (collumnRect4.xMax - collumnRect2.xMin), collumnRect2.height), "Only mesh files in .asset format will be overwritten and it cannot be Undo.");
                        }

                        if (assetSaveType == Enum.AssetSaveType.Prefab || assetSaveType == Enum.AssetSaveType.MeshOnly)
                        {
                            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                            {
                                meshCombine = (Enum.MeshCombine)EditorGUI.EnumPopup(collumnRect2, "Combine", meshCombine);
                            }

                            if (meshCombine == Enum.MeshCombine.FullHierarchy)
                            {
                                using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                                {
                                    combineMeshIndexFormat = (Enum.IndexFormat)EditorGUI.EnumPopup(collumnRect3, "Mesh Index", combineMeshIndexFormat);
                                }
                            }
                        }

                        if (assetSaveType == Enum.AssetSaveType.Prefab)
                        {
                            using (new EditorGUIHelper.GUIEnabled(assetSaveType == Enum.AssetSaveType.Prefab))
                            {
                                if (meshCombine == Enum.MeshCombine.FullHierarchy)
                                    replaceMeshColliders = EditorGUIHelper.ToggleAsButton(collumnRect4, replaceMeshColliders, "Add Mesh Collider");
                                else
                                    replaceMeshColliders = EditorGUIHelper.ToggleAsButton(collumnRect4, replaceMeshColliders, "Replace Mesh Colliders");
                            }



                            rect = EditorGUILayout.GetControlRect();
                            collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                            collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;


                            if (meshCombine == Enum.MeshCombine.Nothing || meshCombine == Enum.MeshCombine.Submeshes)
                            {
                                using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                                {
                                    materialType = (Enum.MaterialType)EditorGUI.EnumPopup(collumnRect2, "Material", materialType);
                                }

                                if (materialType == Enum.MaterialType.CreateNew || materialType == Enum.MaterialType.CreateDuplicates)
                                {
                                    using (new EditorGUIHelper.GUIBackgroundColor(defaultShader == null ? Color.red : Color.white))
                                    {
                                        defaultShader = (Shader)EditorGUI.ObjectField(new Rect(collumnRect3.xMin, collumnRect3.yMin, collumnRect3.width - 30, collumnRect3.height), defaultShader, typeof(Shader), true);
                                    }

                                    if (GUI.Button(new Rect(collumnRect3.xMin + (collumnRect3.width - 25), collumnRect3.yMin, 25, collumnRect3.height), "..."))
                                    {
                                        ShaderSelectionDropdown shaderSelection = new ShaderSelectionDropdown(CallbackWireframeShaderSelection);
                                        shaderSelection.Show(collumnRect3);
                                    }
                                }
                            }
                            else
                            {
                                using (new EditorGUIHelper.GUIEnabled(false))
                                {
                                    using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                                    {
                                        EditorGUI.LabelField(collumnRect2, "Material", "Create New", EditorStyles.popup);
                                    }
                                }

                                using (new EditorGUIHelper.GUIBackgroundColor(defaultShader == null ? Color.red : Color.white))
                                {
                                    defaultShader = (Shader)EditorGUI.ObjectField(new Rect(collumnRect3.xMin, collumnRect3.yMin, collumnRect3.width - 30, collumnRect3.height), defaultShader, typeof(Shader), true);
                                }

                                if (GUI.Button(new Rect(collumnRect3.xMin + (collumnRect3.width - 25), collumnRect3.yMin, 25, collumnRect3.height), "..."))
                                {
                                    ShaderSelectionDropdown shaderSelection = new ShaderSelectionDropdown(CallbackWireframeShaderSelection);
                                    shaderSelection.Show(collumnRect3);
                                }
                            }
                        }
                    }
                }
            }

            GUILayout.Space(5);
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                drawTabSave = EditorGUILayout.Foldout(drawTabSave, "Save", false, EditorResources.GUIStyleFoldoutBold);

                if (drawTabSave)
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {
                        Rect rect = EditorGUILayout.GetControlRect();
                        collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                        collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

                        EditorGUI.LabelField(collumnRect1, "Mesh");
                        using (new EditorGUIHelper.GUIEnabled(false))
                        {
                            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                            {
                                EditorGUI.LabelField(collumnRect2, "Format", "Unity Mesh", EditorStyles.popup);
                            }
                        }


                        meshCompression = (ModelImporterMeshCompression)EditorGUI.EnumPopup(collumnRect3, string.Empty, meshCompression, GUIStyle.none);
                        EditorGUI.LabelField(collumnRect3, "Compression:  " + meshCompression.ToString(), EditorStyles.popup);



                        EditorGUI.LabelField(collumnRect4, "Components");
                        {
                            string buttonName = useMeshOptimizeDefaultFlags ? "Default" : MeshComponentsPopup.GetLabelName(meshOptimizeFlags);

                            if (GUI.Button(new Rect(collumnRect4.xMin + 77, collumnRect4.yMin, collumnRect4.width - 77, collumnRect4.height), buttonName, EditorStyles.popup))
                            {
                                PopupWindow.Show(new Rect(collumnRect4.xMin + 77, collumnRect4.yMin, collumnRect4.width - 77, collumnRect4.height), new MeshComponentsPopup());
                            }
                        }


                        if (assetSaveType == Enum.AssetSaveType.Prefab)
                        {
                            rect = EditorGUILayout.GetControlRect();
                            collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                            collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

                            EditorGUI.LabelField(collumnRect1, "Prefab Flags");
                            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                            {
                                useStaticFlags = EditorGUI.ToggleLeft(new Rect(collumnRect2.xMin, collumnRect2.yMin, 55, collumnRect2.height), "Static", useStaticFlags);
                                using (new EditorGUIHelper.GUIEnabled(useStaticFlags))
                                {
                                    staticEditorFlags = (StaticEditorFlags)EditorGUI.EnumFlagsField(new Rect(collumnRect2.xMin, collumnRect2.yMin, collumnRect2.width - (useStaticFlags ? 30 : 0), collumnRect2.height), " ", staticEditorFlags);

                                    if (useStaticFlags)
                                    {
                                        using (new EditorGUIHelper.GUIBackgroundColor(EditorGUIHelper.GetToggleButtonColor(useStaticFlagsForHierarchy)))
                                        {
                                            useStaticFlagsForHierarchy = GUI.Toggle(new Rect(collumnRect2.xMin + (collumnRect2.width - 25), collumnRect2.yMin, 25, collumnRect2.height), useStaticFlagsForHierarchy, guiContentPrefabFlags, "Button");
                                        }
                                    }
                                }


                                useTag = EditorGUI.ToggleLeft(new Rect(collumnRect3.xMin, collumnRect3.yMin, 60, collumnRect3.height), "Tag", useTag);
                                using (new EditorGUIHelper.GUIEnabled(useTag))
                                {
                                    tag = EditorGUI.TagField(new Rect(collumnRect3.xMin, collumnRect3.yMin, collumnRect3.width - (useTag ? 30 : 0), collumnRect3.height), " ", tag);

                                    if (useTag)
                                    {
                                        using (new EditorGUIHelper.GUIBackgroundColor(EditorGUIHelper.GetToggleButtonColor(useTagForHierarchy)))
                                        {
                                            useTagForHierarchy = GUI.Toggle(new Rect(collumnRect3.xMin + (collumnRect3.width - 25), collumnRect3.yMin, 25, collumnRect3.height), useTagForHierarchy, guiContentPrefabFlags, "Button");
                                        }
                                    }
                                }


                                useLayer = EditorGUI.ToggleLeft(new Rect(collumnRect4.xMin, collumnRect4.yMin, 60, collumnRect4.height), "Layer", useLayer);
                                using (new EditorGUIHelper.GUIEnabled(useLayer))
                                {
                                    layer = EditorGUI.LayerField(new Rect(collumnRect4.xMin, collumnRect4.yMin, collumnRect4.width - (useLayer ? 30 : 0), collumnRect4.height), " ", layer);

                                    if (useLayer)
                                    {
                                        using (new EditorGUIHelper.GUIBackgroundColor(EditorGUIHelper.GetToggleButtonColor(useLayerForHierarchy)))
                                        {
                                            useLayerForHierarchy = GUI.Toggle(new Rect(collumnRect4.xMin + (collumnRect4.width - 25), collumnRect4.yMin, 25, collumnRect4.height), useLayerForHierarchy, guiContentPrefabFlags, "Button");
                                        }
                                    }
                                }
                            }
                        }


                        if (assetSaveType == Enum.AssetSaveType.Prefab || assetSaveType == Enum.AssetSaveType.MeshOnly)
                        {
                            EditorSettingsBase.Enum.SaveLocation previousSaveLocation = saveLocation;
                            EditorSettingsBase.Enum.UseSourceObjectName previousUseParentAsset = useSourceObjectName;
                            bool previousSaveFolderStructure = saveFolderStructure;


                            DrawSaveOptions(collumnRect1, collumnRect2, collumnRect3, collumnRect4, 75);


                            //Check for overwrite conflict
                            if ((previousSaveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder || saveLocation == EditorSettingsBase.Enum.SaveLocation.CustomFolder) &&
                                (previousSaveLocation != saveLocation || previousUseParentAsset != useSourceObjectName || previousSaveFolderStructure != saveFolderStructure))
                            {
                                EditorWindow.active.UpdateBatchObjectsSavePath();
                            }
                        }
                    }
                }
            }
        }


        public override void Reset()
        {
            base.Reset();

            normalizeEdges = true;
            tryQuad = false;


            /////
            meshCombine = Enum.MeshCombine.Nothing;
            combineMeshIndexFormat = Enum.IndexFormat._16Bits;
            assetSaveType = Enum.AssetSaveType.Prefab;
            replaceMeshColliders = false;
            materialType = Enum.MaterialType.CreateNew;
            defaultShader = Shader.Find(defaultShaderName);

            useStaticFlags = false;
            useStaticFlagsForHierarchy = true;
            staticEditorFlags = 0;
            useTag = false;
            useTagForHierarchy = true;
            tag = "Untagged";
            useLayer = false;
            useLayerForHierarchy = true;
            layer = 0;


            meshSaveFormat = Enum.MeshSaveFormat.UnityMesh;
            meshCompression = ModelImporterMeshCompression.Low;
            useMeshOptimizeDefaultFlags = true;
            meshOptimizeFlags = (MeshComponentsPopup.Flags)~0;
        }
        public override void LoadEditorData()
        {
            base.LoadEditorData();

            if (defaultShader == null || defaultShader.GetType().Equals(typeof(Shader)) == false)
                defaultShader = Shader.Find(defaultShaderName);
            else
            {
                int ID = defaultShader.GetInstanceID();
                defaultShader = UnityEditor.EditorUtility.InstanceIDToObject(ID) as Shader;

                if (defaultShader == null)
                    defaultShader = Shader.Find(defaultShaderName);
            }
        }
        override public bool IsReady()
        {
            if (assetSaveType != Enum.AssetSaveType.OverwriteOriginalMesh)
                if (base.IsReady() == false)
                    return false;

            if (assetSaveType == Enum.AssetSaveType.Prefab)
            {
                if ((meshCombine == Enum.MeshCombine.Nothing || meshCombine == Enum.MeshCombine.Submeshes) &&
                   ((materialType == Enum.MaterialType.CreateNew || materialType == Enum.MaterialType.CreateDuplicates) && defaultShader == null))
                    return false;

                if (meshCombine == Enum.MeshCombine.FullHierarchy && defaultShader == null)
                    return false;
            }


            return true;
        }


        void CallbackWireframeShaderSelection(object obj)
        {
            if (obj == null)
                return;

            string shaderName = obj.ToString();
            if (string.IsNullOrEmpty(shaderName))
                return;

            defaultShader = Shader.Find(shaderName);
        }
    }
}
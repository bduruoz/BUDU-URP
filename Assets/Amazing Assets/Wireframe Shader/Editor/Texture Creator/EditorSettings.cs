// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.TextureCreator
{
    internal class EditorSettings : EditorSettingsBase
    {
        new public static class Enum
        {
            public enum RenderMode { UseGeometryShader, ReadWireframeFromMesh }
            public enum SaveFileFormat { JPG, PNG, TGA }
            public enum SaveFileResolution { _16, _32, _64, _128, _256, _512, _1024, _2048, _4096, _8192 }      
        }

        #region Settings
         public Enum.RenderMode renderMode = Enum.RenderMode.UseGeometryShader;
         public bool normalizeEdges = true;
         public bool tryQuad = false;
         public float thickness = 0;
         public float smoothness = 0;

         public Enum.SaveFileResolution saveFileResolution = Enum.SaveFileResolution._1024;
         public Enum.SaveFileFormat saveFileFormat = Enum.SaveFileFormat.PNG;
         public bool combineSubmesh = false;
        #endregion

        #region Tabs
         public bool drawTabSettings = true;
         public bool drawTabPreview = false;
         public bool drawTabSave = true;
        #endregion         

        #region PreviewTexture
         public int previewRectSize = 200;
        static public Rect previewTextureDrawRect;
        static Texture2D[] previewTextures;
        static Texture2D previewTextureCombined;       
        int previewTexturesIndex = 0;
        bool previewCombine;
        #endregion

        public EditorSettings()
            : base()
        {

        }
        public override string GetEditorPreferencesName()
        {
            return "TextureCreator";
        }

        protected override void DrawCustomSettings(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4)
        {
            GUILayout.Space(5);
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                drawTabSettings = EditorGUILayout.Foldout(drawTabSettings, "Settings", false, EditorResources.GUIStyleFoldoutBold);

                if (drawTabSettings)
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {
                        Rect rect = EditorGUILayout.GetControlRect();
                        collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                        collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;


                        EditorGUI.BeginChangeCheck();
                        {
                            EditorGUI.LabelField(collumnRect1, "Render Mode");
                            renderMode = (Enum.RenderMode)EditorGUI.EnumPopup(collumnRect2, renderMode);

                            using (new EditorGUIHelper.GUIEnabled(renderMode == Enum.RenderMode.UseGeometryShader))
                            {
                                normalizeEdges = EditorGUIHelper.ToggleAsButton(collumnRect3, normalizeEdges, "Normalized Edges");
                                tryQuad = EditorGUIHelper.ToggleAsButton(collumnRect4, tryQuad, "Try Quad");
                            }


                            rect = EditorGUILayout.GetControlRect();
                            collumnRect1.yMin = collumnRect2.yMin = collumnRect3.yMin = collumnRect4.yMin = rect.yMin;
                            collumnRect1.height = collumnRect2.height = collumnRect3.height = collumnRect4.height = rect.height;

                            using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                            {
                                thickness = EditorGUI.Slider(collumnRect2, "Thickness", thickness, 0, 1);
                                smoothness = EditorGUI.Slider(collumnRect3, "Smoothness", smoothness, 0, 1);
                            }
                        }
                        if(EditorGUI.EndChangeCheck())
                        {
                            RenderPreviewTextures();
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




                        EditorGUI.LabelField(collumnRect1, "Resolution");
                        using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(75))
                        {
                            float enumRectWidth = UnityEditor.EditorGUIUtility.fieldWidth;

                            int value = (int)saveFileResolution;
                            EditorGUI.BeginChangeCheck();
                            value = (int)GUI.HorizontalSlider(new Rect(collumnRect2.xMin, collumnRect2.yMin, collumnRect2.width - enumRectWidth - 5, collumnRect2.height), value, 0, 9);
                            if (EditorGUI.EndChangeCheck())
                            {
                                saveFileResolution = (Enum.SaveFileResolution)value;
                            }

                            saveFileResolution = (Enum.SaveFileResolution)EditorGUI.EnumPopup(new Rect(collumnRect2.xMax - enumRectWidth, collumnRect2.yMin, enumRectWidth, collumnRect2.height), saveFileResolution);


                            saveFileResolution = (Enum.SaveFileResolution)EditorGUI.EnumPopup(new Rect(collumnRect2.xMax - 50, collumnRect2.yMin, 50, collumnRect2.height), saveFileResolution);


                            saveFileFormat = (Enum.SaveFileFormat)EditorGUI.EnumPopup(collumnRect3, "Format", saveFileFormat);

                            combineSubmesh = EditorGUIHelper.ToggleAsButton(collumnRect4, combineSubmesh, "Combine Submeshes");
                        }



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

            GUILayout.Space(5);
            using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
            {
                if (EditorWindow.active.listBatchObjects == null || EditorWindow.active.listBatchObjects.Count == 0)
                {
                    using (new EditorGUIHelper.GUIEnabled(false))
                    {
                        EditorGUILayout.Foldout(false, "Preview", false, EditorResources.GUIStyleFoldoutBold);
                    }
                }
                else
                {
                    drawTabPreview = EditorGUILayout.Foldout(drawTabPreview, "Preview", false, EditorResources.GUIStyleFoldoutBold);

                    if (drawTabPreview)
                    {
                        using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                        {
                            DrawPreview(collumnRect1, collumnRect2, collumnRect3, collumnRect4);
                        }
                    }
                }
            }            
        }
        public void DrawPreview(Rect collumnRect1, Rect collumnRect2, Rect collumnRect3, Rect collumnRect4)
        {
            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;


            if (previewRectSize < 100) previewRectSize = 100;
            Rect rect = EditorGUILayout.GetControlRect(false, previewRectSize);



            if (listBatchObjects != null && listBatchObjects.Count > 0 &&
                EditorWindow.active.selectedBatchObjectIndex >= 0 && EditorWindow.active.selectedBatchObjectIndex < listBatchObjects.Count &&
                listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh != null &&
                previewTextures == null)
            {
                RenderPreviewTextures();
            }


            if (listBatchObjects == null || listBatchObjects.Count == 0 || EditorWindow.active.selectedBatchObjectIndex == -1 || EditorWindow.active.selectedBatchObjectIndex >= listBatchObjects.Count ||
                (EditorWindow.active.selectedBatchObjectIndex >= 0 && EditorWindow.active.selectedBatchObjectIndex < listBatchObjects.Count && listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh == null))
            {
                DestroyPreviewTextures();
            }


            bool isPreviewValid = (previewTextures != null && previewTextures.Length > 0);


            //if (previewTextures != null && previewTextures.Length > 0)
            {
                collumnRect1.y = rect.y + 5;
                collumnRect2.y = rect.y + 5;
                collumnRect3.y = rect.y + 5;
                Rect rectSubmesh = new Rect(collumnRect4.xMin, rect.yMin + 5, collumnRect4.width - (isPreviewValid && previewTextures.Length > 1 ? 26 : 0), 18);



                using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(80))
                {
                    EditorGUI.LabelField(collumnRect3, "Preview Size");
                    previewRectSize = (int)GUI.HorizontalSlider(new Rect(collumnRect3.xMin + 80, collumnRect3.yMin, collumnRect3.width - 80, collumnRect3.height), previewRectSize, 100, 800);
                }

                if (isPreviewValid && previewTextures.Length > 1)
                {
                    using (new EditorGUIHelper.GUIEnabled(previewCombine ? false : true))
                    {
                        using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(65))
                        {
                            using (new EditorGUIHelper.EditorGUIUtilityFieldWidth(25))
                            {
                                previewTexturesIndex = EditorGUI.IntSlider(rectSubmesh, "  Submesh", previewTexturesIndex, 0, previewTextures.Length - 1);
                            }
                        }
                    }

                    previewCombine = GUI.Toggle(new Rect(rectSubmesh.xMax + 2, rectSubmesh.yMin, 25, rectSubmesh.height), previewCombine, new GUIContent("∑", "Combine Submeshes"), "Button");
                }
                else
                {
                    using (new EditorGUIHelper.GUIEnabled(false))
                    {
                        using (new EditorGUIHelper.EditorGUIUtilityLabelWidth(65))
                        {
                            EditorGUI.IntSlider(rectSubmesh, "  Submesh", 0, 0, 1);
                        }
                    }
                }


                previewTextureDrawRect = new Rect(collumnRect1.xMin, rect.yMin + 30, collumnRect4.xMax - collumnRect1.xMin, rect.height - 35);

                if (previewTextureDrawRect.width > previewTextureDrawRect.height)
                    previewTextureDrawRect.width = previewTextureDrawRect.height;
                else if (previewTextureDrawRect.height > previewTextureDrawRect.width)
                    previewTextureDrawRect.height = previewTextureDrawRect.width;

                previewTextureDrawRect.x += (collumnRect4.xMax - collumnRect1.xMin) / 2 - previewTextureDrawRect.width / 2;

                if (isPreviewValid)
                {
                    //Draw preview texture
                    if (previewTextures.Length > 1 && previewCombine)
                    {
                        EditorGUI.DrawPreviewTexture(previewTextureDrawRect, previewTextureCombined);
                    }
                    else
                    {
                        previewTexturesIndex = Mathf.Clamp(previewTexturesIndex, 0, previewTextures.Length - 1);

                        if (previewTextures[previewTexturesIndex] != null)
                        {
                            EditorGUI.DrawPreviewTexture(previewTextureDrawRect, previewTextures[previewTexturesIndex]);
                        }
                    }
                }
                else
                {
                    EditorGUI.DrawTextureTransparent(previewTextureDrawRect, Texture2D.blackTexture);

                    Rect warningRect = new Rect(collumnRect1.xMin, previewTextureDrawRect.yMin + 20, 280, 40);

                    EditorGUI.DrawRect(warningRect, UnityEditor.EditorGUIUtility.isProSkin ? Color.black : Color.grey);

                    if (listBatchObjects == null || listBatchObjects.Count == 0 || EditorWindow.active.selectedBatchObjectIndex == -1 || EditorWindow.active.selectedBatchObjectIndex >= listBatchObjects.Count)
                    {
                        EditorGUI.HelpBox(warningRect, "Select mesh from the list below to see its wireframe.", MessageType.Warning);
                    }
                    else if (previewTextures == null)
                    {
                        EditorGUI.HelpBox(warningRect, "Selected mesh has no uv0 or baked wireframe.", MessageType.Error);
                    }
                }
            }
        }

        public override void Reset()
        {
            base.Reset();

            renderMode = Enum.RenderMode.UseGeometryShader;
            normalizeEdges = true;
            tryQuad = false;
            thickness = 0f;
            smoothness = 0;


            saveFileFormat = Enum.SaveFileFormat.PNG;
            saveFileResolution = Enum.SaveFileResolution._1024;
            combineSubmesh = false;
        }
        override public bool IsReady()
        {
            return base.IsReady();
        }

        public void RenderPreviewTextures()
        {
            DestroyPreviewTextures();

            List<BatchObject> listBatchObjects = EditorWindow.active.listBatchObjects;


            if (listBatchObjects != null && listBatchObjects.Count > 0 &&
               EditorWindow.active.selectedBatchObjectIndex >= 0 && EditorWindow.active.selectedBatchObjectIndex < listBatchObjects.Count &&
               listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh != null &&
               listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh.vertexCount > 3 &&
               listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].hasUV0 &&
               (EditorWindow.active.editorSettings.renderMode == Enum.RenderMode.UseGeometryShader || (EditorWindow.active.editorSettings.renderMode == Enum.RenderMode.ReadWireframeFromMesh && listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].hasBakedWireframe)))
            {
                previewTextures = new Texture2D[listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh.subMeshCount];

                for (int i = 0; i < listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh.subMeshCount; i++)
                {
                    previewTextures[i] = listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh.GenerateWireframeTexture(renderMode == Enum.RenderMode.UseGeometryShader, i, normalizeEdges, tryQuad, thickness, smoothness, 1024);
                    previewTextures[i].filterMode = FilterMode.Bilinear;
                }

                if (previewTextures.Length > 1)
                {
                    previewTextureCombined = listBatchObjects[EditorWindow.active.selectedBatchObjectIndex].mesh.GenerateWireframeTexture(renderMode == Enum.RenderMode.UseGeometryShader, -1, normalizeEdges, tryQuad, thickness, smoothness, 1024);
                    previewTextureCombined.filterMode = FilterMode.Bilinear;
                }
            }
        }
        void DestroyPreviewTextures()
        {
            if (previewTextures != null)
            {
                for (int i = 0; i < previewTextures.Length; i++)
                {
                    if (previewTextures[i] != null)
                        GameObject.DestroyImmediate(previewTextures[i]);
                }

                previewTextures = null;
            }

            if (previewTextureCombined != null)
            {
                GameObject.DestroyImmediate(previewTextureCombined);
                previewTextureCombined = null;
            }
        }
    }
}
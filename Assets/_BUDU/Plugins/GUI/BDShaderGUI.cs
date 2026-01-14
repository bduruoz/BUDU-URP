using UnityEditor;
using UnityEngine;
using budu;

namespace budu
{
    public class BDShaderGUI : ShaderGUI
    {
        #region Misc GUI
        public static void MiscGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            BD_Misc_GUI propertyNames)
        {
            if (propertyNames.Invert != "")
            {
                MaterialProperty soInvert = ShaderGUI.FindProperty(propertyNames.Invert, properties);
                materialEditor.ShaderProperty(soInvert, "Invert");
            }
            if (propertyNames.Intensity != "")
            {
                MaterialProperty soIntensity = ShaderGUI.FindProperty(propertyNames.Intensity, properties);
                materialEditor.ShaderProperty(soIntensity, "Intensity");
            }
            if (propertyNames.Contrast != "")
            {
                MaterialProperty soContrast = ShaderGUI.FindProperty(propertyNames.Contrast, properties);
                materialEditor.ShaderProperty(soContrast, "Contrast");
            }
        }
        #endregion

        #region Scale Offset GUI
        public static void ScaleOffsetGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            BD_ScaleOffset_GUI propertyNames)
        {
            EditorGUI.indentLevel++;
            {
                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 30;
                    if (propertyNames.Tile.x != "")
                    {
                        MaterialProperty soTileX = ShaderGUI.FindProperty(propertyNames.Tile.x, properties);
                        materialEditor.FloatProperty(soTileX, "Tile X");
                    }
                    if (propertyNames.Tile.y != "")
                    {
                        MaterialProperty soTileY = ShaderGUI.FindProperty(propertyNames.Tile.y, properties);
                        materialEditor.FloatProperty(soTileY, "Tile Y");
                    }
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 30;
                    if (propertyNames.Offset.x != "")
                    {
                        MaterialProperty soOffsetX = ShaderGUI.FindProperty(propertyNames.Offset.x, properties);
                        materialEditor.FloatProperty(soOffsetX, "Offset X");
                    }
                    if (propertyNames.Offset.y != "")
                    {
                        MaterialProperty soOffsetY = ShaderGUI.FindProperty(propertyNames.Offset.y, properties);
                        materialEditor.FloatProperty(soOffsetY, "Offset Y");
                    }
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 30;
                    if (propertyNames.Speed.x != "")
                    {
                        MaterialProperty soSpeedX = ShaderGUI.FindProperty(propertyNames.Speed.x, properties);
                        materialEditor.FloatProperty(soSpeedX, "Speed X");
                    }
                    if (propertyNames.Speed.y != "")
                    {
                        MaterialProperty soSpeedY = ShaderGUI.FindProperty(propertyNames.Speed.y, properties);
                        materialEditor.FloatProperty(soSpeedY, "Speed Y");
                    }
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 30;
                    if (propertyNames.OverallSpeed != "")
                    {
                        MaterialProperty soSpeed = ShaderGUI.FindProperty(propertyNames.OverallSpeed, properties);
                        materialEditor.ShaderProperty(soSpeed, "Overall Speed");
                    }
                    if (propertyNames.RotateSpeed != "")
                    {
                        MaterialProperty soRotateSpeed = ShaderGUI.FindProperty(propertyNames.RotateSpeed, properties);
                        materialEditor.ShaderProperty(soRotateSpeed, "Rotate Speed");
                    }
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();
                if (propertyNames.Rotate != "")
                {
                    MaterialProperty soRotate = ShaderGUI.FindProperty(propertyNames.Rotate, properties);
                    materialEditor.ShaderProperty(soRotate, "Rotate");
                }
                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 30;
                    if (propertyNames.Anchor.x != "")
                    {
                        MaterialProperty soAnchorX = ShaderGUI.FindProperty(propertyNames.Anchor.x, properties);
                        materialEditor.FloatProperty(soAnchorX, "Pivot X");
                    }
                    if (propertyNames.Anchor.y != "")
                    {
                        MaterialProperty soAnchorY = ShaderGUI.FindProperty(propertyNames.Anchor.y, properties);
                        materialEditor.FloatProperty(soAnchorY, "Pivot Y");
                    }
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUI.indentLevel--;
        }
        #endregion

        #region Noise Select GUI
        public static void NoiseSelectGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            BD_NoiseTypes_GUI propertyNames)
        {
            MaterialProperty ntType = ShaderGUI.FindProperty(propertyNames.NoiseType, properties);
            materialEditor.ShaderProperty(ntType, "Noise Type");
            if ((int)ntType.floatValue > 0)
            {

                MaterialProperty ntVCell = ShaderGUI.FindProperty(propertyNames.VorCellOct, properties);
                MaterialProperty ntVCaus = ShaderGUI.FindProperty(propertyNames.VorCaustOct, properties);
                MaterialProperty ntTMap = ShaderGUI.FindProperty(propertyNames.TextureMap, properties);
                MaterialProperty ntScale = ShaderGUI.FindProperty(propertyNames.NoiseScale, properties);
                MaterialProperty ntSmooth = ShaderGUI.FindProperty(propertyNames.NoiseSmooth, properties);
                MaterialProperty ntAngle = ShaderGUI.FindProperty(propertyNames.NoiseAngle, properties);

                switch ((int)ntType.floatValue)
                {
                    case 0:
                        break;
                    case 1:
                        materialEditor.ShaderProperty(ntVCell, "Cell Octave");
                        materialEditor.ShaderProperty(ntScale, "Cell Scale");
                        materialEditor.ShaderProperty(ntAngle, "Cell Angle");
                        materialEditor.ShaderProperty(ntSmooth, "Cell Smooth");
                        break;
                    case 2:
                        materialEditor.ShaderProperty(ntVCaus, "Caustic Octave");
                        materialEditor.ShaderProperty(ntScale, "Caustic Scale");
                        materialEditor.ShaderProperty(ntAngle, "Caustic Angle");
                        break;
                    case 3:
                        // Perlin Noise
                        materialEditor.ShaderProperty(ntScale, "Perlin Scale");
                        break;
                    case 4:
                        // Texture Map
                        materialEditor.ShaderProperty(ntTMap, "Deformation Map");
                        break;
                }
            }
        }
        #endregion

        #region Shader Defaults
        public static void ShaderDefaultsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat,
            ref bool checkDef,
            ref int blendingMode,
            GUIStyle style,
            bool showWorkflow = true,
            bool showSurfaceType = true,
            bool showDepth = true,
            bool showBlendingMode = true,
            bool showClearCoat = true,
            bool showRenderFace = true,
            bool showCastShadows = true,
            bool showReceiveShadows = true,
            bool showPreserveSpecularLighting = true,
            bool showRenderQueue = true)
        {
            EditorGUILayout.BeginVertical(style);
            if (checkDef)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.Space(2);

                #region Workflow Mode
                if (showWorkflow)
                {
                    string[] workflowOptions = { "Metallic", "Specular" };
                    int workflow = targetMat.GetFloat("_WorkflowMode") == 1 ? 1 : 0;
                    workflow = EditorGUILayout.Popup("Workflow Mode", workflow, workflowOptions);
                    targetMat.SetFloat("_WorkflowMode", workflow);

                    if (workflow == 0)
                    {
                        targetMat.DisableKeyword("_SPECULAR_SETUP");
                        MaterialProperty met = FindProperty("_Metallic", properties);
                        materialEditor.ShaderProperty(met, "Metallic");
                    }
                    else
                    {
                        targetMat.EnableKeyword("_SPECULAR_SETUP");
                        MaterialProperty spcCol = FindProperty("_Specular_Color", properties);
                        materialEditor.ShaderProperty(spcCol, "Specular Color");
                    }

                    MaterialProperty smt = FindProperty("_Smoothness", properties);
                    materialEditor.ShaderProperty(smt, "Smoothness");
                }
                #endregion

                #region Surface Type + Depth
                if (showSurfaceType)
                {
                    string[] surfaceOptions = { "Opaque", "Transparent" };
                    int surfaceType = targetMat.GetFloat("_Surface") == 1 ? 1 : 0;
                    surfaceType = EditorGUILayout.Popup("Surface Type", surfaceType, surfaceOptions);
                    targetMat.SetFloat("_Surface", surfaceType);

                    if (surfaceType == 0)
                    {
                        // Opaque
                        targetMat.SetOverrideTag("RenderType", "Opaque");
                        targetMat.DisableKeyword("_SURFACE_TYPE_TRANSPARENT");
                        targetMat.SetInt("_ZTest", (int)UnityEngine.Rendering.CompareFunction.LessEqual);

                        // Opaque default: ZWrite ON
                        targetMat.SetFloat("_ZWrite", 1);
                    }
                    else
                    {
                        targetMat.SetOverrideTag("RenderType", "Transparent");
                        targetMat.SetOverrideTag("Queue", "Transparent");
                        targetMat.EnableKeyword("_SURFACE_TYPE_TRANSPARENT");
                    }
                    if (showDepth)
                    {
                        int depthWriteCtrl;
                        if (targetMat.HasProperty("_ZWriteCtrl"))
                        {
                            depthWriteCtrl = targetMat.GetInt("_ZWriteCtrl");
                        }
                        else
                        {
                            depthWriteCtrl = 0; // Auto default
                        }

                        string[] depthOptions = { "Auto", "Force Enabled", "Force Disabled" };
                        depthWriteCtrl = EditorGUILayout.Popup("Depth Write", depthWriteCtrl, depthOptions);
                        switch (depthWriteCtrl)
                        {
                            case 0: // Auto
                                targetMat.SetFloat("_ZWrite", targetMat.GetFloat("_Surface") == 0 ? 1 : 0);
                                break;
                            case 1: targetMat.SetFloat("_ZWrite", 1); break;
                            case 2: targetMat.SetFloat("_ZWrite", 0); break;
                        }

                        // Mat property varsa kaydet
                        if (targetMat.HasProperty("_ZWriteCtrl"))
                            targetMat.SetInt("_ZWriteCtrl", depthWriteCtrl);

                        // Depth Test
                        string[] depthTestOptions = { "Disabled", "Never", "Less", "Equal", "LEqual", "Greater", "NotEqual", "GEqual", "Always" };
                        int depthTest = (int)targetMat.GetFloat("_ZTest");
                        depthTest = EditorGUILayout.Popup("Depth Test", depthTest, depthTestOptions);
                        targetMat.SetFloat("_ZTest", depthTest);
                    }

                }
                #endregion

                #region Blending Modes
                if (showBlendingMode)
                {
                    MaterialProperty bmode = FindProperty("_Blending_Mode", properties);
                    string[] blendOpts = new string[] { "Alpha", "PreMultiply", "Additive", "Multiply" };
                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, bmode, "Blending Mode", blendOpts);
                    blendingMode = targetMat.GetInt("_Blending_Mode");
                    switch (blendingMode)
                    {
                        case 0:
                            targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.SrcAlpha);
                            targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                            break;
                        case 1:
                            targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                            targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                            break;
                        case 2:
                            targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                            targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.One);
                            break;
                        case 3:
                            targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.DstColor);
                            targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                            break;
                    }
                }
                #endregion

                #region Render Face
                if (showRenderFace)
                {
                    string[] faceOptions = { "Both", "Back", "Front" };
                    int face = (int)targetMat.GetFloat("_Cull");
                    face = EditorGUILayout.Popup("Render Face", face, faceOptions);
                    targetMat.SetFloat("_Cull", face);
                }
                #endregion

                #region Cast Shadows
                if (showCastShadows)
                {
                    MaterialProperty castShadows = FindProperty("_Cast_Shadows", properties);
                    materialEditor.ShaderProperty(castShadows, "Cast Shadows");
                    targetMat.SetShaderPassEnabled("SHADOWCASTER", castShadows.floatValue > 0.5f);
                }
                #endregion

                #region Receive Shadows
                if (showReceiveShadows)
                {
                    MaterialProperty receiveShadow = FindProperty("_Receive_Shadows", properties);
                    materialEditor.ShaderProperty(receiveShadow, "Receive Shadows");
                    if (receiveShadow.floatValue < 1f)
                    {
                        targetMat.EnableKeyword("_RECEIVE_SHADOWS_OFF");
                        targetMat.SetInt("_Receive_Shadows", 0); // kapalı
                    }
                    else
                    {
                        targetMat.DisableKeyword("_RECEIVE_SHADOWS_OFF");
                        targetMat.SetInt("_Receive_Shadows", 1); // açık
                    }
                }
                #endregion

                #region Preserve Specular Lighting
                if (showPreserveSpecularLighting &&
                    targetMat.HasProperty("_Preserve_Specular_Lighting") &&
                    targetMat.IsKeywordEnabled("_SPECULAR_SETUP"))
                {
                    MaterialProperty preserveSpec = FindProperty("_Preserve_Specular_Lighting", properties);
                    materialEditor.ShaderProperty(preserveSpec, "Preserve Specular Lighting");

                    if (preserveSpec.floatValue > 0.5f)
                    {
                        targetMat.EnableKeyword("_PRESERVE_SPECULAR_LIGHTING");
                        targetMat.SetInt("_Preserve_Specular_Lighting", 1);
                    }
                    else
                    {
                        targetMat.DisableKeyword("_PRESERVE_SPECULAR_LIGHTING");
                        targetMat.SetInt("_Preserve_Specular_Lighting", 0);
                    }
                }
                #endregion

                #region Clear Coat
                if (showClearCoat)
                {
                    MaterialProperty clearCoat = FindProperty("_ClearCoat", properties);
                    MaterialProperty coatMask = FindProperty("_Coat_Mask", properties);
                    MaterialProperty coatSmooth = FindProperty("_Coat_Smoothness", properties);

                    materialEditor.ShaderProperty(clearCoat, "Clear Coat");

                    if (clearCoat.floatValue > 0.0f)
                    {
                        materialEditor.ShaderProperty(coatMask, "Coat Mask");
                        materialEditor.ShaderProperty(coatSmooth, "Coat Smoothness");
                    }
                }
                #endregion

                if (showRenderQueue)
                {
                    materialEditor.RenderQueueField();
                }
                materialEditor.EnableInstancingField();
                materialEditor.DoubleSidedGIField();
                EditorGUI.indentLevel--;
            }

            EditorGUILayout.EndVertical();
            EditorGUILayout.Space(1);
        }
        #endregion
    }
}

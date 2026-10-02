// © BUDU Games 2024 - 2026
// BUDU Soft Toon Shader Editor

using budu;
using UnityEditor;
using UnityEditor.Rendering;
using UnityEngine;

public class BSoftToonEditor : ShaderGUI
{
    bool checkBase, checkDef, checkShade, checkSpec, checkNormal, checkRim, checkReflect;
    bool aboutFold, shadeExtFold, blinnFold, cubemapFold, fresnelFold, refMaskFold;
    int TextureBlendType, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);
        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUSoftToonTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Base_Map", properties);
            MaterialProperty btb = ShaderGUI.FindProperty("_TextureBlendType", properties);
            MaterialProperty btgam = ShaderGUI.FindProperty("_Base_Map_Gamma", properties);
            MaterialProperty avfe = ShaderGUI.FindProperty("_Average_Features", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");
            string[] txtBlendOpt = new string[] { "Multiply", "Additive", "Overlay" };
            ShaderGUIHelpers.EnumPopupProperty(materialEditor, btb, "Texture Blend Type", txtBlendOpt);

            if(bt.textureValue != null)
            {
                MaterialProperty btfm = ShaderGUI.FindProperty("_FilterMode", properties);
                string[] fmode = { "Point", "Bilinear", "Trilinear" };
                materialEditor.PopupShaderProperty(btfm, new GUIContent("Filter Mode"), fmode);

                switch((int)btfm.floatValue)
                {
                    case 0:
                        bt.textureValue.filterMode = FilterMode.Point;
                        break;
                    case 1:
                        bt.textureValue.filterMode = FilterMode.Bilinear;
                        break;
                    case 2:
                        bt.textureValue.filterMode = FilterMode.Trilinear;
                        break;
                }
                materialEditor.ShaderProperty(btgam, "Base Map Gamma");
            }
            materialEditor.ShaderProperty(avfe, "Average Features");
            EditorGUI.indentLevel--;
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;
            GUIExtras.NormalSettingsGUI(materialEditor, properties);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shade Settings
        GUIExtras.SHeader("SHADING SETTINGS", ref checkShade, "_CheckShade", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.ShadeColorSettingsGUI(materialEditor, properties, targetMat, nrmTog);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        GUIExtras.SHeader("SPECULAR SETTINGS", ref checkSpec, "_CheckSpecular", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.SpecularSettingsGUI(materialEditor, properties, targetMat, nrmTog);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Settings
        GUIExtras.SHeader("RIM SETTINGS", ref checkRim, "_CheckRim", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.RimSettingsGUI(materialEditor, properties, targetMat, nrmTog);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        GUIExtras.SHeader("REFLECT SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkReflect)
        {
            EditorGUILayout.Space(2);
            EditorGUI.indentLevel++;
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.ReflectionSettingsGUI(materialEditor, properties, targetMat, nrmTog);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, true, false, false, false, false, true, true, true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        checkBase = GUIExtras.GetBool(targetMat, "_CheckBase");
        checkDef = GUIExtras.GetBool(targetMat, "_CheckDef");
        checkShade = GUIExtras.GetBool(targetMat, "_CheckShade");
        shadeExtFold = GUIExtras.GetBool(targetMat, "_ShadeExtFold");
        checkSpec = GUIExtras.GetBool(targetMat, "_CheckSpecular");
        blinnFold = GUIExtras.GetBool(targetMat, "_blinnFold");
        checkNormal = GUIExtras.GetBool(targetMat, "_CheckNormal");
        checkRim = GUIExtras.GetBool(targetMat, "_CheckRim");
        checkReflect = GUIExtras.GetBool(targetMat, "_CheckReflect");
        cubemapFold = GUIExtras.GetBool(targetMat, "_CubemapFold");
        fresnelFold = GUIExtras.GetBool(targetMat, "_FresnelFold");
        refMaskFold = GUIExtras.GetBool(targetMat, "_RefMaskFold");

        TextureBlendType = targetMat.GetInt("_TextureBlendType");
    }
}

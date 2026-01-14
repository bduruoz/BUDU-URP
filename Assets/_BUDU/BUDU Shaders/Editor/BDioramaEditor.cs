// BUDU Games 2023 - 2025
using UnityEditor;
using UnityEngine;
using budu;

public class BDioramaEditor : ShaderGUI
{
    bool checkBase, checkDef, checkEmis, checkNormal, checkAlpha;
    bool aboutFold, alphaClip;
    int tempVar, blendingMode, isSpecular;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Diorama Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUDiorama.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS",ref checkBase,"_CheckBase",targetMat,style);

        EditorGUILayout.BeginVertical(style);
        if (checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty baseCol = ShaderGUI.FindProperty("_Base_Color",properties);
            MaterialProperty baseTxt = ShaderGUI.FindProperty("_Base_Texture", properties);
            MaterialProperty ambCol = ShaderGUI.FindProperty("_Ambient_Color", properties);

            materialEditor.ShaderProperty(baseCol, "Base Color");
            materialEditor.ShaderProperty(baseTxt, "Base Texture");
            materialEditor.ShaderProperty(ambCol, "Ambient Color");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Alpha Settings
        GUIExtras.SHeader("ALPHA SETTINGS", ref checkAlpha, "_CheckAlpha", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAlpha)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty alpha = ShaderGUI.FindProperty("_Alpha", properties);
            MaterialProperty AlphaClip = ShaderGUI.FindProperty("_Alpha_Clip", properties);

            materialEditor.ShaderProperty(alpha, "Alpha");
            materialEditor.ShaderProperty(AlphaClip, "Alpha Clip");
            if(AlphaClip.floatValue > 0.0f)
            {
                MaterialProperty actresh = ShaderGUI.FindProperty("_Alpha_Clip_Threshold", properties);
                materialEditor.ShaderProperty(actresh, "Alpha Clip Threshold");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty norm = ShaderGUI.FindProperty("_Normal", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(norm, "Normal");
            }, GUILayout.Height(20));
            if (norm.floatValue > 0f)
            {
                MaterialProperty normMap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty normStr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty normMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);
                materialEditor.ShaderProperty(normMap, "Normal Map");
                materialEditor.ShaderProperty(normStr, "Normal Strength");
                materialEditor.ShaderProperty(normMult, "Normal Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Emission Settings
        GUIExtras.SHeader("EMISSION SETTINGS",ref checkEmis,"_CheckEmis",targetMat,style);

        EditorGUILayout.BeginVertical(style);
        if (checkEmis)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty emis = ShaderGUI.FindProperty("_Emission", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(emis, "Emission");
            }, GUILayout.Height(20));
            if (emis.floatValue > 0f)
            {
                MaterialProperty emisCol = ShaderGUI.FindProperty("_Emission_Color", properties);
                materialEditor.ShaderProperty(emisCol, "Emission Color");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, false, true, true, true, false, true, true, true, false, true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckEmis");
        checkEmis = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAlpha");
        checkAlpha = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Alpha_Clip");
        alphaClip = tempVar == 1 ? true : false;

        if(alphaClip)
        {
            targetMat.EnableKeyword("_ALPHATEST_ON");
        }
        else
        {
            targetMat.DisableKeyword("_ALPHATEST_ON");
        }
    }
}



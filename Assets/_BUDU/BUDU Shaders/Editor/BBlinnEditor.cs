// © BUDU Games 2024 - 2026
// BUDU Blinn Shader Editor

using UnityEngine;
using UnityEditor;
using budu;

public class BBlinnEditor : ShaderGUI
{
    bool checkBase, checkDef, checkNormal, checkSpec, checkReflect;
    bool aboutFold, blinnFold;
    int blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Blinn Shader
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUBlinn.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            GUIExtras.BaseSettingsGUI(materialEditor, properties);
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
            GUIExtras.NormalSettingsGUI(materialEditor, properties);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Specular Settings
        GUIExtras.SHeader("SPECULAR SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkSpec)
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

        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            false,
            false,
            false,
            false,
            false,
            true,
            true,
            true,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        checkBase = GUIExtras.GetBool(targetMat, "_CheckBase");
        checkDef = GUIExtras.GetBool(targetMat, "_CheckDef");
        blinnFold = GUIExtras.GetBool(targetMat, "_blinnFold");
        checkNormal = GUIExtras.GetBool(targetMat, "_CheckNormal");
        checkSpec = GUIExtras.GetBool(targetMat, "_CheckSpec");
        checkReflect = GUIExtras.GetBool(targetMat, "_CheckReflect");
    }
}



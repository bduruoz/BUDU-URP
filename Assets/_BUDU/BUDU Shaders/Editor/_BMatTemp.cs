// © BUDU Games 2024 - 2026
// BUDU Template Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class _BMatTemp : ShaderGUI
{
    bool checkBase, checkDef;
    bool aboutFold;
    int tempVar, blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU ___ Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDU___.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);



            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion
        
        #region - Settings
        //GUIExtras.SHeader("SETTINGS", ref check -, "_Check-", targetMat, style);

        //EditorGUILayout.BeginVertical(style);
        //if (check -)
        //{
        //    EditorGUI.indentLevel++;
        //    EditorGUILayout.Space(2);



        //    EditorGUI.indentLevel--;
        //}
        //EditorGUILayout.EndVertical();
        //EditorGUILayout.Space(1);
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
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;
    }
}



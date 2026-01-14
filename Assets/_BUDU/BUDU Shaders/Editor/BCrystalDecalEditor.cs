// BUDU Games 2023 - 2025
using budu;
using UnityEditor;
using UnityEngine;

public class BCrystalDecalEditor : ShaderGUI
{
    bool checkBase, checkDef;
    bool aboutFold;
    int tempVar, blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Crystal Decal Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUCrystalDecal.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty col = ShaderGUI.FindProperty("_Color", properties);
            MaterialProperty emI = ShaderGUI.FindProperty("_Emissive_Intensity", properties);
            MaterialProperty opFX = ShaderGUI.FindProperty("_Optix_FX", properties);
            MaterialProperty rotSA = ShaderGUI.FindProperty("_Rotate_Speed_A", properties);
            MaterialProperty rotSB = ShaderGUI.FindProperty("_Rotate_Speed_B", properties);
            MaterialProperty GloAS = ShaderGUI.FindProperty("_Glow_Anim_Speed", properties);
            MaterialProperty GloAI = ShaderGUI.FindProperty("_Glow_Anim_Intensity", properties);
            MaterialProperty FXInt = ShaderGUI.FindProperty("_Effect_Intensity", properties);

            materialEditor.ShaderProperty(col, "Color");
            materialEditor.ShaderProperty(emI, "Emissive Intensity");
            materialEditor.ShaderProperty(opFX, "Optix FX");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, rotSA, "Rotate Speed A", -10, 10);
            ShaderGUIHelpers.FloatSliderFree(materialEditor, rotSB, "Rotate Speed B", -10, 10);
            materialEditor.ShaderProperty(GloAS, "Glow Anim Speed");
            materialEditor.ShaderProperty(GloAI, "Glow Anim Intensity");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, FXInt, "Effect Intensity", 0, 10);

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
            false,
            false,
            false,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
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



// BUDU Games 2023 - 2025
using UnityEngine;
using UnityEditor;
using budu;

public class BBlinnEditor : ShaderGUI
{
    bool checkBase, checkDef, checkNormal, checkSpec;
    bool aboutFold;
    int tempVar, blendingMode;
    
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

            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bch = ShaderGUI.FindProperty("_Checkerboard", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bch, "Checkerboard");

            if (bch.floatValue > 0.0f)
            {
                MaterialProperty bcColA = ShaderGUI.FindProperty("_Checker_Color_A", properties);
                MaterialProperty bcColB = ShaderGUI.FindProperty("_Checker_Color_B", properties);
                MaterialProperty bcColF = ShaderGUI.FindProperty("_Checker_Frequency", properties);

                materialEditor.ShaderProperty(bcColA, "Checker Color A");
                materialEditor.ShaderProperty(bcColB, "Checker Color B");
                ShaderGUIHelpers.Vector2Property(materialEditor, bcColF, "Checker Frequency");
            }
            else
            {
                MaterialProperty bcMap = ShaderGUI.FindProperty("_Base_Map", properties);

                materialEditor.ShaderProperty(bcMap, "Base Map");
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

            MaterialProperty ntog = ShaderGUI.FindProperty("_Normal_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(ntog, "Normal");
            }, GUILayout.Height(20));
            if (ntog.floatValue > 0)
            {
                MaterialProperty nMap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty nStr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(nMap, "Normal Map");
                materialEditor.ShaderProperty(nStr, "Normal Strength");
                materialEditor.ShaderProperty(nMult, "Normal Multiplier");
            }
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

            MaterialProperty stog = ShaderGUI.FindProperty("_Specular_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(stog, "Specular");
            }, GUILayout.Height(20));
            if (stog.floatValue > 0)
            {
                MaterialProperty sCol = ShaderGUI.FindProperty("_Specular_Color", properties);
                MaterialProperty sMap = ShaderGUI.FindProperty("_Specular_Map", properties);

                materialEditor.ShaderProperty(sCol, "Color");
                materialEditor.ShaderProperty(sMap, "Specular Map");

                if (!GUIExtras.IsTextureEmpty(sMap))
                {
                    MaterialProperty sInv = ShaderGUI.FindProperty("_Specular_Invert", properties);
                    materialEditor.ShaderProperty(sInv, "Invert");
                }

                MaterialProperty sInt = ShaderGUI.FindProperty("_Specular_Intensity", properties);
                MaterialProperty sGma = ShaderGUI.FindProperty("_Specular_Gamma", properties);
                MaterialProperty sGlos = ShaderGUI.FindProperty("_Specular_Glossy", properties);
                MaterialProperty sSoft = ShaderGUI.FindProperty("_Specular_Softness", properties);
                MaterialProperty sSat = ShaderGUI.FindProperty("_Specular_Saturation", properties);
                MaterialProperty sIn = ShaderGUI.FindProperty("_Specular_In", properties);
                MaterialProperty sOut = ShaderGUI.FindProperty("_Specular_Out", properties);
                MaterialProperty sNStr = ShaderGUI.FindProperty("_Specular_Normal_Strength", properties);
                MaterialProperty sNMult = ShaderGUI.FindProperty("_Specular_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(sInt, "Intensity");
                materialEditor.ShaderProperty(sGma, "Gamma");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, sGlos, "Glossy", 0, 5);
                materialEditor.ShaderProperty(sSoft, "Softness");
                materialEditor.ShaderProperty(sSat, "Sturation");
                materialEditor.ShaderProperty(sIn, "Specular In");
                materialEditor.ShaderProperty(sOut, "Specular Out");
                materialEditor.ShaderProperty(sNStr, "Normal Strength");
                materialEditor.ShaderProperty(sNMult, "Normal Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
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
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;
    }
}



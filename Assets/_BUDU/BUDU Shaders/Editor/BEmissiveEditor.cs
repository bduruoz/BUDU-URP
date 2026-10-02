// © BUDU Games 2024 - 2026
// BUDU Emissive Shader Editor

using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BEmissiveEditor : ShaderGUI
{
    bool checkBase, checkDef, checkAlphaClip, checkTrans, checkFresnel;
    bool checkFresnelInvert;
    bool aboutFold;
    int tempVar, tempRQ, blendingMode;
    int surfaceType = 0; // Opaque

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        LoadMaterialVariables(targetMat);
        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUEmissiveTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty baseInt = ShaderGUI.FindProperty("_Intensity",properties);
            MaterialProperty mapInv = ShaderGUI.FindProperty("_MapInvert", properties);

            materialEditor.ColorProperty(bc, "Emission Color");
            materialEditor.TextureProperty(bt, "Emission Map");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, baseInt, "Emission Intensity", 0f, 3f);
            if(!GUIExtras.IsTextureEmpty(bt))
            {
                materialEditor.ShaderProperty(mapInv, "Invert Texture");
            }
            else
            {
                targetMat.SetInt("_MapInvert", 0);
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Transparency Settings
        GUIExtras.SHeader("TRANSPARENT SETTINGS", ref checkTrans, "_CheckTrans", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkTrans)
        {
            if(surfaceType < 1.0)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.HelpBox("This shader surface type is Opaque !", MessageType.Warning);
                EditorGUI.indentLevel--;
            }
            else
            {
                EditorGUI.indentLevel++;
                MaterialProperty ttog = ShaderGUI.FindProperty("_TransparentTog", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50),20,true,() =>
                {
                    materialEditor.ShaderProperty(ttog, "Transparent");
                });
                if(ttog.floatValue > 0.0f)
                {
                    MaterialProperty alpChan = ShaderGUI.FindProperty("_ALPHACHANNEL", properties);
                    MaterialProperty alpCont = ShaderGUI.FindProperty("_AlphaContrast", properties);
                    MaterialProperty alpInvert = ShaderGUI.FindProperty("_ALPHAINVERT", properties);

                    materialEditor.ShaderProperty(alpChan, "Selected Channel");
                    materialEditor.ShaderProperty(alpCont, "Alpha Contrast");
                    materialEditor.ShaderProperty(alpInvert, "Alpha Invert");
                }
            }
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                checkAlphaClip = EditorGUILayout.Toggle("Alpha Clip", checkAlphaClip);
            });
            targetMat.SetInt("_Alpha_Clip", Convert.ToInt16(checkAlphaClip));
            targetMat.SetInt("_AlphaClip", Convert.ToInt16(checkAlphaClip));
            if(checkAlphaClip)
            {
                MaterialProperty act = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);
                materialEditor.RangeProperty(act, "Alpha Clip Threshold");

                targetMat.EnableKeyword("_ALPHATEST_ON");
            }
            else
            {
                targetMat.DisableKeyword("_ALPHATEST_ON");
            }

            EditorGUI.indentLevel--;
        }
        else
        {
            // Transparaan kapalı
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fresnel Settings
        GUIExtras.SHeader("FRESNEL SETTINGS", ref checkFresnel, "_CheckFresnel", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkFresnel)
        {
            EditorGUI.indentLevel++;
            MaterialProperty cf = ShaderGUI.FindProperty("_Fresnel", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(cf, "Fresnel");
            });
            if(cf.floatValue > 0.0f)
            {
                checkFresnelInvert = EditorGUILayout.Toggle("Fresnel Invert", checkFresnelInvert);
                targetMat.SetInt("_FresnelInvert", Convert.ToInt16(checkFresnelInvert));

                MaterialProperty gamma = ShaderGUI.FindProperty("_FGamma", properties);
                MaterialProperty cont = ShaderGUI.FindProperty("_FContrast", properties);
                MaterialProperty contp = ShaderGUI.FindProperty("_FContrast_Pivot", properties);
                MaterialProperty bias = ShaderGUI.FindProperty("_FBias", properties);
                MaterialProperty scale = ShaderGUI.FindProperty("_FScale", properties);
                MaterialProperty power = ShaderGUI.FindProperty("_FPower", properties);

                ShaderGUIHelpers.FloatSliderFree(materialEditor, gamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cont, "Contrast", 0, 5);
                materialEditor.RangeProperty(contp, "Contrast Pivot");
                materialEditor.RangeProperty(bias, "Bias");
                materialEditor.RangeProperty(scale, "Scale");
                materialEditor.RangeProperty(power, "Power");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS",ref checkDef,"_CheckDef",targetMat,style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, false, true, true, true, false,true,true,true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void LoadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.SurfaceControls(targetMat, surfaceType, checkAlphaClip, 0, ref tempRQ);
        // Workflow does not exist because it is unlit.

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true: false;

        tempVar = targetMat.GetInt("_CheckTrans");
        checkTrans = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Alpha_Clip");
        checkAlphaClip = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFresnel");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Surface");
        surfaceType = tempVar == 1 ? 1 : 0;
    }

}

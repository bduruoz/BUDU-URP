// © BUDU Games 2024 - 2026
// BUDU Liquid Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BLiquidEditor : ShaderGUI
{
    bool checkBase, checkDef, checkFresnel, checkWave, checkEdge, checkRefract, checkWobble;
    bool aboutFold, txtAFold, txtBFold;
    int tempVar, blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Liquid Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDULiquid.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty fill = ShaderGUI.FindProperty("_Fill", properties);
            materialEditor.ShaderProperty(fill, "Fill");

            EditorGUIHelper.Separator();

            MaterialProperty lCol = ShaderGUI.FindProperty("_Liquid_Color",properties);
            MaterialProperty sCol = ShaderGUI.FindProperty("_Surface_Color", properties);
            MaterialProperty Addt = ShaderGUI.FindProperty("_Addition", properties);
            materialEditor.ShaderProperty(lCol, "Liquid Color");
            materialEditor.ShaderProperty(sCol, "Surface Color");
            materialEditor.ShaderProperty(Addt, "Addition");

            MaterialProperty txtT = ShaderGUI.FindProperty("_Texture_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(txtT, "Texture");
            });
            if(txtT.floatValue > 0)
            {
                MaterialProperty Blend = ShaderGUI.FindProperty("_BLENDING", properties);
                MaterialProperty TxtDefMult = ShaderGUI.FindProperty("_Texture_Deform_Multiplier", properties);
                MaterialProperty TxtMult = ShaderGUI.FindProperty("_Texture_Multiplier", properties);
                MaterialProperty mTxtA = ShaderGUI.FindProperty("_Texture_A", properties);
                MaterialProperty TAInv = ShaderGUI.FindProperty("_TA_Invert", properties);
                MaterialProperty TASpeedX = ShaderGUI.FindProperty("_TA_Speed_X", properties);
                MaterialProperty TASpeedY = ShaderGUI.FindProperty("_TA_Speed_Y", properties);
                MaterialProperty TARot = ShaderGUI.FindProperty("_TA_Rotate", properties);
                MaterialProperty mTxtB = ShaderGUI.FindProperty("_Texture_B", properties);
                MaterialProperty TBInv = ShaderGUI.FindProperty("_TB_Invert", properties);
                MaterialProperty TBSpeedX = ShaderGUI.FindProperty("_TB_Speed_X", properties);
                MaterialProperty TBSpeedY = ShaderGUI.FindProperty("_TB_Speed_Y", properties);
                MaterialProperty TBRot = ShaderGUI.FindProperty("_TB_Rotate", properties);

                materialEditor.ShaderProperty(Blend, "Blend Textures");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, TxtMult, "Texture Multiplier", -5, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, TxtDefMult, "Texture Deform Multiplier", -50, 50);

                GUIExtras.SFoldout(targetMat, "_TxtAFold", "Layer A", BDColors.DarkRed(120), 10, BDColors.White(255), BDColors.Black(40), true, () =>
                {
                    materialEditor.ShaderProperty(mTxtA, "Texture A");
                    materialEditor.ShaderProperty(TAInv, "Invert");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, TASpeedX, "Speed X", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, TASpeedY, "Speed Y", -1, 1);
                    materialEditor.ShaderProperty(TARot, "Rotate");
                });

                GUIExtras.SFoldout(targetMat, "_TxtBFold", "Layer B", BDColors.DarkRed(160), 10, BDColors.White(255), BDColors.Black(40), true, () =>
                {
                    materialEditor.ShaderProperty(mTxtB, "Texture B");
                    materialEditor.ShaderProperty(TBInv, "Invert");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, TBSpeedX, "Speed X", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, TBSpeedY, "Speed Y", -1, 1);
                    materialEditor.ShaderProperty(TBRot, "Rotate");
                });
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fresnel Settings
        GUIExtras.SHeader("FRESNEL SETTINGS", ref checkFresnel, "_CheckFresnel", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkFresnel)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty frTog = ShaderGUI.FindProperty("_Fresnel_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(frTog, "Fresnel");
            });
            if(frTog.floatValue > 0)
            {
                MaterialProperty frCol = ShaderGUI.FindProperty("_Fresnel_Color", properties);
                MaterialProperty frInv = ShaderGUI.FindProperty("_Fresnel_Invert", properties);
                MaterialProperty frGmm = ShaderGUI.FindProperty("_Fresnel_Gamma", properties);
                MaterialProperty frScl = ShaderGUI.FindProperty("_Fresnel_Scale", properties);
                MaterialProperty frBias = ShaderGUI.FindProperty("_Fresnel_Bias", properties);
                MaterialProperty frPow = ShaderGUI.FindProperty("_Fresnel_Power", properties);
                MaterialProperty frCont = ShaderGUI.FindProperty("_Fresnel_Contrast", properties);
                MaterialProperty frContP = ShaderGUI.FindProperty("_Fresnel_Contrast_Pivot", properties);

                materialEditor.ShaderProperty(frCol, "Color");
                materialEditor.ShaderProperty(frInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(frContP, "Contrast Pivot");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frGmm, "Gamma", 0, 5);
                materialEditor.ShaderProperty(frBias, "Bias");
                materialEditor.ShaderProperty(frScl, "Scale");
                materialEditor.ShaderProperty(frPow, "Power");
            }


            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Wave Settings
        GUIExtras.SHeader("WAVE SETTINGS", ref checkWave, "_CheckWave", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkWave)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty wTog = ShaderGUI.FindProperty("_Wave_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(wTog, "Wave");
            });
            if(wTog.floatValue > 0)
            {
                MaterialProperty frqA = ShaderGUI.FindProperty("_Frequency_A", properties);
                MaterialProperty frqB = ShaderGUI.FindProperty("_Frequency_B", properties);
                MaterialProperty Amp = ShaderGUI.FindProperty("_Amplitude", properties);
                MaterialProperty Speed = ShaderGUI.FindProperty("_Wave_Speed", properties);

                ShaderGUIHelpers.FloatSliderFree(materialEditor, frqA, "Frequency A", -50, 50);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frqB, "Frequency B", -50, 50);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, Amp, "Amplitude", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, Speed, "Speed", -10, 10);
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Edge Settings
        GUIExtras.SHeader("EDGE SETTINGS", ref checkEdge, "_CheckEdge", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkEdge)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty eTog = ShaderGUI.FindProperty("_Edge_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(eTog, "Edge");
            });
            if(eTog.floatValue > 0)
            {
                MaterialProperty eCol = ShaderGUI.FindProperty("_Edge_Color", properties);
                MaterialProperty eWidth = ShaderGUI.FindProperty("_Edge_Width", properties);
                MaterialProperty eSmt = ShaderGUI.FindProperty("_Edge_Smoothness", properties);
                MaterialProperty seSmt = ShaderGUI.FindProperty("_Surface_Edge_Smoothness", properties);

                materialEditor.ShaderProperty(eCol, "Color");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, eWidth, "Width", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, eSmt, "Smoothness", -1, 1);
                materialEditor.ShaderProperty(seSmt, "Surface Smoothness");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Refract Settings
        GUIExtras.SHeader("REFRACT SETTINGS", ref checkRefract, "_CheckRefract", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkRefract)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rTog = ShaderGUI.FindProperty("_Refraction_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(rTog, "Refract");
            });
            if(rTog.floatValue > 0)
            {
                MaterialProperty rStr = ShaderGUI.FindProperty("_Refraction_Strength", properties);
                MaterialProperty tStr = ShaderGUI.FindProperty("_Transparent_Strength", properties);
                MaterialProperty rSpd = ShaderGUI.FindProperty("_Refract_Speed", properties);
                MaterialProperty rFrq = ShaderGUI.FindProperty("_Refract_Frequency", properties);
                MaterialProperty rTrS = ShaderGUI.FindProperty("_Refract_Transform_Speed", properties);
                MaterialProperty Oct = ShaderGUI.FindProperty("_Octave", properties);
                MaterialProperty NType = ShaderGUI.FindProperty("_NOISETYPE", properties);
                MaterialProperty FreqMult = ShaderGUI.FindProperty("_Frequency_Maniplator", properties);
                MaterialProperty Amp = ShaderGUI.FindProperty("_Amplifier", properties);
                MaterialProperty IOR = ShaderGUI.FindProperty("_IOR", properties);

                materialEditor.ShaderProperty(NType, "Noise Type");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, rStr, "Strength", 0, 5);
                if (NType.floatValue < 2)
                {
                    ShaderGUIHelpers.IntSlider(materialEditor, Oct, "Octave", 0, 6);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, rFrq, "Frequency", -5, 5);
                    materialEditor.ShaderProperty(FreqMult, "Frequency Maniplator");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, Amp, "Amplifier", -5, 5);
                    materialEditor.ShaderProperty(tStr, "Transparent Strength");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, rSpd, "Speed", -5, 5);
                    ShaderGUIHelpers.Vector2Property(materialEditor, rTrS, "Transform Speed");
                    materialEditor.ShaderProperty(IOR, "IOR");
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Wobble Settings
        GUIExtras.SHeader("WOBBLE SETTINGS", ref checkWobble, "_CheckWobble", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkWobble)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty wX = ShaderGUI.FindProperty("_WobbleX", properties);
            MaterialProperty wZ = ShaderGUI.FindProperty("_WobbleZ", properties);

            materialEditor.ShaderProperty(wX, "Wobble X");
            materialEditor.ShaderProperty(wZ, "Wobble Z");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);

        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            false,
            false,
            false,
            true,
            false,
            false,
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

        tempVar = targetMat.GetInt("_CheckFresnel");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckWave");
        checkWave = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckEdge");
        checkEdge = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckEdge");
        checkEdge = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRefract");
        checkRefract = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckWobble");
        checkWobble = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TxtAFold");
        txtAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TxtBFold");
        txtBFold = tempVar == 1 ? true : false;


    }
}



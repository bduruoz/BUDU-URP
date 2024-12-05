using UnityEngine;
using UnityEditor;
using System;
using budu;
using UnityEditor.Rendering;
using UnityEngine.Rendering;

public class BFabricEditor : ShaderGUI
{
    bool checkSurfDef, checkTwoColors, checkShade;
    bool checkBase, checkDef, checkAlphaClip, checkNormal, checkBaseSpec, checkSecondSpec, checkTrans, checkAO, checkSatin, checkThickness, checkCurvature;
    bool aboutFold, twoColFold, shadeExtFold, specExtFold, clipCoverage;
    int tempVar, blendop, tempRQ;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Fabric Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUFabricTitle.png", typeof(Texture));

        GUILayout.BeginArea(new Rect(0, 0, 512, 32));
        {
            EditorGUILayout.BeginHorizontal();
            {
                GUI.backgroundColor = bdColors.Transparent(0);
                GUILayout.Box(banner, GUILayout.MinHeight(32));
            }
            EditorGUILayout.EndHorizontal();
        }
        GUILayout.EndArea();
        GUILayout.Space(28);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Surface Default Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);

        checkSurfDef = EditorGUILayout.ToggleLeft("SURFACE DEFAULT SETTINGS", checkSurfDef, style);
        targetMat.SetInt("_CheckSurfDef", Convert.ToInt16(checkSurfDef));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSurfDef)
        {
            MaterialProperty featureAverage = ShaderGUI.FindProperty("_Feature_Average",properties);
            MaterialProperty featureMultiply = ShaderGUI.FindProperty("_Feature_Multiplier", properties);
            MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness", properties);
            MaterialProperty backFaceColor = ShaderGUI.FindProperty("_Back_Face_Color", properties);
            MaterialProperty backFaceIntensity = ShaderGUI.FindProperty("_Back_Face_Intensity", properties);

            materialEditor.ShaderProperty(featureAverage, "Feature Average");
            if(featureAverage.floatValue > 0f)
            {
                materialEditor.ShaderProperty(featureMultiply, "Feature Multiplier");
            }
            materialEditor.ShaderProperty(smoothness, "Smoothness");
            materialEditor.ShaderProperty(backFaceIntensity, "Back Face Intensity");
            materialEditor.ShaderProperty(backFaceColor, "Back Face Color");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Base Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS", checkBase, style);
        targetMat.SetInt("_CheckBase", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty bc = ShaderGUI.FindProperty("_Cloth_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Cloth_Texture", properties);
            MaterialProperty btgamma = ShaderGUI.FindProperty("_Base_Texture_Gamma", properties);
            MaterialProperty btinv = ShaderGUI.FindProperty("_Invert_Texture", properties);
            MaterialProperty btc = ShaderGUI.FindProperty("_Texture_Contrast", properties);
            MaterialProperty bta = ShaderGUI.FindProperty("_Texture_Add", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");
            materialEditor.ShaderProperty(btgamma, "Base Map Gamma");
            materialEditor.ShaderProperty(btinv, "Base Map Invert");
            materialEditor.ShaderProperty(btc, "Base Texture Contrast");
            materialEditor.ShaderProperty(bta, "Additive Texture");

            #region Two Colors Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            twoColFold = EditorGUILayout.Foldout(twoColFold, "Two Colors", toggleOnLabelClick: true);
            targetMat.SetInt("_TwoColSwitch", Convert.ToInt16(twoColFold));
            if(twoColFold)
            {
                EditorGUI.indentLevel++;
                checkTwoColors = EditorGUILayout.Toggle("Two Colors", checkTwoColors);
                targetMat.SetInt("_TwoColors", Convert.ToInt16(checkTwoColors));
                if(checkTwoColors)
                {
                    MaterialProperty sc = ShaderGUI.FindProperty("_Cloth_Second_Color", properties);
                    MaterialProperty scInt = ShaderGUI.FindProperty("_Second_Color_Mix",properties);
                    MaterialProperty scttog = ShaderGUI.FindProperty("_SecondColorTextureSwitch", properties);
                    MaterialProperty velsw = ShaderGUI.FindProperty("_Fresnel", properties);

                    materialEditor.ShaderProperty(sc, "Second Color");
                    materialEditor.ShaderProperty(scInt, "Second Color Mixing");
                    materialEditor.ShaderProperty(scttog, "Second Color Affect Texture");

                    if(scttog.floatValue > 0f)
                    {
                        MaterialProperty scBlType = ShaderGUI.FindProperty("_SecondTextureBlendType", properties);
                        string[] blType = { "Multiply", "Additive" };
                        materialEditor.PopupShaderProperty(scBlType, new GUIContent("Second Texture Blend Type"), blType);
                    }

                    materialEditor.ShaderProperty(velsw, "Velvet");
                    if(velsw.floatValue > 0f) 
                    {
                        MaterialProperty scVelType = ShaderGUI.FindProperty("_Fresnel_Gamma", properties);
                        MaterialProperty scVelInv = ShaderGUI.FindProperty("_Fresnel_Invert", properties);
                        MaterialProperty scVelInt = ShaderGUI.FindProperty("_Fresnel_Intensity", properties);
                        MaterialProperty scVelBias = ShaderGUI.FindProperty("_FBias", properties);
                        MaterialProperty scVelScale = ShaderGUI.FindProperty("_FScale", properties);
                        MaterialProperty scVelPower = ShaderGUI.FindProperty("_FPower", properties);

                        materialEditor.ShaderProperty(scVelType, "Velvet Degree");
                        materialEditor.ShaderProperty(scVelInv, "Velvet Invert");
                        materialEditor.ShaderProperty(scVelInt, "Velvet Intensity");
                        materialEditor.ShaderProperty(scVelBias, "Velvet Bias");
                        materialEditor.ShaderProperty(scVelScale, "Velvet Scale");
                        materialEditor.ShaderProperty(scVelPower, "Velvet Power");
                    }
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion
            
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Transparency Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkTrans = EditorGUILayout.ToggleLeft("TRANSPARENT SETTINGS", checkTrans, style);
        targetMat.SetInt("_CheckTrans", Convert.ToInt16(checkTrans));
        targetMat.SetInt("_Transparent_Toggle", Convert.ToInt16(checkTrans));

        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTrans)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty trmap = ShaderGUI.FindProperty("_Transparent_Map", properties);
            MaterialProperty trmapGamma = ShaderGUI.FindProperty("_Transparent_Texture_Gamma", properties);
            MaterialProperty trOpacity = ShaderGUI.FindProperty("_Opacity", properties);
            MaterialProperty trAdd = ShaderGUI.FindProperty("_Additive_Transparency", properties);
            MaterialProperty trCont = ShaderGUI.FindProperty("_TransContrast", properties);
            MaterialProperty trOffs = ShaderGUI.FindProperty("_TransBias", properties);

            MaterialProperty trClpTog = ShaderGUI.FindProperty("_Alpha_Clip", properties);
            MaterialProperty trClp = ShaderGUI.FindProperty("_Alpha_Clip_Threshold", properties);

            materialEditor.ShaderProperty(trmap, "Transparency Map");
            materialEditor.ShaderProperty(trOpacity, "Opacity");
            materialEditor.ShaderProperty(trAdd, "Additive Transparency");
            materialEditor.ShaderProperty(trCont, "Transparency Contrast");
            materialEditor.ShaderProperty(trOffs, "Transparency Offset");

            materialEditor.ShaderProperty(trClpTog, "Alpha Clip");
            materialEditor.ShaderProperty(trClp, "Alpha Clip Threshold");

            clipCoverage = EditorGUILayout.Toggle("Alpha to Coverage", clipCoverage);
            targetMat.SetInt("_Alpha2Mask", Convert.ToInt16(clipCoverage));
            targetMat.SetInt("_AlphaToMask", Convert.ToInt16(clipCoverage));

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNormal, style);
        targetMat.SetInt("_CheckNormal", Convert.ToInt16(checkNormal));
        targetMat.SetInt("_Normal_Toggle", Convert.ToInt16(checkNormal));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nmap = ShaderGUI.FindProperty("_Normal_Map", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Scale", properties);
            MaterialProperty nsclm = ShaderGUI.FindProperty("_Normal_Scale_Multiplier", properties);

            materialEditor.ShaderProperty(nmap, "Normal Map");
            materialEditor.ShaderProperty(nscl, "Normal Scale");
            materialEditor.ShaderProperty(nsclm, "Normal Scale Multiplier");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Base Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBaseSpec = EditorGUILayout.ToggleLeft("BASE SPECULAR SETTINGS", checkBaseSpec, style);
        targetMat.SetInt("_CheckBaseSpec", Convert.ToInt16(checkBaseSpec));
        targetMat.SetInt("_Specular_Toggle",Convert.ToInt16(checkBaseSpec));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBaseSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty dscol = ShaderGUI.FindProperty("_Specular_Color", properties);
            MaterialProperty dsint = ShaderGUI.FindProperty("_Specular_Intensity", properties);

            materialEditor.ColorProperty(dscol, "Base Specular Color");
            materialEditor.RangeProperty(dsint, "Base Specular Intensity");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Second Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSecondSpec = EditorGUILayout.ToggleLeft("SECOND SPECULAR SETTINGS", checkSecondSpec, style);
        targetMat.SetInt("_CheckSecondSpec", Convert.ToInt16(checkSecondSpec));
        targetMat.SetInt("_Secondary_Specular_Toggle", Convert.ToInt16(checkSecondSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSecondSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Second Specular Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();


            MaterialProperty spcol = ShaderGUI.FindProperty("_Sec_Specular_Color", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_Secondary_Specular_Intensity", properties);
            MaterialProperty spTxtTog = ShaderGUI.FindProperty("_Specular_Map_Toggle", properties);
            MaterialProperty spAOAffect = ShaderGUI.FindProperty("_Specular_Affect_AO", properties);

            materialEditor.ShaderProperty(spcol, "Specular Color");
            materialEditor.ShaderProperty(spInt, "Specular Intensity");
            materialEditor.ShaderProperty(spTxtTog, "Specular Map");
            if(spTxtTog.floatValue > 0f)
            {
                MaterialProperty spTxt = ShaderGUI.FindProperty("_Specular_Map", properties);
                MaterialProperty spTxtInv = ShaderGUI.FindProperty("_Specular_Map_Invert", properties);
                materialEditor.ShaderProperty(spTxt, "Specular Map");
                materialEditor.ShaderProperty(spTxtInv, "Specular Map Invert");
            }

            materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecExtFold", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty spGloss = ShaderGUI.FindProperty("_Blinn_Glossy", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spSpecMin = ShaderGUI.FindProperty("_Spec_Min", properties);
                MaterialProperty spSpecMax = ShaderGUI.FindProperty("_Spec_Max", properties);

                materialEditor.ShaderProperty(spGloss, "Blinn Glossy");
                materialEditor.ShaderProperty(spSmt, "Specular Softness");
                materialEditor.ShaderProperty(spSpecMin, "Soft Specular Min");
                materialEditor.ShaderProperty(spSpecMax, "Soft Specular Max");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADE SETTINGS", checkShade, style);
        targetMat.SetInt("_CheckShade", Convert.ToInt16(checkShade));
        targetMat.SetInt("_Shader_Toggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Shade Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty shInt = ShaderGUI.FindProperty("_Shading_Intensity", properties);
            MaterialProperty shCol = ShaderGUI.FindProperty("_Shade_Color", properties);
            MaterialProperty shCnt = ShaderGUI.FindProperty("_Shading_Contrast", properties);
            MaterialProperty shCntr = ShaderGUI.FindProperty("_Shading_Contribution", properties);
            MaterialProperty shOff = ShaderGUI.FindProperty("_Shading_Offset", properties);
            MaterialProperty shMult = ShaderGUI.FindProperty("_Shade_Multiplier", properties);

            materialEditor.ShaderProperty(shInt, "Shade Intensity");
            materialEditor.ShaderProperty(shCol, "Shade Color");
            materialEditor.ShaderProperty(shCnt, "Shading Contrast");
            materialEditor.ShaderProperty(shCntr, "Shading Contribution");
            materialEditor.ShaderProperty(shOff, "Shading Offset");
            materialEditor.ShaderProperty(shMult, "Shading Multiplier");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "Shade Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_ShadeExtFold", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty shStr = ShaderGUI.FindProperty("_Shade_Start", properties);
                MaterialProperty shEnd = ShaderGUI.FindProperty("_Shade_End", properties);

                materialEditor.ShaderProperty(shStr, "Shade Start");
                materialEditor.ShaderProperty(shEnd, "Shade End");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkAO = EditorGUILayout.ToggleLeft("AMBIENT OCCLUSION SETTINGS", checkAO, style);
        targetMat.SetInt("_CheckAO", Convert.ToInt16(checkAO));
        targetMat.SetInt("_AO_Toggle", Convert.ToInt16(checkAO));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusBlue(120));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Map Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty aoTxt = ShaderGUI.FindProperty("_AO_Map", properties);
            MaterialProperty aoTyp = ShaderGUI.FindProperty("_AO_GAMMA", properties);
            MaterialProperty aoInt = ShaderGUI.FindProperty("_AO_Intensity", properties);
            MaterialProperty aoOver = ShaderGUI.FindProperty("_AO_Over", properties);

            materialEditor.ShaderProperty(aoTxt, "Ambient Occlusin Map");
            materialEditor.ShaderProperty(aoTyp, "Ambient Occlusin Grade Type");
            materialEditor.ShaderProperty(aoInt, "Ambient Occlusion Intensity");
            materialEditor.ShaderProperty(aoOver, "Ambient Occlusion Over");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Satin Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSatin = EditorGUILayout.ToggleLeft("SATIN SETTINGS", checkSatin, style);
        targetMat.SetInt("_CheckSatin", Convert.ToInt16(checkSatin));
        targetMat.SetInt("_Satin_Toggle", Convert.ToInt16(checkSatin));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSatin)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Satin Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty stType = ShaderGUI.FindProperty("_SATIN_GAMMA_SELECTOR", properties);
            MaterialProperty stCol = ShaderGUI.FindProperty("_Satin_Color", properties);
            MaterialProperty stTxtTog = ShaderGUI.FindProperty("_Satin_Texture_Toggle", properties);
            MaterialProperty stInt = ShaderGUI.FindProperty("_Satin_Intensity", properties);
            MaterialProperty stNormInt = ShaderGUI.FindProperty("_Satin_Normal_Intensity", properties);
            MaterialProperty stEffectArea = ShaderGUI.FindProperty("_Satin_Effect_Area", properties);
            MaterialProperty stCon = ShaderGUI.FindProperty("_Satin_Contrast", properties);
            MaterialProperty stDeg = ShaderGUI.FindProperty("_Satin_Degree", properties);
            MaterialProperty stMult = ShaderGUI.FindProperty("_Satin_Multiplier", properties);

            materialEditor.ShaderProperty(stInt, "Satin Intensity");
            materialEditor.ShaderProperty(stType, "Satin Grade Type");
            materialEditor.ShaderProperty(stCol, "Satin Color");
            materialEditor.ShaderProperty(stTxtTog, "Satin Map");
            if(stTxtTog.floatValue > 0)
            {
                MaterialProperty stTxt = ShaderGUI.FindProperty("_Satin_Texture", properties);
                MaterialProperty stTxtInv = ShaderGUI.FindProperty("_Satin_Map_Invert", properties);
                materialEditor.ShaderProperty(stTxt, "Satin Texture");
                materialEditor.ShaderProperty(stTxtInv, "Satin Texture Invert");
            }
            materialEditor.ShaderProperty(stEffectArea, "Satin Effect Area");
            materialEditor.ShaderProperty(stCon, "Satin Contrast");
            materialEditor.ShaderProperty(stDeg, "Satin Degree");
            materialEditor.ShaderProperty(stNormInt, "Satin Normal Intensity");
            materialEditor.ShaderProperty(stMult, "Satin Multiplier");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Thickness Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkThickness = EditorGUILayout.ToggleLeft("THICKNESS SETTINGS", checkThickness, style);
        targetMat.SetInt("_CheckThickness", Convert.ToInt16(checkThickness));
        targetMat.SetInt("_Thickness_Toggle", Convert.ToInt16(checkThickness));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkThickness)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Thickness Feature");
            EditorGUILayout.EndVertical();

            //MaterialProperty thtype = ShaderGUI.FindProperty("_THICKNESS_GAMMA_SELECTOR", properties);
            MaterialProperty thGamma = ShaderGUI.FindProperty("_Thickness_Gamma", properties);
            MaterialProperty thCol = ShaderGUI.FindProperty("_Thickness_Color", properties);
            MaterialProperty thTxt = ShaderGUI.FindProperty("_Thickness_Map", properties);
            MaterialProperty thInv = ShaderGUI.FindProperty("_Thickness_Invert", properties);
            MaterialProperty thInt = ShaderGUI.FindProperty("_Thickness_Intensity", properties);
            MaterialProperty thPatInt = ShaderGUI.FindProperty("_Thickness_Pattern_Intensity", properties);
            MaterialProperty thMult = ShaderGUI.FindProperty("_Thickness_Multiplier", properties);

            materialEditor.ShaderProperty(thInt, "Thickness Intensity");
            materialEditor.ShaderProperty(thGamma, "Thickness Gamma");
            materialEditor.ShaderProperty(thCol, "Thickness Color");
            materialEditor.ShaderProperty(thTxt, "Thickness Map");
            materialEditor.ShaderProperty(thInv, "Thickness Invert");
            materialEditor.ShaderProperty(thPatInt, "Thickness Pattern Intensity");
            materialEditor.ShaderProperty(thMult, "Thickness Multiplier");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Curvature Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkCurvature = EditorGUILayout.ToggleLeft("CURVATURE SETTINGS", checkCurvature, style);
        targetMat.SetInt("_CheckCurvature", Convert.ToInt16(checkCurvature));
        targetMat.SetInt("_Curvature_Toggle", Convert.ToInt16(checkCurvature));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkCurvature)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Curvature Feature");
            EditorGUILayout.EndVertical();

            MaterialProperty cvtype = ShaderGUI.FindProperty("_CURVATURE_GAMMA_SELECTOR", properties);
            MaterialProperty cvCol = ShaderGUI.FindProperty("_Curvature_Color", properties);
            MaterialProperty cvTxt = ShaderGUI.FindProperty("_Curvature_Map", properties);
            MaterialProperty cvInt = ShaderGUI.FindProperty("_Curvature_Intensity", properties);
            MaterialProperty cvInv = ShaderGUI.FindProperty("_Curvature_Invert", properties);
            MaterialProperty cvScl = ShaderGUI.FindProperty("_Curv_Scale", properties);
            MaterialProperty cvOff = ShaderGUI.FindProperty("_Curv_Offset", properties);

            materialEditor.ShaderProperty(cvtype, "Curvatıure Grade Type");
            materialEditor.ShaderProperty(cvInt, "Curvature Intensity");
            materialEditor.ShaderProperty(cvCol, "Curvature Color");
            materialEditor.ShaderProperty(cvTxt, "Curvature Map");
            materialEditor.ShaderProperty(cvInv, "Curvature Invert");
            materialEditor.ShaderProperty(cvScl, "Curvature Contrast");
            materialEditor.ShaderProperty(cvOff, "Curvature Bias");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        EditorGUILayout.Space(2);
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkDef = EditorGUILayout.ToggleLeft("SHADER DEFAULTS", checkDef, style);
        targetMat.SetInt("_CheckDef", Convert.ToInt16(checkDef));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            #region Surface Type
            MaterialProperty surfaceType = ShaderGUI.FindProperty("_Surface",properties);
            string[] srType = { "Opaque", "Transparent" };
            materialEditor.PopupShaderProperty(surfaceType, new GUIContent("Surface Type"), srType);
            
            if(surfaceType.floatValue > 0f)
            {
                #region Blend Type
                MaterialProperty blType = ShaderGUI.FindProperty("_Blend", properties);
                MaterialProperty srcBlend = ShaderGUI.FindProperty("_SrcBlend", properties);
                MaterialProperty dstBlend = ShaderGUI.FindProperty("_DstBlend", properties);

                string[] blendtype = { "Alpha", "Premultiply", "Additive", "Multiply" };
                materialEditor.PopupShaderProperty(blType, new GUIContent("Blend Type"), blendtype);
                switch((int)blType.floatValue)
                {
                    case 0:
                        // Alpha Blending
                        srcBlend.floatValue = (int)BlendMode.SrcAlpha;
                        dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 1:
                        // Premultiply
                        srcBlend.floatValue = (int)BlendMode.One;
                        dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 2:
                        // Additive
                        srcBlend.floatValue = (int)BlendMode.One;
                        dstBlend.floatValue = (int)BlendMode.One;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 3:
                        // Multiply
                        srcBlend.floatValue = (int)BlendMode.DstColor;
                        dstBlend.floatValue = (int)BlendMode.Zero;
                        targetMat.EnableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                }
                #endregion

                #region Preserve Specular Settings
                EditorGUI.indentLevel++;
                targetMat.DisableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
                if((int)blType.floatValue == 0 || (int)blType.floatValue == 2)
                {
                    MaterialProperty psl = ShaderGUI.FindProperty("_Preserve_Specular_Lighting", properties);
                    materialEditor.ShaderProperty(psl, "Preserve Specular Lighting");

                    if(psl.floatValue < 1f)
                    {
                        targetMat.EnableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
                    }
                }
                EditorGUI.indentLevel--;
                #endregion
            }
            #endregion

            #region Cull Mode
            MaterialProperty cullMode = ShaderGUI.FindProperty("_Cull", properties);
            string[] clMode = { "Both", "Back", "Front" };
            materialEditor.PopupShaderProperty(cullMode, new GUIContent("Cull Mode"), clMode);
            #endregion

            #region Depth Write
            // Auto = 0
            // Force Enabled = 1
            // Force Disabled = 2

            MaterialProperty zDepth = ShaderGUI.FindProperty("_ZWrite", properties);
            string[] zType = { "Auto", "Force Enabled", "Force Disabled" };
            materialEditor.PopupShaderProperty(zDepth, new GUIContent("Depth Write"), zType);
            #endregion

            #region Cast Shadows
            MaterialProperty castShadows = ShaderGUI.FindProperty("_Cast_Shadows", properties);
            materialEditor.ShaderProperty(castShadows, "Cast Shadows");
            targetMat.SetInt("_CastShadow", Convert.ToInt16((int)castShadows.floatValue));
            targetMat.SetShaderPassEnabled("SHADOWCASTER", Convert.ToInt16((int)castShadows.floatValue) == 1 ? true : false);
            #endregion

            #region Receive Shadows
            MaterialProperty receiveShadow = ShaderGUI.FindProperty("_Receive_Shadows", properties);
            materialEditor.ShaderProperty(receiveShadow, "Receive Shadows");
            targetMat.SetInt("_ReceiveShadow", Convert.ToInt16((int)receiveShadow.floatValue));
            if(receiveShadow.floatValue < 1f)
            {
                targetMat.EnableKeyword(keyword: "_RECEIVE_SHADOWS_OFF");
            }
            else
            {
                targetMat.DisableKeyword(keyword: "_RECEIVE_SHADOWS_OFF");
            }
            #endregion

            SurfaceControls(targetMat, (int)surfaceType.floatValue);

            materialEditor.RenderQueueField();
            materialEditor.EnableInstancingField();
            materialEditor.DoubleSidedGIField();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region BUDU Copyright
        EditorGUILayout.Space(5);
        style.normal.textColor = bdColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;

        aboutFold = EditorGUILayout.Foldout(aboutFold, "© 2024 BUDU GAMES - Burçak Duruöz", toggleOnLabelClick: true, style);
        if(aboutFold)
        {
            Texture budulogo = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUGames_Logo_m.png", typeof(Texture));
            GUI.backgroundColor = bdColors.GrayP(18,204);
            style.normal.textColor += bdColors.NexusOrange();
            style.alignment = TextAnchor.UpperCenter;
            GUIContent gc = new GUIContent("BUDU GAMES\nBUDU Shaders\n\n© 2024 F. Burçak Duruöz", budulogo);
            EditorGUILayout.HelpBox(gc, true);
        }
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSurfDef");
        checkSurfDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TwoColSwitch");
        twoColFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TwoColors");
        checkTwoColors = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBaseSpec");
        checkBaseSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSecondSpec");
        checkSecondSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecExtFold");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckTrans");
        checkTrans  = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Alpha2Mask");
        clipCoverage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShade");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShadeExtFold");
        shadeExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSatin");
        checkSatin = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCurvature");
        checkCurvature = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckThickness");
        checkThickness = tempVar == 1 ? true : false;

    }
    void SurfaceControls(Material targetMat, int surfType)
    {
        targetMat.SetInt("_AlphaToMask", 0);


        if(targetMat.renderQueue >= 3000)
        {
            tempRQ = targetMat.renderQueue - 3000;
        }

        switch(surfType)
        {
            #region Opaque
            case 0:
                targetMat.SetOverrideTag("QUEUE", "Geometry");
                targetMat.SetOverrideTag("RenderType", "Opaque");
                targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.Geometry);

                targetMat.DisableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                targetMat.SetShaderPassEnabled("DepthOnly", true);

                targetMat.SetInt("_Surface", 0);
                targetMat.SetInt("_Zwrite", 1);
                break;
            #endregion
            #region Transparent
            case 1:
                targetMat.SetOverrideTag("QUEUE", "Transparent");
                if(checkAlphaClip)
                {
                    targetMat.SetOverrideTag("RenderType", "TransparentCutOut");
                    targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.AlphaTest);
                }
                else
                {
                    targetMat.SetOverrideTag("RenderType", "Transparent");
                    targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.Transparent);
                }
                targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + tempRQ;

                targetMat.EnableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                targetMat.SetShaderPassEnabled("DepthOnly", false);

                targetMat.SetInt("_Surface", 1);
                targetMat.SetInt("_Zwrite", 0);
                break;
                #endregion
        }

        
    }
    private Texture2D MakeBackground(int width, int height, Color col)
    {
        Color[] pix = new Color[width * height];
        for(int i = 0; i < pix.Length; i++)
        {
            pix[i] = col;
        }
        Texture2D result = new Texture2D(width, height);
        result.SetPixels(pix);
        result.Apply();
        return result;
    }
}

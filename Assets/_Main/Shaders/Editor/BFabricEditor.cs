using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BFabricEditor : ShaderGUI
{
    bool checkTwoColors, checkShade, checkNormal, checkSatin, checkSpec, checkDSpec, checkThickness, checkCurvature, checkAO, checkTrans, checkBase, checkDef;
    bool aboutFold, twoColFold, shadeExtFold, specExtFold, clpant;
    int tempVar, blendop;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
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
            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty bttyp = ShaderGUI.FindProperty("_BaseMapType", properties);
            MaterialProperty btinv = ShaderGUI.FindProperty("_BaseMapInvert", properties);
            MaterialProperty afaotog = ShaderGUI.FindProperty("_AffectBaseAO", properties);
            MaterialProperty btc = ShaderGUI.FindProperty("_TextureContrast", properties);
            MaterialProperty bta = ShaderGUI.FindProperty("_TextureAdd", properties);

            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
            materialEditor.ShaderProperty(bttyp, "Base Map Grade Type");
            materialEditor.ShaderProperty(btinv, "Base Map Invert");
            materialEditor.ShaderProperty(afaotog, "Affect Ambient Occlusion");
            materialEditor.RangeProperty(btc, "Base Texture Contrast");
            materialEditor.RangeProperty(bta, "Additive Texture");

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
                    MaterialProperty sc = ShaderGUI.FindProperty("_SecondColor", properties);
                    MaterialProperty scttog = ShaderGUI.FindProperty("_SecondColorTextureSwitch", properties);
                    MaterialProperty velsw = ShaderGUI.FindProperty("_VelvetSwitch", properties);

                    materialEditor.ColorProperty(sc, "Second Color");
                    materialEditor.ShaderProperty(scttog, "Second Color Affect Texture");
                    materialEditor.ShaderProperty(velsw, "Velvet");
                    if(velsw.floatValue > 0f) 
                    {
                        MaterialProperty scVelType = ShaderGUI.FindProperty("_VelvetType", properties);
                        MaterialProperty scVelInv = ShaderGUI.FindProperty("_VelvetInvert", properties);
                        MaterialProperty scVelInt = ShaderGUI.FindProperty("_VelvetIntensity", properties);
                        MaterialProperty scVelBias = ShaderGUI.FindProperty("_VelvetBias", properties);
                        MaterialProperty scVelScale = ShaderGUI.FindProperty("_VelvetScale", properties);
                        MaterialProperty scVelPower = ShaderGUI.FindProperty("_VelvetPower", properties);

                        materialEditor.ShaderProperty(scVelType, "Velvet Type");
                        materialEditor.ShaderProperty(scVelInv, "Velvet Invert");
                        materialEditor.RangeProperty(scVelInt, "Velvet Intensity");
                        materialEditor.RangeProperty(scVelBias, "Velvet Bias");
                        materialEditor.RangeProperty(scVelScale, "Velvet Scale");
                        materialEditor.RangeProperty(scVelPower, "Velvet Power");
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

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADE SETTINGS", checkShade, style);
        targetMat.SetInt("_ShadeColorToggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty shInt = ShaderGUI.FindProperty("_ShadingIntensity", properties);
            MaterialProperty shCol = ShaderGUI.FindProperty("_ShadeColor", properties);
            MaterialProperty shCnt = ShaderGUI.FindProperty("_ShadeContrast", properties);
            MaterialProperty shCntr = ShaderGUI.FindProperty("_ShadingContribution", properties);
            MaterialProperty shOff = ShaderGUI.FindProperty("_ShadingOffset", properties);
            MaterialProperty shCnt2 = ShaderGUI.FindProperty("_ShadingContrast", properties);

            materialEditor.RangeProperty(shInt, "Shade Intensity");
            materialEditor.ColorProperty(shCol, "Shade Color");
            materialEditor.RangeProperty(shCnt, "Full Shade Contrast");
            materialEditor.RangeProperty(shCntr, "Shading Contribution");
            materialEditor.RangeProperty(shOff, "Shading Offset");
            materialEditor.RangeProperty(shCnt2, "Shading Contrast");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "Shade Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_ShaderExtras", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty shBaCS = ShaderGUI.FindProperty("_BaseCellSharpness", properties);
                MaterialProperty shBaCO = ShaderGUI.FindProperty("_BaseCellOffset", properties);

                materialEditor.RangeProperty(shBaCS, "Base Cell Sharpness");
                materialEditor.RangeProperty(shBaCO, "Base Cell Offset");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNormal, style);
        targetMat.SetInt("_Normal", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nmap = ShaderGUI.FindProperty("_NormalMap", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_NormalScale", properties);
            MaterialProperty nsclm = ShaderGUI.FindProperty("_NormalScaleMultiplier", properties);

            materialEditor.TextureProperty(nmap, "Normal Map");
            materialEditor.RangeProperty(nscl, "Normal Scale");
            materialEditor.RangeProperty(nsclm, "Normal Scale Multiplier");
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
        checkDSpec = EditorGUILayout.ToggleLeft("BASE SPECULAR SETTINGS", checkDSpec, style);
        targetMat.SetInt("_DefSpecSwitch", Convert.ToInt16(checkDSpec));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty dscol = ShaderGUI.FindProperty("_SpecularColor", properties);
            MaterialProperty dsint = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty dssmt = ShaderGUI.FindProperty("_Smoothness", properties);

            materialEditor.ColorProperty(dscol, "Specular Color");
            materialEditor.RangeProperty(dsint, "Specular Intensity");
            materialEditor.RangeProperty(dssmt, "Smoothness");
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
        checkSpec = EditorGUILayout.ToggleLeft("SECOND SPECULAR SETTINGS", checkSpec, style);
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);
            MaterialProperty spTxt = ShaderGUI.FindProperty("_SpecularMap", properties);
            MaterialProperty spType = ShaderGUI.FindProperty("_SpecType", properties);
            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SecSpecularIntensity", properties);
            MaterialProperty spAOAffect = ShaderGUI.FindProperty("_AffectAO_Spec", properties);

            materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");
            materialEditor.ShaderProperty(spType, "Specular Type");
            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.TextureProperty(spTxt, "Specular Map");
            materialEditor.RangeProperty(spInt, "Specular Intensity");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spSpecMin = ShaderGUI.FindProperty("_SpecMin", properties);
                MaterialProperty spSpecMax = ShaderGUI.FindProperty("_SpecMax", properties);
                MaterialProperty spGloss = ShaderGUI.FindProperty("_BGloss", properties);

                materialEditor.RangeProperty(spGloss, "Blinn Gloss");
                materialEditor.RangeProperty(spSmt, "Specular Softness");
                materialEditor.RangeProperty(spSpecMin, "Soft Specular Min");
                materialEditor.RangeProperty(spSpecMax, "Soft Specular Max");
                materialEditor.RangeProperty(spSat, "Specular Saturate");
                materialEditor.RangeProperty(spIn, "Specular In");
                materialEditor.RangeProperty(spOut, "Specular Out");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
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
        targetMat.SetInt("_SatinSwitch", Convert.ToInt16(checkSatin));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSatin)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty stType = ShaderGUI.FindProperty("_SatinType", properties);
            MaterialProperty stCol = ShaderGUI.FindProperty("_SatinColor", properties);
            MaterialProperty stTxt = ShaderGUI.FindProperty("_SatinMap", properties);
            MaterialProperty stInt = ShaderGUI.FindProperty("_SatinIntensity", properties);
            MaterialProperty stCon = ShaderGUI.FindProperty("_SatinContrast", properties);
            MaterialProperty stSmt = ShaderGUI.FindProperty("_SatinSmoothing", properties);
            MaterialProperty stLSh = ShaderGUI.FindProperty("_SatinLightShade", properties);
            MaterialProperty stTrs = ShaderGUI.FindProperty("_SatinTransparency", properties);

            materialEditor.ShaderProperty(stType, "Satin Type");
            materialEditor.ShaderProperty(stCol, "Satin Color");
            materialEditor.ShaderProperty(stTxt, "Satin Texture");
            materialEditor.ShaderProperty(stInt, "Satin Intensity");
            materialEditor.ShaderProperty(stCon, "Satin Contrast");
            materialEditor.ShaderProperty(stSmt, "Satin Smoothing");
            materialEditor.ShaderProperty(stLSh, "Satin Light Shade");
            materialEditor.ShaderProperty(stTrs, "Satin Transparency");
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
        targetMat.SetInt("_TransparentSwitch", Convert.ToInt16(checkTrans));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTrans)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty trmap = ShaderGUI.FindProperty("_TransparentMap", properties);
            MaterialProperty trOpacity = ShaderGUI.FindProperty("_Opacity", properties);
            MaterialProperty trAdd = ShaderGUI.FindProperty("_AdditiveTransparency", properties);
            MaterialProperty trCont = ShaderGUI.FindProperty("_TransContrast", properties);
            MaterialProperty trOffs = ShaderGUI.FindProperty("_TransOffset", properties);
            MaterialProperty trClp = ShaderGUI.FindProperty("_ClipThreshold", properties);
            MaterialProperty trCull = ShaderGUI.FindProperty("_CullOp", properties);
            MaterialProperty trBlend = ShaderGUI.FindProperty("_BlendingOp", properties);

            materialEditor.TextureProperty(trmap, "Transparency Map");
            materialEditor.RangeProperty(trOpacity, "Opacity");
            materialEditor.RangeProperty(trAdd, "Additive Transparency");
            materialEditor.FloatProperty(trCont, "Transparency Contrast");
            materialEditor.FloatProperty(trOffs, "Transparency Offset");
            materialEditor.RangeProperty(trClp, "Clip Threshold");
            materialEditor.ShaderProperty(trBlend, "Blening Operations");
            materialEditor.ShaderProperty(trCull, "Culling");

            clpant = EditorGUILayout.Toggle("Alpha to Coverage", clpant);
            targetMat.SetInt("_AlphaCoverage", Convert.ToInt16(clpant));
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
        targetMat.SetInt("_AOSwitch", Convert.ToInt16(checkAO));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty aoTxt = ShaderGUI.FindProperty("_AmbientOcclusionMap", properties);
            MaterialProperty aoTyp = ShaderGUI.FindProperty("_AOType", properties);
            MaterialProperty aoInt = ShaderGUI.FindProperty("_AmbientOcclusionIntensity", properties);
            MaterialProperty aoOver = ShaderGUI.FindProperty("_AOOver", properties);

            materialEditor.ShaderProperty(aoTxt, "Ambient Occlusin Map");
            materialEditor.ShaderProperty(aoTyp, "Ambient Occlusin Grade Type");
            materialEditor.ShaderProperty(aoInt, "Ambient Occlusion Intensity");
            materialEditor.ShaderProperty(aoOver, "Ambient Occlusion Over");
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
        targetMat.SetInt("_ThicknessSwitch", Convert.ToInt16(checkThickness));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkThickness)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty thtype = ShaderGUI.FindProperty("_ThicknessType", properties);
            MaterialProperty thInv = ShaderGUI.FindProperty("_ThicknessInvert", properties);
            MaterialProperty thCol = ShaderGUI.FindProperty("_ThicknessColor", properties);
            MaterialProperty thTxt = ShaderGUI.FindProperty("_ThicknessMap", properties);
            MaterialProperty thInt = ShaderGUI.FindProperty("_ThicknessIntensity", properties);
            MaterialProperty thPatInt = ShaderGUI.FindProperty("_ThickPatternIntensity", properties);

            materialEditor.ShaderProperty(thtype, "Thickness Grade Type");
            materialEditor.ShaderProperty(thInv, "Thickness Invert");
            materialEditor.ShaderProperty(thCol, "Thickness Color");
            materialEditor.ShaderProperty(thTxt, "Thickness Map");
            materialEditor.ShaderProperty(thInt, "Thickness Intensity");
            materialEditor.ShaderProperty(thPatInt, "Thickness Pattern Intensity");
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
        targetMat.SetInt("_CurvatureSwitch", Convert.ToInt16(checkCurvature));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkCurvature)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty cvtype = ShaderGUI.FindProperty("_CurvType", properties);
            MaterialProperty cvCol = ShaderGUI.FindProperty("_CurvatureColor", properties);
            MaterialProperty cvTxt = ShaderGUI.FindProperty("_CurvatureMap", properties);
            MaterialProperty cvInt = ShaderGUI.FindProperty("_CurvatureIntensity", properties);
            MaterialProperty cvInv = ShaderGUI.FindProperty("_CurvatureInvert", properties);
            MaterialProperty cvScl = ShaderGUI.FindProperty("_CurvScale", properties);
            MaterialProperty cvOff = ShaderGUI.FindProperty("_CurvOffset", properties);

            materialEditor.ShaderProperty(cvtype, "Curvatıure Grade Type");
            materialEditor.ShaderProperty(cvCol, "Curvature Color");
            materialEditor.ShaderProperty(cvTxt, "Curvature Map");
            materialEditor.ShaderProperty(cvInt, "Curvature Intensity");
            materialEditor.ShaderProperty(cvInv, "Curvature Invert");
            materialEditor.ShaderProperty(cvScl, "Curvature Scale");
            materialEditor.ShaderProperty(cvOff, "Curvature Offset");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Shader Defaults
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

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        if(checkTrans)
        {
            blendop = targetMat.GetInt("_BlendingOp");
            switch(blendop)
            {
                // Opaque
                case 0:
                    targetMat.renderQueue = 2000;
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One); // One
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero); // Zero
                    break;
                //Transparent
                case 1:
                    targetMat.renderQueue = 3000;
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha); // Src Alpha
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha); // One Minus Src Alpha
                    break;
                // Premultiplied
                case 2:
                    targetMat.renderQueue = 3000;
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One); // One
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha); // One Minus Src Alpha
                    break;
                // Additive
                case 3:
                    targetMat.renderQueue = 3000;
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha); // Src Alpha
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.One); // One
                    break;
            }
        }

        tempVar = targetMat.GetInt("_AlphaCoverage");
        clpant = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TransparentSwitch");
        checkTrans = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AOSwitch");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CurvatureSwitch");
        checkCurvature = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ThicknessSwitch");
        checkThickness = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DefSpecSwitch");
        checkDSpec = tempVar == 1 ? true : false;
        
        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecularExtras");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SatinSwitch");
        checkSatin = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShaderExtras");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShadeColorToggle");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TwoColSwitch");
        twoColFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TwoColors");
        checkTwoColors = tempVar == 1 ? true : false;
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

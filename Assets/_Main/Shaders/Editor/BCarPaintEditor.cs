using UnityEngine;
using UnityEditor;
using budu;
using System;

public class BCarPaintEditor : ShaderGUI
{
    bool checkTwoColors, checkFlakes, checkFlakesTexture, checkSpec, checkReflect, checkRefFresnel, checkRefFrsInvert, checkShade;
    bool twoColFold, aboutFold, flakesFold, flakesExtFold, flakesNormalFold, flTxtFold, specFold, specExtFold, reflectFold, cubemapFold, fresnelFold, refFlakesFold, shadeFold, shadeExtFold, colFlakesFold;
    int paintMethod;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Car Paint Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUCarPaintTitle.png", typeof(Texture));

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
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Color Group
        MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(bc, "Base Color");
            style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));

            checkTwoColors = EditorGUILayout.Toggle("Two Colors", checkTwoColors);
            targetMat.SetInt("_TwoColors", Convert.ToInt16(checkTwoColors));
            twoColFold = checkTwoColors;

            if(twoColFold)
            {
                MaterialProperty pm = ShaderGUI.FindProperty("_PaintMethod", properties);
                MaterialProperty sc = ShaderGUI.FindProperty("_SecondColor", properties);

                materialEditor.ShaderProperty(pm, "Paint Method");
                materialEditor.ColorProperty(sc, "Second Color");

                paintMethod = targetMat.GetInt("_PaintMethod");

                MaterialProperty cfi = ShaderGUI.FindProperty("_ColorFresnelInvert", properties);
                MaterialProperty cfb = ShaderGUI.FindProperty("_ColFresnelBias", properties);
                MaterialProperty cfs = ShaderGUI.FindProperty("_ColFresnelScale", properties);
                MaterialProperty cfp = ShaderGUI.FindProperty("_ColFresnelPower", properties);
                MaterialProperty cgi = ShaderGUI.FindProperty("_GradYInvert", properties);
                MaterialProperty cgs = ShaderGUI.FindProperty("_GradScale", properties);
                MaterialProperty cgo = ShaderGUI.FindProperty("_GradOffset", properties);
                MaterialProperty cfty = ShaderGUI.FindProperty("_FresnelType", properties);
                MaterialProperty cgty = ShaderGUI.FindProperty("_GradType", properties);

                switch(paintMethod)
                {
                    // Fresnel
                    case 0: 
                        style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(40));

                        EditorGUILayout.BeginVertical(style);
                        materialEditor.ShaderProperty(cfty, "Fresnel Type");
                        materialEditor.ShaderProperty(cfi, "Fresnel Invert");
                        materialEditor.RangeProperty(cfb, "Fresnel Bias");
                        materialEditor.RangeProperty(cfs, "Fresnel Scale");
                        materialEditor.RangeProperty(cfp, "Fresnel Power");
                        EditorGUILayout.EndVertical();
                        break;
                    // Gradient Y
                    case 1: 
                        style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(80));

                        EditorGUILayout.BeginVertical(style);
                        materialEditor.ShaderProperty(cgty, "Gradient Type");
                        materialEditor.ShaderProperty(cgi, "Gradient Invert");
                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 110;
                        EditorGUIUtility.fieldWidth = 30;
                        materialEditor.FloatProperty(cgs, "Gradeient Scale");
                        materialEditor.FloatProperty(cgo, "Gradeient Offset");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.EndVertical();
                        break;
                    // Fresnel & Gradient Y
                    case 2: 
                        style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(40));

                        EditorGUILayout.BeginVertical(style);
                        materialEditor.ShaderProperty(cfty, "Fresnel Type");
                        materialEditor.ShaderProperty(cfi, "Fresnel Invert");
                        materialEditor.RangeProperty(cfb, "Fresnel Bias");
                        materialEditor.RangeProperty(cfs, "Fresnel Scale");
                        materialEditor.RangeProperty(cfp, "Fresnel Power");
                        EditorGUILayout.EndVertical();

                        style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(80));

                        EditorGUILayout.BeginVertical(style);
                        materialEditor.ShaderProperty(cgty, "Gradient Type");
                        materialEditor.ShaderProperty(cgi, "Gradient Invert");
                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 110;
                        EditorGUIUtility.fieldWidth = 30;
                        materialEditor.FloatProperty(cgs, "Gradeient Scale");
                        materialEditor.FloatProperty(cgo, "Gradeient Offset");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.EndVertical();
                        break;
                }
            }

            colFlakesFold = EditorGUILayout.Toggle("Body Flakes", colFlakesFold);
            targetMat.SetInt("_AffectBodyFlakes", Convert.ToInt16(colFlakesFold));
            if(colFlakesFold)
            {
                MaterialProperty clFlakes = ShaderGUI.FindProperty("_BodyFNormalMulti", properties);

                materialEditor.RangeProperty(clFlakes, "Flakes Body Scale");
            }


        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADE COLOR", checkShade, style);
        shadeFold = checkShade;
        targetMat.SetInt("_ShadeColorToggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(shadeFold)
        {
            EditorGUILayout.Space(4);

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

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "Shade Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_ShadeExtras", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                MaterialProperty shBaCS = ShaderGUI.FindProperty("_BaseCellSharpness", properties);
                MaterialProperty shBaCO = ShaderGUI.FindProperty("_BaseCellOffset", properties);

                materialEditor.RangeProperty(shBaCS, "Base Cell Sharpness");
                materialEditor.RangeProperty(shBaCO, "Base Cell Offset");
            }
            EditorGUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Flakes Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkFlakes = EditorGUILayout.ToggleLeft("FLAKES", checkFlakes, style);
        flakesFold = checkFlakes;
        targetMat.SetInt("_FlakesSwitch", Convert.ToInt16(checkFlakes));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(flakesFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty fltype = ShaderGUI.FindProperty("_FlakesType", properties);
            MaterialProperty flcol = ShaderGUI.FindProperty("_FlakesColor", properties);
            MaterialProperty flInt = ShaderGUI.FindProperty("_FlakesIntensity", properties);
            MaterialProperty flGls = ShaderGUI.FindProperty("_FlakesGlossy", properties);

            materialEditor.ShaderProperty(fltype, "Flakes Type");
            materialEditor.ColorProperty(flcol, "Flakes Color");
            materialEditor.RangeProperty(flInt, "Flakes Intensity");
            materialEditor.RangeProperty(flGls, "Flakes Glossy");

            #region Flakes Texture Settings
            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(15));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            flTxtFold = EditorGUILayout.Foldout(flTxtFold, "Textured Flakes", toggleOnLabelClick: true);
            targetMat.SetInt("_TexturedFlakesToggle", Convert.ToInt16(flTxtFold));
            if(flTxtFold)
            {
                MaterialProperty fltxt = ShaderGUI.FindProperty("_FlakesTexture", properties);
                MaterialProperty fltxtInt = ShaderGUI.FindProperty("_FlakesTextureIntensity", properties);
                MaterialProperty flttileX = ShaderGUI.FindProperty("_FlakesTileX", properties);
                MaterialProperty flttileY = ShaderGUI.FindProperty("_FlakesTileY", properties);
                MaterialProperty fltRotSpeed = ShaderGUI.FindProperty("_FlakesRotSpeed",properties);

                checkFlakesTexture = EditorGUILayout.Toggle("Flake Texture", checkFlakesTexture);
                targetMat.SetInt("_TexturedFlakes",Convert.ToInt16(checkFlakesTexture));
                if(checkFlakesTexture)
                {
                    materialEditor.RangeProperty(fltxtInt, "Flakes Texture Intensity");
                    materialEditor.TextureProperty(fltxt, "Flakes Texture");
                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 100;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.FloatProperty(flttileX, "Tile X");
                    materialEditor.FloatProperty(flttileY, "Tile Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.RangeProperty(fltRotSpeed, "Rotation Speed");
                }
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Flakes Controls
            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(30));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            flakesExtFold = EditorGUILayout.Foldout(flakesExtFold, "Flakes Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_FlakesExtras", Convert.ToInt16(flakesExtFold));
            if(flakesExtFold)
            {
                MaterialProperty flSat = ShaderGUI.FindProperty("_FlakesSaturation", properties);
                MaterialProperty flSoft = ShaderGUI.FindProperty("_FlakesSoftness", properties);
                MaterialProperty flOut = ShaderGUI.FindProperty("_FlakesOut", properties);
                MaterialProperty flIn = ShaderGUI.FindProperty("_FlakesIn", properties);
                MaterialProperty flSpec = ShaderGUI.FindProperty("_FlakesSpecular", properties);
                MaterialProperty flGloss = ShaderGUI.FindProperty("_FlakesGloss",properties);
                MaterialProperty flWrap = ShaderGUI.FindProperty("_FlakesWrapping", properties);

                materialEditor.RangeProperty(flSpec, "Flakes Specular");
                materialEditor.RangeProperty(flGloss, "Flakes Gloss");
                materialEditor.RangeProperty(flWrap, "Flakes Wrapping");
                materialEditor.RangeProperty(flSat, "Flakes Saturate");
                materialEditor.RangeProperty(flSoft, "Flakes Softness");
                materialEditor.RangeProperty(flOut, "Flakes Out");
                materialEditor.RangeProperty(flIn, "Flakes In");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Flakes Normal Controls
            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(45));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            flakesNormalFold = EditorGUILayout.Foldout(flakesNormalFold, "Flakes Normal Map Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_FlakesNormalExtras", Convert.ToInt16(flakesNormalFold));
            if(flakesNormalFold)
            {
                MaterialProperty flNm = ShaderGUI.FindProperty("_FlakesNormal", properties);
                MaterialProperty flnTxt = ShaderGUI.FindProperty("_FlakesNormalMap", properties);
                MaterialProperty flnTileX = ShaderGUI.FindProperty("_FNTileX", properties);
                MaterialProperty flnTileY = ShaderGUI.FindProperty("_FNTileY", properties);
                MaterialProperty flnOffsetX = ShaderGUI.FindProperty("_FNOffsetX", properties);
                MaterialProperty flnOffsetY = ShaderGUI.FindProperty("_FNOffsetY", properties);

                materialEditor.ShaderProperty(flNm, "Flakes");
                materialEditor.TextureProperty(flnTxt, "Flakes Normal Map");

                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 140;
                EditorGUIUtility.fieldWidth = 35;
                materialEditor.FloatProperty(flnTileX, "Tile X");
                materialEditor.FloatProperty(flnTileY, "Tile Y");
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                materialEditor.FloatProperty(flnOffsetX, "Offset X");
                materialEditor.FloatProperty(flnOffsetY, "Offset Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();

                MaterialProperty FlakesHeight = ShaderGUI.FindProperty("_FNormalScale", properties);
                MaterialProperty FlakesMultiplier = ShaderGUI.FindProperty("_FNormalMultiplier", properties);

                materialEditor.RangeProperty(FlakesHeight, "Flakes Height");
                materialEditor.RangeProperty(FlakesMultiplier, "Flakes Height Multiplier");
            }
            EditorGUILayout.EndVertical();

            #endregion

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("SPECULAR", checkSpec, style);
        specFold = checkSpec;
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(specFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty sptype = ShaderGUI.FindProperty("_SpecType", properties);
            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty spGls = ShaderGUI.FindProperty("_Glossy", properties);

            materialEditor.ShaderProperty(sptype, "Specular Type");
            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.RangeProperty(spInt, "Specular Intensity");
            materialEditor.RangeProperty(spGls, "Specular Glossy");

            #region Specular Controls
            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(30));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSoft = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);
                MaterialProperty spSpec = ShaderGUI.FindProperty("_BSpecular", properties);
                MaterialProperty spGloss = ShaderGUI.FindProperty("_BGloss", properties);
                MaterialProperty spWrap = ShaderGUI.FindProperty("_BWrapping", properties);

                materialEditor.RangeProperty(spSpec, "Blinn Specular");
                materialEditor.RangeProperty(spGloss, "Blinn Gloss");
                materialEditor.RangeProperty(spWrap, "Blinn Wrapping");
                materialEditor.RangeProperty(spSat, "Specular Saturate");
                materialEditor.RangeProperty(spSoft, "Specular Softness");
                materialEditor.RangeProperty(spOut, "Specular Out");
                materialEditor.RangeProperty(spIn, "Specular In");
            }
            EditorGUILayout.EndVertical();
            #endregion
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);

        #endregion

        #region Reflection Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkReflect = EditorGUILayout.ToggleLeft("REFLECT", checkReflect, style);
        reflectFold = checkReflect;
        targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(reflectFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty rfcol = ShaderGUI.FindProperty("_ReflectColor", properties);
            MaterialProperty rfs = ShaderGUI.FindProperty("_ReflectionStrength", properties);
            MaterialProperty rft = ShaderGUI.FindProperty("_ReflectMap", properties);
            MaterialProperty cmr = ShaderGUI.FindProperty("_CubeMapRotate", properties);

            materialEditor.RangeProperty(rfs, "Reflect Strength");
            materialEditor.ColorProperty(rfcol, "Reflect Color");
            materialEditor.TextureProperty(rft, "Reflect Map");


            refFlakesFold = EditorGUILayout.Toggle("Reflect Flakes", refFlakesFold);
            targetMat.SetInt("_AffectReflectionFlakes", Convert.ToInt16(refFlakesFold));
            if(refFlakesFold)
            {
                MaterialProperty rfFlakes = ShaderGUI.FindProperty("_RefFNormalMulti", properties);

                materialEditor.RangeProperty(rfFlakes, "Flakes Reflect Scale");
            }

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.dGreenRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubeMapExtras", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                MaterialProperty cmx = ShaderGUI.FindProperty("_CMXPos", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_CMYPos", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_CMZPos", properties);

                materialEditor.RangeProperty(cmr, "Cubemap Rotate");
                materialEditor.RangeProperty(cmx, "CM X Pos");
                materialEditor.RangeProperty(cmy, "CM Y Pos");
                materialEditor.RangeProperty(cmz, "CM Z Pos");
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Reflection Fresnel Settings
            style.normal.background = MakeBackground(1, 1, bdColors.dCyanGreen(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            fresnelFold = EditorGUILayout.Foldout(fresnelFold, "Reflection Fresnel", toggleOnLabelClick: true);
            targetMat.SetInt("_FresnelFold", Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {

                checkRefFresnel = EditorGUILayout.Toggle("Reflection Fresnel", checkRefFresnel);
                targetMat.SetInt("_RefFresnelSwitch", Convert.ToInt16(checkRefFresnel));
                if(checkRefFresnel)
                {
                    MaterialProperty rfType = ShaderGUI.FindProperty("_RefFrsType", properties);
                    materialEditor.ShaderProperty(rfType, "Fresnel Tytpe");
                    MaterialProperty rfMultiplier = ShaderGUI.FindProperty("_ReflectionMultiplier", properties);
                    materialEditor.RangeProperty(rfMultiplier, "Multiplier");

                    checkRefFrsInvert = EditorGUILayout.Toggle("Fresnel Invert", checkRefFrsInvert);
                    targetMat.SetInt("_RefFresnelInvert", Convert.ToInt16(checkRefFrsInvert));

                    MaterialProperty rfbias = ShaderGUI.FindProperty("_RefFresnelBias", properties);
                    MaterialProperty rfscl = ShaderGUI.FindProperty("_RefFresnelScale", properties);
                    MaterialProperty rfPow = ShaderGUI.FindProperty("_RefFresnelPower", properties);
                    materialEditor.RangeProperty(rfbias, "Fresnel Bias");
                    materialEditor.RangeProperty(rfscl, "Fresnel Scale");
                    materialEditor.RangeProperty(rfPow, "Fresnel Power");
                }
            }
            EditorGUILayout.EndVertical();
            #endregion
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        //targetMat.SetFloat("_Specular", 0);
        //base.OnGUI(materialEditor,properties);

        #region Shader Defaults
        materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
        #endregion

        #region BUDU Copyright
        EditorGUILayout.Space(5);
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
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
        tempVar = targetMat.GetInt("_ShadeExtras");
        shadeExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShadeColorToggle");
        checkShade = tempVar == 1 ? true : false;
        shadeFold = checkShade;

        tempVar = targetMat.GetInt("_AffectReflectionFlakes");
        refFlakesFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AffectBodyFlakes");
        colFlakesFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefFresnelSwitch");
        checkRefFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubeMapExtras");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;
        reflectFold = checkReflect;

        tempVar = targetMat.GetInt("_TwoColors");
        checkTwoColors = tempVar == 1 ? true : false;
        twoColFold = checkTwoColors;

        tempVar = targetMat.GetInt("_PaintMethod");
        paintMethod = tempVar;

        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecularExtras");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakesExtras");
        flakesExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakesNormalExtras");
        flakesNormalFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakesSwitch");
        checkFlakes = tempVar == 1 ? true : false;
        flakesFold = checkFlakes;

        tempVar = targetMat.GetInt("_TexturedFlakes");
        checkFlakesTexture = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TexturedFlakesToggle");
        flTxtFold = tempVar == 1 ? true : false;
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

using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BTransparentEditor: ShaderGUI
{
    bool checkSurface, checkTrans, checkDepth, checkTrFresnel, checkRefractive, checkNormal, checkSpec, checkSSBlur, checkDef, 
        checkReflect, checkRefFresnel, checkRefFrsInvert, checkCurvFold, checkCurv, checkThickness, CheckRimContour;
    bool aboutFold, trFrFold, dpFold, rfIdxFold, specExtFold, transFineTune, depthFold, refIndexFold, rfFineFold, cubemapFold, fresnelFold, curvFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUTransparentTitle.png", typeof(Texture));
        
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

        #region Surface Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSurface = EditorGUILayout.ToggleLeft("SURFACE SETTINGS", checkSurface, style);
        targetMat.SetInt("_SurfaceSettings", Convert.ToInt16(checkSurface));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSurface)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);

            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Transparency And Depth Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkTrans = EditorGUILayout.ToggleLeft("TRANSPARENCY", checkTrans, style);
        targetMat.SetInt("_TransparentToggle", Convert.ToInt16(checkTrans));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTrans)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty trIntens = ShaderGUI.FindProperty("_TransparentIntensity", properties);
            MaterialProperty trColor = ShaderGUI.FindProperty("_TransparencyColor", properties);

            materialEditor.RangeProperty(trIntens, "Transparent Intensity");
            materialEditor.ColorProperty(trColor, "Transparent Color");


            #region Transparency Fine Tune Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));

            EditorGUILayout.BeginVertical(style);
            transFineTune = EditorGUILayout.Foldout(transFineTune, "Transparency Fine Tune");
            targetMat.SetInt("_TRFineTune",Convert.ToInt16(transFineTune));
            if(transFineTune)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                MaterialProperty trScale = ShaderGUI.FindProperty("_TRScale", properties);
                MaterialProperty trOffset = ShaderGUI.FindProperty("_TROffset", properties);
                materialEditor.FloatProperty(trScale, "Transparent Scale");
                materialEditor.FloatProperty(trOffset, "Transparent Offset");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Transparent Fresnel Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));

            EditorGUILayout.BeginVertical(style);
            trFrFold = EditorGUILayout.Foldout(trFrFold, "Fresnel Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_TRFRFold",Convert.ToInt16(trFrFold));
            if(trFrFold)
            {
                checkTrFresnel = EditorGUILayout.Toggle("Fresnel", checkTrFresnel);
                targetMat.SetInt("_TransparentFresnel", Convert.ToInt16(checkTrFresnel));
                if(checkTrFresnel)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty trFresInv = ShaderGUI.FindProperty("_TransparentFresnelInvert", properties);
                    MaterialProperty trFresBias = ShaderGUI.FindProperty("_TransparentFresnelBias",properties);
                    MaterialProperty trFresScale = ShaderGUI.FindProperty("_TransparentFresnelScale", properties);
                    MaterialProperty trFresPower = ShaderGUI.FindProperty("_TransparentFresnelPower", properties);

                    materialEditor.ShaderProperty(trFresInv, "Fresnel Invert");
                    materialEditor.ShaderProperty(trFresBias, "Fresnel Bias");
                    materialEditor.ShaderProperty(trFresScale, "Fresnel Scale");
                    materialEditor.ShaderProperty(trFresPower, "Fresnle Power");
                    EditorGUI.indentLevel--;
                }
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Depth Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));

            EditorGUILayout.BeginVertical(style);
            dpFold = EditorGUILayout.Foldout(dpFold, "Depth Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_DPFold",Convert.ToInt16(dpFold));
            if(dpFold)
            {
                EditorGUI.indentLevel++;
                checkDepth = EditorGUILayout.Toggle("Transparency Depth", checkDepth);
                targetMat.SetInt("_Depth",Convert.ToInt16(checkDepth));
                targetMat.SetInt("_DepthToggle", Convert.ToInt16(checkDepth));
                depthFold = checkDepth;
                if(depthFold)
                {
                    MaterialProperty dpColor = ShaderGUI.FindProperty("_DepthColor",properties);
                    MaterialProperty dpScale = ShaderGUI.FindProperty("_DepthScale", properties);
                    MaterialProperty dpOffset = ShaderGUI.FindProperty("_DepthOffset",properties);
                    MaterialProperty dpContrast = ShaderGUI.FindProperty("_DepthContrast", properties);

                    materialEditor.ColorProperty(dpColor, "Depth Color");
                    materialEditor.FloatProperty(dpScale, "Depth Scale");
                    materialEditor.FloatProperty(dpOffset, "Depth Offset");
                    materialEditor.FloatProperty(dpContrast, "Depth Contrast");
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Refractive Index Settings
            style.normal.background = MakeBackground(1,1,bdColors.DarkRed(80));

            EditorGUILayout.BeginVertical(style);
            rfIdxFold = EditorGUILayout.Foldout(rfIdxFold,"Refractive Index Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_RIFold",Convert.ToInt16(rfIdxFold));
            if (rfIdxFold)
            {
                EditorGUI.indentLevel++;
                checkRefractive = EditorGUILayout.Toggle("Refraction", checkRefractive);
                targetMat.SetInt("_Refraction", Convert.ToInt16(checkRefractive));
                targetMat.SetInt("_RefrControl", Convert.ToInt16(checkRefractive));
                refIndexFold = checkRefractive;
                if (refIndexFold)
                {
                    MaterialProperty refrFrInvert = ShaderGUI.FindProperty("_RefractionInvert",properties);
                    MaterialProperty refrColor = ShaderGUI.FindProperty("_RefractColor", properties);
                    MaterialProperty refrBias = ShaderGUI.FindProperty("_FresnelBias", properties);
                    MaterialProperty refrScale = ShaderGUI.FindProperty("_FresnelScale", properties);
                    MaterialProperty refrPower = ShaderGUI.FindProperty("_FresnelPower", properties);
                    MaterialProperty refrCont = ShaderGUI.FindProperty("_ScreenContrast", properties);

                    materialEditor.ShaderProperty(refrFrInvert, "Invert");
                    materialEditor.ColorProperty(refrColor, "Refract Color");
                    materialEditor.RangeProperty(refrBias, "Bias");
                    materialEditor.RangeProperty(refrScale, "Scale");
                    materialEditor.RangeProperty(refrPower, "Power");
                    materialEditor.RangeProperty(refrCont, "Contrast");

                    style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(40));

                    #region Index Of Refraction Fine Tune Settings
                    EditorGUILayout.BeginVertical(style);
                    rfFineFold = EditorGUILayout.Foldout(rfFineFold, "Index Of Refraction", toggleOnLabelClick: true);
                    targetMat.SetInt("_RIFineTune",Convert.ToInt16(rfFineFold));
                    if (rfFineFold)
                    {
                        EditorGUILayout.HelpBox("Original Values\n" +
                            "Old Min:\t\t0\t\tOld Max:\t\t1\n" +
                            "New Min: \t0.95\t\tNew Max: \t1.2",
                            MessageType.Info);
                        EditorGUILayout.Space(3);
                        EditorGUI.indentLevel++;
                        MaterialProperty rfrOldMin = ShaderGUI.FindProperty("_OldMin", properties);
                        MaterialProperty rfrOldMax = ShaderGUI.FindProperty("_OldMax", properties);
                        MaterialProperty rfrNewMin = ShaderGUI.FindProperty("_NewMin", properties);
                        MaterialProperty rfrNewMax = ShaderGUI.FindProperty("_NewMax", properties);

                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 170;
                        EditorGUIUtility.fieldWidth = 35;
                        materialEditor.ShaderProperty(rfrOldMin, "Old Min");
                        materialEditor.ShaderProperty(rfrOldMax, "Old Max");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 170;
                        EditorGUIUtility.fieldWidth = 35;
                        materialEditor.ShaderProperty(rfrNewMin, "New Min");
                        materialEditor.ShaderProperty(rfrNewMax, "New Max");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUI.indentLevel--;
                    }
                    EditorGUILayout.EndVertical();
                    #endregion

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

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
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

            materialEditor.TextureProperty(nmap, "Normal Map");
            materialEditor.RangeProperty(nscl, "Normal Scale");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("SPECULAR", checkSpec, style);
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty spGls = ShaderGUI.FindProperty("_Glossy", properties);
            MaterialProperty spSmo = ShaderGUI.FindProperty("_Smoothness",properties);

            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.RangeProperty(spInt, "Specular Intensity");
            materialEditor.RangeProperty(spGls, "Glossy");
            materialEditor.RangeProperty(spSmo, "Smoothness");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty spAmb = ShaderGUI.FindProperty("_SpecularAmbient", properties);
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);

                materialEditor.RangeProperty(spAmb, "Specular Ambient");
                materialEditor.RangeProperty(spSat, "Specular Saturation");
                materialEditor.RangeProperty(spSmt, "Specular Softness");
                materialEditor.RangeProperty(spOut, "Specular Out");
                materialEditor.RangeProperty(spIn, "Specular In");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Screen Space Bluric Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSSBlur = EditorGUILayout.ToggleLeft("SCREEN SPACE BLUR", checkSSBlur, style);
        targetMat.SetInt("_SSBluricTransparent",Convert.ToInt16(checkSSBlur));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSSBlur)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty sstog = ShaderGUI.FindProperty("_ScreenSpace",properties);                                                                       
            MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);
            MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);

            materialEditor.ShaderProperty(sstog, "Bluric Noise");
            materialEditor.TextureProperty(ssbTxt, "Blur Pattern");
            materialEditor.FloatProperty(ssbSize, "Size");

            BluricScaleOffset(materialEditor,properties,(int)sstog.floatValue);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkReflect = EditorGUILayout.ToggleLeft("REFLECT", checkReflect, style);
        targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rfcol = ShaderGUI.FindProperty("_ReflectColor", properties);
            MaterialProperty rfs = ShaderGUI.FindProperty("_ReflectionStrength", properties);
            MaterialProperty rft = ShaderGUI.FindProperty("_ReflectMap", properties);
            MaterialProperty cmr = ShaderGUI.FindProperty("_CubeMapRotate", properties);

            materialEditor.RangeProperty(rfs, "Reflect Strength");
            materialEditor.ColorProperty(rfcol, "Reflect Color");
            materialEditor.TextureProperty(rft, "Reflect Map");

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubeMapExtras", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty cmx = ShaderGUI.FindProperty("_CMXPos", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_CMYPos", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_CMZPos", properties);

                materialEditor.RangeProperty(cmr, "Cubemap Rotate");
                materialEditor.RangeProperty(cmx, "CM X Pos");
                materialEditor.RangeProperty(cmy, "CM Y Pos");
                materialEditor.RangeProperty(cmz, "CM Z Pos");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Reflection Fresnel Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            fresnelFold = EditorGUILayout.Foldout(fresnelFold, "Reflection Fresnel", toggleOnLabelClick: true);
            targetMat.SetInt("_FresnelFold", Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {
                EditorGUI.indentLevel++;
                checkRefFresnel = EditorGUILayout.Toggle("Reflection Fresnel", checkRefFresnel);
                targetMat.SetInt("_RefFresnelSwitch", Convert.ToInt16(checkRefFresnel));
                if(checkRefFresnel)
                {
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
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Reflection Curvature Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            curvFold = EditorGUILayout.Foldout(curvFold, "Curvature Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_CurvFold", Convert.ToInt16(curvFold));
            if(curvFold)
            {
                EditorGUI.indentLevel++;
                checkCurvFold = EditorGUILayout.Toggle("Curvature",checkCurvFold);
                targetMat.SetInt("_ReflectionCurvature",Convert.ToInt16(checkCurvFold));
                if(checkCurvFold)
                {
                    MaterialProperty crvTxt = ShaderGUI.FindProperty("_CurvatureTexture", properties);
                    MaterialProperty crvScl = ShaderGUI.FindProperty("_CurvatureScale", properties);

                    materialEditor.ShaderProperty(crvTxt, "Curvature Texture");
                    materialEditor.ShaderProperty(crvScl, "Curvature Scale");
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

        #region Thickness
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkThickness = EditorGUILayout.ToggleLeft("THICKNESS", checkThickness, style);
        targetMat.SetInt("_Thickness", Convert.ToInt16(checkThickness));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkThickness)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty thickInv = ShaderGUI.FindProperty("_ThichnessInvert", properties);
            MaterialProperty thickInt = ShaderGUI.FindProperty("_ThicknessIntensity", properties);
            MaterialProperty thickColor = ShaderGUI.FindProperty("_ThicknessColor", properties);
            MaterialProperty thickTxt = ShaderGUI.FindProperty("_ThicknessMap", properties);
            MaterialProperty thickScale = ShaderGUI.FindProperty("_ThickScale", properties);
            MaterialProperty thickOffset = ShaderGUI.FindProperty("_ThickOffset", properties);

            materialEditor.ShaderProperty(thickInv, "Thickness Invert");
            materialEditor.RangeProperty(thickInt, "Thickness Intesity");
            materialEditor.ColorProperty(thickColor, "Thickness Color");
            materialEditor.TextureProperty(thickTxt, "Thickness Texture");
            EditorGUILayout.BeginHorizontal();
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.FloatProperty(thickScale, "Thicness Scale");
            materialEditor.FloatProperty(thickOffset, "Thicness Offset");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
            EditorGUILayout.EndHorizontal();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Contour Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        CheckRimContour = EditorGUILayout.ToggleLeft("RIM CONTOUR", CheckRimContour, style);
        targetMat.SetInt("_RimContour", Convert.ToInt16(CheckRimContour));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(CheckRimContour)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rimLA = ShaderGUI.FindProperty("_RimCAtt", properties);
            MaterialProperty rimCol = ShaderGUI.FindProperty("_RimContourColor", properties);
            MaterialProperty rimInt = ShaderGUI.FindProperty("_RimContourIntensity", properties);
            MaterialProperty rimCnSc = ShaderGUI.FindProperty("_RimContourScale", properties);
            MaterialProperty rimCnOf = ShaderGUI.FindProperty("_RimContourOffset", properties);

            materialEditor.ShaderProperty(rimLA, "Contour Light Attenuation");
            materialEditor.ColorProperty(rimCol, "Contour Color");
            materialEditor.RangeProperty(rimInt, "Contour Intensity");
            EditorGUILayout.BeginVertical();
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.FloatProperty(rimCnSc, "Contour Scale");
            materialEditor.FloatProperty(rimCnOf, "Contour Offset");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
            EditorGUILayout.EndHorizontal();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
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
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        style.normal.textColor = bdColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;
        EditorGUILayout.BeginVertical();
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
        EditorGUILayout.EndVertical();
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkDef");
        checkDef= tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RimContour");
        CheckRimContour = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SurfaceSettings");
        checkSurface = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SurfaceSettings");
        checkSurface = tempVar == 1 ? true: false;
        
        tempVar = targetMat.GetInt("_TransparentToggle");
        checkTrans = tempVar == 1 ? true: false;

        tempVar = targetMat.GetInt("_Depth");
        checkDepth = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TransparentFresnel");
        checkTrFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Refraction");
        checkRefractive = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Thickness");
        checkThickness = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SSBluricTransparent");
        checkSSBlur = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TRFRFold");
        trFrFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DPFold");
        dpFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RIFold");
        rfIdxFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RIFineTune");
        rfFineFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TRFineTune");
        transFineTune = tempVar == 1 ? true : false;
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

    private void BluricScaleOffset(MaterialEditor materialEditor, MaterialProperty[] properties, int seltg)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "";
        selectedMisc.Intensity = "_PatternHeight";
        selectedMisc.Contrast = "";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_SSTileX";
        selected.Tile.y = "_SSTileY";
        selected.Speed.x = "";
        selected.Speed.y = "";
        selected.Anchor.x = "";
        selected.Anchor.y = "";
        selected.OverallSpeed = "";
        selected.RotateSpeed = "";

        switch(seltg)
        {
            case 0:
                selected.Offset.x = "";
                selected.Offset.y = "";
                selected.Rotate = "";
                break;
            case 1:
                selected.Offset.x = "_SSOffX";
                selected.Offset.y = "_SSOffY";
                selected.Rotate = "_PatternRotator";
                break;
        }

        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }

}

using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BWaterSurfaceEditor : ShaderGUI
{
    bool checkDef, checkFlowMap, checkDeform, checkFog, checkMidWave, checkReflect, checkRefract, checkSSBlur, checkNormal, checkSurface, checkDisp, otherFold;
    bool aboutFold, fMapFold, fTxtFold, fMaskFold, dMaskFold, dfNoiseAFold, dfNoiseBFold, wAFold, wBFold, SSTxtInfo, foamFold;
    int tempVar;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Water Toon Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUWaterSurfaceTitles.png", typeof(Texture));

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
        targetMat.SetInt("_SurfaceToggle", Convert.ToInt16(checkSurface));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSurface)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty surfInt = ShaderGUI.FindProperty("_SurfaceIntensity", properties);
            MaterialProperty shoreInt = ShaderGUI.FindProperty("_ShoreIntensity", properties);
            MaterialProperty midWavInt = ShaderGUI.FindProperty("_MiddleWaveIntensity", properties);

            materialEditor.ShaderProperty(surfInt, "Intensity");
            materialEditor.ShaderProperty(shoreInt, "Shore Intensity");
            materialEditor.ShaderProperty(midWavInt, "Middle Wave Intensity");

            MaterialProperty shrFoamTog = ShaderGUI.FindProperty("_ShoreFoamToggle",properties);
            MaterialProperty midFoamTog = ShaderGUI.FindProperty("_MiddleFoamToggle", properties);

            materialEditor.ShaderProperty(shrFoamTog, "Shore Foam");
            materialEditor.ShaderProperty(midFoamTog, "Middle Wave Foam");

            FoamLayer(materialEditor, properties, style, targetMat);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Flow Map Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);

        checkFlowMap = EditorGUILayout.ToggleLeft("FLOW MAP SETTINGS", checkFlowMap, style);
        targetMat.SetInt("_CheckFlowMap", Convert.ToInt16(checkFlowMap));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkFlowMap)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            // Flow Type Select
            MaterialProperty fType = ShaderGUI.FindProperty("_FlowMapType", properties);
            MaterialProperty fInf = ShaderGUI.FindProperty("_InfluenceFlow", properties);
            MaterialProperty fSpd = ShaderGUI.FindProperty("_FlowSpeed", properties);
            MaterialProperty fChgSpd = ShaderGUI.FindProperty("_MapChangeSpeed", properties);
            MaterialProperty fMapExp = ShaderGUI.FindProperty("_MapExponential", properties);

            materialEditor.ShaderProperty(fInf, "Influence Flow");
            materialEditor.ShaderProperty(fSpd, "Flow Speed");
            materialEditor.ShaderProperty(fChgSpd, "Map Chage Speed");
            materialEditor.ShaderProperty(fMapExp, "Map Exponential");
            materialEditor.ShaderProperty(fType, "Flow Map Type");

            switch((int)fType.floatValue)
            {
                case 0:
                    // Depth Map
                    #region Depth Map Settings
                    MaterialProperty dDist = ShaderGUI.FindProperty("_DepthDistance", properties);
                    MaterialProperty dExp = ShaderGUI.FindProperty("_DepthExponential", properties);
                    MaterialProperty dSize = ShaderGUI.FindProperty("_DepthSize", properties);

                    materialEditor.ShaderProperty(dDist, "Depth Distance");
                    materialEditor.ShaderProperty(dExp, "Depth Exponential");
                    materialEditor.ShaderProperty(dSize, "Depth Size");
                    #endregion
                    
                    #region Flow Texture Settings
                    flowTextureSettings(materialEditor, properties, style, targetMat);
                    #endregion

                    #region Depth Mask Settings
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
                    EditorGUILayout.BeginVertical(style);
                    dMaskFold = EditorGUILayout.Foldout(dMaskFold, "Depth Mask Map", toggleOnLabelClick: true);
                    targetMat.SetInt("_dMaskFold", Convert.ToInt16(dMaskFold));
                    if(dMaskFold)
                    {
                        EditorGUI.indentLevel++;
                        MaterialProperty dMaskTog = ShaderGUI.FindProperty("_Mask", properties);
                        materialEditor.ShaderProperty(dMaskTog, "Mask");

                        if(dMaskTog.floatValue > 0f)
                        {
                            MaterialProperty dMGradePow = ShaderGUI.FindProperty("_MaskGradePower", properties);
                            MaterialProperty dMGradeAmp = ShaderGUI.FindProperty("_MaskGradeAmplitude", properties);
                            MaterialProperty dMaskGradeType = ShaderGUI.FindProperty("_MaskGradeType", properties);

                            materialEditor.ShaderProperty(dMaskGradeType, "Mask Grade Type");
                            materialEditor.ShaderProperty(dMGradePow, "Mask Grade Power");
                            materialEditor.ShaderProperty(dMGradeAmp, "Mask Grade Amplitude");
                        }
                        EditorGUI.indentLevel--;
                    }
                    EditorGUILayout.EndVertical();
                    #endregion

                    flowTextureSettings(materialEditor, properties, style, targetMat);
                    break;
                case 1:
                    // Flow Map
                    #region Flow Map Settings
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
                    EditorGUILayout.BeginVertical(style);
                    fMapFold = EditorGUILayout.Foldout(fMapFold, "Flow Map Settings", toggleOnLabelClick: true);
                    targetMat.SetInt("_fMapFold", Convert.ToInt16(fMapFold));
                    if(fMapFold)
                    {
                        EditorGUI.indentLevel++;
                        MaterialProperty fMap = ShaderGUI.FindProperty("_FlowMap", properties);
                        materialEditor.ShaderProperty(fMap, "Flow Map Texture");
                        EditorGUI.indentLevel--;
                    }
                    EditorGUILayout.EndVertical();
                    #endregion

                    #region Flow Texture Settings
                    flowTextureSettings(materialEditor, properties, style, targetMat);
                    #endregion

                    #region Flow Mask Settings
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
                    EditorGUILayout.BeginVertical(style);
                    fMaskFold = EditorGUILayout.Foldout(fMaskFold, "Flow Mask Map", toggleOnLabelClick: true);
                    targetMat.SetInt("_fMaskFold", Convert.ToInt16(fMaskFold));
                    if(fMaskFold)
                    {
                        EditorGUI.indentLevel++;
                        MaterialProperty fMaskTog = ShaderGUI.FindProperty("_Mask", properties);
                        materialEditor.ShaderProperty(fMaskTog, "Mask");

                        if(fMaskTog.floatValue > 0f)
                        {
                            MaterialProperty fMaskMap = ShaderGUI.FindProperty("_MaskMap", properties);
                            MaterialProperty fMGradePow = ShaderGUI.FindProperty("_MaskGradePower", properties);
                            MaterialProperty fMaskGradeType = ShaderGUI.FindProperty("_MaskGradeType", properties);
                            MaterialProperty fMaskGradeAmp = ShaderGUI.FindProperty("_MaskGradeAmplitude",properties);

                            materialEditor.ShaderProperty(fMaskMap, "Mask Texture");
                            materialEditor.ShaderProperty(fMaskGradeType, "Mask Grade Type");
                            materialEditor.ShaderProperty(fMGradePow, "Mask Grade Power");
                            materialEditor.ShaderProperty(fMaskGradeAmp, "Mask Grade Amplitude");
                        }
                        EditorGUI.indentLevel--;
                    }
                    EditorGUILayout.EndVertical();
                    #endregion
                    break;
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Deform Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkDeform = EditorGUILayout.ToggleLeft("DEFORM SETTINGS", checkDeform, style);
        targetMat.SetInt("_DeformFold", Convert.ToInt16(checkDeform));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDeform)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty dfBlendType = ShaderGUI.FindProperty("_SelectDeformType", properties);

            materialEditor.ShaderProperty(dfBlendType, "Blend Type");

            switch((int)dfBlendType.floatValue)
            {
                case 0:
                    #region Layer A
                    DefLayerA(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
                case 1:
                    #region Layer B
                    DefLayerB(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                    #region Layer A
                    DefLayerA(materialEditor, properties, style, targetMat);
                    #endregion
                    #region Layer B
                    DefLayerB(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Middle Wave Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkMidWave = EditorGUILayout.ToggleLeft("MIDDLE WAVE SETTINGS", checkMidWave, style);
        targetMat.SetInt("_CheckMidWave", Convert.ToInt16(checkMidWave));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkMidWave)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty waveBlendType = ShaderGUI.FindProperty("_SelectWaveType", properties);
            MaterialProperty midMaskTog = ShaderGUI.FindProperty("_MidFlowMask",properties);
            materialEditor.ShaderProperty(waveBlendType, "Blend Type");
            materialEditor.ShaderProperty(midMaskTog, "Flow Mask Toggle");

            switch((int)waveBlendType.floatValue)
            {
                case 0:
                    #region Layer A
                    WaveLayerA(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
                case 1:
                    #region Layer B
                    WaveLayerB(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                    #region Layer A
                    WaveLayerA(materialEditor, properties, style, targetMat);
                    #endregion
                    #region Layer B
                    WaveLayerB(materialEditor, properties, style, targetMat);
                    #endregion
                    break;
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Controls Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNormal, style);
        targetMat.SetInt("_NormalToggle", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty normsc = ShaderGUI.FindProperty("_NormalIntensity", properties);
            MaterialProperty normWave = ShaderGUI.FindProperty("_MiddleWaveBumpIntensity", properties);
            MaterialProperty normShor = ShaderGUI.FindProperty("_ShoreBumpIntensity", properties);
            MaterialProperty normGradePow = ShaderGUI.FindProperty("_NormalGradePower", properties);
            MaterialProperty vertTang = ShaderGUI.FindProperty("_VT_Intensity", properties);

            materialEditor.ShaderProperty(normsc, "Bump Intensity");
            materialEditor.ShaderProperty(normWave, "Middle Wave Bump Intensity");
            materialEditor.ShaderProperty(normShor, "Shore Bump Intensity");
            materialEditor.ShaderProperty(normGradePow, "Normal Contrast");
            materialEditor.ShaderProperty(vertTang, "Vertex Tangent Control");


            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkReflect = EditorGUILayout.ToggleLeft("REFLECTION SETTINGS", checkReflect, style);
        targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty mirRef = ShaderGUI.FindProperty("_MirrorReflect", properties);
            MaterialProperty mirRefCol = ShaderGUI.FindProperty("_MirrorRefColor", properties);
            MaterialProperty mirRefInt = ShaderGUI.FindProperty("_MirrorRefIntensity", properties);

            MaterialProperty cmRef = ShaderGUI.FindProperty("_CMReflect", properties);
            MaterialProperty refStr = ShaderGUI.FindProperty("_ReflectionStrength", properties);
            MaterialProperty refMult = ShaderGUI.FindProperty("_ReflectionMultiplier", properties);
            MaterialProperty refColor = ShaderGUI.FindProperty("_ReflectColor", properties);
            MaterialProperty refMap = ShaderGUI.FindProperty("_ReflectMap", properties);
            MaterialProperty refMapRot = ShaderGUI.FindProperty("_CubeMapRotate", properties);
            MaterialProperty refMapx = ShaderGUI.FindProperty("_CMXPos", properties);
            MaterialProperty refMapy = ShaderGUI.FindProperty("_CMYPos", properties);
            MaterialProperty refMapz = ShaderGUI.FindProperty("_CMZPos", properties);

            materialEditor.ShaderProperty(mirRef, "Mirrored Reflect");
            materialEditor.ShaderProperty(mirRefInt, "Mirrored Reflect Intensity");
            materialEditor.ShaderProperty(mirRefCol, "Mirrored Reflect Color");
            EditorGUILayout.Space(2);
            materialEditor.ShaderProperty(cmRef, "Cube Map Reflect");
            materialEditor.ShaderProperty(refStr, "Strength");
            materialEditor.ShaderProperty(refMult, "Multiplier");
            materialEditor.ShaderProperty(refColor, "Reflect Color");
            materialEditor.ShaderProperty(refMap, "Reflect Map");
            materialEditor.ShaderProperty(refMapRot, "Cube Map Rotate");
            materialEditor.ShaderProperty(refMapx, "Cube Map X Position");
            materialEditor.ShaderProperty(refMapy, "Cube Map Y Position");
            materialEditor.ShaderProperty(refMapz, "Cube Map Z Position");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Refraction Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkRefract = EditorGUILayout.ToggleLeft("REFRACTION SETTINGS", checkRefract, style);
        targetMat.SetInt("_RefractionToggle", Convert.ToInt16(checkRefract));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRefract)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rfrColor = ShaderGUI.FindProperty("_RefractColor", properties);
            MaterialProperty rfTrTog = ShaderGUI.FindProperty("_TRSurfWaveToggle",properties);
            MaterialProperty trInt = ShaderGUI.FindProperty("_Transparency", properties);
            MaterialProperty rfrCont = ShaderGUI.FindProperty("_ScreenContrast", properties);

            materialEditor.ShaderProperty(rfrColor, "Refract Color");
            materialEditor.ShaderProperty(rfTrTog, "Surface Wave Transparency");
            materialEditor.ShaderProperty(trInt, "Transparency");
            materialEditor.ShaderProperty(rfrCont, "Refract Contrast");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Screen Space Blur Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSSBlur = EditorGUILayout.ToggleLeft("SCREEN SPACE BLUR", checkSSBlur, style);
        targetMat.SetInt("_SSBluricTransparent", Convert.ToInt16(checkSSBlur));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSSBlur)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);
            MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);
            MaterialProperty ssbPHgt = ShaderGUI.FindProperty("_PatternHeight", properties);
            MaterialProperty ssbPMult = ShaderGUI.FindProperty("_PatternMultiplier", properties);
            //MaterialProperty ssbPRot = ShaderGUI.FindProperty("_PatternRotator", properties);

            materialEditor.ShaderProperty(ssbTxt, "Blur Pattern");
            materialEditor.ShaderProperty(ssbPHgt, "Pattern Height");
            materialEditor.ShaderProperty(ssbPMult, "Pattern Multiplier");
            style.normal.background = MakeBackground(1, 1, bdColors.dYellowRed(20));
            EditorGUILayout.BeginVertical(style);
            SSTxtInfo = EditorGUILayout.Foldout(SSTxtInfo, "Texture Info",toggleOnLabelClick: true);
            targetMat.SetInt("_SSTxtInfo",Convert.ToInt16(SSTxtInfo));
            if(SSTxtInfo) 
            {
                EditorGUILayout.HelpBox(
                    "Texture Dimensions\n" +
                    " Width: " + ssbTxt.textureValue.width + 
                    " - Height: " + ssbTxt.textureValue.height,
                    MessageType.Info);
            }
            EditorGUILayout.EndVertical();
            materialEditor.FloatProperty(ssbSize, "Size");
            SS_TxtTileOffset(materialEditor, properties);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fog Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkFog = EditorGUILayout.ToggleLeft("FOG SETTINGS", checkFog, style);
        targetMat.SetInt("_FogToggle", Convert.ToInt16(checkFog));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkFog)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty fogCol = ShaderGUI.FindProperty("_FogColor", properties);
            MaterialProperty fogGradType = ShaderGUI.FindProperty("_FogDepthGradeType", properties);
            MaterialProperty fogDepthDist = ShaderGUI.FindProperty("_FogDepthDistance", properties);
            MaterialProperty fogDepthExp = ShaderGUI.FindProperty("_FogDepthExponential", properties);
            MaterialProperty fogDepthSize = ShaderGUI.FindProperty("_FogDepthSize", properties);

            materialEditor.ShaderProperty(fogCol, "Fog Color");
            materialEditor.ShaderProperty(fogGradType, "Fog Depth Grade Type");
            materialEditor.ShaderProperty(fogDepthDist, "Fog Depth Distance");
            materialEditor.ShaderProperty(fogDepthExp, "Fog Depth Exponential");
            materialEditor.ShaderProperty(fogDepthSize, "Fog Depth Size");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Displacement Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkDisp = EditorGUILayout.ToggleLeft("DISPLACEMENT SETTINGS", checkDisp, style);
        targetMat.SetInt("_Displacement", Convert.ToInt16(checkDisp));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDisp)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty waveLength = ShaderGUI.FindProperty("_WaveLength", properties);
            MaterialProperty eWaveMulti = ShaderGUI.FindProperty("_EdgeWaveMultiplier", properties);
            MaterialProperty eWaveExpo = ShaderGUI.FindProperty("_EdgeWaveExponential", properties);
            materialEditor.ShaderProperty(waveLength, "Wave Length");
            materialEditor.ShaderProperty(eWaveMulti, "Edge Wave Multiplier");
            materialEditor.ShaderProperty(eWaveExpo, "Edge Wave Exponential");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Other Shader Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        otherFold = EditorGUILayout.ToggleLeft("OTHER SETTINGS", otherFold, style);
        targetMat.SetInt("_otherFold", Convert.ToInt16(otherFold));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(otherFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty spec = ShaderGUI.FindProperty("_Specular", properties);
            MaterialProperty specCol = ShaderGUI.FindProperty("_SpecularColor", properties);
            MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness", properties);
            MaterialProperty receiveShadows = ShaderGUI.FindProperty("_ReceiveShadows",properties);
            //MaterialProperty clipThreshold = ShaderGUI.FindProperty("_ClipThreshold", properties);
            materialEditor.ShaderProperty(specCol, "Specular Color");
            materialEditor.ShaderProperty(spec, "Specular");
            materialEditor.ShaderProperty(smoothness, "Smoothness");
            materialEditor.ShaderProperty(receiveShadows, "Receive Shadows");
            //materialEditor.ShaderProperty(clipThreshold, "Clip Threshold");
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
        GUI.backgroundColor = bdColors.Transparent(0);
        EditorGUILayout.Space(5);
        style.normal.textColor = bdColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;

        aboutFold = EditorGUILayout.Foldout(aboutFold, "© 2024 BUDU GAMES - Burçak Duruöz", toggleOnLabelClick: true, style);
        if(aboutFold)
        {
            Texture budulogo = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUGames_Logo_m.png", typeof(Texture));
            GUI.backgroundColor = bdColors.GrayP(18, 204);
            style.normal.textColor += bdColors.NexusOrange();
            style.alignment = TextAnchor.UpperCenter;
            GUIContent gc = new GUIContent("BUDU GAMES\nBUDU Shaders\n\n© 2024 F. Burçak Duruöz", budulogo);
            EditorGUILayout.HelpBox(gc, true);
        }
        #endregion

    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_Displacement");
        checkDisp= tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_otherFold");
        otherFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_foamFold");
        foamFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SurfaceToggle");
        checkSurface = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormalToggle");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SSTxtInfo");
        SSTxtInfo = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SSBluricTransparent");
        checkSSBlur = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefractionToggle");
        checkRefract = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_wAFold");
        wAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_wBFold");
        wBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckMidWave");
        checkMidWave = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FogToggle");
        checkFog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DeformFold");
        checkDeform = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_dfNoiseAFold");
        dfNoiseAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_dfNoiseBFold");
        dfNoiseBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFlowMap");
        checkFlowMap= tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_fMapFold");
        fMapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_fTxtFold");
        fTxtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_fMaskFold");
        fMaskFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_dMaskFold");
        dMaskFold = tempVar == 1 ? true : false;
    }

    void flowTextureSettings(MaterialEditor materialEditor, MaterialProperty[] properties,GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
        EditorGUILayout.BeginVertical(style);
        fTxtFold = EditorGUILayout.Foldout(fTxtFold, "Flow Texture Settings", toggleOnLabelClick: true);
        targetMat.SetInt("_fTxtFold", Convert.ToInt16(fTxtFold));
        if(fTxtFold)
        {
            EditorGUI.indentLevel++;
            MaterialProperty fTxtMap = ShaderGUI.FindProperty("_TextureMap", properties);
            MaterialProperty fMapGradeType = ShaderGUI.FindProperty("_TxtGradeType", properties);
            MaterialProperty fMapAmp = ShaderGUI.FindProperty("_FlowTextureAmplitude", properties);
            MaterialProperty fMapCont = ShaderGUI.FindProperty("_FlowTextureContrast", properties);
            MaterialProperty fMapExp = ShaderGUI.FindProperty("_FlowTextureExponential", properties);

            materialEditor.ShaderProperty(fMapGradeType, "Texture Grade Type");
            materialEditor.ShaderProperty(fMapCont, "Flow Texture Contrast");
            materialEditor.ShaderProperty(fMapAmp, "Flow Texture Amplitude");
            materialEditor.ShaderProperty(fMapExp, "Flow Texture Exponential");

            materialEditor.ShaderProperty(fTxtMap, "Flow Texture");
            FlowTxtSet(materialEditor, properties);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    private void FlowTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTXT = new BD_ScaleOffset_GUI();
        selectedTXT.Tile.x = "_ATileX";
        selectedTXT.Tile.y = "_ATileY";
        selectedTXT.Offset.x = "";
        selectedTXT.Offset.y = "";
        selectedTXT.Speed.x = "";
        selectedTXT.Speed.y = "";
        selectedTXT.Anchor.x = "";
        selectedTXT.Anchor.y = "";
        selectedTXT.OverallSpeed = "";
        selectedTXT.Rotate = "_RotateA";
        selectedTXT.RotateSpeed = "";
        EditorGUILayout.LabelField("Tile Offset A");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTXT);
        EditorGUILayout.Space(4);
        BD_ScaleOffset_GUI selectedTXTB = new BD_ScaleOffset_GUI();
        selectedTXTB.Tile.x = "_BTileX";
        selectedTXTB.Tile.y = "_BTileY";
        selectedTXTB.Offset.x = "";
        selectedTXTB.Offset.y = "";
        selectedTXTB.Speed.x = "";
        selectedTXTB.Speed.y = "";
        selectedTXTB.Anchor.x = "";
        selectedTXTB.Anchor.y = "";
        selectedTXTB.OverallSpeed = "";
        selectedTXTB.Rotate = "_RotateB";
        selectedTXTB.RotateSpeed = "";
        EditorGUILayout.LabelField("Tile Offset B");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTXTB);
        MaterialProperty fOffset = ShaderGUI.FindProperty("_OffsetB", properties);
        materialEditor.ShaderProperty(fOffset, "Offset Second Layer");
    }
    public void FoamLayer(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
        EditorGUILayout.BeginVertical(style);
        foamFold = EditorGUILayout.Foldout(foamFold, "Foam Settings", toggleOnLabelClick: true);
        targetMat.SetInt("_foamFold", Convert.ToInt16(foamFold));
        if(foamFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty foamDefTog = ShaderGUI.FindProperty("_FoamDeformToggle", properties);

            materialEditor.ShaderProperty(foamDefTog, "Deform");
            if(foamDefTog.floatValue > 0.0f)
            {
                MaterialProperty foamDefInt = ShaderGUI.FindProperty("_DefWeightFoam", properties);
                materialEditor.ShaderProperty(foamDefInt, "Deform Weight");
            }

            MaterialProperty foamType = ShaderGUI.FindProperty("_FoamType", properties);
            materialEditor.ShaderProperty(foamType, "Foam Type");

            MaterialProperty foamGType = ShaderGUI.FindProperty("_FoamGradeType", properties);
            MaterialProperty foamInvert = ShaderGUI.FindProperty("_FoamInvert", properties);
            MaterialProperty foamAmpl = ShaderGUI.FindProperty("_FoamAmplitude", properties);
            MaterialProperty foamCont = ShaderGUI.FindProperty("_FoamContrast", properties);
            MaterialProperty foamInt = ShaderGUI.FindProperty("_FoamIntensity", properties);
            MaterialProperty foamBias = ShaderGUI.FindProperty("_FoamExp", properties);

            MaterialProperty foamVorAngleSpeed = ShaderGUI.FindProperty("_FoamVoronoiAngleSpeed", properties);
            MaterialProperty foamScale = ShaderGUI.FindProperty("_FoamNoiseScale", properties);

            switch((int)foamType.floatValue)
            {
                case 0:
                    #region None

                    #endregion
                    break;
                case 1:
                    #region Voronoi Cell
                    MaterialProperty foamCellOct = ShaderGUI.FindProperty("_CellFoam_OCT", properties);
                    MaterialProperty foamVorSmooth = ShaderGUI.FindProperty("_FoamVoronoiSmooth", properties);

                    materialEditor.ShaderProperty(foamCellOct, "Cell Octave");
                    materialEditor.ShaderProperty(foamVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(foamVorSmooth, "Smooth");
                    materialEditor.ShaderProperty(foamScale, "Wave Scale");
                    #endregion
                    break;
                case 2:
                    #region Voronoi Caustic
                    MaterialProperty foamCausOct = ShaderGUI.FindProperty("_CausticFoam_OCT", properties);

                    materialEditor.ShaderProperty(foamCausOct, "Caustic Octave");
                    materialEditor.ShaderProperty(foamVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(foamScale, "Wave Scale");
                    #endregion
                    break;
                case 3:
                    #region Perlin
                    materialEditor.ShaderProperty(foamScale, "Wave Scale");
                    #endregion
                    break;
                case 4:
                    #region Texture
                    MaterialProperty foamTxt = ShaderGUI.FindProperty("_FoamTexture", properties);
                    materialEditor.ShaderProperty(foamTxt, "Foam Map");
                    #endregion
                    break;
            }

            materialEditor.ShaderProperty(foamInvert, "Invert");
            materialEditor.ShaderProperty(foamGType, "Grade Type");
            materialEditor.ShaderProperty(foamInt, "Intensity");
            materialEditor.ShaderProperty(foamAmpl, "Amplitude");
            materialEditor.ShaderProperty(foamCont, "Contrast");
            materialEditor.ShaderProperty(foamBias, "Exponential");

            FoamTXTSet(materialEditor, properties);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    void FoamTXTSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTO = new BD_ScaleOffset_GUI();
        selectedTO.Tile.x = "_FoamTileX";
        selectedTO.Tile.y = "_FoamTileY";
        selectedTO.Offset.x = "_FoamOffsetX";
        selectedTO.Offset.y = "_FoamOffsetY";
        selectedTO.Speed.x = "_FoamSpeedX";
        selectedTO.Speed.y = "_FoamSpeedY";
        selectedTO.Anchor.x = "_FoamAnchorX";
        selectedTO.Anchor.y = "_FoamAnchorY";
        selectedTO.OverallSpeed = "_FoamOverallSpeed";
        selectedTO.Rotate = "_FoamRotate";
        selectedTO.RotateSpeed = "_FoamRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTO);
    }
    public void WaveLayerA(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
        EditorGUILayout.BeginVertical(style);
        wAFold = EditorGUILayout.Foldout(wAFold, "Wave Type A", toggleOnLabelClick: true);
        targetMat.SetInt("_wAFold", Convert.ToInt16(wAFold));
        if(wAFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty waDefTog = ShaderGUI.FindProperty("_MidADeformToggle", properties);

            materialEditor.ShaderProperty(waDefTog, "Deform");
            if(waDefTog.floatValue > 0.0f)
            {
                MaterialProperty waDefInt = ShaderGUI.FindProperty("_DefWeightA", properties);
                materialEditor.ShaderProperty(waDefInt, "Deform Weight");
            }

            MaterialProperty wTypeA = ShaderGUI.FindProperty("_WaveAType", properties);
            materialEditor.ShaderProperty(wTypeA, "Wave Type");

            MaterialProperty waType = ShaderGUI.FindProperty("_WaveAGradeType", properties);
            MaterialProperty waInvert = ShaderGUI.FindProperty("_WaveAInvert", properties);
            MaterialProperty waAmpl = ShaderGUI.FindProperty("_WaveAAmplitude", properties);
            MaterialProperty waCont = ShaderGUI.FindProperty("_WaveAContrast", properties);
            MaterialProperty waInt = ShaderGUI.FindProperty("_WaveAIntensity", properties);
            MaterialProperty waBias = ShaderGUI.FindProperty("_WaveAExp", properties);

            MaterialProperty waVorAngleSpeed = ShaderGUI.FindProperty("_WAVoronoiAngleSpeed", properties);
            MaterialProperty waScale = ShaderGUI.FindProperty("_WANoiseScale", properties);

            switch((int)wTypeA.floatValue)
            {
                case 0:
                    #region None

                    #endregion
                    break;
                case 1:
                    #region Voronoi Cell
                    MaterialProperty waCellOct = ShaderGUI.FindProperty("_CellWaveA_OCT", properties);
                    MaterialProperty waVorSmooth = ShaderGUI.FindProperty("_WAVoronoiSmooth", properties);

                    materialEditor.ShaderProperty(waCellOct, "Cell Octave");
                    materialEditor.ShaderProperty(waVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(waVorSmooth, "Smooth");
                    materialEditor.ShaderProperty(waScale, "Wave Scale");
                    #endregion
                    break;
                case 2:
                    #region Voronoi Caustic
                    MaterialProperty naCausOct = ShaderGUI.FindProperty("_CausticA_OCT", properties);

                    materialEditor.ShaderProperty(naCausOct, "Caustic Octave");
                    materialEditor.ShaderProperty(waVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(waScale, "Wave Scale");
                    #endregion
                    break;
                case 3:
                    #region Perlin
                    materialEditor.ShaderProperty(waScale, "Wave Scale");
                    #endregion
                    break;
                case 4:
                    #region Texture
                    MaterialProperty naTxt = ShaderGUI.FindProperty("_WaveTypeA", properties);
                    materialEditor.ShaderProperty(naTxt, "Wave Map");
                    #endregion
                    break;
            }

            materialEditor.ShaderProperty(waInvert, "Invert");
            materialEditor.ShaderProperty(waType, "Grade Type");
            materialEditor.ShaderProperty(waInt, "Intensity");
            materialEditor.ShaderProperty(waAmpl, "Amplitude");
            materialEditor.ShaderProperty(waCont, "Contrast");
            materialEditor.ShaderProperty(waBias, "Exponential");

            WaveTXTASet(materialEditor, properties);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    public void WaveLayerB(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
        EditorGUILayout.BeginVertical(style);
        wBFold = EditorGUILayout.Foldout(wBFold, "Wave Type B", toggleOnLabelClick: true);
        targetMat.SetInt("_wBFold", Convert.ToInt16(wBFold));
        if(wBFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty wbDefTog = ShaderGUI.FindProperty("_MidBDeformToggle",properties);
            
            materialEditor.ShaderProperty(wbDefTog, "Deform");
            if(wbDefTog.floatValue > 0.0f) 
            {
                MaterialProperty wbDefInt = ShaderGUI.FindProperty("_DefWeightB", properties);
                materialEditor.ShaderProperty(wbDefInt, "Deform Weight");
            }

            MaterialProperty wTypeB = ShaderGUI.FindProperty("_WaveBType", properties);
            materialEditor.ShaderProperty(wTypeB, "Wave Type");

            MaterialProperty wbType = ShaderGUI.FindProperty("_WaveBGradeType", properties);
            MaterialProperty wbInvert = ShaderGUI.FindProperty("_WaveBInvert", properties);
            MaterialProperty wbAmpl = ShaderGUI.FindProperty("_WaveBAmplitude", properties);
            MaterialProperty wbCont = ShaderGUI.FindProperty("_WaveBContrast", properties);
            MaterialProperty wbInt = ShaderGUI.FindProperty("_WaveBIntensity", properties);
            MaterialProperty wbBias = ShaderGUI.FindProperty("_WaveBExp", properties);

            MaterialProperty wbVorAngleSpeed = ShaderGUI.FindProperty("_WBVoronoiAngleSpeed", properties);
            MaterialProperty wbScale = ShaderGUI.FindProperty("_WBNoiseScale", properties);

            switch((int)wTypeB.floatValue)
            {
                case 0:
                    #region None

                    #endregion
                    break;
                case 1:
                    #region Voronoi Cell
                    MaterialProperty wbCellOct = ShaderGUI.FindProperty("_CellWaveB_OCT", properties);
                    MaterialProperty wbVorSmooth = ShaderGUI.FindProperty("_WBVoronoiSmooth", properties);

                    materialEditor.ShaderProperty(wbCellOct, "Cell Octave");
                    materialEditor.ShaderProperty(wbVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(wbVorSmooth, "Smooth");
                    materialEditor.ShaderProperty(wbScale, "Wave Scale");
                    #endregion
                    break;
                case 2:
                    #region Voronoi Caustic
                    MaterialProperty naCausOct = ShaderGUI.FindProperty("_CausticA_OCT", properties);

                    materialEditor.ShaderProperty(naCausOct, "Caustic Octave");
                    materialEditor.ShaderProperty(wbVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(wbScale, "Wave Scale");
                    #endregion
                    break;
                case 3:
                    #region Perlin
                    materialEditor.ShaderProperty(wbScale, "Wave Scale");
                    #endregion
                    break;
                case 4:
                    #region Texture
                    MaterialProperty wbTxt = ShaderGUI.FindProperty("_WaveTypeB", properties);
                    materialEditor.ShaderProperty(wbTxt, "Wave Map");
                    #endregion
                    break;
            }

            materialEditor.ShaderProperty(wbInvert, "Invert");
            materialEditor.ShaderProperty(wbType, "Grade Type");
            materialEditor.ShaderProperty(wbInt, "Intensity");
            materialEditor.ShaderProperty(wbAmpl, "Amplitude");
            materialEditor.ShaderProperty(wbCont, "Contrast");
            materialEditor.ShaderProperty(wbBias, "Exponential");

            WaveTXTBSet(materialEditor, properties);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    void WaveTXTASet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTO = new BD_ScaleOffset_GUI();
        selectedTO.Tile.x = "_WTypeATileX";
        selectedTO.Tile.y = "_WTypeATileY";
        selectedTO.Offset.x = "_WTypeAOffsetX";
        selectedTO.Offset.y = "_WTypeAOffsetY";
        selectedTO.Speed.x = "_WTypeASpeedX";
        selectedTO.Speed.y = "_WTypeASpeedY";
        selectedTO.Anchor.x = "_WTypeAAnchorX";
        selectedTO.Anchor.y = "_WTypeAAnchorY";
        selectedTO.OverallSpeed = "_WTypeAOverallSpeed";
        selectedTO.Rotate = "_WTypeARotate";
        selectedTO.RotateSpeed = "_WTypeARotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTO);
    }
    void WaveTXTBSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTO = new BD_ScaleOffset_GUI();
        selectedTO.Tile.x = "_WTypeBTileX";
        selectedTO.Tile.y = "_WTypeBTileY";
        selectedTO.Offset.x = "_WTypeBOffsetX";
        selectedTO.Offset.y = "_WTypeBOffsetY";
        selectedTO.Speed.x = "_WTypeBSpeedX";
        selectedTO.Speed.y = "_WTypeBSpeedY";
        selectedTO.Anchor.x = "_WTypeBAnchorX";
        selectedTO.Anchor.y = "_WTypeBAnchorY";
        selectedTO.OverallSpeed = "_WTypeBOverallSpeed";
        selectedTO.Rotate = "_WTypeBRotate";
        selectedTO.RotateSpeed = "_WTypeBRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTO);
    }
    public void DefLayerA(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
        EditorGUILayout.BeginVertical(style);
        dfNoiseAFold = EditorGUILayout.Foldout(dfNoiseAFold, "Deform Noise Type A", toggleOnLabelClick: true);
        targetMat.SetInt("_dfNoiseAFold", Convert.ToInt16(dfNoiseAFold));
        if(dfNoiseAFold)
        {
            EditorGUI.indentLevel++;

            MaterialProperty dfNTypeA = ShaderGUI.FindProperty("_NoiseAType", properties);
            materialEditor.ShaderProperty(dfNTypeA, "Noise Type");

            MaterialProperty naType = ShaderGUI.FindProperty("_DFAGradeType", properties);
            MaterialProperty naInvert = ShaderGUI.FindProperty("_DfNoiseAInvert", properties);
            MaterialProperty naAmpl = ShaderGUI.FindProperty("_DFAAmplitude", properties);
            MaterialProperty naCont = ShaderGUI.FindProperty("_NoiseAContrast", properties);
            MaterialProperty naInt = ShaderGUI.FindProperty("_NA_Intensity", properties);
            MaterialProperty naBias = ShaderGUI.FindProperty("_DFAExp", properties);


            MaterialProperty naVorAngleSpeed = ShaderGUI.FindProperty("_AVoronoiAngleSpeed", properties);
            MaterialProperty naScale = ShaderGUI.FindProperty("_ANoiseScale", properties);

            switch((int)dfNTypeA.floatValue)
            {
                case 0:
                    #region None

                    #endregion
                    break;
                case 1:
                    #region Voronoi Cell
                    MaterialProperty naCellOct = ShaderGUI.FindProperty("_CellA_OCT", properties);
                    MaterialProperty naVorSmooth = ShaderGUI.FindProperty("_AVoronoiSmooth", properties);

                    materialEditor.ShaderProperty(naCellOct, "Cell Octave");
                    materialEditor.ShaderProperty(naVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(naVorSmooth, "Smooth");
                    materialEditor.ShaderProperty(naScale, "Noise Scale");
                    #endregion
                    break;
                case 2:
                    #region Voronoi Caustic
                    MaterialProperty naCausOct = ShaderGUI.FindProperty("_CausticA_OCT", properties);

                    materialEditor.ShaderProperty(naCausOct, "Caustic Octave");
                    materialEditor.ShaderProperty(naVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(naScale, "Noise Scale");
                    #endregion
                    break;
                case 3:
                    #region Perlin
                    materialEditor.ShaderProperty(naScale, "Noise Scale");
                    #endregion
                    break;
                case 4:
                    #region Texture
                    MaterialProperty naTxt = ShaderGUI.FindProperty("_DeformNoiseTypeA", properties);
                    materialEditor.ShaderProperty(naTxt, "Noise Map");
                    #endregion
                    break;
            }

            materialEditor.ShaderProperty(naInvert, "Invert");
            materialEditor.ShaderProperty(naType, "Grade Type");
            materialEditor.ShaderProperty(naInt, "Intensity");
            materialEditor.ShaderProperty(naAmpl, "Amplitude");
            materialEditor.ShaderProperty(naCont, "Contrast");
            materialEditor.ShaderProperty(naBias, "Exponential");

            DeformTXTASet(materialEditor, properties);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    public void DefLayerB(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
        EditorGUILayout.BeginVertical(style);
        dfNoiseBFold = EditorGUILayout.Foldout(dfNoiseBFold, "Deform Noise Type B", toggleOnLabelClick: true);
        targetMat.SetInt("_dfNoiseBFold", Convert.ToInt16(dfNoiseBFold));
        if(dfNoiseBFold)
        {
            EditorGUI.indentLevel++;

            MaterialProperty dfNTypeB = ShaderGUI.FindProperty("_NoiseBType", properties);
            materialEditor.ShaderProperty(dfNTypeB, "Noise Type");

            MaterialProperty nbType = ShaderGUI.FindProperty("_DFBGradeType", properties);
            MaterialProperty nbInvert = ShaderGUI.FindProperty("_DfNoiseBInvert", properties);
            MaterialProperty nbAmpl = ShaderGUI.FindProperty("_DFBAmplitude", properties);
            MaterialProperty nbCont = ShaderGUI.FindProperty("_NoiseBContrast", properties);
            MaterialProperty nbInt = ShaderGUI.FindProperty("_NB_Intensity", properties);
            MaterialProperty nbBias = ShaderGUI.FindProperty("_DFBExp", properties);

            MaterialProperty nbVorAngleSpeed = ShaderGUI.FindProperty("_BVoronoiAngleSpeed", properties);
            MaterialProperty nbScale = ShaderGUI.FindProperty("_BNoiseScale", properties);

            switch((int)dfNTypeB.floatValue)
            {
                case 0:
                    #region None

                    #endregion
                    break;
                case 1:
                    #region Voronoi Cell
                    MaterialProperty nbCellOct = ShaderGUI.FindProperty("_CellB_OCT", properties);
                    MaterialProperty nbVorSmooth = ShaderGUI.FindProperty("_BVoronoiSmooth", properties);

                    materialEditor.ShaderProperty(nbCellOct, "Cell Octave");
                    materialEditor.ShaderProperty(nbVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(nbVorSmooth, "Smooth");
                    materialEditor.ShaderProperty(nbScale, "Noise Scale");
                    #endregion
                    break;
                case 2:
                    #region Voronoi Caustic
                    MaterialProperty nbCausOct = ShaderGUI.FindProperty("_CausticA_OCT", properties);

                    materialEditor.ShaderProperty(nbCausOct, "Caustic Octave");
                    materialEditor.ShaderProperty(nbVorAngleSpeed, "Angle Speed");
                    materialEditor.ShaderProperty(nbScale, "Noise Scale");

                    #endregion
                    break;
                case 3:
                    #region Perlin
                    materialEditor.ShaderProperty(nbScale, "Noise Scale");
                    #endregion
                    break;
                case 4:
                    #region Texture
                    MaterialProperty nbTxt = ShaderGUI.FindProperty("_DeformNoiseTypeB", properties);
                    materialEditor.ShaderProperty(nbTxt, "Noise Map");
                    #endregion
                    break;

            }

            materialEditor.ShaderProperty(nbInvert, "Invert");
            materialEditor.ShaderProperty(nbType, "Grade Type");
            materialEditor.ShaderProperty(nbInt, "Intensity");
            materialEditor.ShaderProperty(nbAmpl, "Amplitude");
            materialEditor.ShaderProperty(nbCont, "Contrast");
            materialEditor.ShaderProperty(nbBias, "Exponential");

            DeformTXTBSet(materialEditor, properties);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
    void DeformTXTASet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTO = new BD_ScaleOffset_GUI();
        selectedTO.Tile.x = "_NTypeATileX";
        selectedTO.Tile.y = "_NTypeATileY";
        selectedTO.Offset.x = "_NTypeAOffsetX";
        selectedTO.Offset.y = "_NTypeAOffsetY";
        selectedTO.Speed.x = "_NTypeASpeedX";
        selectedTO.Speed.y = "_NTypeASpeedY";
        selectedTO.Anchor.x = "_NTypeAAnchorX";
        selectedTO.Anchor.y = "_NTypeAAnchorY";
        selectedTO.OverallSpeed = "_NTypeAOverallSpeed";
        selectedTO.Rotate = "_NTypeARotate";
        selectedTO.RotateSpeed = "_NTypeARotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTO);
    }
    void DeformTXTBSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedTO = new BD_ScaleOffset_GUI();
        selectedTO.Tile.x = "_NTypeBTileX";
        selectedTO.Tile.y = "_NTypeBTileY";
        selectedTO.Offset.x = "_NTypeBOffsetX";
        selectedTO.Offset.y = "_NTypeBOffsetY";
        selectedTO.Speed.x = "_NTypeBSpeedX";
        selectedTO.Speed.y = "_NTypeBSpeedY";
        selectedTO.Anchor.x = "_NTypeBAnchorX";
        selectedTO.Anchor.y = "_NTypeBAnchorY";
        selectedTO.OverallSpeed = "_NTypeBOverallSpeed";
        selectedTO.Rotate = "_NTypeBRotate";
        selectedTO.RotateSpeed = "_NTypeBRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedTO);
    }
    private void SS_TxtTileOffset(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_SSTileX";
        selected.Tile.y = "_SSTileY";
        selected.Offset.x = "";
        selected.Offset.y = "";
        selected.Anchor.x = "";
        selected.Anchor.y = "";
        selected.Speed.x = "";
        selected.Speed.y = "";
        //selected.Rotate = "_PatternRotator";
        selected.Rotate = "";
        selected.OverallSpeed = "";
        selected.RotateSpeed = "";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
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

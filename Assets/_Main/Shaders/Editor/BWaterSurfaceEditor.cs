using UnityEngine;
using UnityEditor;
using System;
using budu;
using TMPro;

public class BWaterSurfaceEditor : ShaderGUI
{
    bool checkDef, checkFlowMap, checkDeform, checkFog, checkMidWave, checkReflect;
    bool aboutFold, fMapFold, fTxtFold, fMaskFold, dMaskFold, dfNoiseAFold, dfNoiseBFold, wAFold, wBFold;
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

        /////////////
        //EditorGUILayout.Space(50);
        //GUI.backgroundColor = bdColors.Black(100);
        //base.OnGUI(materialEditor, properties);
    }

    void loadMaterialVariables(Material targetMat)
    {
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

    public void WaveLayerA(MaterialEditor materialEditor, MaterialProperty[] properties, GUIStyle style, Material targetMat)
    {
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
        EditorGUILayout.BeginVertical(style);
        wAFold = EditorGUILayout.Foldout(wAFold, "Wave Type A", toggleOnLabelClick: true);
        targetMat.SetInt("_wAFold", Convert.ToInt16(wAFold));
        if(wAFold)
        {
            EditorGUI.indentLevel++;

            EditorGUI.indentLevel++;

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
        BDShaderGUI.ScaleOffsetGUI(materialEditor,properties, selectedTXT);
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
        MaterialProperty fOffset = ShaderGUI.FindProperty("_OffsetB",properties);
        materialEditor.ShaderProperty(fOffset, "Offset Second Layer");
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

    /*
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

    private void SurfTxtA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "_DefNoiseBInvert";
        selectedMisc.Intensity = "_NoiseB_Intensity";
        selectedMisc.Contrast = "_NoiseB_Contrast";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_SurfaceCATileX";
        selected.Tile.y = "_SurfaceCATileY";
        selected.Offset.x = "_SurfaceCAOffsetX";
        selected.Offset.y = "_SurfaceCAOffsetY";
        selected.Speed.x = "_SurfaceCASpeedX";
        selected.Speed.y = "_SurfaceCASpeedY";
        selected.Anchor.x = "_SurfaceCAAnchorX";
        selected.Anchor.y = "_SurfaceCAAnchorY";
        selected.OverallSpeed = "_SurfCTypeAOverallSpeed";
        selected.Rotate = "_SurfaceCARot";
        selected.RotateSpeed = "_SurfaceCARotSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }
    private void SurfTxtB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "_DefNoiseBInvert";
        selectedMisc.Intensity = "_NoiseB_Intensity";
        selectedMisc.Contrast = "_NoiseB_Contrast";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_SurfaceCBTileX";
        selected.Tile.y = "_SurfaceCBTileY";
        selected.Offset.x = "_SurfaceCBOffsetX";
        selected.Offset.y = "_SurfaceCBOffsetY";
        selected.Speed.x = "_SurfaceCBSpeedX";
        selected.Speed.y = "_SurfaceCBSpeedY";
        selected.Anchor.x = "_SurfaceCBAnchorX";
        selected.Anchor.y = "_SurfaceCBAnchorY";
        selected.OverallSpeed = "_SurfCTypeBOverallSpeed";
        selected.Rotate = "_SurfaceCBRot";
        selected.RotateSpeed = "_SurfaceCBRotSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }

    private void DeformTxtA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_NoiseTypes_GUI selectedNT = new BD_NoiseTypes_GUI();
        selectedNT.NoiseType = "_DeformANoiseType";
        selectedNT.VorCellOct = "_Def_VorCell_A_Type";
        selectedNT.VorCaustOct = "_Def_VorCaustic_A_Type";
        selectedNT.TextureMap = "_DeformAMap";
        selectedNT.NoiseScale = "_DeformAScale";
        selectedNT.NoiseSmooth = "_DeformASmooth";
        selectedNT.NoiseAngle = "_DeformAAngle";

        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNT);

        if(ShaderGUI.FindProperty(selectedNT.NoiseType, properties).floatValue > 0.1f)
        {
            BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
            selectedMisc.Invert = "_DefNoiseAInvert";
            selectedMisc.Intensity = "_DeformAIntensity";
            selectedMisc.Contrast = "_DeformAContrast";
            BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Tile.x = "_DeformATileX";
            selected.Tile.y = "_DeformATileY";
            selected.Offset.x = "_DeformAOffsetX";
            selected.Offset.y = "_DeformAOffsetY";
            selected.Speed.x = "_DeformASpeedX";
            selected.Speed.y = "_DeformASpeedY";
            selected.Anchor.x = "_DeformAAnchorX";
            selected.Anchor.y = "_DeformAAnchorY";
            selected.OverallSpeed = "_DeformAOverallSpeed";
            selected.Rotate = "_DeformARotate";
            selected.RotateSpeed = "_DeformARotateSpeed";
            BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
        }
    }
    private void DeformTxtB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_NoiseTypes_GUI selectedNT = new BD_NoiseTypes_GUI();
        selectedNT.NoiseType = "_DeformBNoiseType";
        selectedNT.VorCellOct = "_Def_VorCell_B_Type";
        selectedNT.VorCaustOct = "_Def_VorCaustic_B_Type";
        selectedNT.TextureMap = "_DeformBMap";
        selectedNT.NoiseScale = "_DeformBScale";
        selectedNT.NoiseSmooth = "_DeformBSmooth";
        selectedNT.NoiseAngle = "_DeformBAngle";

        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNT);

        if(ShaderGUI.FindProperty(selectedNT.NoiseType, properties).floatValue > 1.1f)
        {
            BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
            selectedMisc.Invert = "_DefNoiseBInvert";
            selectedMisc.Intensity = "_DeformBIntensity";
            selectedMisc.Contrast = "_DeformBContrast";
            BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Tile.x = "_DeformBTileX";
            selected.Tile.y = "_DeformBTileY";
            selected.Offset.x = "_DeformBOffsetX";
            selected.Offset.y = "_DeformBOffsetY";
            selected.Speed.x = "_DeformBSpeedX";
            selected.Speed.y = "_DeformBSpeedY";
            selected.Anchor.x = "_DeformBAnchorX";
            selected.Anchor.y = "_DeformBAnchorY";
            selected.OverallSpeed = "_DeformBOverallSpeed";
            selected.Rotate = "_DeformBRotate";
            selected.RotateSpeed = "_DeformBRotateSpeed";
            BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
        }
    }

    private void MiddleWaveA(MaterialEditor materialEditor, MaterialProperty[] properties, int type)
    {
        BD_NoiseTypes_GUI selectedNoise = new BD_NoiseTypes_GUI();
        selectedNoise.NoiseType = "_NoiseTypeA";
        selectedNoise.VorCellOct = "_Def_VorCell_A_Type";
        selectedNoise.VorCaustOct = "_Def_VorCaustic_A_Type";
        selectedNoise.TextureMap = "_NoiseAMap";
        selectedNoise.NoiseAngle = "_DefVorAAngle";
        selectedNoise.NoiseSmooth = "_DefVorASmooth";
        selectedNoise.NoiseScale = "_DefNoiseAScale";
        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNoise);

        if(type > 0)
        {
            BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
            selectedMisc.Invert = "_DefNoiseAInvert";
            selectedMisc.Intensity = "_NoiseA_Intensity";
            selectedMisc.Contrast = "_NoiseA_Contrast";
            BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Tile.x = "_DefVorATileX";
            selected.Tile.y = "_DefVorATileY";
            selected.Offset.x = "_DefVorAOffsetX";
            selected.Offset.y = "_DefVorAOffsetY";
            selected.Speed.x = "_DefVorASpeedX";
            selected.Speed.y = "_DefVorASpeedY";
            selected.Anchor.x = "_DefTypeAAnchorX";
            selected.Anchor.y = "_DefTypeAAnchorY";
            selected.OverallSpeed = "_DefNoiseTypeAOverallSpeed";
            selected.Rotate = "_DefTypeARot";
            selected.RotateSpeed = "_DefTypeARotSpeed";
            BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
        }
    }
    private void MiddleWaveB(MaterialEditor materialEditor, MaterialProperty[] properties, int type)
    {
        BD_NoiseTypes_GUI selectedNoise = new BD_NoiseTypes_GUI();
        selectedNoise.NoiseType = "_NoiseTypeB";
        selectedNoise.VorCellOct = "_Def_VorCell_B_Type";
        selectedNoise.VorCaustOct = "_Def_VorCaustic_B_Type";
        selectedNoise.TextureMap = "_NoiseBMap";
        selectedNoise.NoiseAngle = "_DefVorBAngle";
        selectedNoise.NoiseSmooth = "_DefVorBSmooth";
        selectedNoise.NoiseScale = "_DefNoiseBScale";
        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNoise);

        if(type > 0)
        {
            BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
            selectedMisc.Invert = "_DefNoiseBInvert";
            selectedMisc.Intensity = "_NoiseB_Intensity";
            selectedMisc.Contrast = "_NoiseB_Contrast";
            BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Tile.x = "_DefVorBTileX";
            selected.Tile.y = "_DefVorBTileY";
            selected.Offset.x = "_DefVorBOffsetX";
            selected.Offset.y = "_DefVorBOffsetY";
            selected.Speed.x = "_DefVorBSpeedX";
            selected.Speed.y = "_DefVorBSpeedY";
            selected.Anchor.x = "_DefTypeBAnchorX";
            selected.Anchor.y = "_DefTypeBAnchorY";
            selected.OverallSpeed = "_DefNoiseTypeBOverallSpeed";
            selected.Rotate = "_DefTypeBRot";
            selected.RotateSpeed = "_DefTypeBRotSpeed";
            BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
        }
    }

    private void MidWaveASet(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, int type)
    {
        midNAFold = EditorGUILayout.Foldout(midNAFold, "Noise Type A", toggleOnLabelClick: true);
        targetMat.SetInt("_MiddleNAFold", Convert.ToInt16(midNAFold));
        if(midNAFold)
        {
            EditorGUI.indentLevel++;
            MiddleWaveA(materialEditor, properties, type);
            EditorGUI.indentLevel--;
        }
    }
    private void MidWaveBSet(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, int type)
    {
        midNBFold = EditorGUILayout.Foldout(midNBFold, "Noise Type B", toggleOnLabelClick: true);
        targetMat.SetInt("_MiddleNBFold", Convert.ToInt16(midNBFold));
        if(midNBFold)
        {
            EditorGUI.indentLevel++;
            MiddleWaveB(materialEditor, properties, type);
            EditorGUI.indentLevel--;
        }            
    }

    private void ShoreTextureSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "_InvertShoreTexture";
        selectedMisc.Intensity = "_ShoreIntensity";
        selectedMisc.Contrast = "_ShoreContrast";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_ShoreTileX";
        selected.Tile.y = "_ShoreTileY";
        selected.Offset.x = "_ShoreOffsetX";
        selected.Offset.y = "_ShoreOffsetY";
        selected.Speed.x = "_ShoreSpeedX";
        selected.Speed.y = "_ShoreSpeedY";
        selected.Anchor.x = "_ShoreAnchorX";
        selected.Anchor.y = "_ShoreAnchorY";
        selected.OverallSpeed = "_ShoreOverallSpeed";
        selected.Rotate = "_ShoreRotate";
        selected.RotateSpeed = "_ShoreRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }
    private void FoamTextureSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "_InvertFoamTexture";
        selectedMisc.Intensity = "_FoamIntensity";
        selectedMisc.Contrast = "_FoamContrast";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_FoamTileX";
        selected.Tile.y = "_FoamTileY";
        selected.Offset.x = "_FoamOffsetX";
        selected.Offset.y = "_FoamOffsetY";
        selected.Speed.x = "_FoamSpeedX";
        selected.Speed.y = "_FoamSpeedY";
        selected.Anchor.x = "_FoamAnchorX";
        selected.Anchor.y = "_FoamAnchorY";
        selected.OverallSpeed = "_FoamOverallSpeed";
        selected.Rotate = "_FoamRotate";
        selected.RotateSpeed = "_FoamRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }

    private void NormTxtA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "";
        selectedMisc.Intensity = "_NrmAInt";
        selectedMisc.Contrast = "";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_NormATileX";
        selected.Tile.y = "_NormATileY";
        selected.Offset.x = "_NormAOffsetX";
        selected.Offset.y = "_NormAOffsetY";
        selected.Speed.x = "_NormASpeedX";
        selected.Speed.y = "_NormASpeedY";
        selected.Anchor.x = "_NormAAnchorX";
        selected.Anchor.y = "_NormAAnchorY";
        selected.OverallSpeed = "_NormAOverallSpeed";
        selected.Rotate = "_NormARot";
        selected.RotateSpeed = "_NormARotSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }
    private void NormTxtB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "";
        selectedMisc.Intensity = "_NrmBInt";
        selectedMisc.Contrast = "";
        BDShaderGUI.MiscGUI(materialEditor, properties, selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_NormBTileX";
        selected.Tile.y = "_NormBTileY";
        selected.Offset.x = "_NormBOffsetX";
        selected.Offset.y = "_NormBOffsetY";
        selected.Speed.x = "_NormBSpeedX";
        selected.Speed.y = "_NormBSpeedY";
        selected.Anchor.x = "_NormBAnchorX";
        selected.Anchor.y = "_NormBAnchorY";
        selected.OverallSpeed = "_NormBOverallSpeed";
        selected.Rotate = "_NormBRot";
        selected.RotateSpeed = "_NormBRotSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
    }

    private void NormASet(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, int type)
    {
        normGenAFold = EditorGUILayout.Foldout(normGenAFold, "Noise Type A", toggleOnLabelClick: true);
        targetMat.SetInt("_NormGenAFold", Convert.ToInt16(normGenAFold));
        if(normGenAFold)
        {
            EditorGUI.indentLevel++;
            MiddleWaveA(materialEditor, properties, type);
            EditorGUI.indentLevel--;
        }
    }
    private void NormBSet(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, int type)
    {
        normGenBFold = EditorGUILayout.Foldout(normGenBFold, "Noise Type B", toggleOnLabelClick: true);
        targetMat.SetInt("_NormGenBFold", Convert.ToInt16(normGenBFold));
        if(normGenBFold)
        {
            EditorGUI.indentLevel++;
            MiddleWaveB(materialEditor, properties, type);
            EditorGUI.indentLevel--;
        }
    }
    */
}

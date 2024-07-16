using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BWaterSurfaceEditor : ShaderGUI
{
    bool checkSurface, checkDepth, checkAlpha, checkMiddle, checkDeform, checkNormal, checkShore, checkReflect, checkRefract, checkFog, checkNormTxt, checkSSBlur, checkFlowMap;
    bool aboutFold, surfaceMAFold, surfaceMBFold, shoreTXFold, foamFold, noiseFold, midNAFold, midNBFold, normAFold, normBFold, normGenAFold, normGenBFold, deformAFold, deformBFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();
        GUIStyle style2 = new GUIStyle();

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
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Flow Map Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkFlowMap = EditorGUILayout.ToggleLeft("FLOW MAP SETTINGS", checkFlowMap, style);
        targetMat.SetInt("_FlowMapSettings", Convert.ToInt16(checkFlowMap));
        EditorGUILayout.BeginVertical();
        if(checkFlowMap)
        {
            MaterialProperty flType = ShaderGUI.FindProperty("_FlowType", properties);
            materialEditor.ShaderProperty(flType, "Flow Type");
            switch(flType.floatValue)
            {
                case 0:
                    // Depth Map
                    MaterialProperty dpGrade = ShaderGUI.FindProperty("_DepthGradeType", properties);
                    MaterialProperty dpDist = ShaderGUI.FindProperty("_DepthDistance", properties);
                    MaterialProperty dpExp = ShaderGUI.FindProperty("_DepthExponential",properties);
                    MaterialProperty dpSize = ShaderGUI.FindProperty("_DepthSize", properties);
                    MaterialProperty dpCont = ShaderGUI.FindProperty("_FlowDepthContrast", properties);

                    materialEditor.ShaderProperty(dpGrade, "Depth Grade Type");
                    materialEditor.ShaderProperty(dpDist, "Depth Distance");
                    materialEditor.ShaderProperty(dpExp,"Depth Exponential");
                    materialEditor.ShaderProperty(dpSize, "Depth Size");
                    materialEditor.ShaderProperty(dpCont, "Depth Contrast");
                    break;
                case 1:
                    // Texture Map
                    MaterialProperty flMap = ShaderGUI.FindProperty("_FlowMap", properties);
                    MaterialProperty flGrade = ShaderGUI.FindProperty("_FlowMapGrade", properties);
                    MaterialProperty flExp = ShaderGUI.FindProperty("_FlowMapExp", properties);

                    materialEditor.ShaderProperty(flGrade, "Flow Map Grade");
                    materialEditor.ShaderProperty(flMap, "Flow Map");
                    materialEditor.ShaderProperty(flExp, "Flow Map Exponent");
                    break;
            }
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Deform Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkDeform = EditorGUILayout.ToggleLeft("DEFORM SETTINGS", checkDeform, style);
        targetMat.SetInt("_DeformSettings", Convert.ToInt16(checkDeform));
        if(checkDeform)
        {
            #region Deform Noise Settings
            EditorGUI.indentLevel++;
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            EditorGUILayout.BeginVertical(style);
            noiseFold = EditorGUILayout.Foldout(noiseFold, "Deform Noise Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_NoiseFold", Convert.ToInt16(noiseFold));
            if(noiseFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty deformMixType = ShaderGUI.FindProperty("_DeformMixType", properties);
                materialEditor.ShaderProperty(deformMixType, "Noise Type");
                switch((int)deformMixType.floatValue)
                {
                    #region None
                    case 0:
                        // No GUI
                        break;
                    #endregion
                    #region One Layer
                    case 1:
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(55));
                        EditorGUILayout.BeginVertical(style);
                        deformAFold = EditorGUILayout.Foldout(deformAFold, "Deform A Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_DeformAFold", Convert.ToInt16(deformAFold));
                        if(deformAFold)
                        {
                            DeformTxtA(materialEditor, properties);
                        }
                        EditorGUILayout.EndVertical();
                        break;
                    #endregion
                    #region Multiply | Additive | Subtract | Divide | FMod | FMod Invert
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                        #region Deform A Settings
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(55));
                        EditorGUILayout.BeginVertical(style);
                        deformAFold = EditorGUILayout.Foldout(deformAFold, "Deform A Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_DeformAFold", Convert.ToInt16(deformAFold));
                        if(deformAFold)
                        {
                            DeformTxtA(materialEditor, properties);
                        }
                        EditorGUILayout.EndVertical();
                        #endregion
                        #region Deform B Settings
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(90));
                        EditorGUILayout.BeginVertical(style);
                        deformBFold = EditorGUILayout.Foldout(deformBFold, "Deform B Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_DeformBFold", Convert.ToInt16(deformBFold));
                        if(deformBFold)
                        {
                            DeformTxtB(materialEditor, properties);
                        }
                        EditorGUILayout.EndVertical();
                        #endregion
                        break;
                    #endregion
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
            #endregion
        }
        #endregion

        #region Midle Wave Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkMiddle = EditorGUILayout.ToggleLeft("MIDDLE WAVE SETTINGS", checkMiddle, style);
        targetMat.SetInt("_MiddleWave", Convert.ToInt16(checkMiddle));
        if(checkMiddle)
        {
            EditorGUI.indentLevel++;

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            EditorGUILayout.BeginVertical(style);

            #region Middle Wave Default Settings
            MaterialProperty defNoiseMixType = ShaderGUI.FindProperty("_DefNoiseMixType", properties);
            materialEditor.ShaderProperty(defNoiseMixType, "Mix Type");
            if((int)defNoiseMixType.floatValue > 0)
            {
                MaterialProperty midWaveInt = ShaderGUI.FindProperty("_MiddleWaveIntensity", properties);
                MaterialProperty defNoGradeScale = ShaderGUI.FindProperty("_DefNoiseGradeScale", properties);
                MaterialProperty defNoGradeOffset = ShaderGUI.FindProperty("_DefNoiseGradeOffset", properties);
                MaterialProperty defNoContrast = ShaderGUI.FindProperty("_DefNoiseContrast", properties);
                MaterialProperty defNoGradeType = ShaderGUI.FindProperty("_DefNoiseGradeType", properties);
                MaterialProperty deformTog = ShaderGUI.FindProperty("_DeformToggle", properties);
                MaterialProperty deformScale = ShaderGUI.FindProperty("_DeformScale", properties);
                materialEditor.ShaderProperty(midWaveInt, "Middle Wave Intensity");
                materialEditor.ShaderProperty(defNoGradeType, "Grade Type");
                materialEditor.ShaderProperty(defNoContrast, "Noise Contrast");
                materialEditor.ShaderProperty(defNoGradeScale, "Noise Grade Scale");
                materialEditor.ShaderProperty(defNoGradeOffset, "Noise Grade Offset");
                materialEditor.ShaderProperty(deformTog, "Deform Toggle");
                materialEditor.ShaderProperty(deformScale, "Deform Scale");
            }
            #endregion

            MaterialProperty ntTypeA = ShaderGUI.FindProperty("_NoiseTypeA", properties);
            MaterialProperty ntTypeB = ShaderGUI.FindProperty("_NoiseTypeB", properties);

            switch((int)defNoiseMixType.floatValue)
            {
                case 0: // no 
                    break;
                case 1:
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(55));
                    EditorGUILayout.BeginVertical(style);
                    MidWaveASet(materialEditor, properties, targetMat, (int)ntTypeA.floatValue);
                    EditorGUILayout.EndVertical();
                    break;
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(55));
                    EditorGUILayout.BeginVertical(style);
                    MidWaveASet(materialEditor, properties, targetMat, (int)ntTypeA.floatValue);
                    EditorGUILayout.EndVertical();
                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(90));
                    EditorGUILayout.BeginVertical(style);
                    MidWaveBSet(materialEditor, properties, targetMat, (int)ntTypeB.floatValue);
                    EditorGUILayout.EndVertical();
                    break;
            }

            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        #endregion


        /*

#region Surface Texture Settings - OK
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkSurface = EditorGUILayout.ToggleLeft("SURFACE SETTINGS", checkSurface, style);
targetMat.SetInt("_SurfaceWaves",Convert.ToInt16(checkSurface));
EditorGUILayout.BeginVertical();
if(checkSurface)
{
    EditorGUI.indentLevel++;
    MaterialProperty sc = ShaderGUI.FindProperty("_SurfaceColor", properties);
    MaterialProperty shtb = ShaderGUI.FindProperty("_SurfaceTextureBlendingType", properties);
    MaterialProperty shdef = ShaderGUI.FindProperty("_SurfaceDeformation", properties);
    MaterialProperty shdefScl = ShaderGUI.FindProperty("_SurfaceDeformScale", properties);

    materialEditor.ColorProperty(sc, "Surface Color");
    materialEditor.ShaderProperty(shtb, "Texture Blending Type");
    materialEditor.ShaderProperty(shdef, "Surface Deformation");
    materialEditor.ShaderProperty(shdefScl, "Surface Deformation Scale");

    MaterialProperty scma = ShaderGUI.FindProperty("_SurfaceColorMapA", properties);
    MaterialProperty scmb = ShaderGUI.FindProperty("_SurfaceColorMapB", properties);

    switch((int)(shtb.floatValue))
    {
        #region No Texture
        case 0:
            // No Parameters
            break;
        #endregion
        #region One Texture
        case 1:
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            EditorGUILayout.BeginVertical(style);
            surfaceMAFold = EditorGUILayout.Foldout(surfaceMAFold, "Map A Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SurfaceMapA", Convert.ToInt16(surfaceMAFold));
            #region Surface Map A
            if(surfaceMAFold)
            {
                materialEditor.TextureProperty(scma, "Surface Map A");
                SurfTxtA(materialEditor, properties);
            }
            #endregion
            EditorGUILayout.EndVertical();
            break;
        #endregion
        #region Add Sub Mult Div FMod FModInv
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            #region Map A Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
            EditorGUILayout.BeginVertical(style);
            surfaceMAFold = EditorGUILayout.Foldout(surfaceMAFold, "Map A Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SurfaceMapA", Convert.ToInt16(surfaceMAFold));
            if(surfaceMAFold)
            {
                materialEditor.TextureProperty(scma, "Surface Map A");
                SurfTxtA(materialEditor, properties);
            }
            EditorGUILayout.EndVertical();
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
            EditorGUILayout.BeginVertical(style);
            surfaceMBFold = EditorGUILayout.Foldout(surfaceMBFold, "Map B Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SurfaceMapB", Convert.ToInt16(surfaceMBFold));
            #endregion
            #region Map B Settings
            if(surfaceMBFold)
            {
                materialEditor.TextureProperty(scmb, "Surface Map B");
                SurfTxtB(materialEditor, properties);
            }
            EditorGUILayout.EndVertical();
            #endregion
            break;
            #endregion
    }

    EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion






#region Shore Settings
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkShore = EditorGUILayout.ToggleLeft("SHORE SETTINGS", checkShore, style);
targetMat.SetInt("_ShoreToggle", Convert.ToInt16(checkShore));
EditorGUILayout.BeginVertical();
if(checkShore)
{
EditorGUI.indentLevel++;
MaterialProperty shoreInt = ShaderGUI.FindProperty("_ShoreIntensity", properties);
materialEditor.ShaderProperty(shoreInt, "Shore Intensity");

#region Shore Settings
style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
EditorGUILayout.BeginVertical(style);

MaterialProperty txGradeType = ShaderGUI.FindProperty("_TextureGradeType", properties);

shoreTXFold = EditorGUILayout.Foldout(shoreTXFold, "Shore Settings", toggleOnLabelClick: true);
targetMat.SetInt("_AShoreFold", Convert.ToInt16(shoreTXFold));
if(shoreTXFold)
{
EditorGUI.indentLevel++;
materialEditor.ShaderProperty(txGradeType, "Grade Type");
MaterialProperty shtxt = ShaderGUI.FindProperty("_ShoreTexture", properties);
MaterialProperty shInv = ShaderGUI.FindProperty("_InvertShoreTexture", properties);
MaterialProperty shGrScl = ShaderGUI.FindProperty("_ShoreGradeScale", properties);
MaterialProperty shGrOff = ShaderGUI.FindProperty("_ShoreGradeOffset", properties);

MaterialProperty shtix = ShaderGUI.FindProperty("_ShoreTileX", properties);
MaterialProperty shtiy = ShaderGUI.FindProperty("_ShoreTileY", properties);
MaterialProperty shspx = ShaderGUI.FindProperty("_WaveSpeedX", properties);
MaterialProperty shspy = ShaderGUI.FindProperty("_WaveSpeedY", properties);

materialEditor.TextureProperty(shtxt, "Shore Texture");
materialEditor.ShaderProperty(shInv, "Invert Shore Texture");
materialEditor.FloatProperty(shGrScl, "Grade Scale");
materialEditor.FloatProperty(shGrOff, "Grade Offset");

EditorGUILayout.BeginHorizontal();
EditorGUIUtility.labelWidth = 130;
EditorGUIUtility.fieldWidth = 50;
materialEditor.FloatProperty(shtix, "Tile X");
materialEditor.FloatProperty(shtiy, "Tile Y");
EditorGUIUtility.labelWidth = 0;
EditorGUIUtility.fieldWidth = 0;
EditorGUILayout.EndHorizontal();

EditorGUILayout.BeginHorizontal();
EditorGUIUtility.labelWidth = 130;
EditorGUIUtility.fieldWidth = 50;
materialEditor.FloatProperty(shspx, "Speed X");
materialEditor.FloatProperty(shspy, "Speed Y");
EditorGUIUtility.labelWidth = 0;
EditorGUIUtility.fieldWidth = 0;
EditorGUILayout.EndHorizontal();
EditorGUI.indentLevel--;
}

EditorGUILayout.EndVertical();
#endregion
#region Foam Settings
style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
EditorGUILayout.BeginVertical(style);
foamFold = EditorGUILayout.Foldout(foamFold, "Foam Settings", toggleOnLabelClick: true);
targetMat.SetInt("_AFoamFold", Convert.ToInt16(foamFold));
if(foamFold)
{

EditorGUI.indentLevel++;
MaterialProperty fmblendt = ShaderGUI.FindProperty("_FoamBlendType", properties);

MaterialProperty fmtxt = ShaderGUI.FindProperty("_FoamTexture", properties);
MaterialProperty fmInv = ShaderGUI.FindProperty("_InvertFoamTexture", properties);
MaterialProperty fmGrScl = ShaderGUI.FindProperty("_FoamGradeScale", properties);
MaterialProperty fmGrOff = ShaderGUI.FindProperty("_FoamGradeOffset", properties);

MaterialProperty fmAff = ShaderGUI.FindProperty("_AffectFoamDeformation", properties);

MaterialProperty fmtix = ShaderGUI.FindProperty("_FoamTileX", properties);
MaterialProperty fmtiy = ShaderGUI.FindProperty("_FoamTileY", properties);
MaterialProperty fmspx = ShaderGUI.FindProperty("_FoamSpeedX", properties);
MaterialProperty fmspy = ShaderGUI.FindProperty("_FoamSpeedY", properties);

materialEditor.ShaderProperty(fmblendt, "Foam Blend Type");

if(fmblendt.floatValue > 0f)
{
materialEditor.ShaderProperty(fmAff, "Affect Foam Deformation");

materialEditor.TextureProperty(fmtxt, "Foam Texture");
materialEditor.ShaderProperty(fmInv, "Invert Foam Texture");
materialEditor.FloatProperty(fmGrScl, "Grade Scale");
materialEditor.FloatProperty(fmGrOff, "Grade Offset");

EditorGUILayout.BeginHorizontal();
EditorGUIUtility.labelWidth = 130;
EditorGUIUtility.fieldWidth = 50;
materialEditor.FloatProperty(fmtix, "Tile X");
materialEditor.FloatProperty(fmtiy, "Tile Y");
EditorGUIUtility.labelWidth = 0;
EditorGUIUtility.fieldWidth = 0;
EditorGUILayout.EndHorizontal();

EditorGUILayout.BeginHorizontal();
EditorGUIUtility.labelWidth = 130;
EditorGUIUtility.fieldWidth = 50;
materialEditor.FloatProperty(fmspx, "Speed X");
materialEditor.FloatProperty(fmspy, "Speed Y");
EditorGUIUtility.labelWidth = 0;
EditorGUIUtility.fieldWidth = 0;
EditorGUILayout.EndHorizontal();
}
EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion
#region Depth Settings
style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
EditorGUILayout.BeginVertical(style);

checkDepth = EditorGUILayout.Foldout(checkDepth, "Depth Settings", toggleOnLabelClick: true);
targetMat.SetInt("_DepthSettings", Convert.ToInt16(checkDepth));
if(checkDepth)
{
EditorGUI.indentLevel++;
MaterialProperty ddist = ShaderGUI.FindProperty("_DepthDistance", properties);
MaterialProperty dexp = ShaderGUI.FindProperty("_DepthExponential", properties);
MaterialProperty dGrScl = ShaderGUI.FindProperty("_GradeScale", properties);
MaterialProperty dGrOff = ShaderGUI.FindProperty("_GradeOffset", properties);
MaterialProperty dGrExp = ShaderGUI.FindProperty("_GradeExponential", properties);
MaterialProperty dsize = ShaderGUI.FindProperty("_DepthSize", properties);
MaterialProperty dgt = ShaderGUI.FindProperty("_DepthGradeType", properties);
MaterialProperty dMid = ShaderGUI.FindProperty("_EdgeControl", properties);

materialEditor.ShaderProperty(dgt, "Depth Grade Type");
materialEditor.FloatProperty(ddist, "Depth Distance");
materialEditor.FloatProperty(dexp, "Depth Exponential");
materialEditor.FloatProperty(dGrScl, "Grade Scale");
materialEditor.FloatProperty(dGrOff, "Grade Offset");
materialEditor.FloatProperty(dGrExp, "Grade Exponential");
materialEditor.FloatProperty(dsize, "Depth Size");
materialEditor.FloatProperty(dMid, "Edge Control");
EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();

#endregion

EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion



#region Normal Controls
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkNormal = EditorGUILayout.ToggleLeft("NORMAL CONTROLS", checkNormal, style);
targetMat.SetInt("_Normal", Convert.ToInt16(checkNormal));
EditorGUILayout.BeginVertical();
if(checkNormal)
{
EditorGUI.indentLevel++;

style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
EditorGUILayout.BeginVertical(style);
{

MaterialProperty normsc = ShaderGUI.FindProperty("_NormalStrength", properties);
MaterialProperty normMid = ShaderGUI.FindProperty("_MiddleBumpIntensity", properties);
MaterialProperty normShor = ShaderGUI.FindProperty("_ShoreBumpIntensity", properties);
MaterialProperty rfrSize = ShaderGUI.FindProperty("_RefractSize", properties);
MaterialProperty normDeform = ShaderGUI.FindProperty("_DeformNormToggle", properties);
MaterialProperty normDeformScl = ShaderGUI.FindProperty("_DeformNormScale", properties);

materialEditor.ShaderProperty(normsc, "Normal Strength");
materialEditor.ShaderProperty(normMid, "Middle Bump Intensity");
materialEditor.ShaderProperty(normShor, "Shore Bump Intensity");
materialEditor.ShaderProperty(rfrSize, "Refract | Reflect Control");
materialEditor.ShaderProperty(normDeform, "Normal Deform");
materialEditor.ShaderProperty(normDeformScl, "Deformation Scale");

checkNormTxt = EditorGUILayout.Toggle("Normal Map", checkNormTxt);
targetMat.SetInt("_NormalTxt", Convert.ToInt16(checkNormTxt));
if(checkNormTxt)
{
    #region Normal Map Mixer
    // Normal Map
    EditorGUI.indentLevel++;

    MaterialProperty nrmA = ShaderGUI.FindProperty("_NormalAMap", properties);
    MaterialProperty nrmB = ShaderGUI.FindProperty("_NormalBMap", properties);
    MaterialProperty nrmAInt = ShaderGUI.FindProperty("_NrmAInt", properties);
    MaterialProperty nrmBInt = ShaderGUI.FindProperty("_NrmBInt", properties);

    MaterialProperty nrmMix = ShaderGUI.FindProperty("_NormalMix", properties);

    materialEditor.ShaderProperty(nrmMix, "Mix Type");

    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
    EditorGUILayout.BeginVertical(style);
    {
        normAFold = EditorGUILayout.Foldout(normAFold, "Normal Map A", toggleOnLabelClick: true);
        targetMat.SetInt("_NormMapAFold", Convert.ToInt16(normAFold));
        if(normAFold)
        {
            materialEditor.ShaderProperty(nrmAInt, "Map A Intensity");
            materialEditor.ShaderProperty(nrmA, "Normal Map A");
            normTxtA(materialEditor, properties);
        }
    }
    EditorGUILayout.EndVertical();

    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
    EditorGUILayout.BeginVertical(style);
    {
        normBFold = EditorGUILayout.Foldout(normBFold, "Normal Map B", toggleOnLabelClick: true);
        targetMat.SetInt("_NormMapBFold", Convert.ToInt16(normBFold));
        if(normBFold)
        {
            materialEditor.ShaderProperty(nrmBInt, "Map B Intensity");
            materialEditor.ShaderProperty(nrmB, "Normal Map B");
            normTxtB(materialEditor, properties);
        }
    }
    EditorGUILayout.EndVertical();

    EditorGUI.indentLevel--;
    #endregion
}
else
{
    #region Generator Mixer
    // Normal From Height
    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
    EditorGUILayout.BeginVertical(style);
    {
        MaterialProperty nrmGradeType = ShaderGUI.FindProperty("_NormNoiseGradeType", properties);
        MaterialProperty nrmMixType = ShaderGUI.FindProperty("_NormNoiseMixType", properties);
        MaterialProperty nrmNCont = ShaderGUI.FindProperty("_NormNoiseContrast", properties);
        MaterialProperty nrmNGradeScl = ShaderGUI.FindProperty("_NormNoiseGradeScale", properties);
        MaterialProperty nrmNGradeOff = ShaderGUI.FindProperty("_NormNoiseGradeOffset", properties);
        MaterialProperty nrmNFinalScl = ShaderGUI.FindProperty("_NormNoiseFinalScale", properties);
        MaterialProperty nrmNFinalOff = ShaderGUI.FindProperty("_NormNoiseFinalOffset", properties);

        materialEditor.ShaderProperty(nrmGradeType, "Noise Grade Type");
        materialEditor.ShaderProperty(nrmMixType, "Noise Grade Mix");
        materialEditor.ShaderProperty(nrmNCont, "Noise Contrast");
        materialEditor.ShaderProperty(nrmNGradeScl, "Noise Grade Scale");
        materialEditor.ShaderProperty(nrmNGradeOff, "Noise Grade Offset");
        materialEditor.ShaderProperty(nrmNFinalScl, "Noise Final Scale");
        materialEditor.ShaderProperty(nrmNFinalOff, "Noise Final Offset");

        #region Noise Type A
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
        EditorGUILayout.BeginVertical(style);
        if(nrmMixType.floatValue > 0.1f)
        {
            normGenAFold = EditorGUILayout.Foldout(normGenAFold, "Noise Type A", toggleOnLabelClick: true);
            targetMat.SetInt("_NormGenAFold", Convert.ToInt16(normGenAFold));
            if(normGenAFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty NormNoiseTAEcp = ShaderGUI.FindProperty("_NormNoiseTypeAExponential", properties);
                MaterialProperty NormNoiseAInv = ShaderGUI.FindProperty("_NormNoiseAInvert", properties);
                MaterialProperty NormNoiseTypeA = ShaderGUI.FindProperty("_NormNoiseTypeA", properties);

                MaterialProperty nvaAngle = ShaderGUI.FindProperty("_NormVorAAngle", properties);
                MaterialProperty nvaSmooth = ShaderGUI.FindProperty("_NormVorASmooth", properties);
                MaterialProperty nvaScl = ShaderGUI.FindProperty("_NormNoiseAScale", properties);

                materialEditor.ShaderProperty(NormNoiseAInv, "Noise Invert");
                materialEditor.ShaderProperty(NormNoiseTAEcp, "Noise Exponent");
                materialEditor.ShaderProperty(NormNoiseTypeA, "Noise Type");

                switch(NormNoiseTypeA.floatValue)
                {
                    #region None
                    case 0:
                        // None
                        break;
                    #endregion
                    #region Voronoi Cell
                    case 1:
                        MaterialProperty nVorCellOc = ShaderGUI.FindProperty("_Norm_VorCell_A_Type", properties);
                        materialEditor.ShaderProperty(nVorCellOc, "Cell Octave");
                        materialEditor.ShaderProperty(nvaAngle, "Voronoi Angle");
                        materialEditor.ShaderProperty(nvaSmooth, "Cell Smooth");
                        materialEditor.ShaderProperty(nvaScl, "Voronoi Scale");
                        normTxtA(materialEditor, properties);
                        break;
                    #endregion
                    #region Voronoi Caustic
                    case 2:
                        MaterialProperty nVorCausOc = ShaderGUI.FindProperty("_Norm_VorCaustic_A_Type", properties);
                        materialEditor.ShaderProperty(nVorCausOc, "Caustic Octave");
                        materialEditor.ShaderProperty(nvaAngle, "Voronoi Angle");
                        materialEditor.ShaderProperty(nvaScl, "Voronoi Scale");
                        normTxtA(materialEditor, properties);
                        break;
                    #endregion
                    #region Perlin
                    case 3:
                        MaterialProperty nPerAScl = ShaderGUI.FindProperty("_NormPerlinAScale", properties);
                        materialEditor.ShaderProperty(nPerAScl, "Perlin Scale");
                        normTxtA(materialEditor, properties);
                        break;
                    #endregion
                    #region Texture
                    case 4:
                        MaterialProperty nPerATexture = ShaderGUI.FindProperty("_NormNoiseAMap", properties);
                        materialEditor.ShaderProperty(nPerATexture, "Noise Texture ");
                        normTxtA(materialEditor, properties);
                        break;
                        #endregion
                }
                EditorGUI.indentLevel--;
            }
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Noise Type B
        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(90));
        EditorGUILayout.BeginVertical(style);
        if(nrmMixType.floatValue > 1.1f)
        {
            normGenBFold = EditorGUILayout.Foldout(normGenBFold, "Noise Type B", toggleOnLabelClick: true);
            targetMat.SetInt("_NormGenBFold", Convert.ToInt16(normGenBFold));
            if(normGenBFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty NormNoiseTBEcp = ShaderGUI.FindProperty("_NormNoiseTypeBExponential", properties);
                MaterialProperty NormNoiseBInv = ShaderGUI.FindProperty("_NormNoiseBInvert", properties);
                MaterialProperty NormNoiseTypeB = ShaderGUI.FindProperty("_NormNoiseTypeB", properties);

                MaterialProperty nvbAngle = ShaderGUI.FindProperty("_NormVorBAngle", properties);
                MaterialProperty nvbSmooth = ShaderGUI.FindProperty("_NormVorBSmooth", properties);
                MaterialProperty nvbScl = ShaderGUI.FindProperty("_NormNoiseBScale", properties);

                materialEditor.ShaderProperty(NormNoiseBInv, "Noise Invert");
                materialEditor.ShaderProperty(NormNoiseTBEcp, "Noise Exponent");
                materialEditor.ShaderProperty(NormNoiseTypeB, "Noise Type");

                switch(NormNoiseTypeB.floatValue)
                {
                    #region None
                    case 0:
                        // None
                        break;
                    #endregion
                    #region Voronoi Cell
                    case 1:
                        MaterialProperty nVorCellOcB = ShaderGUI.FindProperty("_Norm_VorCell_B_Type", properties);
                        materialEditor.ShaderProperty(nVorCellOcB, "Cell Octave");
                        materialEditor.ShaderProperty(nvbAngle, "Voronoi Angle");
                        materialEditor.ShaderProperty(nvbSmooth, "Cell Smooth");
                        materialEditor.ShaderProperty(nvbScl, "Voronoi Scale");
                        normTxtB(materialEditor, properties);
                        break;
                    #endregion
                    #region Voronoi Caustic
                    case 2:
                        MaterialProperty nVorCausOcB = ShaderGUI.FindProperty("_Norm_VorCaustic_B_Type", properties);
                        materialEditor.ShaderProperty(nVorCausOcB, "Caustic Octave");
                        materialEditor.ShaderProperty(nvbAngle, "Voronoi Angle");
                        materialEditor.ShaderProperty(nvbScl, "Voronoi Scale");
                        normTxtB(materialEditor, properties);
                        break;
                    #endregion
                    #region Perlin
                    case 3:
                        MaterialProperty nPerBScl = ShaderGUI.FindProperty("_NormPerlinBScale", properties);
                        materialEditor.ShaderProperty(nPerBScl, "Perlin Scale");
                        normTxtB(materialEditor, properties);
                        break;
                    #endregion
                    #region Texture
                    case 4:
                        MaterialProperty nPerBTexture = ShaderGUI.FindProperty("_NormNoiseBMap", properties);
                        materialEditor.ShaderProperty(nPerBTexture, "Noise Texture ");
                        normTxtB(materialEditor, properties);
                        break;
                        #endregion
                }
                EditorGUI.indentLevel--;
            }
        }
        EditorGUILayout.EndVertical();
        #endregion

    }
    EditorGUILayout.EndVertical();
    #endregion
}
}
EditorGUILayout.EndVertical();

EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion

#region Reflection Settings
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkReflect = EditorGUILayout.ToggleLeft("REFLECTION SETTINGS", checkReflect, style);
targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
EditorGUILayout.BeginVertical();
if(checkReflect)
{
EditorGUI.indentLevel++;

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
EditorGUILayout.Space(5);
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
#endregion

#region Refraction Settings
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkRefract = EditorGUILayout.ToggleLeft("REFRACTION SETTINGS", checkRefract, style);
targetMat.SetInt("_RefractionToggle", Convert.ToInt16(checkRefract));
EditorGUILayout.BeginVertical();
if(checkRefract)
{
EditorGUI.indentLevel++;

MaterialProperty rfrColor = ShaderGUI.FindProperty("_RefractColor", properties);
MaterialProperty trInt = ShaderGUI.FindProperty("_TransparentIntensity", properties);
MaterialProperty rfrCont = ShaderGUI.FindProperty("_ScreenContrast", properties);

materialEditor.ShaderProperty(rfrColor, "Refract Color");
materialEditor.ShaderProperty(trInt, "Transparent Intensity");
materialEditor.ShaderProperty(rfrCont , "Refract Contrast");


EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();

#endregion

#region Screen Space Bluric Transparent Settings
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
EditorGUILayout.Space(4);

MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);
MaterialProperty ssbPHgt = ShaderGUI.FindProperty("_PatternHeight", properties);
MaterialProperty ssbPRot = ShaderGUI.FindProperty("_PatternRotator", properties);
MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);

MaterialProperty ssTileX = ShaderGUI.FindProperty("_SSTileX", properties);
MaterialProperty ssTileY = ShaderGUI.FindProperty("_SSTileY", properties);
MaterialProperty ssOffX = ShaderGUI.FindProperty("_SSOffX", properties);
MaterialProperty ssOffY = ShaderGUI.FindProperty("_SSOffY", properties);

materialEditor.TextureProperty(ssbTxt, "Blur Pattern");

EditorGUILayout.BeginHorizontal();
EditorGUIUtility.labelWidth = 55;
EditorGUIUtility.fieldWidth = 35;
materialEditor.FloatProperty(ssTileX, "Tile X");
materialEditor.FloatProperty(ssTileY, "Tile Y");
materialEditor.FloatProperty(ssOffX, "Offset X");
materialEditor.FloatProperty(ssOffY, "Offset Y");
EditorGUIUtility.labelWidth = 0;
EditorGUIUtility.fieldWidth = 0;
EditorGUILayout.EndHorizontal();

materialEditor.RangeProperty(ssbPHgt, "Pattern Height");
materialEditor.RangeProperty(ssbPRot, "Pattern Rotator");
materialEditor.FloatProperty(ssbSize, "Size");
}
EditorGUILayout.EndVertical();
EditorGUILayout.Space(5);
#endregion

#region Fog Settings
style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
style.fontSize = 16;
style.normal.textColor = bdColors.NexusOrange();

checkFog = EditorGUILayout.ToggleLeft("FOG SETTINGS", checkFog, style);
targetMat.SetInt("_FogToggle", Convert.ToInt16(checkFog));
EditorGUILayout.BeginVertical();
if(checkFog)
{
EditorGUI.indentLevel++;

MaterialProperty fogCol = ShaderGUI.FindProperty("_FogColor", properties);
MaterialProperty fogGradType = ShaderGUI.FindProperty("_FogDepthGradeType", properties);
MaterialProperty fogDepthDist = ShaderGUI.FindProperty("_FogDepthDistance", properties);
MaterialProperty fogDepthExp = ShaderGUI.FindProperty("_FogDepthExponential", properties);
MaterialProperty fogDepthScl = ShaderGUI.FindProperty("_FogDepthScale", properties);
MaterialProperty fogDepthOff = ShaderGUI.FindProperty("_FogDepthOffset", properties);
MaterialProperty fogGradeExp = ShaderGUI.FindProperty("_FogGradeExponential", properties);

materialEditor.ShaderProperty(fogCol, "Fog Color");
materialEditor.ShaderProperty(fogGradType, "Fog Depth Grade Type");
materialEditor.ShaderProperty(fogDepthDist, "Fog Depth Distance");
materialEditor.ShaderProperty(fogDepthExp, "Fog Depth Exponential");
materialEditor.ShaderProperty(fogDepthScl, "Fog Depth Scale");
materialEditor.ShaderProperty(fogDepthOff, "Fog Depth Offset");
materialEditor.ShaderProperty(fogGradeExp, "Fog Depth Exponential");

EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();

#endregion

#region Other Shader Settings
MaterialProperty spec = ShaderGUI.FindProperty("_Specular", properties);
MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness", properties);
//MaterialProperty clipThreshold = ShaderGUI.FindProperty("_ClipThreshold", properties);

materialEditor.ShaderProperty(spec, "Specular");
materialEditor.ShaderProperty(smoothness, "Smoothness");
//materialEditor.ShaderProperty(clipThreshold, "Clip Threshold");

#endregion

#region Shader Defaults
materialEditor.RenderQueueField();
materialEditor.EnableInstancingField();
materialEditor.DoubleSidedGIField();
#endregion

*/

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

        //GUI.backgroundColor = bdColors.Transparent(128);
        //base.OnGUI(materialEditor,properties);
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_FlowMapSettings");
        checkFlowMap = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DeformSettings");
        checkDeform = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DeformAFold");
        deformAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DeformBFold");
        deformBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseFold");
        noiseFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_MiddleNAFold");
        midNAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_MiddleNBFold");
        midNBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_MiddleWave");
        checkMiddle = tempVar == 1 ? true : false;


        //tempVar = targetMat.GetInt("_SSBluricTransparent");
        //checkSSBlur = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_NormGenAFold");
        //normGenAFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_NormGenBFold");
        //normGenBFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_NormMapAFold");
        //normAFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_NormMapBFold");
        //normBFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_NormalTxt");
        //checkNormTxt = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_ShoreToggle");
        //checkShore = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_FogToggle");
        //checkFog = tempVar == 1 ? true : false;


        //tempVar = targetMat.GetInt("_AShoreFold");
        //shoreTXFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_AFoamFold");
        //foamFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_RefractionToggle");
        //checkRefract = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_Reflect");
        //checkReflect = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_DepthSettings");
        //checkDepth = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_SurfaceWaves");
        //checkSurface = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_Normal");
        //checkNormal = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_SurfaceMapA");
        //surfaceMAFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_SurfaceMapB");
        //surfaceMBFold = tempVar == 1 ? true : false;
    }

    // surface kullanmicam
    private void SurfTxtA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Invert = "_SurfaceCMapAInv";
        selected.Intensity = "_SurfaceCMapAIntensity";
        selected.Contrast = "_SurfaceCAScale";
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
        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Invert = "_SurfaceCMapBInv";
        selected.Intensity = "_SurfaceCMapBIntensity";
        selected.Contrast = "_SurfaceCBScale";
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

            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Invert = "_DeformAInvert";
            selected.Intensity = "_DeformAIntensity";
            selected.Contrast = "_DeformAContrast";
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
            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Invert = "_DeformBInvert";
            selected.Intensity = "_DeformBIntensity";
            selected.Contrast = "_DeformBContrast";
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
        selectedNoise.TextureMap = "_DefNoiseAMap";
        selectedNoise.NoiseAngle = "_DefVorAAngle";
        selectedNoise.NoiseSmooth = "_DefVorASmooth";
        selectedNoise.NoiseScale = "_DefNoiseAScale";
        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNoise);

        if(type > 0)
        {
            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Invert = "_DefNoiseAInvert";
            selected.Intensity = "_NoiseA_Intensity";
            selected.Contrast = "_NoiseA_Contrast";
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
        selectedNoise.TextureMap = "_DefNoiseBMap";
        selectedNoise.NoiseAngle = "_DefVorBAngle";
        selectedNoise.NoiseSmooth = "_DefVorBSmooth";
        selectedNoise.NoiseScale = "_DefNoiseBScale";
        BDShaderGUI.NoiseSelectGUI(materialEditor, properties, selectedNoise);

        if(type > 0)
        {
            BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
            selected.Invert = "_DefNoiseBInvert";
            selected.Intensity = "_NoiseB_Intensity";
            selected.Contrast = "_NoiseB_Contrast";
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












/// asagisi dogru degil su an

private void normTxtA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty normVorATileX = ShaderGUI.FindProperty("_NormVorATileX", properties);
        MaterialProperty normVorATileY = ShaderGUI.FindProperty("_NormVorATileY", properties);
        MaterialProperty normVorASpeedX = ShaderGUI.FindProperty("_NormVorASpeedX", properties);
        MaterialProperty normVorASpeedY = ShaderGUI.FindProperty("_NormVorASpeedY", properties);
        MaterialProperty normVorAOverallSpeed = ShaderGUI.FindProperty("_NormNoiseAOverScrSpeed", properties);
        MaterialProperty normTypeAAnchorX = ShaderGUI.FindProperty("_NormTypeAAnchorX", properties);
        MaterialProperty normTypeAAnchorY = ShaderGUI.FindProperty("_NormTypeAAnchorY", properties);
        MaterialProperty normTypeARotSpeed = ShaderGUI.FindProperty("_NormTypeARotSpeed", properties);
        MaterialProperty normARot = ShaderGUI.FindProperty("_NormARot",properties);

        EditorGUI.indentLevel++;
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normVorATileX, "Tile X");
            materialEditor.ShaderProperty(normVorATileY, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.FloatProperty(normVorASpeedX, "Speed X");
            materialEditor.FloatProperty(normVorASpeedY, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normVorAOverallSpeed, "Overall Speed");
            materialEditor.ShaderProperty(normTypeARotSpeed, "Rotate Speed");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        materialEditor.ShaderProperty(normARot, "Rotation");

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normTypeAAnchorX, "Anchor X");
            materialEditor.ShaderProperty(normTypeAAnchorY, "Anchor Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUI.indentLevel--;
    }
    private void normTxtB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty normVorBTileX = ShaderGUI.FindProperty("_NormVorBTileX", properties);
        MaterialProperty normVorBTileY = ShaderGUI.FindProperty("_NormVorBTileY", properties);
        MaterialProperty normVorBSpeedX = ShaderGUI.FindProperty("_NormVorBSpeedX", properties);
        MaterialProperty normVorBSpeedY = ShaderGUI.FindProperty("_NormVorBSpeedY", properties);
        MaterialProperty normVorBOverallSpeed = ShaderGUI.FindProperty("_NormNoiseBOverScrSpeed", properties);
        MaterialProperty normTypeBAnchorX = ShaderGUI.FindProperty("_NormTypeBAnchorX", properties);
        MaterialProperty normTypeBAnchorY = ShaderGUI.FindProperty("_NormTypeBAnchorY", properties);
        MaterialProperty normTypeBRotSpeed = ShaderGUI.FindProperty("_NormTypeBRotSpeed", properties);
        MaterialProperty normBRot = ShaderGUI.FindProperty("_NormBRot", properties);

        EditorGUI.indentLevel++;
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normVorBTileX, "Tile X");
            materialEditor.ShaderProperty(normVorBTileY, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.FloatProperty(normVorBSpeedX, "Speed X");
            materialEditor.FloatProperty(normVorBSpeedY, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normVorBOverallSpeed, "Overall Speed");
            materialEditor.ShaderProperty(normTypeBRotSpeed, "Rotate Speed");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

        materialEditor.ShaderProperty(normBRot, "Rotation");

        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.ShaderProperty(normTypeBAnchorX, "Anchor X");
            materialEditor.ShaderProperty(normTypeBAnchorY, "Anchor Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUI.indentLevel--;
    }


    private void vorA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty vAscl = ShaderGUI.FindProperty("_VorAScale", properties);
        MaterialProperty vAsmt = ShaderGUI.FindProperty("_VorASmooth", properties);
        MaterialProperty vAang = ShaderGUI.FindProperty("_VorAAngleSpeed", properties);
        MaterialProperty vAtix = ShaderGUI.FindProperty("_VorATileX", properties);
        MaterialProperty vAtiy = ShaderGUI.FindProperty("_VorATileY", properties);
        MaterialProperty vAspx = ShaderGUI.FindProperty("_VorASpeedX", properties);
        MaterialProperty vAspy = ShaderGUI.FindProperty("_VorASpeedY", properties);

        materialEditor.FloatProperty(vAscl, "Voronoi A Scale");
        materialEditor.RangeProperty(vAsmt, "Voronoi A Smooth");
        materialEditor.FloatProperty(vAang, "Voronoi A Angle");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vAtix, "Tile X");
            materialEditor.FloatProperty(vAtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vAspx, "Speed X");
            materialEditor.FloatProperty(vAspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void vorB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty vBscl = ShaderGUI.FindProperty("_VorBScale", properties);
        MaterialProperty vBsmt = ShaderGUI.FindProperty("_VorBSmooth", properties);
        MaterialProperty vBang = ShaderGUI.FindProperty("_VorBAngleSpeed", properties);
        MaterialProperty vBtix = ShaderGUI.FindProperty("_VorBTileX", properties);
        MaterialProperty vBtiy = ShaderGUI.FindProperty("_VorBTileY", properties);
        MaterialProperty vBspx = ShaderGUI.FindProperty("_VorBSpeedX", properties);
        MaterialProperty vBspy = ShaderGUI.FindProperty("_VorBSpeedY", properties);

        materialEditor.FloatProperty(vBscl, "Voronoi B Scale");
        materialEditor.RangeProperty(vBsmt, "Voronoi B Smooth");
        materialEditor.FloatProperty(vBang, "Voronoi B Angle");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vBtix, "Tile X");
            materialEditor.FloatProperty(vBtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vBspx, "Speed X");
            materialEditor.FloatProperty(vBspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void perA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty pAscl = ShaderGUI.FindProperty("_PerAScale", properties);
        MaterialProperty pAtix = ShaderGUI.FindProperty("_PerATileX", properties);
        MaterialProperty pAtiy = ShaderGUI.FindProperty("_PerATileY", properties);
        MaterialProperty pAspx = ShaderGUI.FindProperty("_PerASpeedX", properties);
        MaterialProperty pAspy = ShaderGUI.FindProperty("_PerASpeedY", properties);

        materialEditor.FloatProperty(pAscl, "Perlin A Scale");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pAtix, "Tile X");
            materialEditor.FloatProperty(pAtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pAspx, "Speed X");
            materialEditor.FloatProperty(pAspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void perB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty pBscl = ShaderGUI.FindProperty("_PerBScale", properties);
        MaterialProperty pBtix = ShaderGUI.FindProperty("_PerBTileX", properties);
        MaterialProperty pBtiy = ShaderGUI.FindProperty("_PerBTileY", properties);
        MaterialProperty pBspx = ShaderGUI.FindProperty("_PerBSpeedX", properties);
        MaterialProperty pBspy = ShaderGUI.FindProperty("_PerBSpeedY", properties);

        materialEditor.FloatProperty(pBscl, "Perlin B Scale");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pBtix, "Tile X");
            materialEditor.FloatProperty(pBtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pBspx, "Speed X");
            materialEditor.FloatProperty(pBspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
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


/*
 * 
 * 
    Önce listeyi tanımlayacaksın altta metodu çağıracaksın.

    Method yapacağım bir adet. (material editor, properties, list string)
    




    
 */
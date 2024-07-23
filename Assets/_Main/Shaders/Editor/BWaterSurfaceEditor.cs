using UnityEngine;
using UnityEditor;
using System;
using budu;

//checkDepth

public class BWaterSurfaceEditor : ShaderGUI
{
    bool checkSurface, checkAlpha, checkMiddle, checkDeform, checkNormal, checkShore, checkReflect, checkRefract, checkFog, checkNormTxt, checkSSBlur, checkFlowMap, checkDisp;
    bool aboutFold, surfaceMAFold, surfaceMBFold, shoreTXFold, foamFold, noiseFold, midNAFold, midNBFold, normAFold, normBFold, normGenAFold, normGenBFold, deformAFold, deformBFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();
        //GUIStyle style2 = new GUIStyle();

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

        #region Shore and Foam Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkShore = EditorGUILayout.ToggleLeft("SHORE | FOAM SETTINGS", checkShore, style);
        targetMat.SetInt("_ShoreToggle", Convert.ToInt16(checkShore));
        EditorGUILayout.BeginVertical();
        if(checkShore)
        {
            EditorGUI.indentLevel++;
            #region Shore Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            shoreTXFold = EditorGUILayout.Foldout(shoreTXFold, "Shore Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_ShoreFold", Convert.ToInt16(shoreTXFold));
            if(shoreTXFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty shColor = ShaderGUI.FindProperty("_ShoreColor", properties);
                MaterialProperty shtxt = ShaderGUI.FindProperty("_ShoreTexture", properties);
                MaterialProperty affShoreDef = ShaderGUI.FindProperty("_AffectShoreDef", properties);
                MaterialProperty shGrScl = ShaderGUI.FindProperty("_ShoreGradeScale", properties);
                MaterialProperty shGrOff = ShaderGUI.FindProperty("_ShoreGradeOffset", properties);
                materialEditor.ShaderProperty(shColor, "Shore Color");
                materialEditor.TextureProperty(shtxt, "Shore Texture");
                materialEditor.ShaderProperty(affShoreDef, "Deformation");
                if(affShoreDef.floatValue > 0)
                {
                    MaterialProperty shoreDefScl = ShaderGUI.FindProperty("_ShoreDeformScale", properties);
                    MaterialProperty shoreDefOff = ShaderGUI.FindProperty("_ShoreDeformOffset", properties);
                    MaterialProperty shoreDefInt = ShaderGUI.FindProperty("_ShoreDeformStrength", properties);
                    materialEditor.RangeProperty(shoreDefInt, "Deform Strength");
                    materialEditor.ShaderProperty(shoreDefScl, "Deform Scale");
                    materialEditor.ShaderProperty(shoreDefOff, "Deform Offset");
                }
                ShoreTextureSet(materialEditor, properties);
                materialEditor.FloatProperty(shGrScl, "Grade Scale");
                materialEditor.FloatProperty(shGrOff, "Grade Offset");
            }
            EditorGUILayout.EndVertical();
            #endregion
            #region Foam Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            EditorGUILayout.BeginVertical(style);
            foamFold = EditorGUILayout.Foldout(foamFold, "Foam Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_FoamFold", Convert.ToInt16(foamFold));
            if(foamFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty fmblendt = ShaderGUI.FindProperty("_FoamBlendType", properties);
                MaterialProperty fmtxt = ShaderGUI.FindProperty("_FoamTexture", properties);
                MaterialProperty fmAff = ShaderGUI.FindProperty("_AffectFoamDef", properties);
                MaterialProperty fmGrScl = ShaderGUI.FindProperty("_FoamGradeScale", properties);
                MaterialProperty fmGrOff = ShaderGUI.FindProperty("_FoamGradeOffset", properties);

                materialEditor.ShaderProperty(fmblendt, "Foam Blend Type");
                if(fmblendt.floatValue > 0f)
                {
                    materialEditor.TextureProperty(fmtxt, "Foam Texture");
                    materialEditor.ShaderProperty(fmAff, "Affect Foam Deformation");
                    if(fmAff.floatValue > 0f)
                    {
                        MaterialProperty foamDefInt = ShaderGUI.FindProperty("_FoamDeformStrength", properties);
                        MaterialProperty foamGrScl = ShaderGUI.FindProperty("_FoamGradeScale", properties);
                        MaterialProperty foamGrOff = ShaderGUI.FindProperty("_FoamGradeOffset", properties);
                        materialEditor.ShaderProperty(foamDefInt, "Deform Strength");
                        materialEditor.ShaderProperty(foamGrScl, "Deform Scale");
                        materialEditor.ShaderProperty(foamGrOff, "Deform Offset");
                    }
                    FoamTextureSet(materialEditor, properties);
                    materialEditor.FloatProperty(fmGrScl, "Grade Scale");
                    materialEditor.FloatProperty(fmGrOff, "Grade Offset");
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
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
            MaterialProperty defNoiseMixType = ShaderGUI.FindProperty("_NoiseMixType", properties);
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
            #endregion

            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
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

            materialEditor.ShaderProperty(fogCol, "Fog Color");
            materialEditor.ShaderProperty(fogGradType, "Fog Depth Grade Type");
            materialEditor.ShaderProperty(fogDepthDist, "Fog Depth Distance");
            materialEditor.ShaderProperty(fogDepthExp, "Fog Depth Exponential");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion
        
        #region Normal Controls Settings
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
                MaterialProperty normWave = ShaderGUI.FindProperty("_NormWaveIntensity", properties);
                MaterialProperty normShor = ShaderGUI.FindProperty("_NormShoreIntensity", properties);
                MaterialProperty rfrSize = ShaderGUI.FindProperty("_RefractSize", properties);
                materialEditor.ShaderProperty(normsc, "Bump Strength");
                materialEditor.ShaderProperty(normWave, "Wave Bump Intensity");
                materialEditor.ShaderProperty(normShor, "Shore Bump Intensity");
                materialEditor.ShaderProperty(rfrSize, "Refract | Reflect Control");

                checkNormTxt = EditorGUILayout.Toggle("Normal Map", checkNormTxt);
                targetMat.SetInt("_NormalTxt", Convert.ToInt16(checkNormTxt));
                if(checkNormTxt)
                {
                    #region Normal Map Mixer
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
                            materialEditor.ShaderProperty(nrmA, "Normal Map A");
                            NormTxtA(materialEditor, properties);
                        }
                    }
                    EditorGUILayout.EndVertical();

                    if(nrmMix.floatValue > 0.1f)
                    {
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
                        EditorGUILayout.BeginVertical(style);
                        {
                            normBFold = EditorGUILayout.Foldout(normBFold, "Normal Map B", toggleOnLabelClick: true);
                            targetMat.SetInt("_NormMapBFold", Convert.ToInt16(normBFold));
                            if(normBFold)
                            {
                                materialEditor.ShaderProperty(nrmB, "Normal Map B");
                                NormTxtB(materialEditor, properties);
                            }
                        }
                        EditorGUILayout.EndVertical();
                    }

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
                        EditorGUI.indentLevel++;

                        MaterialProperty nrmGradeType = ShaderGUI.FindProperty("_NormNoiseGradeType", properties);
                        MaterialProperty nrmMixType = ShaderGUI.FindProperty("_NormMixType", properties);
                        MaterialProperty nrmNCont = ShaderGUI.FindProperty("_NormNoiseContrast", properties);
                        MaterialProperty nrmNGradeScl = ShaderGUI.FindProperty("_NormNoiseGradeScale", properties);
                        MaterialProperty nrmNGradeOff = ShaderGUI.FindProperty("_NormNoiseGradeOffset", properties);

                        materialEditor.ShaderProperty(nrmGradeType, "Noise Grade Type");
                        materialEditor.ShaderProperty(nrmMixType, "Noise Grade Mix");
                        materialEditor.ShaderProperty(nrmNCont, "Noise Contrast");
                        materialEditor.ShaderProperty(nrmNGradeScl, "Noise Grade Scale");
                        materialEditor.ShaderProperty(nrmNGradeOff, "Noise Grade Offset");

                        MaterialProperty nntTypeA = ShaderGUI.FindProperty("_NoiseTypeA", properties);
                        MaterialProperty nntTypeB = ShaderGUI.FindProperty("_NoiseTypeB", properties);

                        switch((int)nrmMixType.floatValue)
                        {
                            case 0: // no 
                                break;
                            case 1:
                                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(55));
                                EditorGUILayout.BeginVertical(style);
                                NormASet(materialEditor, properties, targetMat, (int)nntTypeA.floatValue);
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
                                NormASet(materialEditor, properties, targetMat, (int)nntTypeA.floatValue);
                                EditorGUILayout.EndVertical();
                                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(90));
                                EditorGUILayout.BeginVertical(style);
                                NormBSet(materialEditor, properties, targetMat, (int)nntTypeB.floatValue);
                                EditorGUILayout.EndVertical();
                                break;
                        }

                        EditorGUI.indentLevel--;
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
            materialEditor.ShaderProperty(rfrCont, "Refract Contrast");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Displacement Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkDisp = EditorGUILayout.ToggleLeft("DISPLACEMENT SETTINGS", checkDisp, style);
        targetMat.SetInt("_Displacement", Convert.ToInt16(checkDisp));
        EditorGUILayout.BeginVertical();
        if(checkDisp)
        {
            EditorGUI.indentLevel++;
            MaterialProperty waveLength = ShaderGUI.FindProperty("_WaveLength", properties);
            MaterialProperty eWaveMulti = ShaderGUI.FindProperty("_EdgeWaveMultiplier", properties);
            MaterialProperty eWaveExpo = ShaderGUI.FindProperty("_EdgeWaveExponential", properties);
            materialEditor.ShaderProperty(waveLength, "Wave Length");
            materialEditor.ShaderProperty(eWaveMulti, "Edge Wave Multiplier");
            materialEditor.ShaderProperty(eWaveExpo, "Edge Wave Exponential");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Screen Space Bluric Transparent Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical();
        checkSSBlur = EditorGUILayout.ToggleLeft("SCREEN SPACE BLUR", checkSSBlur, style);
        targetMat.SetInt("_SSBluricTransparent", Convert.ToInt16(checkSSBlur));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSSBlur)
        {
            EditorGUILayout.Space(4);

            MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);


            MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);

            MaterialProperty ssbPHgt = ShaderGUI.FindProperty("_PatternHeight", properties);
            //MaterialProperty ssbPRot = ShaderGUI.FindProperty("_PatternRotator", properties);

            materialEditor.TextureProperty(ssbTxt, "Blur Pattern");
            materialEditor.RangeProperty(ssbPHgt, "Pattern Height");
            materialEditor.FloatProperty(ssbSize, "Size");
            SS_TxtTileOffset(materialEditor, properties);
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

        tempVar = targetMat.GetInt("_ShoreToggle");
        checkShore = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShoreFold");
        shoreTXFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FoamFold");
        foamFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormGenAFold");
        normGenAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormGenBFold");
        normGenBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormMapAFold");
        normAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormMapBFold");
        normBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormalTxt");
        checkNormTxt = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SSBluricTransparent");
        checkSSBlur = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FogToggle");
        checkFog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefractionToggle");
        checkRefract = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;
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

    // surface kullanmicam
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
            selectedMisc.Invert = "_DefNoiseBInvert";
            selectedMisc.Intensity = "_NoiseB_Intensity";
            selectedMisc.Contrast = "_NoiseB_Contrast";
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
            selectedMisc.Intensity = "_NoiseB_Intensity";
            selectedMisc.Contrast = "_NoiseB_Contrast";
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
        selectedNoise.TextureMap = "_DeformAMap";
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
        selectedNoise.TextureMap = "_DeformBMap";
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
        selectedMisc.Invert = "_DefNoiseBInvert";
        selectedMisc.Intensity = "_NoiseB_Intensity";
        selectedMisc.Contrast = "_NoiseB_Contrast";
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
        selectedMisc.Invert = "_DefNoiseBInvert";
        selectedMisc.Intensity = "_NoiseB_Intensity";
        selectedMisc.Contrast = "_NoiseB_Contrast";
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

/* #region Surface Texture Settings - OK Eskidi kullanmıyorum
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
*/
// BUDU Games 2023 - 2025
using UnityEngine;
using UnityEditor;
using System;
using budu;
using UnityEditor.Rendering;

public class BFabricEditor : ShaderGUI
{
    bool checkSurfDef, checkTwoColors, checkShade;
    bool checkBase, checkDef, checkAlphaClip, checkNormal, checkBaseSpec, checkSecondSpec, checkTrans, checkAO, checkSatin, checkThickness, checkCurvature, checkAlpha;
    bool aboutFold, twoColFold, shadeExtFold, specExtFold, clipCoverage;
    int tempVar, tempRQ, blendingMode, zWriteCtrl, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Fabric Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUFabricTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_Cloth_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Cloth_Texture", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");
            if (!GUIExtras.IsTextureEmpty(bt))
            {
                MaterialProperty btgamma = ShaderGUI.FindProperty("_Base_Texture_Gamma", properties);
                MaterialProperty btinv = ShaderGUI.FindProperty("_Invert_Texture", properties);
                MaterialProperty btc = ShaderGUI.FindProperty("_Texture_Contrast", properties);
                MaterialProperty bta = ShaderGUI.FindProperty("_Texture_Add", properties);
                materialEditor.ShaderProperty(btgamma, "Base Map Gamma");
                materialEditor.ShaderProperty(btinv, "Base Map Invert");
                materialEditor.ShaderProperty(btc, "Base Texture Contrast");
                materialEditor.ShaderProperty(bta, "Additive Texture");
            }
            else
            {
                // no texture
                targetMat.SetInt("_Invert_Texture", 0);
                targetMat.SetFloat("_Base_Texture_Gamma", 1f);
                targetMat.SetFloat("_Texture_Contrast", 1f);
                targetMat.SetFloat("_Texture_Add", 0);
            }

            #region Two Colors Settings
            GUIExtras.SFoldout(targetMat, "_TwoColSwitch", "Two Colors", BDColors.DarkRed(120), () =>
            {
                MaterialProperty tcTog = ShaderGUI.FindProperty("_TwoColors", properties);
                materialEditor.ShaderProperty(tcTog, "Two Colors");
                if (tcTog.floatValue > 0f)
                {
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("SECOND COLOR");
                    }, GUILayout.Height(20));
                    MaterialProperty sc = ShaderGUI.FindProperty("_Cloth_Second_Color", properties);
                    MaterialProperty scInt = ShaderGUI.FindProperty("_Second_Color_Mix", properties);
                    MaterialProperty scttog = ShaderGUI.FindProperty("_SecondColorTextureSwitch", properties);
                    MaterialProperty velsw = ShaderGUI.FindProperty("_Fresnel", properties);

                    materialEditor.ShaderProperty(sc, "Second Color");
                    materialEditor.ShaderProperty(scInt, "Second Color Mixing");
                    materialEditor.ShaderProperty(scttog, "Second Color Affect Texture");

                    if (scttog.floatValue > 0f)
                    {
                        MaterialProperty scBlType = ShaderGUI.FindProperty("_SecondTextureBlendType", properties);
                        string[] blType = { "Multiply", "Additive" };
                        materialEditor.PopupShaderProperty(scBlType, new GUIContent("Second Texture Blend Type"), blType);
                    }
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("VELVET");
                    }, GUILayout.Height(20));
                    materialEditor.ShaderProperty(velsw, "Velvet");
                    if (velsw.floatValue > 0f)
                    {
                        MaterialProperty scVelType = ShaderGUI.FindProperty("_Fresnel_Gamma", properties);
                        MaterialProperty scVelCont = ShaderGUI.FindProperty("_Fresnel_Contrast", properties);
                        MaterialProperty scVelContP = ShaderGUI.FindProperty("_Fresnel_Contrast_Pivot", properties);
                        MaterialProperty scVelInv = ShaderGUI.FindProperty("_Fresnel_Invert", properties);
                        MaterialProperty scVelInt = ShaderGUI.FindProperty("_Fresnel_Intensity", properties);
                        MaterialProperty scVelBias = ShaderGUI.FindProperty("_FBias", properties);
                        MaterialProperty scVelScale = ShaderGUI.FindProperty("_FScale", properties);
                        MaterialProperty scVelPower = ShaderGUI.FindProperty("_FPower", properties);

                        materialEditor.ShaderProperty(scVelInv, "Invert");
                        materialEditor.ShaderProperty(scVelInt, "Intensity");
                        ShaderGUIHelpers.FloatSliderFree(materialEditor, scVelType, "Gamma", 0, 5);
                        ShaderGUIHelpers.FloatSliderFree(materialEditor, scVelCont, "Contrast", 0, 5);
                        materialEditor.ShaderProperty(scVelContP, "Contrast Pivot");
                        materialEditor.ShaderProperty(scVelBias, "Bias");
                        materialEditor.ShaderProperty(scVelScale, "Scale");
                        materialEditor.ShaderProperty(scVelPower, "Power");
                    }
                    EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                }
            });
        #endregion
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Surface Settings
        GUIExtras.SHeader("SURFACE SETTINGS", ref checkSurfDef, "_CheckSurfDef", targetMat, style);

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

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty normalT = ShaderGUI.FindProperty("_Normal_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(normalT, "Normal");
            }, GUILayout.Height(20));
            if(normalT.floatValue > 0.0f)
            {
                MaterialProperty nmap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty nsclm = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(nmap, "Normal Map");
                materialEditor.ShaderProperty(nscl, "Normal Scale");
                materialEditor.ShaderProperty(nsclm, "Normal Scale Multiplier");
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
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty trtog = ShaderGUI.FindProperty("_Transparent_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(trtog, "Transparent");
            }, GUILayout.Height(20));
            if(trtog.floatValue > 0f)
            {
                MaterialProperty trmap = ShaderGUI.FindProperty("_Transparent_Map", properties);
                MaterialProperty trInv = ShaderGUI.FindProperty("_Transparent_Invert", properties);
                MaterialProperty chanSel = ShaderGUI.FindProperty("_ChannelSelector",properties);
                MaterialProperty trmapGamma = ShaderGUI.FindProperty("_Transparent_Texture_Gamma", properties);
                MaterialProperty trOpacity = ShaderGUI.FindProperty("_Opacity", properties);
                MaterialProperty trAdd = ShaderGUI.FindProperty("_Additive_Transparency", properties);
                MaterialProperty trCont = ShaderGUI.FindProperty("_TransContrast", properties);
                MaterialProperty trContP = ShaderGUI.FindProperty("_TransContrastPivot", properties);
                MaterialProperty trScale = ShaderGUI.FindProperty("_TransScale", properties); 
                MaterialProperty trBias = ShaderGUI.FindProperty("_TransBias", properties);

                materialEditor.ShaderProperty(trmap, "Transparency Map");
                materialEditor.ShaderProperty(trInv, "Invert Map");

                string[] chanSelOpt = new string[] { "Red", "Green", "Blue", "Alpha", "Luma" };
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, chanSel, "Channel Select", chanSelOpt);
                materialEditor.ShaderProperty(trOpacity, "Opacity");
                materialEditor.ShaderProperty(trAdd, "Additive Transparency");

                ShaderGUIHelpers.FloatSliderFree(materialEditor, trmapGamma, "Gamma", 0f, 5f);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, trCont, "Contrast", 0f, 5f);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, trScale, "Scale", 0f, 5f);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, trBias, "Bias", -0.5f, 0.5f);
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Alpha Clip Settings
        GUIExtras.SHeader("ALPHA CLIP SETTINGS", ref checkAlpha, "_CheckAlpha", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAlpha)
        {
            EditorGUI.indentLevel++;

            MaterialProperty trClpTog = ShaderGUI.FindProperty("_Alpha_Clip", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(trClpTog, "Alpha Clip");
                targetMat.SetFloat("_AlphaClip", trClpTog.floatValue);
            }, GUILayout.Height(20));
            if(trClpTog.floatValue > 0f)
            {
                MaterialProperty trClp = ShaderGUI.FindProperty("_Alpha_Clip_Threshold", properties);
                materialEditor.ShaderProperty(trClp, "Alpha Clip Threshold");
            }
            clipCoverage = EditorGUILayout.Toggle("Alpha to Coverage", clipCoverage);
            targetMat.SetInt("_Alpha2Mask", Convert.ToInt16(clipCoverage));
            targetMat.SetInt("_AlphaToMask", Convert.ToInt16(clipCoverage));
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Base Specular Settings
        GUIExtras.SHeader("SPECULAR | METALLIC SETTINGS", ref checkBaseSpec, "_CheckBaseSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBaseSpec)
        {
            if (isSpecular > 0)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.Space(2);

                MaterialProperty bspec = ShaderGUI.FindProperty("_Specular_Toggle", properties);
                GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
                {
                    materialEditor.ShaderProperty(bspec, "Specular");
                }, GUILayout.Height(20));
                if (bspec.floatValue > 0.0f)
                {
                    MaterialProperty dscol = ShaderGUI.FindProperty("_Specular_Color", properties);
                    MaterialProperty dsint = ShaderGUI.FindProperty("_Specular_Intensity", properties);
                    MaterialProperty smooth = ShaderGUI.FindProperty("_Smoothness", properties);
                    materialEditor.ShaderProperty(dscol, "Base Specular Color");
                    materialEditor.ShaderProperty(dsint, "Base Specular Intensity");
                    materialEditor.ShaderProperty(smooth, "Smoothness");
                }
                EditorGUI.indentLevel--;
            }
            else 
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.HelpBox("This shader uses a Metallic workflow.", MessageType.Warning);
                EditorGUI.indentLevel--;

            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Second Specular Settings
        GUIExtras.SHeader("SECOND SPECULAR SETTINGS", ref checkSecondSpec, "_CheckSecondSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSecondSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);

            MaterialProperty sSpec = ShaderGUI.FindProperty("_Secondary_Specular_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(sSpec, "Second Specular");
            }, GUILayout.Height(20));
            if (sSpec.floatValue > 0.0f)
            {
                MaterialProperty spcol = ShaderGUI.FindProperty("_Sec_Specular_Color", properties);
                MaterialProperty spInt = ShaderGUI.FindProperty("_Secondary_Specular_Intensity", properties);
                MaterialProperty spAOAffect = ShaderGUI.FindProperty("_Specular_Affect_AO", properties);
                MaterialProperty spNorm = ShaderGUI.FindProperty("_Spec_Normal_Strength", properties);
                MaterialProperty spTxt = ShaderGUI.FindProperty("_Specular_Map", properties);
                MaterialProperty spTxtInv = ShaderGUI.FindProperty("_Specular_Map_Invert", properties);

                materialEditor.ShaderProperty(spcol, "Specular Color");
                materialEditor.ShaderProperty(spInt, "Specular Intensity");
                materialEditor.ShaderProperty(spTxt, "Specular Map");
                materialEditor.ShaderProperty(spTxtInv, "Specular Map Invert");

                materialEditor.ShaderProperty(spNorm, "Specular Normal Strength");
                materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");

                GUIExtras.SFoldout(targetMat, "_SpecExtFold", "Specular Controls", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty spGloss = ShaderGUI.FindProperty("_Glossy", properties);
                    MaterialProperty spGamma = ShaderGUI.FindProperty("_Light_Gamma", properties);
                    MaterialProperty spSat = ShaderGUI.FindProperty("_Saturation", properties);
                    MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                    MaterialProperty spSpecMin = ShaderGUI.FindProperty("_Spec_In", properties);
                    MaterialProperty spSpecMax = ShaderGUI.FindProperty("_Spec_Out", properties);

                    materialEditor.ShaderProperty(spGamma, "Gamma");
                    materialEditor.ShaderProperty(spGloss, "Glossy");
                    materialEditor.ShaderProperty(spSat, "Saturation");
                    materialEditor.ShaderProperty(spSmt, "Softness");
                    materialEditor.ShaderProperty(spSpecMin, "Specular In");
                    materialEditor.ShaderProperty(spSpecMax, "Specular Out");
                });
                EditorGUI.indentLevel--;
            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shade Color Settings
        GUIExtras.SHeader("SHADING SETTINGS", ref checkShade, "_CheckShade", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty shadTog = ShaderGUI.FindProperty("_Shading_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(shadTog, "Shade Feature");
            }, GUILayout.Height(20));
            if (shadTog.floatValue > 0.0f)
            {
                MaterialProperty shCol = ShaderGUI.FindProperty("_Shade_Color", properties);
                MaterialProperty shCntr = ShaderGUI.FindProperty("_Shading_Contribution", properties);
                MaterialProperty shInt = ShaderGUI.FindProperty("_Shading_Intensity", properties);
                MaterialProperty shFCont = ShaderGUI.FindProperty("_Full_Shade_Contrast", properties);
                MaterialProperty shFContP = ShaderGUI.FindProperty("_Full_Shade_Contrast_Pivot", properties);
                MaterialProperty shOff = ShaderGUI.FindProperty("_Shading_Offset", properties);
                MaterialProperty shSaturate = ShaderGUI.FindProperty("_Shading_Saturate", properties);

                materialEditor.ShaderProperty(shCol, "Color");
                materialEditor.ShaderProperty(shInt, "Intensity");
                materialEditor.ShaderProperty(shCntr, "Contribution");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, shFCont, "Full Contrast", 0f, 5f);
                materialEditor.ShaderProperty(shFContP, "Full Contrast Pivot");
                materialEditor.ShaderProperty(shOff, "Offset");
                materialEditor.ShaderProperty(shSaturate, "Saturate");

                #region Shade Extra Controls
                GUIExtras.SFoldout(targetMat, "_ShadeExtFold", "Shade Extra Controls", BDColors.DarkRed(120), () =>
                {
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Normal Settings");
                    });
                    MaterialProperty shNrmStr = ShaderGUI.FindProperty("_Shading_Normal_Strength", properties);
                    MaterialProperty shNrmRCont = ShaderGUI.FindProperty("_Normal_Result_Contrast", properties);
                    MaterialProperty shNrmRContP = ShaderGUI.FindProperty("_Normal_Result_Contrast_Pivot", properties);

                    materialEditor.ShaderProperty(shNrmStr, "Normal Strength");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, shNrmRCont, "Normal Result Contrast", 0f, 5f);
                    materialEditor.ShaderProperty(shNrmRContP, "Normal Result Contrast Pivot");

                    MaterialProperty shAffBaseTxt = ShaderGUI.FindProperty("_Shading_Affect_Base_Map", properties);
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        materialEditor.ShaderProperty(shAffBaseTxt, "Affect Base Texture");
                    });
                    if (shAffBaseTxt.floatValue > 0f)
                    {
                        MaterialProperty shColTxt = ShaderGUI.FindProperty("_Shading_Colored_Texture", properties);
                        MaterialProperty TxtOverCol = ShaderGUI.FindProperty("_Texture_Over_Color", properties);
                        MaterialProperty bsMapInt = ShaderGUI.FindProperty("_Base_Map_Intensity", properties);
                        MaterialProperty bsMapMult = ShaderGUI.FindProperty("_Base_Map_Multiplier", properties);
                        MaterialProperty bsShrp = ShaderGUI.FindProperty("_Base_Sharpness", properties);
                        MaterialProperty bsOff = ShaderGUI.FindProperty("_Base_Offset", properties);

                        materialEditor.ShaderProperty(shColTxt, "Use Texture Color");
                        materialEditor.ShaderProperty(TxtOverCol, "Texture Over Color");
                        materialEditor.ShaderProperty(bsMapInt, "Base Map Intensity");
                        materialEditor.ShaderProperty(bsMapMult, "Base Map Multiplier");
                        materialEditor.ShaderProperty(bsShrp, "Base Sharpness");
                        materialEditor.ShaderProperty(bsOff, "Base Offset");
                    }
                });
                #endregion
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty aoTog = ShaderGUI.FindProperty("_AO_Toggle", properties);

            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(aoTog, "Ambient Occlusion");

            }, GUILayout.Height(20));
            if (aoTog.floatValue > 0.0f)
            {
                MaterialProperty aoTxt = ShaderGUI.FindProperty("_AO_Map", properties);
                MaterialProperty aoInv = ShaderGUI.FindProperty("_AO_Map_Invert", properties);
                MaterialProperty aoGamma = ShaderGUI.FindProperty("_AO_Gamma", properties);
                MaterialProperty aoInt = ShaderGUI.FindProperty("_AO_Intensity", properties);
                MaterialProperty aoPower = ShaderGUI.FindProperty("_AO_Power", properties);
                MaterialProperty aoCont = ShaderGUI.FindProperty("_AO_Contrast", properties);
                MaterialProperty aoContP = ShaderGUI.FindProperty("_AO_Contrast_Pivot", properties);
                MaterialProperty aoMin = ShaderGUI.FindProperty("_AO_Min", properties);
                MaterialProperty aoMax = ShaderGUI.FindProperty("_AO_Max", properties);
                MaterialProperty aoColored = ShaderGUI.FindProperty("_Colored_AO", properties);

                materialEditor.ShaderProperty(aoTxt, "Map");
                materialEditor.ShaderProperty(aoInv, "Invert");
                materialEditor.ShaderProperty(aoInt, "Intensity");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, aoGamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, aoCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(aoContP, "Contrast Pivot");
                materialEditor.ShaderProperty(aoPower, "Power");
                materialEditor.ShaderProperty(aoMin, "SmoothStep Min");
                materialEditor.ShaderProperty(aoMax, "SmoothStep Max");
                materialEditor.ShaderProperty(aoColored, "Colored AO");
                if(aoColored.floatValue > 0.0f)
                {
                    MaterialProperty aoLightCol = ShaderGUI.FindProperty("_AO_Lighten_Color", properties);
                    MaterialProperty aoDarkCol = ShaderGUI.FindProperty("_AO_Darken_Color", properties);
                    materialEditor.ShaderProperty(aoLightCol, "Light Color");
                    materialEditor.ShaderProperty(aoDarkCol, "Dark Color");
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Satin Settings
        GUIExtras.SHeader("SATIN SETTINGS", ref checkSatin, "_CheckSatin", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSatin)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty stTog = ShaderGUI.FindProperty("_Satin_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(stTog, "Satin");
            }, GUILayout.Height(20));
            if (stTog.floatValue > 0.0f)
            {
                MaterialProperty stType = ShaderGUI.FindProperty("_Satin_Gamma", properties);
                MaterialProperty stCol = ShaderGUI.FindProperty("_Satin_Color", properties);
                MaterialProperty stTxtTog = ShaderGUI.FindProperty("_Satin_Texture_Toggle", properties);
                MaterialProperty stInt = ShaderGUI.FindProperty("_Satin_Intensity", properties);
                MaterialProperty stNormInt = ShaderGUI.FindProperty("_Satin_Normal_Intensity", properties);
                MaterialProperty stEffectArea = ShaderGUI.FindProperty("_Satin_Effect_Area", properties);
                MaterialProperty stCon = ShaderGUI.FindProperty("_Satin_Contrast", properties);
                MaterialProperty stConP = ShaderGUI.FindProperty("_Satin_Contrast_Pivot", properties);
                MaterialProperty stDeg = ShaderGUI.FindProperty("_Satin_Degree", properties);
                MaterialProperty stMult = ShaderGUI.FindProperty("_Satin_Multiplier", properties);

                materialEditor.ShaderProperty(stInt, "Intensity");
                materialEditor.ShaderProperty(stCol, "Color");
                materialEditor.ShaderProperty(stTxtTog, "Satin Map");
                if (stTxtTog.floatValue > 0)
                {
                    MaterialProperty stTxt = ShaderGUI.FindProperty("_Satin_Texture", properties);
                    MaterialProperty stTxtInv = ShaderGUI.FindProperty("_Satin_Map_Invert", properties);
                    materialEditor.ShaderProperty(stTxt, "Satin Map");
                    materialEditor.ShaderProperty(stTxtInv, "Invert");
                }
                materialEditor.ShaderProperty(stEffectArea, "Effect Area");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, stType, "Gamma", 0, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, stCon, "Contrast", 0, 5);
                materialEditor.ShaderProperty(stConP, "Contrast Pivot");
                materialEditor.ShaderProperty(stDeg, "Degree");
                materialEditor.ShaderProperty(stNormInt, "Normal Intensity");
                materialEditor.ShaderProperty(stMult, "Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Thickness Settings
        GUIExtras.SHeader("THICKNESS SETTINGS", ref checkThickness, "_CheckThickness", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkThickness)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty thTog = ShaderGUI.FindProperty("_Thickness_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(thTog, "Thickness");
            }, GUILayout.Height(20));
            if (thTog.floatValue > 0f)
            {
                MaterialProperty thGamma = ShaderGUI.FindProperty("_Thickness_Gamma", properties);
                MaterialProperty thCol = ShaderGUI.FindProperty("_Thickness_Color", properties);
                MaterialProperty thTxt = ShaderGUI.FindProperty("_Thickness_Map", properties);
                MaterialProperty thInv = ShaderGUI.FindProperty("_Thickness_Invert", properties);
                MaterialProperty thCont = ShaderGUI.FindProperty("_Thickness_Contrast", properties);
                MaterialProperty thContP = ShaderGUI.FindProperty("_Thickness_Contrast_Pivot", properties);
                MaterialProperty thInt = ShaderGUI.FindProperty("_Thickness_Intensity", properties);
                MaterialProperty thMult = ShaderGUI.FindProperty("_Thickness_Multiplier", properties);
                //MaterialProperty thPatInt = ShaderGUI.FindProperty("_Thickness_Pattern_Intensity", properties);

                materialEditor.ShaderProperty(thInt, "Intensity");
                materialEditor.ShaderProperty(thCol, "Color");
                materialEditor.ShaderProperty(thTxt, "Thickness Map");
                materialEditor.ShaderProperty(thInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, thGamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, thCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(thContP, "Contrast Pivot");
                materialEditor.ShaderProperty(thMult, "Multiplier");
                //materialEditor.ShaderProperty(thPatInt, "Thickness Pattern Intensity");
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Curvature Settings
        GUIExtras.SHeader("CURVATURE SETTINGS", ref checkCurvature, "_CheckCurvature", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkCurvature)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty cvTog = ShaderGUI.FindProperty("_Curvature_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(cvTog, "Curvature");
            }, GUILayout.Height(20));
            if (cvTog.floatValue > 0.0f)
            {
                MaterialProperty cvGamma = ShaderGUI.FindProperty("_Curvature_Gamma", properties);
                MaterialProperty cvCont = ShaderGUI.FindProperty("_Curvature_Contrast", properties);
                MaterialProperty cvContP = ShaderGUI.FindProperty("_Curvature_Contrast_Pivot", properties);
                MaterialProperty cvCol = ShaderGUI.FindProperty("_Curvature_Color", properties);
                MaterialProperty cvTxt = ShaderGUI.FindProperty("_Curvature_Map", properties);
                MaterialProperty cvInt = ShaderGUI.FindProperty("_Curvature_Intensity", properties);
                MaterialProperty cvInv = ShaderGUI.FindProperty("_Curvature_Invert", properties);

                MaterialProperty cvType = ShaderGUI.FindProperty("_CurvSelector", properties);
                string[] curvtypes = new string[] { "Curvature", "Concavity", "Convexity" };
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, cvType, "Curvature Type", curvtypes);

                materialEditor.ShaderProperty(cvInt, "Intensity");
                materialEditor.ShaderProperty(cvCol, "Color");
                materialEditor.ShaderProperty(cvTxt, "Curvature Map");
                materialEditor.ShaderProperty(cvInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cvGamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cvCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(cvContP, "Contrast Pivot");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(3);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, true, true, true, true, false, true, true, true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

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

        tempVar = targetMat.GetInt("_CheckAlpha");
        checkAlpha = tempVar == 1 ? true : false;

        blendingMode = targetMat.GetInt("_Blending_Mode");
    }
}

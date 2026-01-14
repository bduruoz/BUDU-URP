// BUDU Games 2023 - 2025
using budu;
using UnityEditor;
using UnityEngine;

public class BCrystalEditor : ShaderGUI
{
    bool checkBase, checkDef, checkNormal, checkIntLight, checkReflect, checkRefract, checkFresnel, checkInt, checkIntFresnel, checkCurv;
    bool aboutFold, fresnelFold, cubemapFold, AlphaClip = false, noiseFold;
    int tempVar, blendingMode, isSpecular, surfType = 0, AlphaToMask = 0, tmpQ;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Crystal Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUCrystal.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bct = ShaderGUI.FindProperty("_Base_Texture_Toggle", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(bct, "Base Map Toggle");
            }, GUILayout.Height(20));

            if(bct.floatValue > 0.0f)
            {
                MaterialProperty bt = ShaderGUI.FindProperty("_Base_Texture", properties);
                materialEditor.ShaderProperty(bt, "Base Map");
            }
            MaterialProperty mask = ShaderGUI.FindProperty("_Mask_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(mask, "Mask");
            }, GUILayout.Height(20));

            if (mask.floatValue > 0.0f)
            {
                MaterialProperty mmap = ShaderGUI.FindProperty("_Mask_Map", properties);
                materialEditor.ShaderProperty(mmap, "Mask Map");

                MaterialProperty mChn = ShaderGUI.FindProperty("_Mask_Channel", properties);
                string[] maskChanOpt = new string[] { "Red", "Green", "Blue", "Alpha", "Color" };
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, mChn, "Channel", maskChanOpt);

                MaterialProperty mInv = ShaderGUI.FindProperty("_Mask_Invert", properties);
                MaterialProperty mCont = ShaderGUI.FindProperty("_Mask_Contrast", properties);
                MaterialProperty mGma = ShaderGUI.FindProperty("_Mask_Gamma", properties);
                MaterialProperty mRot = ShaderGUI.FindProperty("_Mask_Rotation", properties);
                MaterialProperty mTile = ShaderGUI.FindProperty("_Mask_Tile", properties);
                MaterialProperty mOff = ShaderGUI.FindProperty("_Mask_Offset", properties);

                materialEditor.ShaderProperty(mInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, mCont, "Contrast", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, mGma, "Gamma", 0, 5);
                materialEditor.ShaderProperty(mRot, "Rotation");
                ShaderGUIHelpers.Vector2Property(materialEditor, mTile, "Tile");
                ShaderGUIHelpers.Vector2Property(materialEditor, mOff, "Offset");
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

            MaterialProperty ft = ShaderGUI.FindProperty("_Fresnel_Toggle", properties);

            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(ft, "Fresnel");
            }, GUILayout.Height(20));
            if (ft.floatValue > 0)
            {
                MaterialProperty frCol = ShaderGUI.FindProperty("_Fresnel_Color", properties);
                MaterialProperty frInv = ShaderGUI.FindProperty("_Fresnel_Invert", properties);
                MaterialProperty frCont = ShaderGUI.FindProperty("_Fresnel_Contrast", properties);
                MaterialProperty frContP = ShaderGUI.FindProperty("_Fresnel_Contrast_Pivot", properties);
                MaterialProperty frGma = ShaderGUI.FindProperty("_Fresnel_Gamma", properties);
                MaterialProperty frBias = ShaderGUI.FindProperty("_Fresnel_Bias", properties);
                MaterialProperty frScale = ShaderGUI.FindProperty("_Fresnel_Scale", properties);
                MaterialProperty frPower = ShaderGUI.FindProperty("_Fresnel_Power", properties);

                materialEditor.ShaderProperty(frCol, "Color");
                materialEditor.ShaderProperty(frInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(frContP, "Contrast Pivot");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frGma, "Gamma", 0, 5);
                materialEditor.ShaderProperty(frBias, "Bias");
                materialEditor.ShaderProperty(frScale, "Scale");
                materialEditor.ShaderProperty(frPower, "Power");

            }

            EditorGUI.indentLevel--;
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

            MaterialProperty nt = ShaderGUI.FindProperty("_Normal_Toggle", properties);

            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(nt, "Normal");
            }, GUILayout.Height(20));

            if(nt.floatValue > 0)
            {
                MaterialProperty nm = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty nStr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);
                MaterialProperty nRot = ShaderGUI.FindProperty("_Normal_Map_Rotation", properties);
                MaterialProperty nTile = ShaderGUI.FindProperty("_Normal_Map_Tile", properties);
                MaterialProperty nOff = ShaderGUI.FindProperty("_Normal_Map_Offset", properties);

                materialEditor.ShaderProperty(nm, "Normal Map");
                materialEditor.ShaderProperty(nStr, "Strength");
                materialEditor.ShaderProperty(nMult, "Multiplier");
                materialEditor.ShaderProperty(nRot, "Rotation");
                ShaderGUIHelpers.Vector2Property(materialEditor, nTile, "Tile");
                ShaderGUIHelpers.Vector2Property(materialEditor, nOff, "Offset");
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        GUIExtras.SHeader("REFLECTION SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty refTog = ShaderGUI.FindProperty("_Reflection_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(refTog, "Reflection");
            });
            if (refTog.floatValue > 0f)
            {
                string[] refTypeOpt = new string[] { "Real Cubemap", "Unreal Cubemap" };
                MaterialProperty refType = ShaderGUI.FindProperty("_RefType", properties);
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", refTypeOpt);

                MaterialProperty rfs = ShaderGUI.FindProperty("_Reflection_Strength", properties);
                MaterialProperty rft = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
                MaterialProperty rfcol = ShaderGUI.FindProperty("_Reflection_Color", properties);
                MaterialProperty rftLod = ShaderGUI.FindProperty("_CubeMap_LOD", properties);
                MaterialProperty rfMult = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
                MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shade", properties);

                materialEditor.ShaderProperty(rfs, "Strength");
                materialEditor.ShaderProperty(rfMult, "Multiplier");
                materialEditor.ShaderProperty(rfcol, "Color");
                materialEditor.ShaderProperty(rft, "Cubemap");
                materialEditor.ShaderProperty(rftLod, "LOD");
                materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");
                if (rfAffShd.floatValue > 0.0f)
                {
                    MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shade_Strength", properties);
                    materialEditor.ShaderProperty(rfShdStr, "Shade Strength");
                }

                MaterialProperty rfNormStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
                materialEditor.ShaderProperty(rfNormStr, "Reflection Normal Strength");

                #region Cubemap Settings
                GUIExtras.SFoldout(targetMat, "_CubemapFold", "Cubemap Controls", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty cmrx = ShaderGUI.FindProperty("_Cubemap_Rotate_X", properties);
                    MaterialProperty cmry = ShaderGUI.FindProperty("_Cubemap_Rotate_Y", properties);
                    MaterialProperty cmrz = ShaderGUI.FindProperty("_Cubemap_Rotate_Z", properties);
                    MaterialProperty cmsx = ShaderGUI.FindProperty("_Cubemap_Stretch_X", properties);
                    MaterialProperty cmsy = ShaderGUI.FindProperty("_Cubemap_Stretch_Y", properties);
                    MaterialProperty cmsz = ShaderGUI.FindProperty("_Cubemap_Stretch_Z", properties);
                    MaterialProperty cmx = ShaderGUI.FindProperty("_Cubemap_Pos_X", properties);
                    MaterialProperty cmy = ShaderGUI.FindProperty("_Cubemap_Pos_Y", properties);
                    MaterialProperty cmz = ShaderGUI.FindProperty("_Cubemap_Pos_Z", properties);

                    materialEditor.ShaderProperty(cmrx, "Rotate X");
                    materialEditor.ShaderProperty(cmry, "Rotate Y");
                    materialEditor.ShaderProperty(cmrz, "Rotate Z");
                    EditorGUIHelper.Separator();
                    materialEditor.ShaderProperty(cmsx, "Stretch X");
                    materialEditor.ShaderProperty(cmsy, "Stretch Y");
                    materialEditor.ShaderProperty(cmsz, "Stretch Z");
                    EditorGUIHelper.Separator();
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmx, "Position X", -1f, 1f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmy, "Position Y", -1f, 1f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmz, "Position Z", -1f, 1f);
                });
                #endregion

                #region Reflection Fresnel Settings
                GUIExtras.SFoldout(targetMat, "_FresnelFold", "Fresnel Control", BDColors.DarkRed(180), () =>
                {
                    MaterialProperty refFresTog = ShaderGUI.FindProperty("_Ref_Fresnel_Toggle", properties);
                    MaterialProperty refFresInv = ShaderGUI.FindProperty("_Ref_Fresnel_Invert", properties);
                    MaterialProperty refFresGam = ShaderGUI.FindProperty("_Ref_Fresnel_Gamma", properties);
                    MaterialProperty refFresCont = ShaderGUI.FindProperty("_Ref_Fresnel_Contrast", properties);
                    MaterialProperty refFresContP = ShaderGUI.FindProperty("_Ref_Fresnel_Contrast_Pivot", properties);
                    MaterialProperty refFresBias = ShaderGUI.FindProperty("_Ref_Fresnel_Bias", properties);
                    MaterialProperty refFresScale = ShaderGUI.FindProperty("_Ref_Fresnel_Scale", properties);
                    MaterialProperty refFresPower = ShaderGUI.FindProperty("_Ref_Fresnel_Power", properties);

                    materialEditor.ShaderProperty(refFresTog, "Fresnel");
                    if (refFresTog.floatValue > 0f)
                    {
                        materialEditor.ShaderProperty(refFresInv, "Invert");
                        materialEditor.ShaderProperty(refFresGam, "Gamma");
                        ShaderGUIHelpers.FloatSliderFree(materialEditor, refFresCont, "Contrast", 0f, 5f);
                        materialEditor.ShaderProperty(refFresContP, "Contrast Pivot");
                        materialEditor.ShaderProperty(refFresBias, "Bias");
                        materialEditor.ShaderProperty(refFresScale, "Scale");
                        materialEditor.ShaderProperty(refFresPower, "Power");
                    }
                });
                #endregion

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

            MaterialProperty rft = ShaderGUI.FindProperty("_Refraction", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(rft, "Refract");
            }, GUILayout.Height(20));
            if(rft.floatValue > 0f)
            {
                MaterialProperty rfStr = ShaderGUI.FindProperty("_Refract_Strength", properties);
                MaterialProperty rfCol = ShaderGUI.FindProperty("_Refract_Color", properties);
                MaterialProperty rfMult = ShaderGUI.FindProperty("_Refract_Multiplier", properties);
                MaterialProperty rfTrn = ShaderGUI.FindProperty("_Refract_Transparency", properties);
                MaterialProperty rfNInt = ShaderGUI.FindProperty("_Refract_Normal_Intensity", properties);
                MaterialProperty rfFrBias = ShaderGUI.FindProperty("_Refract_Fresnel_Bias", properties);
                MaterialProperty rfFrScale = ShaderGUI.FindProperty("_Refract_Fresnel_Scale", properties);
                MaterialProperty rfFrPower = ShaderGUI.FindProperty("_Refract_Fresnel_Power", properties);
                MaterialProperty rfFrCont = ShaderGUI.FindProperty("_Refract_Fresnel_Contrast", properties);
                MaterialProperty rfFrContP = ShaderGUI.FindProperty("_Refract_Fresnel_Contrast_Pivot", properties);
                MaterialProperty rfFrGamma = ShaderGUI.FindProperty("_Refract_Fresnel_Gamma", properties);
                MaterialProperty rfFrInv= ShaderGUI.FindProperty("_Refract_Fresnel_Invert", properties);

                materialEditor.ShaderProperty(rfCol, "Color");
                materialEditor.ShaderProperty(rfStr, "Strength");
                materialEditor.ShaderProperty(rfMult, "Multiplier");
                materialEditor.ShaderProperty(rfTrn, "Transparency");
                materialEditor.ShaderProperty(rfNInt, "Normal Intensity");
                materialEditor.ShaderProperty(rfFrInv, "Fresnel Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, rfFrCont, "Fresnel Contrast", 0, 5);
                materialEditor.ShaderProperty(rfFrContP, "Fresnel Contrast Pivot");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, rfFrGamma, "Fresnel Gamma", 0, 5);
                materialEditor.ShaderProperty(rfFrBias, "Fresnel Bias");
                materialEditor.ShaderProperty(rfFrScale, "Fresnel Scale");
                materialEditor.ShaderProperty(rfFrPower, "Fresnel Power");
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Interior Settings
        GUIExtras.SHeader("INTERIOR SETTINGS", ref checkInt, "_CheckInt", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkInt)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty it = ShaderGUI.FindProperty("_Interior_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(it, "Interior");
            }, GUILayout.Height(20));
            if(it.floatValue > 0)
            {
                MaterialProperty itCol = ShaderGUI.FindProperty("_Interior_Color", properties);
                MaterialProperty itBCol = ShaderGUI.FindProperty("_Interior_Back_Color", properties);
                MaterialProperty itCryTxt = ShaderGUI.FindProperty("_Crystal_Texture", properties);
                MaterialProperty itTxtInv = ShaderGUI.FindProperty("_Texture_Invert", properties);
                MaterialProperty itCont = ShaderGUI.FindProperty("_Contrast", properties);
                MaterialProperty itPrlx = ShaderGUI.FindProperty("_Interior_Parallax", properties);
                MaterialProperty itPrlxSL = ShaderGUI.FindProperty("_Interior_Parallax_Second_Layer", properties);
                MaterialProperty itSLRep = ShaderGUI.FindProperty("_Second_Layer_Repeat", properties);
               
                materialEditor.ShaderProperty(itCol, "Color");
                materialEditor.ShaderProperty(itBCol, "Back Color");
                materialEditor.ShaderProperty(itCryTxt , "Crystal Texture");
                materialEditor.ShaderProperty(itTxtInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, itCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(itPrlx, "Parallax");
                materialEditor.ShaderProperty(itPrlxSL, "Parallax Second Layer");
                materialEditor.ShaderProperty(itSLRep, "Second Layer Repeat");

                #region Noise Settings
                GUIExtras.SFoldout(targetMat, "_NoiseFold", "Noise Settings", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty itNoiseT = ShaderGUI.FindProperty("_Interior_Noise_Toggle", properties);
                    MaterialProperty itNInv = ShaderGUI.FindProperty("_Noise_Invert", properties);
                    MaterialProperty itNCont = ShaderGUI.FindProperty("_Noise_Contrast", properties);
                    MaterialProperty itNGma = ShaderGUI.FindProperty("_Noise_Gamma", properties);
                    MaterialProperty itNSize = ShaderGUI.FindProperty("_Noise_Size", properties);
                    MaterialProperty itNSeed = ShaderGUI.FindProperty("_Noise_Seed", properties);
                    MaterialProperty itNOct = ShaderGUI.FindProperty("_Noise_Octave", properties);
                    MaterialProperty itNSSI = ShaderGUI.FindProperty("_Noise_SS_In", properties);
                    MaterialProperty itNSSO = ShaderGUI.FindProperty("_Noise_SS_Out", properties);

                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        materialEditor.ShaderProperty(itNoiseT, "Noise");

                    }, GUILayout.Height(20));
                    materialEditor.ShaderProperty(itNInv, "Noise Invert");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, itNCont, "Noise Contrast", 0, 5);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, itNGma, "Noise Gamma", 0, 5);
                    ShaderGUIHelpers.IntSlider(materialEditor, itNOct, "Noise Octave", 1, 6);
                    materialEditor.ShaderProperty(itNSize, "Noise Size");
                    materialEditor.ShaderProperty(itNSSI, "SmoothStep In");
                    materialEditor.ShaderProperty(itNSSO, "SmoothStep Out");
                    materialEditor.ShaderProperty(itNSeed, "Seed");
                });
                #endregion

                #region Fresnel Settings
                GUIExtras.SFoldout(targetMat, "_CheckIntFresnel", "Fresnel Settings", BDColors.DarkRed(160), () =>
                {
                    MaterialProperty ift = ShaderGUI.FindProperty("_Interior_Fresnel_Toggle", properties);
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        materialEditor.ShaderProperty(ift, "Fresnel");
                    },GUILayout.Height(20));
                    MaterialProperty ifInv = ShaderGUI.FindProperty("_IF_Invert", properties);
                    MaterialProperty ifCont = ShaderGUI.FindProperty("_IF_Contrast", properties);
                    MaterialProperty ifContP = ShaderGUI.FindProperty("_IF_Contrast_Pivot", properties);
                    MaterialProperty ifGma = ShaderGUI.FindProperty("_IF_Gamma", properties);
                    MaterialProperty ifBias = ShaderGUI.FindProperty("_IF_Bias", properties);
                    MaterialProperty ifScl = ShaderGUI.FindProperty("_IF_Scale", properties);
                    MaterialProperty ifPow = ShaderGUI.FindProperty("_IF_Power", properties);

                    materialEditor.ShaderProperty(ifInv, "Invert");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, ifCont, "Contrast", 0, 5);
                    materialEditor.ShaderProperty(ifContP, "Contrast Pivot");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, ifGma, "Gamma", 0, 5);
                    materialEditor.ShaderProperty(ifBias, "Bias");
                    materialEditor.ShaderProperty(ifScl, "Scale");
                    materialEditor.ShaderProperty(ifPow, "Power");
                });
                #endregion

                #region Light Settings
                GUIExtras.SFoldout(targetMat, "_CheckIntLight", "Light Settings", BDColors.DarkRed(200), () =>
                {
                    MaterialProperty ilt = ShaderGUI.FindProperty("_Center_Light_Toggle", properties);
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        materialEditor.ShaderProperty(ilt, "Interior Light");
                    }, GUILayout.Height(20));
                    
                    MaterialProperty ilGAS = ShaderGUI.FindProperty("_Glow_Anim_Speed", properties);
                    MaterialProperty ilGAI = ShaderGUI.FindProperty("_Glow_Anim_Intensity", properties);
                    MaterialProperty ilIMult = ShaderGUI.FindProperty("_Interior_Multiplier", properties);
                    MaterialProperty ilIAdd = ShaderGUI.FindProperty("_Interior_Additive", properties);
                    MaterialProperty ilsqBool = ShaderGUI.FindProperty("_sqrtBool", properties);
                    MaterialProperty ilsqTm = ShaderGUI.FindProperty("_sqrtTm", properties);
                    MaterialProperty ilMult = ShaderGUI.FindProperty("_Multiplier", properties);
                    MaterialProperty ilIRad = ShaderGUI.FindProperty("_InLight_Radius", properties);
                    MaterialProperty ilRad = ShaderGUI.FindProperty("_Radius", properties);
                    MaterialProperty ilRadX = ShaderGUI.FindProperty("_Radius_X", properties);
                    MaterialProperty ilRadY = ShaderGUI.FindProperty("_Radius_Y", properties);
                    MaterialProperty ilRadZ = ShaderGUI.FindProperty("_Radius_Z", properties);
                    MaterialProperty ilYPos = ShaderGUI.FindProperty("_Y_Pos", properties);
                    MaterialProperty ilLMult = ShaderGUI.FindProperty("_Light_Multiplier", properties);

                    materialEditor.ShaderProperty(ilGAS, "Glow Anim Speed");
                    materialEditor.ShaderProperty(ilGAI, "Glow Anim Intensity");
                    materialEditor.ShaderProperty(ilIMult, "Multiplier");
                    materialEditor.ShaderProperty(ilIAdd, "Additive");
                    materialEditor.ShaderProperty(ilsqBool, "Square Time");
                    materialEditor.ShaderProperty(ilsqTm, "Square Time");
                    materialEditor.ShaderProperty(ilMult, "Multiplier");
                    materialEditor.ShaderProperty(ilIRad , "In Light Radius");
                    materialEditor.ShaderProperty(ilRad , "Radius");
                    materialEditor.ShaderProperty(ilRadX , "Radius X");
                    materialEditor.ShaderProperty(ilRadY , "Radius Y");
                    materialEditor.ShaderProperty(ilRadZ , "Radius Z");
                    materialEditor.ShaderProperty(ilYPos, "Y Position");
                    materialEditor.ShaderProperty(ilLMult, "Light Multiplier");
                });
                #endregion
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Curvature Settings
        GUIExtras.SHeader("CURVATURE SETTINGS", ref checkCurv, "_CheckCurv", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkCurv)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty curvT = ShaderGUI.FindProperty("_Curvature_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(curvT, "Curvature");
            }, GUILayout.Height(20));
            if (curvT.floatValue > 0)
            {
                MaterialProperty selCurv = ShaderGUI.FindProperty("_CALCULATE_MAP", properties);
                materialEditor.ShaderProperty(selCurv, "Select Method");

                if(selCurv.floatValue == 1)
                {
                    MaterialProperty cmap = ShaderGUI.FindProperty("_Curvature_Map", properties);
                    materialEditor.ShaderProperty(cmap, "Curvature Map");
                }

                MaterialProperty ctyp = ShaderGUI.FindProperty("_Curvature_Type", properties);
                MaterialProperty cStr = ShaderGUI.FindProperty("_Curvature_Strength", properties);
                MaterialProperty cMult = ShaderGUI.FindProperty("_Curvature_Multiplier", properties);
                MaterialProperty cMin = ShaderGUI.FindProperty("_Clamp_Min", properties);
                MaterialProperty cMax = ShaderGUI.FindProperty("_Clamp_Max", properties);
                MaterialProperty cInv = ShaderGUI.FindProperty("_Invert", properties);
                MaterialProperty cGamma = ShaderGUI.FindProperty("_Gamma", properties);

                string[] curvTypeOpt = { "Curvature", "Concavity", "Convexity" };
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, ctyp, "Curvature Type", curvTypeOpt);
                materialEditor.ShaderProperty(cStr, "Strength");
                materialEditor.ShaderProperty(cMult, "Multiplier");
                materialEditor.ShaderProperty(cMin, "SmoothStep Min");
                materialEditor.ShaderProperty(cMax, "SmoothStep Max");
                materialEditor.ShaderProperty(cInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cGamma, "Gamma", 0, 5);

                MaterialProperty cIrr = ShaderGUI.FindProperty("_Irregularity", properties);
                materialEditor.ShaderProperty(cIrr, "Irregularity");
                if(cIrr.floatValue > 0f)
                {
                    MaterialProperty cIrrMap = ShaderGUI.FindProperty("_Irregularity_Map", properties);
                    MaterialProperty cIrrStr = ShaderGUI.FindProperty("_Irregularity_Strength", properties);

                    materialEditor.ShaderProperty(cIrrMap, "Irregularity Map");
                    materialEditor.ShaderProperty(cIrrStr, "Irregularity Strength");
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);

        MaterialProperty met = ShaderGUI.FindProperty("_Metallic", properties);
        MaterialProperty smt = ShaderGUI.FindProperty("_Smoothness", properties);
        MaterialProperty scol = ShaderGUI.FindProperty("_Specular_Color", properties);

        if (isSpecular == 0)
        {

        }

        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            false,
            true,
            true,
            false,
            false,
            false,
            true,
            true,
            false,
            true);
        
        
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        //ShaderGUIHelpers.SurfaceControls(targetMat, surfType, AlphaClip, AlphaToMask, ref tmpQ);
        //ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRefract");
        checkRefract = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFresnel");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckInt");
        checkInt = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckIntFresnel");
        checkIntFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCurv");
        checkCurv = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubemapFold");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseFold");
        noiseFold = tempVar == 1 ? true : false;
    }
}



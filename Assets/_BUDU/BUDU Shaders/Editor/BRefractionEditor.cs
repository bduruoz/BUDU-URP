// © BUDU Games 2024 - 2026
// BUDU Refraction Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BRefractionEditor : ShaderGUI
{
    bool checkBase, checkDef, checkSS, checkNormal, checkSpec, checkCustomSpec, checkReflect, checkTrans, checkRefract, checkCurv, checkCurvNM, checkAO, checkThickness;
    bool aboutFold, specExtFold, cubemapFold, fresnelFold, trFresnelFold, rfFresnelFold, chromaFold, rftrFold;
    int tempVar, blendingMode, zWriteCtrl, isSpecular;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region Refraction Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDURefraction.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            EditorGUILayout.BeginVertical();
            {
                style.normal.background = GUIExtras.MakeBackground(1, 1, BDColors.Transparent(0));

                MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
                MaterialProperty bm = ShaderGUI.FindProperty("_Base_Map", properties);
                MaterialProperty bg = ShaderGUI.FindProperty("_Base_Gamma", properties);

                materialEditor.ShaderProperty(bc, "Base Color");
                materialEditor.ShaderProperty(bm, "Base Map");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, bg, "Base Gamma", 0, 5);

                MaterialProperty ssbase = ShaderGUI.FindProperty("_SS_Base_Toggle", properties);
                materialEditor.ShaderProperty(ssbase, "Screen Space");

                if (ssbase.floatValue > 0.0f)
                {
                    MaterialProperty ssbaseInt = ShaderGUI.FindProperty("_SS_Base_Intensity", properties);
                    materialEditor.ShaderProperty(ssbaseInt, "SS Intensity");
                }

            }
            EditorGUILayout.EndVertical();

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Screen Space Settings
        GUIExtras.SHeader("SCREEN SPACE SETTINGS", ref checkSS, "_CheckSS", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkSS)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty sst = ShaderGUI.FindProperty("_Screen_Space_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.dOrangeViolet(50),20,true,   () =>
                {
                    materialEditor.ShaderProperty(sst, "Screen Space");
                });
                if (sst.floatValue > 0.0f)
                {
                    MaterialProperty sstype = ShaderGUI.FindProperty("_SS_TYPE", properties);
                    MaterialProperty ssmap = ShaderGUI.FindProperty("_SS_Texture", properties);
                    MaterialProperty ssStr = ShaderGUI.FindProperty("_SS_Strength", properties);
                    MaterialProperty ssMult = ShaderGUI.FindProperty("_SS_Multiplier", properties);
                    MaterialProperty ssLock = ShaderGUI.FindProperty("_Lock_SS_Size", properties);
                    MaterialProperty ssRot = ShaderGUI.FindProperty("_SS_Rotator", properties);
                    MaterialProperty ssTile = ShaderGUI.FindProperty("_SS_Tile", properties);

                    materialEditor.ShaderProperty(sstype, "Type");
                    materialEditor.ShaderProperty(ssmap, "Texture");
                    materialEditor.ShaderProperty(ssStr, "Strength");
                    materialEditor.ShaderProperty(ssMult, "Multiplier");
                    materialEditor.ShaderProperty(ssLock, "Lock Tiles Size");
                    if (ssLock.floatValue < 0.1f) ShaderGUIHelpers.Vector2Property(materialEditor, ssTile, "Tile");
                    materialEditor.ShaderProperty(ssRot, "Rotate");
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;

            EditorGUILayout.BeginVertical();
            {
                MaterialProperty nmt = ShaderGUI.FindProperty("_Normal_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(nmt, "Normal");
                });
                if (nmt.floatValue > 0f)
                {
                    MaterialProperty nmap = ShaderGUI.FindProperty("_Normal_Map", properties);
                    MaterialProperty nstr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                    MaterialProperty nmult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                    materialEditor.ShaderProperty(nmap, "Normal Map");
                    materialEditor.ShaderProperty(nstr, "Strength");
                    materialEditor.ShaderProperty(nmult, "Multiplier");
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();

        #endregion

        #region Base Specular Settings
        GUIExtras.SHeader("BASE SPECULAR SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkSpec)
        {
            if (isSpecular > 0f)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.BeginVertical();
                {
                    MaterialProperty bst = ShaderGUI.FindProperty("_Base_Spec_Toggle", properties);
                    GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
                    {
                        materialEditor.ShaderProperty(bst, "Base Specular");
                    });
                    if (bst.floatValue > 0f)
                    {
                        MaterialProperty bsi = ShaderGUI.FindProperty("_Base_Spec_Intensity", properties);
                        MaterialProperty bsc = ShaderGUI.FindProperty("_Specular_Color", properties);
                        materialEditor.ShaderProperty(bsi, "Intensity");
                        materialEditor.ShaderProperty(bsc, "Specular Color");
                    }
                }
                EditorGUILayout.EndVertical();
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
        #endregion

        #region Custom Specular Settings
        GUIExtras.SHeader("SECOND SPECULAR SETTINGS", ref checkCustomSpec, "_CheckCustomSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkCustomSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty cst = ShaderGUI.FindProperty("_Custom_Spec_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(cst, "Second Specular");
                });
                if (cst.floatValue > 0f)
                {
                    MaterialProperty csCol = ShaderGUI.FindProperty("_Custom_Spec_Color", properties);
                    MaterialProperty csInt = ShaderGUI.FindProperty("_Custom_Spec_Intensity", properties);
                    MaterialProperty csMap = ShaderGUI.FindProperty("_Custom_Spec_Map", properties);
                    MaterialProperty csInv = ShaderGUI.FindProperty("_Custom_Spec_Map_Invert", properties);
                    MaterialProperty csNrmStr = ShaderGUI.FindProperty("_Custom_Spec_Normal_Strength", properties);

                    materialEditor.ShaderProperty(csCol, "Specular Color");
                    materialEditor.ShaderProperty(csInt, "Specular Intensity");
                    materialEditor.ShaderProperty(csMap, "Specular Map");
                    materialEditor.ShaderProperty(csInv, "Map Invert");
                    materialEditor.ShaderProperty(csNrmStr, "Normal Strength");

                    #region Extra Specular Controls
                    GUIExtras.SFoldout(targetMat, "_SpecExtFold", "Specular Controls", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty csGloss = ShaderGUI.FindProperty("_Custom_Spec_Glossy", properties);
                        MaterialProperty csGamma = ShaderGUI.FindProperty("_Custom_Spec_Gamma", properties);
                        MaterialProperty csSoft = ShaderGUI.FindProperty("_Custom_Spec_Softness", properties);
                        MaterialProperty csSat = ShaderGUI.FindProperty("_Custom_Spec_Saturation", properties);
                        MaterialProperty csIn = ShaderGUI.FindProperty("_Custom_Spec_In", properties);
                        MaterialProperty csOut = ShaderGUI.FindProperty("_Custom_Spec_Out", properties);

                        materialEditor.ShaderProperty(csGloss, "Specular Glossy");
                        materialEditor.ShaderProperty(csGamma, "Light Gamma");
                        materialEditor.ShaderProperty(csSoft, "Softness");
                        materialEditor.ShaderProperty(csSat, "Saturation");
                        materialEditor.ShaderProperty(csIn, "Specular In");
                        materialEditor.ShaderProperty(csOut, "Specular Out");
                    });
                    #endregion
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Reflect Settings
        GUIExtras.SHeader("REFLECT SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty Refl = ShaderGUI.FindProperty("_Reflection_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(Refl, "Reflect");
                });

                if (Refl.floatValue > 0.0f)
                {
                    string[] refTypeOpt = new string[] { "Real Cubemap", "Unreal Cubemap" };
                    MaterialProperty refType = ShaderGUI.FindProperty("_RefType", properties);
                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", refTypeOpt);

                    MaterialProperty rfStr = ShaderGUI.FindProperty("_Reflection_Strength", properties);
                    MaterialProperty rfMult = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
                    MaterialProperty rfCol = ShaderGUI.FindProperty("_Reflection_Color", properties);
                    MaterialProperty rfCbMp = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
                    MaterialProperty rfNrStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
                    MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shadow", properties);
                    MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shadow_Strength", properties);
                    MaterialProperty rfMapLOD = ShaderGUI.FindProperty("_RefMapLOD", properties);

                    materialEditor.ShaderProperty(rfStr, "Strength");
                    materialEditor.ShaderProperty(rfMult, "Multiplier");
                    materialEditor.ShaderProperty(rfCol, "Color");
                    materialEditor.ShaderProperty(rfCbMp, "Cubemap");
                    materialEditor.ShaderProperty(rfMapLOD, "LOD");
                    materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");
                    if (rfAffShd.floatValue > 0.0f)
                    {
                        materialEditor.ShaderProperty(rfShdStr, "Shadow Strength");
                    }
                    materialEditor.ShaderProperty(rfNrStr, "Normal Strength");

                    #region Cubemap Settings
                    GUIExtras.SFoldout(targetMat, "_CubemapFold", "Cubemap Controls", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty cmrx = ShaderGUI.FindProperty("_Cubemap_Rotate_X", properties);
                        MaterialProperty cmry = ShaderGUI.FindProperty("_Cubemap_Rotate_Y", properties);
                        MaterialProperty cmrz = ShaderGUI.FindProperty("_Cubemap_Rotate_Z", properties);
                        MaterialProperty cmsx = ShaderGUI.FindProperty("_CubeMap_Stretch_X", properties);
                        MaterialProperty cmsy = ShaderGUI.FindProperty("_CubeMap_Stretch_Y", properties);
                        MaterialProperty cmsz = ShaderGUI.FindProperty("_CubeMap_Stretch_Z", properties);
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
                    GUIExtras.SFoldout(targetMat, "_FresnelFold", "Fresnel Control", BDColors.DarkRed(160), 10,BDColors.White(255),BDColors.Black(40),true, () =>
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
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, refFresCont, "Contrast", 0f, 5f, 50f);
                            materialEditor.ShaderProperty(refFresBias, "Contrast Pivot");
                            materialEditor.ShaderProperty(refFresBias, "Bias");
                            materialEditor.ShaderProperty(refFresScale, "Scale");
                            materialEditor.ShaderProperty(refFresPower, "Power");
                        }
                    });
                    #endregion
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Transparent Settings
        GUIExtras.SHeader("TRANSPARENT SETTINGS", ref checkTrans, "_CheckTrans", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkTrans)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty transtog = ShaderGUI.FindProperty("_Transparent_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(transtog, "Transparent");
                });
                if (transtog.floatValue > 0f)
                {
                    MaterialProperty trStr = ShaderGUI.FindProperty("_Transparent_Strength", properties);
                    MaterialProperty trTxt = ShaderGUI.FindProperty("_Transparent_Texture", properties);
                    materialEditor.ShaderProperty(trStr, "Strength");
                    materialEditor.ShaderProperty(trTxt, "Transparent Map");

                    if (GUIExtras.IsTextureEmpty(trTxt))
                    {
                        // Texture Slot is Empty
                        targetMat.SetInt("_Transparent_Invert", 0);
                    }
                    else
                    {
                        MaterialProperty trCont = ShaderGUI.FindProperty("_TR_Texture_Contrast", properties);
                        MaterialProperty trGamma = ShaderGUI.FindProperty("_TR_Texture_Gamma", properties);
                        MaterialProperty trInvert = ShaderGUI.FindProperty("_Transparent_Invert", properties);

                        materialEditor.ShaderProperty(trInvert, "Invert");
                        ShaderGUIHelpers.FloatSliderFree(materialEditor, trCont, "Contrast", 0f, 5f, 50f);
                        materialEditor.ShaderProperty(trGamma, "Gamma");
                    }

                    #region Transparent Fresnel Settings
                    GUIExtras.SFoldout(targetMat, "_TrFresnelFold", "Fresnel Control", BDColors.DarkRed(180), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty trFresTog = ShaderGUI.FindProperty("_TR_Fresnel_Toggle", properties);
                        MaterialProperty trFresInv = ShaderGUI.FindProperty("_TR_Fresnel_Invert", properties);
                        MaterialProperty trFresGam = ShaderGUI.FindProperty("_TR_Fresnel_Gamma", properties);
                        MaterialProperty trFresCont = ShaderGUI.FindProperty("_TR_Fresnel_Contrast", properties);
                        MaterialProperty trFresContP = ShaderGUI.FindProperty("_TR_Fresnel_Contrast_Pivot", properties);
                        MaterialProperty trFresBias = ShaderGUI.FindProperty("_TR_Fresnel_Bias", properties);
                        MaterialProperty trFresScale = ShaderGUI.FindProperty("_TR_Fresnel_Scale", properties);
                        MaterialProperty trFresPower = ShaderGUI.FindProperty("_TR_Fresnel_Power", properties);

                        materialEditor.ShaderProperty(trFresTog, "Fresnel");
                        if (trFresTog.floatValue > 0f)
                        {
                            materialEditor.ShaderProperty(trFresInv, "Invert");
                            materialEditor.ShaderProperty(trFresGam, "Gamma");
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, trFresCont, "Contrast", 0f, 5f, 50f);
                            materialEditor.ShaderProperty(trFresContP, "Contrast Pivot");
                            materialEditor.ShaderProperty(trFresBias, "Bias");
                            materialEditor.ShaderProperty(trFresScale, "Scale");
                            materialEditor.ShaderProperty(trFresPower, "Power");
                        }
                    });
                    #endregion
                }

            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Refract Settings
        GUIExtras.SHeader("REFRACT SETTINGS", ref checkRefract, "_CheckRefract", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkRefract)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty refrT = ShaderGUI.FindProperty("_Refract_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(refrT, "Refract");
                });
                if (refrT.floatValue > 0f)
                {
                    MaterialProperty refrType = ShaderGUI.FindProperty("_REFRACT_TYPE", properties);
                    MaterialProperty IOR = ShaderGUI.FindProperty("_IOR", properties);
                    MaterialProperty IORSource = ShaderGUI.FindProperty("_IOR_Source", properties);
                    MaterialProperty IORMedium = ShaderGUI.FindProperty("_IOR_Medium", properties);

                    MaterialProperty refrColor = ShaderGUI.FindProperty("_Refract_Color", properties);
                    MaterialProperty refrStrength = ShaderGUI.FindProperty("_Refract_Strength", properties);
                    MaterialProperty refrMultiplier = ShaderGUI.FindProperty("_Refract_Multiplier", properties);

                    MaterialProperty refrNormalStrength = ShaderGUI.FindProperty("_Refract_Normal_Strength", properties);

                    materialEditor.ShaderProperty(refrType, "Refract Type");

                    switch ((int)refrType.floatValue)
                    {
                        case 0: // SS
                            break;
                        case 1: // Custom
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IOR, "IOR", 0, 3);
                            break;
                        case 2: // Unity
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IORSource, "IOR Source", 0, 3);
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IORMedium, "IOR Medium", 0, 3);
                            break;
                        case 3: // Custom Probe
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IOR, "IOR", 0, 3);
                            break;
                        case 4: // Unity Probe
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IORSource, "IOR Source", 0, 3);
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, IORMedium, "IOR Medium", 0, 3);
                            break;
                    }
                    materialEditor.ShaderProperty(refrColor, "Color");
                    materialEditor.ShaderProperty(refrStrength, "Strength");
                    materialEditor.ShaderProperty(refrMultiplier, "Multiplier");
                    materialEditor.ShaderProperty(refrNormalStrength, "Normal Strength");

                    #region Transparent Fresnel Settings
                    GUIExtras.SFoldout(targetMat, "_RfFresnelFold", "Fresnel Control", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty rfFresTog = ShaderGUI.FindProperty("_RF_Fresnel_Toggle", properties);
                        MaterialProperty rfFresInv = ShaderGUI.FindProperty("_RF_Fresnel_Invert", properties);
                        MaterialProperty rfFresGam = ShaderGUI.FindProperty("_RF_Fresnel_Gamma", properties);
                        MaterialProperty rfFresCont = ShaderGUI.FindProperty("_RF_Fresnel_Contrast", properties);
                        MaterialProperty rfFresContP = ShaderGUI.FindProperty("_RF_Fresnel_Contrast_Pivot", properties);
                        MaterialProperty rfFresBias = ShaderGUI.FindProperty("_RF_Fresnel_Bias", properties);
                        MaterialProperty rfFresScale = ShaderGUI.FindProperty("_RF_Fresnel_Scale", properties);
                        MaterialProperty rfFresPower = ShaderGUI.FindProperty("_RF_Fresnel_Power", properties);

                        materialEditor.ShaderProperty(rfFresTog, "Fresnel");
                        if (rfFresTog.floatValue > 0f)
                        {
                            materialEditor.ShaderProperty(rfFresInv, "Invert");
                            materialEditor.ShaderProperty(rfFresGam, "Gamma");
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, rfFresCont, "Contrast", 0f, 5f);
                            materialEditor.ShaderProperty(rfFresContP, "Contrast Pivot");
                            materialEditor.ShaderProperty(rfFresBias, "Bias");
                            materialEditor.ShaderProperty(rfFresScale, "Scale");
                            materialEditor.ShaderProperty(rfFresPower, "Power");
                        }
                    });
                    #endregion

                    #region Chromatic Aberration Settings
                    GUIExtras.SFoldout(targetMat, "_ChromaFold", "Chromatic Aberration Control", BDColors.DarkRed(160), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty ChrAb = ShaderGUI.FindProperty("_Chromatic_Aberration", properties);
                        materialEditor.ShaderProperty(ChrAb, "Chromatic Aberration");

                        if(ChrAb.floatValue > 0f)
                        {
                            MaterialProperty caInt = ShaderGUI.FindProperty("_CA_Intensity", properties);
                            MaterialProperty caMult = ShaderGUI.FindProperty("_CA_Multiplier", properties);
                            MaterialProperty caRedX = ShaderGUI.FindProperty("_CA_Red_X", properties);
                            MaterialProperty caRedY = ShaderGUI.FindProperty("_CA_Red_Y", properties);
                            MaterialProperty caRedZ = ShaderGUI.FindProperty("_CA_Red_Z", properties);
                            MaterialProperty caGreenX = ShaderGUI.FindProperty("_CA_Green_X", properties);
                            MaterialProperty caGreenY = ShaderGUI.FindProperty("_CA_Green_Y", properties);
                            MaterialProperty caGreenZ = ShaderGUI.FindProperty("_CA_Green_Z", properties);
                            MaterialProperty caBlueX = ShaderGUI.FindProperty("_CA_Blue_X", properties);
                            MaterialProperty caBlueY = ShaderGUI.FindProperty("_CA_Blue_Y", properties);
                            MaterialProperty caBlueZ = ShaderGUI.FindProperty("_CA_Blue_Z", properties);

                            materialEditor.ShaderProperty(caInt, "Intensity");
                            materialEditor.ShaderProperty(caMult, "Multiplier");
                            materialEditor.ShaderProperty(caRedX, "Red X");
                            materialEditor.ShaderProperty(caRedY, "Red Y");
                            materialEditor.ShaderProperty(caRedZ, "Red Z");
                            materialEditor.ShaderProperty(caGreenX, "Green X");
                            materialEditor.ShaderProperty(caGreenY, "Green Y");
                            materialEditor.ShaderProperty(caGreenZ, "Green Z");
                            materialEditor.ShaderProperty(caBlueX, "Blue X");
                            materialEditor.ShaderProperty(caBlueY, "Blue Y");
                            materialEditor.ShaderProperty(caBlueZ, "Blue Z");
                        }

                    });
                    #endregion

                    #region Refraction Transparency Settings
                    GUIExtras.SFoldout(targetMat, "_RfTrFold", "Refraction Transparency Controls", BDColors.DarkRed(200), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty rftr = ShaderGUI.FindProperty("_RF_Transparent_Toggle", properties);
                        materialEditor.ShaderProperty(rftr, "Refraction Transparent");

                        if(rftr.floatValue > 0.0f)
                        {
                            MaterialProperty rfTrans = ShaderGUI.FindProperty("_Refract_Transparency", properties);
                            MaterialProperty rfTransMult = ShaderGUI.FindProperty("_RF_TR_Multiplier", properties);
                            MaterialProperty rftrFRS = ShaderGUI.FindProperty("_RF_TR_Fresnel_Toggle", properties);
                            materialEditor.ShaderProperty(rfTrans, "Transparency");
                            materialEditor.ShaderProperty(rfTransMult, "Multiplier");
                            materialEditor.ShaderProperty(rftrFRS, "Fresnel");

                            if(rftrFRS.floatValue > 0.0f)
                            {
                                MaterialProperty rftrFRSInvert = ShaderGUI.FindProperty("_RF_TR_Fresnel_Invert", properties);
                                MaterialProperty rftrFRSCont = ShaderGUI.FindProperty("_RF_TR_Fresnel_Contrast", properties);
                                MaterialProperty rftrFRSContP = ShaderGUI.FindProperty("_RF_TR_Fresnel_Contrast_Pivot", properties);
                                MaterialProperty rftrFRSGamma = ShaderGUI.FindProperty("_RF_TR_Fresnel_Gamma", properties);
                                MaterialProperty rftrFRSBias = ShaderGUI.FindProperty("_RF_TR_Fresnel_Bias", properties);
                                MaterialProperty rftrFRSScale = ShaderGUI.FindProperty("_RF_TR_Fresnel_Scale", properties);
                                MaterialProperty rftrFRSPower = ShaderGUI.FindProperty("_RF_TR_Fresnel_Power", properties);

                                materialEditor.ShaderProperty(rftrFRSInvert, "Invert");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, rftrFRSCont, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(rftrFRSContP, "Contrast Pivot");
                                materialEditor.ShaderProperty(rftrFRSGamma, "Gamma");
                                materialEditor.ShaderProperty(rftrFRSBias, "Bias");
                                materialEditor.ShaderProperty(rftrFRSScale, "Scale");
                                materialEditor.ShaderProperty(rftrFRSPower, "Power");
                            }
                        }
                    });
                    #endregion
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Curvature Settings
        GUIExtras.SHeader("CURVATURE SETTINGS", ref checkCurv, "_CheckCurv", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkCurv)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty curvTog = ShaderGUI.FindProperty("_Curvature_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(curvTog, "Curvature");
                });

                if(curvTog.floatValue > 0f)
                {
                    MaterialProperty cCol = ShaderGUI.FindProperty("_Curvature_Color", properties);
                    MaterialProperty cstr = ShaderGUI.FindProperty("_Curvature_Strength", properties);
                    MaterialProperty cmult = ShaderGUI.FindProperty("_Curvature_Multiplier", properties);
                    MaterialProperty cInv = ShaderGUI.FindProperty("_Curvature_Invert", properties);
                    MaterialProperty cGma = ShaderGUI.FindProperty("_Gamma", properties);
                    MaterialProperty cmin = ShaderGUI.FindProperty("_Clamp_Min", properties);
                    MaterialProperty cmax = ShaderGUI.FindProperty("_Clamp_Max", properties);
                    MaterialProperty cMap = ShaderGUI.FindProperty("_Irregularity_Map", properties);
                    MaterialProperty cIrrStr = ShaderGUI.FindProperty("_Irregularity_Strength", properties);

                    materialEditor.ShaderProperty(cCol, "Color");
                    materialEditor.ShaderProperty(cstr, "Strength");
                    materialEditor.ShaderProperty(cmult, "Multiplier");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cGma, "Gamma", 0, 5);
                    materialEditor.ShaderProperty(cInv, "Invert");
                    materialEditor.ShaderProperty(cmin, "Clamp Min");
                    materialEditor.ShaderProperty(cmax, "Clamp Max");
                    materialEditor.ShaderProperty(cMap, "Irregularity Map");
                    materialEditor.ShaderProperty(cIrrStr, "Irregularity Strength");
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Ambient Occlusion Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty ao = ShaderGUI.FindProperty("_AO_Toggle", properties);

                GUIExtras.SColoredVertical(BDColors.NexusBlue(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(ao, "Ambient Occlusion");
                });

                if(ao.floatValue > 0)
                {
                    MaterialProperty aoInt = ShaderGUI.FindProperty("_AO_Intensity", properties);
                    MaterialProperty aoMap = ShaderGUI.FindProperty("_AO_Map", properties);
                    MaterialProperty aoInv = ShaderGUI.FindProperty("_AO_Invert", properties);
                    MaterialProperty aoCol = ShaderGUI.FindProperty("_AO_Color", properties);
                    MaterialProperty aoLCol = ShaderGUI.FindProperty("_Lighten_Color", properties);
                    MaterialProperty aoPwr = ShaderGUI.FindProperty("_AO_Power", properties);
                    MaterialProperty aoCont = ShaderGUI.FindProperty("_AO_Contrast", properties);
                    MaterialProperty aoContP = ShaderGUI.FindProperty("_AOContPivot", properties);
                    MaterialProperty aoGma = ShaderGUI.FindProperty("_AO_Gamma", properties);
                    MaterialProperty aoMin = ShaderGUI.FindProperty("_AO_Min", properties);
                    MaterialProperty aoMax = ShaderGUI.FindProperty("_AO_Max", properties);

                    materialEditor.ShaderProperty(aoInt, "Intensity");
                    materialEditor.ShaderProperty(aoMap, "Ambient Occlusion Map");
                    materialEditor.ShaderProperty(aoInv, "Invert");
                    materialEditor.ShaderProperty(aoLCol, "Lighten Color");
                    materialEditor.ShaderProperty(aoCol, "Darken Color");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, aoGma, "Gamma",0,5);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, aoCont, "Contrast",0,5);
                    materialEditor.ShaderProperty(aoContP, "Contrast Pivot");
                    materialEditor.ShaderProperty(aoPwr, "Power");
                    materialEditor.ShaderProperty(aoMin, "Smooth Step Min");
                    materialEditor.ShaderProperty(aoMax, "Smooth Step Max");

                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Thickness Settings
        GUIExtras.SHeader("THICKNESS SETTINGS", ref checkThickness, "_CheckThickness", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkThickness)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty thc = ShaderGUI.FindProperty("_Thickness_Toggle", properties);

                GUIExtras.SColoredVertical(BDColors.NexusBlue(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(thc, "Thickness");
                });
                if (thc.floatValue > 0)
                {
                    MaterialProperty thcCol = ShaderGUI.FindProperty("_Thickness_Color", properties);
                    MaterialProperty thcMap = ShaderGUI.FindProperty("_Thickness_Map", properties);
                    MaterialProperty thcGma = ShaderGUI.FindProperty("_Thickness_Gamma", properties);
                    MaterialProperty thcCont = ShaderGUI.FindProperty("_Thickness_Contrast", properties);
                    MaterialProperty thcContP = ShaderGUI.FindProperty("_TContPivot", properties);
                    MaterialProperty thcInv = ShaderGUI.FindProperty("_Thickness_Invert", properties);
                    MaterialProperty thcInt = ShaderGUI.FindProperty("_Thickness_Intensity", properties);
                    MaterialProperty thcMult = ShaderGUI.FindProperty("_Thickness_Multiplier", properties);
                   // MaterialProperty thcPat = ShaderGUI.FindProperty("_Thickness_Pattern_Intensity", properties);

                    materialEditor.ShaderProperty(thcCol, "Color");
                    materialEditor.ShaderProperty(thcMap, "Map");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, thcGma, "Gamma", 0, 5);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, thcCont, "Contrast", 0, 5);
                    materialEditor.ShaderProperty(thcContP, "Contrast Pivot");
                    materialEditor.ShaderProperty(thcInv, "Invert");
                    materialEditor.ShaderProperty(thcInt, "Intensity");
                    materialEditor.ShaderProperty(thcMult, "Multiplier");
                    //materialEditor.ShaderProperty(thcPat, "Pattern Intensity");
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }
    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSS");
        checkSS = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCustomSpec");
        checkCustomSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckTrans");
        checkTrans = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRefract");
        checkRefract = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCurv");
        checkCurv = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCurvNM");
        checkCurvNM = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckThickness");
        checkThickness = tempVar == 1 ? true : false;



        tempVar = targetMat.GetInt("_CubemapFold");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TrFresnelFold");
        trFresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RfFresnelFold");
        rfFresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ChromaFold");
        chromaFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RfTrFold");
        rftrFold = tempVar == 1 ? true : false;
    }
}

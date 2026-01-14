// BUDU Games 2023 - 2025
using budu;
using System;
using UnityEditor;
using UnityEngine;

public class BCarPaintEditor : ShaderGUI
{
    bool checkDef, checkBase, checkStickers, checkShade, checkFlakes, checkNormal, checkSpec, checkSecSpec, checkReflect, checkAO, checkDamage, clearCoat;
    bool shadeExtFold, flakeAFold, flakeBFold, cubemapFold, fresnelFold, flakeSpecFold, twoColorFold;
    bool aboutFold, TopStickerTog, BottomStickerTog, LeftStickerTog, RightStickerTog, FrontStickerTog, BackStickerTog;
    int tempVar, blendingMode, workflowMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Car Paint Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUCarPaintTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS",ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
                MaterialProperty baseNorm = ShaderGUI.FindProperty("_Base_Normal_Intensity", properties);
                MaterialProperty emisCoef = ShaderGUI.FindProperty("_Color_Affect_Emissive", properties);
                MaterialProperty envLight = ShaderGUI.FindProperty("_Environment_Light_Affect", properties);

                materialEditor.ShaderProperty(bc, "Base Color");
                materialEditor.ShaderProperty(baseNorm, "Color Normal Strength");
                materialEditor.ShaderProperty(emisCoef, "Color Emissive");
                materialEditor.ShaderProperty(envLight, "Environment Affect");

                GUIExtras.SFoldout(targetMat, "_TwoColorFold", "Two Color", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty twoCol = ShaderGUI.FindProperty("_Two_Colors", properties);
                    materialEditor.ShaderProperty(twoCol, "Two Color");
                    if (twoCol.floatValue > 0f)
                    {
                        MaterialProperty paintType = ShaderGUI.FindProperty("_PAINT_TYPE_SELECTOR", properties);
                        MaterialProperty secCol = ShaderGUI.FindProperty("_Second_Color", properties);

                        MaterialProperty cfi = ShaderGUI.FindProperty("_Color_Fresnel_Invert", properties);
                        MaterialProperty cfb = ShaderGUI.FindProperty("_Color_Fresnel_Bias", properties);
                        MaterialProperty cfs = ShaderGUI.FindProperty("_Color_Fresnel_Scale", properties);
                        MaterialProperty cfp = ShaderGUI.FindProperty("_Color_Fresnel_Power", properties);
                        MaterialProperty cfc = ShaderGUI.FindProperty("_Color_Fresnel_Contrast", properties);
                        MaterialProperty cfcp = ShaderGUI.FindProperty("_Color_Fresnel_Contrast_Pivot", properties);

                        MaterialProperty cgi = ShaderGUI.FindProperty("_Grad_Invert", properties);
                        MaterialProperty cgs = ShaderGUI.FindProperty("_Grad_Scale", properties);
                        MaterialProperty cgo = ShaderGUI.FindProperty("_Grad_Bias", properties);
                        MaterialProperty cfty = ShaderGUI.FindProperty("_Color_Fresnel_Gamma", properties);
                        MaterialProperty cgty = ShaderGUI.FindProperty("_Grad_Gamma", properties);
                        MaterialProperty cgc = ShaderGUI.FindProperty("_Grad_Contrast", properties);
                        MaterialProperty cgcp = ShaderGUI.FindProperty("_Grad_Contrast_Pivot", properties);

                        MaterialProperty cgrx = ShaderGUI.FindProperty("_Grad_Rotation_X", properties);
                        MaterialProperty cgry = ShaderGUI.FindProperty("_Grad_Rotation_Y", properties);
                        MaterialProperty cgrz = ShaderGUI.FindProperty("_Grad_Rotation_Z", properties);

                        materialEditor.ShaderProperty(paintType, "Paint Method");
                        materialEditor.ColorProperty(secCol, "Second Color");

                        switch ((int)paintType.floatValue)
                        {
                            #region Fresnel
                            case 0:
                                // Fresnel
                                GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                                {
                                    EditorGUILayout.LabelField("FRESNEL");
                                }, GUILayout.Height(20));
                                materialEditor.ShaderProperty(cfi, "Invert");
                                materialEditor.ShaderProperty(cfty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cfc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cfcp, "Contrast Pivot");
                                materialEditor.ShaderProperty(cfb, "Bias");
                                materialEditor.ShaderProperty(cfs, "Scale");
                                materialEditor.ShaderProperty(cfp, "Power");
                                EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                                break;
                            #endregion
                            #region Gradient Y
                            case 1:
                                // Gradient
                                GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                                {
                                    EditorGUILayout.LabelField("GRADIENT");
                                }, GUILayout.Height(20));
                                materialEditor.ShaderProperty(cgi, "Invert");
                                materialEditor.ShaderProperty(cgty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cgcp, "Contrast Pivot");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgs, "Scale", 0, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgo, "Bias", -1, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrx, "Rotate X", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgry, "Rotate Y", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrz, "Rotate Z", -360, 360);
                                EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                                break;
                            #endregion
                            #region Fresnel & Gradient Y
                            case 2:
                                // Fresnel
                                GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                                {
                                    EditorGUILayout.LabelField("FRESNEL");
                                }, GUILayout.Height(20));
                                materialEditor.ShaderProperty(cfi, "Invert");
                                materialEditor.ShaderProperty(cfty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cfc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cfc, "Contrast Pivot");
                                materialEditor.ShaderProperty(cfb, "Bias");
                                materialEditor.ShaderProperty(cfs, "Scale");
                                materialEditor.ShaderProperty(cfp, "Power");
                                // Gradient
                                GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                                {
                                    EditorGUILayout.LabelField("GRADIENT");
                                }, GUILayout.Height(20));
                                materialEditor.ShaderProperty(cgi, "Invert");
                                materialEditor.ShaderProperty(cgty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cgcp, "Contrast Pivot");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgs, "Scale", 0, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgo, "Bias", -1, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrx, "Rotate X", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgry, "Rotate Y", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrz, "Rotate Z", -360, 360);
                                EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                                break;
                                #endregion
                        }
                    }
                });
            }
            EditorGUI.indentLevel--;
            GUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Stickers Settings
        GUIExtras.SHeader("STICKERS SETTINGS", ref checkStickers, "_CheckStickers", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkStickers)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty stickers = ShaderGUI.FindProperty("_Sticker_Toggle", properties);

            GUIExtras.ColoredVertical(BDColors.NexusOrange(50),() =>
            {
                materialEditor.ShaderProperty(stickers, "Stickers");
            },GUILayout.Height(20));

            if(stickers.floatValue > 0f)
            {
                MaterialProperty stickersOpacity = ShaderGUI.FindProperty("_Sticker_Opacity", properties);
                MaterialProperty posPrec = ShaderGUI.FindProperty("_Position_Precision", properties);
                MaterialProperty sclPrec = ShaderGUI.FindProperty("_Scale_Precision", properties);
                MaterialProperty stcBlend = ShaderGUI.FindProperty("_STICKER_BLEND", properties);

                MaterialProperty triBlend = ShaderGUI.FindProperty("_Triplanar_Blend", properties);
                MaterialProperty stcNormal = ShaderGUI.FindProperty("_Sticker_Normal_Toggle", properties);
                MaterialProperty stcNormStr = ShaderGUI.FindProperty("_Sticker_Normal_Strength", properties);
                MaterialProperty stcEmsInt = ShaderGUI.FindProperty("_Sticker_Emissive_Intensity", properties);
                MaterialProperty stcFeatures = ShaderGUI.FindProperty("_Stickers_Features", properties);

                materialEditor.ShaderProperty(stcBlend, "Sticker Blend Method");
                materialEditor.ShaderProperty(stickersOpacity, "Stickers Opacity");
                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 150;
                EditorGUIUtility.fieldWidth = 10;
                materialEditor.ShaderProperty(posPrec, "Position Precision");
                materialEditor.ShaderProperty(sclPrec, "Scale Precision");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();

                materialEditor.ShaderProperty(triBlend, "Triplanar Blend");
                materialEditor.ShaderProperty(stcNormal, "Sticker Normal");
                materialEditor.ShaderProperty(stcNormStr, "Sticker Normal Strength");
                materialEditor.ShaderProperty(stcEmsInt, "Sticker Emissive Intensity");
                materialEditor.ShaderProperty(stcFeatures, "Sticker Features Affect");

                #region Top Sticker Settings
                style.normal.background = GUIExtras.MakeBackground(1, 1, BDColors.NexusOrange(20));
                style.fontSize = 11;
                style.alignment = TextAnchor.MiddleLeft;
                style.normal.textColor = BDColors.NexusOrange(250);

                TopStickerTog = EditorGUILayout.ToggleLeft("TOP STICKER", TopStickerTog, style);
                targetMat.SetInt("_Top_Sticker_Toggle", Convert.ToInt16(TopStickerTog));

                if (TopStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty topColor = ShaderGUI.FindProperty("_Top_Color", properties);
                    MaterialProperty topSticker = ShaderGUI.FindProperty("_Top_Sticker", properties);
                    MaterialProperty topSclX = ShaderGUI.FindProperty("_Top_Scale_X", properties);
                    MaterialProperty topSclY = ShaderGUI.FindProperty("_Top_Scale_Z", properties);
                    MaterialProperty topPosX = ShaderGUI.FindProperty("_Top_Pos_X", properties);
                    MaterialProperty topPosY = ShaderGUI.FindProperty("_Top_Pos_Z", properties);
                    MaterialProperty topRotate = ShaderGUI.FindProperty("_Top_Rotate", properties);
                    MaterialProperty topRotateSpeed = ShaderGUI.FindProperty("_Top_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(topColor, "Sticker Color");
                    materialEditor.ShaderProperty(topSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(topPosX, "Position X");
                    materialEditor.ShaderProperty(topPosY, "Position Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(topSclX, "Scale X");
                    materialEditor.ShaderProperty(topSclY, "Scale Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(topRotate, "Rotate");
                    materialEditor.ShaderProperty(topRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }
                #endregion

                #region Bottom Sticker Settings
                style.normal.background = GUIExtras.MakeBackground(1, 1, BDColors.NexusOrange(20));
                style.fontSize = 11;
                style.alignment = TextAnchor.MiddleLeft;
                style.normal.textColor = BDColors.NexusOrange(250);

                BottomStickerTog = EditorGUILayout.ToggleLeft("BOTTOM STICKER", BottomStickerTog, style);
                targetMat.SetInt("_Bottom_Sticker_Toggle", Convert.ToInt16(BottomStickerTog));

                if (BottomStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty botColor = ShaderGUI.FindProperty("_Bottom_Color", properties);
                    MaterialProperty botSticker = ShaderGUI.FindProperty("_Bottom_Sticker", properties);
                    MaterialProperty botSclX = ShaderGUI.FindProperty("_Bottom_Scale_X", properties);
                    MaterialProperty botSclY = ShaderGUI.FindProperty("_Bottom_Scale_Z", properties);
                    MaterialProperty botPosX = ShaderGUI.FindProperty("_Bottom_Pos_X", properties);
                    MaterialProperty botPosY = ShaderGUI.FindProperty("_Bottom_Pos_Z", properties);
                    MaterialProperty botRotate = ShaderGUI.FindProperty("_Bottom_Rotate", properties);
                    MaterialProperty botRotateSpeed = ShaderGUI.FindProperty("_Bottom_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(botColor, "Sticker Color");
                    materialEditor.ShaderProperty(botSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(botPosX, "Position X");
                    materialEditor.ShaderProperty(botPosY, "Position Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(botSclX, "Scale X");
                    materialEditor.ShaderProperty(botSclY, "Scale Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(botRotate, "Rotate");
                    materialEditor.ShaderProperty(botRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }

                #endregion

                #region Left Sticker Settings
                style.normal.background = GUIExtras.MakeBackground(1, 1, BDColors.NexusOrange(20));
                style.fontSize = 11;
                style.alignment = TextAnchor.MiddleLeft;
                style.normal.textColor = BDColors.NexusOrange(250);

                LeftStickerTog = EditorGUILayout.ToggleLeft("LEFT STICKER", LeftStickerTog, style);
                targetMat.SetInt("_Left_Sticker_Toggle", Convert.ToInt16(LeftStickerTog));

                if (LeftStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty lftColor = ShaderGUI.FindProperty("_Left_Color", properties);
                    MaterialProperty lftSticker = ShaderGUI.FindProperty("_Left_Sticker", properties);
                    MaterialProperty lftSclY = ShaderGUI.FindProperty("_Left_Scale_Y", properties);
                    MaterialProperty lftSclZ = ShaderGUI.FindProperty("_Left_Scale_Z", properties);
                    MaterialProperty lftPosY = ShaderGUI.FindProperty("_Left_Pos_Y", properties);
                    MaterialProperty lftPosZ = ShaderGUI.FindProperty("_Left_Pos_Z", properties);
                    MaterialProperty lftRotate = ShaderGUI.FindProperty("_Left_Rotate", properties);
                    MaterialProperty lftRotateSpeed = ShaderGUI.FindProperty("_Left_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(lftColor, "Sticker Color");
                    materialEditor.ShaderProperty(lftSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(lftPosY, "Position Y");
                    materialEditor.ShaderProperty(lftPosZ, "Position Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(lftSclY, "Scale Y");
                    materialEditor.ShaderProperty(lftSclZ, "Scale Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(lftRotate, "Rotate");
                    materialEditor.ShaderProperty(lftRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }

                #endregion

                #region Right Sticker Settings
                RightStickerTog = EditorGUILayout.ToggleLeft("RIGHT STICKER", RightStickerTog, style);
                targetMat.SetInt("_Right_Sticker_Toggle", Convert.ToInt16(RightStickerTog));

                if (RightStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty rghColor = ShaderGUI.FindProperty("_Right_Color", properties);
                    MaterialProperty rghSticker = ShaderGUI.FindProperty("_Right_Sticker", properties);
                    MaterialProperty rghSclY = ShaderGUI.FindProperty("_Right_Scale_Y", properties);
                    MaterialProperty rghSclZ = ShaderGUI.FindProperty("_Right_Scale_Z", properties);
                    MaterialProperty rghPosY = ShaderGUI.FindProperty("_Right_Pos_Y", properties);
                    MaterialProperty rghPosZ = ShaderGUI.FindProperty("_Right_Pos_Z", properties);
                    MaterialProperty rghRotate = ShaderGUI.FindProperty("_Right_Rotate", properties);
                    MaterialProperty rghRotateSpeed = ShaderGUI.FindProperty("_Right_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(rghColor, "Sticker Color");
                    materialEditor.ShaderProperty(rghSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(rghPosY, "Position Y");
                    materialEditor.ShaderProperty(rghPosZ, "Position Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(rghSclY, "Scale Y");
                    materialEditor.ShaderProperty(rghSclZ, "Scale Z");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(rghRotate, "Rotate");
                    materialEditor.ShaderProperty(rghRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }

                #endregion

                #region Front Sticker Settings
                FrontStickerTog = EditorGUILayout.ToggleLeft("FRONT STICKER", FrontStickerTog, style);
                targetMat.SetInt("_Front_Sticker_Toggle", Convert.ToInt16(FrontStickerTog));

                if (FrontStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty frnColor = ShaderGUI.FindProperty("_Front_Color", properties);
                    MaterialProperty frnSticker = ShaderGUI.FindProperty("_Front_Sticker", properties);
                    MaterialProperty frnSclX = ShaderGUI.FindProperty("_Front_Scale_X", properties);
                    MaterialProperty frnSclY = ShaderGUI.FindProperty("_Front_Scale_Y", properties);
                    MaterialProperty frnPosX = ShaderGUI.FindProperty("_Front_Pos_X", properties);
                    MaterialProperty frnPosY = ShaderGUI.FindProperty("_Front_Pos_Y", properties);
                    MaterialProperty frnRotate = ShaderGUI.FindProperty("_Front_Rotate", properties);
                    MaterialProperty frnRotateSpeed = ShaderGUI.FindProperty("_Front_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(frnColor, "Sticker Color");
                    materialEditor.ShaderProperty(frnSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(frnPosX, "Position X");
                    materialEditor.ShaderProperty(frnPosY, "Position Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(frnSclX, "Scale X");
                    materialEditor.ShaderProperty(frnSclY, "Scale Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(frnRotate, "Rotate");
                    materialEditor.ShaderProperty(frnRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }
                #endregion

                #region Back Sticker Settings
                BackStickerTog = EditorGUILayout.ToggleLeft("BACK STICKER", BackStickerTog, style);
                targetMat.SetInt("_Back_Sticker_Toggle", Convert.ToInt16(BackStickerTog));

                if (BackStickerTog)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty bckColor = ShaderGUI.FindProperty("_Back_Color", properties);
                    MaterialProperty bckSticker = ShaderGUI.FindProperty("_Back_Sticker", properties);
                    MaterialProperty bckSclX = ShaderGUI.FindProperty("_Back_Scale_X", properties);
                    MaterialProperty bckSclY = ShaderGUI.FindProperty("_Back_Scale_Y", properties);
                    MaterialProperty bckPosX = ShaderGUI.FindProperty("_Back_Pos_X", properties);
                    MaterialProperty bckPosY = ShaderGUI.FindProperty("_Back_Pos_Y", properties);
                    MaterialProperty bckRotate = ShaderGUI.FindProperty("_Back_Rotate", properties);
                    MaterialProperty bckRotateSpeed = ShaderGUI.FindProperty("_Back_Rotate_Speed", properties);

                    materialEditor.ShaderProperty(bckColor, "Sticker Color");
                    materialEditor.ShaderProperty(bckSticker, "Sticker Texture");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(bckPosX, "Position X");
                    materialEditor.ShaderProperty(bckPosY, "Position Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 150;
                    EditorGUIUtility.fieldWidth = 10;
                    materialEditor.ShaderProperty(bckSclX, "Scale X");
                    materialEditor.ShaderProperty(bckSclY, "Scale Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(bckRotate, "Rotate");
                    materialEditor.ShaderProperty(bckRotateSpeed, "Rotate Speed");

                    EditorGUI.indentLevel--;
                }
                #endregion

            }


            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
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

        #region Flakes Settings
        GUIExtras.SHeader("FLAKES SETTINGS", ref checkFlakes, "_CheckFlakes", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkFlakes)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Flakes = ShaderGUI.FindProperty("_Specular_Flakes",properties);

            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(Flakes, "Flakes");
            }, GUILayout.Height(20));
            if(Flakes.floatValue > 0f)
            {
                MaterialProperty flCol = ShaderGUI.FindProperty("_Flakes_Color", properties);
                MaterialProperty flTxt = ShaderGUI.FindProperty("_Flakes_Texture", properties);
                MaterialProperty flGamma = ShaderGUI.FindProperty("_Flakes_Gamma_Strength", properties);
                MaterialProperty flSpInt = ShaderGUI.FindProperty("_Flakes_Specular_Intensity", properties);

                materialEditor.ShaderProperty(flCol, "Flakes Color");
                materialEditor.ShaderProperty(flTxt, "Flakes Texture");
                materialEditor.ShaderProperty(flGamma, "Flakes Gamma");
                materialEditor.ShaderProperty(flSpInt, "Flakes Intensity");


                #region Flake A Settings
                GUIExtras.SFoldout(targetMat, "_FlakeAFold", "Flakes A Settings", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty FA_BlendType = ShaderGUI.FindProperty("_Flakes_A_BlendType", properties, false);
                    string[] faOpt = new string[] { "Multiply", "Divide", "Add", "Subtract" };

                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, FA_BlendType, "Flakes A - Blend Type", faOpt);

                    MaterialProperty faSpeedX = ShaderGUI.FindProperty("_Flake_A_Speed_X", properties);
                    MaterialProperty faSpeedY = ShaderGUI.FindProperty("_Flake_A_Speed_Y", properties);
                    MaterialProperty faOverSpeed = ShaderGUI.FindProperty("_Flake_A_Overall_Speed", properties);
                    MaterialProperty faPivotX = ShaderGUI.FindProperty("_Flake_A_Pivot_X", properties);
                    MaterialProperty faPivotY = ShaderGUI.FindProperty("_Flake_A_Pivot_Y", properties);
                    MaterialProperty faRotate = ShaderGUI.FindProperty("_Flake_A_Rotate", properties);
                    MaterialProperty faRotateSpeed = ShaderGUI.FindProperty("_Flake_A_Rotate_Speed", properties);

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 120;
                    EditorGUIUtility.fieldWidth = 60;
                    materialEditor.ShaderProperty(faSpeedX, "Speed X");
                    materialEditor.ShaderProperty(faSpeedY, "Speed Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(faOverSpeed, "Overall Speed");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 20;
                    materialEditor.ShaderProperty(faPivotX, "Pivot X");
                    materialEditor.ShaderProperty(faPivotY, "Pivot Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(faRotate, "Rotate");
                    materialEditor.ShaderProperty(faRotateSpeed, "Rotate Speed");
                });
                #endregion

                #region Flake B Settings
                GUIExtras.SFoldout(targetMat, "_FlakeBFold", "Flakes B Settings", BDColors.DarkRed(180), () =>
                {
                    MaterialProperty FA_BlendType = ShaderGUI.FindProperty("_Flakes_B_BlendType", properties, false);
                    string[] faOpt = new string[] { "Multiply", "Divide", "Add", "Subtract" };

                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, FA_BlendType, "Flakes B - Blend Type", faOpt);

                    MaterialProperty fbSpeedX = ShaderGUI.FindProperty("_Flake_B_Speed_X", properties);
                    MaterialProperty fbSpeedY = ShaderGUI.FindProperty("_Flake_B_Speed_Y", properties);
                    MaterialProperty fbOverSpeed = ShaderGUI.FindProperty("_Flake_B_Overall_Speed", properties);
                    MaterialProperty fbPivotX = ShaderGUI.FindProperty("_Flake_B_Pivot_X", properties);
                    MaterialProperty fbPivotY = ShaderGUI.FindProperty("_Flake_B_Pivot_Y", properties);
                    MaterialProperty fbRotate = ShaderGUI.FindProperty("_Flake_B_Rotate", properties);
                    MaterialProperty fbRotateSpeed = ShaderGUI.FindProperty("_Flake_B_Rotate_Speed", properties);

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 120;
                    EditorGUIUtility.fieldWidth = 60;
                    materialEditor.ShaderProperty(fbSpeedX, "Speed X");
                    materialEditor.ShaderProperty(fbSpeedY, "Speed Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(fbOverSpeed, "Overall Speed");

                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 170;
                    EditorGUIUtility.fieldWidth = 20;
                    materialEditor.ShaderProperty(fbPivotX, "Pivot X");
                    materialEditor.ShaderProperty(fbPivotY, "Pivot Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                    EditorGUILayout.EndHorizontal();

                    materialEditor.ShaderProperty(fbRotate, "Rotate");
                    materialEditor.ShaderProperty(fbRotateSpeed, "Rotate Speed");
                });
                #endregion

                #region Flakes Specular Settings
                GUIExtras.SFoldout(targetMat, "_FlakeSpecFold", "Flakes Specular Settings", BDColors.DarkRed(220), () =>
                {
                    MaterialProperty spGam = ShaderGUI.FindProperty("_Flakes_Spec_Gamma", properties);
                    MaterialProperty spGls = ShaderGUI.FindProperty("_Flakes_Spec_Glossy", properties);
                    MaterialProperty spSoft = ShaderGUI.FindProperty("_Flakes_Spec_Softness", properties);
                    MaterialProperty spSat = ShaderGUI.FindProperty("_Flakes_Spec_Saturation", properties);
                    MaterialProperty spSIn = ShaderGUI.FindProperty("_Flakes_Spec_In", properties);
                    MaterialProperty spSOut = ShaderGUI.FindProperty("_Flakes_Spec_Out", properties);

                    materialEditor.ShaderProperty(spGam, "Flakes Specular Gamma");
                    materialEditor.ShaderProperty(spGls, "Flakes Specular Glossy");
                    materialEditor.ShaderProperty(spSoft, "Flakes Specular Softness");
                    materialEditor.ShaderProperty(spSat, "Flakes Specular Saturation");
                    materialEditor.ShaderProperty(spSIn, "Flakes Specular In");
                    materialEditor.ShaderProperty(spSOut, "Flakes Specular Out");
                });
                #endregion
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            MaterialProperty nrm = ShaderGUI.FindProperty("_Normal", properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(nrm, "Normal Map");
            }, GUILayout.Height(20));
            if(nrm.floatValue > 0.0f)
            {
                MaterialProperty flnTxt = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty FlNormStrength = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty FlNormMultiplier = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(flnTxt, "Normal Map");
                materialEditor.RangeProperty(FlNormStrength, "Normal Strength");
                materialEditor.RangeProperty(FlNormMultiplier, "Normal Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Base Specular Settings
        GUIExtras.SHeader("SPECULAR | METALLIC SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty Spec = ShaderGUI.FindProperty("_Base_Spec_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(Spec, "Base Specular");
            }, GUILayout.Height(20));
            if(Spec.floatValue > 0.0f)
            {
                if (isSpecular > 0)
                {
                    MaterialProperty specCol = ShaderGUI.FindProperty("_Specular_Color", properties);
                    MaterialProperty specInt = ShaderGUI.FindProperty("_Base_Spec_Intensity", properties);
                    materialEditor.ShaderProperty(specCol, "Base Specular Color");
                    materialEditor.ShaderProperty(specInt, "Base Specular Intensity");
                }

                MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness", properties);
                materialEditor.ShaderProperty(smoothness, "Smoothness");

                if (clearCoat)
                {
                    MaterialProperty coatMask = ShaderGUI.FindProperty("_Coat_Mask", properties);
                    MaterialProperty coatSmoothness = ShaderGUI.FindProperty("_Coat_Smoothness", properties);
                    materialEditor.ShaderProperty(coatMask, "Coat Mask");
                    materialEditor.ShaderProperty(coatSmoothness, "Coat Smoothness");
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        GUIExtras.SHeader("SPECULAR SETTINGS", ref checkSecSpec, "_CheckSecSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkSecSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty specTog = ShaderGUI.FindProperty("_Spec_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(specTog, "Specular Feature");
            }, GUILayout.Height(20));
            if (specTog.floatValue > 0.0f)
            {
                MaterialProperty spcol = ShaderGUI.FindProperty("_Spec_Color", properties);
                MaterialProperty spInt = ShaderGUI.FindProperty("_Spec_Intensity", properties);
                MaterialProperty spTxt = ShaderGUI.FindProperty("_Spec_Map", properties);

                materialEditor.ShaderProperty(spcol, "Color");
                materialEditor.ShaderProperty(spTxt, "Specular Map");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, spInt, "Intensity", 0, 5);
                if (!GUIExtras.IsTextureEmpty(spTxt))
                {
                    MaterialProperty spInv = ShaderGUI.FindProperty("_Spec_Map_Invert", properties);
                    materialEditor.ShaderProperty(spInv, "Map Invert");
                }

                #region Extra Specular Controls
                GUIExtras.SFoldout(targetMat, "_SpecExtFold", "Specular Extra Controls", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty spNormStr = ShaderGUI.FindProperty("_Spec_Normal_Strength", properties);
                    MaterialProperty spNormMult = ShaderGUI.FindProperty("_Spec_Normal_Multiplier", properties);
                    MaterialProperty lgGam = ShaderGUI.FindProperty("_Spec_Gamma", properties);
                    MaterialProperty spGls = ShaderGUI.FindProperty("_Spec_Glossy", properties);
                    MaterialProperty spSmt = ShaderGUI.FindProperty("_Spec_Softness", properties);
                    MaterialProperty spSat = ShaderGUI.FindProperty("_Spec_Saturation", properties);
                    MaterialProperty spIn = ShaderGUI.FindProperty("_Spec_In", properties);
                    MaterialProperty spOut = ShaderGUI.FindProperty("_Spec_Out", properties);

                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Normal Settings");
                    });
                    materialEditor.ShaderProperty(spNormStr, "Normal Strength");
                    materialEditor.ShaderProperty(spNormMult, "Normal Multiplier");
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Blinn Settings");
                    });
                    materialEditor.ShaderProperty(lgGam, "Gamma");
                    materialEditor.ShaderProperty(spGls, "Glossy");
                    materialEditor.ShaderProperty(spSat, "Saturation");
                    materialEditor.ShaderProperty(spSmt, "Softness");
                    materialEditor.ShaderProperty(spIn, "In");
                    materialEditor.ShaderProperty(spOut, "Out");

                    EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                });
                #endregion
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        GUIExtras.SHeader("REFLECT SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUILayout.Space(2);
            EditorGUI.indentLevel++;

            MaterialProperty Refl = ShaderGUI.FindProperty("_Reflection_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(Refl, "Reflection Features");
            }, GUILayout.Height(20));
            if(Refl.floatValue > 0.0f)
            {
                string[] refTypeOpt = new string[] { "Real Cubemap", "Unreal Cubemap" };
                MaterialProperty refType = ShaderGUI.FindProperty("_RefType", properties);
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", refTypeOpt);

                MaterialProperty rfStr = ShaderGUI.FindProperty("_Reflection_Strength", properties);
                MaterialProperty rfMult = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
                MaterialProperty rfCol = ShaderGUI.FindProperty("_Reflection_Color", properties);
                MaterialProperty rfCbMp = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
                MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shadow", properties);
                MaterialProperty rfMapLOD = ShaderGUI.FindProperty("_RefMapLOD",properties);

                materialEditor.ShaderProperty(rfStr, "Strength");
                materialEditor.ShaderProperty(rfMult, "Multiplier");
                materialEditor.ShaderProperty(rfCol, "Color");
                materialEditor.ShaderProperty(rfCbMp, "Cubemap");
                materialEditor.ShaderProperty(rfMapLOD, "LOD");
                materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");
                if (rfAffShd.floatValue > 0.0f)
                {
                    MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shadow_Strength", properties);
                    materialEditor.ShaderProperty(rfShdStr, "Shadow Strength");
                }

                MaterialProperty rfNrStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
                materialEditor.ShaderProperty(rfNrStr, "Normal Strength");

                #region Cubemap Settings
                GUIExtras.SFoldout(targetMat, "_CubemapFold", "Cubemap Controls", BDColors.DarkRed(120),() =>
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
        GUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty AO = ShaderGUI.FindProperty("_AO_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(AO, "Ambient Occlusion");
            }, GUILayout.Height(20));
            if(AO.floatValue > 0.0f)
            {
                MaterialProperty aoTexture = ShaderGUI.FindProperty("_AO_Map", properties);
                MaterialProperty aoIntensity = ShaderGUI.FindProperty("_AO_Intensity", properties);
                MaterialProperty aoDCol = ShaderGUI.FindProperty("_AO_Dark_Color", properties);
                MaterialProperty aoLCol = ShaderGUI.FindProperty("_AO_Light_Color", properties);
                MaterialProperty aoCont = ShaderGUI.FindProperty("_AO_Contrast", properties);
                MaterialProperty aoContP = ShaderGUI.FindProperty("_AO_Contrast_Pivot", properties);
                MaterialProperty aoGma = ShaderGUI.FindProperty("_AO_Gamma", properties);
                MaterialProperty aoPwr = ShaderGUI.FindProperty("_AO_Power", properties);
                MaterialProperty aoMin = ShaderGUI.FindProperty("_AO_Min", properties);
                MaterialProperty aoMax = ShaderGUI.FindProperty("_AO_Max", properties);

                materialEditor.ShaderProperty(aoTexture, "Ambient Occlusion Map");
                materialEditor.ShaderProperty(aoIntensity, "Intensity");
                materialEditor.ShaderProperty(aoLCol, "Light Color");
                materialEditor.ShaderProperty(aoDCol, "Dark Color");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, aoGma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, aoCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(aoContP, "Contrast Pivot");
                materialEditor.ShaderProperty(aoPwr, "Power");
                materialEditor.ShaderProperty(aoMin, "Min");
                materialEditor.ShaderProperty(aoMax, "Max");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Damage Settings
        GUIExtras.SHeader("DAMAGE SETTINGS", ref checkDamage, "_CheckDamage", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkDamage)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Damg = ShaderGUI.FindProperty("_Damage_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(Damg, "Damage Map Feature");
            }, GUILayout.Height(20));
            if(Damg.floatValue > 0f)
            {
                MaterialProperty dmgTxt = ShaderGUI.FindProperty("_Damage_Texture", properties);
                MaterialProperty dmgPercent = ShaderGUI.FindProperty("_Damage_Percent", properties);
                MaterialProperty dmgGam = ShaderGUI.FindProperty("_Damage_Gamma", properties);
                MaterialProperty dmgRef = ShaderGUI.FindProperty("_Damage_Reflect", properties);
                MaterialProperty dmgColInt = ShaderGUI.FindProperty("_Damage_Color_Intensity", properties);
                MaterialProperty dmgCol = ShaderGUI.FindProperty("_Damage_Color", properties);
                MaterialProperty dmgColBld = ShaderGUI.FindProperty("_DAMAGE_COLOR_BLEND", properties);

                materialEditor.ShaderProperty(dmgColBld, "Damage Color Blend");
                materialEditor.ShaderProperty(dmgCol, "Damage Color");
                materialEditor.ShaderProperty(dmgTxt, "Damage Texture");
                materialEditor.ShaderProperty(dmgColInt, "Damage Color Intensity");
                materialEditor.ShaderProperty(dmgPercent, "Damage Percent");
                materialEditor.ShaderProperty(dmgGam, "Damage Gamma");
                materialEditor.ShaderProperty(dmgRef, "Damage Reflect");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS",ref checkDef,"_CheckDef",targetMat,style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, true, false, false, false, true, true, true, true, false, true);
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

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckStickers");
        checkStickers = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShade");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFlakes");
        checkFlakes = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Top_Sticker_Toggle");
        TopStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Bottom_Sticker_Toggle");
        BottomStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Left_Sticker_Toggle");
        LeftStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Right_Sticker_Toggle");
        RightStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Front_Sticker_Toggle");
        FrontStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Back_Sticker_Toggle");
        BackStickerTog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TwoColorFold");
        twoColorFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakeAFold");
        flakeAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakeBFold");
        flakeBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakeSpecFold");
        flakeSpecFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSecSpec");
        checkSecSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubemapFold");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDamage");
        checkDamage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ClearCoat");
        clearCoat = tempVar == 1 ? true : false;
    }
}

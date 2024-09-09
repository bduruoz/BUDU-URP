using UnityEngine;
using UnityEditor;
using budu;
using System;

public class BCarPaintEditor : ShaderGUI
{
    bool checkDef, checkBase, checkStickers, checkShade, checkFlakes, checkNormal, checkSpec, checkSecSpec, checkReflect, checkAO, checkDamage;
    bool checkTwoColors, shadeExtFold, flakeAFold, flakeBFold, cubemapFold, fresnelFold;
    bool aboutFold, TopStickerTog, BottomStickerTog, LeftStickerTog, RightStickerTog, FrontStickerTog, BackStickerTog;
    //bool checkTwoColors, checkFlakesTexture, checkSpec, checkReflect, checkRefFresnel, checkRefFrsInvert, checkShade, checkAO, checkDef, checkBaseSpec;
    //bool twoColFold, aboutFold, checkFlakes, flakesExtFold, checkNormal, flTxtFold, specExtFold, reflectFold, cubemapFold;
    //bool fresnelFold, refcheckFlakes, shadeFold, shadeExtFold, colcheckFlakes, checkBase;
    //int paintMethod;
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
        GUILayout.Space(28);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Base Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE COLOR", checkBase, style);
        targetMat.SetInt("_CheckBase", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            EditorGUILayout.BeginVertical();
            {
                style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));

                MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
                MaterialProperty baseNorm = ShaderGUI.FindProperty("_Base_Normal_Intensity", properties);
                MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness",properties);
                MaterialProperty emisCoef = ShaderGUI.FindProperty("_Color_Affect_Emissive", properties);


                materialEditor.ShaderProperty(bc, "Base Color");
                materialEditor.ShaderProperty(baseNorm, "Color Normal Strength");
                materialEditor.ShaderProperty(smoothness, "Smoothness");
                materialEditor.ShaderProperty(emisCoef, "Color Emissive");

                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
                style.fontSize = default;
                style.normal.textColor = default;
                EditorGUILayout.BeginVertical(style);
                {
                    MaterialProperty twoCol = ShaderGUI.FindProperty("_Two_Colors", properties);
                    materialEditor.ShaderProperty(twoCol, "Two Color");
                    if(twoCol.floatValue > 0f)
                    {
                        EditorGUI.indentLevel++;
                        MaterialProperty paintType = ShaderGUI.FindProperty("_PAINT_TYPE_SELECTOR", properties);
                        MaterialProperty secCol = ShaderGUI.FindProperty("_Second_Color", properties);

                        MaterialProperty cfi = ShaderGUI.FindProperty("_Color_Fresnel_Invert", properties);
                        MaterialProperty cfb = ShaderGUI.FindProperty("_Color_Fresnel_Bias", properties);
                        MaterialProperty cfs = ShaderGUI.FindProperty("_Color_Fresnel_Scale", properties);
                        MaterialProperty cfp = ShaderGUI.FindProperty("_Color_Fresnel_Power", properties);
                        MaterialProperty cgi = ShaderGUI.FindProperty("_Color_Y_Grad_Invert", properties);
                        MaterialProperty cgs = ShaderGUI.FindProperty("_Color_Y_Grad_Scale", properties);
                        MaterialProperty cgo = ShaderGUI.FindProperty("_Color_Y_Grad_Offset", properties);
                        MaterialProperty cfty = ShaderGUI.FindProperty("_Color_Fresnel_Gamma", properties);
                        MaterialProperty cgty = ShaderGUI.FindProperty("_Color_Y_Grad_Gamma", properties);

                        materialEditor.ShaderProperty(paintType, "Paint Method");
                        materialEditor.ColorProperty(secCol, "Second Color");

                        switch((int)paintType.floatValue)
                        {
                            #region Fresnel
                            case 0:
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(cfty, "Fresnel Gamma");
                                materialEditor.ShaderProperty(cfi, "Fresnel Invert");
                                materialEditor.ShaderProperty(cfb, "Fresnel Bias");
                                materialEditor.ShaderProperty(cfs, "Fresnel Scale");
                                materialEditor.ShaderProperty(cfp, "Fresnel Power");
                                EditorGUI.indentLevel--;
                                break;
                            #endregion
                            #region Gradient Y
                            case 1:
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(cgty, "Gradient Gamma");
                                materialEditor.ShaderProperty(cgi, "Gradient Invert");
                                EditorGUILayout.BeginHorizontal();
                                EditorGUIUtility.labelWidth = 170;
                                EditorGUIUtility.fieldWidth = 30;
                                materialEditor.ShaderProperty(cgs, "Gradient Scale");
                                materialEditor.ShaderProperty(cgo, "Gradient Offset");
                                EditorGUIUtility.labelWidth = 0;
                                EditorGUIUtility.fieldWidth = 0;
                                EditorGUILayout.EndHorizontal();
                                EditorGUI.indentLevel--;
                                break;
                            #endregion
                            #region Fresnel & Gradient Y
                            case 2:
                                EditorGUI.indentLevel++;
                                materialEditor.ShaderProperty(cfty, "Fresnel Gamma");
                                materialEditor.ShaderProperty(cfi, "Fresnel Invert");
                                materialEditor.ShaderProperty(cfb, "Fresnel Bias");
                                materialEditor.ShaderProperty(cfs, "Fresnel Scale");
                                materialEditor.ShaderProperty(cfp, "Fresnel Power");

                                materialEditor.ShaderProperty(cgty, "Gradient Gamma");
                                materialEditor.ShaderProperty(cgi, "Gradient Invert");
                                EditorGUILayout.BeginHorizontal();
                                EditorGUIUtility.labelWidth = 170;
                                EditorGUIUtility.fieldWidth = 30;
                                materialEditor.ShaderProperty(cgs, "Gradient Scale");
                                materialEditor.ShaderProperty(cgo, "Gradient Offset");
                                EditorGUIUtility.labelWidth = 0;
                                EditorGUIUtility.fieldWidth = 0;
                                EditorGUILayout.EndHorizontal();
                                EditorGUI.indentLevel--;
                                break;
                                #endregion
                        }

                        EditorGUI.indentLevel--;
                    }
                }
                EditorGUILayout.EndVertical();

            }
            EditorGUI.indentLevel--;
            GUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Stickers Settings

        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkStickers  = EditorGUILayout.ToggleLeft("STICKERS SETTINGS", checkStickers , style);
        targetMat.SetInt("_CheckStickers", Convert.ToInt16(checkStickers ));
        targetMat.SetInt("_Sticker_Toggle",Convert.ToInt16(checkStickers ));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if (checkStickers)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty stickersOpacity = ShaderGUI.FindProperty("_Sticker_Opacity",properties);
            MaterialProperty posPrec = ShaderGUI.FindProperty("_Position_Precision",properties);
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
            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(20));
            style.fontSize = 11;
            style.alignment = TextAnchor.MiddleLeft;
            style.normal.textColor = bdColors.NexusOrange(250);

            TopStickerTog = EditorGUILayout.ToggleLeft("TOP STICKER", TopStickerTog, style);
            targetMat.SetInt("_Top_Sticker_Toggle", Convert.ToInt16(TopStickerTog));

            if (TopStickerTog)
            {
                EditorGUI.indentLevel++;
                MaterialProperty topColor = ShaderGUI.FindProperty("_Top_Color", properties);
                MaterialProperty topSticker = ShaderGUI.FindProperty("_Top_Sticker",properties);
                MaterialProperty topSclX = ShaderGUI.FindProperty("_Top_Scale_X", properties);
                MaterialProperty topSclY = ShaderGUI.FindProperty("_Top_Scale_Z", properties);
                MaterialProperty topPosX = ShaderGUI.FindProperty("_Top_Pos_X", properties);
                MaterialProperty topPosY = ShaderGUI.FindProperty("_Top_Pos_Z", properties);
                MaterialProperty topRotate= ShaderGUI.FindProperty("_Top_Rotate", properties);
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
            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(20));
            style.fontSize = 11;
            style.alignment = TextAnchor.MiddleLeft;
            style.normal.textColor = bdColors.NexusOrange(250);

            BottomStickerTog = EditorGUILayout.ToggleLeft("BOTTOM STICKER", BottomStickerTog, style);
            targetMat.SetInt("_Bottom_Sticker_Toggle", Convert.ToInt16(BottomStickerTog));

            if(BottomStickerTog)
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
            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(20));
            style.fontSize = 11;
            style.alignment = TextAnchor.MiddleLeft;
            style.normal.textColor = bdColors.NexusOrange(250);

            LeftStickerTog = EditorGUILayout.ToggleLeft("LEFT STICKER", LeftStickerTog, style);
            targetMat.SetInt("_Left_Sticker_Toggle", Convert.ToInt16(LeftStickerTog));

            if(LeftStickerTog)
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

            if(RightStickerTog)
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

            if(FrontStickerTog)
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

            if(BackStickerTog)
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

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADING SETTINGS", checkShade, style);
        targetMat.SetInt("_CheckShading", Convert.ToInt16(checkShade));
        targetMat.SetInt("_Shading_Toggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty shInt = ShaderGUI.FindProperty("_Shading_Intensity", properties);
            MaterialProperty shCol = ShaderGUI.FindProperty("_Shade_Color", properties);
            MaterialProperty shCnt = ShaderGUI.FindProperty("_Shade_Contrast", properties);
            MaterialProperty shCntr = ShaderGUI.FindProperty("_Shading_Contribution", properties);
            MaterialProperty shOff = ShaderGUI.FindProperty("_Shading_Offset", properties);
            MaterialProperty shCnt2 = ShaderGUI.FindProperty("_Shading_Contrast", properties);

            materialEditor.ShaderProperty(shInt, "Shade Intensity");
            materialEditor.ShaderProperty(shCol, "Shade Color");
            materialEditor.ShaderProperty(shCnt, "Full Shade Contrast");
            materialEditor.ShaderProperty(shCntr, "Shading Contribution");
            materialEditor.ShaderProperty(shOff, "Shading Offset");
            materialEditor.ShaderProperty(shCnt2, "Shading Contrast");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "! Shade Extra Controls !", toggleOnLabelClick: true);
            targetMat.SetInt("_ShadeExtFold", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty shdSaturate = ShaderGUI.FindProperty("_Shading_Saturate", properties);
                MaterialProperty shBaCS = ShaderGUI.FindProperty("_Base_Sharpness", properties);
                MaterialProperty shBaCO = ShaderGUI.FindProperty("_Base_Offset", properties);

                materialEditor.ShaderProperty(shdSaturate, "Shade Saturate");
                materialEditor.ShaderProperty(shBaCS, "Shade Base Sharpness");
                materialEditor.ShaderProperty(shBaCO, "Shade Base Offset");

                EditorGUILayout.Space(1);

                MaterialProperty bmInt = ShaderGUI.FindProperty("_Base_Map_Intensity", properties);
                MaterialProperty shdAffBsTxt = ShaderGUI.FindProperty("_Shading_Affect_Base_Texture", properties);
                MaterialProperty shdNormStr = ShaderGUI.FindProperty("_Shading_Normal_Strength", properties);
                MaterialProperty shdColTxt = ShaderGUI.FindProperty("_Shading_Colored_Texture", properties);
                MaterialProperty txtOverCol = ShaderGUI.FindProperty("_Texture_Over_Color",properties);

                materialEditor.ShaderProperty(bmInt, "Base Map Intensity");
                materialEditor.ShaderProperty(shdAffBsTxt, "Shading Affect Base Texture");
                materialEditor.ShaderProperty(shdNormStr, "Shading Normal Strength");
                materialEditor.ShaderProperty(shdColTxt, "Shading Colored Texture");
                materialEditor.ShaderProperty(txtOverCol, "Texture Over Color");

                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Flakes Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkFlakes = EditorGUILayout.ToggleLeft("FLAKES SETTINGS", checkFlakes, style);
        targetMat.SetInt("_CheckFlakes", Convert.ToInt16(checkFlakes));
        targetMat.SetInt("_Specular_Flakes", Convert.ToInt16(checkFlakes));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkFlakes)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty flTxt = ShaderGUI.FindProperty("_Flakes_Texture", properties);
            MaterialProperty flGamma = ShaderGUI.FindProperty("_Flakes_Gamma_Strength", properties);
            MaterialProperty flSpInt = ShaderGUI.FindProperty("_Flakes_Specular_Intensity", properties);
            MaterialProperty flCrvSt = ShaderGUI.FindProperty("_FLAKES_CURVE_STEPS", properties);

            materialEditor.ShaderProperty(flTxt, "Flakes Texture");
            materialEditor.ShaderProperty(flGamma, "Flakes Gamma");
            materialEditor.ShaderProperty(flSpInt, "Flakes Intensity");
            materialEditor.ShaderProperty(flCrvSt, "Flakes Curve Steps");


            #region Flake A Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            flakeAFold = EditorGUILayout.Foldout(flakeAFold, "Flakes A Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_FlakeAFold",Convert.ToInt16(flakeAFold));
            if(flakeAFold)
            {
                EditorGUI.indentLevel++;

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

                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Flake B Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            flakeBFold = EditorGUILayout.Foldout(flakeBFold, "Flakes B Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_FlakeBFold", Convert.ToInt16(flakeBFold));
            if(flakeBFold)
            {
                EditorGUI.indentLevel++;
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
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNormal, style);
        targetMat.SetInt("_CheckNormal", Convert.ToInt16(checkNormal));
        targetMat.SetInt("_Normal_Toggle", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;

            MaterialProperty flnTxt = ShaderGUI.FindProperty("_Normal_Map", properties);
            MaterialProperty FlNormStrength = ShaderGUI.FindProperty("_Normal_Strength", properties);
            MaterialProperty FlNormMultiplier = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

            materialEditor.ShaderProperty(flnTxt, "Normal Map");
            materialEditor.RangeProperty(FlNormStrength, "Normal Strength");
            materialEditor.RangeProperty(FlNormMultiplier, "Normal Multiplier");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Base Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("BASE SPECULAR", checkSpec, style);
        targetMat.SetInt("_CheckSpec", Convert.ToInt16(checkSpec));
        targetMat.SetInt("_Base_Spec_Toggle", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty specCol = ShaderGUI.FindProperty("_Base_Spec_Color", properties);
            MaterialProperty specInt = ShaderGUI.FindProperty("_Base_Spec_Intensity", properties);

            MaterialProperty smoothness = ShaderGUI.FindProperty("_Smoothness", properties);
            MaterialProperty coatMask = ShaderGUI.FindProperty("_Coat_Mask", properties);
            MaterialProperty coatSmoothness = ShaderGUI.FindProperty("_Coat_Smoothness", properties);

            materialEditor.ShaderProperty(specCol, "Base Specular Color");
            materialEditor.ShaderProperty(specInt, "Base Specular Intensity");
            materialEditor.ShaderProperty(smoothness, "Smoothness");
            materialEditor.ShaderProperty(coatMask, "Coat Mask");
            materialEditor.ShaderProperty(coatSmoothness, "Coat Smoothness");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Second Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSecSpec = EditorGUILayout.ToggleLeft("SECOND SPECULAR", checkSecSpec, style);
        targetMat.SetInt("_CheckSecSpec", Convert.ToInt16(checkSecSpec));
        targetMat.SetInt("_Second_Spec_Toggle", Convert.ToInt16(checkSecSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSecSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);

            MaterialProperty secSpInt = ShaderGUI.FindProperty("_Second_Spec_Intensity", properties);
            MaterialProperty secSpCol = ShaderGUI.FindProperty("_Second_Spec_Color", properties);
            MaterialProperty spGamma = ShaderGUI.FindProperty("_Light_Gamma", properties);
            MaterialProperty secSpGlossy = ShaderGUI.FindProperty("_Glossy", properties);
            MaterialProperty secSpSoft = ShaderGUI.FindProperty("_Softness", properties);
            MaterialProperty secSpSat = ShaderGUI.FindProperty("_Second_Spec_Saturation", properties);
            MaterialProperty secSpIn = ShaderGUI.FindProperty("_Specular_In", properties);
            MaterialProperty secSpOut = ShaderGUI.FindProperty("_Specular_Out", properties);
            MaterialProperty secSpNrmStr = ShaderGUI.FindProperty("_Specular_Normal_Strength", properties);

            materialEditor.ShaderProperty(secSpInt, "Specular Intensity");
            materialEditor.ShaderProperty(secSpCol, "Specular Color");
            materialEditor.ShaderProperty(spGamma, "Specular Gamma Setting");
            materialEditor.ShaderProperty(secSpGlossy, "Specular Glossy");
            materialEditor.ShaderProperty(secSpSoft, "Specular Softness");
            materialEditor.ShaderProperty(secSpSat, "Specular Saturate");
            materialEditor.ShaderProperty(secSpIn, "Specular In");
            materialEditor.ShaderProperty(secSpOut, "Specular Out");
            materialEditor.ShaderProperty(secSpNrmStr, "Specular Normal Strength");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Reflection Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkReflect = EditorGUILayout.ToggleLeft("REFLECT SETTINGS", checkReflect, style);
        targetMat.SetInt("_CheckReflect", Convert.ToInt16(checkReflect));
        targetMat.SetInt("_Reflection_Toggle", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUILayout.Space(2);

            EditorGUI.indentLevel++;
            MaterialProperty rfStr = ShaderGUI.FindProperty("_Reflection_Strength", properties);
            MaterialProperty rfMult = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
            MaterialProperty rfCol = ShaderGUI.FindProperty("_Reflection_Color", properties);
            MaterialProperty rfCbMp = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
            MaterialProperty rfNrStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
            MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shadow", properties);
            MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shadow_Strength", properties);

            materialEditor.ShaderProperty(rfStr, "Strength");
            materialEditor.ShaderProperty(rfMult, "Multiplier");
            materialEditor.ShaderProperty(rfCol, "Color");
            materialEditor.ShaderProperty(rfCbMp, "Cubemap");
            materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");
            if(rfAffShd.floatValue > 0.0f)
            {
                materialEditor.ShaderProperty(rfShdStr, "Shadow Strength");
            }
            materialEditor.ShaderProperty(rfNrStr, "Normal Strength");

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubemapFold", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty cmr = ShaderGUI.FindProperty("_Cubemap_Rotate", properties);
                MaterialProperty cmx = ShaderGUI.FindProperty("_Cubemap_X_Position", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_Cubemap_Y_Position", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_Cubemap_Z_Position", properties);

                materialEditor.ShaderProperty(cmr, "Cubemap Rotate");
                materialEditor.ShaderProperty(cmx, "Cubemap X Position");
                materialEditor.ShaderProperty(cmy, "Cubemap Y Position");
                materialEditor.ShaderProperty(cmz, "Cubemap Z Position");

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
            targetMat.SetInt("_Ref_Fresnel_Toggle", Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty refFresInv = ShaderGUI.FindProperty("_Ref_Fresnel_Invert",properties);
                MaterialProperty refFresGam = ShaderGUI.FindProperty("_Reflect_Fresnel_Gamma", properties);
                MaterialProperty refFresBias = ShaderGUI.FindProperty("_Ref_Fresnel_Bias", properties);
                MaterialProperty refFresScale = ShaderGUI.FindProperty("_Ref_Fresnel_Scale", properties);
                MaterialProperty refFresPower = ShaderGUI.FindProperty("_Ref_Fresnel_Power", properties);

                materialEditor.ShaderProperty(refFresInv, "Fresnel Invert");
                materialEditor.ShaderProperty(refFresGam, "Fresnel Gamma");
                materialEditor.ShaderProperty(refFresBias, "Fresnel Bias");
                materialEditor.ShaderProperty(refFresScale, "Fresnel Scale");
                materialEditor.ShaderProperty(refFresPower, "Fresnel Power");

                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkAO = EditorGUILayout.ToggleLeft("AMBIENT OCCLUSION", checkAO, style);
        targetMat.SetInt("_CheckAO", Convert.ToInt16(checkAO));
        targetMat.SetInt("_AO_Toggle", Convert.ToInt16(checkAO));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            MaterialProperty aoTexture = ShaderGUI.FindProperty("_AO_Map",properties);
            MaterialProperty aoIntensity = ShaderGUI.FindProperty("_AO_Intensity", properties);
            MaterialProperty aoColor = ShaderGUI.FindProperty("_AO_Color", properties);
            MaterialProperty aoCont = ShaderGUI.FindProperty("_AO_Gamma_Settings", properties);

            materialEditor.ShaderProperty(aoTexture, "AO Texture");
            materialEditor.ShaderProperty(aoIntensity, "AO Intensity");
            materialEditor.ShaderProperty(aoColor, "AO Color");
            materialEditor.ShaderProperty(aoCont, "AO Gamma Setting");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Damage Settings

        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkDamage = EditorGUILayout.ToggleLeft("DAMAGE SETTINGS", checkDamage, style);
        targetMat.SetInt("_CheckDamage", Convert.ToInt16(checkDamage));
        targetMat.SetInt("_Damage_Toggle", Convert.ToInt16(checkDamage));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDamage)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

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

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
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

            #region Cast Shadows
            MaterialProperty castShadows = ShaderGUI.FindProperty("_Cast_Shadows", properties);
            materialEditor.ShaderProperty(castShadows, "Cast Shadows");
            targetMat.SetInt("_CastShadow", Convert.ToInt16((int)castShadows.floatValue));
            targetMat.SetShaderPassEnabled("SHADOWCASTER", Convert.ToInt16((int)castShadows.floatValue) == 1 ? true : false);
            #endregion

            #region Receive Shadows
            MaterialProperty receiveShadow = ShaderGUI.FindProperty("_Receive_Shadows", properties);
            materialEditor.ShaderProperty(receiveShadow, "Receive Shadows");
            targetMat.SetInt("_ReceiveShadow", Convert.ToInt16((int)receiveShadow.floatValue));
            if(receiveShadow.floatValue < 1f)
            {
                targetMat.EnableKeyword(keyword: "_RECEIVE_SHADOWS_OFF");
            }
            else
            {
                targetMat.DisableKeyword(keyword: "_RECEIVE_SHADOWS_OFF");
            }
            #endregion

            //materialEditor.RenderQueueField();
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
        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckStickers");
        checkStickers = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShading");
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

        tempVar = targetMat.GetInt("_FlakeAFold");
        flakeAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlakeBFold");
        flakeBFold = tempVar == 1 ? true : false;

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

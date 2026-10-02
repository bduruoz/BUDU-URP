// © BUDU Games 2024 - 2026
// BUDU Car Paint Shader Editor

using budu;
using System;
using UnityEditor;
using UnityEngine;

public class BCarPaintEditor : ShaderGUI
{
    bool checkDef, checkBase, checkStickers, checkShade, checkFlakes, checkNormal, checkSpec, checkSecSpec, checkReflect, checkAO, checkDamage, clearCoat;
    bool blinnFold, flakeAFold, flakeBFold, cubemapFold, fresnelFold, flakeSpecFold, twoColorFold, refMaskFold; //Required by inspector 
    bool aboutFold, TopStickerTog, BottomStickerTog, LeftStickerTog, RightStickerTog, FrontStickerTog, BackStickerTog;
    int blendingMode, workflowMode, isSpecular;
    
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

                MaterialProperty custxt = ShaderGUI.FindProperty("_Custom_Texture", properties);
                materialEditor.ShaderProperty(custxt, "Custom Texture");
                if (custxt.floatValue > 0.1f)
                {
                    GUIExtras.BaseSettingsGUI(materialEditor, properties);
                }
                else
                {
                    MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
                    materialEditor.ShaderProperty(bc, "Base Color");
                }
                MaterialProperty emisCoef = ShaderGUI.FindProperty("_Color_Affect_Emissive", properties);
                materialEditor.ShaderProperty(emisCoef, "Color Emissive");

                GUIExtras.TwoColorSettingsGUI(materialEditor, properties, targetMat);
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

            GUIExtras.SColoredVertical(BDColors.NexusOrange(50),20,true,() =>
            {
                materialEditor.ShaderProperty(stickers, "Stickers");
            });

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

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;
            GUIExtras.NormalSettingsGUI(materialEditor, properties);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(1);
        #endregion

        #region Shade Settings
        GUIExtras.SHeader("SHADING SETTINGS", ref checkShade, "_CheckShade", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.ShadeColorSettingsGUI(materialEditor, properties, targetMat, nrmTog);
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

            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(Flakes, "Flakes");
            });
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
                GUIExtras.SFoldout(targetMat, "_FlakeAFold", "Flakes A Settings", BDColors.DarkRed(120), 10, BDColors.White(255), BDColors.Black(40), true, () =>
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
                GUIExtras.SFoldout(targetMat, "_FlakeBFold", "Flakes B Settings", BDColors.DarkRed(180), 10, BDColors.White(255), BDColors.Black(40), true, () =>
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
                GUIExtras.SFoldout(targetMat, "_FlakeSpecFold", "Flakes Specular Settings", BDColors.DarkRed(220), 10, BDColors.White(255), BDColors.Black(40), true, () =>
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

        #region Base Specular Settings
        GUIExtras.SHeader("SPECULAR | METALLIC SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty Spec = ShaderGUI.FindProperty("_Base_Spec_Toggle",properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(Spec, "Base Specular");
            });
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
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.SpecularSettingsGUI(materialEditor, properties, targetMat, nrmTog);
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
            bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
            GUIExtras.ReflectionSettingsGUI(materialEditor, properties, targetMat, nrmTog);
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
            GUIExtras.SColoredVertical(BDColors.NexusBlue(50), 20, true,() =>
            {
                materialEditor.ShaderProperty(AO, "Ambient Occlusion");
            });
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
            GUIExtras.SColoredVertical(BDColors.NexusBlue(50), 20, true, () =>
            {
                materialEditor.ShaderProperty(Damg, "Damage Map Feature");
            });
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
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        checkDef = GUIExtras.GetBool(targetMat, "_CheckDef");
        checkBase = GUIExtras.GetBool(targetMat, "_CheckBase");
        checkStickers = GUIExtras.GetBool(targetMat, "_CheckStickers");
        checkShade = GUIExtras.GetBool(targetMat, "_CheckShade");
        checkFlakes = GUIExtras.GetBool(targetMat, "_CheckFlakes");

        TopStickerTog = GUIExtras.GetBool(targetMat, "_Top_Sticker_Toggle");
        BottomStickerTog = GUIExtras.GetBool(targetMat, "_Bottom_Sticker_Toggle");
        LeftStickerTog = GUIExtras.GetBool(targetMat, "_Left_Sticker_Toggle");
        RightStickerTog = GUIExtras.GetBool(targetMat, "_Right_Sticker_Toggle");
        FrontStickerTog = GUIExtras.GetBool(targetMat, "_Front_Sticker_Toggle");
        BackStickerTog = GUIExtras.GetBool(targetMat, "_Back_Sticker_Toggle");

        twoColorFold = GUIExtras.GetBool(targetMat, "_TwoColorFold");
        flakeAFold = GUIExtras.GetBool(targetMat, "_FlakeAFold");
        flakeBFold = GUIExtras.GetBool(targetMat, "_FlakeBFold");
        flakeSpecFold = GUIExtras.GetBool(targetMat, "_FlakeSpecFold");

        checkNormal = GUIExtras.GetBool(targetMat, "_CheckNormal");
        checkSpec = GUIExtras.GetBool(targetMat, "_CheckSpec");
        checkSecSpec = GUIExtras.GetBool(targetMat, "_CheckSecSpec");
        checkReflect = GUIExtras.GetBool(targetMat, "_CheckReflect");
        blinnFold = GUIExtras.GetBool(targetMat, "_blinnFold");

        cubemapFold = GUIExtras.GetBool(targetMat, "_CubemapFold");
        fresnelFold = GUIExtras.GetBool(targetMat, "_FresnelFold");
        refMaskFold = GUIExtras.GetBool(targetMat, "_RefMaskFold");

        checkAO = GUIExtras.GetBool(targetMat, "_CheckAO");
        checkDamage = GUIExtras.GetBool(targetMat, "_CheckDamage");
        clearCoat = GUIExtras.GetBool(targetMat, "_ClearCoat");
    }
}

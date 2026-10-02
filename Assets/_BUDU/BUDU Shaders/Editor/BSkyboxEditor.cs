// © BUDU Games 2024 - 2026
// BUDU Skybox Shader Editor

using UnityEngine;
using UnityEditor;
using System;
using budu;

[ExecuteInEditMode]
public class BSkyboxEditor : ShaderGUI
{
    bool CheckGrad, CheckCubeMap, rotationFold, positionFold, CheckHaze, CheckFog, customFogColor, aboutFold, CheckBase, CheckDef;
    int tempVar, blendingMode;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMatVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Skybox Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDUSkyboxTitle.png", typeof(Texture));

        GUILayout.BeginArea(new Rect(0, 0, 512, 32));
        {
            EditorGUILayout.BeginHorizontal();
            {
                GUI.backgroundColor = BDColors.Transparent(0);
                GUILayout.Box(banner, GUILayout.MinHeight(32));
            }
            EditorGUILayout.EndHorizontal();
        }
        GUILayout.EndArea();
        GUILayout.Space(28);
        GUI.backgroundColor = BDColors.White();
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref CheckBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(CheckBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty solidBaseColor = ShaderGUI.FindProperty("_Base_Color", properties);
            materialEditor.ColorProperty(solidBaseColor, "Base Solid Color");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Gradient Settings
        GUIExtras.SHeader("GRADIENT", ref CheckGrad, "_CheckGradient", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(CheckGrad)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty grTog = ShaderGUI.FindProperty("_Gradient_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(grTog, "Gradient");
            });
            if(grTog.floatValue > 0.0f)
            {
                MaterialProperty gradInt = ShaderGUI.FindProperty("_Gradient_Intensity", properties);
                MaterialProperty grTopCol = ShaderGUI.FindProperty("_Top_Color", properties);
                MaterialProperty grBotCol = ShaderGUI.FindProperty("_Bottom_Color", properties);
                MaterialProperty gradPos = ShaderGUI.FindProperty("_Gradient_Position", properties);
                MaterialProperty power = ShaderGUI.FindProperty("_Power", properties);
                MaterialProperty Contrast = ShaderGUI.FindProperty("_Contrast", properties);

                materialEditor.ShaderProperty(gradInt, "Intensity");
                materialEditor.ShaderProperty(grTopCol, "Top Color");
                materialEditor.ShaderProperty(grBotCol, "Bottom Color");
                materialEditor.ShaderProperty(gradPos, "Position");
                materialEditor.ShaderProperty(power, "Power");
                materialEditor.ShaderProperty(Contrast, "Contrast");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Haze Settings
        GUIExtras.SHeader("HAZE SETTINGS", ref CheckHaze, "_CheckHaze", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(CheckHaze)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty hazeTog = ShaderGUI.FindProperty("_Haze_Toggle",properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(hazeTog, "Haze");
            });
            if(hazeTog.floatValue > 0.0f)
            {
                MaterialProperty hazeInten = ShaderGUI.FindProperty("_Haze_Intensity", properties);
                MaterialProperty hazeCol = ShaderGUI.FindProperty("_Haze_Color", properties);
                MaterialProperty hazeHeight = ShaderGUI.FindProperty("_Haze_Height", properties);
                MaterialProperty hazePosition = ShaderGUI.FindProperty("_Haze_Position", properties);
                MaterialProperty hazeSmooth = ShaderGUI.FindProperty("_Haze_Smooth", properties);
                MaterialProperty hazeFill = ShaderGUI.FindProperty("_Haze_Fill", properties);

                materialEditor.ShaderProperty(hazeInten, "Haze Intensity");
                materialEditor.ShaderProperty(hazeCol, "Haze Color");
                materialEditor.ShaderProperty(hazeHeight, "Haze Height");
                materialEditor.ShaderProperty(hazePosition, "Haze Position");
                materialEditor.ShaderProperty(hazeSmooth, "Haze Smooth");
                materialEditor.ShaderProperty(hazeFill, "Haze Fill");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fog Settings
        GUIExtras.SHeader("FOG SETTINGS", ref CheckFog, "_CheckFog", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(CheckFog)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty fogTog = ShaderGUI.FindProperty("_Fog_Toggle",properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(fogTog, "Fog");
            });

            if(fogTog.floatValue > 0.0f)
            {
                MaterialProperty fogInten = ShaderGUI.FindProperty("_Fog_Intensity", properties);
                MaterialProperty customCol = ShaderGUI.FindProperty("_Custom_Fog_Color", properties);
                MaterialProperty fogPosition = ShaderGUI.FindProperty("_Fog_Position", properties);
                MaterialProperty fogHeight = ShaderGUI.FindProperty("_Fog_Height", properties);
                MaterialProperty fogSmooth = ShaderGUI.FindProperty("_Fog_Smooth", properties);
                MaterialProperty fogFill = ShaderGUI.FindProperty("_Fog_Fill", properties);

                materialEditor.ShaderProperty(fogInten, "Fog Intensity");
                materialEditor.ShaderProperty(customCol, "Custom Fog Color");
                if (customCol.floatValue > 0f)
                {
                    MaterialProperty fogCol = ShaderGUI.FindProperty("_Fog_Color", properties);
                    materialEditor.ColorProperty(fogCol, "Fog Color");
                }
                materialEditor.ShaderProperty(fogPosition, "Fog Position");
                materialEditor.ShaderProperty(fogHeight, "Fog Height");
                materialEditor.ShaderProperty(fogSmooth, "Fog Smooth");
                materialEditor.ShaderProperty(fogFill, "Fog Fill");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Cubemap Settings
        GUIExtras.SHeader("CUBEMAP SETTINGS", ref CheckCubeMap, "_CheckCubeMap", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(CheckCubeMap)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty cubemaptog = ShaderGUI.FindProperty("_Cubemap_Toggle",properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(cubemaptog, "Cubemap");
            });
            if(cubemaptog.floatValue > 0)
            {
                MaterialProperty cmblendMethod = ShaderGUI.FindProperty("_BLEND_METHOD", properties);
                MaterialProperty cmTint = ShaderGUI.FindProperty("_Cubemap_Tint_Color", properties);
                MaterialProperty cmInt = ShaderGUI.FindProperty("_Cubemap_Intensity", properties);
                MaterialProperty cmexpo = ShaderGUI.FindProperty("_Cubemap_Exposure", properties);
                MaterialProperty cmTxt = ShaderGUI.FindProperty("_Cubemap", properties);
                MaterialProperty layeredCM = ShaderGUI.FindProperty("_Blended_Cubemaps", properties);
                MaterialProperty cmTxtLOD = ShaderGUI.FindProperty("_LOD", properties);

                materialEditor.ShaderProperty(cmblendMethod, "Blend Method");
                materialEditor.ShaderProperty(cmInt, "Cubemap Intensity");
                materialEditor.ShaderProperty(cmexpo, "Cubemap Exposure");
                materialEditor.ShaderProperty(cmTint, "Tint Color");
                materialEditor.ShaderProperty(layeredCM, "Layered Cubemap");

                materialEditor.ShaderProperty(cmTxt, "Cubemap");
                materialEditor.ShaderProperty(cmTxtLOD, "LOD");
                if (layeredCM.floatValue > 0f)
                {
                    MaterialProperty cmTxt2 = ShaderGUI.FindProperty("_Cubemap_Layer", properties);
                    MaterialProperty cmblend = ShaderGUI.FindProperty("_Cubemap_Blend", properties);
                    materialEditor.ShaderProperty(cmTxt2, "Cubemap Layer");
                    materialEditor.ShaderProperty(cmblend, "Cubemap Blend");
                }

                rotationFold = EditorGUILayout.Foldout(rotationFold, "Rotation", toggleOnLabelClick: true);
                targetMat.SetInt("_rotationFold", Convert.ToInt16(rotationFold));

                if (rotationFold)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty cmRot = ShaderGUI.FindProperty("_Rotation", properties);
                    MaterialProperty cmRotTog = ShaderGUI.FindProperty("_Rotator", properties);

                    materialEditor.ShaderProperty(cmRot, "Rotation");
                    materialEditor.ShaderProperty(cmRotTog, "Rotator");
                    if (cmRotTog.floatValue > 0f)
                    {
                        MaterialProperty cmRotSpd = ShaderGUI.FindProperty("_RotationSpeed", properties);
                        materialEditor.ShaderProperty(cmRotSpd, "Rotate Speed");
                    }
                    EditorGUI.indentLevel--;
                }

                positionFold = EditorGUILayout.Foldout(positionFold, "Position", toggleOnLabelClick: true);
                targetMat.SetInt("_positionFold", Convert.ToInt16(positionFold));

                if (positionFold)
                {
                    EditorGUI.indentLevel++;
                    MaterialProperty cmPosX = ShaderGUI.FindProperty("_Position_X", properties);
                    MaterialProperty cmPosY = ShaderGUI.FindProperty("_Position_Y", properties);
                    MaterialProperty cmPosZ = ShaderGUI.FindProperty("_Position_Z", properties);
                    EditorGUILayout.BeginHorizontal();
                    EditorGUIUtility.labelWidth = 80;
                    EditorGUIUtility.fieldWidth = 20;
                    materialEditor.ShaderProperty(cmPosX, "Pos X");
                    materialEditor.ShaderProperty(cmPosY, "Pos Y");
                    materialEditor.ShaderProperty(cmPosZ, "Pos Z");
                    EditorGUILayout.EndHorizontal();
                    EditorGUI.indentLevel--;
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref CheckDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(
            materialEditor, 
            properties, 
            targetMat, 
            ref CheckDef, 
            ref blendingMode, 
            style, 
            false, 
            false, 
            false, 
            false, 
            false, 
            false, 
            false, 
            false, 
            false, 
            false);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion

    }

    void loadMatVariables(Material targetMat)
    {
        targetMat.renderQueue = 1000; //

        tempVar = targetMat.GetInt("_CheckBase");
        CheckBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        CheckDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckGradient");
        CheckGrad = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCubeMap");
        CheckCubeMap = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckHaze");
        CheckHaze = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFog");
        CheckFog = tempVar == 1 ? true : false;

        blendingMode = targetMat.GetInt("_Blending_Mode");
    }
}

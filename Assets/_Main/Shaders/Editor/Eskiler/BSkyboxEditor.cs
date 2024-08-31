using UnityEngine;
using UnityEditor;
using System;
using budu;

[ExecuteInEditMode]
public class BSkyboxEditor : ShaderGUI
{
    bool gradientFold, cubeMapFold, rotationFold, positionFold, hazeFold, fogFold, customFogColor, aboutFold, checkBase, checkDef;
    bool Additive, blendSky;
    int tempVar;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMatVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Skybox Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUSkyboxTitle.png", typeof(Texture));

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
        GUI.backgroundColor = bdColors.White();
        #endregion

        #region Base Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS", checkBase, style);
        targetMat.SetInt("_CheckBase", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            Additive = EditorGUILayout.Toggle("Additive", Additive);
            targetMat.SetInt("_AdditiveGradient", Convert.ToInt16(Additive));

            MaterialProperty solidBaseColor = ShaderGUI.FindProperty("_BaseColor", properties);
            materialEditor.ColorProperty(solidBaseColor, "Base Solid Color");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Gradient Group
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        gradientFold = EditorGUILayout.ToggleLeft("GRADIENT", gradientFold, style);
        targetMat.SetInt("_Gradient", Convert.ToInt16(gradientFold));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(gradientFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
        
            MaterialProperty topc = ShaderGUI.FindProperty("_TopColor", properties);
            MaterialProperty botc = ShaderGUI.FindProperty("_BottomColor", properties);
            MaterialProperty HorH = ShaderGUI.FindProperty("_HorizonHeight", properties);
            MaterialProperty Power = ShaderGUI.FindProperty("_Power", properties);
            MaterialProperty Falloff = ShaderGUI.FindProperty("_Falloff", properties);

            materialEditor.ColorProperty(topc, "Top Color");
            materialEditor.ColorProperty(botc, "Bottom Color");
            materialEditor.RangeProperty(HorH, "Horizontal Height");
            materialEditor.RangeProperty(Power, "Power");
            materialEditor.RangeProperty(Falloff, "Falloff");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Cubemap Sky
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        cubeMapFold = EditorGUILayout.ToggleLeft("CUBEMAP", cubeMapFold,style);
        targetMat.SetInt("_CubemapSky", Convert.ToInt16(cubeMapFold));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(cubeMapFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty cmTint = ShaderGUI.FindProperty("_TintColor", properties);
            MaterialProperty cmTxt = ShaderGUI.FindProperty("_Tex", properties);
            MaterialProperty cmTxt2 = ShaderGUI.FindProperty("_Tex1", properties);
            MaterialProperty cmblend = ShaderGUI.FindProperty("_CubemapTransition", properties);
            MaterialProperty cmexpo = ShaderGUI.FindProperty("_Exposure", properties);
            MaterialProperty cmRot = ShaderGUI.FindProperty("_Rotation", properties);
            MaterialProperty cmRotSpd = ShaderGUI.FindProperty("_RotationSpeed", properties);

            MaterialProperty cmPosX = ShaderGUI.FindProperty("_PositionX", properties);
            MaterialProperty cmPosY = ShaderGUI.FindProperty("_PositionY", properties);
            MaterialProperty cmPosZ = ShaderGUI.FindProperty("_PositionZ", properties);

            materialEditor.ColorProperty(cmTint, "Tint Color");
            materialEditor.RangeProperty(cmexpo, "Cubemap Exposure");
            materialEditor.TextureProperty(cmTxt, "Cubemap");
            blendSky = EditorGUILayout.Toggle("Layered Cubemap", blendSky);
            targetMat.SetInt("_BlendSky", Convert.ToInt16(blendSky));
            if(blendSky)
            {
                EditorGUI.indentLevel++;
                materialEditor.RangeProperty(cmblend, "Cubemap Blend");
                materialEditor.TextureProperty(cmTxt2, "Cubemap Layer");
                EditorGUI.indentLevel--;
            }
            positionFold = EditorGUILayout.Toggle("Position", positionFold);
            targetMat.SetInt("_EnablePosition", Convert.ToInt16(positionFold));
            if(positionFold)
            {
                EditorGUI.indentLevel++;
                materialEditor.FloatProperty(cmPosX, "Position X");
                materialEditor.FloatProperty(cmPosY, "Position Y");
                materialEditor.FloatProperty(cmPosZ, "Position Z");
                EditorGUI.indentLevel--;
            }

            rotationFold = EditorGUILayout.Toggle("Rotation", rotationFold);
            targetMat.SetInt("_EnableRotation", Convert.ToInt16(rotationFold));
            if(rotationFold)
            {
                EditorGUI.indentLevel++;
                materialEditor.RangeProperty(cmRot, "Rotate");
                materialEditor.FloatProperty(cmRotSpd, "Rotation Speed");
                EditorGUI.indentLevel--;
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Haze Group
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        hazeFold = EditorGUILayout.ToggleLeft("HAZE", hazeFold, style);
        targetMat.SetInt("_EnableHaze", Convert.ToInt16(hazeFold));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(hazeFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty hazeCol = ShaderGUI.FindProperty("_HazeColor", properties);
            MaterialProperty hazeInten = ShaderGUI.FindProperty("_HazeIntensity", properties);
            MaterialProperty hazeFill = ShaderGUI.FindProperty("_HazeFill", properties);
            MaterialProperty hazeSmooth = ShaderGUI.FindProperty("_HazeSmoothness", properties);
            MaterialProperty hazeHeight = ShaderGUI.FindProperty("_HazeHeight", properties);
            MaterialProperty hazePosY = ShaderGUI.FindProperty("_HazePosition", properties);

            materialEditor.ColorProperty(hazeCol, "Haze Color");
            materialEditor.RangeProperty(hazeInten, "Haze Intensity");
            materialEditor.RangeProperty(hazeFill, "Haze Fill");
            materialEditor.RangeProperty(hazeSmooth, "Haze Smoothness");
            materialEditor.RangeProperty(hazeHeight, "Haze Height");
            materialEditor.FloatProperty(hazePosY, "Haze Position Vertical");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fog Group
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        fogFold = EditorGUILayout.ToggleLeft("FOG", fogFold, style);
        targetMat.SetInt("_EnableFog", Convert.ToInt16(fogFold));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(fogFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty fogCol = ShaderGUI.FindProperty("_FogColor", properties);
            MaterialProperty fogInten = ShaderGUI.FindProperty("_FogIntensity", properties);
            MaterialProperty fogFill = ShaderGUI.FindProperty("_FogFill", properties);
            MaterialProperty fogSmooth = ShaderGUI.FindProperty("_FogSmoothness", properties);
            MaterialProperty fogHeight = ShaderGUI.FindProperty("_FogHeight", properties);
            MaterialProperty fogPosY = ShaderGUI.FindProperty("_FogPosition", properties);

            customFogColor = EditorGUILayout.Toggle("Custom Fog Color", customFogColor);
            targetMat.SetInt("_CustomFogColor", 1);
            if(customFogColor)
            {
                materialEditor.ColorProperty(fogCol, "Fog Color");
            }
            materialEditor.RangeProperty(fogInten, "Fog Intensity");
            materialEditor.RangeProperty(fogFill, "Fog Fill");
            materialEditor.RangeProperty(fogSmooth, "Fog Smoothness");
            materialEditor.RangeProperty(fogHeight, "Fog Height");
            materialEditor.FloatProperty(fogPosY, "Fog Position Vertical");
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
        EditorGUILayout.Space(5);
        GUI.backgroundColor = bdColors.Transparent(0);
        style.normal.textColor = bdColors.NexusOrange();
        style.normal.textColor *= new Color(1, 1, 1, 0.6f);
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

    void loadMatVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Gradient");
        gradientFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubemapSky");
        cubeMapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_EnableRotation");
        rotationFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_EnableHaze");
        hazeFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_EnableFog");
        fogFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CustomFogColor");
        customFogColor = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_BlendSky");
        blendSky = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AdditiveGradient");
        Additive = tempVar == 1 ? true : false;
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

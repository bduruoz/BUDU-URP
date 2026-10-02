// © BUDU Games 2024 - 2026
// BUDU Ivy Shader Editor

using UnityEngine;
using UnityEditor;
using budu;

public class BIvyEditor : ShaderGUI
{
    bool checkEmis, checkBase, checkDef, checkNormal, checkSpec, checkWind, checkAA, checkAO;
    bool aboutFold, specExtFold;
    int tempVar, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUIvyTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty bsCol = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bsTxt = ShaderGUI.FindProperty("_Base_Texture", properties);
            MaterialProperty bsGmm = ShaderGUI.FindProperty("_Gamma", properties);

            materialEditor.ShaderProperty(bsCol, "Base Color");
            materialEditor.ShaderProperty(bsTxt, "Base Map");
            materialEditor.ShaderProperty(bsGmm, "Base Gamma");
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

            MaterialProperty norm = ShaderGUI.FindProperty("_Normal", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(norm, "Normal");
            });
            if(norm.floatValue > 0)
            {
                MaterialProperty normalMap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty normalStr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty normalMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);
                materialEditor.ShaderProperty(normalMap, "Normal Map");
                materialEditor.ShaderProperty(normalStr, "Normal Strength");
                materialEditor.ShaderProperty(normalMult, "Normal Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Emissive Settings
        GUIExtras.SHeader("EMISSIVE SETTINGS", ref checkEmis, "_CheckEmis", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkEmis)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty emis = ShaderGUI.FindProperty("_Emissive", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(emis, "Emission");
            });
            if(emis.floatValue > 0)
            {
                MaterialProperty emisInt = ShaderGUI.FindProperty("_Emissive_Intensity", properties);
                MaterialProperty emisCol = ShaderGUI.FindProperty("_Emission_Color", properties);
                MaterialProperty emisMult = ShaderGUI.FindProperty("_Emissive_Multiplier", properties);
                MaterialProperty emisCusMap = ShaderGUI.FindProperty("_Emissive_Custom_Texture", properties);

                materialEditor.ShaderProperty(emisInt, "Emission Intensity");
                materialEditor.ShaderProperty(emisCol, "Emission Color");
                materialEditor.ShaderProperty(emisMult, "Emission Multiplier");
                materialEditor.ShaderProperty(emisCusMap, "Emission Custom Texture");
                if ((int)targetMat.GetInt("_Emissive_Custom_Texture") == 1)
                {
                    MaterialProperty emisCusTxt = ShaderGUI.FindProperty("_Emissive_Texture", properties);
                    MaterialProperty emisInv = ShaderGUI.FindProperty("_Emissive_Invert", properties);
                    materialEditor.ShaderProperty(emisCusTxt, "Emission Texture");
                    materialEditor.ShaderProperty(emisInv, "Emission Map Invert");
                }
                else
                {
                    targetMat.SetInt("_Emissive_Invert", 0); // Invert Off
                }

            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Custom Specular Settings
        GUIExtras.SHeader("CUSTOM SPECULAR SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty spec = ShaderGUI.FindProperty("_Custom_Specular", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(spec, "Custom Specular");
            });
            if(spec.floatValue > 0)
            {
                MaterialProperty specColor = ShaderGUI.FindProperty("_Specular_Color", properties);
                MaterialProperty specIntensity = ShaderGUI.FindProperty("_Specular_Intensity", properties);
                MaterialProperty specNormStr = ShaderGUI.FindProperty("_Specular_Normal_Strength", properties);
                MaterialProperty specMap = ShaderGUI.FindProperty("_Specular_Texture", properties);

                materialEditor.ShaderProperty(specColor, "Specular Color");
                materialEditor.ShaderProperty(specMap, "Specular Map");
                materialEditor.ShaderProperty(specIntensity, "Specular Intensity");
                materialEditor.ShaderProperty(specNormStr, "Normal Strength");

                GUIExtras.SFoldout(targetMat, "_specExtFold", "Specular Controls", BDColors.DarkRed(120), 10,BDColors.White(255), BDColors.Black(40), true, () =>
                {
                    MaterialProperty specGamma = ShaderGUI.FindProperty("_Specular_Gamma", properties);
                    MaterialProperty specGlossy = ShaderGUI.FindProperty("_Glossy", properties);
                    MaterialProperty specSoftness = ShaderGUI.FindProperty("_Softness", properties);
                    MaterialProperty specSatur = ShaderGUI.FindProperty("_Saturation", properties);
                    MaterialProperty specIn = ShaderGUI.FindProperty("_Specular_In", properties);
                    MaterialProperty specOut = ShaderGUI.FindProperty("_Specular_Out", properties);

                    materialEditor.ShaderProperty(specGamma, "Specular Gamma");
                    materialEditor.ShaderProperty(specGlossy, "Glossy");
                    materialEditor.ShaderProperty(specSoftness, "Softness");
                    materialEditor.ShaderProperty(specSatur, "Saturate");
                    materialEditor.ShaderProperty(specIn, "Specular In");
                    materialEditor.ShaderProperty(specOut, "Specular Out");
                });
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);


            MaterialProperty AOTog = ShaderGUI.FindProperty("_Ambient_Occlusion", properties);
            GUIExtras.SColoredVertical(BDColors.NexusBlue(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(AOTog, "Ambient Occlusion");
            });
            
            if(AOTog.floatValue > 0.0f)
            {
                MaterialProperty AOMap = ShaderGUI.FindProperty("_AO_Map", properties);
                MaterialProperty AOMapInv = ShaderGUI.FindProperty("_AO_Map_Invert", properties);
                MaterialProperty AOInt = ShaderGUI.FindProperty("_AO_Intensity", properties);
                MaterialProperty AOCol = ShaderGUI.FindProperty("_AO_Color", properties);
                MaterialProperty LColor = ShaderGUI.FindProperty("_Lighten_Color", properties);
                MaterialProperty AOCont = ShaderGUI.FindProperty("_AO_Contrast", properties);
                MaterialProperty AOContP = ShaderGUI.FindProperty("_AO_Contrast_Pivot", properties);
                MaterialProperty AOGamma = ShaderGUI.FindProperty("_AO_Gamma", properties);
                MaterialProperty AOPower = ShaderGUI.FindProperty("_AO_Power", properties);
                MaterialProperty AOMin = ShaderGUI.FindProperty("_AO_Min", properties);
                MaterialProperty AOMax = ShaderGUI.FindProperty("_AO_Max", properties);

                materialEditor.ShaderProperty(AOMap, "Ambient Occlusion Map");
                materialEditor.ShaderProperty(AOMapInv, "Invert");
                materialEditor.ShaderProperty(AOInt, "Intensity");
                materialEditor.ShaderProperty(LColor, "Lighten Color");
                materialEditor.ShaderProperty(AOCol, "Dark Color");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, AOGamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, AOCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(AOContP, "Contrast Pivot");
                materialEditor.ShaderProperty(AOPower, "Power");
                materialEditor.ShaderProperty(AOMin, "SmoothStep Min");
                materialEditor.ShaderProperty(AOMax, "SmoothStep Max");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Wind Settings
        GUIExtras.SHeader("WIND SETTINGS", ref checkWind, "_CheckWind", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkWind)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty wind = ShaderGUI.FindProperty("_Wind", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(wind, "Wind");
            });
            if(wind.floatValue > 0)
            {
                MaterialProperty noiseInv = ShaderGUI.FindProperty("_Noise_Invert", properties);
                MaterialProperty perLeaves = ShaderGUI.FindProperty("_Per_Leaves", properties);
                MaterialProperty windSterength = ShaderGUI.FindProperty("_Wind_Strength", properties);
                MaterialProperty windSpeed = ShaderGUI.FindProperty("_Wind_Speed", properties);

                materialEditor.ShaderProperty(noiseInv, "Invert Noise");
                materialEditor.ShaderProperty(perLeaves, "Per Leaves");
                materialEditor.ShaderProperty(windSterength, "WindStrength");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, windSpeed, "Wind Speed", -1, 1);

                // Enum değerleri
                string[] options = new[] { "Voronoi", "Simple Noise", "Gradient Noise", "NTexture" };

                // Mevcut keyword'ü bul
                int current = 0;
                if (targetMat.IsKeywordEnabled("_WIND_NOISE_TYPE_SIMPLE_NOISE")) current = 1;
                else if (targetMat.IsKeywordEnabled("_WIND_NOISE_TYPE_GRADIENT_NOISE")) current = 2;
                else if (targetMat.IsKeywordEnabled("_WIND_NOISE_TYPE_NTEXTURE")) current = 3;

                // Dropdown çiz
                int selected = EditorGUILayout.Popup("Wind Noise Type", current, options);

                // Seçim değiştiyse keyword'leri ayarla
                if (selected != current)
                {
                    targetMat.DisableKeyword("_WIND_NOISE_TYPE_VORONOI");
                    targetMat.DisableKeyword("_WIND_NOISE_TYPE_SIMPLE_NOISE");
                    targetMat.DisableKeyword("_WIND_NOISE_TYPE_GRADIENT_NOISE");
                    targetMat.DisableKeyword("_WIND_NOISE_TYPE_NTEXTURE");

                    switch (selected)
                    {
                        case 0: targetMat.EnableKeyword("_WIND_NOISE_TYPE_VORONOI"); break;
                        case 1: targetMat.EnableKeyword("_WIND_NOISE_TYPE_SIMPLE_NOISE"); break;
                        case 2: targetMat.EnableKeyword("_WIND_NOISE_TYPE_GRADIENT_NOISE"); break;
                        case 3: targetMat.EnableKeyword("_WIND_NOISE_TYPE_NTEXTURE"); break;
                    }
                }

                switch (selected)
                {
                    case 0:
                        MaterialProperty cellDensity = ShaderGUI.FindProperty("_Cell_Density", properties);
                        materialEditor.ShaderProperty(cellDensity, "Cell Density");
                        break;
                    case 1:
                    case 2:
                        MaterialProperty windNoiseScale = ShaderGUI.FindProperty("_Wind_Noise_Scale", properties);
                        materialEditor.ShaderProperty(windNoiseScale, "Noise Scale");
                        break;
                    case 3:
                        MaterialProperty noiseTexture = ShaderGUI.FindProperty("_Wind_Noise_Texture", properties);
                        MaterialProperty wntLod = ShaderGUI.FindProperty("_WNT_LOD", properties);
                        materialEditor.ShaderProperty(noiseTexture, "Noise Map");
                        materialEditor.ShaderProperty(wntLod, "Texture LOD");
                        break;
                }
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, false, true, true, true, false, true, true, true, true);
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

        tempVar = targetMat.GetInt("_CheckEmis");
        checkEmis = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_specExtFold");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckWind");
        checkWind = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Blending_Mode");
        blendingMode = tempVar;

        tempVar = targetMat.GetInt("_Anti_Aliasing");
        checkAA = tempVar == 1 ? true : false;
    }
}



using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BSurfaceMetallicEditor : ShaderGUI
{
    bool checkSpec, checkNormal, checkRim, checkReflect, checkRefFresnel, checkRefFrsInvert, checkAO, checkSSBlur, checkEmis, checkMetallic, checkSmooth, checkBase, checkDef;
    bool aboutFold, specExtFold, cubemapFold, fresnelFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Surface Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUSurfaceTitle.png", typeof(Texture));

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

        #region Main Group
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
            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty btm = ShaderGUI.FindProperty("_TriplanarMap", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty btx = ShaderGUI.FindProperty("_TileX", properties);
            MaterialProperty bty = ShaderGUI.FindProperty("_TileY", properties);
            MaterialProperty box = ShaderGUI.FindProperty("_OffsetX", properties);
            MaterialProperty boy = ShaderGUI.FindProperty("_OffsetY", properties);
            MaterialProperty bfo = ShaderGUI.FindProperty("_FallOff", properties);

            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.ShaderProperty(btm, "Triplanar Mapping");
            materialEditor.TextureProperty(bt, "Base Map");
            BaseMapScaleOffset(materialEditor, properties);
            if(btm.floatValue > 0)
            {
                materialEditor.RangeProperty(bfo, "FallOff");
            }
            EditorGUI.indentLevel--;
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("SPECULAR SETTINGS", checkSpec, style);
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty spTxt = ShaderGUI.FindProperty("_SpecularMap",properties);
            MaterialProperty spSpecType = ShaderGUI.FindProperty("_SpecType", properties);
            MaterialProperty spAOAffect = ShaderGUI.FindProperty("_AffectAO_Spec", properties);
            MaterialProperty spmtAffect = ShaderGUI.FindProperty("_AffectMetallic", properties);

            materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");
            materialEditor.ShaderProperty(spmtAffect, "Affect Metallic");
            materialEditor.ShaderProperty(spSpecType, "Specular Type");
            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.TextureProperty(spTxt, "Specular Map");
            materialEditor.RangeProperty(spInt, "Specular Intensity");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty spBGloss = ShaderGUI.FindProperty("_BGloss", properties);
                MaterialProperty spSpecMin = ShaderGUI.FindProperty("_SpecMin",properties);
                MaterialProperty spSpecMax = ShaderGUI.FindProperty("_SpecMax", properties);
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);

                materialEditor.ShaderProperty(spBGloss, "Blinn Gloss");
                materialEditor.RangeProperty(spSmt, "Specular Softness");
                materialEditor.ShaderProperty(spSpecMin, "Soft Specular Min");
                materialEditor.ShaderProperty(spSpecMax, "Soft Specular Max");
                materialEditor.RangeProperty(spSat, "Specular Saturation");
                materialEditor.RangeProperty(spIn, "Specular In");
                materialEditor.RangeProperty(spOut, "Specular Out");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);

        #endregion

        #region Metallic Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkMetallic = EditorGUILayout.ToggleLeft("METALLIC SETTINGS", checkMetallic, style);
        targetMat.SetInt("_MetallicToggle", Convert.ToInt16(checkMetallic));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkMetallic)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty mtl = ShaderGUI.FindProperty("_Metallic", properties);
            MaterialProperty mtInv = ShaderGUI.FindProperty("_MetallicInvert", properties);
            MaterialProperty mtmp = ShaderGUI.FindProperty("_MetallicMap", properties);
            MaterialProperty mscl = ShaderGUI.FindProperty("_MScale", properties);
            MaterialProperty moff = ShaderGUI.FindProperty("_MOffset", properties);

            materialEditor.RangeProperty(mtl, "Metallic Intensity");
            materialEditor.ShaderProperty(mtInv, "Invert Metallic");
            materialEditor.TextureProperty(mtmp, "Metallic Map");
            EditorGUILayout.BeginHorizontal();
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 35;
            materialEditor.FloatProperty(mscl, "Netal Scale");
            materialEditor.FloatProperty(moff, "Metal Offset");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
            EditorGUILayout.EndHorizontal();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Smoothness Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSmooth = EditorGUILayout.ToggleLeft("ROUGHNESS SETTINGS", checkSmooth, style);
        targetMat.SetInt("_SmoothnessToggle", Convert.ToInt16(checkSmooth));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSmooth)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty smtInt = ShaderGUI.FindProperty("_Smoothness", properties);
            MaterialProperty smtMap = ShaderGUI.FindProperty("_RougnessMap", properties);
            MaterialProperty smtInv = ShaderGUI.FindProperty("_SmoothnessInvert", properties);

            materialEditor.RangeProperty(smtInt, "Smoothness Intensity");
            materialEditor.TextureProperty(smtMap, "Roughness Map");
            materialEditor.ShaderProperty(smtInv, "Invert Roughness");
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
        targetMat.SetInt("_Normal", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nmap = ShaderGUI.FindProperty("_NormalMap", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_NormalScale", properties);
            MaterialProperty ntx = ShaderGUI.FindProperty("_NTileX", properties);
            MaterialProperty nty = ShaderGUI.FindProperty("_NTileY", properties);
            MaterialProperty nox = ShaderGUI.FindProperty("_NOffsetX", properties);
            MaterialProperty noy = ShaderGUI.FindProperty("_NOffsetY", properties);
            MaterialProperty ntm = ShaderGUI.FindProperty("_TriplanarNMap", properties);
            MaterialProperty nfo = ShaderGUI.FindProperty("_NFallOff", properties);
            MaterialProperty nsm = ShaderGUI.FindProperty("_NormalMultiplier", properties);

            EditorGUILayout.BeginVertical();
            {
                materialEditor.TextureProperty(nmap, "Normal Map");
                materialEditor.ShaderProperty(nscl, "Normal Scale");

                materialEditor.ShaderProperty(ntm, "Normal Triplanar Mapping");
                materialEditor.RangeProperty(nsm, "Normal Multiplier");
                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 35;
                materialEditor.FloatProperty(ntx, "N Tile X");
                materialEditor.FloatProperty(nty, "N Tile Y");
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.BeginHorizontal();
                materialEditor.FloatProperty(nox, "N Offset X");
                materialEditor.FloatProperty(noy, "N Offset Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();
                materialEditor.RangeProperty(nfo, "N FallOff");
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Emission Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkEmis = EditorGUILayout.ToggleLeft("EMISSIVE SETTINGS", checkEmis, style);
        targetMat.SetInt("_EmissionToggle", Convert.ToInt16(checkEmis));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkEmis)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty emap = ShaderGUI.FindProperty("_EmissionMap", properties);
            MaterialProperty eint = ShaderGUI.FindProperty("_EmissionIntensity", properties);
            MaterialProperty eiml = ShaderGUI.FindProperty("_EmissionMultiplier", properties);
            MaterialProperty ecol = ShaderGUI.FindProperty("_EmissionColor", properties);
            MaterialProperty einv = ShaderGUI.FindProperty("_EmissionInvert", properties);

            materialEditor.ShaderProperty(einv, "Invert Emission");
            materialEditor.RangeProperty(eint, "Emission Intensity");
            materialEditor.RangeProperty(eiml, "Emission Multiplier");
            materialEditor.ColorProperty(ecol, "Emission color");
            materialEditor.TextureProperty(emap, "Emission Map");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Light Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkRim = EditorGUILayout.ToggleLeft("RIM SETTINGS", checkRim, style);
        targetMat.SetInt("_RimSwitch", Convert.ToInt16(checkRim));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rint = ShaderGUI.FindProperty("_RimLightIntensity", properties);
            MaterialProperty rinv = ShaderGUI.FindProperty("_RimLightInvert",properties);
            MaterialProperty rcol = ShaderGUI.FindProperty("_RimLightColor", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_RimLightBias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_RimLightPower", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_RimLightScale", properties);
            MaterialProperty rimAO = ShaderGUI.FindProperty("_AffectAO_Rim", properties);

            materialEditor.ShaderProperty(rimAO, "Affect Ambient Occlusion");
            materialEditor.RangeProperty(rint, "Rim Intensity");
            materialEditor.ShaderProperty(rinv, "Rim Invert");
            materialEditor.ColorProperty(rcol, "Rim Color");
            materialEditor.RangeProperty(rb, "Rim Bias");
            materialEditor.RangeProperty(rs, "Rim Scale");
            materialEditor.RangeProperty(rp, "Rim Power");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkReflect = EditorGUILayout.ToggleLeft("REFLECTION SETTINGS", checkReflect, style);
        targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rfcol = ShaderGUI.FindProperty("_ReflectColor", properties);
            MaterialProperty rfs = ShaderGUI.FindProperty("_ReflectionStrength", properties);
            MaterialProperty rft = ShaderGUI.FindProperty("_ReflectMap", properties);
            MaterialProperty cmr = ShaderGUI.FindProperty("_CubeMapRotate", properties);
            MaterialProperty refAO = ShaderGUI.FindProperty("_AffectAO",properties);
           
            materialEditor.ShaderProperty(refAO, "Affect Ambient Occlusion");
            materialEditor.RangeProperty(rfs, "Reflect Strength");
            materialEditor.ColorProperty(rfcol, "Reflect Color");
            materialEditor.TextureProperty(rft, "Reflect Map");

            #region Reflection Fresnel Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            fresnelFold = EditorGUILayout.Foldout(fresnelFold, "Reflection Fresnel", toggleOnLabelClick: true);
            targetMat.SetInt("_FresnelFold", Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {
                EditorGUI.indentLevel++;
                checkRefFresnel = EditorGUILayout.Toggle("Reflection Fresnel", checkRefFresnel);
                targetMat.SetInt("_FresnelSwitch", Convert.ToInt16(checkRefFresnel));
                if(checkRefFresnel)
                {
                    MaterialProperty rfMultiplier = ShaderGUI.FindProperty("_ReflectionMultiplier", properties);
                    materialEditor.RangeProperty(rfMultiplier, "Multiplier");

                    checkRefFrsInvert = EditorGUILayout.Toggle("Fresnel Invert", checkRefFrsInvert);
                    targetMat.SetInt("_RefFresnelInvert", Convert.ToInt16(checkRefFrsInvert));

                    MaterialProperty rfbias = ShaderGUI.FindProperty("_RefFresnelBias", properties);
                    MaterialProperty rfscl = ShaderGUI.FindProperty("_RefFresnelScale", properties);
                    MaterialProperty rfPow = ShaderGUI.FindProperty("_RefFresnelPower", properties);
                    materialEditor.RangeProperty(rfbias, "Fresnel Bias");
                    materialEditor.RangeProperty(rfscl, "Fresnel Scale");
                    materialEditor.RangeProperty(rfPow, "Fresnel Power");
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubeMapExtras", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty cmx = ShaderGUI.FindProperty("_CMXPos", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_CMYPos", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_CMZPos", properties);

                materialEditor.RangeProperty(cmr, "Cubemap Rotate");
                materialEditor.RangeProperty(cmx, "CM X Pos");
                materialEditor.RangeProperty(cmy, "CM Y Pos");
                materialEditor.RangeProperty(cmz, "CM Z Pos");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Occlusion Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkAO= EditorGUILayout.ToggleLeft("AMBIENT OCCLUSION SETTINGS", checkAO, style);
        targetMat.SetInt("_AOToggle", Convert.ToInt16(checkAO));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty aomap = ShaderGUI.FindProperty("_AmbientOcclusionMap", properties);
            MaterialProperty aoInt = ShaderGUI.FindProperty("_AOIntensity", properties);

            materialEditor.TextureProperty(aomap, "Ambient Occlusion Map");
            materialEditor.RangeProperty(aoInt, "Ambient Occlusion Intensity");
            EditorGUI.indentLevel-- ;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Screen Space Bluric Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSSBlur = EditorGUILayout.ToggleLeft("SCREEN SPACE BLUR SETTINGS", checkSSBlur, style);
        targetMat.SetInt("_SSBluricTransparent", Convert.ToInt16(checkSSBlur));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSSBlur)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);
            MaterialProperty ssbPHgt = ShaderGUI.FindProperty("_PatternHeight", properties);
            MaterialProperty ssbPRot = ShaderGUI.FindProperty("_PatternRotator", properties);
            MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);

            MaterialProperty ssTileX = ShaderGUI.FindProperty("_SSTileX", properties);
            MaterialProperty ssTileY = ShaderGUI.FindProperty("_SSTileY", properties);
            MaterialProperty ssOffX = ShaderGUI.FindProperty("_SSOffX", properties);
            MaterialProperty ssOffY = ShaderGUI.FindProperty("_SSOffY", properties);

            materialEditor.TextureProperty(ssbTxt, "Blur Pattern");

            EditorGUILayout.BeginHorizontal();
            EditorGUIUtility.labelWidth = 170;
            EditorGUIUtility.fieldWidth = 35;
            materialEditor.FloatProperty(ssTileX, "Tile X");
            materialEditor.FloatProperty(ssTileY, "Tile Y");
            materialEditor.FloatProperty(ssOffX, "Offset X");
            materialEditor.FloatProperty(ssOffY, "Offset Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
            EditorGUILayout.EndHorizontal();

            materialEditor.RangeProperty(ssbPHgt, "Pattern Height");
            materialEditor.RangeProperty(ssbPRot, "Pattern Rotator");
            materialEditor.FloatProperty(ssbSize, "Size");
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
        tempVar = targetMat.GetInt("_SSBluricTransparent");
        checkSSBlur = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_MetallicToggle");
        checkMetallic = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SmoothnessToggle");
        checkSmooth = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RimSwitch");
        checkRim = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AOToggle");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubeMapExtras");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecularExtras");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelSwitch");
        checkRefFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefFresnelInvert");
        checkRefFrsInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

    }

    private void BaseMapScaleOffset(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_TileX";
        selected.Tile.y = "_TileY";
        selected.Offset.x = "_OffsetX";
        selected.Offset.y = "_OffsetY";
        selected.Speed.x = "";
        selected.Speed.y = "";
        selected.Anchor.x = "";
        selected.Anchor.y = "";
        selected.OverallSpeed = "";
        selected.RotateSpeed = "";
        selected.Rotate = "";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
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

using UnityEngine;
using UnityEditor;
using System;
using budu;
using static PlasticPipe.PlasticProtocol.Messages.Serialization.ItemHandlerMessagesSerialization;
using DG.DemiEditor;
using UnityEngine.Rendering;

public class BSurfaceEditor : ShaderGUI
{
    bool checkSpec, checkNormal, checkRim, checkReflect, checkRefFresnel, checkRefFrsInvert, checkAO, checkSSBlur, checkEmis, checkBase, checkTranslucent, checkDef;
    bool aboutFold, specExtFold, normalFold, rimFold, reflectFold, cubemapFold, fresnelFold, AOFold, ssBlurFold;
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

        #region Main Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS", checkBase, style);
        targetMat.SetInt("_CheckBase",Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty btx = ShaderGUI.FindProperty("_TileX", properties);
            MaterialProperty bty = ShaderGUI.FindProperty("_TileY", properties);
            MaterialProperty box = ShaderGUI.FindProperty("_OffsetX", properties);
            MaterialProperty boy = ShaderGUI.FindProperty("_OffsetY", properties);
            MaterialProperty btm = ShaderGUI.FindProperty("_TriplanarMap", properties);
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
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("SPECULAR", checkSpec, style);
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);
            MaterialProperty spTxt = ShaderGUI.FindProperty("_SpecularMap", properties);
            MaterialProperty spType = ShaderGUI.FindProperty("_SpecType",properties);
            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty spAOAffect = ShaderGUI.FindProperty("_AffectAO_Spec", properties);

            materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");
            materialEditor.ShaderProperty(spType, "Specular Type");
            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.TextureProperty(spTxt, "Specular Map");
            materialEditor.RangeProperty(spInt, "Specular Intensity");

            var a = ShaderGUI.FindProperty("_TriplanarMap", properties);

            if(a.floatValue > 0.0f)
            {
                MaterialProperty spNormInt = ShaderGUI.FindProperty("_SpecularNormalIntensity", properties);
                materialEditor.RangeProperty(spNormInt, "Specular Normal Intensity");
            }
            else
            {
                targetMat.SetFloat("_SpecularNormalIntensity", 0f);
            }

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spSpecMin = ShaderGUI.FindProperty("_SpecMin", properties);
                MaterialProperty spSpecMax = ShaderGUI.FindProperty("_SpecMax", properties);
                MaterialProperty spGloss = ShaderGUI.FindProperty("_BGloss", properties);

                materialEditor.RangeProperty(spGloss, "Blinn Gloss");
                materialEditor.RangeProperty(spSmt, "Specular Softness");
                materialEditor.RangeProperty(spSpecMin, "Soft Specular Min");
                materialEditor.RangeProperty(spSpecMax, "Soft Specular Max");
                materialEditor.RangeProperty(spSat, "Specular Saturate");
                materialEditor.RangeProperty(spOut, "Specular Out");
                materialEditor.RangeProperty(spIn, "Specular In");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
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
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
        targetMat.SetInt("_Normal", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(normalFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(1);

            MaterialProperty nmap = ShaderGUI.FindProperty("_NormalMap", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_NormalScale", properties);
            MaterialProperty ntm = ShaderGUI.FindProperty("_TriplanarNMap", properties);
            MaterialProperty nfo = ShaderGUI.FindProperty("_NFallOff", properties);
            MaterialProperty nsm = ShaderGUI.FindProperty("_NormalMultiplier", properties);

            EditorGUILayout.BeginVertical();
            {
                materialEditor.TextureProperty(nmap, "Normal Map");
                materialEditor.RangeProperty(nscl, "Normal Scale");
                materialEditor.RangeProperty(nsm, "Normal Multiplier");
                NormMapScaleOffset(materialEditor,properties);
                materialEditor.ShaderProperty(ntm, "Normal Triplanar Mapping");
                if(ntm.floatValue > 0.0f)
                {
                    materialEditor.RangeProperty(nfo, "N FallOff");
                }
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
        checkEmis = EditorGUILayout.ToggleLeft("EMISSIVE", checkEmis, style);
        targetMat.SetInt("_EmissionToggle", Convert.ToInt16(checkEmis));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkEmis)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

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
        checkRim = EditorGUILayout.ToggleLeft("RIM LIGHT", checkRim, style);
        rimFold = checkRim;
        targetMat.SetInt("_RimSwitch", Convert.ToInt16(checkRim));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(rimFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

            MaterialProperty rint = ShaderGUI.FindProperty("_RimLightIntensity", properties);
            MaterialProperty rinv = ShaderGUI.FindProperty("_RimLightInvert",properties);
            MaterialProperty rcol = ShaderGUI.FindProperty("_RimLightColor", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_RimLightBias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_RimLightPower", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_RimLightScale", properties);
            MaterialProperty rimAO = ShaderGUI.FindProperty("_AffectAO_Rim", properties);

            materialEditor.ShaderProperty(rimAO, "Affect Ambient Occlusion");
            materialEditor.RangeProperty(rint, "Rim Light Intensity");
            materialEditor.ShaderProperty(rinv, "Rim Light Invert");
            materialEditor.ColorProperty(rcol, "Rim Light Color");
            materialEditor.RangeProperty(rb, "Rim Light Bias");
            materialEditor.RangeProperty(rs, "Rim Light Scale");
            materialEditor.RangeProperty(rp, "Rim Light Power");
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
        checkReflect = EditorGUILayout.ToggleLeft("REFLECT", checkReflect, style);
        reflectFold = checkReflect;
        targetMat.SetInt("_Reflect", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(reflectFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

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
            style.normal.background = MakeBackground(1, 1, bdColors.dCyanGreen(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            fresnelFold = EditorGUILayout.Foldout(fresnelFold, "Reflection Fresnel", toggleOnLabelClick: true);
            targetMat.SetInt("_FresnelFold", Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {

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
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.dGreenRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubeMapExtras", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                MaterialProperty cmx = ShaderGUI.FindProperty("_CMXPos", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_CMYPos", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_CMZPos", properties);

                materialEditor.RangeProperty(cmr, "Cubemap Rotate");
                materialEditor.RangeProperty(cmx, "CM X Pos");
                materialEditor.RangeProperty(cmy, "CM Y Pos");
                materialEditor.RangeProperty(cmz, "CM Z Pos");
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
        checkAO= EditorGUILayout.ToggleLeft("AMBIENT OCCLUSION", checkAO, style);
        AOFold = checkAO;
        targetMat.SetInt("_AOToggle", Convert.ToInt16(checkAO));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(AOFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

            MaterialProperty aomap = ShaderGUI.FindProperty("_AmbientOcclusionMap", properties);
            MaterialProperty aoInt = ShaderGUI.FindProperty("_AOIntensity", properties);

            materialEditor.TextureProperty(aomap, "Ambient Occlusion Map");
            materialEditor.RangeProperty(aoInt, "Ambient Occlusion Intensity");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Translucency Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkTranslucent = EditorGUILayout.ToggleLeft("TRANSLUCENCY SETTINGS", checkTranslucent, style);
        targetMat.SetInt("_TranslucencySettings",Convert.ToInt16(checkTranslucent));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTranslucent)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

            MaterialProperty trnsTog = ShaderGUI.FindProperty("_TranslucencyToggle", properties);
            //MaterialProperty trmsTog = ShaderGUI.FindProperty("_TransmissionToggle", properties);

            materialEditor.ShaderProperty(trnsTog, "Translucency");

            if(trnsTog.floatValue > 0f) 
            {
                EditorGUI.indentLevel++;
                MaterialProperty trnsCol = ShaderGUI.FindProperty("_TranslucencyColor", properties);
                MaterialProperty trnsMap = ShaderGUI.FindProperty("_TranslucencyMap", properties);
                MaterialProperty trnsTxtInv = ShaderGUI.FindProperty("_TranslucencyInvert", properties);

                MaterialProperty trmsCol = ShaderGUI.FindProperty("_TransmissionColor", properties);
                MaterialProperty trmsTxt = ShaderGUI.FindProperty("_TransmissionMap", properties);
                MaterialProperty trmsTxtInv = ShaderGUI.FindProperty("_TransmissInvert", properties);

                MaterialProperty trnsStrength = ShaderGUI.FindProperty("_TransStrength", properties);
                MaterialProperty trnsNormDist = ShaderGUI.FindProperty("_TransNormal", properties);
                MaterialProperty trnsScatter = ShaderGUI.FindProperty("_TransScattering", properties);
                MaterialProperty trnsDirect = ShaderGUI.FindProperty("_TransDirect", properties);
                MaterialProperty trnsAmbient = ShaderGUI.FindProperty("_TransAmbient", properties);
                MaterialProperty trnsShadow = ShaderGUI.FindProperty("_TransShadow", properties);
                MaterialProperty trmssh = ShaderGUI.FindProperty("_TransmissionShadow", properties);

                targetMat.SetInt("_TransmissionToggle", Convert.ToInt16(1));

                materialEditor.ShaderProperty(trnsCol, "Translucency Color");
                materialEditor.ShaderProperty(trnsTxtInv, "Translucency Invert");
                materialEditor.ShaderProperty(trnsMap, "Translucency Map");

                //materialEditor.ShaderProperty(trmsTog, "Transmission");

                materialEditor.ShaderProperty(trmsCol, "Transmission Color");
                materialEditor.ShaderProperty(trmsTxtInv, "Transmission Invert");
                materialEditor.ShaderProperty(trmsTxt, "Transmission Map");
                materialEditor.ShaderProperty(trmssh, "Transmission Shadow");
                materialEditor.ShaderProperty(trnsStrength, "Translucency Strength");
                materialEditor.ShaderProperty(trnsNormDist, "Normal Distortion");
                materialEditor.ShaderProperty(trnsScatter, "Scattering");
                materialEditor.ShaderProperty(trnsDirect, "Direct");
                materialEditor.ShaderProperty(trnsAmbient, "Ambient");
                materialEditor.ShaderProperty(trnsShadow, "Translucency Shadow");
                EditorGUI.indentLevel--;
            }
            else
            {
                targetMat.SetInt("_TransmissionToggle", Convert.ToInt16(0));
            }


            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Screen Space Bluric Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSSBlur = EditorGUILayout.ToggleLeft("SCREEN SPACE BLUR", checkSSBlur, style);
        ssBlurFold = checkSSBlur;
        targetMat.SetInt("_SSBluricTransparent", Convert.ToInt16(ssBlurFold));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(ssBlurFold)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(4);

            MaterialProperty sstog = ShaderGUI.FindProperty("_ScreenSpace",properties);
            MaterialProperty ssbTxt = ShaderGUI.FindProperty("_BluricRefractionPattern", properties);
            MaterialProperty ssbSize = ShaderGUI.FindProperty("_SSSize", properties);


            materialEditor.ShaderProperty(sstog, "Bluric Noise");
            materialEditor.TextureProperty(ssbTxt, "Blur Pattern");
            materialEditor.FloatProperty(ssbSize, "Blur Size");

            BluricScaleOffset(materialEditor, properties,(int)sstog.floatValue);
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

            /// <summary>
            /// Workflow Mode
            /// Specular    :   Valid Keywords = _SPECULAR_SETUP
            /// Metallic    :   Valid Keywords = .....
            /// </summary>

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
        tempVar = targetMat.GetInt("_TranslucencySettings");
        checkTranslucent = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SSBluricTransparent");
        checkSSBlur = tempVar == 1 ? true : false;
        ssBlurFold = checkSSBlur;

        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;
        normalFold = checkNormal;

        tempVar = targetMat.GetInt("_RimSwitch");
        checkRim = tempVar == 1 ? true : false;
        rimFold = checkRim;

        tempVar = targetMat.GetInt("_Reflect");
        checkReflect = tempVar == 1 ? true : false;
        reflectFold = checkReflect;

        tempVar = targetMat.GetInt("_AOToggle");
        checkAO = tempVar == 1 ? true : false;
        AOFold = checkAO;

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

    private void NormMapScaleOffset(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_NTileX";
        selected.Tile.y = "_NTileY";
        selected.Offset.x = "_NOffsetX";
        selected.Offset.y = "_NOffsetY";
        selected.Speed.x = "";
        selected.Speed.y = "";
        selected.Anchor.x = "";
        selected.Anchor.y = "";
        selected.OverallSpeed = "";
        selected.RotateSpeed = "";
        selected.Rotate = "";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selected);
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

    private void BluricScaleOffset(MaterialEditor materialEditor, MaterialProperty[] properties, int seltg)
    {
        BD_Misc_GUI selectedMisc = new BD_Misc_GUI();
        selectedMisc.Invert = "";
        selectedMisc.Intensity = "_PatternHeight";
        selectedMisc.Contrast = "";
        BDShaderGUI.MiscGUI(materialEditor,properties,selectedMisc);

        BD_ScaleOffset_GUI selected = new BD_ScaleOffset_GUI();
        selected.Tile.x = "_SSTileX";
        selected.Tile.y = "_SSTileY";
        selected.Speed.x = "";
        selected.Speed.y = "";
        selected.Anchor.x = "";
        selected.Anchor.y = "";
        selected.OverallSpeed = "";
        selected.RotateSpeed = "";

        switch(seltg)
        {
            case 0:
                selected.Offset.x = "";
                selected.Offset.y = "";
                selected.Rotate = "";
                break;
            case 1:
                selected.Offset.x = "_SSOffX";
                selected.Offset.y = "_SSOffY";
                selected.Rotate = "_PatternRotator";
                break;
        }

        BDShaderGUI.ScaleOffsetGUI(materialEditor,properties,selected);
    }
}

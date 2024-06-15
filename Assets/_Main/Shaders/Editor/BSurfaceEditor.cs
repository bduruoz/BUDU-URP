using UnityEngine;
using UnityEditor;
using System;
using budu;
using static PlasticPipe.PlasticProtocol.Messages.Serialization.ItemHandlerMessagesSerialization;

public class BSurfaceEditor : ShaderGUI
{
    bool checkSpec, checkNormal, checkRim, checkReflect, checkRefFresnel, checkRefFrsInvert, checkAO, checkSSBlur, checkEmis;
    bool aboutFold, specFold, specExtFold, normalFold, rimFold, reflectFold, cubemapFold, fresnelFold, AOFold, ssBlurFold, emisFold;
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
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Main Group
        style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

        MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
        MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
        MaterialProperty btx = ShaderGUI.FindProperty("_TileX", properties);
        MaterialProperty bty = ShaderGUI.FindProperty("_TileY", properties);
        MaterialProperty box = ShaderGUI.FindProperty("_OffsetX", properties);
        MaterialProperty boy = ShaderGUI.FindProperty("_OffsetY", properties);
        MaterialProperty btm = ShaderGUI.FindProperty("_TriplanarMap", properties);
        MaterialProperty bfo = ShaderGUI.FindProperty("_FallOff",properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
            materialEditor.ShaderProperty(btm, "Triplanar Mapping");
            EditorGUILayout.BeginHorizontal();
            EditorGUIUtility.labelWidth = 80;
            EditorGUIUtility.fieldWidth = 30;
            materialEditor.FloatProperty(btx, "Tile X");
            materialEditor.FloatProperty(bty, "Tile Y");
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            materialEditor.FloatProperty(box, "Offset X");
            materialEditor.FloatProperty(boy, "Offset Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
            EditorGUILayout.EndHorizontal();
            materialEditor.RangeProperty(bfo, "FallOff");
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpec = EditorGUILayout.ToggleLeft("SPECULAR", checkSpec, style);
        specFold = checkSpec;
        targetMat.SetInt("_SpecularSwitch", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(specFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty spcol = ShaderGUI.FindProperty("_SpecColor", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_SpecularIntensity", properties);
            MaterialProperty spGls = ShaderGUI.FindProperty("_Glossy", properties);
            MaterialProperty spTxt = ShaderGUI.FindProperty("_SpecularMap",properties);
            MaterialProperty spAOAffect = ShaderGUI.FindProperty("_AffectAO_Spec", properties);

            materialEditor.ShaderProperty(spAOAffect, "Affect Ambient Occlusion");
            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.TextureProperty(spTxt, "Specular Map");
            materialEditor.RangeProperty(spInt, "Specular Intensity");
            materialEditor.RangeProperty(spGls, "Glossy");

            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(100));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                MaterialProperty spAmb = ShaderGUI.FindProperty("_SpecularAmbient", properties);
                MaterialProperty spSat = ShaderGUI.FindProperty("_SpecularSaturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_SpecularOut", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_SpecularIn", properties);

                materialEditor.RangeProperty(spAmb, "Specular Ambient");
                materialEditor.RangeProperty(spSat, "Specular Saturation");
                materialEditor.RangeProperty(spSmt, "Specular Softness");
                materialEditor.RangeProperty(spOut, "Specular Out");
                materialEditor.RangeProperty(spIn, "Specular In");
            }
            EditorGUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);

        #endregion

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
        normalFold = checkNormal;
        targetMat.SetInt("_Normal", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(normalFold)
        {
            EditorGUILayout.Space(4);

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
                materialEditor.RangeProperty(nscl, "Normal Scale");

                materialEditor.ShaderProperty(ntm, "Normal Triplanar Mapping");
                materialEditor.RangeProperty(nsm, "Normal Multiplier");
                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 80;
                EditorGUIUtility.fieldWidth = 50;
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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Emission Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkEmis = EditorGUILayout.ToggleLeft("EMISSIVE", checkEmis, style);
        emisFold = checkEmis;
        targetMat.SetInt("_EmissionToggle", Convert.ToInt16(checkEmis));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(emisFold)
        {
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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
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

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);


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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
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
            EditorGUILayout.Space(4);

            MaterialProperty aomap = ShaderGUI.FindProperty("_AmbientOcclusionMap", properties);
            MaterialProperty aoInt = ShaderGUI.FindProperty("_AOIntensity", properties);

            materialEditor.TextureProperty(aomap, "Ambient Occlusion Map");
            materialEditor.RangeProperty(aoInt, "Ambient Occlusion Intensity");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
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
            EditorGUILayout.Space(4);

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
            EditorGUIUtility.labelWidth = 55;
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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);

        #endregion

        #region Shader Defaults
        //materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
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
        ssBlurFold = checkSSBlur;

        tempVar = targetMat.GetInt("_SpecularSwitch");
        checkSpec = tempVar == 1 ? true : false;
        specFold = checkSpec;

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
}

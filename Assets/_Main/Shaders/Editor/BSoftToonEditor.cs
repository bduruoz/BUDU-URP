using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BSoftToonEditor : ShaderGUI
{
    bool checkNormal, checkRim, checkReflect, checkSpec, checkShade, checkRefFresnel, checkRefFrsInvert;
    bool aboutFold, normalFold, rimFold, reflectFold, cubemapFold, specFold, specExtFold, shadeFold, shadeExtFold, fresnelFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);
        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUSoftToonTitle.png", typeof(Texture));

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

        #region Main Settings
        style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

        MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
        MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
        MaterialProperty avfe = ShaderGUI.FindProperty("_AverageFeatures", properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
            materialEditor.ShaderProperty(avfe, "Average Features");
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADE COLOR", checkShade, style);
        shadeFold = checkShade;
        targetMat.SetInt("_ShadeColorToggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(shadeFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty shInt = ShaderGUI.FindProperty("_ShadingIntensity", properties);
            MaterialProperty shCol = ShaderGUI.FindProperty("_ShadeColor",properties);
            MaterialProperty shCnt = ShaderGUI.FindProperty("_ShadeContrast", properties);
            MaterialProperty shCntr = ShaderGUI.FindProperty("_ShadingContribution", properties);
            MaterialProperty shOff = ShaderGUI.FindProperty("_ShadingOffset", properties);
            MaterialProperty shCnt2 = ShaderGUI.FindProperty("_ShadingContrast", properties);

            materialEditor.RangeProperty(shInt, "Shade Intensity");
            materialEditor.ColorProperty(shCol, "Shade Color");
            materialEditor.RangeProperty(shCnt, "Full Shade Contrast");
            materialEditor.RangeProperty(shCntr, "Shading Contribution");
            materialEditor.RangeProperty(shOff, "Shading Offset");
            materialEditor.RangeProperty(shCnt2, "Shading Contrast");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "Shade Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_ShadeExtras", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                MaterialProperty shBaCS = ShaderGUI.FindProperty("_BaseCellSharpness", properties);
                MaterialProperty shBaCO = ShaderGUI.FindProperty("_BaseCellOffset", properties);

                materialEditor.RangeProperty(shBaCS, "Base Cell Sharpness");
                materialEditor.RangeProperty(shBaCO, "Base Cell Offset");
            }
            EditorGUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
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

            materialEditor.ColorProperty(spcol, "Specular Color");
            materialEditor.RangeProperty(spInt, "Specular Intensity");
            materialEditor.RangeProperty(spGls, "Glossy");

            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(100));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_SpecularExtras",Convert.ToInt16(specExtFold));
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
            MaterialProperty nscl = ShaderGUI.FindProperty("_NormalScale",properties);

            materialEditor.TextureProperty(nmap, "Normal Map");
            materialEditor.RangeProperty(nscl, "Normal Scale");
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

            MaterialProperty rint = ShaderGUI.FindProperty("_RimIntensity", properties);
            MaterialProperty rcol = ShaderGUI.FindProperty("_RimColor", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_RimBias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_RimPower", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_RimScale", properties);

            materialEditor.RangeProperty(rint, "Rim Intensity");
            materialEditor.ColorProperty(rcol, "Rim Color");
            materialEditor.RangeProperty(rb, "Rim Bias");
            materialEditor.RangeProperty(rs, "Rim Scale");
            materialEditor.RangeProperty(rp, "Rim Power");

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
            MaterialProperty cmr = ShaderGUI.FindProperty("_CubeMapRotate",properties);

            materialEditor.RangeProperty(rfs, "Reflect Strength");
            materialEditor.ColorProperty(rfcol, "Reflect Color");
            materialEditor.TextureProperty(rft, "Reflect Map");

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.dGreenRed(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_CubeMapExtras",Convert.ToInt16(cubemapFold));
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

            #region Reflection Fresnel Settings
            style.normal.background = MakeBackground(1, 1, bdColors.dCyanGreen(60));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            fresnelFold = EditorGUILayout.Foldout(fresnelFold, "Reflection Fresnel", toggleOnLabelClick: true);
            targetMat.SetInt("_FresnelFold",Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {

                checkRefFresnel = EditorGUILayout.Toggle("Reflection Fresnel", checkRefFresnel);
                targetMat.SetInt("_RefFresnelSwitch", Convert.ToInt16(checkRefFresnel));
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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Shader Defaults
        EditorGUILayout.Space(5);
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

        tempVar = targetMat.GetInt("_CubeMapExtras");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecularExtras");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShadeColorToggle");
        checkShade = tempVar == 1 ? true : false;
        specFold = checkShade;

        tempVar = targetMat.GetInt("_ShadeExtras");
        shadeExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefFresnelSwitch");
        checkRefFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RefFresnelInvert");
        checkRefFrsInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        // Total Features On | Off
        targetMat.SetInt("_SpecT", Convert.ToInt16(checkSpec));
        targetMat.SetInt("_RimT", Convert.ToInt16(checkRim));
        targetMat.SetInt("_ShadeT", Convert.ToInt16(checkShade));
        targetMat.SetInt("_ReflectT", Convert.ToInt16(checkReflect));
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

/*



        //MaterialProperty temp = ShaderGUI.FindProperty("_Vector0",properties);
        //materialEditor.ShaderProperty(temp, "temp");


        #region Transparency Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkTransparent = EditorGUILayout.ToggleLeft("TRANSPARENT", checkTransparent, style);
            if(EditorGUI.EndChangeCheck())
            {
                MaterialProperty srcb = ShaderGUI.FindProperty("_SrcBlend", properties);
                MaterialProperty dstb = ShaderGUI.FindProperty("_DstBlend", properties);
                MaterialProperty zwr = ShaderGUI.FindProperty("_ZWrite", properties);

                if(checkTransparent)
                {

                    alphaFold = true;
                    targetMat.SetInt("_Transparent", 1);

                    targetMat.SetInt("_SrcBlend", 5);   // Src Alpha
                    targetMat.SetInt("_DstBlend", 10);  // One Minus Src Alpha
                    targetMat.SetInt("_ZWrite", 1);
                    targetMat.SetOverrideTag("RenderType", "Transparent");
                    targetMat.SetOverrideTag("Queue", "Transparent");
                    targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;
                }
                else
                {
                    alphaFold = false;
                    targetMat.SetInt("_Transparent", 0);

                    targetMat.SetInt("_SrcBlend", 1); // One
                    targetMat.SetInt("_DstBlend", 0); // Zero
                    targetMat.SetInt("_ZWrite", 1);
                    targetMat.SetOverrideTag("RenderType", "Opaque");
                    targetMat.SetOverrideTag("Queue", "Geometry");
                    targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Geometry;
                }
                EditorUtility.SetDirty(targetMat);
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(alphaFold)
        {
            EditorGUILayout.Space(4);
            EditorGUI.BeginChangeCheck();
            checkAlphaClip = EditorGUILayout.Toggle("Alpha Clip", checkAlphaClip);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkAlphaClip)
                {
                    alphaClipFold = true;
                    targetMat.SetInt("_AlphaClip", 1);
                }
                else
                {
                    alphaClipFold = false;
                    targetMat.SetInt("_AlphaClip", 0);
                }
            }

            if(alphaClipFold)
            {
                MaterialProperty act = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);

                materialEditor.RangeProperty(act, "Alpha Clip Threshold");
            }

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Fresnel Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        EditorGUILayout.BeginVertical(style);
        checkFresnel = EditorGUILayout.ToggleLeft("FRESNEL", checkFresnel, style);
        if(EditorGUI.EndChangeCheck() )
        {
            MaterialProperty fsw = ShaderGUI.FindProperty("_FSwitch",properties);

            if(checkFresnel)
            {
                fresnelFold = true;
                targetMat.SetInt("_FSwitch", 1);
            }
            else
            {   
                fresnelFold = false;
                targetMat.SetInt("_FSwitch", 0);
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(fresnelFold)
        {
            EditorGUILayout.Space(4);

            EditorGUI.BeginChangeCheck();
            checkFresnelInvert = EditorGUILayout.Toggle("Fresnel Invert", checkFresnelInvert);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkFresnelInvert)
                {
                    targetMat.SetInt("_FresnelInvert", 1);
                }
                else
                {
                    targetMat.SetInt("_FresnelInvert", 0);
                }
            }

            MaterialProperty bias = ShaderGUI.FindProperty("_FBias", properties);
            MaterialProperty scale= ShaderGUI.FindProperty("_FScale", properties);
            MaterialProperty power = ShaderGUI.FindProperty("_FPower", properties);

            materialEditor.RangeProperty(bias, "Fresnel Bias");
            materialEditor.RangeProperty(scale, "Fresnel Scale");
            materialEditor.RangeProperty(power, "Fresnel Power");

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

 

 */ 
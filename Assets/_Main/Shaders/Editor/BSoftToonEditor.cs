using UnityEngine;
using UnityEditor;
using System;
using budu;
using UnityEditor.Rendering;

public class BSoftToonEditor : ShaderGUI
{
    bool checkBase, checkDef, checkShade, checkSpec, checkNormal, checkRim, checkReflect;
    bool aboutFold, shadeExtFold, specExtFold, cubemapFold, fresnelFold;
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
        GUILayout.Space(28);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Main Settings
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

            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Base_Map", properties);
            MaterialProperty btgam = ShaderGUI.FindProperty("_Base_Map_Gamma", properties);
            MaterialProperty avfe = ShaderGUI.FindProperty("_Average_Features", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");

            if(bt.textureValue != null)
            {
                MaterialProperty btfm = ShaderGUI.FindProperty("_FilterMode", properties);
                string[] fmode = { "Point", "Bilinear", "Trilinear" };
                materialEditor.PopupShaderProperty(btfm, new GUIContent("Filter Mode"), fmode);

                switch((int)btfm.floatValue)
                {
                    case 0:
                        bt.textureValue.filterMode = FilterMode.Point;
                        break;
                    case 1:
                        bt.textureValue.filterMode = FilterMode.Bilinear;
                        break;
                    case 2:
                        bt.textureValue.filterMode = FilterMode.Trilinear;
                        break;
                }
                materialEditor.ShaderProperty(btgam, "Base Map Gamma");
            }
            materialEditor.ShaderProperty(avfe, "Average Features");
            EditorGUI.indentLevel--;
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shade Color Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShade = EditorGUILayout.ToggleLeft("SHADE COLOR", checkShade, style);
        targetMat.SetInt("_CheckShade", Convert.ToInt16(checkShade));
        targetMat.SetInt("_Shading_Toggle", Convert.ToInt16(checkShade));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Shade Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty shInt = ShaderGUI.FindProperty("_Shading_Intensity", properties);
            MaterialProperty shCol = ShaderGUI.FindProperty("_Shade_Color", properties);
            MaterialProperty shCnt = ShaderGUI.FindProperty("_Shade_Contrast", properties);
            MaterialProperty shNrmStr = ShaderGUI.FindProperty("_Shading_Normal_Strength", properties);
            MaterialProperty shSaturate = ShaderGUI.FindProperty("_Shading_Saturate", properties);
            MaterialProperty shCntr = ShaderGUI.FindProperty("_Shading_Contribution", properties);
            MaterialProperty shOff = ShaderGUI.FindProperty("_Shading_Offset", properties);
            MaterialProperty shCnt2 = ShaderGUI.FindProperty("_Shading_Contrast", properties);

            materialEditor.ShaderProperty(shInt, "Shade Intensity");
            materialEditor.ShaderProperty(shCol, "Shade Color");
            materialEditor.ShaderProperty(shCnt, "Full Shade Contrast"); 
            materialEditor.ShaderProperty(shNrmStr, "Shading Normal Strength"); 
            EditorGUILayout.Space(2);
            materialEditor.ShaderProperty(shSaturate, "Shading Saturate");
            materialEditor.ShaderProperty(shCntr, "Shading Contribution");
            materialEditor.ShaderProperty(shOff, "Shading Offset");
            materialEditor.ShaderProperty(shCnt2, "Shading Contrast");
            

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            shadeExtFold = EditorGUILayout.Foldout(shadeExtFold, "Shade Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_shadeExtFold", Convert.ToInt16(shadeExtFold));
            if(shadeExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty shAffBaseTxt = ShaderGUI.FindProperty("_Shading_Affect_Base_Texture", properties);
                MaterialProperty shMapIntensity = ShaderGUI.FindProperty("_Base_Map_Intensity", properties);
                MaterialProperty shColText = ShaderGUI.FindProperty("_Shading_Colored_Texture", properties);

                materialEditor.ShaderProperty(shAffBaseTxt, "Affect Base Texture");
                materialEditor.ShaderProperty(shMapIntensity, "Base Texture Intensity");
                EditorGUILayout.Space(2);
                materialEditor.ShaderProperty(shColText, "Colored Texture");
                if(shColText.floatValue > 0.0f)
                {
                    MaterialProperty shTextOverCol = ShaderGUI.FindProperty("_Texture_Over_Color", properties);
                    materialEditor.ShaderProperty(shTextOverCol, "Texture Over Color");
                }
                else
                {
                    targetMat.SetInt("_Texture_Over_Color", 0);
                }
                EditorGUILayout.Space(2);

                MaterialProperty BaseSharp = ShaderGUI.FindProperty("_Base_Sharpness", properties);
                MaterialProperty BaseOffset = ShaderGUI.FindProperty("_Base_Offset", properties);

                materialEditor.ShaderProperty(BaseSharp, "Base Sharpness");
                materialEditor.ShaderProperty(BaseOffset, "Base Offset");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
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
        targetMat.SetInt("_CheckSpecular", Convert.ToInt16(checkSpec));
        targetMat.SetInt("_Specular_Toggle", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();
        
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Specular Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty spcol = ShaderGUI.FindProperty("_Specular_Color", properties);
            MaterialProperty spInt = ShaderGUI.FindProperty("_Specular_Intensity", properties);
            MaterialProperty spNormIst = ShaderGUI.FindProperty("_Specular_Normal_Strength", properties);

            materialEditor.ShaderProperty(spcol, "Specular Color");
            materialEditor.ShaderProperty(spInt, "Specular Intensity");
            materialEditor.ShaderProperty(spNormIst, "Specular Normal Strength");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            specExtFold = EditorGUILayout.Foldout(specExtFold, "Specular Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_specExtFold", Convert.ToInt16(specExtFold));
            if(specExtFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty lgGam = ShaderGUI.FindProperty("_Light_Gamma", properties);
                MaterialProperty spGls = ShaderGUI.FindProperty("_Glossy", properties);
                MaterialProperty spSat = ShaderGUI.FindProperty("_Specular_Saturation", properties);
                MaterialProperty spSmt = ShaderGUI.FindProperty("_Softness", properties);
                MaterialProperty spOut = ShaderGUI.FindProperty("_Specular_Out", properties);
                MaterialProperty spIn = ShaderGUI.FindProperty("_Specular_In", properties);

                materialEditor.ShaderProperty(lgGam, "Light Gamma");
                materialEditor.ShaderProperty(spGls, "Glossy");

                materialEditor.ShaderProperty(spSat, "Specular Saturation");
                materialEditor.ShaderProperty(spSmt, "Specular Softness");
                materialEditor.ShaderProperty(spOut, "Specular Out");
                materialEditor.ShaderProperty(spIn, "Specular In");
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
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNormal, style);
        targetMat.SetInt("_CheckNormal", Convert.ToInt16(checkNormal));
        targetMat.SetInt("_Normal_Toggle", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nMap = ShaderGUI.FindProperty("_Normal_Map", properties);
            MaterialProperty nScl = ShaderGUI.FindProperty("_Normal_Strength", properties);
            MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

            materialEditor.TextureProperty(nMap, "Normal Map");
            materialEditor.RangeProperty(nScl, "Normal Strength");
            materialEditor.RangeProperty(nMult, "Normal Multiplier");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkRim = EditorGUILayout.ToggleLeft("RIM SETTINGS", checkRim, style);
        targetMat.SetInt("_CheckRim", Convert.ToInt16(checkRim));
        targetMat.SetInt("_Rim_Toggle", Convert.ToInt16(checkRim));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Rim Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty rinv = ShaderGUI.FindProperty("_Rim_Invert", properties);
            MaterialProperty rint = ShaderGUI.FindProperty("_Rim_Intensity", properties);
            MaterialProperty rNormStr = ShaderGUI.FindProperty("_Rim_Normal_Strength", properties);
            MaterialProperty rcol = ShaderGUI.FindProperty("_Rim_Color", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_Rim_Bias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_Rim_Power", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_Rim_Scale", properties);

            materialEditor.ShaderProperty(rinv, "Rim Invert");
            materialEditor.ShaderProperty(rint, "Rim Intensity");
            materialEditor.ShaderProperty(rNormStr, "Rim Normal Strength");
            materialEditor.ShaderProperty(rcol, "Rim Color");
            materialEditor.ShaderProperty(rb, "Rim Bias");
            materialEditor.ShaderProperty(rs, "Rim Scale");
            materialEditor.ShaderProperty(rp, "Rim Power");
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
        targetMat.SetInt("_CheckReflect", Convert.ToInt16(checkReflect));
        targetMat.SetInt("_Reflection_Toggle", Convert.ToInt16(checkReflect));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(100));
            EditorGUILayout.BeginVertical(style);
            EditorGUILayout.LabelField("Reflection Feature", GUILayout.MinWidth(200));
            EditorGUILayout.EndVertical();

            MaterialProperty rfcol = ShaderGUI.FindProperty("_Reflection_Color", properties);
            MaterialProperty rfs = ShaderGUI.FindProperty("_Reflection_Strength", properties);
            MaterialProperty rft = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
            MaterialProperty rftLod = ShaderGUI.FindProperty("_CubeMap_LOD", properties);
            MaterialProperty rfMultiplier = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
            MaterialProperty rfNormStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
            MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shadow", properties);
            
            materialEditor.ShaderProperty(rfcol, "Reflect Color");
            materialEditor.ShaderProperty(rft, "Reflect Map");
            materialEditor.ShaderProperty(rftLod, "Reflect Map LOD");
            materialEditor.ShaderProperty(rfs, "Reflect Strength");
            materialEditor.ShaderProperty(rfMultiplier, "Reflection Multiplier");
            materialEditor.ShaderProperty(rfNormStr, "Reflection Normal Strength");

            materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");

            if(rfAffShd.floatValue > 0.0f)
            {
                MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shadow_Strength", properties);
                materialEditor.ShaderProperty(rfShdStr, "Shadow Strength");
            }

            #region Cubemap Extras Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            style.fontSize = default;
            style.normal.textColor = default;

            EditorGUILayout.BeginVertical(style);
            cubemapFold = EditorGUILayout.Foldout(cubemapFold, "Cubemap Extra Controls", toggleOnLabelClick: true);
            targetMat.SetInt("_cubemapFold", Convert.ToInt16(cubemapFold));
            if(cubemapFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty cmr = ShaderGUI.FindProperty("_Cubemap_Rotate", properties);
                MaterialProperty cmx = ShaderGUI.FindProperty("_Cubemap_X_Position", properties);
                MaterialProperty cmy = ShaderGUI.FindProperty("_Cubemap_Y_Position", properties);
                MaterialProperty cmz = ShaderGUI.FindProperty("_Cubemap_Z_Position", properties);

                materialEditor.ShaderProperty(cmr, "Cubemap Rotate");
                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 70;
                EditorGUIUtility.fieldWidth = 20;
                materialEditor.ShaderProperty(cmx, "X Pos");
                materialEditor.ShaderProperty(cmy, "Y Pos");
                materialEditor.ShaderProperty(cmz, "Z Pos");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();
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
            targetMat.SetInt("_fresnelFold",Convert.ToInt16(fresnelFold));
            if(fresnelFold)
            {
                EditorGUI.indentLevel++;

                MaterialProperty checkRefFres = ShaderGUI.FindProperty("_Ref_Fresnel_Toggle", properties);
                materialEditor.ShaderProperty(checkRefFres, "Reflection Fresnel");

                if(checkRefFres.floatValue > 0f)
                {
                    MaterialProperty rfFresInv = ShaderGUI.FindProperty("_Ref_Fresnel_Invert",properties);
                    MaterialProperty rfbias = ShaderGUI.FindProperty("_Ref_Fresnel_Bias", properties);
                    MaterialProperty rfscl = ShaderGUI.FindProperty("_Ref_Fresnel_Scale", properties);
                    MaterialProperty rfPow = ShaderGUI.FindProperty("_Ref_Fresnel_Power", properties);

                    materialEditor.ShaderProperty(rfFresInv, "Fresnel Invert");
                    materialEditor.ShaderProperty(rfbias, "Fresnel Bias");
                    materialEditor.ShaderProperty(rfscl, "Fresnel Scale");
                    materialEditor.ShaderProperty(rfPow, "Fresnel Power");
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion
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
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShade");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_shadeExtFold");
        shadeExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpecular");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_specExtFold");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRim");
        checkRim = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_cubemapFold");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_fresnelFold");
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
using UnityEngine;
using UnityEditor;
using System;
using budu;
using UnityEditor.Rendering;
using UnityEngine.Rendering;
using Unity.VisualScripting;

public class BEmissiveEditor : ShaderGUI
{
    bool checkBase, checkDef, checkAlphaClip;
    bool checkTransparent, checkFresnel, checkFresnelInvert;
    bool alphaFold, alphaClipFold, fresnelFold, aboutFold;
    int surfType;
    int tempVar, tempRQ;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        LoadMaterialVariables(targetMat);
        SurfaceControls(targetMat, surfType);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUEmissiveTitle.png", typeof(Texture));

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
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS",checkBase,style);
        targetMat.SetInt("_BaseSettings", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            //style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty baseInt = ShaderGUI.FindProperty("_Intensity",properties);
            MaterialProperty mapInv = ShaderGUI.FindProperty("_MapInvert", properties);

            materialEditor.ShaderProperty(baseInt, "Emission Intensity");
            materialEditor.ColorProperty(bc, "Emission Color");
            materialEditor.TextureProperty(bt, "Emission Map");
            materialEditor.ShaderProperty(mapInv, "Invert Texture");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Transparency Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);
        checkTransparent = EditorGUILayout.ToggleLeft("TRANSPARENT", checkTransparent, style);
        targetMat.SetFloat("_TransparentTog", Convert.ToInt16(checkTransparent));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTransparent)
        {
            if(surfType < 1.0)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.HelpBox("Surface Type is Opaque !", MessageType.Warning);
                EditorGUI.indentLevel--;
            }
            else
            {
                EditorGUI.indentLevel++;
                MaterialProperty alpChan = ShaderGUI.FindProperty("_ALPHACHANNEL", properties);
                MaterialProperty alpCont = ShaderGUI.FindProperty("_AlphaContrast", properties);
                MaterialProperty alpInvert = ShaderGUI.FindProperty("_ALPHAINVERT", properties);

                materialEditor.ShaderProperty(alpChan, "Selected Channel");
                materialEditor.ShaderProperty(alpCont, "Alpha Contrast");
                materialEditor.ShaderProperty(alpInvert, "Alpha Invert");
            }
            checkAlphaClip = EditorGUILayout.Toggle("Alpha Clip", checkAlphaClip);
            targetMat.SetInt("_Alpha_Clip", Convert.ToInt16(checkAlphaClip));
            targetMat.SetInt("_AlphaClip", Convert.ToInt16(checkAlphaClip));
            if(checkAlphaClip)
            {
                MaterialProperty act = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);
                materialEditor.RangeProperty(act, "Alpha Clip Threshold");

                targetMat.EnableKeyword("_ALPHATEST_ON");

            }
            else
            {
                targetMat.DisableKeyword("_ALPHATEST_ON");
            }

            EditorGUI.indentLevel--;
        }
        else
        {
            // Transparaan kapalı
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fresnel Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);
        
        EditorGUILayout.BeginVertical(style);
        checkFresnel = EditorGUILayout.ToggleLeft("FRESNEL", checkFresnel, style);
        targetMat.SetInt("_Fresnel", Convert.ToInt16(checkFresnel));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkFresnel)
        {
            EditorGUI.indentLevel++;
            checkFresnelInvert = EditorGUILayout.Toggle("Fresnel Invert", checkFresnelInvert);
            targetMat.SetInt("_FresnelInvert", Convert.ToInt16(checkFresnelInvert));

            MaterialProperty bias = ShaderGUI.FindProperty("_FBias", properties);
            MaterialProperty scale= ShaderGUI.FindProperty("_FScale", properties);
            MaterialProperty power = ShaderGUI.FindProperty("_FPower", properties);

            materialEditor.RangeProperty(bias, "Fresnel Bias");
            materialEditor.RangeProperty(scale, "Fresnel Scale");
            materialEditor.RangeProperty(power, "Fresnel Power");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        EditorGUILayout.Space(2);
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

            #region Surface Type
            MaterialProperty surfaceType = ShaderGUI.FindProperty("_SURFTYPE", properties);
            string[] srType = { "Opaque", "Transparent" };
            materialEditor.PopupShaderProperty(surfaceType, new GUIContent("Surface Type"), srType);

            if(surfaceType.intValue > 1)
            {
                #region Blend Type
                MaterialProperty blType = ShaderGUI.FindProperty("_Blend", properties);
                MaterialProperty srcBlend = ShaderGUI.FindProperty("_SrcBlend", properties);
                MaterialProperty dstBlend = ShaderGUI.FindProperty("_DstBlend", properties);

                string[] blendtype = { "Alpha", "Premultiply", "Additive", "Multiply" };
                materialEditor.PopupShaderProperty(blType, new GUIContent("Blend Type"), blendtype);
                switch((int)blType.floatValue)
                {
                    case 0:
                        // Alpha Blending
                        srcBlend.floatValue = (int)BlendMode.SrcAlpha;
                        dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 1:
                        // Premultiply
                        srcBlend.floatValue = (int)BlendMode.One;
                        dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 2:
                        // Additive
                        srcBlend.floatValue = (int)BlendMode.One;
                        dstBlend.floatValue = (int)BlendMode.One;
                        targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                    case 3:
                        // Multiply
                        srcBlend.floatValue = (int)BlendMode.DstColor;
                        dstBlend.floatValue = (int)BlendMode.Zero;
                        targetMat.EnableKeyword(keyword: "_ALPHAMODULATE_ON");
                        break;
                }
                #endregion

                #region Preserve Specular Settings
                EditorGUI.indentLevel++;
                targetMat.DisableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
                if((int)blType.floatValue == 0 || (int)blType.floatValue == 2)
                {
                    MaterialProperty psl = ShaderGUI.FindProperty("_Preserve_Specular_Lighting", properties);
                    materialEditor.ShaderProperty(psl, "Preserve Specular Lighting");

                    if(psl.floatValue < 1f)
                    {
                        targetMat.EnableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
                    }
                }
                EditorGUI.indentLevel--;
                #endregion
            }
            #endregion

            #region Depth Write
            // Auto = 0
            // Force Enabled = 1
            // Force Disabled = 2

            MaterialProperty zDepth = ShaderGUI.FindProperty("_ZWrite", properties);
            string[] zType = { "Auto", "Force Enabled", "Force Disabled" };
            materialEditor.PopupShaderProperty(zDepth, new GUIContent("Depth Write"), zType);
            #endregion

            #region Cull Mode
            MaterialProperty cullMode = ShaderGUI.FindProperty("_Cull", properties);
            string[] clMode = { "Both", "Back", "Front" };
            materialEditor.PopupShaderProperty(cullMode, new GUIContent("Cull Mode"), clMode);
            #endregion

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

            //Debug.Log("surftype int = " + surfType);
            SurfaceControls(targetMat, surfType);

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
        style.normal.textColor = bdColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;

        style.normal.background = MakeBackground(1, 1, bdColors.Black(0));
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

    void LoadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_BaseSettings");
        checkBase = tempVar == 1 ? true: false;

        tempVar = targetMat.GetInt("_TransparentTog");
        checkTransparent = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Alpha_Clip");
        checkAlphaClip = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Fresnel");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SURFTYPE");
        surfType = tempVar == 1 ? 1 : 0;
    }
    void SurfaceControls(Material targetMat, int surfType)
    {
        targetMat.SetInt("_AlphaToMask", 0);


        if(targetMat.renderQueue >= 3000)
        {
            tempRQ = targetMat.renderQueue - 3000;
        }

        switch(surfType)
        {
            #region Opaque
            case 0:
                targetMat.SetOverrideTag("QUEUE", "Geometry");
                targetMat.SetOverrideTag("RenderType", "Opaque");
                targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.Geometry);

                targetMat.DisableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                targetMat.SetShaderPassEnabled("DepthOnly", true);

                targetMat.SetInt("_Zwrite", 1);
                break;
            #endregion
            #region Transparent
            case 1:
                targetMat.SetOverrideTag("QUEUE", "Transparent");
                if(checkAlphaClip)
                {
                    targetMat.SetOverrideTag("RenderType", "TransparentCutOut");
                }
                else
                {
                    targetMat.SetOverrideTag("RenderType", "Transparent");
                }
                targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + tempRQ;

                targetMat.EnableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                targetMat.SetShaderPassEnabled("DepthOnly", false);

                targetMat.SetInt("_Zwrite", 0);
                break;
            #endregion
        }

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

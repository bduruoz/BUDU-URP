using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BEmissiveEditor : ShaderGUI
{
    bool checkAlphaClip, checkTransparent, checkFresnel, checkFresnelInvert, checkBaseGroup;
    bool alphaFold, alphaClipFold, fresnelFold, aboutFold;
    int tempVar, tempRQ;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

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
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Base Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkBaseGroup = EditorGUILayout.ToggleLeft("BASE SETTINGS",checkBaseGroup,style);
        targetMat.SetInt("_BaseSettings", Convert.ToInt16(checkBaseGroup));

        if (checkBaseGroup)
        {
            style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);
            MaterialProperty baseInt = ShaderGUI.FindProperty("_Intensity",properties);

            EditorGUILayout.BeginVertical();
            {
                EditorGUI.indentLevel++;
                materialEditor.ShaderProperty(baseInt, "Base Intensity");
                materialEditor.ColorProperty(bc, "Base Color");
                materialEditor.TextureProperty(bt, "Base Map");
                EditorGUI.indentLevel--;
            }
            GUILayout.EndVertical();
        }
        EditorGUILayout.Space(1);
        #endregion

        #region Transparency Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical();
        checkTransparent = EditorGUILayout.ToggleLeft("TRANSPARENT", checkTransparent, style);
        targetMat.SetInt("_Transparent",Convert.ToInt16(checkTransparent));
        if (checkTransparent)
        {
            EditorGUI.indentLevel++;
            MaterialProperty alpChan = ShaderGUI.FindProperty("_AlphaChannel", properties);
            MaterialProperty alpCont = ShaderGUI.FindProperty("_AlphaContrast", properties);
            MaterialProperty alpInvert = ShaderGUI.FindProperty("_AlphaInvert", properties);
            materialEditor.ShaderProperty(alpChan, "Selected Channel");
            materialEditor.ShaderProperty(alpCont, "Alpha Contrast");
            materialEditor.ShaderProperty(alpInvert, "Alpha Invert");

            checkAlphaClip = EditorGUILayout.Toggle("Alpha Clip", checkAlphaClip);
            targetMat.SetInt("_AlphaClip", Convert.ToInt16(checkAlphaClip));
            if(checkAlphaClip)
            {
                MaterialProperty act = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);
                materialEditor.RangeProperty(act, "Alpha Clip Threshold");
            }

            targetMat.SetInt("_SrcBlend", 5);   // Src Alpha
            targetMat.SetInt("_DstBlend", 10);  // One Minus Src Alpha
            targetMat.SetInt("_ZWrite", 1);
            targetMat.SetOverrideTag("RenderType", "Transparent");
            targetMat.SetOverrideTag("Queue", "Transparent");
            targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + tempRQ;
            EditorGUI.indentLevel--;
        }
        else
        {
            targetMat.SetInt("_SrcBlend", 1); // One
            targetMat.SetInt("_DstBlend", 0); // Zero
            targetMat.SetInt("_ZWrite", 1);
            targetMat.SetOverrideTag("RenderType", "Opaque");
            targetMat.SetOverrideTag("Queue", "Geometry");
            targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.Geometry);
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fresnel Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        EditorGUILayout.BeginVertical();
        checkFresnel = EditorGUILayout.ToggleLeft("FRESNEL", checkFresnel, style);
        targetMat.SetInt("_FSwitch",Convert.ToInt16(checkFresnel));
        if(checkFresnel)
        {
            EditorGUI.indentLevel++;
            MaterialProperty fsw = ShaderGUI.FindProperty("_FSwitch",properties);

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
        MaterialProperty cullm = ShaderGUI.FindProperty("_CullMode", properties);
        materialEditor.ShaderProperty(cullm, "Cull Mode");
        materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
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

    void loadMaterialVariables(Material targetMat)
    {
        if (targetMat.renderQueue >= 3000)
        {
            tempRQ = targetMat.renderQueue - 3000;
        }

        tempVar = targetMat.GetInt("_BaseSettings");
        checkBaseGroup = tempVar == 1 ? true: false;

        tempVar = targetMat.GetInt("_Transparent");
        checkTransparent = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AlphaClip");
        checkAlphaClip = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FSwitch");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;
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

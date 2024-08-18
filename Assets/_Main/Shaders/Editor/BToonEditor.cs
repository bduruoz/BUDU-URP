using UnityEngine;
using UnityEditor;
using System;
using System.Collections.Generic;
using budu;

public class BToonEditor : ShaderGUI
{
    Gradient grad = new Gradient();
    bool checkCustomRamp, checkRamp, checkTSpec, checkColoredAmb, checkNormal, checkBlueNoise, checkIndirectL, checkContour, checkContourLA, checkBase, checkDef;
    bool aboutFold, rampFold, customRampFold;
    bool gradControl = true;
    int tempVar, gradMode;
    int GradCLength;
    int GradALength;

    List<GradientColorKey> iGradColors = new List<GradientColorKey>();
    List<GradientAlphaKey> iGradAlphas = new List<GradientAlphaKey>();

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);
        EditorUtility.SetDirty(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Toon Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUToonTitle.png", typeof(Texture));
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
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);
        EditorGUILayout.BeginVertical(style);
        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS", checkBase, style);
        targetMat.SetInt("_BaseSettings", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);

            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Gradient Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        EditorGUILayout.BeginVertical(style);
        checkRamp = EditorGUILayout.ToggleLeft("GRADIENT SETTINGS", checkRamp, style);
        targetMat.SetInt("_Ramp", Convert.ToInt16(checkRamp));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRamp)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            EditorGUI.BeginChangeCheck();
            checkCustomRamp = EditorGUILayout.Toggle("Custom Ramp", checkCustomRamp);
            targetMat.SetInt("_CustomRamp", Convert.ToInt16(checkCustomRamp));
            if(EditorGUI.EndChangeCheck())
            {
                if(checkCustomRamp)
                {
                    customRampFold = true;
                }
                else
                {
                    customRampFold = false;
                    RemoveGradientTexture(targetMat);
                }
            }
            MaterialProperty rt = ShaderGUI.FindProperty("_RampTexture", properties);
            MaterialProperty rc = ShaderGUI.FindProperty("_RampControl", properties);
            MaterialProperty ro = ShaderGUI.FindProperty("_RampOffset", properties);

            if(customRampFold)
            {
                EditorGUI.BeginChangeCheck();
                grad = EditorGUILayout.GradientField("Gradient", grad);
                if(EditorGUI.EndChangeCheck())
                {
                    MaterialProperty rmp = ShaderGUI.FindProperty("_RampTexture", properties);
                    saveGradientVariables(targetMat);
                }
                SetGradient(targetMat);
            }
            else
            {
                materialEditor.TextureProperty(rt, "Ramp Texture");
            }

            materialEditor.RangeProperty(rc, "Ramp Control");
            materialEditor.RangeProperty(ro, "Ramp Offset");
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
        checkTSpec = EditorGUILayout.ToggleLeft("SPECULAR",checkTSpec,style);
        targetMat.SetInt("_ToonSpec", Convert.ToInt16(checkTSpec));
        targetMat.SetInt("_TSpec", Convert.ToInt16(checkTSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty tsi = ShaderGUI.FindProperty("_ToonSpecIntensity", properties);
            MaterialProperty tsmn = ShaderGUI.FindProperty("_ToonSpecMin", properties);
            MaterialProperty tsmx = ShaderGUI.FindProperty("_ToonSpecMax", properties);
            MaterialProperty tsa = ShaderGUI.FindProperty("_ToonSpecArea", properties);

            materialEditor.RangeProperty(tsi, "Specular Intensity");
            materialEditor.RangeProperty(tsmn, "Specular Min");
            materialEditor.RangeProperty(tsmx, "Specular Max");
            materialEditor.RangeProperty(tsa, "Specular Area");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Colored Ambient Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkColoredAmb = EditorGUILayout.ToggleLeft("AMBIENT SETTINGS", checkColoredAmb, style);
        targetMat.SetInt("_ColoredAmbientToggle", Convert.ToInt16(checkColoredAmb));
        EditorGUILayout.EndVertical();


        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkColoredAmb)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ambc = ShaderGUI.FindProperty("_AmbientColor", properties);
            MaterialProperty ambclmin = ShaderGUI.FindProperty("_AmbientClampMin", properties);
            MaterialProperty ambclmax = ShaderGUI.FindProperty("_AmbientClampMax", properties);

            materialEditor.ColorProperty(ambc, "Ambient Color");
            materialEditor.RangeProperty(ambclmin, "Ambient Clamp Min") ;
            materialEditor.RangeProperty(ambclmax, "Ambient Clamp Max");
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

            materialEditor.TextureProperty(nmap, "Normal Map");
            materialEditor.RangeProperty(nscl, "Normal Scale");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Toon Style Settting
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkBlueNoise = EditorGUILayout.ToggleLeft("TOON STYLE SETTINGS", checkBlueNoise, style);
        targetMat.SetInt("_BlueNoise", Convert.ToInt16(checkBlueNoise));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBlueNoise)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bntxt = ShaderGUI.FindProperty("_BlueNoiseTexture", properties);
            MaterialProperty bnInt = ShaderGUI.FindProperty("_BlueNoiseIntensity", properties);

            materialEditor.TextureProperty(bntxt, "Style Pattern");
            materialEditor.RangeProperty(bnInt, "Style Intensity");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Indirect Light Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkIndirectL = EditorGUILayout.ToggleLeft("INDIRECT LIGHT SETTINGS", checkIndirectL, style);
        targetMat.SetInt("_IndirectLightToggle", Convert.ToInt16(checkIndirectL));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkIndirectL)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ilI = ShaderGUI.FindProperty("_IndirectLightIntensity", properties);

            materialEditor.RangeProperty(ilI, "Indirect Light Intensity");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Contour Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkContour = EditorGUILayout.ToggleLeft("CONTOUR SETTINGS", checkContour, style);
        targetMat.SetInt("_ToonContour", Convert.ToInt16(checkContour));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkContour)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty tcc = ShaderGUI.FindProperty("_ToonContourColor", properties);
            MaterialProperty tcs = ShaderGUI.FindProperty("_ToonContourScale", properties);
            MaterialProperty tco = ShaderGUI.FindProperty("_ToonContourOffset",properties);

            materialEditor.ColorProperty(tcc, "Toon Contour Color");
            materialEditor.RangeProperty(tcs, "Toon Contour Scale");
            materialEditor.RangeProperty(tco, "Toon Contour Offset");

            checkContourLA = EditorGUILayout.Toggle("Toon Contour Light Affect",checkContourLA);
            targetMat.SetInt("_ToonContourLightAttenuation", Convert.ToInt16(checkContourLA));
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
            EditorGUILayout.HelpBox(gc,true);
        }
        #endregion

        EditorUtility.SetDirty(targetMat);
    }


    void ClearGradient(Gradient grad)
    {
        // Current Gradient Datas Clearing
        if(grad.colorKeys.Length > 0) 
        {
            for(int i = 0; i < grad.colorKeys.Length; i++)
            {
                grad.colorKeys[i].color = Color.white;
                grad.colorKeys[i].time = 0;
            }
        }
        if(grad.alphaKeys.Length > 0)
        {
            for (int i = 0;i < grad.alphaKeys.Length; i++)
            {
                grad.alphaKeys[i].alpha = 0;
                grad.alphaKeys[i].time = 0;
            }
        }
        iGradColors.Clear();
        iGradAlphas.Clear();
    }
    void SetGradient(Material targetMat)
    {
        Texture2D gradientTX = MakeGradient(256, 1, grad);
        targetMat.SetTexture("_RampTexture", gradientTX);
    }
    void RemoveGradientTexture(Material targetMat)
    {
        targetMat.SetTexture("_RampTexture", null);
    }
    void saveGradientVariables(Material targetMat)
    {
        if(!gradControl)
        {
            // Current Gradient Datas
            gradMode = (int)grad.mode;
            GradCLength = grad.colorKeys.Length;
            GradALength = grad.alphaKeys.Length;

            // Saving Gradient Variables from Material
            targetMat.SetInt("_GradMode",gradMode);
            targetMat.SetInt("_GradCLength", GradCLength);
            targetMat.SetInt("_GradALength", GradALength);

            // Saving Gradient Color Keys
            for(int i = 0; i < GradCLength; i++)
            {
                targetMat.SetVector("_CKey" + i , grad.colorKeys[i].color);
                targetMat.SetFloat("_CTime" + i , grad.colorKeys[i].time);
            }

            // Saving Gradient Alpha Keys
            for(int i = 0;i < GradALength; i++)
            {
                targetMat.SetFloat("_AKey" + i , grad.alphaKeys[i].alpha);
                targetMat.SetFloat("_ATime" + i , grad.alphaKeys[i].time);
            }
            gradControl = true;
        }
    }

    void loadMaterialVariables(Material targetMat)
    {
        #region Gradient Initialize
        tempVar = targetMat.GetInt("_CustomRamp");
        checkCustomRamp = tempVar == 1 ? true : false;
        customRampFold = checkCustomRamp;

        tempVar = targetMat.GetInt("_Ramp");
        checkRamp = tempVar == 1 ? true : false;
        rampFold = checkRamp;

        var tempTX = targetMat.GetTexture("_RampTexture");
        if(gradControl)
        {
            RemoveGradientTexture(targetMat);
            ClearGradient(grad);

            // Loading Gradient Variables from Material
            grad.mode = (GradientMode)targetMat.GetInt("_GradMode");
            GradCLength = (int)targetMat.GetInt("_GradCLength");
            GradALength= (int)targetMat.GetInt("_GradALength");
            
            // Creating New Gradient from Material
            for(int i = 0; i < GradCLength; i++)
            {
                iGradColors.Add(new GradientColorKey((Color)targetMat.GetVector("_CKey" + i), targetMat.GetFloat("_CTime" + i)));
            }
            for(int i = 0; i < GradALength; i++)
            {
                iGradAlphas.Add(new GradientAlphaKey(targetMat.GetFloat("_AKey" + i), targetMat.GetFloat("_ATime" + i)));
            }
            grad.SetKeys(iGradColors.ToArray(), iGradAlphas.ToArray());
            gradControl = false;
            SetGradient(targetMat);
            if(targetMat.GetInt("_CustomRamp") == 0)
            {
                if(tempTX != null)
                {
                    targetMat.SetTexture("_RampTexture", tempTX);
                }
                else
                {
                    RemoveGradientTexture(targetMat);
                }
            }
        }
        #endregion

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_BaseSettings");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ToonSpec");
        checkTSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ColoredAmbientToggle");
        checkColoredAmb = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_BlueNoise");
        checkBlueNoise = tempVar == 1 ? true : false;   

        tempVar = targetMat.GetInt("_IndirectLightToggle");
        checkIndirectL = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ToonContour");
        checkContour = tempVar == 1 ? true : false;
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
    private Texture2D MakeGradient(int width, int height, Gradient grd)
    {
        Color[] pix = new Color[width * height];
        for(int i = 0; i < pix.Length; i++)
        {
            pix[i] = grd.Evaluate((1f / width) * i);
        }
        Texture2D result = new Texture2D(width, height);
        result.wrapMode = TextureWrapMode.Clamp;
        result.SetPixels(pix);
        result.Apply();
        return result;
    }
}


/*
        //MaterialProperty srcb = ShaderGUI.FindProperty("_SrcBlend", properties);
        //MaterialProperty dstb = ShaderGUI.FindProperty("_DstBlend", properties);
        //MaterialProperty nono = ShaderGUI.FindProperty("_BlendingList", properties);

        //targetMat.SetInt("_SrcBlend", 5);   // Src Alpha

        //materialEditor.ShaderProperty(srcb,"Source Blend");

        //var chk = new EditorGUI.ChangeCheckScope();
        //if(chk.changed)
        //{
        //    loadMaterialVariables(targetMat);
        //    EditorUtility.SetDirty(targetMat);
        //}

        //GUILayout.BeginVertical();
        //{
        //    base.OnGUI(materialEditor, properties);
        //}
        //GUILayout.EndVertical();

 */
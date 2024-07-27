using UnityEngine;
using UnityEditor;
using System;
using System.Collections.Generic;
using budu;

public class BToonOutlineEditor : ShaderGUI
{
    Gradient grad = new Gradient();
    bool checkCustomRamp, checkRamp, checkTSpec, checkColoredAmb, checkNormal, checkBlueNoise, checkIndirectL, checkContour, checkContourLA, checkOutline, checkBase;
    bool aboutFold, rampFold, customRampFold, tSpecFold, colAmbFold, normalFold, blueNoiseFold, indirectLFold, contourFold, outlineFold;
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
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        #region Main Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        checkBase = EditorGUILayout.ToggleLeft("BASE SETTINGS", checkBase, style);
        targetMat.SetInt("_BaseSettings", Convert.ToInt16(checkBase));
        if(checkBase)
        {

            MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);

            EditorGUILayout.BeginVertical();
            {
                materialEditor.ColorProperty(bc, "Base Color");
                materialEditor.TextureProperty(bt, "Base Map");
            }
            EditorGUILayout.EndVertical();
        }
        EditorGUILayout.Space(1);
        #endregion

        #region Gradient Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkRamp = EditorGUILayout.ToggleLeft("TOON GRADIENT", checkRamp, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkRamp)
                {
                    rampFold = true;
                    targetMat.SetInt("_Ramp", 1);
                }
                else
                {
                    rampFold = false;
                    targetMat.SetInt("_Ramp", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(4);

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(rampFold)
        {
            EditorGUI.BeginChangeCheck();
            checkCustomRamp = EditorGUILayout.Toggle("Custom Ramp", checkCustomRamp);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkCustomRamp)
                {
                    customRampFold = true;
                    targetMat.SetInt("_CustomRamp", 1);
                }
                else
                {
                    customRampFold= false;
                    targetMat.SetInt("_CustomRamp", 0);
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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkTSpec = EditorGUILayout.ToggleLeft("SPECULAR",checkTSpec,style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkTSpec)
                {
                    tSpecFold = true;
                    targetMat.SetInt("_ToonSpec", 1);
                    targetMat.SetInt("_TSpec", 1);
                }
                else
                {
                    tSpecFold = false;
                    targetMat.SetInt("_ToonSpec", 0);
                    targetMat.SetInt("_TSpec", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(tSpecFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty tsi = ShaderGUI.FindProperty("_ToonSpecIntensity", properties);
            MaterialProperty tsmn = ShaderGUI.FindProperty("_ToonSpecMin", properties);
            MaterialProperty tsmx = ShaderGUI.FindProperty("_ToonSpecMax", properties);
            MaterialProperty tsa = ShaderGUI.FindProperty("_ToonSpecArea", properties);

            materialEditor.RangeProperty(tsi, "Specular Intensity");
            materialEditor.RangeProperty(tsmn, "Specular Min");
            materialEditor.RangeProperty(tsmx, "Specular Max");
            materialEditor.RangeProperty(tsa, "Specular Area");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Colored Ambient Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkColoredAmb = EditorGUILayout.ToggleLeft("AMBIENT", checkColoredAmb, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkColoredAmb)
                {
                    colAmbFold = true;
                    targetMat.SetInt("_ColoredAmbientToggle", 1);
                }
                else
                {
                    colAmbFold = false;
                    targetMat.SetInt("_ColoredAmbientToggle", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(colAmbFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty ambc = ShaderGUI.FindProperty("_AmbientColor", properties);
            MaterialProperty ambclmin = ShaderGUI.FindProperty("_AmbientClampMin", properties);
            MaterialProperty ambclmax = ShaderGUI.FindProperty("_AmbientClampMax", properties);

            materialEditor.ColorProperty(ambc, "Ambient Color");
            materialEditor.RangeProperty(ambclmin, "Ambient Clamp Min") ;
            materialEditor.RangeProperty(ambclmax, "Ambient Clamp Max");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkNormal)
                {
                    normalFold = true;
                    targetMat.SetInt("_Normal", 1);
                }
                else
                {
                    normalFold = false;
                    targetMat.SetInt("_Normal", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(normalFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty nmap = ShaderGUI.FindProperty("_NormalMap", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_NormalScale", properties);


            materialEditor.TextureProperty(nmap, "Normal Map");
            materialEditor.RangeProperty(nscl, "Normal Scale");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Toon Smooth Settting
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkBlueNoise = EditorGUILayout.ToggleLeft("TOON SMOOTH", checkBlueNoise, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkBlueNoise)
                {
                    blueNoiseFold = true;
                    targetMat.SetInt("_BlueNoise", 1);
                }
                else
                {
                    blueNoiseFold = false;
                    targetMat.SetInt("_BlueNoise", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(blueNoiseFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty bntxt = ShaderGUI.FindProperty("_BlueNoiseTexture", properties);
            MaterialProperty bnInt = ShaderGUI.FindProperty("_BlueNoiseIntensity", properties);

            materialEditor.TextureProperty(bntxt, "Smooth Pattern");
            materialEditor.RangeProperty(bnInt, "Smooth Intensity");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Indirect Light Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkIndirectL = EditorGUILayout.ToggleLeft("INDIRECT LIGHT", checkIndirectL, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkIndirectL)
                {
                    indirectLFold = true;
                    targetMat.SetInt("_IndirectLightToggle", 1);
                }
                else
                {
                    indirectLFold = false;
                    targetMat.SetInt("_IndirectLightToggle", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(indirectLFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty ilI = ShaderGUI.FindProperty("_IndirectLightIntensity", properties);

            materialEditor.RangeProperty(ilI, "Indirect Light Intensity");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Contour Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkContour = EditorGUILayout.ToggleLeft("CONTOUR", checkContour, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkContour)
                {
                    contourFold = true;
                    targetMat.SetInt("_ToonContour", 1);
                }
                else
                {
                    contourFold = false;
                    targetMat.SetInt("_ToonContour", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(contourFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty tcc = ShaderGUI.FindProperty("_ToonContourColor", properties);
            MaterialProperty tcs = ShaderGUI.FindProperty("_ToonContourScale", properties);
            MaterialProperty tco = ShaderGUI.FindProperty("_ToonContourOffset",properties);

            materialEditor.ColorProperty(tcc, "Toon Contour Color");
            materialEditor.RangeProperty(tcs, "Toon Contour Scale");
            materialEditor.RangeProperty(tco, "Toon Contour Offset");

            EditorGUI.BeginChangeCheck();
            checkContourLA = EditorGUILayout.Toggle("Toon Contour Light Affect",checkContourLA);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkContourLA)
                {
                    targetMat.SetInt("_ToonContourLightAttenuation", 1);
                }
                else
                {
                    targetMat.SetInt("_ToonContourLightAttenuation", 0);
                }
            }

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Outline Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkOutline = EditorGUILayout.ToggleLeft("OUTLINE", checkOutline, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkOutline)
                {
                    outlineFold = true;
                    targetMat.SetInt("_Outline", 1);
                }
                else
                {
                    outlineFold = false;
                    targetMat.SetInt("_Outline", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(outlineFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty oc = ShaderGUI.FindProperty("_OutlineColor", properties);
            MaterialProperty ow = ShaderGUI.FindProperty("_OutlineWidth", properties);
            MaterialProperty dc = ShaderGUI.FindProperty("_DistanceCutoff", properties);

            materialEditor.ColorProperty(oc, "Outline Color");
            materialEditor.RangeProperty(ow, "Outline Width");
            materialEditor.RangeProperty(dc, "Distance Cutoff");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
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

        //Texture piggy = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUPiggy.png", typeof(Texture));
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

        tempVar = targetMat.GetInt("_BaseSettings");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ToonSpec");
        checkTSpec = tempVar == 1 ? true : false;
        tSpecFold = checkTSpec;

        tempVar = targetMat.GetInt("_ColoredAmbientToggle");
        checkColoredAmb = tempVar == 1 ? true : false;
        colAmbFold = checkColoredAmb;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;
        normalFold = checkNormal;

        tempVar = targetMat.GetInt("_BlueNoise");
        checkBlueNoise = tempVar == 1 ? true : false;   
        blueNoiseFold = checkBlueNoise;

        tempVar = targetMat.GetInt("_IndirectLightToggle");
        checkIndirectL = tempVar == 1 ? true : false;
        indirectLFold = checkIndirectL;

        tempVar = targetMat.GetInt("_ToonContour");
        checkContour = tempVar == 1 ? true : false;
        contourFold = checkContour;

        tempVar = targetMat.GetInt("_Outline");
        checkOutline = tempVar == 1 ? true : false;
        outlineFold = checkOutline;


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
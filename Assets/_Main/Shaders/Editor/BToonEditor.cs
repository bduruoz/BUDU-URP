using UnityEngine;
using UnityEditor;
using System;
using System.Collections.Generic;
using budu;

public class BToonEditor : ShaderGUI
{
    Gradient grad = new Gradient();
    bool checkBase, checkDef, checkCustomRamp, checkRamp, checkSpec, checkAmbient, checkNormal, checkStyle, checkContour;
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
        targetMat.SetInt("_Ramp_Toggle", Convert.ToInt16(checkRamp));
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
            MaterialProperty rt = ShaderGUI.FindProperty("_Ramp_Texture", properties);
            MaterialProperty rgamma = ShaderGUI.FindProperty("_Ramp_Gamma_Settings", properties);
            MaterialProperty rc = ShaderGUI.FindProperty("_Ramp_Control", properties);
            MaterialProperty ro = ShaderGUI.FindProperty("_Ramp_Offset", properties);

            if(customRampFold)
            {
                EditorGUI.BeginChangeCheck();
                grad = EditorGUILayout.GradientField("Gradient", grad);
                if(EditorGUI.EndChangeCheck())
                {
                    MaterialProperty rmp = ShaderGUI.FindProperty("_Ramp_Texture", properties);
                    saveGradientVariables(targetMat);
                }
                SetGradient(targetMat);
            }
            else
            {
                materialEditor.ShaderProperty(rt, "Ramp Texture");
            }

            materialEditor.ShaderProperty(rgamma, "Ramp Gamma Settings");
            materialEditor.ShaderProperty(rc, "Ramp Control");
            materialEditor.ShaderProperty(ro, "Ramp Offset");
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
        targetMat.SetInt("_CheckSpec", Convert.ToInt16(checkSpec));
        targetMat.SetInt("_Specular_Toggle", Convert.ToInt16(checkSpec));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty tscol = ShaderGUI.FindProperty("_Specular_Color", properties);
            MaterialProperty tsi = ShaderGUI.FindProperty("_Toon_Spec_Intensity", properties);
            MaterialProperty tsmn = ShaderGUI.FindProperty("_Toon_Spec_Min", properties);
            MaterialProperty tsmx = ShaderGUI.FindProperty("_Toon_Spec_Max", properties);
            MaterialProperty tsa = ShaderGUI.FindProperty("_Toon_Spec_Area", properties);

            materialEditor.ShaderProperty(tsi, "Specular Intensity");
            materialEditor.ShaderProperty(tscol, "Specular Color");
            materialEditor.ShaderProperty(tsa, "Specular Area");
            materialEditor.ShaderProperty(tsmn, "Specular Min");
            materialEditor.ShaderProperty(tsmx, "Specular Max");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkAmbient = EditorGUILayout.ToggleLeft("AMBIENT SETTINGS", checkAmbient, style);
        targetMat.SetInt("_CheckAmbient", Convert.ToInt16(checkAmbient));
        targetMat.SetInt("_Ambient_Toggle", Convert.ToInt16(checkAmbient));
        EditorGUILayout.EndVertical();


        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkAmbient)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ambc = ShaderGUI.FindProperty("_Ambient_Color", properties);
            MaterialProperty ambint = ShaderGUI.FindProperty("_Ambient_Intensity", properties);
            MaterialProperty affShd = ShaderGUI.FindProperty("_Affect_Shade", properties);
            MaterialProperty affNrm = ShaderGUI.FindProperty("_Affect_Normal", properties);
            MaterialProperty ambclmin = ShaderGUI.FindProperty("_Ambient_Clamp_Min", properties);
            MaterialProperty ambclmax = ShaderGUI.FindProperty("_Ambient_Clamp_Max", properties);

            materialEditor.ShaderProperty(ambint, "Ambient Intensity");
            materialEditor.ShaderProperty(ambc, "Ambient Color");
            materialEditor.ShaderProperty(affShd, "Affect Shade");
            materialEditor.ShaderProperty(affNrm, "Affect Normal");
            materialEditor.ShaderProperty(ambclmin, "Ambient Clamp Min");
            materialEditor.ShaderProperty(ambclmax, "Ambient Clamp Max");
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

            MaterialProperty nmap = ShaderGUI.FindProperty("_Normal_Map", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Scale", properties);
            MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Scale_Multiplier", properties);

            materialEditor.ShaderProperty(nmap, "Normal Map");
            materialEditor.ShaderProperty(nscl, "Normal Scale");
            materialEditor.ShaderProperty(nMult, "Normal Scale Multiplier");
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
        checkStyle = EditorGUILayout.ToggleLeft("STYLE SETTINGS", checkStyle, style);
        targetMat.SetInt("_CheckStyle", Convert.ToInt16(checkStyle));
        targetMat.SetInt("_Style_Shade_Toggle", Convert.ToInt16(checkStyle));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkStyle)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bntxt = ShaderGUI.FindProperty("_Style_Shade_Texture", properties);
            MaterialProperty bnInt = ShaderGUI.FindProperty("_Style_Shade_Intensity", properties);
            MaterialProperty bnMult = ShaderGUI.FindProperty("_Style_Shade_Multiplier", properties);

            materialEditor.ShaderProperty(bntxt, "Style Pattern");
            materialEditor.ShaderProperty(bnInt, "Style Intensity");
            materialEditor.ShaderProperty(bnMult, "Style Multiplier");
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
        targetMat.SetInt("_CheckContour", Convert.ToInt16(checkContour));
        targetMat.SetInt("_Contour_Toggle", Convert.ToInt16(checkContour));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkContour)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty tcc = ShaderGUI.FindProperty("_Contour_Color", properties);
            MaterialProperty tcs = ShaderGUI.FindProperty("_Contour_Scale", properties);
            MaterialProperty tco = ShaderGUI.FindProperty("_Contour_Offset", properties);
            MaterialProperty cAffLgh = ShaderGUI.FindProperty("_Contour_Light_Affect", properties);

            materialEditor.ShaderProperty(tcc, "Contour Color");
            materialEditor.ShaderProperty(tcs, "Contour Scale");
            materialEditor.ShaderProperty(tco, "Contour Offset");
            materialEditor.ShaderProperty(cAffLgh, "Contour Light Affect");

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
        targetMat.SetTexture("_Ramp_Texture", gradientTX);
    }
    void RemoveGradientTexture(Material targetMat)
    {
        targetMat.SetTexture("_Ramp_Texture", null);
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

        tempVar = targetMat.GetInt("_Ramp_Toggle");
        checkRamp = tempVar == 1 ? true : false;
        rampFold = checkRamp;

        var tempTX = targetMat.GetTexture("_Ramp_Texture");
        if(checkCustomRamp)
        {
            if(gradControl)
            {
                RemoveGradientTexture(targetMat);
                ClearGradient(grad);

                // Loading Gradient Variables from Material
                grad.mode = (GradientMode)targetMat.GetInt("_GradMode");
                GradCLength = (int)targetMat.GetInt("_GradCLength");
                GradALength = (int)targetMat.GetInt("_GradALength");

                // Creating New Gradient from Material
                for(int i = 0; i < GradCLength; i++)
                {
                    iGradColors.Add(new GradientColorKey((Color)targetMat.GetColor("_CKey" + i), targetMat.GetFloat("_CTime" + i)));
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
                        targetMat.SetTexture("_Ramp_Texture", tempTX);
                    }
                    else
                    {
                        RemoveGradientTexture(targetMat);
                    }
                }
            }
        }
        #endregion

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAmbient");
        checkAmbient = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckStyle");
        checkStyle = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckContour");
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


/* Indirect Light Settings - Eskidi (belki sonra yenisini yaparım
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
*/

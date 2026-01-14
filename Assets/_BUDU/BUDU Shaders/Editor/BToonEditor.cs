// BUDU Games 2023 - 2025
using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using budu;

public class BToonEditor : ShaderGUI
{
    Gradient grad = new Gradient();
    bool checkBase, checkDef, checkCustomRamp, checkRamp, checkSpec, checkAmbient, checkNormal, checkStyle, checkContour;
    bool aboutFold, customRampFold;
    bool gradControl = true;
    int tempVar, gradMode, blendingMode;
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
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUToonTitle.png", 512, 32);
        #endregion

        #region Main Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase",targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if (checkBase)
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
        GUIExtras.SHeader("GRADIENT SETTINGS", ref checkRamp, "_CheckRamp", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if (checkRamp)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rmpTog = ShaderGUI.FindProperty("_Ramp_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(rmpTog, "Ramp");
            }, GUILayout.Height(20));
            if(rmpTog.floatValue > 0)
            {
                MaterialProperty rt = ShaderGUI.FindProperty("_Ramp_Texture", properties);
                MaterialProperty rgamma = ShaderGUI.FindProperty("_Ramp_Gamma_Settings", properties);
                MaterialProperty rc = ShaderGUI.FindProperty("_Ramp_Control", properties);
                MaterialProperty ro = ShaderGUI.FindProperty("_Ramp_Offset", properties);

                MaterialProperty cRamp = ShaderGUI.FindProperty("_CustomRamp", properties);
                materialEditor.ShaderProperty(cRamp, "Custom Ramp");
                customRampFold = cRamp.floatValue == 1 ? true : false;

                if (customRampFold)
                {
                    EditorGUI.BeginChangeCheck();
                    grad = EditorGUILayout.GradientField("Gradient", grad);
                    if (EditorGUI.EndChangeCheck())
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
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        GUIExtras.SHeader("SPECULAR SETTINGS", ref checkSpec, "_CheckSpec", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if (checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty sTog = ShaderGUI.FindProperty("_Specular_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(sTog, "Specular");
            }, GUILayout.Height(20));
            if(sTog.floatValue > 0)
            {
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
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Ambient Settings
        GUIExtras.SHeader("AMBIENT SETTINGS", ref checkAmbient, "_CheckAmbient", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAmbient)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty aTog = ShaderGUI.FindProperty("_Ambient_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(aTog, "Ambient");
            },GUILayout.Height(20));
            if(aTog.floatValue > 0)
            {
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
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ntog = ShaderGUI.FindProperty("_Normal_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(ntog, "Normal");
            }, GUILayout.Height(20));

            if(ntog.floatValue > 0)
            {
                MaterialProperty nmap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Scale", properties);
                MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Scale_Multiplier", properties);

                materialEditor.ShaderProperty(nmap, "Normal Map");
                materialEditor.ShaderProperty(nscl, "Normal Scale");
                materialEditor.ShaderProperty(nMult, "Normal Scale Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Toon Style Settting
        GUIExtras.SHeader("STYLE SETTINGS", ref checkStyle, "_CheckStyle", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkStyle)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty tsTog = ShaderGUI.FindProperty("_Style_Shade_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(tsTog, "Toon Style");
            }, GUILayout.Height(20));
            if(tsTog.floatValue > 0)
            {
                MaterialProperty bntxt = ShaderGUI.FindProperty("_Style_Shade_Texture", properties);
                MaterialProperty bnInt = ShaderGUI.FindProperty("_Style_Shade_Intensity", properties);
                MaterialProperty bnMult = ShaderGUI.FindProperty("_Style_Shade_Multiplier", properties);
                MaterialProperty bnRot = ShaderGUI.FindProperty("_Style_Texture_Rotate", properties);

                materialEditor.ShaderProperty(bntxt, "Style Pattern");
                materialEditor.ShaderProperty(bnInt, "Style Intensity");
                materialEditor.ShaderProperty(bnMult, "Style Multiplier");
                materialEditor.ShaderProperty(bnRot, "Style Rotate");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion
        
        #region Contour Settings
        GUIExtras.SHeader("CONTOUR SETTINGS", ref checkContour, "_CheckContour", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkContour)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ctTog = ShaderGUI.FindProperty("_Contour_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(ctTog, "Contour");
            }, GUILayout.Height(20));
            if(ctTog.floatValue > 0)
            {
                MaterialProperty tcc = ShaderGUI.FindProperty("_Contour_Color", properties);
                MaterialProperty tcs = ShaderGUI.FindProperty("_Contour_Scale", properties);
                MaterialProperty tco = ShaderGUI.FindProperty("_Contour_Offset", properties);
                MaterialProperty cAffLgh = ShaderGUI.FindProperty("_Contour_Light_Affect", properties);

                materialEditor.ShaderProperty(tcc, "Contour Color");
                materialEditor.ShaderProperty(tcs, "Contour Scale");
                materialEditor.ShaderProperty(tco, "Contour Offset");
                materialEditor.ShaderProperty(cAffLgh, "Contour Light Affect");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            false,
            false,
            false,
            false,
            false,
            true,
            true,
            true,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion

        EditorUtility.SetDirty(targetMat);
    }

    void loadMaterialVariables(Material targetMat)
    {
        #region Gradient Initialize
        var tempTX = targetMat.GetTexture("_Ramp_Texture");
        if (checkCustomRamp)
        {
            if (gradControl)
            {
                RemoveGradientTexture(targetMat);
                ClearGradient(grad);

                // Loading Gradient Variables from Material
                grad.mode = (GradientMode)targetMat.GetInt("_GradMode");
                GradCLength = (int)targetMat.GetInt("_GradCLength");
                GradALength = (int)targetMat.GetInt("_GradALength");

                // Creating New Gradient from Material
                for (int i = 0; i < GradCLength; i++)
                {
                    iGradColors.Add(new GradientColorKey((Color)targetMat.GetColor("_CKey" + i), targetMat.GetFloat("_CTime" + i)));
                }
                for (int i = 0; i < GradALength; i++)
                {
                    iGradAlphas.Add(new GradientAlphaKey(targetMat.GetFloat("_AKey" + i), targetMat.GetFloat("_ATime" + i)));
                }
                grad.SetKeys(iGradColors.ToArray(), iGradAlphas.ToArray());
                gradControl = false;
                SetGradient(targetMat);
                if (targetMat.GetInt("_CustomRamp") == 0)
                {
                    if (tempTX != null)
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

        tempVar = targetMat.GetInt("_CheckRamp");
        checkRamp = tempVar == 1 ? true : false;

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

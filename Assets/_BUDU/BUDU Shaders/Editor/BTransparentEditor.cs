// © BUDU Games 2024 - 2026
// BUDU Transparent Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BTransparentEditor : ShaderGUI
{
    bool checkBase, checkDef, checkNormal, checkEmis, checkSpec, checkReflect, checkTrans;
    bool aboutFold, specExtFold;
    int tempVar, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Transparent Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUTransparent.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Base_Texture",properties);
            MaterialProperty bg = ShaderGUI.FindProperty("_Gamma", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");
            materialEditor.ShaderProperty(bg, "Base Map Gamma");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region - Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nt = ShaderGUI.FindProperty("_Normal", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50),20,true, () =>
            {
                materialEditor.ShaderProperty(nt, "Normal");
            });
            if(nt.floatValue > 0)
            {
                MaterialProperty nm = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty ns = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty nmt = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(nm, "Normal Map");
                materialEditor.ShaderProperty(ns, "Strength");
                materialEditor.ShaderProperty(nmt, "Mulriplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Emission Settings
        GUIExtras.SHeader("EMISSION SETTINGS", ref checkEmis, "_CheckEmis", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkEmis)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty et = ShaderGUI.FindProperty("_Emissive", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50),20,true, () =>
            {
                materialEditor.ShaderProperty(et, "Emission");
            });
            if(et.floatValue > 0)
            {
                MaterialProperty ec = ShaderGUI.FindProperty("_Emissive_Color", properties);
                MaterialProperty em = ShaderGUI.FindProperty("_Emissive_Map", properties);
                MaterialProperty eint = ShaderGUI.FindProperty("_Emissive_Intensity", properties);
                MaterialProperty emult = ShaderGUI.FindProperty("_Emissive_Multiplier", properties);

                materialEditor.ShaderProperty(ec, "Color");
                materialEditor.ShaderProperty(em, "Emission Map");
                if (!GUIExtras.IsTextureEmpty(em))
                {
                    MaterialProperty einv = ShaderGUI.FindProperty("_Emissive_Invert", properties);
                    materialEditor.ShaderProperty(einv, "Invert");
                }
                else
                {
                    targetMat.SetInt("_Emissive_Invert", 0);
                }
                    materialEditor.ShaderProperty(eint, "Intensity");
                materialEditor.ShaderProperty(emult, "Multiplier");
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

            MaterialProperty st = ShaderGUI.FindProperty("_Custom_Spec_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(st, "Specular");
            });
            if(st.floatValue > 0)
            {
                MaterialProperty csc = ShaderGUI.FindProperty("_Custom_Specular_Color", properties);
                MaterialProperty csm = ShaderGUI.FindProperty("_Custom_Spec_Map", properties);
                MaterialProperty scInt = ShaderGUI.FindProperty("_Custom_Spec_Intensity", properties);

                materialEditor.ShaderProperty(csc, "Color");
                materialEditor.ShaderProperty(scInt, "Intensity");
                materialEditor.ShaderProperty(csm, "Specular Map");
                if(!GUIExtras.IsTextureEmpty(csm))
                {
                    MaterialProperty scInv = ShaderGUI.FindProperty("_Spec_Map_Invert", properties);
                    materialEditor.ShaderProperty(scInv, "Invert");
                }

                #region Specular Extra Controls
                GUIExtras.Foldout(ref specExtFold, "Specular Controls", BDColors.DarkRed(120), () =>
                {
                    GUIExtras.SColoredVertical(BDColors.Black(20), 20,true,() =>
                    {
                        EditorGUILayout.LabelField("Normal Settings");
                    });

                    MaterialProperty scns = ShaderGUI.FindProperty("_Spec_Normal_Strength", properties);
                    MaterialProperty scnm = ShaderGUI.FindProperty("_Spec_Normal_Multiplier", properties);

                    materialEditor.ShaderProperty(scns, "Normal Strength");
                    materialEditor.ShaderProperty(scnm, "Normal Multiplier");

                    GUIExtras.SColoredVertical(BDColors.Black(20), 20,true,() =>
                    {
                        EditorGUILayout.LabelField("Extra Settings");
                    });

                    MaterialProperty csgm = ShaderGUI.FindProperty("_Spec_Gamma", properties);
                    MaterialProperty csgl = ShaderGUI.FindProperty("_Spec_Glossy", properties);
                    MaterialProperty csso = ShaderGUI.FindProperty("_Spec_Softness", properties);
                    MaterialProperty cssa = ShaderGUI.FindProperty("_Spec_Saturation", properties);
                    MaterialProperty csin = ShaderGUI.FindProperty("_Spec_In", properties);
                    MaterialProperty csout = ShaderGUI.FindProperty("_Spec_Out", properties);

                    ShaderGUIHelpers.FloatSliderFree(materialEditor, csgm, "Gamma", 0, 5);
                    materialEditor.ShaderProperty(csgl, "Glossy");
                    materialEditor.ShaderProperty(csso, "Softness");
                    materialEditor.ShaderProperty(cssa, "Satureation");
                    materialEditor.ShaderProperty(csin, "Specular In");
                    materialEditor.ShaderProperty(csout, "Specular Out");
                });
                #endregion
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        GUIExtras.SHeader("REFLECTION SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty refTog = ShaderGUI.FindProperty("_Reflection_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(refTog, "Reflection");
            });
            if (refTog.floatValue > 0f)
            {
                string[] refTypeOpt = new string[] { "Real Cubemap","Unreal Cubemap"};
                MaterialProperty refType = ShaderGUI.FindProperty("_RefType", properties);
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", refTypeOpt);

                MaterialProperty rfs = ShaderGUI.FindProperty("_Reflection_Strength", properties);
                MaterialProperty rft = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
                MaterialProperty rfcol = ShaderGUI.FindProperty("_Reflection_Color", properties);
                MaterialProperty rftLod = ShaderGUI.FindProperty("_Cubemap_LOD", properties);
                MaterialProperty rfMult = ShaderGUI.FindProperty("_Reflection_Multiplier", properties);
                MaterialProperty rfAffShd = ShaderGUI.FindProperty("_Reflection_Affect_Shade", properties);

                materialEditor.ShaderProperty(rfs, "Strength");
                materialEditor.ShaderProperty(rfMult, "Multiplier");
                materialEditor.ShaderProperty(rfcol, "Color");
                materialEditor.ShaderProperty(rft, "Cubemap");
                materialEditor.ShaderProperty(rftLod, "LOD");
                materialEditor.ShaderProperty(rfAffShd, "Affect Shadow");
                if (rfAffShd.floatValue > 0.0f)
                {
                    MaterialProperty rfShdStr = ShaderGUI.FindProperty("_Reflection_Shade_Strength", properties);
                    materialEditor.ShaderProperty(rfShdStr, "Shade Strength");
                }

                MaterialProperty rfNormStr = ShaderGUI.FindProperty("_Ref_Normal_Strength", properties);
                materialEditor.ShaderProperty(rfNormStr, "Reflection Normal Strength");

                #region Cubemap Settings
                GUIExtras.SFoldout(targetMat, "_CubemapFold", "Cubemap Controls", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                {
                    MaterialProperty cmrx = ShaderGUI.FindProperty("_Cubemap_Rotate_X", properties);
                    MaterialProperty cmry = ShaderGUI.FindProperty("_Cubemap_Rotate_Y", properties);
                    MaterialProperty cmrz = ShaderGUI.FindProperty("_Cubemap_Rotate_Z", properties);
                    MaterialProperty cmsx = ShaderGUI.FindProperty("_Cubemap_Stretch_X", properties);
                    MaterialProperty cmsy = ShaderGUI.FindProperty("_Cubemap_Stretch_Y", properties);
                    MaterialProperty cmsz = ShaderGUI.FindProperty("_Cubemap_Stretch_Z", properties);
                    MaterialProperty cmx = ShaderGUI.FindProperty("_Cubemap_Pos_X", properties);
                    MaterialProperty cmy = ShaderGUI.FindProperty("_Cubemap_Pos_Y", properties);
                    MaterialProperty cmz = ShaderGUI.FindProperty("_Cubemap_Pos_Z", properties);

                    materialEditor.ShaderProperty(cmrx, "Rotate X");
                    materialEditor.ShaderProperty(cmry, "Rotate Y");
                    materialEditor.ShaderProperty(cmrz, "Rotate Z");
                    EditorGUIHelper.Separator();
                    materialEditor.ShaderProperty(cmsx, "Stretch X");
                    materialEditor.ShaderProperty(cmsy, "Stretch Y");
                    materialEditor.ShaderProperty(cmsz, "Stretch Z");
                    EditorGUIHelper.Separator();
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmx, "Position X", -1f, 1f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmy, "Position Y", -1f, 1f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, cmz, "Position Z", -1f, 1f);
                });
                #endregion

                #region Reflection Fresnel Settings
                GUIExtras.SFoldout(targetMat, "_FresnelFold", "Fresnel Control", BDColors.DarkRed(180), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                {
                    MaterialProperty refFresTog = ShaderGUI.FindProperty("_Ref_Fresnel_Toggle", properties);
                    MaterialProperty refFresInv = ShaderGUI.FindProperty("_Ref_Fresnel_Invert", properties);
                    MaterialProperty refFresGam = ShaderGUI.FindProperty("_Ref_Fresnel_Gamma", properties);
                    MaterialProperty refFresCont = ShaderGUI.FindProperty("_Ref_Fresnel_Contrast", properties);
                    MaterialProperty refFresContP = ShaderGUI.FindProperty("_Ref_Fresnel_Contrast_Pivot", properties);
                    MaterialProperty refFresBias = ShaderGUI.FindProperty("_Ref_Fresnel_Bias", properties);
                    MaterialProperty refFresScale = ShaderGUI.FindProperty("_Ref_Fresnel_Scale", properties);
                    MaterialProperty refFresPower = ShaderGUI.FindProperty("_Ref_Fresnel_Power", properties);

                    materialEditor.ShaderProperty(refFresTog, "Fresnel");
                    if (refFresTog.floatValue > 0f)
                    {
                        materialEditor.ShaderProperty(refFresInv, "Invert");
                        materialEditor.ShaderProperty(refFresGam, "Gamma");
                        ShaderGUIHelpers.FloatSliderFree(materialEditor, refFresCont, "Contrast", 0f, 5f);
                        materialEditor.ShaderProperty(refFresContP, "Contrast Pivot");
                        materialEditor.ShaderProperty(refFresBias, "Bias");
                        materialEditor.ShaderProperty(refFresScale, "Scale");
                        materialEditor.ShaderProperty(refFresPower, "Power");
                    }
                });
                #endregion

            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Transparent Settings
        GUIExtras.SHeader("TRANSPARENT SETTINGS", ref checkTrans, "_CheckTrans", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkTrans)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.BeginVertical();
            {
                MaterialProperty transtog = ShaderGUI.FindProperty("_Transparent_Toggle", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(transtog, "Transparent");
                });
                if (transtog.floatValue > 0f)
                {
                    MaterialProperty trStr = ShaderGUI.FindProperty("_Opacity", properties);
                    MaterialProperty trTxt = ShaderGUI.FindProperty("_Transparent_Map", properties);
                    materialEditor.ShaderProperty(trStr, "Strength");
                    materialEditor.ShaderProperty(trTxt, "Transparent Map");

                    if (!GUIExtras.IsTextureEmpty(trTxt))
                    {
                        MaterialProperty trChan = ShaderGUI.FindProperty("_Channel_Select", properties);
                        string[] trChanOpt = new string[] { "Red", "Green", "Blue", "Alpha", "Luma" };
                        ShaderGUIHelpers.EnumPopupProperty(materialEditor, trChan, "Channel", trChanOpt);

                        MaterialProperty trInvert = ShaderGUI.FindProperty("_Transparent_Invert", properties);
                        materialEditor.ShaderProperty(trInvert, "Invert");
                    }
                    else
                    {
                        // Texture Slot is Empty
                        targetMat.SetInt("_Transparent_Invert", 0);
                    }
                    MaterialProperty trGamma = ShaderGUI.FindProperty("_TR_Texture_Gamma", properties);
                    MaterialProperty trCont = ShaderGUI.FindProperty("_TR_Texture_Contrast", properties);
                    MaterialProperty trContP = ShaderGUI.FindProperty("_TR_Texture_Contrast_Pivot", properties);
                    MaterialProperty trBias = ShaderGUI.FindProperty("_Transparent_Bias", properties);
                    MaterialProperty trScale = ShaderGUI.FindProperty("_Transparent_Scale", properties);

                    ShaderGUIHelpers.FloatSliderFree(materialEditor, trGamma, "Gamma", 0f, 5f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, trCont, "Contrast", 0f, 5f);
                    materialEditor.ShaderProperty(trContP, "Contrast Pivot");
                    materialEditor.ShaderProperty(trBias, "Bias");
                    materialEditor.ShaderProperty(trScale, "Scale");


                    #region Transparent Fresnel Settings
                    GUIExtras.SFoldout(targetMat, "_TrFresnelFold", "Fresnel Control", BDColors.DarkRed(180), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                    {
                        MaterialProperty trFresTog = ShaderGUI.FindProperty("_TR_Fresnel_Toggle", properties);
                        MaterialProperty trFresInv = ShaderGUI.FindProperty("_TR_Fresnel_Invert", properties);
                        MaterialProperty trFresGam = ShaderGUI.FindProperty("_TR_Fresnel_Gamma", properties);
                        MaterialProperty trFresCont = ShaderGUI.FindProperty("_TR_Fresnel_Contrast", properties);
                        MaterialProperty trFresContP = ShaderGUI.FindProperty("_TR_Fresnel_Contrast_Pivot", properties);
                        MaterialProperty trFresBias = ShaderGUI.FindProperty("_TR_Fresnel_Bias", properties);
                        MaterialProperty trFresScale = ShaderGUI.FindProperty("_TR_Fresnel_Scale", properties);
                        MaterialProperty trFresPower = ShaderGUI.FindProperty("_TR_Fresnel_Power", properties);

                        materialEditor.ShaderProperty(trFresTog, "Fresnel");
                        if (trFresTog.floatValue > 0f)
                        {
                            materialEditor.ShaderProperty(trFresInv, "Invert");
                            materialEditor.ShaderProperty(trFresGam, "Gamma");
                            ShaderGUIHelpers.FloatSliderFree(materialEditor, trFresCont, "Contrast", 0f, 5f, 50f);
                            materialEditor.ShaderProperty(trFresContP, "Contrast Pivot");
                            materialEditor.ShaderProperty(trFresBias, "Bias");
                            materialEditor.ShaderProperty(trFresScale, "Scale");
                            materialEditor.ShaderProperty(trFresPower, "Power");
                        }
                    });
                    #endregion
                }

            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);

        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            true,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckEmis");
        checkEmis = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckTrans");
        checkTrans = tempVar == 1 ? true : false;
    }
}



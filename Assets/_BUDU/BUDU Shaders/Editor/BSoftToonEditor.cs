// BUDU Games 2023 - 2025
using budu;
using UnityEditor;
using UnityEditor.Rendering;
using UnityEngine;

public class BSoftToonEditor : ShaderGUI
{
    bool checkBase, checkDef, checkShade, checkSpec, checkNormal, checkRim, checkReflect;
    bool aboutFold, shadeExtFold, specExtFold, cubemapFold, fresnelFold;
    int tempVar, TextureBlendType, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);
        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUSoftToonTitle.png", 512, 32);
        #endregion

        #region Main Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty bc = ShaderGUI.FindProperty("_Base_Color", properties);
            MaterialProperty bt = ShaderGUI.FindProperty("_Base_Map", properties);
            MaterialProperty btb = ShaderGUI.FindProperty("_TextureBlendType", properties);
            MaterialProperty btgam = ShaderGUI.FindProperty("_Base_Map_Gamma", properties);
            MaterialProperty avfe = ShaderGUI.FindProperty("_Average_Features", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bt, "Base Map");
            string[] txtBlendOpt = new string[] { "Multiply", "Additive", "Overlay" };
            ShaderGUIHelpers.EnumPopupProperty(materialEditor, btb, "Texture Blend Type", txtBlendOpt);

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
        GUIExtras.SHeader("SHADING SETTINGS", ref checkShade, "_CheckShade", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkShade)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty shadTog = ShaderGUI.FindProperty("_Shading_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(shadTog, "Shade Feature");
            }, GUILayout.Height(20));
            if(shadTog.floatValue > 0.0f)
            {
                MaterialProperty shCol = ShaderGUI.FindProperty("_Shade_Color", properties);
                MaterialProperty shCntr = ShaderGUI.FindProperty("_Shading_Contribution", properties);
                MaterialProperty shInt = ShaderGUI.FindProperty("_Shading_Intensity", properties);
                MaterialProperty shFCont = ShaderGUI.FindProperty("_Full_Shade_Contrast", properties);
                MaterialProperty shFContP = ShaderGUI.FindProperty("_Full_Shade_Contrast_Pivot", properties);
                MaterialProperty shOff = ShaderGUI.FindProperty("_Shading_Offset", properties);
                MaterialProperty shSaturate = ShaderGUI.FindProperty("_Shading_Saturate", properties);

                materialEditor.ShaderProperty(shCol, "Color");
                materialEditor.ShaderProperty(shInt, "Intensity");
                materialEditor.ShaderProperty(shCntr, "Contribution");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, shFCont, "Full Contrast", 0f, 5f);
                materialEditor.ShaderProperty(shFContP, "Full Contrast Pivot");
                materialEditor.ShaderProperty(shOff, "Offset");
                materialEditor.ShaderProperty(shSaturate, "Saturate");

                #region Shade Extra Controls
                GUIExtras.SFoldout(targetMat, "_ShadeExtFold", "Shade Extra Controls", BDColors.DarkRed(120), () =>
                {
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Normal Settings");
                    });
                    MaterialProperty shNrmStr = ShaderGUI.FindProperty("_Shading_Normal_Strength", properties);
                    MaterialProperty shNrmRCont = ShaderGUI.FindProperty("_Normal_Result_Contrast", properties);
                    MaterialProperty shNrmRContP = ShaderGUI.FindProperty("_Normal_Result_Contrast_Pivot", properties);

                    materialEditor.ShaderProperty(shNrmStr, "Normal Strength");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, shNrmRCont, "Normal Result Contrast", 0f, 5f);
                    materialEditor.ShaderProperty(shNrmRContP, "Normal Result Contrast Pivot");

                    MaterialProperty shAffBaseTxt = ShaderGUI.FindProperty("_Shading_Affect_Base_Map", properties);
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        materialEditor.ShaderProperty(shAffBaseTxt, "Affect Base Texture");
                    });
                    if(shAffBaseTxt.floatValue > 0f)
                    {
                        MaterialProperty shColTxt = ShaderGUI.FindProperty("_Shading_Colored_Texture", properties);
                        MaterialProperty TxtOverCol = ShaderGUI.FindProperty("_Texture_Over_Color", properties);
                        MaterialProperty bsMapInt = ShaderGUI.FindProperty("_Base_Map_Intensity", properties);
                        MaterialProperty bsMapMult = ShaderGUI.FindProperty("_Base_Map_Multiplier", properties);
                        MaterialProperty bsShrp = ShaderGUI.FindProperty("_Base_Sharpness", properties);
                        MaterialProperty bsOff = ShaderGUI.FindProperty("_Base_Offset",properties);

                        materialEditor.ShaderProperty(shColTxt, "Use Texture Color");
                        materialEditor.ShaderProperty(TxtOverCol, "Texture Over Color");
                        materialEditor.ShaderProperty(bsMapInt, "Base Map Intensity");
                        materialEditor.ShaderProperty(bsMapMult, "Base Map Multiplier");
                        materialEditor.ShaderProperty(bsShrp, "Base Sharpness");
                        materialEditor.ShaderProperty(bsOff, "Base Offset");
                    }
                });
                #endregion
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        GUIExtras.SHeader("SPECULAR SETTINGS", ref checkSpec, "_CheckSpecular", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkSpec)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty specTog = ShaderGUI.FindProperty("_Spec_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(specTog, "Specular Feature");
            },GUILayout.Height(20));
            if(specTog.floatValue > 0.0f)
            {
                MaterialProperty spcol = ShaderGUI.FindProperty("_Spec_Color", properties);
                MaterialProperty spInt = ShaderGUI.FindProperty("_Spec_Intensity", properties);
                MaterialProperty spTxt = ShaderGUI.FindProperty("_Spec_Map", properties);

                materialEditor.ShaderProperty(spcol, "Color");
                materialEditor.ShaderProperty(spTxt, "Specular Map");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, spInt, "Intensity", 0, 5);
                if (!GUIExtras.IsTextureEmpty(spTxt))
                {
                    MaterialProperty spInv = ShaderGUI.FindProperty("_Spec_Map_Invert", properties);
                    materialEditor.ShaderProperty(spInv, "Map Invert");
                }

                #region Extra Specular Controls
                GUIExtras.SFoldout(targetMat, "_SpecExtFold", "Specular Extra Controls", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty spNormStr = ShaderGUI.FindProperty("_Spec_Normal_Strength", properties);
                    MaterialProperty spNormMult = ShaderGUI.FindProperty("_Spec_Normal_Multiplier", properties);
                    MaterialProperty lgGam = ShaderGUI.FindProperty("_Spec_Gamma", properties);
                    MaterialProperty spGls = ShaderGUI.FindProperty("_Spec_Glossy", properties);
                    MaterialProperty spSmt = ShaderGUI.FindProperty("_Spec_Softness", properties);
                    MaterialProperty spSat = ShaderGUI.FindProperty("_Spec_Saturation", properties);
                    MaterialProperty spIn = ShaderGUI.FindProperty("_Spec_In", properties);
                    MaterialProperty spOut = ShaderGUI.FindProperty("_Spec_Out", properties);

                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Normal Settings");
                    });
                    materialEditor.ShaderProperty(spNormStr, "Normal Strength");
                    materialEditor.ShaderProperty(spNormMult, "Normal Multiplier");
                    GUIExtras.ColoredVertical(BDColors.Black(20), () =>
                    {
                        EditorGUILayout.LabelField("Blinn Settings");
                    });
                    materialEditor.ShaderProperty(lgGam, "Gamma");
                    materialEditor.ShaderProperty(spGls, "Glossy");
                    materialEditor.ShaderProperty(spSat, "Saturation");
                    materialEditor.ShaderProperty(spSmt, "Softness");
                    materialEditor.ShaderProperty(spIn, "In");
                    materialEditor.ShaderProperty(spOut, "Out");

                    EditorGUIHelper.Separator(3, color: BDColors.Black() * 0.2f);
                });
                #endregion
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

            MaterialProperty nTog = ShaderGUI.FindProperty("_Normal_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(nTog, "Normal");
            },GUILayout.Height(20));
            if(nTog.floatValue > 0.0f)
            {
                MaterialProperty nMap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty nScl = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty nMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.TextureProperty(nMap, "Normal Map");
                materialEditor.RangeProperty(nScl, "Normal Strength");
                materialEditor.RangeProperty(nMult, "Normal Multiplier");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Settings
        GUIExtras.SHeader("RIM SETTINGS", ref checkRim, "_CheckRim", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty RimTog = ShaderGUI.FindProperty("_Rim_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(RimTog, "Rim Feature");
            });
            if(RimTog.floatValue > 0f)
            {
                MaterialProperty rinv = ShaderGUI.FindProperty("_Rim_Invert", properties);
                MaterialProperty rint = ShaderGUI.FindProperty("_Rim_Intensity", properties);
                MaterialProperty rcol = ShaderGUI.FindProperty("_Rim_Color", properties);
                MaterialProperty rcont = ShaderGUI.FindProperty("_Rim_Contrast", properties);
                MaterialProperty rcontp = ShaderGUI.FindProperty("_Rim_Contrast_Pivot", properties);
                MaterialProperty rgma = ShaderGUI.FindProperty("_Rim_Gamma", properties);
                MaterialProperty rb = ShaderGUI.FindProperty("_Rim_Bias", properties);
                MaterialProperty rs = ShaderGUI.FindProperty("_Rim_Power", properties);
                MaterialProperty rp = ShaderGUI.FindProperty("_Rim_Scale", properties);

                materialEditor.ShaderProperty(rinv, "Invert");
                materialEditor.ShaderProperty(rint, "Intensity");
                materialEditor.ShaderProperty(rcol, "Color");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, rgma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, rcont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(rcontp, "Contrast Pivot");
                materialEditor.ShaderProperty(rb, "Bias");
                materialEditor.ShaderProperty(rs, "Scale");
                materialEditor.ShaderProperty(rp, "Power");

                MaterialProperty rNormStr = ShaderGUI.FindProperty("_Rim_Normal_Strength", properties);
                MaterialProperty rNormMult = ShaderGUI.FindProperty("_Rim_Normal_Multiplier", properties);
                materialEditor.ShaderProperty(rNormStr, "Normal Strength");
                materialEditor.ShaderProperty(rNormMult, "Normal Multiplier");

                MaterialProperty rAT = ShaderGUI.FindProperty("_Affect_Base_Texture", properties);
                materialEditor.ShaderProperty(rAT, "Affect Base Texture");
                if(rAT.floatValue > 0.0f)
                {
                    MaterialProperty rTBlend = ShaderGUI.FindProperty("_Base_Texture_Blend_Mode", properties);
                    string[] blOpt = new string[] { "Multiply", "Add", "SoftLight" };
                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, rTBlend, "Blend Mode", blOpt);

                    MaterialProperty rMapMult = ShaderGUI.FindProperty("_Map_Multiplier", properties);
                    materialEditor.ShaderProperty(rMapMult, "Map Multiplier");
                }

            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Reflection Settings
        GUIExtras.SHeader("REFLECTION SETTINGS", ref checkReflect, "_CheckReflect", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkReflect)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty refTog = ShaderGUI.FindProperty("_Reflection_Toggle",properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(refTog, "Reflection");
            });
            if(refTog.floatValue > 0f)
            {
                string[] refTypeOpt = new string[] { "Real Cubemap", "Unreal Cubemap" };
                MaterialProperty refType = ShaderGUI.FindProperty("_RefType", properties);
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", refTypeOpt);

                MaterialProperty rfs = ShaderGUI.FindProperty("_Reflection_Strength", properties);
                MaterialProperty rft = ShaderGUI.FindProperty("_Reflection_Cubemap", properties);
                MaterialProperty rfcol = ShaderGUI.FindProperty("_Reflection_Color", properties);
                MaterialProperty rftLod = ShaderGUI.FindProperty("_CubeMap_LOD", properties);
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
                GUIExtras.SFoldout(targetMat, "_CubemapFold", "Cubemap Controls", BDColors.DarkRed(120), () =>
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
                GUIExtras.SFoldout(targetMat, "_FresnelFold", "Fresnel Control", BDColors.DarkRed(180), () =>
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

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, true, false, false, false, false, true, true, true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShade");
        checkShade = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShadeExtFold");
        shadeExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpecular");
        checkSpec = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SpecExtFold");
        specExtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRim");
        checkRim = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckReflect");
        checkReflect = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CubemapFold");
        cubemapFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelFold");
        fresnelFold = tempVar == 1 ? true : false;

        TextureBlendType = targetMat.GetInt("_TextureBlendType");
    }
}

using UnityEngine;
using UnityEditor;
using System;
using budu;
using TMPro;
using Unity.VisualScripting;

public class BVolumetricCloudEditor : ShaderGUI
{
    bool checkAlphaClip, checkDef, checkBaseGroup, checkCloud, checkWind, checkLight, checkDetail;
    bool alphaFold, alphaClipFold, aboutFold, cameraRayFold, lightRayFold;
    int tempVar, tempRQ;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Volumetric Cloud Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUVolumeCloudTitle.png", typeof(Texture));

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
        checkBaseGroup = EditorGUILayout.ToggleLeft("BASE SETTINGS",checkBaseGroup,style);
        targetMat.SetInt("_BaseSettings", Convert.ToInt16(checkBaseGroup));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBaseGroup)
        {
            style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

            MaterialProperty baseCol = ShaderGUI.FindProperty("_BaseColor", properties);
            MaterialProperty shadeCol = ShaderGUI.FindProperty("_ShadeColor", properties);
            MaterialProperty opacity = ShaderGUI.FindProperty("_Opacity", properties);
            MaterialProperty alpClipTog = ShaderGUI.FindProperty("_AlphaClip",properties);
            MaterialProperty shdClipTog = ShaderGUI.FindProperty("_ShadowClip", properties);
            MaterialProperty alpClip = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);
            MaterialProperty coverage = ShaderGUI.FindProperty("_Coverage", properties);
            MaterialProperty shdClip = ShaderGUI.FindProperty("_ShadowClipThreshold", properties);

            EditorGUILayout.BeginVertical();
            {
                EditorGUI.indentLevel++;
                materialEditor.ShaderProperty(baseCol, "Base Color");
                materialEditor.ShaderProperty(shadeCol, "Shade Color");
                materialEditor.ShaderProperty(opacity, "Opacity");
                materialEditor.ShaderProperty(coverage, "Alpha Coverage");
                materialEditor.ShaderProperty(alpClipTog, "Alpha Clip");
                if(alpClipTog.floatValue > 0f)
                {
                    materialEditor.ShaderProperty(alpClip, "Alpha Clip Threshold");
                }
                materialEditor.ShaderProperty(shdClipTog, "Shadow Clip");
                if (shdClipTog.floatValue > 0f)
                {
                    materialEditor.ShaderProperty(shdClip, "Shadow Clip Threshold");
                }
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Light Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkLight = EditorGUILayout.ToggleLeft("LIGHT SETTINS", checkLight, style);
        targetMat.SetInt("_checkLight", Convert.ToInt16(checkLight));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkLight)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty affLight = ShaderGUI.FindProperty("_AffectLightColor", properties);
            MaterialProperty affAmb = ShaderGUI.FindProperty("_AffectAmbientColor", properties);
            MaterialProperty lgInt = ShaderGUI.FindProperty("_LightAreaIntensity", properties);
            MaterialProperty lgOffset = ShaderGUI.FindProperty("_LightAreaOffset", properties);
            MaterialProperty LightExponential = ShaderGUI.FindProperty("_Exponential", properties);

            materialEditor.ShaderProperty(affLight, "Affect Light Color");
            materialEditor.ShaderProperty(affAmb, "Affectb Ambient Color");
            materialEditor.ShaderProperty(lgInt, "Cloud Light Area Intensity");
            materialEditor.ShaderProperty(lgOffset, "Cloud Light Area Offset");
            materialEditor.ShaderProperty(LightExponential, "Cloud Light Area Exponential");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Cloud Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkCloud = EditorGUILayout.ToggleLeft("CLOUD SETTINGS", checkCloud, style);
        targetMat.SetInt("_checkCloud", Convert.ToInt16(checkCloud));
        EditorGUILayout.EndVertical();
        
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkCloud)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty volTxt = ShaderGUI.FindProperty("_VolumetricTexture", properties);
            MaterialProperty TxtGrade = ShaderGUI.FindProperty("_GradeType", properties);

            materialEditor.ShaderProperty(TxtGrade, "Texture Grade Type");
            materialEditor.ShaderProperty(volTxt, "Volume Texture");

            #region Camera Ray Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            cameraRayFold = EditorGUILayout.Foldout(cameraRayFold, "View Ray Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_cameraRayFold", Convert.ToInt16(cameraRayFold));
            if(cameraRayFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty noSteps = ShaderGUI.FindProperty("_NumberOfSteps", properties);
                MaterialProperty stepSize = ShaderGUI.FindProperty("_StepSize", properties);
                MaterialProperty densityScale = ShaderGUI.FindProperty("_DensityScale", properties);
                materialEditor.ShaderProperty(noSteps, "Number Of Steps");
                materialEditor.ShaderProperty(stepSize, "Step Size");
                materialEditor.ShaderProperty(densityScale, "Density Scale");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

            #region Light Ray Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            EditorGUILayout.BeginVertical(style);
            lightRayFold = EditorGUILayout.Foldout(lightRayFold, "Light Ray Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_lightRayFold", Convert.ToInt16(lightRayFold));
            if(lightRayFold)
            {
                EditorGUI.indentLevel++;
                MaterialProperty lNoSteps = ShaderGUI.FindProperty("_NumberOfLightSteps", properties);
                MaterialProperty lStepSize = ShaderGUI.FindProperty("_LightStepSize", properties);
                MaterialProperty lAbsorb = ShaderGUI.FindProperty("_LightAbsorb", properties);
                MaterialProperty darkThreshold = ShaderGUI.FindProperty("_DarknessThreshold", properties);
                MaterialProperty transmittance = ShaderGUI.FindProperty("_Transmittance", properties);

                materialEditor.ShaderProperty(lNoSteps, "Number Of Light Steps");
                materialEditor.ShaderProperty(lStepSize, "Light Step Size");
                materialEditor.ShaderProperty(lAbsorb, "Light Absorb");
                materialEditor.ShaderProperty(darkThreshold, "Darkness Threshold");
                materialEditor.ShaderProperty(transmittance, "Transmittance");
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Wind Noise Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);
        checkWind = EditorGUILayout.ToggleLeft("WIND SETTINGS", checkWind, style);
        targetMat.SetInt("_checkWind", Convert.ToInt16(checkWind));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkWind)
        {
            #region Wind Settings
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty windTog = ShaderGUI.FindProperty("_WindToggle", properties);

            materialEditor.ShaderProperty(windTog, "Wind");

            if(windTog.floatValue > 0f)
            {
                MaterialProperty affWind = ShaderGUI.FindProperty("_AffectWind", properties);
                materialEditor.ShaderProperty(affWind, "Affect Wind");

                MaterialProperty noiseType = ShaderGUI.FindProperty("_NoiseType", properties);
                MaterialProperty InvertNoise = ShaderGUI.FindProperty("_InvertNoise", properties);
                MaterialProperty NoiseBlType = ShaderGUI.FindProperty("_NoiseBlendType", properties);
                materialEditor.ShaderProperty(noiseType, "Noise Type");
                materialEditor.ShaderProperty(InvertNoise, "Invert Noise");
                materialEditor.ShaderProperty(NoiseBlType, "Noise Blend Type");

                switch((int)noiseType.floatValue)
                {
                    #region Voronoi
                    case 0:
                        MaterialProperty noScale = ShaderGUI.FindProperty("_NoiseScale", properties);
                        MaterialProperty vorAngle = ShaderGUI.FindProperty("_Angle", properties);
                        MaterialProperty vorSmooth = ShaderGUI.FindProperty("_SmoothVor", properties);

                        materialEditor.ShaderProperty(noScale, "Noise Scale");
                        materialEditor.ShaderProperty(vorAngle, "Voronoi Angle");
                        materialEditor.ShaderProperty(vorSmooth, "Voronoi Smooth");
                        break;
                    #endregion
                    #region Perlin
                    case 1:
                        MaterialProperty noScaleP = ShaderGUI.FindProperty("_NoiseScale", properties);

                        materialEditor.ShaderProperty(noScaleP, "Noise Scale");
                        break;
                    #endregion
                    #region Texture
                    case 2:
                        MaterialProperty nTxt = ShaderGUI.FindProperty("_WindNoiseTexture", properties);
                        materialEditor.ShaderProperty(nTxt, "Wind Noise Texture");

                        break;
                    #endregion
                }

                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
                EditorGUILayout.BeginVertical(style);
                NoiseTxtSet(materialEditor, properties);
                EditorGUILayout.EndVertical();

                #region Deform Settings
                MaterialProperty deformTog = ShaderGUI.FindProperty("_Deform", properties);
                materialEditor.ShaderProperty(deformTog, "Deformation");
                if(deformTog.floatValue > 0)
                {
                    EditorGUI.indentLevel++;
                    EditorGUILayout.Space(2);

                    MaterialProperty deformIntensity = ShaderGUI.FindProperty("_DeformIntensity", properties);
                    MaterialProperty deformInv = ShaderGUI.FindProperty("_InvertDeform", properties);
                    MaterialProperty deformNoType = ShaderGUI.FindProperty("_DeformNoiseType", properties);

                    materialEditor.ShaderProperty(deformIntensity, "Deform Intensity");
                    materialEditor.ShaderProperty(deformInv, "Invert Deform");
                    materialEditor.ShaderProperty(deformNoType, "Deform Type");

                    switch((int)deformNoType.floatValue)
                    {
                        #region Voronoi
                        case 0:
                            MaterialProperty dnoScale = ShaderGUI.FindProperty("_DeformNoiseScale", properties);
                            MaterialProperty dvorAngle = ShaderGUI.FindProperty("_DeformVorAngle", properties);
                            MaterialProperty dvorSmooth = ShaderGUI.FindProperty("_DeformVorSmooth", properties);

                            materialEditor.ShaderProperty(dnoScale, "Deform Scale");
                            materialEditor.ShaderProperty(dvorAngle, "Voronoi Angle");
                            materialEditor.ShaderProperty(dvorSmooth, "Voronoi Smooth");
                            break;
                        #endregion
                        #region Perlin
                        case 1:
                            MaterialProperty dnoScaleP = ShaderGUI.FindProperty("_DeformNoiseScale", properties);

                            materialEditor.ShaderProperty(dnoScaleP, "Noise Scale");
                            break;
                        #endregion
                        #region Texture
                        case 2:
                            MaterialProperty dnTxt = ShaderGUI.FindProperty("_DeformNoiseTexture", properties);
                            materialEditor.ShaderProperty(dnTxt, "Deform Noise Texture");
                            break;
                        #endregion
                    }

                    style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
                    EditorGUILayout.BeginVertical(style);
                    DeformTxtSet(materialEditor, properties);
                    EditorGUILayout.EndVertical();


                    EditorGUI.indentLevel--;
                }
                #endregion
            }
            #endregion

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Detail Texture Settings

        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkDetail = EditorGUILayout.ToggleLeft("DETAIL TEXTURE SETTINGS", checkDetail, style);
        targetMat.SetInt("_checkDetail", Convert.ToInt16(checkDetail));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDetail)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty lareadet = ShaderGUI.FindProperty("_LightAreaDetails", properties);
            MaterialProperty aareadet = ShaderGUI.FindProperty("_AmbientDetails", properties);

            materialEditor.ShaderProperty(lareadet, "Lighten Area Details");

            if(lareadet.floatValue > 0.0f)
            {
                EditorGUI.indentLevel++;

                MaterialProperty lareaInt = ShaderGUI.FindProperty("_SurfaceTextureIntensity", properties);
                materialEditor.ShaderProperty(lareaInt, "Lighten Area Intensity");

                EditorGUI.indentLevel--;
            }

            materialEditor.ShaderProperty(aareadet, "Darken Area Details");

            if(aareadet.floatValue > 0.0f)
            {
                EditorGUI.indentLevel++;

                MaterialProperty aareaInt = ShaderGUI.FindProperty("_AmbientTextureIntensity", properties);
                materialEditor.ShaderProperty(aareaInt, "Darken Area Intensity");

                EditorGUI.indentLevel--;
            }

            if(lareadet.floatValue > 0.0f || aareadet.floatValue > 0.0f)
            {
                MaterialProperty detailColor = ShaderGUI.FindProperty("_DetailColor", properties);
                MaterialProperty detxtgrType = ShaderGUI.FindProperty("_DetTXTGradeType", properties);
                MaterialProperty detailTXTA = ShaderGUI.FindProperty("_DetailTextureA", properties);
                MaterialProperty detailTXTB = ShaderGUI.FindProperty("_DetailTextureB", properties);
                MaterialProperty blendType = ShaderGUI.FindProperty("_DetailBlendMethod", properties);

                MaterialProperty typeA = ShaderGUI.FindProperty("_TypeA", properties);
                MaterialProperty typeB = ShaderGUI.FindProperty("_TypeB", properties);

                MaterialProperty smmin = ShaderGUI.FindProperty("_SmoothMin", properties);
                MaterialProperty smmax = ShaderGUI.FindProperty("_SmoothMax", properties);
                MaterialProperty backCont = ShaderGUI.FindProperty("_BackContrast", properties);
                MaterialProperty backExp = ShaderGUI.FindProperty("_BackExponent", properties);
                MaterialProperty lerpCoef = ShaderGUI.FindProperty("_LerpCoef", properties);

                materialEditor.ShaderProperty(detailColor, "Detail Texture Color");
                materialEditor.ShaderProperty(blendType, "Detail Blend Method");

                materialEditor.ShaderProperty(backCont, "Back Contrast");
                materialEditor.ShaderProperty(backExp, "Back Exponential");
                materialEditor.ShaderProperty(smmin, "Smooth Min");
                materialEditor.ShaderProperty(smmax, "Smooth Max");

                if((int)blendType.floatValue == 3)
                {
                    materialEditor.ShaderProperty(lerpCoef, "Texture Blend");
                }

                materialEditor.ShaderProperty(detxtgrType, "Detail Texture Grade Type");

                materialEditor.ShaderProperty(typeA, "Texture A Type");

                materialEditor.ShaderProperty(detailTXTA, "Detail Texture Type A");

                if (typeA.floatValue !< 2)
                {
                    MaterialProperty falloffA = ShaderGUI.FindProperty("_TAFalloff", properties);
                    materialEditor.ShaderProperty(falloffA, "Falloff");
                }

                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
                EditorGUILayout.BeginVertical(style);
                DetTxtASet(materialEditor, properties);
                MaterialProperty zSpeedA = ShaderGUI.FindProperty("_TextureASpeedZ", properties);
                materialEditor.ShaderProperty(zSpeedA, "Speed Z");
                EditorGUILayout.EndVertical();
                materialEditor.ShaderProperty(detailTXTB, "Detail Texture Type B");
                materialEditor.ShaderProperty(typeB, "Texture B Type");

                if(typeA.floatValue! < 2)
                {
                    MaterialProperty falloffB = ShaderGUI.FindProperty("_TBFalloff", properties);
                    materialEditor.ShaderProperty(falloffB, "Falloff");
                }

                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
                EditorGUILayout.BeginVertical(style);
                DetTxtBSet(materialEditor, properties);
                MaterialProperty zSpeedB = ShaderGUI.FindProperty("_TextureBSpeedZ", properties);
                materialEditor.ShaderProperty(zSpeedB, "Speed Z");
                EditorGUILayout.EndVertical();


                MaterialProperty dTCont = ShaderGUI.FindProperty("_Contrast", properties);
                MaterialProperty dTSat = ShaderGUI.FindProperty("_Saturation", properties);
                MaterialProperty dTBias = ShaderGUI.FindProperty("_Bias", properties);

                materialEditor.ShaderProperty(dTSat, "Saturation");
                materialEditor.ShaderProperty(dTCont, "Contrast");
                materialEditor.ShaderProperty(dTBias, "Bias");
            }


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

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_BaseSettings");
        checkBaseGroup = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkDetail");
        checkDetail = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkCloud");
        checkCloud = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkLight");
        checkLight= tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkWind");
        checkWind = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_cameraRayFold");
        cameraRayFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_lightRayFold");
        lightRayFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AlphaClip");
        checkAlphaClip = tempVar == 1 ? true : false;
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

    private void DetTxtASet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI DetTXTA = new BD_ScaleOffset_GUI();
        DetTXTA.Tile.x = "_TextureATileX";
        DetTXTA.Tile.y = "_TextureATileY";
        DetTXTA.Offset.x = "";
        DetTXTA.Offset.y = "";
        DetTXTA.Speed.x = "_TextureASpeedX";
        DetTXTA.Speed.y = "_TextureASpeedY";
        DetTXTA.OverallSpeed = "_TextureAOverallSpeed";
        DetTXTA.Rotate = "_TextureARotate";
        DetTXTA.RotateSpeed = "_TextureARotateSpeed";
        DetTXTA.Anchor.x = "_TextureAPivotX";
        DetTXTA.Anchor.y = "_TextureAPivotY";
        EditorGUILayout.LabelField("Detail Type A Settings");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, DetTXTA);
        EditorGUILayout.Space(2);
    }
    private void DetTxtBSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI DetTXTB = new BD_ScaleOffset_GUI();
        DetTXTB.Tile.x = "_TextureBTileX";
        DetTXTB.Tile.y = "_TextureBTileY";
        DetTXTB.Offset.x = "";
        DetTXTB.Offset.y = "";
        DetTXTB.Speed.x = "_TextureBSpeedX";
        DetTXTB.Speed.y = "_TextureBSpeedY";
        DetTXTB.OverallSpeed = "_TextureBOverallSpeed";
        DetTXTB.Rotate = "_TextureBRotate";
        DetTXTB.RotateSpeed = "_TextureBRotateSpeed";
        DetTXTB.Anchor.x = "_TextureBPivotX";
        DetTXTB.Anchor.y = "_TextureBPivotY";
        EditorGUILayout.LabelField("Detail Type B Settings");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, DetTXTB);
        EditorGUILayout.Space(2);
    }
    private void NoiseTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI NoiseTXT = new BD_ScaleOffset_GUI();
        NoiseTXT.Tile.x = "_WindTileX";
        NoiseTXT.Tile.y = "_WindTileY";
        NoiseTXT.Offset.x = "_WindOffsetX";
        NoiseTXT.Offset.y = "_WindOffsetY";
        NoiseTXT.Speed.x = "_WindSpeedX";
        NoiseTXT.Speed.y = "_WindSpeedY";
        NoiseTXT.OverallSpeed = "_WindOverallSpeed";
        NoiseTXT.Rotate = "_WindRotate";
        NoiseTXT.RotateSpeed = "_WindRotateSpeed";
        NoiseTXT.Anchor.x = "_WindPivotX";
        NoiseTXT.Anchor.y = "_WindPivotY";
        EditorGUILayout.LabelField("Noise Settings");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, NoiseTXT);
        EditorGUILayout.Space(2);
    }

    private void DeformTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI DeformTXT = new BD_ScaleOffset_GUI();
        DeformTXT.Tile.x = "_DeformTileX";
        DeformTXT.Tile.y = "_DeformTileY";
        DeformTXT.Offset.x = "_DeformOffsetX";
        DeformTXT.Offset.y = "_DeformOffsetY";
        DeformTXT.Speed.x = "_DeformSpeedX";
        DeformTXT.Speed.y = "_DeformSpeedY";
        DeformTXT.OverallSpeed = "_DeformOverallSpeed";
        DeformTXT.Rotate = "_DeformRotate";
        DeformTXT.RotateSpeed = "_DeformRotateSpeed";
        DeformTXT.Anchor.x = "_DeformPivotX";
        DeformTXT.Anchor.y = "_DeformPivotY";
        EditorGUILayout.LabelField("Deform Settings");
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, DeformTXT);
        EditorGUILayout.Space(2);
    }
}

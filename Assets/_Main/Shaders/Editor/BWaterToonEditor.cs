using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BWaterToonEditor : ShaderGUI
{
    bool checkShoreColor, checkDepthSetting, checkAlphaSetting;
    bool aboutFold, shoreMAFold, shoreMBFold, shoreTXFold, foamFold, noiseFold, middleWaveFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Water Toon Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUWaterToonTitle.png", typeof(Texture));

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

        #region Shore Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical();
        {
            checkShoreColor = EditorGUILayout.ToggleLeft("SHORE SETTINS", checkShoreColor, style);
            targetMat.SetInt("_ShoreSetting",Convert.ToInt16(checkShoreColor));
            EditorGUILayout.BeginVertical();   
            if(checkShoreColor)
            {
                MaterialProperty sc = ShaderGUI.FindProperty("_ShoreColor", properties);
                MaterialProperty shtb = ShaderGUI.FindProperty("_ShoreTextureBlendingType", properties);

                materialEditor.ColorProperty(sc, "Shore Color");
                materialEditor.ShaderProperty(shtb, "Texture Blending Type");

                MaterialProperty scm = ShaderGUI.FindProperty("_ShoreColorMap", properties);

                MaterialProperty sctx = ShaderGUI.FindProperty("_ShoreCTileX", properties);
                MaterialProperty scty = ShaderGUI.FindProperty("_ShoreCTileY", properties);
                MaterialProperty scsx = ShaderGUI.FindProperty("_ShoreCSpeedX", properties);
                MaterialProperty scsy = ShaderGUI.FindProperty("_ShoreCSpeedY", properties);
                MaterialProperty scax = ShaderGUI.FindProperty("_ShoreCAnchorX", properties);
                MaterialProperty scay = ShaderGUI.FindProperty("_ShoreCAnchorY", properties);
                MaterialProperty scrot = ShaderGUI.FindProperty("_ShoreCRotSpeed", properties);

                MaterialProperty scbtx = ShaderGUI.FindProperty("_ShoreCBTileX", properties);
                MaterialProperty scbty = ShaderGUI.FindProperty("_ShoreCBTileY", properties);
                MaterialProperty scbsx = ShaderGUI.FindProperty("_ShoreCBSpeedX", properties);
                MaterialProperty scbsy = ShaderGUI.FindProperty("_ShoreCBSpeedY", properties);
                MaterialProperty scbax = ShaderGUI.FindProperty("_ShoreCBAnchorX", properties);
                MaterialProperty scbay = ShaderGUI.FindProperty("_ShoreCBAnchorY", properties);
                MaterialProperty scbrot = ShaderGUI.FindProperty("_ShoreCBRotSpeed", properties);

                switch((int)(shtb.floatValue))
                {
                    case 0:
                        #region No Texture
                        // No Parameters
                        #endregion
                        break;
                    case 1:
                        #region One Texture
                        materialEditor.TextureProperty(scm, "Shore Map");
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
                        EditorGUILayout.BeginVertical(style);
                        shoreMAFold = EditorGUILayout.Foldout(shoreMAFold, "Map A Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_ShoreMapA", Convert.ToInt16(shoreMAFold));

                        if(shoreMAFold)
                        {
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(sctx, "Map A Tile X");
                            materialEditor.FloatProperty(scty, "Map A Tile Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scsx, "Map A Speeed X");
                            materialEditor.FloatProperty(scsy, "Map A Speed Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scax, "Map A Anchor X");
                            materialEditor.FloatProperty(scay, "Map A Anchor Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            materialEditor.FloatProperty(scrot, "Rotation Speed");
                        }
                        EditorGUILayout.EndVertical();
                        #endregion
                        break;
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        #region Add Sub Mult Div
                        materialEditor.TextureProperty(scm, "Shore Map");

                        #region Map A Settings
                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
                        EditorGUILayout.BeginVertical(style);
                        shoreMAFold = EditorGUILayout.Foldout(shoreMAFold, "Map A Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_ShoreMapA", Convert.ToInt16(shoreMAFold));
                        if(shoreMAFold)
                        {
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(sctx, "Map A Tile X");
                            materialEditor.FloatProperty(scty, "Map A Tile Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scsx, "Map A Speeed X");
                            materialEditor.FloatProperty(scsy, "Map A Speed Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scax, "Map A Anchor X");
                            materialEditor.FloatProperty(scay, "Map A Anchor Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            materialEditor.FloatProperty(scrot, "Rotation Speed");
                        }
                        EditorGUILayout.EndVertical();

                        style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
                        EditorGUILayout.BeginVertical(style);
                        shoreMBFold = EditorGUILayout.Foldout(shoreMBFold, "Map B Controls", toggleOnLabelClick: true);
                        targetMat.SetInt("_ShoreMapB", Convert.ToInt16(shoreMBFold));
                        #endregion

                        #region Map B Settings
                        if(shoreMBFold)
                        {
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scbtx, "Map B Tile X");
                            materialEditor.FloatProperty(scbty, "Map B Tile Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scbsx, "Map B Speeed X");
                            materialEditor.FloatProperty(scbsy, "Map B Speed Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            EditorGUILayout.BeginHorizontal();
                            EditorGUIUtility.labelWidth = 130;
                            EditorGUIUtility.fieldWidth = 50;
                            materialEditor.FloatProperty(scbax, "Map B Anchor X");
                            materialEditor.FloatProperty(scbay, "Map B Anchor Y");
                            EditorGUIUtility.labelWidth = 0;
                            EditorGUIUtility.fieldWidth = 0;
                            EditorGUILayout.EndHorizontal();
                            materialEditor.FloatProperty(scbrot, "Map B Rotation Speed");
                        }
                        EditorGUILayout.EndVertical();
                        #endregion
                        #endregion
                        break;

                }
            }
            EditorGUILayout.EndVertical();
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Depth Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkDepthSetting = EditorGUILayout.ToggleLeft("DEPTH SETTINGS", checkDepthSetting, style);
        targetMat.SetInt("_DepthSetting",Convert.ToInt16(checkDepthSetting));
        if(checkDepthSetting)
        {
            MaterialProperty ddist = ShaderGUI.FindProperty("_DepthDistance", properties);
            MaterialProperty dexp = ShaderGUI.FindProperty("_DepthExponential",properties);
            MaterialProperty dGrScl = ShaderGUI.FindProperty("_GradeScale", properties);
            MaterialProperty dGrOff = ShaderGUI.FindProperty("_GradeOffset", properties);
            MaterialProperty dGrExp = ShaderGUI.FindProperty("_GradeExponential", properties);
            MaterialProperty dsize = ShaderGUI.FindProperty("_DepthSize", properties);
            MaterialProperty dgt = ShaderGUI.FindProperty("_DepthGradeType", properties);
            MaterialProperty dMid = ShaderGUI.FindProperty("_MiddleWaveEdgeControl", properties);

            materialEditor.ShaderProperty(dgt, "Depth Grade Type");
            materialEditor.FloatProperty(ddist, "Depth Distance");
            materialEditor.FloatProperty(dexp, "Depth Exponential");
            materialEditor.FloatProperty(dGrScl, "Grade Scale");
            materialEditor.FloatProperty(dGrOff, "Grade Offset");
            materialEditor.FloatProperty(dGrExp, "Grade Exponential");
            materialEditor.FloatProperty(dsize, "Depth Size");
            materialEditor.FloatProperty(dMid, "Middle Wave Edge Control");
        }

        #endregion

        #region Alpha Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        checkAlphaSetting = EditorGUILayout.ToggleLeft("ALPHA SETTINGS", checkAlphaSetting, style);
        targetMat.SetInt("_AlphaSetting", Convert.ToInt16(checkAlphaSetting));
        if(checkAlphaSetting)
        {
            #region Shore Wave Settings
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);

            MaterialProperty clipThres = ShaderGUI.FindProperty("_ClipThreshold",properties);
            MaterialProperty shortog = ShaderGUI.FindProperty("_ShoreWaves", properties);
            MaterialProperty midtog = ShaderGUI.FindProperty("_MiddleWave", properties);
            MaterialProperty txGradeType = ShaderGUI.FindProperty("_TextureGradeType", properties);

            materialEditor.ShaderProperty(clipThres, "Alpha Clip Threshold");
            materialEditor.ShaderProperty(shortog, "Shore Toggle");
            materialEditor.ShaderProperty(midtog, "Middle Wave Toggle");
            materialEditor.ShaderProperty(txGradeType, "Grade Type");

            shoreTXFold = EditorGUILayout.Foldout(shoreTXFold, "Alpha Shore Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_AShoreFold", Convert.ToInt16(shoreTXFold));
            if(shoreTXFold)
            {
                MaterialProperty shtxt = ShaderGUI.FindProperty("_ShoreTexture", properties);
                MaterialProperty shInv = ShaderGUI.FindProperty("_InvertShoreTexture", properties);
                MaterialProperty shGrScl = ShaderGUI.FindProperty("_ShoreGradeScale", properties);
                MaterialProperty shGrOff = ShaderGUI.FindProperty("_ShoreGradeOffset", properties);

                MaterialProperty shtix = ShaderGUI.FindProperty("_ShoreTileX", properties);
                MaterialProperty shtiy = ShaderGUI.FindProperty("_ShoreTileY", properties);
                MaterialProperty shspx = ShaderGUI.FindProperty("_WaveSpeedX", properties);
                MaterialProperty shspy = ShaderGUI.FindProperty("_WaveSpeedY", properties);

                materialEditor.TextureProperty(shtxt, "Shore Texture");
                materialEditor.ShaderProperty(shInv, "Invert Shore Texture");
                materialEditor.FloatProperty(shGrScl, "Grade Scale");
                materialEditor.FloatProperty(shGrOff, "Grade Offset");

                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 130;
                EditorGUIUtility.fieldWidth = 50;
                materialEditor.FloatProperty(shtix, "Tile X");
                materialEditor.FloatProperty(shtiy, "Tile Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 130;
                EditorGUIUtility.fieldWidth = 50;
                materialEditor.FloatProperty(shspx, "Speed X");
                materialEditor.FloatProperty(shspy, "Speed Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();
            #endregion

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            EditorGUILayout.BeginVertical(style);
            foamFold = EditorGUILayout.Foldout(foamFold, "Alpha Foam Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_AFoamFold", Convert.ToInt16(foamFold));
            if(foamFold)
            {
                MaterialProperty fmblendt = ShaderGUI.FindProperty("_FoamBlendType", properties);

                MaterialProperty fmtxt = ShaderGUI.FindProperty("_FoamTexture", properties);
                MaterialProperty fmInv = ShaderGUI.FindProperty("_InvertFoamTexture", properties);
                MaterialProperty fmGrScl = ShaderGUI.FindProperty("_FoamGradeScale", properties);
                MaterialProperty fmGrOff = ShaderGUI.FindProperty("_FoamGradeOffset", properties);

                MaterialProperty fmAff = ShaderGUI.FindProperty("_AffectFoamDeformation", properties);

                MaterialProperty fmtix = ShaderGUI.FindProperty("_FoamTileX", properties);
                MaterialProperty fmtiy = ShaderGUI.FindProperty("_FoamTileY", properties);
                MaterialProperty fmspx = ShaderGUI.FindProperty("_FoamSpeedX", properties);
                MaterialProperty fmspy = ShaderGUI.FindProperty("_FoamSpeedY", properties);


                materialEditor.ShaderProperty(fmblendt, "Foam Blend Type");
                materialEditor.ShaderProperty(fmAff, "Affect Foam Deformation");

                materialEditor.TextureProperty(fmtxt, "Foam Texture");
                materialEditor.ShaderProperty(fmInv, "Invert Foam Texture");
                materialEditor.FloatProperty(fmGrScl, "Grade Scale");
                materialEditor.FloatProperty(fmGrOff, "Grade Offset");

                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 130;
                EditorGUIUtility.fieldWidth = 50;
                materialEditor.FloatProperty(fmtix, "Tile X");
                materialEditor.FloatProperty(fmtiy, "Tile Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                EditorGUIUtility.labelWidth = 130;
                EditorGUIUtility.fieldWidth = 50;
                materialEditor.FloatProperty(fmspx, "Speed X");
                materialEditor.FloatProperty(fmspy, "Speed Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
                EditorGUILayout.EndHorizontal();

            }
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(60));
            EditorGUILayout.BeginVertical(style);
            noiseFold = EditorGUILayout.Foldout(noiseFold, "Alpha Noise Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_NoiseFold", Convert.ToInt16(noiseFold));
            if(noiseFold)
            {
                MaterialProperty noiseType = ShaderGUI.FindProperty("_NoiseType",properties);

                materialEditor.ShaderProperty(noiseType, "Noise Type");

                switch((int)noiseType.floatValue)
                {
                    case 0:
                        // Vor A - Vor B
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Voronoi Type A", style);
                        vorA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Voronoi Type B", style);
                        vorB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;
                    case 1:
                        // Vor A - Per A
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Voronoi Type A", style);
                        vorA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Perlin Type A", style);
                        perA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;
                    case 2:
                        // Vor A - Per B
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Voronoi Type A", style);
                        vorA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Perlin Type B", style);
                        perB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;
                    case 3:
                        // Per A - Per B
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Perlin Type A", style);
                        perA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Perlin Type B", style);
                        perB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;
                    case 4:
                        // Vor B - Per A
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Voronoi Type B", style);
                        vorB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Perlin Type A", style);
                        perA(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;
                    case 5:
                        // Vor B - Per B
                        EditorGUILayout.Space(5);
                        EditorGUILayout.BeginVertical();
                        style.fontSize = 12;
                        style.alignment = TextAnchor.LowerLeft;
                        style.fontStyle = FontStyle.Bold;
                        EditorGUILayout.LabelField("Voronoi Type B", style);
                        vorB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.BeginVertical();
                        EditorGUILayout.Separator();
                        EditorGUILayout.LabelField("Perlin Type B", style);
                        perB(materialEditor, properties);
                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(5);
                        break;

                }
            }
            EditorGUILayout.EndVertical();

            #region Middle Wave Settingsa
            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(80));
            EditorGUILayout.BeginVertical(style);
            middleWaveFold = EditorGUILayout.Foldout(middleWaveFold, "Middle Wave Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_MiddleFold", Convert.ToInt16(middleWaveFold));
            if(middleWaveFold)
            {
                MaterialProperty midwaveInt = ShaderGUI.FindProperty("_MiddleWaveIntensity", properties);
                MaterialProperty defNoGradeScale = ShaderGUI.FindProperty("_DefNoiseGradeScale", properties);
                MaterialProperty defNoGradeOffset = ShaderGUI.FindProperty("_DefNoiseGradeOffset", properties);
                MaterialProperty defNoContrast = ShaderGUI.FindProperty("_DefNoiseContrast", properties);
                MaterialProperty defNoFinalScale = ShaderGUI.FindProperty("_DefNoiseFinalScale", properties);
                MaterialProperty defNoFinalOffset = ShaderGUI.FindProperty("_DefNoiseFinalOffset", properties);

                MaterialProperty defNoGradeType = ShaderGUI.FindProperty("_DefNoiseGradeType", properties);
                MaterialProperty defNoiseMixType = ShaderGUI.FindProperty("_DefNoiseMixType", properties);

                MaterialProperty deformScale = ShaderGUI.FindProperty("_DeformScale", properties);
                MaterialProperty deformTog = ShaderGUI.FindProperty("_DeformToggle", properties);
                //MaterialProperty deformOffset = ShaderGUI.FindProperty("_DeformOffset", properties);

                materialEditor.ShaderProperty(midwaveInt, "Middle Wave Intensity");

                materialEditor.ShaderProperty(defNoGradeType, "Grade Type");
                materialEditor.ShaderProperty(defNoiseMixType, "Mix Type");

                materialEditor.ShaderProperty(defNoContrast, "Noise Contrast");
                materialEditor.ShaderProperty(defNoGradeScale, "Noise Grade Scale");
                materialEditor.ShaderProperty(defNoGradeOffset, "Noise Grade Offset");
                materialEditor.ShaderProperty(defNoFinalScale, "Final Scale");
                materialEditor.ShaderProperty(defNoFinalOffset, "Final Offset");


                materialEditor.ShaderProperty(deformTog, "Deform Toggle");
                materialEditor.ShaderProperty(deformScale, "Deform Scale");
                //materialEditor.ShaderProperty(deformOffset, "Deform Offset");

                MaterialProperty defNoiseTAExp = ShaderGUI.FindProperty("_DefNoiseTypeAExponential", properties);
                MaterialProperty defNoiseTAInv = ShaderGUI.FindProperty("_DefNoiseAInvert", properties);
                MaterialProperty noiseTypeA = ShaderGUI.FindProperty("_NoiseTypeA", properties);

                MaterialProperty defVorAAngle = ShaderGUI.FindProperty("_DefVorAAngle", properties);
                MaterialProperty defVorAScale = ShaderGUI.FindProperty("_DefNoiseAScale", properties);
                MaterialProperty defPerlinAScale = ShaderGUI.FindProperty("_DefPerlinAScale", properties);

                MaterialProperty defVorATileX = ShaderGUI.FindProperty("_DefVorATileX", properties);
                MaterialProperty defVorATileY = ShaderGUI.FindProperty("_DefVorATileY", properties);
                MaterialProperty defVorASpeedX = ShaderGUI.FindProperty("_DefVorASpeedX", properties);
                MaterialProperty defVorASpeedY = ShaderGUI.FindProperty("_DefVorASpeedY", properties);
                MaterialProperty defVorAOverallSpeed = ShaderGUI.FindProperty("_DefNoiseTypeAOverallSpeed", properties);
                MaterialProperty defTypeAAnchorX = ShaderGUI.FindProperty("_DefTypeAAnchorX", properties);
                MaterialProperty defTypeAAnchorY = ShaderGUI.FindProperty("_DefTypeAAnchorY", properties);
                MaterialProperty defTypeARotSpeed = ShaderGUI.FindProperty("_DefTypeARotSpeed", properties);
                MaterialProperty defTypeATexture = ShaderGUI.FindProperty("_DefNoiseAMap", properties);

                EditorGUILayout.Space(5);
                EditorGUILayout.LabelField("Noise Type A");

                materialEditor.ShaderProperty(defNoiseTAExp, "Type A Exponential");
                materialEditor.ShaderProperty(defNoiseTAInv, "Type A Invert");
                materialEditor.ShaderProperty(noiseTypeA, "Type A");
                materialEditor.ShaderProperty(defTypeATexture, "Texture Map A");
                materialEditor.ShaderProperty(defVorAAngle, "Voronoi Angle");
                materialEditor.ShaderProperty(defVorAScale, "Noise Scale");
                materialEditor.ShaderProperty(defPerlinAScale, "Perlin Scale");

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defVorATileX, "Tile X");
                    materialEditor.ShaderProperty(defVorATileY, "Tile Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defVorASpeedX, "Speed X");
                    materialEditor.ShaderProperty(defVorASpeedY, "Speed Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                materialEditor.ShaderProperty(defVorAOverallSpeed, "Overall Speed");

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defTypeAAnchorX, "Anchor X");
                    materialEditor.ShaderProperty(defTypeAAnchorY, "Anchor Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                materialEditor.ShaderProperty(defTypeARotSpeed, "Rotate Speed");

                MaterialProperty defNoiseTBExp = ShaderGUI.FindProperty("_DefNoiseTypeBExponential", properties);
                MaterialProperty defNoiseTBInv = ShaderGUI.FindProperty("_DefNoiseBInvert", properties);
                MaterialProperty noiseTypeB = ShaderGUI.FindProperty("_NoiseTypeB", properties);

                MaterialProperty defVorBAngle = ShaderGUI.FindProperty("_DefVorBAngle", properties);
                MaterialProperty defVorBScale = ShaderGUI.FindProperty("_DefNoiseBScale", properties);
                MaterialProperty defPerlinBScale = ShaderGUI.FindProperty("_DefPerlinBScale", properties);
                MaterialProperty defVorBTileX = ShaderGUI.FindProperty("_DefVorBTileX", properties);
                MaterialProperty defVorBTileY = ShaderGUI.FindProperty("_DefVorBTileY", properties);
                MaterialProperty defVorBSpeedX = ShaderGUI.FindProperty("_DefVorBSpeedX", properties);
                MaterialProperty defVorBSpeedY = ShaderGUI.FindProperty("_DefVorBSpeedY", properties);
                MaterialProperty defVorBOverallSpeed = ShaderGUI.FindProperty("_DefNoiseTypeBOverallSpeed", properties);
                MaterialProperty defTypeBAnchorX = ShaderGUI.FindProperty("_DefTypeBAnchorX", properties);
                MaterialProperty defTypeBAnchorY = ShaderGUI.FindProperty("_DefTypeBAnchorY", properties);
                MaterialProperty defTypeBRotSpeed = ShaderGUI.FindProperty("_DefTypeBRotSpeed", properties);
                MaterialProperty defTypeBTexture = ShaderGUI.FindProperty("_DefNoiseBMap", properties);

                EditorGUILayout.Space(5);
                EditorGUILayout.LabelField("Noise Type B");

                materialEditor.ShaderProperty(defNoiseTBExp, "Type B Exponential");
                materialEditor.ShaderProperty(defNoiseTBInv, "Type B Invert");
                materialEditor.ShaderProperty(noiseTypeB, "Type B");
                materialEditor.ShaderProperty(defTypeBTexture, "Texture Map B");

                materialEditor.ShaderProperty(defVorBAngle, "Voronoi Angle");
                materialEditor.ShaderProperty(defVorBScale, "Noise Scale");
                materialEditor.ShaderProperty(defPerlinBScale, "Perlin Scale");

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defVorBTileX, "Tile X");
                    materialEditor.ShaderProperty(defVorBTileY, "Tile Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defVorBSpeedX, "Speed X");
                    materialEditor.ShaderProperty(defVorBSpeedY, "Speed Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                materialEditor.ShaderProperty(defVorBOverallSpeed, "Overall Speed");

                EditorGUILayout.BeginHorizontal();
                {
                    EditorGUIUtility.labelWidth = 130;
                    EditorGUIUtility.fieldWidth = 50;
                    materialEditor.ShaderProperty(defTypeBAnchorX, "Anchor X");
                    materialEditor.ShaderProperty(defTypeBAnchorY, "Anchor Y");
                    EditorGUIUtility.labelWidth = 0;
                    EditorGUIUtility.fieldWidth = 0;
                }
                EditorGUILayout.EndHorizontal();

                materialEditor.ShaderProperty(defTypeBRotSpeed, "Rotate Speed");

            }
            EditorGUILayout.EndVertical();
            #endregion
        }

        #endregion

        #region Shader Defaults
        materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
        #endregion

        #region BUDU Copyright
        GUI.backgroundColor = bdColors.Transparent(0);
        EditorGUILayout.Space(5);
        style.normal.textColor = bdColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;

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
        tempVar = targetMat.GetInt("_MiddleFold");
        middleWaveFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseFold");
        noiseFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AShoreFold");
        shoreTXFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AFoamFold");
        foamFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_AlphaSetting");
        checkAlphaSetting = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DepthSetting");
        shoreMAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShoreSetting");
        checkShoreColor = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShoreMapA");
        shoreMAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ShoreMapB");
        shoreMBFold = tempVar == 1 ? true : false;


    }

    private void vorA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty vAscl = ShaderGUI.FindProperty("_VorAScale", properties);
        MaterialProperty vAsmt = ShaderGUI.FindProperty("_VorASmooth", properties);
        MaterialProperty vAang = ShaderGUI.FindProperty("_VorAAngleSpeed", properties);
        MaterialProperty vAtix = ShaderGUI.FindProperty("_VorATileX", properties);
        MaterialProperty vAtiy = ShaderGUI.FindProperty("_VorATileY", properties);
        MaterialProperty vAspx = ShaderGUI.FindProperty("_VorASpeedX", properties);
        MaterialProperty vAspy = ShaderGUI.FindProperty("_VorASpeedY", properties);

        materialEditor.FloatProperty(vAscl, "Voronoi A Scale");
        materialEditor.FloatProperty(vAsmt, "Voronoi A Smooth");
        materialEditor.FloatProperty(vAang, "Voronoi A Angle");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vAtix, "Tile X");
            materialEditor.FloatProperty(vAtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vAspx, "Speed X");
            materialEditor.FloatProperty(vAspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void vorB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty vBscl = ShaderGUI.FindProperty("_VorBScale", properties);
        MaterialProperty vBsmt = ShaderGUI.FindProperty("_VorBSmooth", properties);
        MaterialProperty vBang = ShaderGUI.FindProperty("_VorBAngleSpeed", properties);
        MaterialProperty vBtix = ShaderGUI.FindProperty("_VorBTileX", properties);
        MaterialProperty vBtiy = ShaderGUI.FindProperty("_VorBTileY", properties);
        MaterialProperty vBspx = ShaderGUI.FindProperty("_VorBSpeedX", properties);
        MaterialProperty vBspy = ShaderGUI.FindProperty("_VorBSpeedY", properties);

        materialEditor.FloatProperty(vBscl, "Voronoi B Scale");
        materialEditor.FloatProperty(vBsmt, "Voronoi B Smooth");
        materialEditor.FloatProperty(vBang, "Voronoi B Angle");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vBtix, "Tile X");
            materialEditor.FloatProperty(vBtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(vBspx, "Speed X");
            materialEditor.FloatProperty(vBspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void perA(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty pAscl = ShaderGUI.FindProperty("_PerAScale", properties);
        MaterialProperty pAtix = ShaderGUI.FindProperty("_PerATileX", properties);
        MaterialProperty pAtiy = ShaderGUI.FindProperty("_PerATileY", properties);
        MaterialProperty pAspx = ShaderGUI.FindProperty("_PerASpeedX", properties);
        MaterialProperty pAspy = ShaderGUI.FindProperty("_PerASpeedY", properties);

        materialEditor.FloatProperty(pAscl, "Perlin A Scale");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pAtix, "Tile X");
            materialEditor.FloatProperty(pAtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pAspx, "Speed X");
            materialEditor.FloatProperty(pAspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();

    }
    private void perB(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        MaterialProperty pBscl = ShaderGUI.FindProperty("_PerBScale", properties);
        MaterialProperty pBtix = ShaderGUI.FindProperty("_PerBTileX", properties);
        MaterialProperty pBtiy = ShaderGUI.FindProperty("_PerBTileY", properties);
        MaterialProperty pBspx = ShaderGUI.FindProperty("_PerBSpeedX", properties);
        MaterialProperty pBspy = ShaderGUI.FindProperty("_PerBSpeedY", properties);

        materialEditor.FloatProperty(pBscl, "Perlin B Scale");
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pBtix, "Tile X");
            materialEditor.FloatProperty(pBtiy, "Tile Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        {
            EditorGUIUtility.labelWidth = 130;
            EditorGUIUtility.fieldWidth = 50;
            materialEditor.FloatProperty(pBspx, "Speed X");
            materialEditor.FloatProperty(pBspy, "Speed Y");
            EditorGUIUtility.labelWidth = 0;
            EditorGUIUtility.fieldWidth = 0;
        }
        EditorGUILayout.EndHorizontal();
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
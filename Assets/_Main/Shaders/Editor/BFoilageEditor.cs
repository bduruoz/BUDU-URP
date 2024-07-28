using System;
using UnityEngine;
using UnityEditor;
using budu;
using UnityEditor.Rendering;
using System.Dynamic;

public class BFoilageEditor : ShaderGUI
{
    bool checkSpecular, checkNormal, checkRim, checkFresnelInvert, checkFoilage, checkSurfaceFoilage, checkCardRandRotate, 
        checkFoilageWind, checkCustomNoiseA, checkCustomNoiseB, checkANeg , checkBNeg, checkBase, checkDef, checkTranslucent;
    bool aboutFold, notyAFold, notyBFold;
    bool NoiseAFold, NoiseBFold;
    int tempVar;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Foilage Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUFoilageTitle.png", typeof(Texture));

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
        GUI.backgroundColor = bdColors.White();
        #endregion

        #region Main Group
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

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
            MaterialProperty lc = ShaderGUI.FindProperty("_LeavesColor", properties);
            MaterialProperty lt = ShaderGUI.FindProperty("_LeavesTexture", properties);
            MaterialProperty aco = ShaderGUI.FindProperty("_AlphaAntiAliasing", properties);
            MaterialProperty ct = ShaderGUI.FindProperty("_ClipThreshold", properties);
            //MaterialProperty textRot = ShaderGUI.FindProperty("_TextureRotate", properties);
            //MaterialProperty recshad = ShaderGUI.FindProperty("_ReceiveShadows", properties);

            MaterialProperty TileSize = ShaderGUI.FindProperty("_TileSize", properties);

            materialEditor.ColorProperty(lc, "Leaves Color");
            materialEditor.TextureProperty(lt, "Leaves Texture");
            //materialEditor.ShaderProperty(textRot, "Texture Rotate");

            var TileLabel = new GUIContent();
            TileLabel.text = "Tile Repeat";
            materialEditor.IntSliderShaderProperty(TileSize, TileLabel);

            string[] AntiAliased = new string[] { "On", "Off" };
            int[] AntiAliasResult = new int[] { 1, 0 };

            MaterialProperty selAlphaCh = ShaderGUI.FindProperty("_AlphaChannel", properties);

            materialEditor.ShaderProperty(selAlphaCh, "Alpha Channel");
            materialEditor.IntPopupShaderProperty(aco, "Anti Aliased Cut Off", AntiAliased, AntiAliasResult);
            materialEditor.RangeProperty(ct, "Cut Off Threshold");


            // Transmission / Translucent icin

            // transmission

            // Shadow Threshold için
            MaterialProperty fff = ShaderGUI.FindProperty("_ShadowThreshold", properties);
            materialEditor.RangeProperty(fff, "Shadow Threshold");
            // shadow threshold

            //calismadi bu
            //MaterialProperty recShad = ShaderGUI.FindProperty("_RECEIVE_SHADOW_OFF", properties);
            //MaterialProperty recShad = ShaderGUI.FindProperty("_ReceiveShadow", properties);

            //materialEditor.ShaderProperty(recShad, "Receive Shadows");
            //materialEditor.ShaderProperty(recShad, "Receive Shadow");
            //targetMat.SetInt("_RECEIVE_SHADOWS_OFF", Convert.ToInt16((int)recShad.floatValue));
            //string[] typoTog = new string[] { "On", "Off" };
            //int[] TogInt = new int[] { 1, 0 };
            //materialEditor.IntPopupShaderProperty(recShad, "Receive Shadows", typoTog, TogInt);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkSpecular = EditorGUILayout.ToggleLeft("SPECULAR", checkSpecular, style);
        targetMat.SetInt("_LeavesSpecular", Convert.ToInt16(checkSpecular));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkSpecular)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty sc = ShaderGUI.FindProperty("_LeavesSpecColor", properties);
            MaterialProperty st = ShaderGUI.FindProperty("_LeavesSpecTexture", properties);
            MaterialProperty si = ShaderGUI.FindProperty("_LeavesSpecIntensity", properties);
            MaterialProperty ss = ShaderGUI.FindProperty("_Smoothness", properties);

            materialEditor.ColorProperty(sc, "Specular Color");
            materialEditor.TextureProperty(st, "Specular Texture");
            materialEditor.RangeProperty(si, "Specular Intensity");
            materialEditor.RangeProperty(ss, "Specular Smoothness");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Translucent Settings

        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);

        checkTranslucent = EditorGUILayout.ToggleLeft("TRANSLUCENT SETTINGS", checkTranslucent, style);
        targetMat.SetInt("_CheckTranslucent", Convert.ToInt16(checkTranslucent));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkTranslucent)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty transmisTog = ShaderGUI.FindProperty("_TransmisTog", properties);
            MaterialProperty transmis = ShaderGUI.FindProperty("_Transmission", properties);
            MaterialProperty transmisCol = ShaderGUI.FindProperty("_TransmissionColor", properties);
            MaterialProperty transmisShd = ShaderGUI.FindProperty("_TransmissionShadow", properties);
            MaterialProperty translucTog = ShaderGUI.FindProperty("_TranslucTog", properties);
            MaterialProperty translucency = ShaderGUI.FindProperty("_Translucency", properties);
            MaterialProperty translucencyCol = ShaderGUI.FindProperty("_TranslucentColor", properties);
            MaterialProperty translucencyStrength = ShaderGUI.FindProperty("_TRStrength", properties);
            MaterialProperty translucencyNormDist = ShaderGUI.FindProperty("_TRNormDist", properties);
            MaterialProperty translucencySct = ShaderGUI.FindProperty("_TRScattering", properties);
            MaterialProperty translucencyDirec = ShaderGUI.FindProperty("_TRDirec", properties);
            MaterialProperty translucencyAmb = ShaderGUI.FindProperty("_TRAmbient", properties);
            MaterialProperty translucencyShd = ShaderGUI.FindProperty("_TRShadow", properties);

            materialEditor.ShaderProperty(transmisTog, "Transmission");
            if(transmisTog.floatValue > 0f)
            {
                materialEditor.ShaderProperty(transmisCol, "Transmission Color");
                materialEditor.RangeProperty(transmis, "Transmission");
                materialEditor.RangeProperty(transmisShd, "Transmission Shadow");
            }
            materialEditor.ShaderProperty(translucTog, "Translucent");
            if(translucTog.floatValue > 0f)
            {
                materialEditor.ShaderProperty(translucencyCol, "Translucency Color");
                materialEditor.RangeProperty(translucency, "Translucency");
                materialEditor.RangeProperty(translucencyStrength, "Translucency Strength");
                materialEditor.RangeProperty(translucencyNormDist, "Translucency Normal Distortion");
                materialEditor.RangeProperty(translucencySct, "Translucency Scattering");
                materialEditor.RangeProperty(translucencyDirec, "Translucency Direc");
                materialEditor.RangeProperty(translucencyAmb, "Translucency Ambient");
                materialEditor.RangeProperty(translucencyShd, "Translucency Shadow");
            }
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
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
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

        #region Rim Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkRim = EditorGUILayout.ToggleLeft("RIM LIGHT", checkRim, style);
        targetMat.SetInt("_LeavesRim", Convert.ToInt16(checkRim));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            checkFresnelInvert = EditorGUILayout.Toggle("Invert Rim", checkFresnelInvert);
            targetMat.SetInt("_FresnelInvert", Convert.ToInt16(checkFresnelInvert));

            MaterialProperty rc = ShaderGUI.FindProperty("_LeavesRimColor", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_LeavesRimBias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_LeavesRimScale", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_LeavesRimPower", properties);
            MaterialProperty rpos = ShaderGUI.FindProperty("_LeavesRimYPosition", properties);
            MaterialProperty rcon = ShaderGUI.FindProperty("_LeavesRimYContrast", properties);

            materialEditor.ColorProperty(rc, "Rim Color");
            materialEditor.RangeProperty(rb, "Rim Bias");
            materialEditor.RangeProperty(rs, "Rim Scale");
            materialEditor.RangeProperty(rp, "Rim Power");
            materialEditor.RangeProperty(rpos, "Rim Position");
            materialEditor.RangeProperty(rcon, "Rim Contrast");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Foilage Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkFoilage = EditorGUILayout.ToggleLeft("FOILAGE", checkFoilage, style);
        targetMat.SetInt("_FoilageSetting", Convert.ToInt16(checkFoilage));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkFoilage)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty eb = ShaderGUI.FindProperty("_EffectBlend", properties);
            MaterialProperty cs = ShaderGUI.FindProperty("_CardSize",properties);
            MaterialProperty inf = ShaderGUI.FindProperty("_Inflate", properties);
            MaterialProperty crot = ShaderGUI.FindProperty("_CardRotate", properties);

            materialEditor.RangeProperty(eb, "Effect Blend");
            materialEditor.RangeProperty(cs, "Card Size");
            materialEditor.RangeProperty(inf, "Inflate");
            materialEditor.RangeProperty(crot, "Card Rotation");

            checkCardRandRotate = EditorGUILayout.Toggle("Rotation Randomize", checkCardRandRotate);
            targetMat.SetInt("_RandomRotate", Convert.ToInt16(checkCardRandRotate));

            #region Surface Foilage Check
            checkSurfaceFoilage = EditorGUILayout.Toggle("Surface Foilage", checkSurfaceFoilage);
            targetMat.SetInt("_SurfaceFoilage", Convert.ToInt16(checkSurfaceFoilage));
            if(checkSurfaceFoilage)
            {
                MaterialProperty sfi = ShaderGUI.FindProperty("_SurfaceFoilageIntensity", properties);
                materialEditor.RangeProperty(sfi, "Intensity");
            }
            #endregion

            #region Foilage Wind Settings
            style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
            style.fontSize = 16;
            style.normal.textColor = bdColors.NexusOrange(255);

            EditorGUILayout.BeginVertical(style);
            checkFoilageWind= EditorGUILayout.ToggleLeft("FOILAGE WIND", checkFoilageWind, style);
            targetMat.SetInt("_WindToggle", Convert.ToInt16(checkFoilageWind));
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
            EditorGUILayout.BeginVertical(style);
            if(checkFoilageWind)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.Space(2);
                MaterialProperty ws = ShaderGUI.FindProperty("_WindSpeed",properties);
                MaterialProperty wi = ShaderGUI.FindProperty("_WindIntensity", properties);
                MaterialProperty ofrc = ShaderGUI.FindProperty("_OverForce", properties);

                materialEditor.RangeProperty(ws, "Wind Speed");
                materialEditor.RangeProperty(wi, "Wind Intensity");
                materialEditor.RangeProperty(ofrc, "Over Force");

                style.normal.background = MakeBackground(1, 1, bdColors.NexusRed(20));

                EditorGUILayout.BeginVertical(style);
                NoiseAFold = EditorGUILayout.Foldout(NoiseAFold,"Noise Type A", toggleOnLabelClick: true);
                targetMat.SetInt("_NoiseAFold", System.Convert.ToInt16(NoiseAFold));
                if(NoiseAFold)
                {
                    EditorGUI.indentLevel++;
                    EditorGUILayout.Space(2);
                    MaterialProperty natog = ShaderGUI.FindProperty("_NoiseTypeA", properties);
                    MaterialProperty tai = ShaderGUI.FindProperty("_TypeAIntensity", properties);
                    materialEditor.ShaderProperty(natog, "Noise Type A");
                    if(natog.floatValue > 0f)
                    {
                        materialEditor.RangeProperty(tai, "Intensity");

                        EditorGUILayout.BeginHorizontal();
                        checkANeg = EditorGUILayout.Toggle("Negative", checkANeg);
                        targetMat.SetInt("_TypeANeg", Convert.ToInt16(checkANeg));

                        checkCustomNoiseA = EditorGUILayout.Toggle("Custom Noise Texture A", checkCustomNoiseA);
                        targetMat.SetInt("_CustomNoiseTypeA", Convert.ToInt16(checkCustomNoiseA));
                        notyAFold = checkCustomNoiseA;
                        EditorGUILayout.EndHorizontal();

                        if(notyAFold)
                        {
                            MaterialProperty tna = ShaderGUI.FindProperty("_NoiseTxtA", properties);

                            materialEditor.TextureProperty(tna, "Noise Type A");
                        }
                        else
                        {
                            MaterialProperty naFreq = ShaderGUI.FindProperty("_NoiseFreqA", properties);

                            materialEditor.FloatProperty(naFreq, "Frequency");
                        }

                        MaterialProperty txa = ShaderGUI.FindProperty("_TileTypeAX", properties);
                        MaterialProperty tya = ShaderGUI.FindProperty("_TileTypeAY", properties);
                        MaterialProperty sxa = ShaderGUI.FindProperty("_SpeedTypeAX", properties);
                        MaterialProperty syb = ShaderGUI.FindProperty("_SpeedTypeAY", properties);

                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 150;
                        materialEditor.FloatProperty(txa, "Tile X");
                        materialEditor.FloatProperty(tya, "Tile Y");
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.BeginHorizontal();
                        materialEditor.FloatProperty(sxa, "Speed X");
                        materialEditor.FloatProperty(syb, "Speed Y");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUILayout.EndHorizontal();
                    }
                    EditorGUI.indentLevel--;
                }
                EditorGUILayout.EndVertical();

                style.normal.background = MakeBackground(1, 1, bdColors.NexusRed(40));

                EditorGUILayout.BeginVertical(style);
                NoiseBFold = EditorGUILayout.Foldout(NoiseBFold, "Noise Type B", toggleOnLabelClick: true);
                targetMat.SetInt("_NoiseBFold", System.Convert.ToInt16(NoiseBFold));
                if(NoiseBFold)
                {
                    EditorGUI.indentLevel++;
                    EditorGUILayout.Space(2);
                    MaterialProperty nbtog = ShaderGUI.FindProperty("_NoiseTypeB", properties);
                    materialEditor.ShaderProperty(nbtog, "Noise Type B");
                    if(nbtog.floatValue > 0f)
                    {
                        MaterialProperty tbi = ShaderGUI.FindProperty("_TypeBIntensity", properties);
                        materialEditor.RangeProperty(tbi, "Intensity");

                        EditorGUILayout.BeginHorizontal();
                        checkBNeg = EditorGUILayout.Toggle("Negative", checkBNeg);
                        targetMat.SetInt("_TypeBNeg", Convert.ToInt16(checkBNeg));

                        checkCustomNoiseB = EditorGUILayout.Toggle("Custom Noise Texture B", checkCustomNoiseB);
                        targetMat.SetInt("_CustomNoiseTypeB", Convert.ToInt16(checkCustomNoiseB));
                        notyBFold = checkCustomNoiseB;
                        EditorGUILayout.EndHorizontal();

                        if(notyBFold)
                        {
                            MaterialProperty tnb = ShaderGUI.FindProperty("_NoiseTxtB", properties);

                            materialEditor.TextureProperty(tnb, "Noise Type B");
                        }
                        else
                        {
                            MaterialProperty nbFreq = ShaderGUI.FindProperty("_NoiseFreqB", properties);

                            materialEditor.FloatProperty(nbFreq, "Frequency");
                        }

                        MaterialProperty txb = ShaderGUI.FindProperty("_TileTypeBX", properties);
                        MaterialProperty tyb = ShaderGUI.FindProperty("_TileTypeBY", properties);
                        MaterialProperty sxb = ShaderGUI.FindProperty("_SpeedTypeBX", properties);
                        MaterialProperty syb = ShaderGUI.FindProperty("_SpeedTypeBY", properties);

                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 150;
                        materialEditor.FloatProperty(txb, "Tile X");
                        materialEditor.FloatProperty(tyb, "Tile Y");
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.BeginHorizontal();
                        materialEditor.FloatProperty(sxb, "Speed X");
                        materialEditor.FloatProperty(syb, "Speed Y");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUILayout.EndHorizontal();
                    }
                    EditorGUI.indentLevel--;
                }
                EditorGUILayout.EndVertical();
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            #endregion

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
        GUI.backgroundColor= bdColors.Transparent(0);
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
            EditorGUILayout.HelpBox(gc, true);
        }
        #endregion

    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_LeavesSpecular");
        checkSpecular = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckTranslucent");
        checkTranslucent = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_LeavesRim");
        checkRim  = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RandomRotate");
        checkCardRandRotate = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FoilageSetting");
        checkFoilage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_SurfaceFoilage");
        checkSurfaceFoilage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_WindToggle");
        checkFoilageWind = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CustomNoiseTypeA");
        checkCustomNoiseA = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CustomNoiseTypeB");
        checkCustomNoiseB = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseAFold");
        NoiseAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseBFold");
        NoiseBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TypeANeg");
        checkANeg = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TypeBNeg");
        checkBNeg= tempVar == 1 ? true : false;

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

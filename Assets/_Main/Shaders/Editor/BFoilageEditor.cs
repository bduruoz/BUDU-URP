using System;
using UnityEngine;
using UnityEditor;
using budu;
using UnityEditor.Rendering;
using System.Dynamic;

public class BFoilageEditor : ShaderGUI
{
    bool checkSpecular, checkNormal, checkRim, checkFresnelInvert, checkFoilage, checkSurfaceFoilage, checkCardRandRotate, checkFoilageWind, checkCustomNoiseA, checkCustomNoiseB, checkANeg , checkBNeg;
    bool aboutFold, specFold, normalFold, rimFold, foilageFold, sFoilageFold, fWindFold, notyAFold, notyBFold;
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

        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White();
        #endregion

        #region Main Group
        MaterialProperty lc = ShaderGUI.FindProperty("_LeavesColor", properties);
        MaterialProperty lt = ShaderGUI.FindProperty("_LeavesTexture", properties);
        MaterialProperty aco = ShaderGUI.FindProperty("_AlphaAntiAliasing", properties);
        MaterialProperty ct = ShaderGUI.FindProperty("_ClipThreshold", properties);
        //MaterialProperty recshad = ShaderGUI.FindProperty("_ReceiveShadows", properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(lc, "Leaves Color");
            materialEditor.TextureProperty(lt, "Leaves Texture");

            string[] AntiAliased = new string[] { "On", "Off" };
            int[] AntiAliasResult = new int[] { 1, 0};

            materialEditor.IntPopupShaderProperty(aco, "Anti Aliased Cut Off", AntiAliased, AntiAliasResult);

            materialEditor.RangeProperty(ct, "Cut Off Threshold");

            /* Transmission icin
            MaterialProperty fff = ShaderGUI.FindProperty("_Transmission", properties);
            materialEditor.RangeProperty(fff, "Transmission");
            */

            /* Shadow Threshold için
            MaterialProperty fff = ShaderGUI.FindProperty("_ShadowThreshold", properties);
            materialEditor.RangeProperty(fff, "Shadow Threshold");
            */

            //string[] typoTog = new string[] { "On", "Off" };
            //int[] TogInt = new int[] { 1, 0 };
            //materialEditor.IntPopupShaderProperty(recshad, "Receive Shadows", typoTog, TogInt);
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(width: 5);
        #endregion

        #region Specular Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkSpecular = EditorGUILayout.ToggleLeft("SPECULAR", checkSpecular, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkSpecular)
                {

                    specFold = true;
                    targetMat.SetInt("_LeavesSpecular", 1);
                }
                else
                {
                    specFold = false;
                    targetMat.SetInt("_LeavesSpecular", 0);
                }
                EditorUtility.SetDirty(targetMat);
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(specFold)
        {
            MaterialProperty sc = ShaderGUI.FindProperty("_LeavesSpecColor", properties);
            MaterialProperty st = ShaderGUI.FindProperty("_LeavesSpecTexture", properties);
            MaterialProperty si = ShaderGUI.FindProperty("_LeavesSpecIntensity", properties);
            MaterialProperty ss = ShaderGUI.FindProperty("_Smoothness", properties);

            materialEditor.ColorProperty(sc, "Specular Color");
            materialEditor.TextureProperty(st, "Specular Texture");
            materialEditor.RangeProperty(si, "Specular Intensity");
            materialEditor.RangeProperty(ss, "Specular Smoothness");
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
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
        EditorGUILayout.Space(5);
        #endregion

        #region Rim Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkRim = EditorGUILayout.ToggleLeft("RIM LIGHT", checkRim, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkRim)
                {
                    rimFold = true;
                    targetMat.SetInt("_LeavesRim", 1);
                }
                else
                {
                    rimFold = false;
                    targetMat.SetInt("_LeavesRim", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(rimFold)
        {
            EditorGUILayout.Space(4);
            EditorGUI.BeginChangeCheck();
            checkFresnelInvert = EditorGUILayout.Toggle("Invert Rim", checkFresnelInvert);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkFresnelInvert)
                {
                    targetMat.SetInt("_FresnelInvert", 1);
                }
                else
                {
                    targetMat.SetInt("_FresnelInvert", 0);
                }
            }

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
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Foilage Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkFoilage = EditorGUILayout.ToggleLeft("FOILAGE", checkFoilage, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkFoilage)
                {
                    foilageFold = true;
                    targetMat.SetInt("_FoilageSetting", 1);
                }
                else
                {
                    foilageFold = false;
                    targetMat.SetInt("_FoilageSetting", 0);
                }
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(foilageFold)
        {
            EditorGUILayout.Space(4);

            MaterialProperty eb = ShaderGUI.FindProperty("_EffectBlend", properties);
            MaterialProperty cs = ShaderGUI.FindProperty("_CardSize",properties);
            MaterialProperty inf = ShaderGUI.FindProperty("_Inflate", properties);
            MaterialProperty crot = ShaderGUI.FindProperty("_CardRotate", properties);

            materialEditor.RangeProperty(eb, "Effect Blend");
            materialEditor.RangeProperty(cs, "Card Size");
            materialEditor.RangeProperty(inf, "Inflate");
            materialEditor.RangeProperty(crot, "Card Rotation");

            EditorGUI.BeginChangeCheck();
            checkCardRandRotate = EditorGUILayout.Toggle("Rotation Randomize", checkCardRandRotate);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkCardRandRotate)
                {
                    targetMat.SetInt("_RandomRotate", 1);
                }
                else
                {
                    targetMat.SetInt("_RandomRotate", 0);
                }
            }

            #region Surface Foilage Check
            EditorGUI.BeginChangeCheck();
            checkSurfaceFoilage = EditorGUILayout.Toggle("Surface Foilage", checkSurfaceFoilage);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkSurfaceFoilage)
                {
                    sFoilageFold = true;
                    targetMat.SetInt("_SurfaceFoilage", 1);
                }
                else
                {
                    sFoilageFold = false;
                    targetMat.SetInt("_SurfaceFoilage", 0);
                }
            }
            if(sFoilageFold)
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
            EditorGUI.BeginChangeCheck();
            checkFoilageWind= EditorGUILayout.ToggleLeft("FOILAGE WIND", checkFoilageWind, style);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkFoilageWind)
                {
                    fWindFold = true;
                    targetMat.SetInt("_WindToggle", 1);
                }
                else
                {
                    fWindFold = false;
                    targetMat.SetInt("_WindToggle", 0);
                }
            }
            EditorGUILayout.EndVertical();
            GUI.backgroundColor = bdColors.White(255);

            if(fWindFold)
            {
                MaterialProperty ws = ShaderGUI.FindProperty("_WindSpeed",properties);
                MaterialProperty wi = ShaderGUI.FindProperty("_WindIntensity", properties);
                MaterialProperty ofrc = ShaderGUI.FindProperty("_OverForce", properties);

                materialEditor.RangeProperty(ws, "Wind Speed");
                materialEditor.RangeProperty(wi, "Wind Intensity");
                materialEditor.RangeProperty(ofrc, "Over Force");

                style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(20));

                EditorGUILayout.BeginVertical(style);
                NoiseAFold = EditorGUILayout.Foldout(NoiseAFold,"Noise Type A", toggleOnLabelClick: true);
                targetMat.SetInt("_NoiseAFold", System.Convert.ToInt16(NoiseAFold));
                if(NoiseAFold)
                {
                    MaterialProperty tai = ShaderGUI.FindProperty("_TypeAIntensity", properties);
                    materialEditor.RangeProperty(tai, "Intensity");

                    EditorGUILayout.BeginHorizontal();
                    checkANeg = EditorGUILayout.Toggle("Negative",checkANeg);
                    targetMat.SetInt("_TypeANeg",Convert.ToInt16(checkANeg));

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
                        MaterialProperty naFreq = ShaderGUI.FindProperty("_NoiseFreqA",properties);

                        materialEditor.FloatProperty(naFreq, "Frequency");
                    }

                    MaterialProperty txa = ShaderGUI.FindProperty("_TileTypeAX", properties);
                    MaterialProperty tya = ShaderGUI.FindProperty("_TileTypeAY", properties);
                    MaterialProperty sxa = ShaderGUI.FindProperty("_SpeedTypeAX", properties);
                    MaterialProperty syb = ShaderGUI.FindProperty("_SpeedTypeAY", properties);

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUIUtility.labelWidth = 55;
                        materialEditor.FloatProperty(txa, "Tile X");
                        materialEditor.FloatProperty(tya, "Tile Y");
                        materialEditor.FloatProperty(sxa, "Speed X");
                        materialEditor.FloatProperty(syb, "Speed Y");
                        EditorGUIUtility.labelWidth = 0;
                    }
                    EditorGUILayout.EndHorizontal();
                }
                EditorGUILayout.EndVertical();

                style.normal.background = MakeBackground(1, 1, bdColors.NexusRed(20));

                EditorGUILayout.BeginVertical(style);
                NoiseBFold = EditorGUILayout.Foldout(NoiseBFold, "Noise Type B", toggleOnLabelClick: true);
                targetMat.SetInt("_NoiseBFold", System.Convert.ToInt16(NoiseBFold));
                if(NoiseBFold)
                {
                    MaterialProperty tbi = ShaderGUI.FindProperty("_TypeBIntensity", properties);
                    materialEditor.RangeProperty(tbi, "Intensity");

                    EditorGUILayout.BeginHorizontal();
                    checkBNeg = EditorGUILayout.Toggle("Negative", checkBNeg);
                    targetMat.SetInt("_TypeBNeg",Convert.ToInt16(checkBNeg));

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
                    {
                        EditorGUIUtility.labelWidth = 55;
                        materialEditor.FloatProperty(txb, "Tile X");
                        materialEditor.FloatProperty(tyb, "Tile Y");
                        materialEditor.FloatProperty(sxb, "Speed X");
                        materialEditor.FloatProperty(syb, "Speed Y");
                        EditorGUIUtility.labelWidth = 0;
                    }
                    EditorGUILayout.EndHorizontal();

                }
                EditorGUILayout.EndVertical();

            }

            #endregion

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Shader Defaults
        //materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
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
        specFold = checkSpecular;

        tempVar = targetMat.GetInt("_Normal");
        checkNormal = tempVar == 1 ? true : false;
        normalFold = checkNormal;

        tempVar = targetMat.GetInt("_LeavesRim");
        checkRim  = tempVar == 1 ? true : false;
        rimFold = checkRim;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_RandomRotate");
        checkCardRandRotate = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FoilageSetting");
        checkFoilage = tempVar == 1 ? true : false;
        foilageFold = checkFoilage;

        tempVar = targetMat.GetInt("_SurfaceFoilage");
        checkSurfaceFoilage = tempVar == 1 ? true : false;
        sFoilageFold = checkSurfaceFoilage;

        tempVar = targetMat.GetInt("_WindToggle");
        checkFoilageWind = tempVar == 1 ? true : false;
        fWindFold = checkFoilageWind;

        tempVar = targetMat.GetInt("_CustomNoiseTypeA");
        checkCustomNoiseA = tempVar == 1 ? true : false;
        notyAFold = checkCustomNoiseA;

        tempVar = targetMat.GetInt("_CustomNoiseTypeB");
        checkCustomNoiseB = tempVar == 1 ? true : false;
        notyAFold = checkCustomNoiseB;

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

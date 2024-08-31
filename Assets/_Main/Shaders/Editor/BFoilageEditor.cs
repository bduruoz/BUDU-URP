using System;
using UnityEngine;
using UnityEditor;
using budu;
using UnityEditor.Rendering;
using UnityEngine.Rendering;

public class BFoilageEditor : ShaderGUI
{
    bool checkSpecular, checkNormal, checkRim, checkFresnelInvert, checkFoilage, checkFoilageWind, checkCustomNoiseA, checkCustomNoiseB, checkNegative , checkBNeg, checkBase, checkDef, checkTranslucent;
    bool aboutFold, notyAFold, notyBFold;
    bool noiseFold;
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
        targetMat.SetInt("_checkBase", Convert.ToInt16(checkBase));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty lc = ShaderGUI.FindProperty("_Leaves_Color", properties);
            MaterialProperty lt = ShaderGUI.FindProperty("_Leaves_Texture", properties);
            MaterialProperty ct = ShaderGUI.FindProperty("_Alpha_Clip_Threshold", properties);
            MaterialProperty affRim = ShaderGUI.FindProperty("_Affect_Rim", properties);
            MaterialProperty txI = ShaderGUI.FindProperty("_Texture_Color_Intensity", properties);
            MaterialProperty TileSize = ShaderGUI.FindProperty("_TileSize", properties);
            MaterialProperty selAlphaCh = ShaderGUI.FindProperty("_ALPHACHANNEL", properties);


            materialEditor.ShaderProperty(lc, "Leaves Color");
            materialEditor.ShaderProperty(lt, "Leaves Texture");
            materialEditor.ShaderProperty(txI, "Texture Color Intensity");

            var TileLabel = new GUIContent();
            TileLabel.text = "Tile Repeat";
            materialEditor.IntSliderShaderProperty(TileSize, TileLabel);
            materialEditor.ShaderProperty(affRim, "Affect Rim Color");
            materialEditor.ShaderProperty(selAlphaCh, "Select Alpha Channel");
            materialEditor.RangeProperty(ct, "Alpha Clip Threshold");

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
            MaterialProperty sc = ShaderGUI.FindProperty("_Leaves_Specular_Color", properties);
            MaterialProperty st = ShaderGUI.FindProperty("_Leaves_Specular_Texture", properties);
            MaterialProperty si = ShaderGUI.FindProperty("_Specular_Intensity", properties);
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

        #region Normal Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkNormal = EditorGUILayout.ToggleLeft("NORMAL", checkNormal, style);
        targetMat.SetInt("_NormalToggle", Convert.ToInt16(checkNormal));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkNormal)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nmap = ShaderGUI.FindProperty("_Leaves_Normal_Map", properties);
            MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Scale", properties);

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
        targetMat.SetInt("_Leaves_Rim", Convert.ToInt16(checkRim));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty fi = ShaderGUI.FindProperty("_FresnelInvert",properties);
            materialEditor.ShaderProperty(fi, "Invert Rim");

            //checkFresnelInvert = EditorGUILayout.Toggle("Invert Rim", checkFresnelInvert);
            //targetMat.SetInt("_FresnelInvert", Convert.ToInt16(checkFresnelInvert));

            MaterialProperty rc = ShaderGUI.FindProperty("_Rim_Color", properties);
            MaterialProperty rb = ShaderGUI.FindProperty("_Rim_Bias", properties);
            MaterialProperty rs = ShaderGUI.FindProperty("_Rim_Scale", properties);
            MaterialProperty rp = ShaderGUI.FindProperty("_Rim_Power", properties);
            MaterialProperty rint = ShaderGUI.FindProperty("_Rim_Intensity", properties);
            MaterialProperty rpos = ShaderGUI.FindProperty("_Rim_Y_Position", properties);
            MaterialProperty rcon = ShaderGUI.FindProperty("_Rim_Y_Contrast", properties);

            materialEditor.ShaderProperty(rc, "Rim Color");
            materialEditor.ShaderProperty(rb, "Rim Bias");
            materialEditor.ShaderProperty(rs, "Rim Scale");
            materialEditor.ShaderProperty(rp, "Rim Power");
            materialEditor.ShaderProperty(rint, "Rim Intensity");
            materialEditor.ShaderProperty(rpos, "Rim Position");
            materialEditor.ShaderProperty(rcon, "Rim Contrast");
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

            MaterialProperty eb = ShaderGUI.FindProperty("_Effect_Blend", properties);
            MaterialProperty cs = ShaderGUI.FindProperty("_Card_Size", properties);
            MaterialProperty inf = ShaderGUI.FindProperty("_Inflate", properties);
            MaterialProperty crot = ShaderGUI.FindProperty("_Card_Rotate", properties);
            MaterialProperty rRand = ShaderGUI.FindProperty("_RandomRotate",properties);

            materialEditor.ShaderProperty(eb, "Effect Blend");
            materialEditor.ShaderProperty(inf, "Inflate");
            materialEditor.ShaderProperty(cs, "Card Size");
            materialEditor.ShaderProperty(crot, "Card Rotation");
            materialEditor.ShaderProperty(rRand, "Rotate Randomize");

            MaterialProperty sfoilTog = ShaderGUI.FindProperty("_Surface_Foilage", properties);
            materialEditor.ShaderProperty(sfoilTog, "Surface Foilage");
            if(sfoilTog.floatValue > 0f)
            {
                MaterialProperty sfi = ShaderGUI.FindProperty("_Surface_Foilage_Intensity", properties);
                materialEditor.ShaderProperty(sfi, "Intensity");
            }
            
            #region Foilage Wind Settings
            style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
            style.fontSize = 16;
            style.normal.textColor = bdColors.NexusOrange(255);

            EditorGUILayout.BeginVertical(style);
            checkFoilageWind = EditorGUILayout.ToggleLeft("FOILAGE WIND", checkFoilageWind, style);
            targetMat.SetInt("_WindToggle", Convert.ToInt16(checkFoilageWind));
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
            EditorGUILayout.BeginVertical(style);
            if(checkFoilageWind)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.Space(2);
                
                MaterialProperty wi = ShaderGUI.FindProperty("_Wind_Strength", properties);
                MaterialProperty ws = ShaderGUI.FindProperty("_Wind_Speed", properties);
                
                materialEditor.ShaderProperty(wi, "Wind Strength");
                materialEditor.ShaderProperty(ws, "Wind Speed");

                style.normal.background = MakeBackground(1, 1, bdColors.NexusRed(20));

                EditorGUILayout.BeginVertical(style);
                noiseFold = EditorGUILayout.Foldout(noiseFold, "Noise Settings", toggleOnLabelClick: true);
                targetMat.SetInt("_NoiseToggle", System.Convert.ToInt16(noiseFold));
                if(noiseFold)
                {
                    EditorGUI.indentLevel++;
                    EditorGUILayout.Space(2);

                    MaterialProperty natog = ShaderGUI.FindProperty("_WIND_NOISE_TYPE", properties);
                    MaterialProperty perLe = ShaderGUI.FindProperty("_Per_Leaves", properties);
                    MaterialProperty noisInv = ShaderGUI.FindProperty("_Noise_Invert",properties);

                    materialEditor.ShaderProperty(natog, "Noise Type");
                    materialEditor.ShaderProperty(noisInv, "Invert Noise");
                    materialEditor.ShaderProperty(perLe, "Per Leaves");

                    switch((int)natog.floatValue)
                    {
                        case 0:
                            MaterialProperty celD = ShaderGUI.FindProperty("_Cell_Density",properties);
                            materialEditor.ShaderProperty(celD, "Cell Density");
                            break;
                        case 1:
                        case 2:
                            MaterialProperty noiScl = ShaderGUI.FindProperty("_Wind_Noise_Scale", properties);
                            materialEditor.ShaderProperty(noiScl, "Noise Scale");
                            break;
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
        EditorGUILayout.Space(2);
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);
        checkDef = EditorGUILayout.ToggleLeft("SHADER DEFAULTS", checkDef, style);
        targetMat.SetInt("_checkDef", Convert.ToInt16(checkDef));
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            #region Blend Type
            MaterialProperty blType = ShaderGUI.FindProperty("_Blend", properties);
            MaterialProperty srcBlend = ShaderGUI.FindProperty("_SrcBlend", properties);
            MaterialProperty dstBlend = ShaderGUI.FindProperty("_DstBlend", properties);

            string[] blendtype = { "Alpha", "Premultiply", "Additive", "Multiply" };
            materialEditor.PopupShaderProperty(blType, new GUIContent("Blend Type"), blendtype);
            switch((int)blType.floatValue)
            {
                case 0:
                    // Alpha Blending
                    srcBlend.floatValue = (int)BlendMode.SrcAlpha;
                    dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                    targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                    break;
                case 1:
                    // Premultiply
                    srcBlend.floatValue = (int)BlendMode.One;
                    dstBlend.floatValue = (int)BlendMode.OneMinusSrcAlpha;
                    targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                    break;
                case 2:
                    // Additive
                    srcBlend.floatValue = (int)BlendMode.One;
                    dstBlend.floatValue = (int)BlendMode.One;
                    targetMat.DisableKeyword(keyword: "_ALPHAMODULATE_ON");
                    break;
                case 3:
                    // Multiply
                    srcBlend.floatValue = (int)BlendMode.DstColor;
                    dstBlend.floatValue = (int)BlendMode.Zero;
                    targetMat.EnableKeyword(keyword: "_ALPHAMODULATE_ON");
                    break;
            }
            #endregion

            #region Preserve Specular Settings
            EditorGUI.indentLevel++;
            targetMat.DisableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
            if((int)blType.floatValue == 0 || (int)blType.floatValue == 2)
            {
                MaterialProperty psl = ShaderGUI.FindProperty("_Preserve_Specular_Lighting", properties);
                materialEditor.ShaderProperty(psl, "Preserve Specular Lighting");

                if(psl.floatValue < 1f)
                {
                    targetMat.EnableKeyword(keyword: "_ALPHAPREMULTIPLY_ON");
                }
            }
            EditorGUI.indentLevel--;
            #endregion

            #region Cast Shadows
            MaterialProperty csShad = ShaderGUI.FindProperty("_Cast_Shadows", properties);
            materialEditor.ShaderProperty(csShad, "Cast Shadows");
            targetMat.SetInt("_CastShadow", Convert.ToInt16((int)csShad.floatValue));
            targetMat.SetShaderPassEnabled("SHADOWCASTER", Convert.ToInt16((int)csShad.floatValue) == 1 ? true : false);
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
        tempVar = targetMat.GetInt("_checkBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_checkDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_LeavesSpecular");
        checkSpecular = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormalToggle");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_Leaves_Rim");
        checkRim = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FoilageSetting");
        checkFoilage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_WindToggle");
        checkFoilageWind = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseToggle");
        noiseFold = tempVar == 1 ? true : false;

        //tempVar = targetMat.GetInt("_CheckTranslucent");
        //checkTranslucent = tempVar == 1 ? true : false;
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

/*
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
*/

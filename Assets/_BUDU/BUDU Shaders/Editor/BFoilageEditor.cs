// BUDU Games 2023 - 2025
using UnityEngine;
using UnityEditor;
using budu;
using UnityEditor.Rendering;

public class BFoilageEditor : ShaderGUI
{
    bool checkSpecular, checkNormal, checkRim, checkFoilage, checkWind, checkBase, checkDef, checkAO;
    bool aboutFold;
    bool noiseFold;
    int tempVar, blendingMode, isSpecular;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Foilage Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUFoilageTitle.png", 512, 32);
        #endregion

        #region Main Group
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);
 
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
        GUIExtras.SHeader("SPECULAR SETTINGS",ref checkSpecular,"_CheckSpec",targetMat,style);

        EditorGUILayout.BeginVertical(style);
        if(checkSpecular)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty spec = ShaderGUI.FindProperty("_LeavesSpecular",properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(spec, "Specular");
            }, GUILayout.Height(20));
            if(spec.floatValue > 0.0f)
            {
                MaterialProperty sc = ShaderGUI.FindProperty("_Leaves_Specular_Color", properties);
                MaterialProperty st = ShaderGUI.FindProperty("_Leaves_Specular_Texture", properties);
                MaterialProperty si = ShaderGUI.FindProperty("_Specular_Intensity", properties);
                MaterialProperty ss = ShaderGUI.FindProperty("_Smoothness", properties);
                materialEditor.ColorProperty(sc, "Specular Color");
                materialEditor.TextureProperty(st, "Specular Texture");
                materialEditor.RangeProperty(si, "Specular Intensity");
                materialEditor.RangeProperty(ss, "Specular Smoothness");
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

            MaterialProperty norm = ShaderGUI.FindProperty("_NormalToggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(norm, "Normal");
            }, GUILayout.Height(20));
            if(norm.floatValue > 0.0f)
            {
                MaterialProperty nmap = ShaderGUI.FindProperty("_Leaves_Normal_Map", properties);
                MaterialProperty nscl = ShaderGUI.FindProperty("_Normal_Scale", properties);
                materialEditor.TextureProperty(nmap, "Normal Map");
                materialEditor.RangeProperty(nscl, "Normal Scale");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rim Settings
        GUIExtras.SHeader("RIM LIGHT SETTIGNS", ref checkRim, "_CheckRimLight", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkRim)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rim = ShaderGUI.FindProperty("_Leaves_Rim", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(rim, "Rim Light");
            }, GUILayout.Height(20));
            if(rim.floatValue > 0.0f)
            {
                MaterialProperty fi = ShaderGUI.FindProperty("_FresnelInvert", properties);
                materialEditor.ShaderProperty(fi, "Invert Rim");

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
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Foilage Settings
        GUIExtras.SHeader("FOILAGE SETTINGS", ref checkFoilage, "_CheckFoilage", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkFoilage)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty eb = ShaderGUI.FindProperty("_Effect_Blend", properties);
            MaterialProperty inf = ShaderGUI.FindProperty("_Inflate", properties);
            MaterialProperty cs = ShaderGUI.FindProperty("_Card_Size", properties);
            MaterialProperty csr = ShaderGUI.FindProperty("_Random_Card_Size", properties);
            MaterialProperty csrr = ShaderGUI.FindProperty("_Card_Size_Random_Range", properties);
            MaterialProperty csrs = ShaderGUI.FindProperty("_Card_Size_Random_Strength", properties);
            MaterialProperty css = ShaderGUI.FindProperty("_CS_Seed", properties);
            MaterialProperty crot = ShaderGUI.FindProperty("_Card_Rotate", properties);
            MaterialProperty crotr = ShaderGUI.FindProperty("_Random_Rotate", properties);
            MaterialProperty crots = ShaderGUI.FindProperty("_Random_Rotate_Seed", properties);

            materialEditor.ShaderProperty(eb, "Effect Blend");
            materialEditor.ShaderProperty(inf, "Inflate");
            materialEditor.ShaderProperty(cs, "Card Size");
            materialEditor.ShaderProperty(csr, "Randomize Card Size");
            if(csr.floatValue > 0f)
            {
                materialEditor.ShaderProperty(csrr, "Range");
                materialEditor.ShaderProperty(csrs, "Strength");
                materialEditor.ShaderProperty(css, "Seed");
            }
            materialEditor.ShaderProperty(crot, "Card Rotation");
            materialEditor.ShaderProperty(crotr, "Randomize Card Rotation");
            if(crotr.floatValue > 0f)
            {
                materialEditor.ShaderProperty(crots, "Seed");
            }
            MaterialProperty sfoilTog = ShaderGUI.FindProperty("_Surface_Foilage", properties);
            materialEditor.ShaderProperty(sfoilTog, "Surface Foilage");
            if(sfoilTog.floatValue > 0f)
            {
                MaterialProperty sfi = ShaderGUI.FindProperty("_Surface_Foilage_Intensity", properties);
                materialEditor.ShaderProperty(sfi, "Intensity");
            }

            #region Foilage Wind Settings
            GUIExtras.SHeader("FOILAGE WIND", ref checkWind, "_CheckWind", targetMat, style);

            EditorGUILayout.BeginVertical(style);
            if(checkWind)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.Space(2);

                MaterialProperty wt = ShaderGUI.FindProperty("_WindToggle", properties);
                GUIExtras.ColoredVertical(BDColors.dBlueOrange(50), () =>
                {
                    materialEditor.ShaderProperty(wt, "Wind");
                }, GUILayout.Height(20));

                MaterialProperty wi = ShaderGUI.FindProperty("_Wind_Strength", properties);
                MaterialProperty ws = ShaderGUI.FindProperty("_Wind_Speed", properties);
                
                materialEditor.ShaderProperty(wi, "Wind Strength");
                materialEditor.ShaderProperty(ws, "Wind Speed");

                GUIExtras.SFoldout(targetMat, "_NoiseToggle", "Noise Settings", BDColors.DarkRed(120), () =>
                {
                    MaterialProperty natog = ShaderGUI.FindProperty("_WIND_NOISE_TYPE", properties);
                    MaterialProperty perLe = ShaderGUI.FindProperty("_Per_Leaves", properties);
                    MaterialProperty noisInv = ShaderGUI.FindProperty("_Noise_Invert", properties);

                    materialEditor.ShaderProperty(natog, "Noise Type");
                    materialEditor.ShaderProperty(noisInv, "Invert Noise");
                    materialEditor.ShaderProperty(perLe, "Per Leaves");

                    switch ((int)natog.floatValue)
                    {
                        case 0:
                            MaterialProperty celD = ShaderGUI.FindProperty("_Cell_Density", properties);
                            materialEditor.ShaderProperty(celD, "Cell Density");
                            break;
                        case 1:
                        case 2:
                            MaterialProperty noiScl = ShaderGUI.FindProperty("_Wind_Noise_Scale", properties);
                            materialEditor.ShaderProperty(noiScl, "Noise Scale");
                            break;
                        case 3:
                            MaterialProperty ntxt = ShaderGUI.FindProperty("_Wind_Noise_Texture", properties);
                            MaterialProperty ntxtlod = ShaderGUI.FindProperty("_WNT_LOD", properties);
                            materialEditor.ShaderProperty(ntxt, "Wind Texture");
                            materialEditor.ShaderProperty(ntxtlod, "Wind Texture Blur");
                            break;
                    }
                });
                EditorGUI.indentLevel--;
            }
            #endregion
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region AO Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ao = ShaderGUI.FindProperty("_AO_From_Normal",properties);
            GUIExtras.ColoredVertical(BDColors.NexusBlue(50), () =>
            {
                materialEditor.ShaderProperty(ao, "Ambient Occlusion for Leaves");
            }, GUILayout.Height(20));
            if(ao.floatValue > 0.0f)
            {
                MaterialProperty aoI = ShaderGUI.FindProperty("_AO_Intensity", properties);
                materialEditor.ShaderProperty(aoI, "Intensity");
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
            true, 
            true, 
            true, 
            false, 
            true, 
            true, 
            true, 
            true);
        #endregion

        #region BUDU Copyright
        EditorGUILayout.Space(5);
        GUI.backgroundColor= BDColors.Transparent(0);
        style.normal.textColor = BDColors.NexusOrange(153);
        style.fontSize = 10;
        style.fontStyle = FontStyle.Italic;

        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        aboutFold = EditorGUILayout.Foldout(aboutFold, "About", toggleOnLabelClick: true, style);
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();
        if (aboutFold)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            Texture budulogo = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDUGAMES-About.png", typeof(Texture));
            Rect rect = GUILayoutUtility.GetRect(400, 50, GUILayout.ExpandWidth(false));
            GUI.DrawTexture(rect, budulogo, ScaleMode.ScaleToFit, true);
            GUILayout.FlexibleSpace();
            EditorGUILayout.EndHorizontal();
        }
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        ShaderGUIHelpers.WorkflowControl(targetMat, ref isSpecular);

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSpec");
        checkSpecular = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNormal = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckRimLight");
        checkRim = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFoilage");
        checkFoilage = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckWind");
        checkWind = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NoiseToggle");
        noiseFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        blendingMode = targetMat.GetInt("_Blending_Mode");
    }
}

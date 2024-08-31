using UnityEngine;
using UnityEditor;
using System;
using budu;
using UnityEngine.Rendering;


public class BLitParticleEditor : ShaderGUI
{
    bool checkDef, checkBase, checkInd, checkShd, checkNorm, checkCustomAlpha;
    bool aboutFold, prtTxtFold, nrmTxtFold, mskTxtFold, vorTxtFold;
    int tempVar;
    LocalKeyword customAlpha;

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Toon Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDULitParticleTitle.png", typeof(Texture));
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

            MaterialProperty pBlending = ShaderGUI.FindProperty("_BlendingOps",properties);
            materialEditor.ShaderProperty(pBlending, "Blend Mode");

            #region Blending Settings
            switch((int)pBlending.floatValue)
            {
                case 0:
                    // Alpha Blending
                    targetMat.SetInt("SrcBlend", (int)BlendMode.SrcAlpha);
                    targetMat.SetInt("_DstBlend", (int)BlendMode.OneMinusSrcAlpha);
                    //// BlendMode.SrcAlpha - BlendMode.OneMinusSrcAlpha
                    break;
                case 1:
                    // Premultiply
                    targetMat.SetInt("SrcBlend", (int)BlendMode.One);
                    targetMat.SetInt("_DstBlend", (int)BlendMode.OneMinusSrcAlpha);
                    break;
                case 2:
                    // Additive
                    targetMat.SetInt("SrcBlend", (int)BlendMode.One);
                    targetMat.SetInt("_DstBlend", (int)BlendMode.One);
                    break;
                case 3:
                    // Soft Additive
                    targetMat.SetInt("SrcBlend", (int)BlendMode.OneMinusDstColor);
                    targetMat.SetInt("_DstBlend", (int)BlendMode.One);
                    break;
                case 4:
                    // Particle Additive
                    targetMat.SetInt("SrcBlend", (int)BlendMode.SrcAlpha);
                    targetMat.SetInt("_DstBlend", (int)BlendMode.One);
                    break;
            }
            #endregion

            MaterialProperty pColor = ShaderGUI.FindProperty("_ParticleColor", properties);
            MaterialProperty pTxture = ShaderGUI.FindProperty("_ParticleTexture", properties);
            MaterialProperty pTxtInt = ShaderGUI.FindProperty("_ParticleTextureIntensity", properties);
            MaterialProperty shColor = ShaderGUI.FindProperty("_DarkAreaColor", properties);
            MaterialProperty shWeight = ShaderGUI.FindProperty("_DarkArea", properties);
            MaterialProperty areaScale = ShaderGUI.FindProperty("_AreaScale", properties);
            MaterialProperty areaOffset = ShaderGUI.FindProperty("_AreaOffset", properties);

            materialEditor.ShaderProperty(pColor, "Particle Color");
            materialEditor.ShaderProperty(pTxture, "Particle Texture");
            materialEditor.ShaderProperty(pTxtInt, "Particle Texture Intensity");
            materialEditor.ShaderProperty(shColor, "Shade Color");
            materialEditor.ShaderProperty(shWeight, "Shade Intensity");
            materialEditor.ShaderProperty(areaScale, "Area Scale");
            materialEditor.ShaderProperty(areaOffset, "Area Offset");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            prtTxtFold = EditorGUILayout.Foldout(prtTxtFold, "Particle Textre Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_prtTxtFold", Convert.ToInt16(prtTxtFold));
            if(prtTxtFold)
            {
                EditorGUI.indentLevel++;
                PartTxtSet(materialEditor, properties);
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Indirect Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);

        checkInd = EditorGUILayout.ToggleLeft("INDIRECT LIGHT SETTINGS", checkInd, style);
        targetMat.SetInt("_CheckInd", Convert.ToInt16(checkInd));
        targetMat.SetInt("_IndirectToggle",Convert.ToInt16(checkInd));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkInd)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(-10);

            MaterialProperty indSpecColor = ShaderGUI.FindProperty("_IndirectSpecularColor", properties);
            MaterialProperty indSpecSmooth = ShaderGUI.FindProperty("_IndirectSpecularSmoothness", properties);
            MaterialProperty indDiffuse = ShaderGUI.FindProperty("_IndirectDiffuse",properties);

            materialEditor.ShaderProperty(indSpecColor, "Indirect Specular Color");
            materialEditor.ShaderProperty(indSpecSmooth, "Indirect Specular Smoothnees");
            EditorGUILayout.Space(-10);
            materialEditor.ShaderProperty(indDiffuse, "Indirect Diffuse");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Custom Alpha Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();
        EditorGUILayout.BeginVertical(style);

        checkCustomAlpha = EditorGUILayout.ToggleLeft("CUSTOM MASK SETTINGS", checkCustomAlpha, style);
        targetMat.SetInt("_CustomAlpha", Convert.ToInt16(checkCustomAlpha));
        customAlpha = new LocalKeyword(targetMat.shader, "_CUSTOMALPHA_ON");
        targetMat.SetKeyword( customAlpha, checkCustomAlpha);

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkCustomAlpha)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty alpInt = ShaderGUI.FindProperty("_AlphaIntensity", properties);
            MaterialProperty alpDebug = ShaderGUI.FindProperty("_CustomAlphaDebug", properties);
            MaterialProperty alpClamp = ShaderGUI.FindProperty("_ClampValue", properties);
            MaterialProperty alpExp = ShaderGUI.FindProperty("_AlphaExponential", properties);
            MaterialProperty alpNoiseWeight = ShaderGUI.FindProperty("_AlphaNoiseWeight", properties);
            MaterialProperty alpType = ShaderGUI.FindProperty("_CircleType", properties);
            MaterialProperty alpMethod = ShaderGUI.FindProperty("_MaskMethod", properties);
            MaterialProperty alpMap = ShaderGUI.FindProperty("_MaskNoiseMap", properties);

            materialEditor.ShaderProperty(alpInt, "Mask Intensity");

            style.normal.background = MakeBackground(1, 1, bdColors.BrightRed(100));
            EditorGUILayout.BeginVertical(style);
            materialEditor.ShaderProperty(alpDebug, "Custom Mask Debug");
            EditorGUILayout.EndVertical();

            materialEditor.ShaderProperty(alpNoiseWeight, "Mask Noise Weight");
            materialEditor.ShaderProperty(alpMap, "Mask Texture");
            materialEditor.ShaderProperty(alpType, "Mask Grade Type");
            materialEditor.ShaderProperty(alpMethod, "Mask Method");
            materialEditor.ShaderProperty(alpClamp, "Mask Clamp");
            materialEditor.ShaderProperty(alpExp, "Mask Contrast");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            mskTxtFold = EditorGUILayout.Foldout(mskTxtFold, "Mask Textre Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_mskTxtFold", Convert.ToInt16(mskTxtFold));
            if(mskTxtFold)
            {
                EditorGUI.indentLevel++;
                MaskTxtSet(materialEditor, properties);
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(40));
            EditorGUILayout.BeginVertical(style);
            MaterialProperty defTog = ShaderGUI.FindProperty("_NoiseDeformToggle", properties);
            materialEditor.ShaderProperty(defTog, "Deform");
            if(defTog.floatValue > 0.0f)
            {
                MaterialProperty DeformInt = ShaderGUI.FindProperty("_DeformIntensity", properties);
                MaterialProperty vorAng = ShaderGUI.FindProperty("_VoronoiAngle", properties);
                MaterialProperty vorScale = ShaderGUI.FindProperty("_VoronoiScale", properties);
                MaterialProperty vorSmooth = ShaderGUI.FindProperty("_VoronoiSmooth", properties);

                materialEditor.ShaderProperty(DeformInt, "Deform Intensity");
                materialEditor.ShaderProperty(vorAng, "Voronoi Angle");
                materialEditor.ShaderProperty(vorScale, "Voronoi Scale");
                materialEditor.ShaderProperty(vorSmooth, "Voronoi Smooth");

                style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(30));
                EditorGUILayout.BeginVertical(style);
                vorTxtFold = EditorGUILayout.Foldout(vorTxtFold, "Deform Texture Settings", toggleOnLabelClick: true);
                targetMat.SetInt("_vorTxtFold", Convert.ToInt16(vorTxtFold));
                if(vorTxtFold)
                {
                    EditorGUI.indentLevel++;
                    VorTxtSet(materialEditor, properties);
                    EditorGUI.indentLevel--;
                }
                EditorGUILayout.EndVertical();

            }
            EditorGUILayout.EndVertical();

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

        checkNorm = EditorGUILayout.ToggleLeft("NORMAL SETTINGS", checkNorm, style);
        targetMat.SetInt("_NormalToggle", Convert.ToInt16(checkNorm));

        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);

        if(checkNorm)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty nrmMap = ShaderGUI.FindProperty("_NormalMap", properties);
            MaterialProperty nrmScale = ShaderGUI.FindProperty("_NormalScale", properties);

            materialEditor.ShaderProperty(nrmMap, "Normal Map");
            materialEditor.ShaderProperty(nrmScale, "Normal Scale");

            style.normal.background = MakeBackground(1, 1, bdColors.DarkRed(20));
            EditorGUILayout.BeginVertical(style);
            nrmTxtFold = EditorGUILayout.Foldout(nrmTxtFold, "Normal Texture Settings", toggleOnLabelClick: true);
            targetMat.SetInt("_nrmTxtFold", Convert.ToInt16(nrmTxtFold));
            if(nrmTxtFold)
            {
                EditorGUI.indentLevel++;
                NormTxtSet(materialEditor, properties);
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
            EditorGUI.indentLevel--;
        }

        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shadow Settings
        style.normal.background = MakeBackground(1, 1, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        checkShd = EditorGUILayout.ToggleLeft("SHADOW SETTINGS", checkShd, style);
        targetMat.SetInt("_CheckShd", Convert.ToInt16(checkShd));
        EditorGUILayout.EndVertical();

        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(checkShd)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty shdAlphaClipTh = ShaderGUI.FindProperty("_AlphaClipThresholdShadow", properties);
            materialEditor.ShaderProperty(shdAlphaClipTh, "Shadow Alpha Clip Threshold");

            MaterialProperty recshad = ShaderGUI.FindProperty("_ReceiveShadows", properties);

            materialEditor.ShaderProperty(recshad, "Receive Shadows");
            if(recshad.floatValue > 0.0f)
            {
                MaterialProperty enShdColor = ShaderGUI.FindProperty("_ShadowColorEnable", properties);
                MaterialProperty shdStrength = ShaderGUI.FindProperty("_ShadowStrength", properties);
                MaterialProperty shdSharp = ShaderGUI.FindProperty("_ShadowSharpness", properties);
                MaterialProperty shdOffset = ShaderGUI.FindProperty("_ShadowOffset", properties);

                materialEditor.ShaderProperty(enShdColor, "Enable Shadow Color");
                if(enShdColor.floatValue > 0.0f)
                {
                    MaterialProperty shdColor = ShaderGUI.FindProperty("_ShadowColor", properties);
                    materialEditor.ShaderProperty(shdColor, "Shadow Color");
                }
                EditorGUILayout.Space(-10);
                materialEditor.ShaderProperty(shdStrength, "Shadow Strength");
                materialEditor.ShaderProperty(shdSharp, "Shadow Sharpness");
                materialEditor.ShaderProperty(shdOffset, "Shadow Offset");
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
            EditorGUILayout.HelpBox(gc, true);
        }
        #endregion

        EditorGUILayout.Space(50);

        //Debug.Log("Normal Durumu " + ShaderGUI.FindProperty("_NormalToggle",properties));

        //base.OnGUI(materialEditor, properties);


    }

    void loadMaterialVariables(Material targetMat)
    {

        tempVar = targetMat.GetInt("_CustomAlpha");
        checkCustomAlpha = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_mskTxtFold");
        mskTxtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_vorTxtFold");
        vorTxtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_nrmTxtFold");
        nrmTxtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_NormalToggle");
        checkNorm = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_prtTxtFold");
        prtTxtFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckShd");
        checkShd = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckInd");
        checkInd = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_aboutFold");
        aboutFold = tempVar == 1 ? true : false;
    }

    void PartTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedPT = new BD_ScaleOffset_GUI();
        selectedPT.Tile.x = "_ParticleTileX";
        selectedPT.Tile.y = "_ParticleTileY";
        selectedPT.Offset.x = "_ParticleOffsetX";
        selectedPT.Offset.y = "_ParticleOffsetY";
        selectedPT.Speed.x = "_ParticleSpeedX";
        selectedPT.Speed.y = "_ParticleSpeedY";
        selectedPT.Anchor.x = "_ParticleAnchorX";
        selectedPT.Anchor.y = "_ParticleAnchorY";
        selectedPT.OverallSpeed = "_ParticleOverallSpeed";
        selectedPT.Rotate = "_ParticleRotate";
        selectedPT.RotateSpeed = "_ParticleRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedPT);

    }
    void NormTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedPT = new BD_ScaleOffset_GUI();
        selectedPT.Tile.x = "_NormTileX";
        selectedPT.Tile.y = "_NormTileY";
        selectedPT.Offset.x = "_NormOffsetX";
        selectedPT.Offset.y = "_NormOffsetY";
        selectedPT.Speed.x = "_NormSpeedX";
        selectedPT.Speed.y = "_NormSpeedY";
        selectedPT.Anchor.x = "_NormAnchorX";
        selectedPT.Anchor.y = "_NormAnchorY";
        selectedPT.OverallSpeed = "_NormOverallSpeed";
        selectedPT.Rotate = "_NormRotate";
        selectedPT.RotateSpeed = "_NormRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedPT);

    }
    void VorTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedPT = new BD_ScaleOffset_GUI();
        selectedPT.Tile.x = "_VorTileX";
        selectedPT.Tile.y = "_VorTileY";
        selectedPT.Offset.x = "_VorOffsetX";
        selectedPT.Offset.y = "_VorOffsetY";
        selectedPT.Speed.x = "_VorSpeedX";
        selectedPT.Speed.y = "_VorSpeedY";
        selectedPT.Anchor.x = "_VorAnchorX";
        selectedPT.Anchor.y = "_VorAnchorY";
        selectedPT.OverallSpeed = "_VorOverallSpeed";
        selectedPT.Rotate = "_VorRotate";
        selectedPT.RotateSpeed = "_VorRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedPT);

    }
    void MaskTxtSet(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        BD_ScaleOffset_GUI selectedPT = new BD_ScaleOffset_GUI();
        selectedPT.Tile.x = "_MaskTileX";
        selectedPT.Tile.y = "_MaskTileY";
        selectedPT.Offset.x = "_MaskOffsetX";
        selectedPT.Offset.y = "_MaskOffsetY";
        selectedPT.Speed.x = "_MaskSpeedX";
        selectedPT.Speed.y = "_MaskSpeedY";
        selectedPT.Anchor.x = "_MaskAnchorX";
        selectedPT.Anchor.y = "_MaskAnchorY";
        selectedPT.OverallSpeed = "_MaskOverallSpeed";
        selectedPT.Rotate = "_MaskRotate";
        selectedPT.RotateSpeed = "_MaskRotateSpeed";
        BDShaderGUI.ScaleOffsetGUI(materialEditor, properties, selectedPT);

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

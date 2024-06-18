using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BFogEditor : ShaderGUI
{
    bool checkFog, check3DFog, checkBlend;
    bool aboutFold, fogFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUFogTitle.png", typeof(Texture));

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

        #region Main Group
        style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));

        MaterialProperty fc = ShaderGUI.FindProperty("_FogColor", properties);
        MaterialProperty ft = ShaderGUI.FindProperty("_Transparency", properties);
        MaterialProperty blendOps = ShaderGUI.FindProperty("_BlendingOp", properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(fc, "Fog Color");
            materialEditor.RangeProperty(ft, "Fog Transparency");
            materialEditor.ShaderProperty(blendOps, "Blending Operations");
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Fog Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            checkFog = EditorGUILayout.ToggleLeft("FOG", checkFog, style);
            targetMat.SetInt("_FogSwitch", Convert.ToInt16(checkFog));
            if(checkFog)
            {
                style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
                EditorGUILayout.BeginVertical(style);
                check3DFog = EditorGUILayout.Toggle("Layered Fog", check3DFog);
                targetMat.SetInt("_3DFog",Convert.ToInt16(check3DFog));
                #region 3D Fog
                if(check3DFog)
                {
                    // 3D
                    MaterialProperty fog3DGradeType = ShaderGUI.FindProperty("_Depth3DGradeType", properties);
                    MaterialProperty fog3dInv = ShaderGUI.FindProperty("_3DFogInvert", properties);
                    MaterialProperty fog3dGExp = ShaderGUI.FindProperty("_3DGradeExponential", properties);
                    MaterialProperty fog3dScl = ShaderGUI.FindProperty("_3DGradeScale", properties);
                    MaterialProperty fog3dOff = ShaderGUI.FindProperty("_3DGradeOffset", properties);

                    EditorGUILayout.HelpBox("Request 3D Layered Planes! |||||||", MessageType.Warning);

                    materialEditor.ShaderProperty(fog3DGradeType, "Layered Fog Grade Type");
                    materialEditor.ShaderProperty(fog3dInv, "Invert Layered Fog");
                    materialEditor.ShaderProperty(fog3dGExp, "3D Grade Exponential");
                    materialEditor.ShaderProperty(fog3dScl, "3D Grade Scale");
                    materialEditor.ShaderProperty(fog3dOff, "3D Grade Offset");

                }
                #endregion
                else
                #region 2D Fog
                {
                    // 2D
                    MaterialProperty fogGradeType = ShaderGUI.FindProperty("_DepthGradeType",properties);
                    MaterialProperty fogInv = ShaderGUI.FindProperty("_DepthInvert", properties);
                    MaterialProperty fogGExp = ShaderGUI.FindProperty("_GradeExponential", properties);
                    MaterialProperty fogCamDFL = ShaderGUI.FindProperty("_CameraDepthFadeLength", properties);
                    MaterialProperty fogCamDFO = ShaderGUI.FindProperty("_CameraDepthFadeOffset", properties);
                    MaterialProperty fogScl = ShaderGUI.FindProperty("_GradeScale", properties);
                    MaterialProperty fogOff = ShaderGUI.FindProperty("_GradeOffset", properties);
                    MaterialProperty depthExp = ShaderGUI.FindProperty("_Exponential", properties);
                    MaterialProperty depthDistanmce = ShaderGUI.FindProperty("_DepthFadeDistance", properties);

                    materialEditor.ShaderProperty(fogGradeType, "Fog Grade Type");
                    materialEditor.ShaderProperty(depthExp, "Depth Exponential");
                    materialEditor.ShaderProperty(depthDistanmce, "Depth Distance");
                    materialEditor.ShaderProperty(fogCamDFL, "Camera Depth Fade Length");
                    materialEditor.ShaderProperty(fogCamDFO, "Camera Depth Fade Offset");
                    EditorGUILayout.Space(1);
                    materialEditor.ShaderProperty(fogInv, "Invert Fog");
                    materialEditor.ShaderProperty(fogGExp, "Grade Exponential");
                    materialEditor.ShaderProperty(fogScl, "Grade Scale");
                    materialEditor.ShaderProperty(fogOff, "Grade Offset");
                }
                #endregion
                EditorGUILayout.EndVertical();
            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Shader Defaults
        materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
        #endregion

        #region BUDU Copyright
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
        checkBlend = true;
        if(checkBlend)
        {
            //checkBlend = false;
            switch(targetMat.GetInt("_BlendingOp"))
            {
                case 0: // Alpha Blend
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                    break;
                case 1: // Premultiplied
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                    break;
                case 2: // Additive
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    break;
                case 3: // Soft Additive
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusDstColor);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    break;
                case 4: // Multiplicative
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.DstColor);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                    break;
                case 5: // 2x Multiplicative
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.DstColor);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.SrcColor);
                    break;
                case 6: // Particle Additive
                    targetMat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                    targetMat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.One);
                    break;
            }
        }

        tempVar = targetMat.GetInt("_FogSwitch");
        checkFog = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_3DFog");
        check3DFog = tempVar == 1 ? true : false;
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



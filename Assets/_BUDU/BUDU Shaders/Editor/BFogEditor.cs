// © BUDU Games 2024 - 2026
// BUDU Fog Shader Editor

using UnityEngine;
using UnityEditor;
using budu;

public class BFogEditor : ShaderGUI
{
    bool checkFog, checkBase, checkDef;
    bool aboutFold;
    int tempVar, blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUFogTitle.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS",ref checkBase,"_CheckBase",targetMat,style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);
            MaterialProperty fog3d = ShaderGUI.FindProperty("_3D_Fog", properties);
            MaterialProperty fc = ShaderGUI.FindProperty("_Fog_Color", properties);

            MaterialProperty addFog = ShaderGUI.FindProperty("_Additive_Color", properties);
            materialEditor.ShaderProperty(fog3d, "3D Fog");
            materialEditor.ShaderProperty(fc, "Fog Color");
            materialEditor.ShaderProperty(addFog, "Additive Color");
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fog Settings
        GUIExtras.SHeader("FOG Settings", ref checkFog, "_CheckFog", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkFog)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ft = ShaderGUI.FindProperty("_Transparency", properties);

            materialEditor.ShaderProperty(ft, "Fog Transparency");

            EditorGUILayout.Space(1);

            MaterialProperty fog3d = ShaderGUI.FindProperty("_3D_Fog",properties);
            #region 3D Fog
            if(fog3d.floatValue > 0f)
            {
                // 3D
                EditorGUILayout.HelpBox("Request 3D Layered Planes! |||||||", MessageType.Warning);
            }
            #endregion
            else
            #region 2D Fog
            {
                // 2D
                MaterialProperty fogInv = ShaderGUI.FindProperty("_Depth_Invert", properties);
                MaterialProperty fogGExp = ShaderGUI.FindProperty("_Depth_Exponential", properties);
                MaterialProperty depthDistanmce = ShaderGUI.FindProperty("_Depth_Fade_Distance", properties);

                materialEditor.ShaderProperty(depthDistanmce, "Depth Distance");
                materialEditor.ShaderProperty(fogGExp, "Depth Exponential");
                materialEditor.ShaderProperty(fogInv, "Invert Fog");
            }
            #endregion
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS",ref checkDef,"_CheckDef",targetMat,style);
        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, false, false, false, true, false, false, true, true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        // Workflow does not exist because it is unlit.

        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFog");
        checkFog = tempVar == 1 ? true : false;

        blendingMode = targetMat.GetInt("_Blending_Mode");
    }
}



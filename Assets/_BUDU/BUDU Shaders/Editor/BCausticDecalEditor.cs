// BUDU Games 2023 - 2025
using budu;
using UnityEditor;
using UnityEngine;

public class BCausticDecalEditor : ShaderGUI
{
    bool checkBase, checkDef, checkCaustic, checkCA, checkDeform;
    bool aboutFold, caspdFold, billowSpeedFold;
    int tempVar, blendingMode;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Caustic Decal Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUCausticDecal.png", 512, 32);
        #endregion

        #region Base Settings
        //GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        //EditorGUILayout.BeginVertical(style);
        //if(checkBase)
        //{
        //    EditorGUI.indentLevel++;
        //    EditorGUILayout.Space(2);

        //    //MaterialProperty st = ShaderGUI.FindProperty("_Shade_Toggle", properties);
        //    //materialEditor.ShaderProperty(st, "ShadeToggle");

        //    EditorGUI.indentLevel--;
        //}
        //EditorGUILayout.EndVertical();
        //EditorGUILayout.Space(1);
        #endregion

        #region Caustic Settings
        GUIExtras.SHeader("CAUSTIC SETTINGS", ref checkCaustic, "_CheckCaustic", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkCaustic)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty caTxt = ShaderGUI.FindProperty("_Caustic_Texture", properties);
            MaterialProperty caInt = ShaderGUI.FindProperty("_Caustic_Intensity", properties);
            MaterialProperty rot = ShaderGUI.FindProperty("_Rotate", properties);
            MaterialProperty decFOff = ShaderGUI.FindProperty("_Decal_Falloff", properties);
            MaterialProperty caTiles = ShaderGUI.FindProperty("_Caustic_Tiles", properties);
            MaterialProperty csSpeed = ShaderGUI.FindProperty("_Caustic_Speed", properties);
            MaterialProperty csSpeedAX = ShaderGUI.FindProperty("_Caustic_Speed_AX", properties);
            MaterialProperty csSpeedAY = ShaderGUI.FindProperty("_Caustic_Speed_AY", properties);
            MaterialProperty csSpeedBX = ShaderGUI.FindProperty("_Caustic_Speed_BX", properties);
            MaterialProperty csSpeedBY = ShaderGUI.FindProperty("_Caustic_Speed_BY", properties);

            ShaderGUIHelpers.FloatSliderFree(materialEditor, caInt, "Caustic Intensity",0,10);
            materialEditor.ShaderProperty(caTxt, "Caustic Texture");
            ShaderGUIHelpers.Vector2Property(materialEditor, caTiles, "Tiles");
            materialEditor.ShaderProperty(caInt, "Intensity");
            materialEditor.ShaderProperty(rot, "layers Rotate");
            materialEditor.ShaderProperty(decFOff, "Decal Falloff");

            GUIExtras.SFoldout(targetMat, "_caspdFold", "Speed Controls", BDColors.DarkRed(120), () =>
            {
                ShaderGUIHelpers.FloatSliderFree(materialEditor, csSpeed, "Speed", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, csSpeedAX, "Speed AX", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, csSpeedAY, "Speed AY", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, csSpeedBX, "Speed BX", -1, 1);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, csSpeedBY, "Speed BY", -1, 1);
            });

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Deform Settings
        GUIExtras.SHeader("DEFORM SETTINGS", ref checkDeform,  "_CheckDeform", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkDeform)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty dt = ShaderGUI.FindProperty("_Deform_Toggle", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(dt, "Deform");
            }, GUILayout.Height(20));

            if(dt.floatValue > 0)
            {
                MaterialProperty defStr = ShaderGUI.FindProperty("_Deform_Strength", properties);
                MaterialProperty defBFreq = ShaderGUI.FindProperty("_Billow_Frequency", properties);
                MaterialProperty defBIOR = ShaderGUI.FindProperty("_Billow_IOR", properties);

                MaterialProperty defBSpd = ShaderGUI.FindProperty("_Billow_Speed", properties);
                MaterialProperty defBTrSpd = ShaderGUI.FindProperty("_Billow_Overall_Speed", properties);
                MaterialProperty defBTrSpdAX = ShaderGUI.FindProperty("_Billow_Transform_AX", properties);
                MaterialProperty defBTrSpdAY = ShaderGUI.FindProperty("_Billow_Transform_AY", properties);
                MaterialProperty defBTrSpdBX = ShaderGUI.FindProperty("_Billow_Transform_BX", properties);
                MaterialProperty defBTrSpdBY = ShaderGUI.FindProperty("_Billow_Transform_BY", properties);

                materialEditor.ShaderProperty(defStr, "Strength");
                materialEditor.ShaderProperty(defBFreq, "Billow Frequency");
                materialEditor.ShaderProperty(defBIOR, "Billow IOR");

                GUIExtras.SFoldout(targetMat,"_billowSpeedFold", "Speed Controls", BDColors.DarkRed(120), () =>
                {
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBSpd, "Billow Speed", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBTrSpd, "Overall Speed", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBTrSpdAX, "Speed Speed AX", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBTrSpdAY, "Speed AY", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBTrSpdBX, "Speed BX", -1, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, defBTrSpdBY, "Speed BY", -1, 1);
                });
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Chromatic Aberration Settings
        GUIExtras.SHeader("CHROMATIC ABERRATION SETTINGS", ref checkCA, "_CheckCA", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkCA)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty cat = ShaderGUI.FindProperty("_Chromatic_Aberration", properties);
            GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
            {
                materialEditor.ShaderProperty(cat, "Chromatic Aberration");
            }, GUILayout.Height(20));

            if(cat.floatValue  > 0)
            {
                MaterialProperty InInt = ShaderGUI.FindProperty("_Input_Intensity", properties);
                MaterialProperty Red = ShaderGUI.FindProperty("_Red_XY", properties);
                MaterialProperty Green = ShaderGUI.FindProperty("_Green_XY", properties);
                MaterialProperty Blue = ShaderGUI.FindProperty("_Blue_XY", properties);

                materialEditor.ShaderProperty(InInt, "Input Intensity");

                ShaderGUIHelpers.Vector2Property(materialEditor, Red, "Red Shifting");
                ShaderGUIHelpers.Vector2Property(materialEditor, Green, "Green Shifting");
                ShaderGUIHelpers.Vector2Property(materialEditor, Blue, "Blue Shifting");

                MaterialProperty cablur = ShaderGUI.FindProperty("_Channel_Blur", properties);
                GUIExtras.ColoredVertical(BDColors.NexusOrange(50), () =>
                {
                    materialEditor.ShaderProperty(cablur, "Channel Blur");
                }, GUILayout.Height(20));

                if(cablur.floatValue > 0)
                {
                    MaterialProperty RedB = ShaderGUI.FindProperty("_Red_Blur", properties);
                    MaterialProperty GreenB = ShaderGUI.FindProperty("_Green_Blur", properties);
                    MaterialProperty BlueB = ShaderGUI.FindProperty("_Blue_Blur", properties);
                    MaterialProperty BlurSamp = ShaderGUI.FindProperty("_Blur_Samples", properties);

                    ShaderGUIHelpers.FloatSliderFree(materialEditor, RedB, "Red Blur", 0, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, GreenB, "Green Blur", 0, 1);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, BlueB, "Blue Blur", 0, 1);

                    ShaderGUIHelpers.IntSlider(materialEditor, BlurSamp, "Blur Samples", 8, 64);
                }
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
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style, "Assets/_BUDU/GUI/BUDUGAMES-About.png");
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCaustic");
        checkCaustic = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckCA");
        checkCA = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDeform");
        checkDeform = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_caspdFold");
        caspdFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_billowSpeedFold");
        billowSpeedFold = tempVar == 1 ? true : false;
    }
}



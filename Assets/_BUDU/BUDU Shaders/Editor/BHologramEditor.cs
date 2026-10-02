// © BUDU Games 2024 - 2026
// BUDU Hologram Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BHologramEditor : ShaderGUI
{
    bool checkBase, checkDef, checkLight, checkFresnel, checkInterior, checkScanner, checkStaticNoise, checkFRScan, checkFlicker, checkSinus, checkNoiseFlicker;
    bool aboutFold, fresnelAFold, fresnelBFold, scanAFold, scanBFold, scanCFold, lightAFold, lightBFold;
    int tempVar, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Hologram Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDUHologram.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ba = ShaderGUI.FindProperty("_Base_Alpha", properties);
            MaterialProperty baaf = ShaderGUI.FindProperty("_Base_Alpha_Affect_Fresnel", properties);
            MaterialProperty ac = ShaderGUI.FindProperty("_Alpha_Cliping", properties);
            MaterialProperty act = ShaderGUI.FindProperty("_Alpha_Clip_Threshold", properties);
            MaterialProperty hi = ShaderGUI.FindProperty("_Hologram_Intensity", properties);

            materialEditor.ShaderProperty(ba, "Base Alpha");
            materialEditor.ShaderProperty(baaf, "Affect Fresnel");
            materialEditor.ShaderProperty(ac, "Alpha Clipping");
            if(ac.floatValue > 0.0f)
            {
                materialEditor.ShaderProperty(act, "Alpha Clipping Threshold");
                targetMat.EnableKeyword("_ALPHATEST_ON");
                targetMat.SetFloat("_AlphaClip", 1.0f);
            }
            else
            {
                targetMat.DisableKeyword("_ALPHATEST_ON");
                targetMat.SetFloat("_AlphaClip", 0.0f);
            }
            materialEditor.ShaderProperty(hi, "Hologram Intensity");

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Light Settings
        GUIExtras.SHeader("LIGHT SETTINGS", ref checkLight, "_CheckLight", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkLight)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty lt = ShaderGUI.FindProperty("_Lights_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(lt, "Light");
            });
            if(lt.floatValue > 0.0f)
            {
                MaterialProperty LAInt = ShaderGUI.FindProperty("_Light_A_Intensity", properties);
                MaterialProperty LACol = ShaderGUI.FindProperty("_Light_A_Color", properties);
                MaterialProperty LADir = ShaderGUI.FindProperty("_Light_A_Direction", properties);
                MaterialProperty LBInt = ShaderGUI.FindProperty("_Light_B_Intensity", properties);
                MaterialProperty LBCol = ShaderGUI.FindProperty("_Light_B_Color", properties);
                MaterialProperty LBDir = ShaderGUI.FindProperty("_Light_B_Direction", properties);

                GUIExtras.SFoldout(targetMat, "_LightAFold", "Light A Settings", BDColors.Black(20), 10,BDColors.White(255),BDColors.Black(40),true,() =>
                {
                    materialEditor.ShaderProperty(LAInt, "A Intensity");
                    materialEditor.ShaderProperty(LACol, "A Color");
                    ShaderGUIHelpers.Vector3Property(materialEditor, LADir, "A Direction");
                });
                GUIExtras.SFoldout(targetMat,"_LightBFold", "Light B Settings", BDColors.Black(20), 10,BDColors.White(255),BDColors.Black(40),true,() =>
                {
                    materialEditor.ShaderProperty(LBInt, "B Intensity");
                    materialEditor.ShaderProperty(LBCol, "B Color");
                    ShaderGUIHelpers.Vector3Property(materialEditor, LBDir, "B Direction");
                });
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fresnel Settings
        GUIExtras.SHeader("FRESNEL SETTINGS", ref checkFresnel, "_CheckFresnel", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkFresnel)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty fac = ShaderGUI.FindProperty("_Fresnel_Affect_Color", properties);
            MaterialProperty fi = ShaderGUI.FindProperty("_Fresnel_Intensity", properties);
            MaterialProperty hbc = ShaderGUI.FindProperty("_Hologram_Base_Color", properties);
            MaterialProperty hdc = ShaderGUI.FindProperty("_Hologram_Deep_Color", properties);

            materialEditor.ShaderProperty(fac, "Affect Color");
            materialEditor.ShaderProperty(fi, "Intensity");
            materialEditor.ShaderProperty(hbc, "Hologram Base Color");
            materialEditor.ShaderProperty(hdc, "Hologram Deep Color");

            #region Fresnel A
            GUIExtras.SFoldout(targetMat, "_FresnelAFold", "Fresnel A Settings", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true,() =>
            {
                MaterialProperty FA= ShaderGUI.FindProperty("_Fresnel_A", properties);
                GUIExtras.SColoredVertical(BDColors.Black(20), 20,true, () =>
                {
                    materialEditor.ShaderProperty(FA, "Fresnel A");
                });
                if(FA.floatValue > 0f)
                {
                    MaterialProperty fai = ShaderGUI.FindProperty("_Fresnel_A_Intensity", properties);
                    MaterialProperty fac = ShaderGUI.FindProperty("_Fresnel_A_Contrast", properties);
                    MaterialProperty fag = ShaderGUI.FindProperty("_Fresnel_A_Gamma", properties);
                    MaterialProperty fainv = ShaderGUI.FindProperty("_Fresnel_A_Invert", properties);
                    MaterialProperty fab = ShaderGUI.FindProperty("_Fresnel_A_Bias", properties);
                    MaterialProperty fas = ShaderGUI.FindProperty("_Fresnel_A_Scale", properties);
                    MaterialProperty fap = ShaderGUI.FindProperty("_Fresnel_A_Power", properties);

                    materialEditor.ShaderProperty(fai, "Intensity");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, fac, "Contrast", 0, 5);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, fag, "Gamma", 0, 5);
                    materialEditor.ShaderProperty(fainv, "Invert");
                    materialEditor.ShaderProperty(fab, "Bias");
                    materialEditor.ShaderProperty(fas, "Scale");
                    materialEditor.ShaderProperty(fap, "Power");
                }
            });
            #endregion

            #region Fresnel B
            GUIExtras.SFoldout(targetMat, "_FresnelBFold", "Fresnel B Settings", BDColors.DarkRed(160), 10,BDColors.White(255),BDColors.Black(40),true,() =>
            {
                MaterialProperty FB = ShaderGUI.FindProperty("_Fresnel_B", properties);
                GUIExtras.SColoredVertical(BDColors.Black(20), 20,true, () =>
                {
                    materialEditor.ShaderProperty(FB, "Fresnel B");
                });
                if (FB.floatValue > 0f)
                {
                    MaterialProperty fbi = ShaderGUI.FindProperty("_Fresnel_B_Intensity", properties);
                    MaterialProperty fbc = ShaderGUI.FindProperty("_Fresnel_B_Contrast", properties);
                    MaterialProperty fbg = ShaderGUI.FindProperty("_Fresnel_B_Gamma", properties);
                    MaterialProperty fbinv = ShaderGUI.FindProperty("_Fresnel_B_Invert", properties);
                    MaterialProperty fbb = ShaderGUI.FindProperty("_Fresnel_B_Bias", properties);
                    MaterialProperty fbs = ShaderGUI.FindProperty("_Fresnel_B_Scale", properties);
                    MaterialProperty fbp = ShaderGUI.FindProperty("_Fresnel_B_Power", properties);

                    materialEditor.ShaderProperty(fbi, "Intensity");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, fbc, "Contrast", 0, 5);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, fbg, "Gamma", 0, 5);
                    materialEditor.ShaderProperty(fbinv, "Invert");
                    materialEditor.ShaderProperty(fbb, "Bias");
                    materialEditor.ShaderProperty(fbs, "Scale");
                    materialEditor.ShaderProperty(fbp, "Power");
                }

            });
            #endregion

            #region Fresnel Scan
            GUIExtras.SFoldout(targetMat, "_FresnelScanFold", "Fresnel Scan Settings", BDColors.DarkRed(200), 10,BDColors.White(255),BDColors.Black(40),true,() =>
            {
                MaterialProperty fss = ShaderGUI.FindProperty("_Fresnel_Scan", properties);
                GUIExtras.SColoredVertical(BDColors.Black(20), 20,true, () =>
                {
                    materialEditor.ShaderProperty(fss, "Fresnel Scan");
                });
                if(fss.floatValue > 0)
                {
                    MaterialProperty fssa = ShaderGUI.FindProperty("_FS_Additive", properties);
                    MaterialProperty fsst = ShaderGUI.FindProperty("_FS_Texture", properties);
                    MaterialProperty fsss = ShaderGUI.FindProperty("_FS_Speed", properties);
                    MaterialProperty fssp = ShaderGUI.FindProperty("_FS_Power", properties);

                    materialEditor.ShaderProperty(fssa, "Additive");
                    materialEditor.ShaderProperty(fsst, "Texture");
                    materialEditor.ShaderProperty(fsss, "Speed");
                    materialEditor.ShaderProperty(fssp, "Power");
                }
            });
            #endregion
            
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Interior Settings
        GUIExtras.SHeader("INTERIOR SETTINGS", ref checkInterior, "_CheckInterior", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkInterior)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty inttog = ShaderGUI.FindProperty("_Interior_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(inttog, "Interior");
            });
            if(inttog.floatValue > 0f)
            {
                MaterialProperty iCol = ShaderGUI.FindProperty("_INT_Color", properties);
                MaterialProperty ibCol = ShaderGUI.FindProperty("_INT_Back_Color", properties);
                MaterialProperty hoType = ShaderGUI.FindProperty("_HOLOTYPE", properties);
                MaterialProperty iTxtM = ShaderGUI.FindProperty("_INT_Texture_Map", properties);
                MaterialProperty iRotA = ShaderGUI.FindProperty("_INT_Rotate_A", properties);
                MaterialProperty ARotS = ShaderGUI.FindProperty("_A_Rotate_Speed", properties);
                MaterialProperty iRotB = ShaderGUI.FindProperty("_INT_Rotate_B", properties);
                MaterialProperty BRotS = ShaderGUI.FindProperty("_B_Rotate_Speed", properties);
                MaterialProperty iInv = ShaderGUI.FindProperty("_INT_Invert", properties);
                MaterialProperty iCont = ShaderGUI.FindProperty("_INT_Contrast", properties);
                MaterialProperty iParx = ShaderGUI.FindProperty("_INT_Parallax", properties);
                MaterialProperty iParxSL = ShaderGUI.FindProperty("_INT_Parallax_Second_Layer", properties);
                MaterialProperty iSLRep = ShaderGUI.FindProperty("_INT_Second_Layer_Repeat", properties);
                MaterialProperty iNT = ShaderGUI.FindProperty("_INT_Noise_Toggle", properties);
                MaterialProperty NT = ShaderGUI.FindProperty("_Noise_Tile", properties);
                MaterialProperty NCont = ShaderGUI.FindProperty("_Noise_Contrast", properties);
                MaterialProperty NInv = ShaderGUI.FindProperty("_Noise_Invert", properties);
                MaterialProperty Nseed = ShaderGUI.FindProperty("_Seed", properties);

                materialEditor.ShaderProperty(iCol, "Color");
                materialEditor.ShaderProperty(ibCol, "Back Color");
                materialEditor.ShaderProperty(hoType, "Hologram Type");
                materialEditor.ShaderProperty(iTxtM, "Interior Map");
                materialEditor.ShaderProperty(iRotA, "Rotate A");
                materialEditor.ShaderProperty(ARotS, "Rotate A Speed");
                materialEditor.ShaderProperty(iRotB, "Rotate B");
                materialEditor.ShaderProperty(BRotS, "Rotate B Speed");
                materialEditor.ShaderProperty(iInv, "Invert");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, iCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(iParx, "Parallax");
                materialEditor.ShaderProperty(iParxSL, "Parallax Second Layer");
                materialEditor.ShaderProperty(iSLRep, "Second Layer Repeat");
                materialEditor.ShaderProperty(iNT, "Noise Toggle");
                materialEditor.ShaderProperty(NT, "Noise Tile");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, NCont, "Noise Contrast", 0, 5);
                materialEditor.ShaderProperty(NInv, "Noise Invert");
                materialEditor.ShaderProperty(Nseed, "Seed");
            }

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Scan Settings
        GUIExtras.SHeader("SCANNER SETTINGS", ref checkScanner, "_CheckScanner", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkScanner)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty scans = ShaderGUI.FindProperty("_Scanner", properties);
            GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(scans, "Scanner");
            });
            if (scans.floatValue > 0)
            {
                MaterialProperty ssscan = ShaderGUI.FindProperty("_SS_Space", properties);
                materialEditor.ShaderProperty(ssscan, "Screen Space");

                #region Scan A
                MaterialProperty sca = ShaderGUI.FindProperty("_Scan_A", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(sca, "Scan A");
                });
                if(sca.floatValue > 0)
                {
                    MaterialProperty saint = ShaderGUI.FindProperty("_Scan_A_Intensity", properties);
                    MaterialProperty saadd = ShaderGUI.FindProperty("_Scan_A_Additive", properties);
                    MaterialProperty satxt = ShaderGUI.FindProperty("_Scan_Texture_A", properties);
                    MaterialProperty satile = ShaderGUI.FindProperty("_ST_A_Tile", properties);
                    MaterialProperty saspeed = ShaderGUI.FindProperty("_ST_A_Speed", properties);

                    materialEditor.ShaderProperty(saint, "Intensity");
                    materialEditor.ShaderProperty(saadd, "Additive");
                    materialEditor.ShaderProperty(satxt, "Texture A");
                    ShaderGUIHelpers.Vector2Property(materialEditor, satile, "Tile");
                    materialEditor.ShaderProperty(saspeed, "Speed");
                }
                #endregion

                #region Scan B
                MaterialProperty scb = ShaderGUI.FindProperty("_Scan_B", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(scb, "Scan B");
                });
                if (scb.floatValue > 0)
                {
                    MaterialProperty sbint = ShaderGUI.FindProperty("_Scan_B_Intensity", properties);
                    MaterialProperty sbadd = ShaderGUI.FindProperty("_Scan_B_Additive", properties);
                    MaterialProperty sbtxt = ShaderGUI.FindProperty("_Scan_Texture_B", properties);
                    MaterialProperty sbtile = ShaderGUI.FindProperty("_ST_B_Tile", properties);
                    MaterialProperty sbspeed = ShaderGUI.FindProperty("_ST_B_Speed", properties);

                    materialEditor.ShaderProperty(sbint, "Intensity");
                    materialEditor.ShaderProperty(sbadd, "Additive");
                    materialEditor.ShaderProperty(sbtxt, "Texture B");
                    ShaderGUIHelpers.Vector2Property(materialEditor, sbtile, "Tile");
                    materialEditor.ShaderProperty(sbspeed, "Speed");
                }
                #endregion

                #region Scan A
                MaterialProperty scc = ShaderGUI.FindProperty("_Scan_C", properties);
                GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20,true, () =>
                {
                    materialEditor.ShaderProperty(scc, "Scan C");
                });
                if (scc.floatValue > 0)
                {
                    MaterialProperty scint = ShaderGUI.FindProperty("_Scan_C_Intensity", properties);
                    MaterialProperty scadd = ShaderGUI.FindProperty("_Scan_C_Additive", properties);
                    MaterialProperty sctxt = ShaderGUI.FindProperty("_Scan_Texture_C", properties);
                    MaterialProperty sctile = ShaderGUI.FindProperty("_ST_C_Tile", properties);
                    MaterialProperty scspeed = ShaderGUI.FindProperty("_ST_C_Speed", properties);

                    materialEditor.ShaderProperty(scint, "Intensity");
                    materialEditor.ShaderProperty(scadd, "Additive");
                    materialEditor.ShaderProperty(sctxt, "Texture C");
                    ShaderGUIHelpers.Vector2Property(materialEditor, sctile, "Tile");
                    materialEditor.ShaderProperty(scspeed, "Speed");
                }
                #endregion
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region - Settings
        //GUIExtras.SHeader("SETTINGS", ref check -, "_Check-", targetMat, style);

        //EditorGUILayout.BeginVertical(style);
        //if (check -)
        //{
        //    EditorGUI.indentLevel++;
        //    EditorGUILayout.Space(2);



        //    EditorGUI.indentLevel--;
        //}
        //EditorGUILayout.EndVertical();
        //EditorGUILayout.Space(1);
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
            false,
            true);
        #endregion

        #region BUDU Copyright
        GUIExtras.About(ref aboutFold, style);
        #endregion
    }

    void loadMaterialVariables(Material targetMat)
    {
        tempVar = targetMat.GetInt("_CheckBase");
        checkBase = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDef");
        checkDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckLight");
        checkLight = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFresnel");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckInterior");
        checkInterior = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckScanner");
        checkScanner = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFRScan");
        checkFRScan = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckFlicker");
        checkFlicker = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckSinus");
        checkSinus = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNoiseFlicker");
        checkNoiseFlicker = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelAFold");
        fresnelAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelBFold");
        fresnelBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ScanAFold");
        scanAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ScanBFold");
        scanBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_ScanCFold");
        scanCFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_LightAFold");
        lightAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_LightBFold");
        lightBFold = tempVar == 1 ? true : false;
    }
}



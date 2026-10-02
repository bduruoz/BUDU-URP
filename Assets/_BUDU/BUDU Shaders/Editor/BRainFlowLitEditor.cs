// © BUDU Games 2024 - 2026
// BUDU Rain Flow Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BRainFlowLitEditor : ShaderGUI
{
    bool checkBase, checkDef, timeDef, dropDef, trailDef, fogTrailDef, wiggleDef, flowDef, checkNorm, checkMask, checkBlur, checkAO, checkDebug;
    bool aboutFold, dropNoiseFold, flowNoiseAFold, flowNoiseBFold, flowDefFold, flowDispFold;
    int tempVar, blendingMode, isSpecular;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Rain Flow Lit Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDURainFlowLit.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty glassCol = ShaderGUI.FindProperty("_Glass_Color", properties);
            materialEditor.ShaderProperty(glassCol, "Glass Color");

            MaterialProperty screenGrab = ShaderGUI.FindProperty("_Screen_Grab_Toggle", properties);
            materialEditor.ShaderProperty(screenGrab, "Screen Grab");
            if (screenGrab.floatValue < 0.1)
            {
                MaterialProperty glassTxt = ShaderGUI.FindProperty("_Base_Texture", properties);
                MaterialProperty glassTxtTile = ShaderGUI.FindProperty("_Base_Texture_Tile", properties);
                MaterialProperty glassTxtOff = ShaderGUI.FindProperty("_Base_Texture_Offset", properties);

                materialEditor.ShaderProperty(glassTxt, "Glass Texture");

                ShaderGUIHelpers.Vector2Property(materialEditor, glassTxtTile,"Glass Texture Tile");
            }
            MaterialProperty emis = ShaderGUI.FindProperty("_Emissive", properties);
            MaterialProperty emisCol = ShaderGUI.FindProperty("_Emission_Color", properties);
            MaterialProperty emisInt = ShaderGUI.FindProperty("_Emission_Intensity", properties);
            materialEditor.ShaderProperty(emis, "Emissive");
            if(emis.floatValue > 0.1)
            {
                materialEditor.ShaderProperty(emisCol, "Emission Color");
                materialEditor.ShaderProperty(emisInt, "Emission Intensity");
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Time Settings
        GUIExtras.SHeader("TIME SETTINGS", ref timeDef, "_timeDef", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if(timeDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ManualTime = ShaderGUI.FindProperty("_TimeManual", properties);
            MaterialProperty SpeedTime = ShaderGUI.FindProperty("_Speed", properties);

            materialEditor.ShaderProperty(ManualTime, "Manual Time");
            materialEditor.ShaderProperty(SpeedTime, "Time Speed");

            EditorGUILayout.Space(1);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Drops Settings
        GUIExtras.SHeader("DROPS SETTINGS", ref dropDef, "_DropDef", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (dropDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Drops = ShaderGUI.FindProperty("_Drops", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(Drops, "Drops");
            });
            if (Drops.floatValue > 0f)
            {
                MaterialProperty SoftDrops = ShaderGUI.FindProperty("_Soft_Drop", properties);
                MaterialProperty DropColor = ShaderGUI.FindProperty("_Drop_Color", properties);
                MaterialProperty DropGridSize = ShaderGUI.FindProperty("_Size", properties);
                MaterialProperty AspectUV = ShaderGUI.FindProperty("_AspectUV", properties);
                MaterialProperty DropCooeff = ShaderGUI.FindProperty("_Drop_Coefficient", properties);
                MaterialProperty Refraction = ShaderGUI.FindProperty("_Refraction", properties);
                MaterialProperty IDSeed = ShaderGUI.FindProperty("_IDSeed", properties);
                MaterialProperty NoOfLayer = ShaderGUI.FindProperty("_Layer_No", properties);
                MaterialProperty LayerSeed = ShaderGUI.FindProperty("_Layer_Seed", properties);

                materialEditor.ShaderProperty(SoftDrops, "Soft Drops");
                materialEditor.ShaderProperty(DropColor, "Drops Color");
                if (SoftDrops.floatValue > 0.1)
                {
                    MaterialProperty SoftDropColor = ShaderGUI.FindProperty("_Soft_Drop_Color", properties);
                    materialEditor.ShaderProperty(SoftDropColor, "Soft Drops Color");
                }
                materialEditor.ShaderProperty(DropGridSize, "Drop Grid Size");
                materialEditor.ShaderProperty(AspectUV, "Aspect UV");
                materialEditor.ShaderProperty(DropCooeff, "Drops Coefficient");
                materialEditor.ShaderProperty(Refraction, "Refraction");
                if (Refraction.floatValue > 0.1)
                {
                    MaterialProperty RefrStr = ShaderGUI.FindProperty("_Refraction_Strength", properties);
                    materialEditor.ShaderProperty(RefrStr, "Refraction Strength");
                }
                materialEditor.ShaderProperty(IDSeed, "ID Random Seed");
                ShaderGUIHelpers.IntSlider(materialEditor, NoOfLayer, "Number Of Layers", 0, 10);
                materialEditor.ShaderProperty(LayerSeed, "Layer Random Seed");

                MaterialProperty dropsNorm = ShaderGUI.FindProperty("_Drops_Normal", properties);
                materialEditor.ShaderProperty(dropsNorm, "Drops Normal");

                if(dropsNorm.floatValue > 0.1)
                {
                    MaterialProperty dropsNormInt = ShaderGUI.FindProperty("_Drops_Normal_Intensity", properties);
                    MaterialProperty dropsNormMult = ShaderGUI.FindProperty("_Drops_Normal_Multiplier", properties);
                    materialEditor.ShaderProperty(dropsNormInt, "Drops Normal Intensity");
                    materialEditor.ShaderProperty(dropsNormMult, "Drops Normal Multiplier");
                }

                style.normal.background = GUIExtras.MakeBackground(1, 1, BDColors.DarkRed(20));
                style.fontSize = default;
                style.normal.textColor = default;

                GUIExtras.SFoldout(targetMat,  "_dropNoiseFold", "Drop Noise Controls", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true,  () =>
                {
                    MaterialProperty DropNoise = ShaderGUI.FindProperty("_DropNoise", properties);
                    materialEditor.ShaderProperty(DropNoise, "Drops Noise");

                    if (DropNoise.floatValue > 0.1)
                    {
                        MaterialProperty DNoiseBlend = ShaderGUI.FindProperty("_DNoise_Blend", properties);
                        MaterialProperty DNoiseInt = ShaderGUI.FindProperty("_DNoise_Intensity", properties);
                        MaterialProperty DnoiseSpd = ShaderGUI.FindProperty("_DNoise_Speed", properties);
                        MaterialProperty DnoiseScale = ShaderGUI.FindProperty("_DNoise_Scale", properties);

                        materialEditor.ShaderProperty(DNoiseBlend, "Blend");
                        materialEditor.ShaderProperty(DNoiseInt, "Intensity");
                        ShaderGUIHelpers.Vector2Property(materialEditor, DnoiseSpd, "Speed");
                        materialEditor.ShaderProperty(DnoiseScale, "Scale");
                    }
                });
            }
            EditorGUILayout.Space(1);

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Trails Settings
        GUIExtras.SHeader("TRAILS SETTINGS", ref trailDef, "_TrailDef", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (trailDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Trail = ShaderGUI.FindProperty("_Trail", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(Trail, "Trail");
            });
            if(Trail.floatValue > 0.1f)
            {
                MaterialProperty trCol = ShaderGUI.FindProperty("_Trail_Color", properties);
                MaterialProperty NoOfTr = ShaderGUI.FindProperty("_Number_Of_Trail_Drop", properties);
                MaterialProperty trInt = ShaderGUI.FindProperty("_TIntensity", properties);
                MaterialProperty trSizeIn = ShaderGUI.FindProperty("_TSize_In", properties);
                MaterialProperty trSizeOut = ShaderGUI.FindProperty("_TSize_Out", properties);

                materialEditor.ShaderProperty(NoOfTr, "Number Of Trail Drops");
                materialEditor.ShaderProperty(trCol, "Trails Color");
                materialEditor.ShaderProperty(trInt, "Trails Intensity");
                materialEditor.ShaderProperty(trSizeIn, "Trails Drop Size In");
                materialEditor.ShaderProperty(trSizeOut, "Trails Drop Size Out");
                
                MaterialProperty trNoise = ShaderGUI.FindProperty("_TNoise", properties);
                materialEditor.ShaderProperty(trNoise, "Trail Noise");

                if (trNoise.floatValue > 0.1)
                {
                    MaterialProperty TNStr = ShaderGUI.FindProperty("_TNoise_Strength", properties);
                    MaterialProperty TNScl = ShaderGUI.FindProperty("_TNoise_Scale", properties);

                    materialEditor.ShaderProperty(TNStr, "Trail Noise Strength");
                    materialEditor.ShaderProperty(TNScl, "Trail Noise Scale");
                }
            }
            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Fog Trail Settings
        GUIExtras.SHeader("FOG TRAIL SETTINGS", ref fogTrailDef, "_FogTrailDef", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (fogTrailDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty ftrail = ShaderGUI.FindProperty("_FogTrail",properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(ftrail, "Fog Trails");
            });

            if(ftrail.floatValue > 0.1f)
            {
                MaterialProperty FTCol = ShaderGUI.FindProperty("_Fog_Trail_Color", properties);
                MaterialProperty FTInt = ShaderGUI.FindProperty("_Fog_Trail_Intensity", properties);
                MaterialProperty FTWidth = ShaderGUI.FindProperty("_Fog_Trail_Width", properties);
                MaterialProperty FTIn = ShaderGUI.FindProperty("_Fog_Trail_In",properties);
                MaterialProperty FTLength = ShaderGUI.FindProperty("_Fog_Trail_Length", properties);

                materialEditor.ShaderProperty(FTCol, "Fog Trail Color");
                materialEditor.ShaderProperty(FTInt, "Fog Trail Intensity");
                materialEditor.ShaderProperty(FTWidth, "Fog Trail Width");
                materialEditor.ShaderProperty(FTIn, "Fog Trail In");
                materialEditor.ShaderProperty(FTLength, "Fog Trail Length");
            }

            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Wiggle Settings
        GUIExtras.SHeader("WIGGLE SETTINGS", ref wiggleDef, "_WiggleDef", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (wiggleDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty wiggle = ShaderGUI.FindProperty("_Wiggle",properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(wiggle, "Wiggle");
            });
            if(wiggle.floatValue > 0.1f)
            {
                MaterialProperty CurlSize = ShaderGUI.FindProperty("_CurlSize", properties);
                MaterialProperty WiggleInt = ShaderGUI.FindProperty("_Wiggle_Intensity", properties);
                MaterialProperty WiggleType = ShaderGUI.FindProperty("_Wiggle_Type", properties);
                MaterialProperty WiggleNoiseSize = ShaderGUI.FindProperty("_Wiggle_Noise_Size", properties);
                MaterialProperty WiggleSeed = ShaderGUI.FindProperty("_Wiggle_Seed", properties);
                MaterialProperty WiggleInv = ShaderGUI.FindProperty("_Wiggle_Invert", properties);

                materialEditor.ShaderProperty(WiggleInt, "Wiggle Intensity");
                ShaderGUIHelpers.IntSlider(materialEditor, WiggleType, "Wiggle Type", 0, 12);
                materialEditor.ShaderProperty(CurlSize, "Curl Size");
                materialEditor.ShaderProperty(WiggleNoiseSize, "Wiggle Noise Size");
                materialEditor.ShaderProperty(WiggleSeed, "Wiggle Seed");
                materialEditor.ShaderProperty(WiggleInv, "Wiggle Invert");
            }

            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Flow Settings
        GUIExtras.SHeader("FLOW SETTINGS", ref flowDef, "_FlowDef", targetMat, style);
 
        EditorGUILayout.BeginVertical(style);
        if (flowDef)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty flow = ShaderGUI.FindProperty("_Flow_Toggle",properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(flow, "Flow");
            });

            if(flow.floatValue > 0.5f)
            {
                MaterialProperty flCol = ShaderGUI.FindProperty("_Flow_Color", properties);
                MaterialProperty flSpeed = ShaderGUI.FindProperty("_Flow_Speed", properties);
                MaterialProperty flMult = ShaderGUI.FindProperty("_Flow_Multiplier", properties);
                MaterialProperty flPMult = ShaderGUI.FindProperty("_Flow_Power_Multiplier", properties);
                MaterialProperty flPower = ShaderGUI.FindProperty("_Flow_Power", properties);

                materialEditor.ShaderProperty(flCol, "Flow Color");
                materialEditor.ShaderProperty(flSpeed, "Flow Speed");
                materialEditor.ShaderProperty(flMult, "Flow Multiplier");
                materialEditor.ShaderProperty(flPower, "Flow Power");
                materialEditor.ShaderProperty(flPMult, "Flow Power Multiplier");

                #region Noise A
                GUIExtras.SFoldout(targetMat, "_flowNoiseAFold", "Flow Noise A Controls", BDColors.DarkRed(120), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                {
                    MaterialProperty NoiseAType = ShaderGUI.FindProperty("_Noise_A_Selector", properties, false);
                    string[] NAOpt = new string[] { "Gradient Noise", "Gradient Noise Legacy", "Simple Noise", "Simple Noise Legacy", "Voronoi", "Voronoi Legacy" };

                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, NoiseAType, "Noise A Type", NAOpt);
                    switch ((int)NoiseAType.floatValue)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                            MaterialProperty fnaScale = ShaderGUI.FindProperty("_Flow_Noise_A_Scale", properties);
                            materialEditor.ShaderProperty(fnaScale, "Scale");
                            break;
                        case 4:
                        case 5:
                            MaterialProperty fnaAngle = ShaderGUI.FindProperty("_Flow_Noise_A_Angle", properties);
                            MaterialProperty fnaCellDensity = ShaderGUI.FindProperty("_Flow_Noise_A_Cell_Density", properties);
                            materialEditor.ShaderProperty(fnaAngle, "Voronoi Angle");
                            materialEditor.ShaderProperty(fnaCellDensity, "Voronoi Cell Density");
                            break;
                    }
                    MaterialProperty fnaTile = ShaderGUI.FindProperty("_Flow_Noise_A_Tile", properties);
                    MaterialProperty fnaSpeed = ShaderGUI.FindProperty("_Flow_Noise_A_Speed", properties);
                    ShaderGUIHelpers.Vector2Property(materialEditor, fnaTile, "Tile");
                    ShaderGUIHelpers.Vector2Property(materialEditor, fnaSpeed, "Speed");
                });
                #endregion

                #region Noise B
                GUIExtras.SFoldout(targetMat, "_flowNoiseBFold", "Flow Noise B Controls", BDColors.DarkRed(160), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                {
                    MaterialProperty NoiseBType = ShaderGUI.FindProperty("_Noise_B_Selector", properties, false);
                    string[] NBOpt = new string[] { "Gradient Noise", "Gradient Noise Legacy", "Simple Noise", "Simple Noise Legacy", "Voronoi", "Voronoi Legacy" };

                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, NoiseBType, "Noise B Type", NBOpt);
                    switch ((int)NoiseBType.floatValue)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                            MaterialProperty fnbScale = ShaderGUI.FindProperty("_Flow_Noise_B_Scale", properties);
                            materialEditor.ShaderProperty(fnbScale, "Scale");
                            break;
                        case 4:
                        case 5:
                            MaterialProperty fnbAngle = ShaderGUI.FindProperty("_Flow_Noise_B_Angle", properties);
                            MaterialProperty fnbCellDensity = ShaderGUI.FindProperty("_Flow_Noise_B_Cell_Density", properties);
                            materialEditor.ShaderProperty(fnbAngle, "Voronoi Angle");
                            materialEditor.ShaderProperty(fnbCellDensity, "Voronoi Cell Density");
                            break;
                    }
                    MaterialProperty fnbTile = ShaderGUI.FindProperty("_Flow_Noise_B_Tile", properties);
                    MaterialProperty fnbSpeed = ShaderGUI.FindProperty("_Flow_Noise_B_Speed", properties);

                    ShaderGUIHelpers.Vector2Property(materialEditor, fnbTile, "Tile");
                    ShaderGUIHelpers.Vector2Property(materialEditor, fnbSpeed, "Speed");
                });
                #endregion

                #region Flow Deformations
                GUIExtras.SFoldout(targetMat, "_flowDefFold", "Flow Deformation Controls", BDColors.DarkRed(200), 10,BDColors.White(255),BDColors.Black(40),true,   () =>
                {
                    MaterialProperty flowDeform = ShaderGUI.FindProperty("_Flow_Deformation", properties);
                    materialEditor.ShaderProperty(flowDeform, "Flow Deformation");
                    if (flowDeform.floatValue > 0.1f)
                    {
                        MaterialProperty FDStrength = ShaderGUI.FindProperty("_FDeform_Strength", properties);
                        MaterialProperty FDMoving = ShaderGUI.FindProperty("_FDeform_Moving", properties);

                        materialEditor.ShaderProperty(FDStrength, "Strength");
                        materialEditor.ShaderProperty(FDMoving, "Moving");

                        if (FDMoving.floatValue > 0.1f)
                        {
                            MaterialProperty FDSpeed = ShaderGUI.FindProperty("_FDeform_Speed", properties);
                            MaterialProperty FDVSpeed = ShaderGUI.FindProperty("_FDeform_Voronoi_Speed", properties);

                            materialEditor.ShaderProperty(FDSpeed, "Speed");
                            materialEditor.ShaderProperty(FDVSpeed, "Voronoi Speed");
                        }
                        MaterialProperty FDOctave = ShaderGUI.FindProperty("_FDeform_Octave", properties);
                        MaterialProperty FDGrid = ShaderGUI.FindProperty("_FDeform_Grid_No", properties);
                        MaterialProperty FDSeed = ShaderGUI.FindProperty("_FDeform_Seed", properties);
                        MaterialProperty FDTile = ShaderGUI.FindProperty("_FDeform_Tile", properties);
                        MaterialProperty FDOffset = ShaderGUI.FindProperty("_FDeform_Offset", properties);

                        ShaderGUIHelpers.IntSlider(materialEditor, FDOctave, "Octave", 0, 10);
                        ShaderGUIHelpers.IntSlider(materialEditor, FDGrid, "No of Grid", 1, 10);
                        materialEditor.ShaderProperty(FDSeed, "Seed");
                        ShaderGUIHelpers.Vector2Property(materialEditor, FDTile, "Tile");
                        ShaderGUIHelpers.Vector2Property(materialEditor, FDOffset, "Offset");
                    }
                });
                #endregion

                #region Flow Displacement
                GUIExtras.SFoldout(targetMat, "_flowDispFold", "Flow Displacement Controls", BDColors.DarkRed(240), 10,BDColors.White(255),BDColors.Black(40),true, () =>
                {
                    MaterialProperty FDist = ShaderGUI.FindProperty("_Flow_Displace", properties);
                    materialEditor.ShaderProperty(FDist, "Flow Displacement");
                    if (FDist.floatValue > 0.1f)
                    {
                        MaterialProperty FDistStrength = ShaderGUI.FindProperty("_Flow_Displace_Strength", properties);
                        MaterialProperty FDistMult = ShaderGUI.FindProperty("_Flow_Displace_Multiplier", properties);

                        materialEditor.ShaderProperty(FDistStrength, "Displace Strength");
                        materialEditor.ShaderProperty(FDistMult, "Displace Multiplier");
                    }
                });
                #endregion
            }
            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Normal Settings
        GUIExtras.SHeader("NORMAL SETTINGS", ref checkNorm, "_CheckNormal", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkNorm)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Normal = ShaderGUI.FindProperty("_Normal", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(Normal, "Normal");
            });
            if(Normal.floatValue > 0.1f)
            {
                MaterialProperty NormalMap = ShaderGUI.FindProperty("_Normal_Map", properties);
                MaterialProperty NormalStr = ShaderGUI.FindProperty("_Normal_Strength", properties);
                MaterialProperty NormalMult = ShaderGUI.FindProperty("_Normal_Multiplier", properties);

                materialEditor.ShaderProperty(NormalMap, "Normal Map");
                materialEditor.ShaderProperty(NormalStr, "Normal Strength");
                materialEditor.ShaderProperty(NormalMult, "Normal Multiplier");
            }

            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Mask Settings
        GUIExtras.SHeader("MASK SETTINGS", ref checkMask, "_CheckMask", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkMask)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty mask = ShaderGUI.FindProperty("_Mask",properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(mask, "Mask");
            });
            if(mask.floatValue  > 0.1f)
            {
                MaterialProperty MaskMap = ShaderGUI.FindProperty("_Mask_Map", properties);
                MaterialProperty MaskChannel = ShaderGUI.FindProperty("_Mask_Channel", properties);
                string[] maskChannels = new string[] { "Red", "Green", "Blue", "Alpha", "Luma" };
                MaterialProperty MaskGamma = ShaderGUI.FindProperty("_Mask_Gamma", properties);
                MaterialProperty MaskInv = ShaderGUI.FindProperty("_Mask_Invert", properties);
                MaterialProperty MaskCont = ShaderGUI.FindProperty("_Mask_Contrast", properties);
                MaterialProperty MaskRot = ShaderGUI.FindProperty("_Mask_Rotation", properties);

                materialEditor.ShaderProperty(MaskMap, "Mask Map");
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, MaskChannel, "Mask Channel", maskChannels);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, MaskGamma, "Gamma", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, MaskCont, "Contrast", 0, 5);
                materialEditor.ShaderProperty(MaskRot, "Mask Rotation");
            }
            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Blur Settings
        GUIExtras.SHeader("BLUR SETTINGS", ref checkBlur, "_CheckBlur", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkBlur)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty Vapor = ShaderGUI.FindProperty("_Vapor", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(Vapor, "Vapor");
            });
            if(Vapor.floatValue > 0.1f)
            {
                MaterialProperty VprStr = ShaderGUI.FindProperty("_Vapor_Strength", properties);
                materialEditor.ShaderProperty(VprStr, "Vapor Strength");
            }
            EditorGUILayout.Space(1);
            MaterialProperty BlurTog = ShaderGUI.FindProperty("_Blur_Toggle", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(BlurTog, "Blur");
            });
            if(BlurTog.floatValue > 0.1f)
            {
                //MaterialProperty LODBlur = ShaderGUI.FindProperty("_LODBlur", properties);
                MaterialProperty BlurStr = ShaderGUI.FindProperty("_Blur_Strength", properties);
                MaterialProperty BlurSmp = ShaderGUI.FindProperty("_Samples", properties);
                MaterialProperty CustBlurNoise = ShaderGUI.FindProperty("_Custom_Blur_Noise",properties);

                materialEditor.ShaderProperty(BlurStr, "Blur Strength");
                ShaderGUIHelpers.IntSlider(materialEditor, BlurSmp, "Blur Samples", 1, 64);
                materialEditor.ShaderProperty(CustBlurNoise, "Custom Blur Noise");

                if(CustBlurNoise.floatValue > 0.1f)
                {
                    MaterialProperty BlurNoiseTexture = ShaderGUI.FindProperty("_Blur_Noise_Texture", properties);
                    MaterialProperty BlurTxtInvert = ShaderGUI.FindProperty("_Blur_Texture_Invert", properties);
                    materialEditor.ShaderProperty(BlurNoiseTexture, "Blur Noise Texture");
                    materialEditor.ShaderProperty(BlurTxtInvert, "Blur Noise Texture Invert");
                }
            }



            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region AO Settings
        GUIExtras.SHeader("AMBIENT OCCLUSION SETTINGS", ref checkAO, "_CheckAO", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkAO)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty AO = ShaderGUI.FindProperty("_Ambient_Occlusion", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(AO, "Ambient Occlusion");
            });
            if(AO.floatValue > 0.1f)
            {
                MaterialProperty AOInt = ShaderGUI.FindProperty("_AO_Intensity", properties);
                MaterialProperty AOTxt = ShaderGUI.FindProperty("_AO_Texture", properties);
                MaterialProperty AOContrast = ShaderGUI.FindProperty("_AO_Contrast", properties);

                materialEditor.ShaderProperty(AOInt, "AO Intensity");
                materialEditor.ShaderProperty(AOTxt, "AO Texture");
                materialEditor.ShaderProperty(AOContrast, "AO Contrast");
            }
            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Rain Debug Settings
        GUIExtras.SHeader("DEBUG SETTINGS", ref checkDebug, "_CheckDebug", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkDebug)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            MaterialProperty rdebug = ShaderGUI.FindProperty("_RainDebug", properties);
            GUIExtras.SColoredVertical(BDColors.dBlueOrange(50), 20,true, () =>
            {
                materialEditor.ShaderProperty(rdebug, "Debug");
            });
            if(rdebug.floatValue > 0.1f)
            {
                MaterialProperty GridUV = ShaderGUI.FindProperty("_Grid_UV", properties);
                MaterialProperty GridCol = ShaderGUI.FindProperty("_Grid_Color",properties);
                MaterialProperty DropD = ShaderGUI.FindProperty("_Drop_D", properties);
                MaterialProperty DropDInt = ShaderGUI.FindProperty("_Drop_D_Intensity", properties);
                MaterialProperty TrailD = ShaderGUI.FindProperty("_Trail_D", properties);
                MaterialProperty TrailDInt = ShaderGUI.FindProperty("_Trail_D_Intensity", properties);
                MaterialProperty FogTrailD = ShaderGUI.FindProperty("_Fog_Trail_D", properties);
                MaterialProperty FogTrailDInt = ShaderGUI.FindProperty("_Fog_Trail_D_Intensity", properties);
                MaterialProperty Droplets = ShaderGUI.FindProperty("_Droplets_D", properties);
                MaterialProperty DropletsInt = ShaderGUI.FindProperty("_Droplets_D_Intensity", properties);
                MaterialProperty Flow = ShaderGUI.FindProperty("_Flow_D", properties);
                MaterialProperty FlowInt = ShaderGUI.FindProperty("_Flow_D_Intensity", properties);
                MaterialProperty DropNoise = ShaderGUI.FindProperty("_Drop_Noise_D", properties);
                MaterialProperty DropNoiseInt = ShaderGUI.FindProperty("_Drop_Noise_D_Intensity", properties);
                MaterialProperty TrailNoise = ShaderGUI.FindProperty("_Trail_Noise_D", properties);
                MaterialProperty TrailNoiseInt = ShaderGUI.FindProperty("_Trail_Noise_D_Intensity", properties);
                MaterialProperty WiggleNoise = ShaderGUI.FindProperty("_Wiggle_Noise_D", properties);
                MaterialProperty WiggleNoiseInt = ShaderGUI.FindProperty("_Wiggle_Noise_D_Intensity", properties);

                materialEditor.ShaderProperty(GridUV, "Grid UV");
                if(GridUV.floatValue > 0f) materialEditor.ShaderProperty(GridCol, "Grid Color");
                materialEditor.ShaderProperty(DropD, "Drop D");
                if (DropD.floatValue > 0f) materialEditor.ShaderProperty(DropDInt, "Drop D Intensity");
                materialEditor.ShaderProperty(TrailD, "Trail D");
                if (TrailD.floatValue > 0f) materialEditor.ShaderProperty(TrailDInt, "Trail D Intensity");
                materialEditor.ShaderProperty(FogTrailD, "Fog Trail D");
                if (FogTrailD.floatValue > 0f) materialEditor.ShaderProperty(FogTrailDInt, "Fog Trail D Intensity");
                materialEditor.ShaderProperty(Droplets, "Droplets");
                if (Droplets.floatValue > 0f) materialEditor.ShaderProperty(DropletsInt, "Droplets Intensity");
                materialEditor.ShaderProperty(Flow, "Flow");
                if (Flow.floatValue > 0f) materialEditor.ShaderProperty(FlowInt, "Flow Intensity");
                materialEditor.ShaderProperty(DropNoise, "Drop Noise");
                if (DropNoise.floatValue > 0f) materialEditor.ShaderProperty(DropNoiseInt, "Drop Noise Intensity");
                materialEditor.ShaderProperty(TrailNoise, "Trail Noise");
                if (TrailNoise.floatValue > 0f) materialEditor.ShaderProperty(TrailNoiseInt, "Trail Noise Intensity");
                materialEditor.ShaderProperty(WiggleNoise, "Wiggle Noise");
                if (WiggleNoise.floatValue > 0f) materialEditor.ShaderProperty(WiggleNoiseInt, "Wiggle Noise Intensity");
            }
            EditorGUILayout.Space(1);
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(1);
        #endregion

        #region Shader Defaults
        GUIExtras.SHeader("SHADER DEFAULTS", ref checkDef, "_CheckDef", targetMat, style);

        BDShaderGUI.ShaderDefaultsGUI(materialEditor, properties, targetMat, ref checkDef, ref blendingMode, style, 
            true, 
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

        tempVar = targetMat.GetInt("_timeDef");
        timeDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_DropDef");
        dropDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_dropNoiseFold");
        dropNoiseFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_TrailDef");
        trailDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FogTrailDef");
        fogTrailDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_WiggleDef");
        wiggleDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FlowDef");
        flowDef = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_flowNoiseAFold");
        flowNoiseAFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_flowNoiseBFold");
        flowNoiseBFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_flowDefFold");
        flowDefFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_flowDispFold");
        flowDispFold = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckNormal");
        checkNorm = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckMask");
        checkMask = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckBlur");
        checkBlur = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckAO");
        checkAO = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_CheckDebug");
        checkDebug = tempVar == 1 ? true : false;
    }
}



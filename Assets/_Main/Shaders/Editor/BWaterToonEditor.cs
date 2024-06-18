using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BWaterToonEditor : ShaderGUI
{
    bool checkShoreColor;
    bool aboutFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUWaterToonTitle.png", typeof(Texture));

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
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical();
        {
            checkShoreColor = EditorGUILayout.ToggleLeft("SHORE SETTINS", checkShoreColor, style);
            targetMat.SetInt("_ShoreSetting",Convert.ToInt16(checkShoreColor));
            EditorGUILayout.BeginVertical();   
            if(checkShoreColor)
            {
                

                MaterialProperty sc = ShaderGUI.FindProperty("_ShoreColor", properties);
                MaterialProperty scm = ShaderGUI.FindProperty("_ShoreColorMap", properties);
                MaterialProperty shtb = ShaderGUI.FindProperty("_ShoreTextureBlendingType", properties);

                materialEditor.ColorProperty(sc, "Shore Color");
                materialEditor.TextureProperty(scm, "Shore Map");
                materialEditor.ShaderProperty(shtb, "Texture Blending Type");

                switch((int)(shtb.floatValue))
                {
                    case 0:
                        // No Texture
                        break;
                    case 1:
                        // One Texture
                        MaterialProperty sctx = ShaderGUI.FindProperty("_ShoreCTileX", properties);
                        MaterialProperty scty = ShaderGUI.FindProperty("_ShoreCTileY", properties);
                        MaterialProperty scsx = ShaderGUI.FindProperty("_ShoreCSpeedX", properties);
                        MaterialProperty scsy = ShaderGUI.FindProperty("_ShoreCSpeedY", properties);
                        MaterialProperty scax = ShaderGUI.FindProperty("_ShoreCAnchorX", properties);
                        MaterialProperty scay = ShaderGUI.FindProperty("_ShoreCAnchorY", properties);
                        MaterialProperty scrot = ShaderGUI.FindProperty("_ShoreCRotSpeed", properties);

                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 130;
                        EditorGUIUtility.fieldWidth = 50;
                        materialEditor.FloatProperty(sctx, "Map A Tile X");
                        materialEditor.FloatProperty(scty, "Map A Tile Y");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 130;
                        EditorGUIUtility.fieldWidth = 50;
                        materialEditor.FloatProperty(scsx, "Map A Speeed X");
                        materialEditor.FloatProperty(scsy, "Map A Speed Y");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        EditorGUILayout.BeginHorizontal();
                        EditorGUIUtility.labelWidth = 130;
                        EditorGUIUtility.fieldWidth = 50;
                        materialEditor.FloatProperty(scax, "Map A Anchor X");
                        materialEditor.FloatProperty(scay, "Map A Anchor Y");
                        EditorGUIUtility.labelWidth = 0;
                        EditorGUIUtility.fieldWidth = 0;
                        EditorGUILayout.EndHorizontal();
                        materialEditor.FloatProperty(scrot, "Rotation Speed");


                        break;
                    case 2:
                        // Add
                    case 3:
                        // Sub
                    case 4:
                        // Mult
                    case 5:
                        //Div





                        break;
                }

            }
            EditorGUILayout.EndVertical();
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
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
        tempVar = targetMat.GetInt("_ShoreSetting");
        checkShoreColor = tempVar == 1 ? true : false;
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

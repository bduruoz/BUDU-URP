using UnityEngine;
using UnityEditor;
using budu;

public class BEmissiveEditor : ShaderGUI
{
    bool checkAlphaClip, checkTransparent, checkFresnel, checkFresnelInvert;
    bool alphaFold, alphaClipFold, fresnelFold, aboutFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUEmissiveTitle.png", typeof(Texture));

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

        MaterialProperty bc = ShaderGUI.FindProperty("_BaseColor", properties);
        MaterialProperty bt = ShaderGUI.FindProperty("_BaseMap", properties);

        EditorGUILayout.BeginVertical();
        {
            materialEditor.ColorProperty(bc, "Base Color");
            materialEditor.TextureProperty(bt, "Base Map");
        }
        GUILayout.EndVertical();
        EditorGUILayout.Space();
        #endregion

        #region Transparency Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange();

        EditorGUILayout.BeginVertical(style);
        {
            EditorGUI.BeginChangeCheck();
            checkTransparent = EditorGUILayout.ToggleLeft("TRANSPARENT", checkTransparent, style);
            if(EditorGUI.EndChangeCheck())
            {
                MaterialProperty srcb = ShaderGUI.FindProperty("_SrcBlend", properties);
                MaterialProperty dstb = ShaderGUI.FindProperty("_DstBlend", properties);
                MaterialProperty zwr = ShaderGUI.FindProperty("_ZWrite", properties);

                if(checkTransparent)
                {

                    alphaFold = true;
                    targetMat.SetInt("_Transparent", 1);

                    targetMat.SetInt("_SrcBlend", 5);   // Src Alpha
                    targetMat.SetInt("_DstBlend", 10);  // One Minus Src Alpha
                    targetMat.SetInt("_ZWrite", 1);
                    targetMat.SetOverrideTag("RenderType", "Transparent");
                    targetMat.SetOverrideTag("Queue", "Transparent");
                    targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;
                }
                else
                {
                    alphaFold = false;
                    targetMat.SetInt("_Transparent", 0);

                    targetMat.SetInt("_SrcBlend", 1); // One
                    targetMat.SetInt("_DstBlend", 0); // Zero
                    targetMat.SetInt("_ZWrite", 1);
                    targetMat.SetOverrideTag("RenderType", "Opaque");
                    targetMat.SetOverrideTag("Queue", "Geometry");
                    targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Geometry;
                }
                EditorUtility.SetDirty(targetMat);
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(alphaFold)
        {
            EditorGUILayout.Space(4);
            EditorGUI.BeginChangeCheck();
            checkAlphaClip = EditorGUILayout.Toggle("Alpha Clip", checkAlphaClip);
            if(EditorGUI.EndChangeCheck())
            {
                if(checkAlphaClip)
                {
                    alphaClipFold = true;
                    targetMat.SetInt("_AlphaClip", 1);
                }
                else
                {
                    alphaClipFold = false;
                    targetMat.SetInt("_AlphaClip", 0);
                }
            }

            if(alphaClipFold)
            {
                MaterialProperty act = ShaderGUI.FindProperty("_AlphaClipThreshold", properties);

                materialEditor.RangeProperty(act, "Alpha Clip Threshold");
            }

        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space(5);
        #endregion

        #region Fresnel Settings
        style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18,204));
        style.fontSize = 16;
        style.normal.textColor = bdColors.NexusOrange(255);

        EditorGUILayout.BeginVertical(style);
        checkFresnel = EditorGUILayout.ToggleLeft("FRESNEL", checkFresnel, style);
        if(EditorGUI.EndChangeCheck() )
        {
            MaterialProperty fsw = ShaderGUI.FindProperty("_FSwitch",properties);

            if(checkFresnel)
            {
                fresnelFold = true;
                targetMat.SetInt("_FSwitch", 1);
            }
            else
            {   
                fresnelFold = false;
                targetMat.SetInt("_FSwitch", 0);
            }
        }
        EditorGUILayout.EndVertical();
        style.normal.background = MakeBackground(1, 1, bdColors.Transparent(0));
        EditorGUILayout.BeginVertical(style);
        if(fresnelFold)
        {
            EditorGUILayout.Space(4);

            EditorGUI.BeginChangeCheck();
            checkFresnelInvert = EditorGUILayout.Toggle("Fresnel Invert", checkFresnelInvert);
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

            MaterialProperty bias = ShaderGUI.FindProperty("_FBias", properties);
            MaterialProperty scale= ShaderGUI.FindProperty("_FScale", properties);
            MaterialProperty power = ShaderGUI.FindProperty("_FPower", properties);

            materialEditor.RangeProperty(bias, "Fresnel Bias");
            materialEditor.RangeProperty(scale, "Fresnel Scale");
            materialEditor.RangeProperty(power, "Fresnel Power");

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
        tempVar = targetMat.GetInt("_Transparent");
        checkTransparent = tempVar == 1 ? true : false;
        alphaFold = checkTransparent;

        tempVar = targetMat.GetInt("_AlphaClip");
        checkAlphaClip = tempVar == 1 ? true : false;
        alphaClipFold = checkAlphaClip;

        tempVar = targetMat.GetInt("_FSwitch");
        checkFresnel = tempVar == 1 ? true : false;

        tempVar = targetMat.GetInt("_FresnelInvert");
        checkFresnelInvert = tempVar == 1 ? true : false;
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

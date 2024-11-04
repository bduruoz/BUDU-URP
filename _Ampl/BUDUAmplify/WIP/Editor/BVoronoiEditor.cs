using UnityEngine;
using UnityEditor;
using System;
using budu;

public class BVoronoiEditor : ShaderGUI
{
    bool a;
    bool aboutFold;
    int tempVar;
    
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU Emissive Shader Title
        //Texture banner = (Texture)AssetDatabase.LoadAssetAtPath("Assets/_Main/Shaders/Editor/GUI/BUDUEmissiveTitle.png", typeof(Texture));
        style.normal.background = MakeBackground(1, 1, bdColors.NexusOrange(76));
        style.normal.textColor = bdColors.NexusOrange();
        style.fontSize = 16;

        GUILayout.BeginArea(new Rect(0, 0, 512, 32));
        {
            EditorGUILayout.BeginHorizontal();
            {
                GUI.backgroundColor = bdColors.Transparent(0);
                //GUILayout.Box(banner, GUILayout.MinHeight(32));
                GUILayout.Label("BUDU VORONOI TEST", style);
            }
            EditorGUILayout.EndHorizontal();
        }
        GUILayout.EndArea();
        GUILayout.Space(32);
        GUI.backgroundColor = bdColors.White(255);
        #endregion

        //MaterialProperty vorOctave = ShaderGUI.FindProperty("_VorOctave", properties);

        //materialEditor.ShaderProperty(vorOctave, "Octave");

        //Shader.PropertyToID("_Octaves");

        var a = ShaderGUI.FindProperty("_VorOctave", properties);


        //targetMat.SetInt("_Voronoi", Convert.ToInt16(a.intValue));

        //Debug.Log("Nedir = " + targetMat.shader.GetPropertyCount());

        //for (int i = 0; i < targetMat.GetPassName; ++i)
        //{

        //for(int i = 0; i < targetMat.shader.GetPropertyCount(); i++)
        //{
        //    Debug.Log("Nedir = " + targetMat.shader.GetPropertyType(i));
        //}
        //}




        //EditorUtility.SetDirty(targetMat);




        EditorGUILayout.Space(10);

        base.OnGUI(materialEditor, properties);


        #region Shader Defaults
        //materialEditor.RenderQueueField();
        //materialEditor.EnableInstancingField();
        //materialEditor.DoubleSidedGIField();
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
        //tempVar = targetMat.GetInt("_Transparent");
        //checkTransparent = tempVar == 1 ? true : false;
        //alphaFold = checkTransparent;
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

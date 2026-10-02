// © BUDU Games 2024 - 2026
// BUDU Template Shader Editor

using budu;
using UnityEditor;
using UnityEngine;

public class BShoreWaveEditor : ShaderGUI
{
    bool checkBase, checkDef;
    bool aboutFold;
    int tempVar, blendingMode;

    // Not: Statik tanýmlandýðýnda tüm materyaller ayný eðriyi paylaþýr. 
    // Her materyalin kendine has eðrisi olmasý için bu verilerin Materyal içinde 
    // gizli bir string olarak saklanmasý gerekir, ancak temel yapý için bu en stabil yoldur.
    static AnimationCurve xCurveA = AnimationCurve.Linear(0, 0, 1, 1);
    static AnimationCurve yCurveA = AnimationCurve.Linear(0, 0, 1, 1);
    
    static AnimationCurve xCurveB = AnimationCurve.Linear(0, 0, 1, 1);
    static AnimationCurve yCurveB = AnimationCurve.Linear(0, 0, 1, 1);

    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;
        loadMaterialVariables(targetMat);

        GUIStyle style = new GUIStyle();

        #region BUDU ___ Shader Title
        GUIExtras.Banner("Assets/_BUDU/GUI/BUDU___.png", 512, 32);
        #endregion

        #region Base Settings
        GUIExtras.SHeader("BASE SETTINGS", ref checkBase, "_CheckBase", targetMat, style);

        EditorGUILayout.BeginVertical(style);
        if (checkBase)
        {
            EditorGUI.indentLevel++;
            EditorGUILayout.Space(2);

            // --- CURVE FIELDS ---
            EditorGUI.BeginChangeCheck();

            EditorGUILayout.LabelField("Wave Velocity Curves", EditorStyles.boldLabel);
            xCurveA = EditorGUILayout.CurveField("X Movement A Curve", xCurveA, Color.red, new Rect(0, 0, 1, 1));
            yCurveA = EditorGUILayout.CurveField("Y Movement A Curve", yCurveA, Color.green, new Rect(0, 0, 1, 1));

            if (EditorGUI.EndChangeCheck())
            {
                // Eðriler deðiþtiðinde Texture'larý güncelle (RFloat = Yüksek Hassasiyet)
                UpdateCurveTexture(targetMat, xCurveA, "_XCurveTex_A_2D");
                UpdateCurveTexture(targetMat, yCurveA, "_YCurveTex_A_2D");

                // Deðiþikliði kaydet
                EditorUtility.SetDirty(targetMat);
            }

            EditorGUILayout.Space(5);

            // --- STANDART PROPERTIES ---
            MaterialProperty txtrA = ShaderGUI.FindProperty("_Texture_A", properties);
            MaterialProperty xSpdA = ShaderGUI.FindProperty("_XSpeed_A", properties);
            MaterialProperty ySpdA = ShaderGUI.FindProperty("_YSpeed_A", properties);
            MaterialProperty offXA = ShaderGUI.FindProperty("_OffsetX_A", properties);
            MaterialProperty offYA = ShaderGUI.FindProperty("_OffsetY_A", properties);
            //MaterialProperty gradA = ShaderGUI.FindProperty("_Gradient_A", properties);

            //materialEditor.ShaderProperty(gradA, "Gradient A");
            materialEditor.ShaderProperty(txtrA, "Texture A");
            materialEditor.ShaderProperty(xSpdA, "X Multiplier A Speed");
            materialEditor.ShaderProperty(ySpdA, "Y Multiplier A Speed");
            materialEditor.ShaderProperty(offXA, "X Offset A");
            materialEditor.ShaderProperty(offYA, "Y Offset A");



            EditorGUI.BeginChangeCheck();

            EditorGUILayout.LabelField("Wave Velocity Curves", EditorStyles.boldLabel);
            xCurveB = EditorGUILayout.CurveField("X Movement B Curve", xCurveB, Color.red, new Rect(0, 0, 1, 1));
            yCurveB = EditorGUILayout.CurveField("Y Movement B Curve", yCurveB, Color.green, new Rect(0, 0, 1, 1));

            if (EditorGUI.EndChangeCheck())
            {
                // Eðriler deðiþtiðinde Texture'larý güncelle (RFloat = Yüksek Hassasiyet)
                UpdateCurveTexture(targetMat, xCurveB, "_XCurveTex_B_2D");
                UpdateCurveTexture(targetMat, yCurveB, "_YCurveTex_B_2D");

                // Deðiþikliði kaydet
                EditorUtility.SetDirty(targetMat);
            }

            EditorGUILayout.Space(5);


            MaterialProperty txtrB = ShaderGUI.FindProperty("_Texture_B", properties);
            MaterialProperty xSpdB = ShaderGUI.FindProperty("_XSpeed_B", properties);
            MaterialProperty ySpdB = ShaderGUI.FindProperty("_YSpeed_B", properties);
            MaterialProperty offXB = ShaderGUI.FindProperty("_OffsetX_B", properties);
            MaterialProperty offYB = ShaderGUI.FindProperty("_OffsetY_B", properties);

            materialEditor.ShaderProperty(txtrB, "Texture B");
            materialEditor.ShaderProperty(xSpdB, "X Multiplier B Speed");
            materialEditor.ShaderProperty(ySpdB, "Y Multiplier B Speed");
            materialEditor.ShaderProperty(offXB, "X Offset B");
            materialEditor.ShaderProperty(offYB, "Y Offset B");



            MaterialProperty Fade = ShaderGUI.FindProperty("_Fade", properties);
            materialEditor.ShaderProperty(Fade, "Fade A/B");


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
        if (targetMat.HasProperty("_CheckBase"))
            checkBase = targetMat.GetInt("_CheckBase") == 1;

        if (targetMat.HasProperty("_CheckDef"))
            checkDef = targetMat.GetInt("_CheckDef") == 1;
    }

    /// <summary>
    /// AnimationCurve verisini GPU'nun anlayacaðý RFloat Texture formatýna çevirir.
    /// </summary>
    void UpdateCurveTexture(Material mat, AnimationCurve curve, string propName)
    {
        // 256 piksel geniþlik + Bilinear Filtreleme + RFloat (32-bit) 
        // Bu kombinasyon matematiksel pürüzsüzlükte sonuç verir.
        Texture2D tex = new Texture2D(256, 1, TextureFormat.RFloat, false);
        tex.wrapMode = TextureWrapMode.Clamp;
        tex.filterMode = FilterMode.Bilinear;
        tex.anisoLevel = 0;

        for (int i = 0; i < 256; i++)
        {
            float t = i / 255f;
            float val = curve.Evaluate(t);
            // Sadece R kanalýna yazýyoruz, ShaderGraph'ta R kanalýný okumalýsýn.
            tex.SetPixel(i, 0, new Color(val, 0, 0, 1));
        }

        tex.Apply();

        // Texture'ýn asset olarak kaydedilmesini engeller, bellekte yaþar.
        tex.hideFlags = HideFlags.HideAndDontSave;

        mat.SetTexture(propName, tex);
    }
}
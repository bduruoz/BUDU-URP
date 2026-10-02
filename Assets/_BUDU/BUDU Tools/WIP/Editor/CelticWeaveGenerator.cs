using UnityEngine;
using UnityEditor;
using System.IO;

public class CelticWeaveGenerator : EditorWindow
{
    private Texture2D previewTexture;
    private int gridSize = 5;
    private float ribbonWidth = 0.35f;
    private float gapWidth = 0.12f;
    private Color gapColor = Color.white;
    private Color bgColor = new Color(0.12f, 0.12f, 0.12f);

    private const int texSize = 512;

    [MenuItem("BUDU-Tools/WIP/Celtic Weave Generator")]
    public static void ShowWindow() => GetWindow<CelticWeaveGenerator>("Celtic Master").minSize = new Vector2(530, 850);

    private void OnEnable() => GeneratePattern();

    private void OnGUI()
    {
        GUILayout.Space(10);
        Rect previewRect = GUILayoutUtility.GetRect(texSize, texSize);
        if (previewTexture != null) GUI.DrawTexture(previewRect, previewTexture, ScaleMode.ScaleToFit);

        GUILayout.Space(20);
        EditorGUI.BeginChangeCheck();

        EditorGUILayout.LabelField("Profesyonel Örgü (Nihai Kesme Mantýðý)", EditorStyles.boldLabel);
        gridSize = EditorGUILayout.IntSlider("Izgara (Dots)", gridSize, 2, 12);
        ribbonWidth = EditorGUILayout.Slider("Þerit Kalýnlýðý", ribbonWidth, 0.1f, 0.45f);
        gapWidth = EditorGUILayout.Slider("Kesiþim Kesme (Gap)", gapWidth, 0.02f, 0.25f);
        gapColor = EditorGUILayout.ColorField("Boþluk Rengi", gapColor);
        bgColor = EditorGUILayout.ColorField("Arka Plan", bgColor);

        if (EditorGUI.EndChangeCheck()) GeneratePattern();

        GUILayout.FlexibleSpace();
        if (GUILayout.Button("PNG Olarak Kaydet", GUILayout.Height(40))) SaveTexture();
        GUILayout.Space(10);
    }

    void GeneratePattern()
    {
        previewTexture = new Texture2D(texSize, texSize);
        Color[] pixels = new Color[texSize * texSize];

        for (int y = 0; y < texSize; y++)
        {
            for (int x = 0; x < texSize; x++)
            {
                // Koordinatlarý 0 ile GridSize arasýna normalize et
                float u = (float)x / texSize * gridSize;
                float v = (float)y / texSize * gridSize;

                pixels[y * texSize + x] = GetPixelColor(u, v);
            }
        }

        previewTexture.SetPixels(pixels);
        previewTexture.Apply();
    }

    Color GetPixelColor(float u, float v)
    {
        // 1. Diyagonal mesafeleri hesapla (Anti-aliasing için mod yerine abs kullanýyoruz)
        float d1 = Mathf.Abs(((u + v + 100) % 2.0f) - 1.0f);
        float d2 = Mathf.Abs(((u - v + 100) % 2.0f) - 1.0f);

        // 2. Hangi hücredeyiz? (Over-Under sýrasý için dama tahtasý)
        int iu = Mathf.FloorToInt(u);
        int iv = Mathf.FloorToInt(v);
        bool thread1OnTop = (iu + iv) % 2 == 0;

        // 3. Þerit Renkleri (Sürekli hatlar için koordinatlarý yuvarla)
        // Bu sayede renkler tuðla gibi deðil, ip boyunca akar.
        float hue1 = (Mathf.Round(u + v + 0.0f) * 0.13f) % 1.0f;
        float hue2 = (Mathf.Round(u - v + 100.0f) * 0.17f) % 1.0f;
        Color col1 = Color.HSVToRGB(hue1, 0.7f, 1f);
        Color col2 = Color.HSVToRGB(hue2, 0.7f, 1f);

        // 4. Kenar Yumuþatma için yardýmcý deðiþkenler (SmoothStep simülasyonu)
        float aa = 0.02f; // Kenar yumuþatma sertliði

        // 5. ÇÝZÝM VE KESME MANTIÐI
        float dTop = thread1OnTop ? d1 : d2;
        float dBot = thread1OnTop ? d2 : d1;
        Color colTop = thread1OnTop ? col1 : col2;
        Color colBot = thread1OnTop ? col2 : col1;

        // Üstteki Þerit Çizimi
        if (dTop < ribbonWidth)
        {
            return colTop;
        }

        // Kesiþimde Alttaki Þeridi Kesme (Gap)
        // Eðer alttaki þeridin içindeysek VE üstteki þeridin "kesme alanýna" girdiysek
        if (dBot < ribbonWidth)
        {
            if (dTop < ribbonWidth + gapWidth)
            {
                return gapColor; // Burasý videodaki o beyaz "V" veya "U" kesiklerini oluþturur.
            }
            return colBot;
        }

        return bgColor;
    }

    void SaveTexture()
    {
        byte[] bytes = previewTexture.EncodeToPNG();
        string path = EditorUtility.SaveFilePanel("Save PNG", "Assets", "Celtic_True_Weave.png", "png");
        if (!string.IsNullOrEmpty(path)) { File.WriteAllBytes(path, bytes); AssetDatabase.Refresh(); }
    }
}
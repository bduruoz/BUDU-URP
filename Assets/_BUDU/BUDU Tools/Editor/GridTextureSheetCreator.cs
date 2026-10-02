using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using System.IO;

public class GridTextureSheetCreator : EditorWindow
{
    private List<Texture2D> textures = new List<Texture2D>();
    private Vector2 scrollPos;
    private string outputName = "TextureSheet";

    // Grid ayarları
    private int columns = 4;
    private int rows = 4;
    private int cellWidth = 256;
    private int cellHeight = 256;
    private int padding = 0;

    // Otomatik hesaplama
    private bool autoCalculateGrid = true;
    private bool autoSizeCells = true;

    [MenuItem("BUDU-Tools/Generators/Texture Sheet Creator")]
    static void Init()
    {
        GetWindow<GridTextureSheetCreator>("Texture Sheet Creator").Show();
    }

    void OnGUI()
    {
        GUILayout.Label("TEXTURE SHEET CREATOR", EditorStyles.boldLabel);
        EditorGUILayout.Space();

        // Sürükle-bırak alanı
        EditorGUILayout.LabelField("Drag'n Drop", EditorStyles.boldLabel);
        Rect dropArea = GUILayoutUtility.GetRect(0, 80, GUILayout.ExpandWidth(true));
        GUI.Box(dropArea, "Drag'n drop files", GUI.skin.textArea);
        HandleDragAndDrop(dropArea);

        EditorGUILayout.Space();

        // Liste
        EditorGUILayout.LabelField($"{textures.Count} texture loaded:", EditorStyles.miniLabel);
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUILayout.Height(120));

        for (int i = 0; i < textures.Count; i++)
        {
            if (textures[i] == null) continue;
            EditorGUILayout.BeginHorizontal("box");

            // Grid pozisyonunu göster
            int row = i / columns;
            int col = i % columns;
            EditorGUILayout.LabelField($"[{row},{col}]", GUILayout.Width(50));

            EditorGUILayout.ObjectField(textures[i], typeof(Texture2D), false);

            if (GUILayout.Button("▲", GUILayout.Width(25)) && i > 0)
            {
                (textures[i], textures[i - 1]) = (textures[i - 1], textures[i]);
            }
            if (GUILayout.Button("▼", GUILayout.Width(25)) && i < textures.Count - 1)
            {
                (textures[i], textures[i + 1]) = (textures[i + 1], textures[i]);
            }
            if (GUILayout.Button("×", GUILayout.Width(25)))
            {
                textures.RemoveAt(i);
                break;
            }
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.EndScrollView();

        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("Clear")) textures.Clear();
        if (GUILayout.Button("Reverse")) textures.Reverse();
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("", GUI.skin.horizontalSlider);

        // GRID AYARLARI
        EditorGUILayout.LabelField("Grid Settings", EditorStyles.boldLabel);

        autoCalculateGrid = EditorGUILayout.Toggle("Auto Grid Calculate", autoCalculateGrid);

        if (autoCalculateGrid)
        {
            // Otomatik kare grid (sqrt)
            int count = Mathf.Max(1, textures.Count);
            columns = Mathf.CeilToInt(Mathf.Sqrt(count));
            rows = Mathf.CeilToInt((float)count / columns);

            EditorGUILayout.LabelField($"Automatic: {columns}×{rows} = {columns * rows} cell", EditorStyles.miniLabel);
        }
        else
        {
            columns = EditorGUILayout.IntField("Column", columns);
            rows = EditorGUILayout.IntField("Row", rows);
        }

        EditorGUILayout.Space();

        autoSizeCells = EditorGUILayout.Toggle("Auto Cell Size", autoSizeCells);

        if (autoSizeCells && textures.Count > 0 && textures[0] != null)
        {
            cellWidth = textures[0].width;
            cellHeight = textures[0].height;
            EditorGUILayout.LabelField($"Cell: {cellWidth}×{cellHeight}", EditorStyles.miniLabel);
        }
        else
        {
            cellWidth = EditorGUILayout.IntField("Cell Width", cellWidth);
            cellHeight = EditorGUILayout.IntField("Cell Height", cellHeight);
        }

        padding = EditorGUILayout.IntField("Padding (px)", padding);

        EditorGUILayout.Space();

        // Önizleme
        int totalWidth = columns * (cellWidth + padding) - padding;
        int totalHeight = rows * (cellHeight + padding) - padding;
        EditorGUILayout.HelpBox(
            $"render Size: {totalWidth}×{totalHeight}px\n" +
            $"Grid: {columns} Columbs × {rows} Rows = {columns * rows} cell\n" +
            $"Used: {textures.Count} / {columns * rows} cell",
            MessageType.Info);

        outputName = EditorGUILayout.TextField("File Name", outputName);

        EditorGUILayout.Space();

        // RENDER BUTONU
        GUI.backgroundColor = new Color(0.2f, 0.8f, 0.4f);
        GUI.enabled = textures.Count > 0;
        if (GUILayout.Button("TEXTURE SHEET GENERATE", GUILayout.Height(50)))
        {
            CreateGridSheet();
        }
        GUI.enabled = true;
        GUI.backgroundColor = Color.white;

        EditorGUILayout.Space();

        // Particle System ayarları bilgisi
        //EditorGUILayout.LabelField("Particle System Ayarları:", EditorStyles.miniBoldLabel);
        EditorGUILayout.LabelField("• Texture Sheet Module: Enabled", EditorStyles.miniLabel);
        EditorGUILayout.LabelField($"• Tiles: X={columns}, Y={rows}", EditorStyles.miniLabel);
        //EditorGUILayout.LabelField("• Animation: Whole Sheet (veya Single Row)", EditorStyles.miniLabel);
    }

    void HandleDragAndDrop(Rect dropArea)
    {
        Event evt = Event.current;
        switch (evt.type)
        {
            case EventType.DragUpdated:
            case EventType.DragPerform:
                if (!dropArea.Contains(evt.mousePosition)) return;
                DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                if (evt.type == EventType.DragPerform)
                {
                    DragAndDrop.AcceptDrag();
                    foreach (Object obj in DragAndDrop.objectReferences)
                    {
                        if (obj is Texture2D tex && !textures.Contains(tex))
                        {
                            textures.Add(tex);
                        }
                    }
                }
                break;
        }
    }

    void CreateGridSheet()
    {
        if (textures.Count == 0) return;

        // Grid boyutlarını hesapla
        int gridCols = columns;
        int gridRows = rows;

        if (autoCalculateGrid)
        {
            int count = textures.Count;
            gridCols = Mathf.CeilToInt(Mathf.Sqrt(count));
            gridRows = Mathf.CeilToInt((float)count / gridCols);
        }

        // Sheet boyutları
        int sheetWidth = gridCols * cellWidth + (gridCols - 1) * padding;
        int sheetHeight = gridRows * cellHeight + (gridRows - 1) * padding;

        // Yeni texture oluştur
        Texture2D sheet = new Texture2D(sheetWidth, sheetHeight, TextureFormat.RGBA32, false);

        // Şeffaf arka plan
        Color[] clearColors = new Color[sheetWidth * sheetHeight];
        for (int i = 0; i < clearColors.Length; i++) clearColors[i] = Color.clear;
        sheet.SetPixels(clearColors);

        // Her texture'ı grid'e yerleştir (sol üstten başla, satır satır)
        for (int i = 0; i < textures.Count; i++)
        {
            if (textures[i] == null) continue;

            Texture2D tex = MakeReadableCopy(textures[i]);

            // Hücre boyutuna ölçeklendir
            Texture2D resizedTex = ResizeTexture(tex, cellWidth, cellHeight);

            // Grid pozisyonu (sol üstten başla)
            int gridX = i % gridCols;  // Sütun
            int gridY = i / gridCols;  // Satır

            // Texture koordinatları (Unity'de Y yukarıdan aşağıya)
            int pixelX = gridX * (cellWidth + padding);
            int pixelY = sheetHeight - (gridY + 1) * (cellHeight + padding) + padding;

            // Pixel'leri kopyala
            Color[] pixels = resizedTex.GetPixels();
            sheet.SetPixels(pixelX, pixelY, cellWidth, cellHeight, pixels);

            DestroyImmediate(tex);
            DestroyImmediate(resizedTex);
        }

        sheet.Apply();

        // Kaydet
        byte[] bytes = sheet.EncodeToPNG();
        string path = $"Assets/{outputName}.png";
        File.WriteAllBytes(path, bytes);

        DestroyImmediate(sheet);
        AssetDatabase.Refresh();

        // Import ayarları
        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
        if (importer != null)
        {
            importer.textureType = TextureImporterType.Sprite;
            importer.spriteImportMode = SpriteImportMode.Multiple;

            // Grid olarak sprite'ları oluştur
            List<SpriteMetaData> spriteMeta = new List<SpriteMetaData>();

            for (int i = 0; i < textures.Count; i++)
            {
                int gridX = i % gridCols;
                int gridY = i / gridCols;

                int pixelX = gridX * (cellWidth + padding);
                int pixelY = sheetHeight - (gridY + 1) * (cellHeight + padding) + padding;

                SpriteMetaData meta = new SpriteMetaData
                {
                    name = textures[i] != null ? textures[i].name : $"Frame_{i:00}",
                    rect = new Rect(pixelX, pixelY, cellWidth, cellHeight),
                    pivot = new Vector2(0.5f, 0.5f),
                    alignment = (int)SpriteAlignment.Center
                };
                spriteMeta.Add(meta);
            }

            importer.spritesheet = spriteMeta.ToArray();
            importer.SaveAndReimport();
        }

        EditorUtility.DisplayDialog("Başarılı!",
            $"Texture Sheet generated!\n\n" +
            $"File: {path}\n" +
            $"Size: {sheetWidth}×{sheetHeight}px\n" +
            $"Grid: {gridCols}×{gridRows}\n\n",
            "OK");
    }

    Texture2D MakeReadableCopy(Texture2D source)
    {
        RenderTexture renderTex = RenderTexture.GetTemporary(
            source.width, source.height, 0,
            RenderTextureFormat.Default,
            RenderTextureReadWrite.Linear);

        Graphics.Blit(source, renderTex);
        RenderTexture previous = RenderTexture.active;
        RenderTexture.active = renderTex;

        Texture2D readableText = new Texture2D(source.width, source.height);
        readableText.ReadPixels(new Rect(0, 0, renderTex.width, renderTex.height), 0, 0);
        readableText.Apply();

        RenderTexture.active = previous;
        RenderTexture.ReleaseTemporary(renderTex);

        return readableText;
    }

    Texture2D ResizeTexture(Texture2D source, int width, int height)
    {
        if (source.width == width && source.height == height)
            return source;

        RenderTexture rt = RenderTexture.GetTemporary(width, height);
        RenderTexture.active = rt;

        Graphics.Blit(source, rt);

        Texture2D result = new Texture2D(width, height);
        result.ReadPixels(new Rect(0, 0, width, height), 0, 0);
        result.Apply();

        RenderTexture.active = null;
        RenderTexture.ReleaseTemporary(rt);

        return result;
    }
}
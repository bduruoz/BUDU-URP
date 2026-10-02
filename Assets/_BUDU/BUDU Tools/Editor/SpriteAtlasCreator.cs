using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.U2D;
using UnityEngine;
using UnityEngine.U2D;

public class SpriteAtlasCreator : EditorWindow
{
    private List<Texture2D> textures = new List<Texture2D>();
    private Vector2 scrollPos;
    private string atlasName = "NewSpriteAtlas";
    private int padding = 0;
    private bool enableRotation = false;
    private bool enableTightPacking = false;

    [MenuItem("BUDU-Tools/Generators/Sprite Atlas Creator")]
    static void Init()
    {
        GetWindow<SpriteAtlasCreator>("Atlas Creator").Show();
    }

    void OnGUI()
    {
        GUILayout.Label("Sprite Atlas Generator", EditorStyles.boldLabel);
        EditorGUILayout.Space();

        // Sürükle-býrak alaný
        EditorGUILayout.LabelField("Textures", EditorStyles.boldLabel);
        Rect dropArea = GUILayoutUtility.GetRect(0, 100, GUILayout.ExpandWidth(true));
        GUI.Box(dropArea, "Drag'n Drop files", GUI.skin.textArea);
        HandleDragAndDrop(dropArea);

        EditorGUILayout.Space();

        // Liste
        EditorGUILayout.LabelField($"{textures.Count} texture loaded:", EditorStyles.miniLabel);
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUILayout.Height(150));

        for (int i = 0; i < textures.Count; i++)
        {
            if (textures[i] == null) continue;
            EditorGUILayout.BeginHorizontal("box");
            EditorGUILayout.LabelField($"{i + 1}.", GUILayout.Width(30));
            EditorGUILayout.ObjectField(textures[i], typeof(Texture2D), false);
            if (GUILayout.Button("×", GUILayout.Width(25)))
            {
                textures.RemoveAt(i);
                break;
            }
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.EndScrollView();

        if (GUILayout.Button("Clear")) textures.Clear();

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("", GUI.skin.horizontalSlider);

        // Ayarlar
        atlasName = EditorGUILayout.TextField("Atlas Name", atlasName);
        padding = EditorGUILayout.IntField("Padding (px)", padding);
        enableRotation = EditorGUILayout.Toggle("Rotation", enableRotation);
        enableTightPacking = EditorGUILayout.Toggle("Tight Packing", enableTightPacking);

        EditorGUILayout.Space();

        // Butonlar
        GUI.backgroundColor = new Color(0.3f, 0.7f, 1f);
        GUI.enabled = textures.Count > 0;
        if (GUILayout.Button("GENERATE", GUILayout.Height(40)))
        {
            CreateSpriteAtlas();
        }
        GUI.enabled = true;
        GUI.backgroundColor = Color.white;

        EditorGUILayout.Space();

        GUI.backgroundColor = new Color(1f, 0.6f, 0.2f);
        if (GUILayout.Button("TEXTURE2D PACK", GUILayout.Height(30)))
        {
            CreatePackedTexture();
        }
        GUI.backgroundColor = Color.white;
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

    void CreateSpriteAtlas()
    {
        string path = $"Assets/{atlasName}.spriteatlas";

        // Var olaný sil
        if (AssetDatabase.LoadAssetAtPath<SpriteAtlas>(path) != null)
        {
            AssetDatabase.DeleteAsset(path);
        }

        // Yeni atlas oluþtur
        SpriteAtlas atlas = new SpriteAtlas();

        // SADECE TEMEL AYARLAR (format ve platform settings yok)
        SpriteAtlasPackingSettings packSettings = new SpriteAtlasPackingSettings
        {
            padding = padding,
            enableRotation = enableRotation,
            enableTightPacking = enableTightPacking
        };
        atlas.SetPackingSettings(packSettings);

        // Texture ayarlarý (format property'si olmayan versiyon)
        SpriteAtlasTextureSettings textureSettings = new SpriteAtlasTextureSettings
        {
            readable = false,
            generateMipMaps = false,
            sRGB = true,
            filterMode = FilterMode.Bilinear
            // format YOK - varsayýlaný kullan
        };
        atlas.SetTextureSettings(textureSettings);

        // SpriteAtlasPlatformSettings KALDIRILDI

        // Objeleri ekle
        List<Object> objectsToAdd = new List<Object>();

        foreach (var tex in textures)
        {
            string texPath = AssetDatabase.GetAssetPath(tex);

            // Texture'ý sprite olarak ayarla
            TextureImporter importer = AssetImporter.GetAtPath(texPath) as TextureImporter;
            if (importer != null && importer.textureType != TextureImporterType.Sprite)
            {
                importer.textureType = TextureImporterType.Sprite;
                importer.spriteImportMode = SpriteImportMode.Single;
                importer.SaveAndReimport();
            }

            Sprite sprite = AssetDatabase.LoadAssetAtPath<Sprite>(texPath);
            if (sprite != null)
                objectsToAdd.Add(sprite);
            else
                objectsToAdd.Add(tex);
        }

        atlas.Add(objectsToAdd.ToArray());

        // Kaydet
        AssetDatabase.CreateAsset(atlas, path);
        AssetDatabase.SaveAssets();

        EditorUtility.DisplayDialog("Baþarýlý",
            $"Sprite Atlas Generated: {path}\n{objectsToAdd.Count} sprite added.", "OK");

        Selection.activeObject = atlas;
    }

    void CreatePackedTexture()
    {
        List<Texture2D> readableTextures = new List<Texture2D>();
        foreach (var tex in textures)
        {
            readableTextures.Add(MakeReadableCopy(tex));
        }

        Texture2D atlasTexture = new Texture2D(2, 2, TextureFormat.RGBA32, false);
        Rect[] rects = atlasTexture.PackTextures(readableTextures.ToArray(), padding, 4096);

        byte[] bytes = atlasTexture.EncodeToPNG();
        string path = $"Assets/{atlasName}_Packed.png";
        File.WriteAllBytes(path, bytes);

        AssetDatabase.Refresh();

        TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;
        if (importer != null)
        {
            importer.textureType = TextureImporterType.Sprite;
            importer.spriteImportMode = SpriteImportMode.Multiple;

            List<SpriteMetaData> spriteMeta = new List<SpriteMetaData>();
            for (int i = 0; i < rects.Length && i < textures.Count; i++)
            {
                SpriteMetaData meta = new SpriteMetaData
                {
                    name = textures[i] != null ? textures[i].name : $"Sprite_{i}",
                    rect = new Rect(
                        rects[i].x * atlasTexture.width,
                        rects[i].y * atlasTexture.height,
                        rects[i].width * atlasTexture.width,
                        rects[i].height * atlasTexture.height
                    ),
                    pivot = new Vector2(0.5f, 0.5f),
                    alignment = (int)SpriteAlignment.Center
                };
                spriteMeta.Add(meta);
            }

            importer.spritesheet = spriteMeta.ToArray();
            importer.SaveAndReimport();
        }

        foreach (var tex in readableTextures)
            if (tex != null) DestroyImmediate(tex);
        DestroyImmediate(atlasTexture);

        EditorUtility.DisplayDialog("Success",
            $"Packed Texture Generated: {path}\n{rects.Length} Sprite.", "OK");
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
}
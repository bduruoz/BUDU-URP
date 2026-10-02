// © BUDU Games 2024 - 2026
// LibNoise Designer

#if UNITY_EDITOR
using System;
using System.Linq;
using UnityEditor;
using UnityEngine;
using BUDU.LNoise.Generators;

namespace BUDU.LNoise.Editors
{
    public class NoiseDesignerWindow : EditorWindow
    {
        const int previewRes = 256;
        Texture2D _previewTex;

        [SerializeField] NoiseDef _selected;
        Editor _cachedEditor;

        string[] _typeNames;
        Type[] _types;
        int _typeIndex;
        int _lastHash;
        float _nextUpdateTime;

        [MenuItem("BUDU-Tools/Generators/LibNoise Designer")]
        static void Open() => GetWindow<NoiseDesignerWindow>("LibNoise Designer");

        void OnEnable()
        {
            var baseType = typeof(NoiseDef);
            _types = baseType.Assembly.GetTypes()
                                      .Where(t => t.IsSubclassOf(baseType) && !t.IsAbstract)
                                      .OrderBy(t => t.Name)
                                      .ToArray();

            _typeNames = _types.Select(t => t.Name.Replace("Def", "")).ToArray();
        }

        void OnSelectionChange()   // proje view’da bir SO seçilirse
        {
            var picked = Selection.activeObject as NoiseDef;
            if (picked != null)
            {
                _selected = picked;
                _cachedEditor = null;
                Repaint();
            }
        }

        void OnGUI()
        {
            // 1) ÜST BAR – Yeni asset yarat
            EditorGUILayout.HelpBox("Select a generator type and click 'New' to create.", MessageType.None);
            using (new EditorGUILayout.HorizontalScope())
            {
                _typeIndex = EditorGUILayout.Popup("Module Type", _typeIndex, _typeNames);
                if (GUILayout.Button("New", GUILayout.Width(50)))
                    CreateNewAsset();
            }
            EditorGUILayout.Space(10);

            // 2) SOL LİSTE – Var olan asset’ler
            using (new EditorGUILayout.HorizontalScope())
            {
                DrawAssetList();
                GUILayout.Space(5);
                DrawInspector();
            }

            if (Event.current.type == EventType.Repaint && Time.realtimeSinceStartup >= _nextUpdateTime)
            {
                if (_selected == null) return;
                int curr = _selected.GetParamHash();
                if (curr != _lastHash)
                {
                    _lastHash = curr;
                    _nextUpdateTime = Time.realtimeSinceStartup + 0.1f;
                    RegeneratePreview();
                }
            }
        }

        void DrawAssetList()
        {
            // Filtreleme için AssetDatabase.FindAssets kullan
            var all = AssetDatabase.FindAssets("t:NoiseDef")
                                   .Select(g => AssetDatabase.LoadAssetAtPath<NoiseDef>(AssetDatabase.GUIDToAssetPath(g)))
                                   .Where(a => a != null) // null olanları filtrele
                                   .OrderBy(a => a.name)
                                   .ToList();

            using (var scope = new EditorGUILayout.VerticalScope(GUILayout.Width(200)))
            {
                GUILayout.Label("Assets", EditorStyles.boldLabel);
                _scrollList = GUILayout.BeginScrollView(_scrollList);
                foreach (var asset in all)
                {
                    bool on = asset == _selected;
                    if (GUILayout.Toggle(on, asset.name, "Button") && !on)
                    {
                        _selected = asset;
                        _cachedEditor = null;
                    }
                }
                GUILayout.EndScrollView();
            }
        }

        Vector2 _scrollList, _scrollInspector;

        void DrawInspector()
        {
            using (var scope = new EditorGUILayout.VerticalScope())
            {
                if (_selected == null)
                {
                    GUILayout.FlexibleSpace();
                    GUILayout.Label("Select or create a NoiseDef asset.", EditorStyles.centeredGreyMiniLabel);
                    GUILayout.FlexibleSpace();
                    return;
                }

                if (_cachedEditor == null) _cachedEditor = Editor.CreateEditor(_selected);

                _scrollInspector = GUILayout.BeginScrollView(_scrollInspector);
                _cachedEditor.OnInspectorGUI();
                GUILayout.EndScrollView();

                GUILayout.Space(10);
                GUILayout.Label("Preview", EditorStyles.boldLabel);
                DrawPreview();
            }
        }

        void CreateNewAsset()
        {
            Debug.Log("[LNOISE] Creating new asset of type: " + _typeNames[_typeIndex]);
            Type t = _types[_typeIndex];
            var inst = CreateInstance(t) as NoiseDef;
            inst.name = _typeNames[_typeIndex];

            string folder = "Assets/_BUDU/LibNoise Designer/Presets";
            if (!AssetDatabase.IsValidFolder(folder))
                AssetDatabase.CreateFolder("Assets/_BUDU/LibNoise Designer", "Presets");

            string path = EditorUtility.SaveFilePanelInProject("Save Noise Asset",
                                                               inst.name,
                                                               "asset",
                                                               "Choose where to save the asset.",
                                                               folder);
            if (string.IsNullOrEmpty(path)) return;

            // GUID çakışmasını temizle
            if (AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(path) != null)
                AssetDatabase.DeleteAsset(path);

            AssetDatabase.CreateAsset(inst, path);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            AssetDatabase.ImportAsset(path);  // Meta bilgilerini güncelle

            _selected = inst;
            _cachedEditor = null;
            Repaint();
        }


        void DrawPreview()
        {
            if (_selected == null) return;

            // Texture yoksa oluştur
            if (_previewTex == null || _previewTex.width != previewRes)
            {
                if (_previewTex != null) DestroyImmediate(_previewTex);
                _previewTex = new Texture2D(previewRes, previewRes, TextureFormat.RGB24, false);
            }

            // Hash değişmemişse eski texture’ı kullan
            int curr = _selected.GetParamHash();
            if (curr != _lastHash)
            {
                _lastHash = curr;
                RegeneratePreview();   // TEK SEFER
            }

            GUILayout.Label(_previewTex, GUILayout.Width(previewRes), GUILayout.Height(previewRes));
        }

        void RegeneratePreview()
        {
            if (_selected == null) return;
            int res = previewRes;
            if (_previewTex == null || _previewTex.width != res)
            {
                if (_previewTex != null) DestroyImmediate(_previewTex);
                _previewTex = new Texture2D(res, res, TextureFormat.RGB24, false);
            }

            var module = _selected.Build();
            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                {
                    float v = (float)module.GetValue((x / (float)res - 0.5f) * 4f, 0,
                                                     (y / (float)res - 0.5f) * 4f);
                    v = Mathf.InverseLerp(-1, 1, v);
                    _previewTex.SetPixel(x, y, Color.Lerp(Color.black, Color.white, v));
                }
            _previewTex.Apply();
        }
    }
}
#endif
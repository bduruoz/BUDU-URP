// BUDU Tools 2024 - 2026
using UnityEngine;
using UnityEditor;

namespace budu.tools
{
    public class Renamer : EditorWindow
    {
        private Texture2D banner;
        string baseName = "Object";
        int startIndex = 1;
        int digits = 2;

        [MenuItem("BUDU-Tools/Tools/Renamer _#r")]
        public static void ShowWindow()
        {
            GetWindow<Renamer>("Rename Objects");
            Renamer window = GetWindow<Renamer>(true, "Renamer");
            window.minSize = new Vector2(400, 120);
            window.maxSize = new Vector2(400, 120);
            window.Show();
        }

        private void OnEnable()
        {
            banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsRenamer.png", typeof(Texture2D));
        }

        void OnGUI()
        {
            GUILayout.Space(3);
            if (banner != null)
            {
                float bannerHeight = 25f;
                float ratio = (float)banner.width / banner.height;
                float drawWidth = bannerHeight * ratio;
                Rect bannerRect = GUILayoutUtility.GetRect(drawWidth, bannerHeight, GUILayout.ExpandWidth(false));
                bannerRect.x = 2;
                GUI.DrawTexture(bannerRect, banner, ScaleMode.ScaleToFit,true);
            }
            else
            {
                GUILayout.Space(2);
                GUILayout.BeginHorizontal();
                GUILayout.FlexibleSpace();
                GUIStyle stl = new GUIStyle();
                stl.normal.textColor = Color.white;
                stl.fontSize = 18;
                stl.fontStyle = FontStyle.Bold;
                GUILayout.Label("Rename Settings", stl);
                GUILayout.FlexibleSpace();
                GUILayout.EndHorizontal();
            }
            GUILayout.Space(10);

            baseName = EditorGUILayout.TextField("Base Name", baseName);
            startIndex = EditorGUILayout.IntField("Start Index", startIndex);
            digits = EditorGUILayout.IntField("Digits", digits);

            if (GUILayout.Button("Rename"))
            {
                RenameObjects();
            }
        }

        void RenameObjects()
        {
            GameObject[] selectedObjects = Selection.gameObjects;

            if (selectedObjects.Length == 0)
            {
                Debug.LogWarning("No objects selected!");
                return;
            }

            Undo.RecordObjects(selectedObjects, "Rename Objects");

            for (int i = 0; i < selectedObjects.Length; i++)
            {
                string newName = $"{baseName}{(startIndex + i).ToString().PadLeft(digits, '0')}";
                selectedObjects[i].name = newName;
            }

            Debug.Log($"Renamed {selectedObjects.Length} objects with base name '{baseName}'");
        }
    }
}
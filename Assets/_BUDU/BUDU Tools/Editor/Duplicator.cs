// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEngine;

namespace budu.tools
{
    public class Duplicator : EditorWindow
    {
        private Texture2D banner;
        private int count = 5;
        private Vector3 positionOffset = Vector3.zero;
        private Vector3 rotationOffset = Vector3.zero;
        private Vector3 scaleOffset = Vector3.zero;

        [MenuItem("BUDU-Tools/Tools/Duplicator %#d")]
        public static void ShowWindow()
        {
            GetWindow<Duplicator>("Duplicator");
            Duplicator window = GetWindow<Duplicator>(true, "Duplicator");
            window.minSize = new Vector2(400, 200);
            window.maxSize = new Vector2(400, 200);
            window.Show();
        } 
        private void OnEnable()
        {
            banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsDuplicator.png",typeof(Texture2D));
        }

        private void OnGUI()
        {
            GUILayout.Space(3);
            if(banner != null)
            {
                float bannerHeight = 25f;
                float ratio = (float)banner.width / banner.height;
                float drawWidth = bannerHeight * ratio;
                Rect bannerRect = GUILayoutUtility.GetRect(drawWidth, bannerHeight, GUILayout.ExpandWidth(false));
                bannerRect.x = 2;
                GUI.DrawTexture(bannerRect, banner,ScaleMode.ScaleToFit, true);
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
                GUILayout.Label("Duplicate Settings", stl);
                GUILayout.FlexibleSpace();
                GUILayout.EndHorizontal();
            }
            GUILayout.Space(10);

            count = EditorGUILayout.IntField("Count", count);

            positionOffset = EditorGUILayout.Vector3Field("Position Offset", positionOffset);
            rotationOffset = EditorGUILayout.Vector3Field("Rotation Offset", rotationOffset);
            scaleOffset = EditorGUILayout.Vector3Field("Scale Offset", scaleOffset);

            if (GUILayout.Button("Duplicate Selected"))
            {
                DuplicateSelected();
            }
        }

        private void DuplicateSelected()
        {
            GameObject selected = Selection.activeGameObject;
            if (selected == null)
            {
                Debug.LogWarning("No GameObject selected!");
                return;
            }

            GameObject last = selected;

            for (int i = 0; i < count; i++)
            {
                Unsupported.DuplicateGameObjectsUsingPasteboard();

                GameObject dup = Selection.activeGameObject;

                dup.transform.position = last.transform.position + positionOffset;
                dup.transform.rotation = last.transform.rotation * Quaternion.Euler(rotationOffset);
                dup.transform.localScale = last.transform.localScale + scaleOffset;

                last = dup;
            }
        }
    }
}
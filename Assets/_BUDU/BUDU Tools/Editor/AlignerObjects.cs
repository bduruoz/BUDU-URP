// BUDU Games 2024 - 2025
using budu.tools;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace budu.tools
{
    public class AlignerObjects : EditorWindow
    {
        private Texture2D banner;
        private enum AlignMode { Center, Distribute, Left, Right, Top, Bottom, Front, Back }
        private enum Axis { X, Y, Z }

        private Axis selectedAxis = Axis.X;
        private AlignMode alignMode = AlignMode.Center;
        private float spacing = 1f;

        [MenuItem("BUDU-Tools/Tools/Aligner Objects")]
        public static void ShowWindow()
        {
            GetWindow<AlignerObjects>("Aligner Objects");
            AlignerObjects window = GetWindow<AlignerObjects>(true, "Aligner Objects");
            window.minSize = new Vector2(400, 150);
            window.maxSize = new Vector2(400, 150);
            window.Show();
        }

        private void OnEnable()
        {
            banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsAligner.png", typeof(Texture2D));
        }

        private void OnGUI()
        {
            GUILayout.Space(3);
            if (banner != null)
            {
                float bannerHeight = 25f;
                float ratio = (float)banner.width / banner.height;
                float drawWidth = bannerHeight * ratio;
                Rect bannerRect = GUILayoutUtility.GetRect(drawWidth, bannerHeight, GUILayout.ExpandWidth(false));
                bannerRect.x = 2;
                GUI.DrawTexture(bannerRect, banner, ScaleMode.ScaleToFit, true);
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
                GUILayout.Label("Aligner Settings", stl);
                GUILayout.FlexibleSpace();
                GUILayout.EndHorizontal();
            }

            // Axis toggle
            EditorGUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUILayout.Label("AXIS", EditorStyles.boldLabel);
            GUILayout.FlexibleSpace();
            EditorGUILayout.EndHorizontal();
            selectedAxis = (Axis)GUILayout.Toolbar((int)selectedAxis, new string[] { "X", "Y", "Z" });

            GUILayout.Space(3);

            // Align Mode toggle
            EditorGUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUILayout.Label("ALIGN MODE", EditorStyles.boldLabel);
            GUILayout.FlexibleSpace();
            EditorGUILayout.EndHorizontal();
            alignMode = (AlignMode)GUILayout.Toolbar((int)alignMode, new string[]
            {
        "Center", "Distribute", "Left", "Right", "Top", "Bottom", "Front", "Back"
            });

            //GUILayout.Space(10);

            if (alignMode == AlignMode.Distribute)
            {
                spacing = EditorGUILayout.FloatField("Spacing", spacing);
            }

            //GUILayout.Space(10);

            if (GUILayout.Button("Align"))
            {
                AlignSelectedObjects();
            }
        }

        private void AlignSelectedObjects()
        {
            GameObject[] selectedObjects = Selection.gameObjects;

            if (selectedObjects.Length < 2)
            {
                Debug.LogWarning("Select at least 2 objects to align.");
                return;
            }

            List<Transform> transforms = selectedObjects.Select(o => o.transform).OrderBy(t =>
            {
                return selectedAxis == Axis.X ? t.position.x :
                       selectedAxis == Axis.Y ? t.position.y : t.position.z;
            }).ToList();

            float min = transforms.First().position[(int)selectedAxis];
            float max = transforms.Last().position[(int)selectedAxis];

            Undo.RecordObjects(transforms.ToArray(), "Align Objects");

            switch (alignMode)
            {
                case AlignMode.Center:
                    float center = (min + max) / 2f;
                    foreach (var t in transforms)
                        SetAxisPosition(t, selectedAxis, center);
                    break;

                case AlignMode.Left:
                case AlignMode.Bottom:
                case AlignMode.Back:
                    foreach (var t in transforms)
                        SetAxisPosition(t, selectedAxis, min);
                    break;

                case AlignMode.Right:
                case AlignMode.Top:
                case AlignMode.Front:
                    foreach (var t in transforms)
                        SetAxisPosition(t, selectedAxis, max);
                    break;

                case AlignMode.Distribute:
                    for (int i = 0; i < transforms.Count; i++)
                        SetAxisPosition(transforms[i], selectedAxis, min + i * spacing);
                    break;
            }
        }

        private void SetAxisPosition(Transform t, Axis axis, float value)
        {
            Vector3 pos = t.position;
            switch (axis)
            {
                case Axis.X: pos.x = value; break;
                case Axis.Y: pos.y = value; break;
                case Axis.Z: pos.z = value; break;
            }
            t.position = pos;
        }
    }
}


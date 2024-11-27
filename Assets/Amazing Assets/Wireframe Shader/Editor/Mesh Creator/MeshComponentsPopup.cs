// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{
    internal class MeshComponentsPopup : PopupWindowContent
    {
        [Flags]
        public enum Flags
        {
            None = 0,

            UV0 = 1,
            UV1 = 2,
            UV2 = 4,
            UV3 = 8,
            UV4 = 16,
            UV5 = 32,
            UV6 = 64,
            UV7 = 128,

            Color = 256,
            Normal = 512,
            Tangent = 1024,
            Skin = 2048,


            All = UV0 | UV1 | UV2 | UV3 | UV4 | UV5 | UV6 | UV7 | Color | Normal | Tangent | Skin
        }


        public MeshComponentsPopup()
        {
        }

        public override Vector2 GetWindowSize()
        {
            return new Vector2(140, 15 * 20 + 3 * 4 + 12);
        }

        public override void OnGUI(Rect rect)
        {
            EditorGUI.BeginChangeCheck();
            EditorWindow.active.editorSettings.useMeshOptimizeDefaultFlags = EditorGUILayout.ToggleLeft("Default", EditorWindow.active.editorSettings.useMeshOptimizeDefaultFlags);
            if (EditorGUI.EndChangeCheck())
            {
                EditorWindow.active.Repaint();
            }

            if (GUILayout.Button("All"))
            {
                EditorWindow.active.editorSettings.useMeshOptimizeDefaultFlags = false;
                EditorWindow.active.editorSettings.meshOptimizeFlags = (Flags)~0;

                EditorWindow.active.Repaint();
            }
            if (GUILayout.Button("None"))
            {
                EditorWindow.active.editorSettings.useMeshOptimizeDefaultFlags = false;
                EditorWindow.active.editorSettings.meshOptimizeFlags = (Flags)0;

                EditorWindow.active.Repaint();
            }

            GUILayout.Space(4);


            Flags flags = EditorWindow.active.editorSettings.meshOptimizeFlags;

            bool UV0 = (flags & Flags.UV0) != Flags.None;
            bool UV1 = (flags & Flags.UV1) != Flags.None;
            bool UV2 = (flags & Flags.UV2) != Flags.None;
            bool UV3 = (flags & Flags.UV3) != Flags.None;
            bool UV4 = (flags & Flags.UV4) != Flags.None;
            bool UV5 = (flags & Flags.UV5) != Flags.None;
            bool UV6 = (flags & Flags.UV6) != Flags.None;
            bool UV7 = (flags & Flags.UV7) != Flags.None;

            bool color = (flags & Flags.Color) != Flags.None;
            bool normal = (flags & Flags.Normal) != Flags.None;
            bool tangent = (flags & Flags.Tangent) != Flags.None;
            bool skin = (flags & Flags.Skin) != Flags.None;



            EditorGUI.BeginChangeCheck();

            using (new EditorGUIHelper.GUIEnabled(EditorWindow.active.editorSettings.useMeshOptimizeDefaultFlags == false))
            {
                UV0 = EditorGUILayout.ToggleLeft("UV0", UV0);
                UV1 = EditorGUILayout.ToggleLeft("UV1", UV1);
                UV2 = EditorGUILayout.ToggleLeft("UV2", UV2);

                using (new EditorGUIHelper.GUIEnabled(false))
                {
                    UV3 = EditorGUILayout.ToggleLeft("UV3  (Wireframe)", true);
                }

                UV4 = EditorGUILayout.ToggleLeft("UV4", UV4);
                UV5 = EditorGUILayout.ToggleLeft("UV5", UV5);
                UV6 = EditorGUILayout.ToggleLeft("UV6", UV6);
                UV7 = EditorGUILayout.ToggleLeft("UV7", UV7);

                DrawSeparator();

                color = EditorGUILayout.ToggleLeft("Color", color);
                normal = EditorGUILayout.ToggleLeft("Normal", normal);
                tangent = EditorGUILayout.ToggleLeft("Tangent", tangent);

                DrawSeparator();

                skin = EditorGUILayout.ToggleLeft("Skin", skin);
            }



            if (EditorGUI.EndChangeCheck())
            {
                EditorWindow.active.editorSettings.meshOptimizeFlags = UV0 ? Flags.UV0 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV1 ? Flags.UV1 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV2 ? Flags.UV2 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV3 ? Flags.UV3 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV4 ? Flags.UV4 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV5 ? Flags.UV5 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV6 ? Flags.UV6 : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= UV7 ? Flags.UV7 : 0;

                EditorWindow.active.editorSettings.meshOptimizeFlags |= color ? Flags.Color : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= normal ? Flags.Normal : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= tangent ? Flags.Tangent : 0;
                EditorWindow.active.editorSettings.meshOptimizeFlags |= skin ? Flags.Skin : 0;

                EditorWindow.active.Repaint();
            }
        }


        private void DrawSeparator()
        {
            Rect rect = EditorGUILayout.GetControlRect(false, 4);

            EditorGUI.DrawRect(new Rect(rect.xMin + 3, rect.yMin + 2, rect.width - 6, 1), Color.gray * 0.85f);
        }

        static public string GetLabelName(Flags flags)
        {
            string buttonName = (flags == 0 ? "None" : (flags == (MeshComponentsPopup.Flags)~0 ? "Everything" : "Mixed"));

            if (flags == 0)
                return "None";
            else if (flags == (Flags)~0)
                return "All";
            else
            {
                switch (flags)
                {
                    case Flags.UV0: return "UV0";
                    case Flags.UV1: return "UV1";
                    case Flags.UV2: return "UV2";
                    case Flags.UV3: return "UV3";
                    case Flags.UV4: return "UV4";
                    case Flags.UV5: return "UV5";
                    case Flags.UV6: return "UV6";
                    case Flags.UV7: return "UV7";
                    case Flags.Color: return "Color";
                    case Flags.Normal: return "Normal";
                    case Flags.Tangent: return "Tangent";
                    case Flags.Skin: return "Skin";


                    default: return "Mixed";
                }
            }
        }
    }
}
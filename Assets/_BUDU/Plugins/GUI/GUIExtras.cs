using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace budu
{
    public static class GUIExtras
    {
        // GUI Extras

        #region MakeBackground
        /// <summary>
        /// Creates a single-color Texture2D with the specified color.
        /// </summary>
        public static Texture2D MakeBackground(int width, int height, Color col)
        {
            Color[] pix = Enumerable.Repeat(col, width * height).ToArray();
            Texture2D result = new Texture2D(width, height);
            result.SetPixels(pix);
            result.Apply();
            return result;
        }
        #endregion

        #region Banner
        /// <summary>
        /// Places a banner texture on top of the Shader GUI.
        /// </summary>
        public static void Banner(string assetPath, int width = 512, int height = 32)
        {
            Texture banner = AssetDatabase.LoadAssetAtPath<Texture>(assetPath);
            if (banner == null) return;

            GUILayout.BeginArea(new Rect(0, 0, width, height));
            EditorGUILayout.BeginHorizontal();
            GUI.backgroundColor = Color.clear;
            GUILayout.Box(banner, GUILayout.MinHeight(height));
            EditorGUILayout.EndHorizontal();
            GUILayout.EndArea();
            GUILayout.Space(28);
            GUI.backgroundColor = BDColors.White(255);
        }
        #endregion

        #region ColoredVertical
        /// <summary>
        /// Creates a colored vertical box, runs the action delegate, and closes it.
        /// </summary>
        public static void ColoredVertical(Color color, System.Action inside, bool MiddleCenter = true, params GUILayoutOption[] options)
        {
            if (options == null || options.Length == 0)
                options = new GUILayoutOption[] { GUILayout.ExpandWidth(true) };

            Rect rect = EditorGUILayout.BeginVertical(options);
            if (MiddleCenter) GUILayout.FlexibleSpace();

            if (Event.current.type == EventType.Repaint)
            {
                // Arka planı alpha destekli çiz
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, color, Color.clear);
                Handles.EndGUI();
            }

            inside?.Invoke();

            if (MiddleCenter) GUILayout.FlexibleSpace();
            EditorGUILayout.EndVertical();
        }

        /// Overloads
        public static void ColoredVertical(Color color, Action inside, params GUILayoutOption[] options)
        {
            ColoredVertical(color,inside,true,options);
        }

        #endregion

        #region About
        /// <summary>
        /// Draws the About logo and foldout at the bottom of the Shader.
        /// </summary>
        public static bool About(ref bool aboutFold, GUIStyle style, string logoPath)
        {
            EditorGUILayout.Space(5);
            style.normal.textColor = BDColors.NexusOrange(153);
            style.fontSize = 10;
            style.fontStyle = FontStyle.Italic;

            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            aboutFold = EditorGUILayout.Foldout(aboutFold, "About", true, style);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();

            if (aboutFold)
            {
                EditorGUILayout.BeginHorizontal();
                GUILayout.FlexibleSpace();
                Texture logo = AssetDatabase.LoadAssetAtPath<Texture>(logoPath);
                if (logo != null)
                {
                    Rect rect = GUILayoutUtility.GetRect(400, 50, GUILayout.ExpandWidth(false));
                    GUI.DrawTexture(rect, logo, ScaleMode.ScaleToFit, true);
                }
                GUILayout.FlexibleSpace();
                EditorGUILayout.EndHorizontal();
            }

            return aboutFold;
        }
        #endregion

        #region IsTextureEmpty
        public static bool IsTextureEmpty(MaterialProperty prop)
        {
            if (prop == null) return true;             // Property yoksa boş say
            if (prop.propertyType != UnityEngine.Rendering.ShaderPropertyType.Texture) return true;  // Texture değilse boş say

            Texture tex = prop.textureValue;
            return tex == null;                        // null
        }
        #endregion

        #region Toggle Header  
        /// <summary>
        /// Toggle header for normal inspector or custom window
        /// </summary>
        public static bool Header(string title, ref bool state, GUIStyle style)
        {
            style.normal.background = MakeBackground(1, 1, BDColors.GrayP(18, 204));
            style.fontSize = 16;
            style.normal.textColor = BDColors.NexusOrange();

            EditorGUILayout.BeginVertical(style);
            state = EditorGUILayout.ToggleLeft(title, state, style);
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, BDColors.Transparent(0));

            return state;
        }
        #endregion

        #region Foldout
        /// <summary>
        /// Creates a foldout section with a colored background.
        /// Stores the foldout state in a ref bool
        /// </summary>
        /// <param name="state">Foldout open/close state</param>
        /// <param name="label">Foldout label</param>
        /// <param name="bgColor">Background color</param>
        /// <param name="drawContent">Action that draws content inside if expanded</param>
        public static void Foldout(ref bool state, string label, Color bgColor, Action drawContent)
        {
            GUIStyle style = new GUIStyle(EditorStyles.helpBox);
            style.normal.background = MakeBackground(1, 1, bgColor);

            EditorGUILayout.BeginVertical(style);
            EditorGUI.BeginChangeCheck();

            state = EditorGUILayout.Foldout(state, label, true);

            if (EditorGUI.EndChangeCheck())
            {
                // The state is written directly to ref bool.
            }

            if (state && drawContent != null)
            {
                EditorGUI.indentLevel++;
                drawContent.Invoke();
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndVertical();
        }
        #endregion

        #region Create Section
        /// <summary>
        /// Creates Section
        /// </summary>
        /// <param name="label"> Label </param>
        /// <param name="content"> Content </param>
        public static void DrawSection(string label, System.Action content)
        {
            EditorGUILayout.BeginVertical("box");
            EditorGUILayout.LabelField(label, EditorStyles.boldLabel);
            content.Invoke();
            EditorGUILayout.EndVertical();
            EditorGUILayout.Space();
        }
        #endregion

        /// Shader GUI Extras

        #region Shader Toggled Header
        /// <summary>
        /// Toggle header 
        /// </summary>
        public static bool SHeader(string title, ref bool state, string propertyName, Material targetMat, GUIStyle style)
        {
            style.normal.background = MakeBackground(1, 1, BDColors.GrayP(18, 204));
            style.fontSize = 16;
            style.normal.textColor = BDColors.NexusOrange();

            EditorGUILayout.BeginVertical(style);
            state = EditorGUILayout.ToggleLeft(title, state, style);
            targetMat.SetInt(propertyName, state ? 1 : 0);
            EditorGUILayout.EndVertical();

            style.normal.background = MakeBackground(1, 1, BDColors.Transparent(0));

            return state;
        }
        #endregion

        #region Shader Foldout
        /// <summary>
        /// Creates a foldout section with a colored background.
        /// Stores the foldout state inside the given material property (int: 0/1).
        /// </summary>
        /// <param name="material">Target material</param>
        /// <param name="propName">Property name in shader (int 0/1)</param>
        /// <param name="label">Foldout label</param>
        /// <param name="bgColor">Background color</param>
        /// <param name="drawContent">Action that draws content inside if expanded</param>
        public static void SFoldout(Material targetMat, string propName, string label, Color bgColor, Action drawContent)
        {
            if (targetMat == null) return;

            bool state = targetMat.GetInt(propName) == 1;

            GUIStyle style = new GUIStyle(EditorStyles.helpBox);
            style.normal.background = MakeBackground(1, 1, bgColor);

            EditorGUILayout.BeginVertical(style);
            EditorGUI.BeginChangeCheck();

            state = EditorGUILayout.Foldout(state, label, true);

            if (EditorGUI.EndChangeCheck())
            {
                targetMat.SetInt(propName, Convert.ToInt16(state));
                EditorUtility.SetDirty(targetMat);
            }

            if (state && drawContent != null)
            {
                EditorGUI.indentLevel++;
                drawContent.Invoke();
                EditorGUI.indentLevel--;
            }

            EditorGUILayout.EndVertical();
        }
        #endregion

    }
}

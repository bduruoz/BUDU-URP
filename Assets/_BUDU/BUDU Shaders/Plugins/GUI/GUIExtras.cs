// © BUDU Games 2024 - 2026
// GUI Extras
using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace budu
{
    public static class GUIExtras
    {
        #region Title Bar Helpers
        // Shared indent so SBox/SFoldout/SToggleBox titles all start at the same X position (matches foldout arrow indent).
        const int TitleIndent = 14;

        static float TitleBarHeight(int titleFontSize)
        {
            return Mathf.Max(16f, titleFontSize + 8f);
        }
        #endregion // Title Bar Helpers

        #region Property Methods
        static MaterialProperty GetProperty(string propertyName, MaterialProperty[] properties)
        {
            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i] != null && properties[i].name == propertyName)
                    return properties[i];
            }

            throw new ArgumentException("Material property not found: " + propertyName);
        }

        public static bool GetBool(Material targetMat, string propertyName)
        {
            return targetMat != null && targetMat.GetInt(propertyName) == 1;
        }

        public static bool TryGetBool(Material targetMat, string propertyName, bool defaultValue = false)
        {
            if (targetMat == null || !targetMat.HasProperty(propertyName))
                return defaultValue;

            return targetMat.GetInt(propertyName) == 1;
        }

        public static void SetBool(Material targetMat, string propertyName, bool value)
        {
            if (targetMat == null || !targetMat.HasProperty(propertyName))
                return;

            targetMat.SetInt(propertyName, value ? 1 : 0);
        }
        #endregion

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

        #region SColoredVertical
        /// <summary>
        /// Creates a colored vertical box, runs the action delegate, and closes it.
        /// </summary>
        public static void SColoredVertical(Color bgcolor, float height = -1f, bool MiddleCenter = true, System.Action inside = null)
        {
            Rect rect;
            if (height > 0f)
                rect = EditorGUILayout.BeginVertical(GUILayout.Height(height), GUILayout.ExpandWidth(true));
            else
                rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));

            if (MiddleCenter) GUILayout.FlexibleSpace();

            if (Event.current.type == EventType.Repaint)
            {
                // Arka planı alpha destekli çiz
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgcolor, Color.clear);
                Handles.EndGUI();
            }

            inside?.Invoke();

            if (MiddleCenter) GUILayout.FlexibleSpace();
            EditorGUILayout.EndVertical();
        }

        #endregion // SColoredVertical

        #region About
        /// <summary>
        /// Draws the About logo and foldout at the bottom of the Shader.
        /// </summary>
        public static bool About(ref bool aboutFold, GUIStyle style)
        {
            EditorGUI.indentLevel--;
            string logoPath = "Assets/_BUDU/GUI/BUDUTools-About.png";
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
                    float currentInspectorWidth = EditorGUIUtility.currentViewWidth;// - 30;
                    float aspectRatio = (float)logo.height / (float)logo.width;
                    float dynamicHeight = currentInspectorWidth * aspectRatio;

                    Rect layoutRect = GUILayoutUtility.GetRect(currentInspectorWidth, dynamicHeight);

                    Rect rect = new Rect(0, layoutRect.y, currentInspectorWidth, dynamicHeight);

                    GUI.DrawTexture(rect, logo, ScaleMode.ScaleToFit, true);
                }
                GUILayout.FlexibleSpace();
                EditorGUILayout.EndHorizontal();
                EditorGUI.indentLevel++;
            }
            return aboutFold;
        }
        #endregion // About

        #region IsTextureEmpty
        public static bool IsTextureEmpty(MaterialProperty prop)
        {
            if (prop == null) return true;             // Property yoksa boş say
            if (prop.propertyType != UnityEngine.Rendering.ShaderPropertyType.Texture) return true;  // Texture değilse boş say

            Texture tex = prop.textureValue;
            return tex == null;                        // null
        }

        public static bool IsToggleAndTextureEnabled(MaterialProperty[] properties, string togglePropertyName, string texturePropertyName)
        {
            MaterialProperty textureProp = GetProperty(texturePropertyName, properties);
            if (IsTextureEmpty(textureProp)) return false;

            MaterialProperty toggleProp = GetProperty(togglePropertyName, properties);
            return toggleProp.floatValue > 0.0f;
        }
        #endregion // IsTextureEmpty

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
        #endregion // Toggle Header

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
        #endregion // Foldout

        #region Draw Section
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
        #endregion // Draw Section

        #region SHeader (Shader Toggled Header)
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
        #endregion // SHeader (Shader Toggled Header)

        #region SFoldout (Shader Foldout)
        /// <summary>
        /// Creates a foldout section with a colored background.
        /// Stores the foldout state inside the given material property (int: 0/1).
        /// </summary>
        public static void SFoldout(Material targetMat, string propName, string title, Color bgColor, int titleFontSize = 11, Color? titleTextColor = null,  Color? titleBarBgColor = null, bool solidBackground = true, Action drawContent = null)
        {
            if (targetMat == null) return;

            bool state = targetMat.GetInt(propName) == 1;

            GUIStyle foldoutStyle = new GUIStyle(EditorStyles.foldout);
            Color foldoutColor = titleTextColor ?? BDColors.NexusOrange();
            foldoutStyle.normal.textColor = foldoutColor;
            foldoutStyle.onNormal.textColor = foldoutColor;
            foldoutStyle.focused.textColor = foldoutColor;
            foldoutStyle.onFocused.textColor = foldoutColor;
            foldoutStyle.hover.textColor = foldoutColor;
            foldoutStyle.onHover.textColor = foldoutColor;
            foldoutStyle.fontSize = titleFontSize;
            foldoutStyle.fontStyle = FontStyle.Normal;
            foldoutStyle.padding = new RectOffset(TitleIndent, 6, 4, 4);

            Color titleBg = titleBarBgColor ?? new Color(bgColor.r * 0.75f, bgColor.g * 0.75f, bgColor.b * 0.75f, bgColor.a);

            Rect rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgColor, Color.clear);
                Handles.EndGUI();
            }
            EditorGUI.BeginChangeCheck();

            float titleBarHeight = TitleBarHeight(titleFontSize);
            Rect titleRect = EditorGUILayout.BeginVertical(GUILayout.Height(titleBarHeight), GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(titleRect, titleBg, Color.clear);
                Handles.EndGUI();
            }
            Rect foldoutRect = EditorGUILayout.GetControlRect(false, titleBarHeight, GUILayout.ExpandWidth(true));
            state = EditorGUI.Foldout(foldoutRect, state, title, true, foldoutStyle);
            EditorGUILayout.EndVertical();

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
            EditorGUILayout.Space(1);
            EditorGUILayout.EndVertical();
        }
        #endregion // SFoldout (Shader Foldout)

        #region SBox (Shader Content Box)
        /// <summary>
        /// Draws a non-foldout colored content box without title bar.
        /// </summary>
        public static void SBox(Color bgColor, Action drawContent = null)
        {
            Rect rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgColor, Color.clear);
                Handles.EndGUI();
            }

            drawContent?.Invoke();
            EditorGUILayout.EndVertical();
        }

        /// <summary>
        /// Draws a non-foldout colored content box with title.
        /// </summary>
        public static void SBox(string title, Color bgColor, int titleFontSize = 11, Color? titleTextColor = null, Color? titleBarBgColor = null, Action drawContent = null)
        {
            Color tBg = titleBarBgColor ?? new Color(bgColor.r * 0.75f, bgColor.g * 0.75f, bgColor.b * 0.75f, bgColor.a);
            Color tText = titleTextColor ?? BDColors.NexusOrange();

            GUIStyle titleStyle = new GUIStyle(EditorStyles.boldLabel);
            titleStyle.normal.textColor = tText;
            titleStyle.fontSize = titleFontSize;
            titleStyle.fontStyle = FontStyle.Normal;
            titleStyle.alignment = TextAnchor.MiddleLeft;
            titleStyle.padding = new RectOffset(TitleIndent, 6, 4, 4);

            Rect rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgColor, Color.clear);
                Handles.EndGUI();
            }

            float titleBarHeight = TitleBarHeight(titleFontSize);
            Rect titleRect = EditorGUILayout.BeginVertical(GUILayout.Height(titleBarHeight), GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(titleRect, tBg, Color.clear);
                Handles.EndGUI();
            }
            Rect labelRect = EditorGUILayout.GetControlRect(false, titleBarHeight, GUILayout.ExpandWidth(true));
            GUI.Label(labelRect, title, titleStyle);
            EditorGUILayout.EndVertical();

            drawContent?.Invoke();
            EditorGUILayout.EndVertical();
        }
        #endregion // SBox (Shader Content Box)

        #region SToggleBox (Shader Toggleable Box)
        /// <summary>
        /// Draws a toggleable shader box (non-foldout) and stores toggle state in material int property (0/1).
        /// Toggle is drawn like a regular property field (label left, toggle right).
        /// </summary>
        public static bool SToggleBox(string title, ref bool state, string propertyName, Material targetMat, Color bgColor, int titleFontSize = 11, Color? titleTextColor = null, Color? titleBarBgColor = null, Action drawContent = null)
        {
            if (targetMat == null) return false;

            Color tBg = titleBarBgColor ?? new Color(bgColor.r * 0.75f, bgColor.g * 0.75f, bgColor.b * 0.75f, bgColor.a);
            Color tText = titleTextColor ?? BDColors.NexusOrange();

            GUIStyle titleStyle = new GUIStyle(EditorStyles.boldLabel);
            titleStyle.normal.textColor = tText;
            titleStyle.fontSize = titleFontSize;
            titleStyle.fontStyle = FontStyle.Normal;
            titleStyle.alignment = TextAnchor.MiddleLeft;
            titleStyle.padding = new RectOffset(TitleIndent, 6, 4, 4);

            Rect rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgColor, Color.clear);
                Handles.EndGUI();
            }

            float titleBarHeight = TitleBarHeight(titleFontSize);
            Rect titleRect = EditorGUILayout.BeginVertical(GUILayout.Height(titleBarHeight), GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(titleRect, tBg, Color.clear);
                Handles.EndGUI();
            }

            Rect fullRect = EditorGUILayout.GetControlRect(false, titleBarHeight);
            int prevIndent = EditorGUI.indentLevel;
            EditorGUI.indentLevel = 0;
            Rect labelRect = new Rect(fullRect.x, fullRect.y, EditorGUIUtility.labelWidth, fullRect.height);
            Rect toggleRect = new Rect(fullRect.x + EditorGUIUtility.labelWidth + 2f, fullRect.y, 16f, fullRect.height);

            GUI.Label(labelRect, title, titleStyle);

            EditorGUI.BeginChangeCheck();
            bool newState = EditorGUI.Toggle(toggleRect, state);
            if (EditorGUI.EndChangeCheck())
            {
                state = newState;
                SetBool(targetMat, propertyName, state);
                EditorUtility.SetDirty(targetMat);
            }
            EditorGUI.indentLevel = prevIndent;

            EditorGUILayout.EndVertical();

            if (state)
            {
                drawContent?.Invoke();
            }

            EditorGUILayout.EndVertical();
            return state;
        }

        public static bool SToggleBox(MaterialEditor materialEditor, MaterialProperty[] properties, string title, string propertyName, Material targetMat, Color bgColor, int titleFontSize = 11, Color? titleTextColor = null, Color? titleBarBgColor = null, Action drawContent = null)
        {
            if (targetMat == null) return false;

            bool state = GetBool(targetMat, propertyName);

            Color tBg = titleBarBgColor ?? new Color(bgColor.r * 0.75f, bgColor.g * 0.75f, bgColor.b * 0.75f, bgColor.a);
            Color tText = titleTextColor ?? BDColors.NexusOrange();

            GUIStyle titleStyle = new GUIStyle(EditorStyles.boldLabel);
            titleStyle.normal.textColor = tText;
            titleStyle.fontSize = titleFontSize;
            titleStyle.fontStyle = FontStyle.Normal;
            titleStyle.alignment = TextAnchor.MiddleLeft;
            titleStyle.padding = new RectOffset(TitleIndent, 6, 4, 4);

            Rect rect = EditorGUILayout.BeginVertical(GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(rect, bgColor, Color.clear);
                Handles.EndGUI();
            }

            float titleBarHeight = TitleBarHeight(titleFontSize);
            Rect titleRect = EditorGUILayout.BeginVertical(GUILayout.Height(titleBarHeight), GUILayout.ExpandWidth(true));
            if (Event.current.type == EventType.Repaint)
            {
                Handles.BeginGUI();
                Handles.DrawSolidRectangleWithOutline(titleRect, tBg, Color.clear);
                Handles.EndGUI();
            }

            MaterialProperty toggleProp = GetProperty(propertyName, properties);

            Rect fullRect = EditorGUILayout.GetControlRect(false, titleBarHeight);
            int prevIndent = EditorGUI.indentLevel;
            EditorGUI.indentLevel = 0;
            Rect labelRect = new Rect(fullRect.x, fullRect.y, EditorGUIUtility.labelWidth, fullRect.height);
            Rect toggleRect = new Rect(fullRect.x + EditorGUIUtility.labelWidth + 2f, fullRect.y, 16f, fullRect.height);

            GUI.Label(labelRect, title, titleStyle);

            EditorGUI.showMixedValue = toggleProp.hasMixedValue;
            EditorGUI.BeginChangeCheck();
            bool newVal = EditorGUI.Toggle(toggleRect, toggleProp.floatValue > 0f);
            if (EditorGUI.EndChangeCheck())
            {
                toggleProp.floatValue = newVal ? 1f : 0f;
            }
            EditorGUI.showMixedValue = false;
            state = newVal;
            EditorGUI.indentLevel = prevIndent;

            EditorGUILayout.EndVertical();

            if (state)
            {
                drawContent?.Invoke();
            }

            EditorGUILayout.EndVertical();
            return state;
        }

        /// <summary>
        /// Overload: initializes state from material property and renders toggle box.
        /// </summary>
        public static bool SToggleBox(string title, string propertyName, Material targetMat, Color bgColor, int titleFontSize = 11, Color? titleTextColor = null, Color? titleBarBgColor = null, Action drawContent = null)
        {
            bool state = GetBool(targetMat, propertyName);
            return SToggleBox(title, ref state, propertyName, targetMat, bgColor, titleFontSize, titleTextColor, titleBarBgColor, drawContent);
        }
        #endregion // SToggleBox (Shader Toggleable Box)

        #region Base Module
        public static void BaseSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties)
        {
            MaterialProperty bc = GetProperty("_Base_Color", properties);
            MaterialProperty bch = GetProperty("_Checkerboard", properties);

            materialEditor.ShaderProperty(bc, "Base Color");
            materialEditor.ShaderProperty(bch, "Checkerboard");

            if (bch.floatValue > 0.0f)
            {
                MaterialProperty bcColA = GetProperty("_Checker_Color_A", properties);
                MaterialProperty bcColB = GetProperty("_Checker_Color_B", properties);
                MaterialProperty bcColF = GetProperty("_Checker_Frequency", properties);

                materialEditor.ShaderProperty(bcColA, "Checker Color A");
                materialEditor.ShaderProperty(bcColB, "Checker Color B");
                ShaderGUIHelpers.Vector2Property(materialEditor, bcColF, "Checker Frequency");
            }
            else
            {
                MaterialProperty bcMap = GetProperty("_Base_Map", properties);
                materialEditor.ShaderProperty(bcMap, "Base Map");
            }
        }
        #endregion // Base Module

        #region Two Color Module
        public static void TwoColorSettingsGUI(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat)
        {
            SFoldout(targetMat, "_TwoColorFold", "Two Color", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), true, () =>
            {
                MaterialProperty twoCol = GetProperty("_Two_Colors", properties);
                materialEditor.ShaderProperty(twoCol, "Two Color");
                if (twoCol.floatValue > 0f)
                {
                    MaterialProperty paintType = GetProperty("_PAINT_TYPE_SELECTOR", properties);
                    MaterialProperty secCol = GetProperty("_Second_Color", properties);

                    MaterialProperty cfi = GetProperty("_Color_Fresnel_Invert", properties);
                    MaterialProperty cfb = GetProperty("_Color_Fresnel_Bias", properties);
                    MaterialProperty cfs = GetProperty("_Color_Fresnel_Scale", properties);
                    MaterialProperty cfp = GetProperty("_Color_Fresnel_Power", properties);
                    MaterialProperty cfc = GetProperty("_Color_Fresnel_Contrast", properties);
                    MaterialProperty cfcp = GetProperty("_Color_Fresnel_Contrast_Pivot", properties);

                    MaterialProperty cgi = GetProperty("_Grad_Invert", properties);
                    MaterialProperty cgs = GetProperty("_Grad_Scale", properties);
                    MaterialProperty cgo = GetProperty("_Grad_Bias", properties);
                    MaterialProperty cfty = GetProperty("_Color_Fresnel_Gamma", properties);
                    MaterialProperty cgty = GetProperty("_Grad_Gamma", properties);
                    MaterialProperty cgc = GetProperty("_Grad_Contrast", properties);
                    MaterialProperty cgcp = GetProperty("_Grad_Contrast_Pivot", properties);

                    MaterialProperty cgrx = GetProperty("_Grad_Rotation_X", properties);
                    MaterialProperty cgry = GetProperty("_Grad_Rotation_Y", properties);
                    MaterialProperty cgrz = GetProperty("_Grad_Rotation_Z", properties);

                    materialEditor.ShaderProperty(paintType, "Paint Method");
                    materialEditor.ColorProperty(secCol, "Second Color");

                    switch ((int)paintType.floatValue)
                    {
                        #region Fresnel
                        case 0:
                            SBox("Fresnel", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                            {
                                materialEditor.ShaderProperty(cfi, "Invert");
                                materialEditor.ShaderProperty(cfty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cfc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cfcp, "Contrast Pivot");
                                materialEditor.ShaderProperty(cfb, "Bias");
                                materialEditor.ShaderProperty(cfs, "Scale");
                                materialEditor.ShaderProperty(cfp, "Power");
                            });
                            break;
                        #endregion
                        #region Gradient Y
                        case 1:
                            SBox("Gradient Y", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                            {
                                materialEditor.ShaderProperty(cgi, "Invert");
                                materialEditor.ShaderProperty(cgty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cgcp, "Contrast Pivot");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgs, "Scale", 0, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgo, "Bias", -1, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrx, "Rotate X", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgry, "Rotate Y", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrz, "Rotate Z", -360, 360);
                            });
                            break;
                        #endregion
                        #region Fresnel & Gradient Y
                        case 2:
                            SBox("Fresnel", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                            {
                                materialEditor.ShaderProperty(cfi, "Invert");
                                materialEditor.ShaderProperty(cfty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cfc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cfcp, "Contrast Pivot");
                                materialEditor.ShaderProperty(cfb, "Bias");
                                materialEditor.ShaderProperty(cfs, "Scale");
                                materialEditor.ShaderProperty(cfp, "Power");
                            });
                            SBox("Gradient Y", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                            {
                                materialEditor.ShaderProperty(cgi, "Invert");
                                materialEditor.ShaderProperty(cgty, "Gamma");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgc, "Contrast", 0, 5);
                                materialEditor.ShaderProperty(cgcp, "Contrast Pivot");
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgs, "Scale", 0, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgo, "Bias", -1, 1);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrx, "Rotate X", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgry, "Rotate Y", -360, 360);
                                ShaderGUIHelpers.FloatSliderFree(materialEditor, cgrz, "Rotate Z", -360, 360);
                            });
                            break;
                        #endregion
                    }
                }
            });
        }
        #endregion // Two Color Module

        #region Normal Module
        public static void NormalSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties)
        {
            MaterialProperty nrm = GetProperty("_Normal", properties);
            SColoredVertical(BDColors.NexusOrange(50), 20, true,() =>
            {
                materialEditor.ShaderProperty(nrm, "Normal Map");
            });

            if (nrm.floatValue <= 0.0f) return;

            MaterialProperty flnTxt = GetProperty("_Normal_Map", properties);
            MaterialProperty flNormStrength = GetProperty("_Normal_Strength", properties);
            MaterialProperty flNormMultiplier = GetProperty("_Normal_Multiplier", properties);

            materialEditor.ShaderProperty(flnTxt, "Normal Map");
            materialEditor.RangeProperty(flNormStrength, "Normal Strength");
            materialEditor.RangeProperty(flNormMultiplier, "Normal Multiplier");
        }
        #endregion // Normal Module

        #region Shading Module
        public static void ShadeColorSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat, bool nrmTog = false)
        {
            MaterialProperty shadTog = GetProperty("_Shading_Toggle", properties);
            SColoredVertical(BDColors.NexusOrange(50), 20, true, () =>
            {
                materialEditor.ShaderProperty(shadTog, "Shade Feature");
            });

            if (shadTog.floatValue <= 0.0f) return;

            MaterialProperty shCol = GetProperty("_Shade_Color", properties);
            MaterialProperty shInt = GetProperty("_Shading_Intensity", properties);
            MaterialProperty shGamma = GetProperty("_Shading_Gamma", properties);
            MaterialProperty shFrShading = GetProperty("_Front_Shading", properties);
            MaterialProperty shCont = GetProperty("_Shading_Contrast", properties);

            materialEditor.ShaderProperty(shCol, "Color");
            materialEditor.ShaderProperty(shInt, "Intensity");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, shCont, "Shading Contrast", 0f, 5f);
            ShaderGUIHelpers.FloatSliderFree(materialEditor, shGamma, "Gamma", 0.0f, 5f);
            materialEditor.ShaderProperty(shFrShading, "Front Shading");

            if (shFrShading.floatValue > 0f)
            {
                MaterialProperty frShGamma = GetProperty("_Front_Shading_Gamma", properties);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, frShGamma, "Front Gamma", 0.0f, 5f);
            }

            if (nrmTog)
            {
                SBox("Normal Settings", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                {
                    MaterialProperty shNrmStr = GetProperty("_Shading_Normal_Strength", properties);
                    MaterialProperty shNrmRCont = GetProperty("_Normal_Result_Contrast", properties);
                    MaterialProperty shNrmRContP = GetProperty("_Normal_Result_Contrast_Pivot", properties);
                    materialEditor.ShaderProperty(shNrmStr, "Normal Strength");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, shNrmRCont, "Normal Result Contrast", 0f, 5f);
                    materialEditor.ShaderProperty(shNrmRContP, "Normal Result Contrast Pivot");
                });
            }

            MaterialProperty shAffBaseTxt = GetProperty("_Shading_Affect_Base_Map", properties);
            SToggleBox("Affect Base Texture", "_Shading_Affect_Base_Map", targetMat, BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
            {
                if (shAffBaseTxt.floatValue > 0f)
                {
                    MaterialProperty bsMapInt = GetProperty("_Base_Map_Intensity", properties);
                    materialEditor.ShaderProperty(bsMapInt, "Base Map Intensity");
                }
            });
        }
        #endregion // Shade Module

        #region Specular Module
        public static void SpecularSettingsGUI(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, bool nrm = false)
        {
            MaterialProperty specTog = GetProperty("_Spec_Toggle", properties);

            SColoredVertical(BDColors.NexusOrange(50), 20, true, () =>
            {
                materialEditor.ShaderProperty(specTog, "Specular Feature");
            });

            if (specTog.floatValue <= 0.0f) return;

            MaterialProperty spcol = GetProperty("_Spec_Color", properties);
            MaterialProperty spInt = GetProperty("_Spec_Intensity", properties);
            MaterialProperty spTxt = GetProperty("_Spec_Map", properties);

            materialEditor.ShaderProperty(spcol, "Color");
            materialEditor.ShaderProperty(spTxt, "Specular Map");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, spInt, "Intensity", 0, 5);

            if (!IsTextureEmpty(spTxt))
            {
                MaterialProperty spInv = GetProperty("_Spec_Map_Invert", properties);
                materialEditor.ShaderProperty(spInv, "Map Invert");
            }
            MaterialProperty lgSmt = GetProperty("_Spec_Size", properties);
            MaterialProperty lgGam = GetProperty("_Spec_Gamma", properties);
            MaterialProperty spGls = GetProperty("_Spec_Glossy", properties);
            MaterialProperty spSmt = GetProperty("_Spec_Softness", properties);
            MaterialProperty spSat = GetProperty("_Spec_Saturation", properties);
            MaterialProperty spIn = GetProperty("_Spec_In", properties);
            MaterialProperty spOut = GetProperty("_Spec_Out", properties);

            SFoldout(targetMat, "_blinnFold", "Blinn Settings", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), true, () =>
            {
                ShaderGUIHelpers.FloatSliderFree(materialEditor, lgSmt, "Spec Spize", 0, 5);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, lgGam, "Gamma", 0, 5);
                materialEditor.ShaderProperty(spGls, "Glossy");
                materialEditor.ShaderProperty(spSat, "Saturation");
                ShaderGUIHelpers.FloatSliderFree(materialEditor, spSmt, "Softness", 0, 3);
                materialEditor.ShaderProperty(spIn, "In");
                materialEditor.ShaderProperty(spOut, "Out");
            });

            if (nrm)
            {
                SBox("Normal Settings", BDColors.Black(20), 11, BDColors.White(255), BDColors.DarkOrange(80), () =>
                {
                    MaterialProperty spNormStr = GetProperty("_Spec_Normal_Strength", properties);
                    MaterialProperty spNormMult = GetProperty("_Spec_Normal_Multiplier", properties);
                    materialEditor.ShaderProperty(spNormStr, "Normal Strength");
                    materialEditor.ShaderProperty(spNormMult, "Normal Multiplier");
                });
            }
        }
        #endregion // Specular Module

        #region Rim Module
        public static void RimSettingsGUI(MaterialEditor materialEditor, MaterialProperty[] properties, Material targetMat, bool nrm = false)
        {
            MaterialProperty rimTog = GetProperty("_Rim_Toggle", properties);
            SColoredVertical(BDColors.NexusOrange(50), 20, true, () =>
            {
                materialEditor.ShaderProperty(rimTog, "Rim Feature");
            });

            if (rimTog.floatValue <= 0f) return;

            MaterialProperty rinv = GetProperty("_Rim_Invert", properties);
            MaterialProperty rint = GetProperty("_Rim_Intensity", properties);
            MaterialProperty rcol = GetProperty("_Rim_Color", properties);
            MaterialProperty rcont = GetProperty("_Rim_Contrast", properties);
            MaterialProperty rcontp = GetProperty("_Rim_Contrast_Pivot", properties);
            MaterialProperty rgma = GetProperty("_Rim_Gamma", properties);
            MaterialProperty rb = GetProperty("_Rim_Bias", properties);
            MaterialProperty rs = GetProperty("_Rim_Power", properties);
            MaterialProperty rp = GetProperty("_Rim_Scale", properties);

            materialEditor.ShaderProperty(rinv, "Invert");
            materialEditor.ShaderProperty(rint, "Intensity");
            materialEditor.ShaderProperty(rcol, "Color");
            ShaderGUIHelpers.FloatSliderFree(materialEditor, rgma, "Gamma", 0, 5);
            ShaderGUIHelpers.FloatSliderFree(materialEditor, rcont, "Contrast", 0, 5);
            materialEditor.ShaderProperty(rcontp, "Contrast Pivot");
            materialEditor.ShaderProperty(rb, "Bias");
            materialEditor.ShaderProperty(rs, "Scale");
            materialEditor.ShaderProperty(rp, "Power");

            if (nrm)
            {
                SBox("Normal Settings", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                {
                    MaterialProperty rNormStr = GetProperty("_Rim_Normal_Strength", properties);
                    MaterialProperty rNormMult = GetProperty("_Rim_Normal_Multiplier", properties);
                    materialEditor.ShaderProperty(rNormStr, "Normal Strength");
                    materialEditor.ShaderProperty(rNormMult, "Normal Multiplier");
                });
            }

            MaterialProperty rAT = GetProperty("_Affect_Base_Texture", properties);
            SToggleBox("Affect Base Texture", "_Affect_Base_Texture", targetMat, BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
            {
                if (rAT.floatValue > 0.0f)
                {
                    MaterialProperty rTBlend = GetProperty("_Base_Texture_Blend_Mode", properties);
                    string[] blOpt = new string[] { "Multiply", "Add", "SoftLight" };
                    ShaderGUIHelpers.EnumPopupProperty(materialEditor, rTBlend, "Blend Mode", blOpt);

                    MaterialProperty rMapMult = GetProperty("_Map_Multiplier", properties);
                    materialEditor.ShaderProperty(rMapMult, "Map Multiplier");
                }
            });
        }
        #endregion // Rim Module

        #region Reflection Main Module

        #region Reflection Module
        public static void ReflectionSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat, bool normTog = false)
        {
            MaterialProperty refl = GetProperty("_Reflection_Toggle", properties);
            SColoredVertical(BDColors.NexusOrange(50), 20,true,() =>
            {
                materialEditor.ShaderProperty(refl, "Reflection Features");
            });

            if (refl.floatValue <= 0.0f) return;

            string[] reflectType = new string[] { "ProbeMap", "Cubemap"};
            MaterialProperty refType = GetProperty("_RefType", properties);
            ShaderGUIHelpers.EnumPopupProperty(materialEditor, refType, "Reflection Type", reflectType);

            MaterialProperty rfCol = GetProperty("_Reflection_Color", properties);
            MaterialProperty rfStr = GetProperty("_Reflection_Strength", properties);
            MaterialProperty rfMult = GetProperty("_Reflection_Multiplier", properties);
            MaterialProperty rfAffShd = GetProperty("_Reflection_Affect_Shade", properties);
            
            materialEditor.ShaderProperty(rfCol, "Color");
            materialEditor.ShaderProperty(rfStr, "Strength");
            materialEditor.ShaderProperty(rfMult, "Multiplier");

            if (normTog)
            {
                SBox("Normal Settings", BDColors.Black(10),10, BDColors.White(255), BDColors.DarkOrange(80), () =>
                {
                    MaterialProperty rfNrStr = GetProperty("_Ref_Normal_Strength", properties);
                    MaterialProperty rfNrMult = GetProperty("_Ref_Normal_Multiplier", properties);
                    materialEditor.ShaderProperty(rfNrStr, "Normal Strength");
                    materialEditor.ShaderProperty(rfNrMult, "Normal Multiplier");   
                });
            }

            SToggleBox(materialEditor, properties, "Affect Shade", "_Reflection_Affect_Shade", targetMat, BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
            {
                if (rfAffShd.floatValue > 0.0f)
                {
                    MaterialProperty rfShdInv = GetProperty("_Reflection_Shade_Invert", properties);
                    MaterialProperty rfShdStr = GetProperty("_Reflection_Shade_Strength", properties);
                    materialEditor.ShaderProperty(rfShdInv, "Shade Invert");
                    materialEditor.ShaderProperty(rfShdStr, "Shade Strength");
                }
            });

            switch((int)refType.floatValue)
            {
                case 0: // ProbeMap
                    ReflectionProbeSettingsGUI(materialEditor, properties, targetMat);
                    break;

                case 1: // Cubemap
                    ReflectionCubemapSettingsGUI(materialEditor, properties, targetMat);
                    break;
            }

            ReflectionFresnelSettingsGUI(materialEditor, properties, targetMat);
            ReflectionMaskSettingsGUI(materialEditor, properties, targetMat);
        }
        #endregion // Reflection Module

        #region Reflection Probe Module
        public static void ReflectionProbeSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat)
        {
            SBox("Reflection Probe Settings", BDColors.Black(10), 10, BDColors.White(255), BDColors.DarkOrange(80), () =>
            {
                MaterialProperty probeLOD = GetProperty("_RefProbeLOD", properties);
                materialEditor.ShaderProperty(probeLOD, "Reflection Probe LOD");
            });
        }
        #endregion // Reflection Probe Module

        #region Reflection Cubemap Module
        public static void ReflectionCubemapSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat)
        {

            SFoldout(targetMat,"_CubemapFold","Cubemap Controls",BDColors.Black(10),10,BDColors.White(255), BDColors.DarkOrange(80),true,() =>
            { 
                string[] cubeMapType = new string[] { "Real Cubemap", "Unreal Cubemap" };
                MaterialProperty cmType = GetProperty("_CmType", properties);
                ShaderGUIHelpers.EnumPopupProperty(materialEditor, cmType, "Cubemap Type", cubeMapType);

                MaterialProperty rfCbMp = GetProperty("_Reflection_Cubemap", properties);
                MaterialProperty rfMapLOD = GetProperty("_CmMapLOD", properties);
                MaterialProperty cmrx = GetProperty("_Cubemap_Rotate_X", properties);
                MaterialProperty cmry = GetProperty("_Cubemap_Rotate_Y", properties);
                MaterialProperty cmrz = GetProperty("_Cubemap_Rotate_Z", properties);
                MaterialProperty cmsx = GetProperty("_Cubemap_Stretch_X", properties);
                MaterialProperty cmsy = GetProperty("_Cubemap_Stretch_Y", properties);
                MaterialProperty cmsz = GetProperty("_Cubemap_Stretch_Z", properties);
                MaterialProperty cmx = GetProperty("_Cubemap_Pos_X", properties);
                MaterialProperty cmy = GetProperty("_Cubemap_Pos_Y", properties);
                MaterialProperty cmz = GetProperty("_Cubemap_Pos_Z", properties);

                materialEditor.ShaderProperty(rfCbMp, "Cubemap");
                materialEditor.ShaderProperty(rfMapLOD, "LOD");
                EditorGUIHelper.Separator();
                materialEditor.ShaderProperty(cmrx, "Rotate X");
                materialEditor.ShaderProperty(cmry, "Rotate Y");
                materialEditor.ShaderProperty(cmrz, "Rotate Z");
                EditorGUIHelper.Separator();
                materialEditor.ShaderProperty(cmsx, "Stretch X");
                materialEditor.ShaderProperty(cmsy, "Stretch Y");
                materialEditor.ShaderProperty(cmsz, "Stretch Z");
                EditorGUIHelper.Separator();

                ShaderGUIHelpers.FloatSliderFree(materialEditor, cmx, "Position X", -1f, 1f);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cmy, "Position Y", -1f, 1f);
                ShaderGUIHelpers.FloatSliderFree(materialEditor, cmz, "Position Z", -1f, 1f);
            });
        }
        #endregion // Reflection Cubemap Module

        #region Reflection Fresnel Module
        public static void ReflectionFresnelSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat)
        {

            SFoldout(targetMat, "_FresnelFold","Fresnel Controls", BDColors.Black(10),10, BDColors.White(255), BDColors.DarkOrange(80),true,() =>
            {
                MaterialProperty refFresTog = GetProperty("_Ref_Fresnel_Toggle", properties);
                MaterialProperty refFresInv = GetProperty("_Ref_Fresnel_Invert", properties);
                MaterialProperty refFresGam = GetProperty("_Ref_Fresnel_Gamma", properties);
                MaterialProperty refFresCont = GetProperty("_Ref_Fresnel_Contrast", properties);
                MaterialProperty refFresContP = GetProperty("_Ref_Fresnel_Contrast_Pivot", properties);
                MaterialProperty refFresBias = GetProperty("_Ref_Fresnel_Bias", properties);
                MaterialProperty refFresScale = GetProperty("_Ref_Fresnel_Scale", properties);
                MaterialProperty refFresPower = GetProperty("_Ref_Fresnel_Power", properties);

                materialEditor.ShaderProperty(refFresTog, "Fresnel");
                if (refFresTog.floatValue > 0f)
                {
                    materialEditor.ShaderProperty(refFresInv, "Invert");
                    materialEditor.ShaderProperty(refFresGam, "Gamma");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, refFresCont, "Contrast", 0f, 5f);
                    materialEditor.ShaderProperty(refFresContP, "Contrast Pivot");
                    materialEditor.ShaderProperty(refFresBias, "Bias");
                    materialEditor.ShaderProperty(refFresScale, "Scale");
                    materialEditor.ShaderProperty(refFresPower, "Power");
                }
            });
        }
        #endregion // Reflection Fresnel Module

        #region Reflection Mask Module
        public static void ReflectionMaskSettingsGUI(
            MaterialEditor materialEditor,
            MaterialProperty[] properties,
            Material targetMat)
        { 
            SFoldout(targetMat, "_RefMaskFold", "Reflection Mask", BDColors.Black(10), 10,BDColors.White(255),BDColors.DarkOrange(80),true, () =>
            {
                MaterialProperty refMaskTog = GetProperty("_Ref_Mask", properties);
                MaterialProperty refMaskInv = GetProperty("_Ref_Mask_Invert", properties);
                MaterialProperty refMaskTex = GetProperty("_Ref_Mask_Map", properties);
                MaterialProperty refMaskGamma = GetProperty("_Ref_Mask_Gamma", properties);
                MaterialProperty refMaskCont = GetProperty("_Ref_Mask_Contrast", properties);

                materialEditor.ShaderProperty(refMaskTog, "Enable Mask");
                if (refMaskTog.floatValue > 0f)
                {
                    materialEditor.ShaderProperty(refMaskTex, "Mask Texture");
                    materialEditor.ShaderProperty(refMaskInv, "Invert");
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, refMaskGamma, "Gamma", 0.1f, 5f);
                    ShaderGUIHelpers.FloatSliderFree(materialEditor, refMaskCont, "Contrast", 0f, 5f);
                }
            });
        }
        #endregion // Reflection Mask Module
        
        #endregion // Reflection Main Module

    }
}

// © BUDU Games 2024 - 2026
// Editor GUI Helper

using UnityEngine;
using UnityEditor;

public static class EditorGUIHelper
{
    #region Int Slider Steps
    /// <summary>
    /// Custom step-step slider
    /// </summary>
    public static int StepSlider(string label, int value, int[] allowedValues)
    {
        // Slider çizimi (min-max aralığı first-last)
        float sliderVal = EditorGUILayout.Slider(label, value, allowedValues[0], allowedValues[allowedValues.Length - 1]);

        // En yakın allowedValue’a yuvarla
        int closest = allowedValues[0];
        int minDiff = Mathf.Abs((int)sliderVal - closest);
        for (int i = 1; i < allowedValues.Length; i++)
        {
            int diff = Mathf.Abs((int)sliderVal - allowedValues[i]);
            if (diff < minDiff)
            {
                minDiff = diff;
                closest = allowedValues[i];
            }
        }

        return closest;
    }
    #endregion

    #region Vector2 Field
    /// <summary>
    /// Vector2 alanı çizer.
    /// </summary>
    public static Vector2 Vector2Field(string label, Vector2 value)
    {
        EditorGUI.BeginChangeCheck();
        Vector2 newValue = EditorGUILayout.Vector2Field(label, value);
        if (EditorGUI.EndChangeCheck())
        {
            // Undo/Redo gibi işlemler için
            Undo.RecordObject(EditorWindow.focusedWindow, "Vector2 Change");
            value = newValue;
            EditorWindow.focusedWindow.Repaint();
        }
        return value;
    }
    #endregion

    #region Vector3 Field
    /// <summary>
    /// Vector3 alanı çizer.
    /// </summary>
    public static Vector3 Vector3Field(string label, Vector3 value)
    {
        EditorGUI.BeginChangeCheck();
        Vector3 newValue = EditorGUILayout.Vector3Field(label, value);
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(EditorWindow.focusedWindow, "Vector3 Change");
            value = newValue;
            EditorWindow.focusedWindow.Repaint();
        }
        return value;
    }
    #endregion

    #region Vector4 Field
    /// <summary>
    /// Vector4 alanı çizer.
    /// </summary>
    public static Vector4 Vector4Field(string label, Vector4 value)
    {
        EditorGUI.BeginChangeCheck();
        Vector4 newValue = EditorGUILayout.Vector4Field(label, value);
        if (EditorGUI.EndChangeCheck())
        {
            Undo.RecordObject(EditorWindow.focusedWindow, "Vector4 Change");
            value = newValue;
            EditorWindow.focusedWindow.Repaint();
        }
        return value;
    }
    #endregion

    #region Separator
    /// <summary>
    /// Draws a horizontal separator line.
    /// </summary>
    public static void Separator(float thickness = 1, float padding = 4, Color? color = null)
    {
        GUILayout.Space(padding);

        Rect rect = EditorGUILayout.GetControlRect(false, thickness);
        rect.height = thickness;

        // Eğer color null ise default gri kullan
        Color lineColor = color ?? new Color(0.3f, 0.3f, 0.3f, 1f);
        EditorGUI.DrawRect(rect, lineColor);

        GUILayout.Space(padding);
    }
    #endregion

    #region Line Header
    /// <summary>
    /// Draws a horizontal separator with a centered label (header).
    /// </summary>
    public static void LineHeader(
        string label,
        Color lineColor,
        Color fontColor,
        int fontSize = 12,
        float thickness = 1,
        float padding = 6)
    {
        GUILayout.Space(padding);

        Rect rect = EditorGUILayout.GetControlRect(false, EditorGUIUtility.singleLineHeight);
        rect.height = EditorGUIUtility.singleLineHeight;

        // Label stili
        GUIStyle style = new GUIStyle(EditorStyles.boldLabel);
        style.normal.textColor = fontColor;
        style.fontSize = fontSize;
        style.alignment = TextAnchor.MiddleCenter;

        Vector2 labelSize = style.CalcSize(new GUIContent(label));
        float lineY = rect.y + rect.height / 2f;

        // Sol çizgi
        float leftWidth = (rect.width - labelSize.x) / 2f - 4;
        if (leftWidth > 0)
        {
            Rect leftRect = new Rect(rect.x, lineY, leftWidth, thickness);
            EditorGUI.DrawRect(leftRect, lineColor);
        }

        // Label
        Rect labelRect = new Rect(
            rect.x + leftWidth + 4,
            rect.y,
            labelSize.x,
            rect.height
        );
        GUI.Label(labelRect, label, style);

        // Sağ çizgi
        float rightX = labelRect.xMax + 4;
        float rightWidth = rect.xMax - rightX;
        if (rightWidth > 0)
        {
            Rect rightRect = new Rect(rightX, lineY, rightWidth, thickness);
            EditorGUI.DrawRect(rightRect, lineColor);
        }

        GUILayout.Space(padding);
    }
    #endregion


    #region Custom Colored Foldout
    /// <summary>
    /// Custom foldout with colored text and optional background
    /// </summary>
    public static bool ColoredFoldout(ref bool foldout, string title, Color textColor, Color? backgroundColor = null)
    {
        Rect rect = EditorGUILayout.GetControlRect(false, 20);

        // Background çizimi (opsiyonel)
        if (backgroundColor.HasValue)
        {
            EditorGUI.DrawRect(rect, backgroundColor.Value);
        }

        // Foldout toggle
        foldout = EditorGUI.Foldout(rect, foldout, "", true); // toggle only, text boş

        // Text çizimi
        GUIStyle style = new GUIStyle(EditorStyles.label);
        style.normal.textColor = textColor;
        style.alignment = TextAnchor.MiddleLeft;

        Rect textRect = new Rect(rect.x + 15, rect.y, rect.width - 15, rect.height); // toggle offset
        EditorGUI.LabelField(textRect, title, style);

        return foldout;
    }
    #endregion

    #region CUstom Min Max Slider
    /// <summary>
    /// Custom Min-Max Slider with fields on top
    /// </summary>
    public static void MinMaxSliderWithFields(string label, ref float minValue, ref float maxValue, float minLimit, float maxLimit)
    {
        EditorGUILayout.BeginVertical();

        // --- Fields (top row) ---
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField(label);//, GUILayout.Width(50));
        float tempMin = EditorGUILayout.FloatField(minValue, GUILayout.MaxWidth(100));
        float tempMax = EditorGUILayout.FloatField(maxValue, GUILayout.MaxWidth(100));
        EditorGUILayout.EndHorizontal();

        // Clamp field values immediately
        tempMin = Mathf.Clamp(tempMin, minLimit, tempMax);
        tempMax = Mathf.Clamp(tempMax, tempMin, maxLimit);

        // --- Slider (bottom row) ---
        EditorGUILayout.MinMaxSlider(ref tempMin, ref tempMax, minLimit, maxLimit);

        // Apply back to original references
        minValue = tempMin;
        maxValue = tempMax;

        EditorGUILayout.EndVertical();
    }
    #endregion
}
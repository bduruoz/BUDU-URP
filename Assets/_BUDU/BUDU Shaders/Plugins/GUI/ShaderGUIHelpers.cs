// © BUDU Tools 2024 - 2026
// Shader GUI Helper

using UnityEditor;
using UnityEngine;

namespace budu
{
    public static class ShaderGUIHelpers
    {
        #region Int Slider
        /// <summary>
        /// Displays the shader property held as a float as an integer slider in the Inspector.
        /// </summary>
        /// <param name="materialEditor">Reference to the MaterialEditor.</param>
        /// <param name="prop">Float MaterialProperty</param>
        /// <param name="label">Inspector label</param>
        /// <param name="min">Slider Min value</param>
        /// <param name="max">Slider Max value</param>
        public static void IntSlider(MaterialEditor materialEditor, MaterialProperty prop, string label, int min, int max)
        {
            if (prop == null) return;

            float currentValue = prop.floatValue;
            EditorGUI.BeginChangeCheck();

            int newValue = EditorGUILayout.IntSlider(label, Mathf.RoundToInt(currentValue), min, max);

            if (EditorGUI.EndChangeCheck())
            {
                prop.floatValue = (float)newValue;

                foreach (var obj in prop.targets)
                {
                    EditorUtility.SetDirty(obj);
                }
            }
        }
        #endregion

        #region Vector2 Property
        /// <summary>
        /// Displays the shader property held as a Vector4 as a Vector2 field in the Inspector,
        /// showing only the X and Y components. Z and W components are preserved.
        /// Supports multi-edit and undo/redo functionality.
        /// </summary>
        /// <param name="materialEditor">Reference to the MaterialEditor.</param>
        /// <param name="prop">The MaterialProperty storing the Vector4 value.</param>
        /// <param name="label">The label displayed in the Inspector.</param>
        public static void Vector2Property(MaterialEditor materialEditor, MaterialProperty prop, string label)
        {
            if (prop == null) return;

            Vector4 vec = prop.vectorValue;
            EditorGUI.BeginChangeCheck();

            Vector2 newVec2 = EditorGUILayout.Vector2Field(label, new Vector2(vec.x, vec.y));

            if (EditorGUI.EndChangeCheck())
            {
                prop.vectorValue = new Vector4(newVec2.x, newVec2.y, vec.z, vec.w);

                foreach (var obj in prop.targets)
                {
                    EditorUtility.SetDirty(obj);
                }
            }
        }
        #endregion

        #region Vector3 Property
        /// <summary>
        /// Displays the shader property held as a Vector4 as a Vector3 field in the Inspector,
        /// showing only the X, Y, and Z components. W component is preserved.
        /// Supports multi-edit and undo/redo functionality.
        /// </summary>
        /// <param name="materialEditor">Reference to the MaterialEditor.</param>
        /// <param name="prop">The MaterialProperty storing the Vector4 value.</param>
        /// <param name="label">The label displayed in the Inspector.</param>
        public static void Vector3Property(MaterialEditor materialEditor, MaterialProperty prop, string label)
        {
            if (prop == null) return;

            Vector4 vec = prop.vectorValue;
            EditorGUI.BeginChangeCheck();

            Vector3 newVec3 = EditorGUILayout.Vector3Field(label, new Vector3(vec.x, vec.y, vec.z));

            if (EditorGUI.EndChangeCheck())
            {
                prop.vectorValue = new Vector4(newVec3.x, newVec3.y, newVec3.z, vec.w);

                foreach (var obj in prop.targets)
                {
                    EditorUtility.SetDirty(obj);
                }
            }
        }
        #endregion

        #region Vector4Property
        /// <summary>
        /// Displays the shader property held as a Vector4 as a Vector4 field in the Inspector,
        /// showing the X, Y, Z, and W components.
        /// Supports multi-edit and undo/redo functionality.
        /// </summary>
        /// <param name="materialEditor">Reference to the MaterialEditor.</param>
        /// <param name="prop">The MaterialProperty storing the Vector4 value.</param>
        /// <param name="label">The label displayed in the Inspector.</param>
        public static void Vector4Property(MaterialEditor materialEditor, MaterialProperty prop, string label)
        {
            if (prop == null) return;

            Vector4 vec = prop.vectorValue;
            EditorGUI.BeginChangeCheck();

            // Vector4Field çiz
            Vector4 newVec4 = EditorGUILayout.Vector4Field(label, vec);

            if (EditorGUI.EndChangeCheck())
            {
                prop.vectorValue = newVec4;

                // Undo/Redo ve multi-edit desteği
                foreach (var obj in prop.targets)
                {
                    EditorUtility.SetDirty(obj);
                }
            }
        }
        #endregion

        #region Enum Popup Property
        /// <summary>
        /// Displays a MaterialProperty as a dropdown list in the Inspector.
        /// The options are provided as a string array.
        /// Supports integer-based enum selection.
        /// </summary>
        /// <param name="materialEditor">MaterialEditor reference</param>
        /// <param name="prop">Float/Int MaterialProperty</param>
        /// <param name="label">Label in the Inspector</param>
        /// <param name="options">String array of options</param>
        public static void EnumPopupProperty(MaterialEditor materialEditor, MaterialProperty prop, string label, string[] options)
        {
            if (prop == null || options == null || options.Length == 0)
                return;

            int selectedIndex = Mathf.RoundToInt(prop.floatValue);
            selectedIndex = Mathf.Clamp(selectedIndex, 0, options.Length - 1);

            EditorGUI.BeginChangeCheck();
            int newIndex = EditorGUILayout.Popup(label, selectedIndex, options);
            if (EditorGUI.EndChangeCheck())
            {
                prop.floatValue = newIndex;

                foreach (var obj in prop.targets)
                    EditorUtility.SetDirty(obj);
            }
        }
        #endregion

        #region Int Slider Steps
        /// <summary>
        /// Slider gibi görünür, ama sadece belirli değerlerde durur.
        /// </summary>
        public static void IntSliderStep(
            MaterialEditor materialEditor,
            MaterialProperty prop,
            string label)
        {
            // İzin verilen değerler
            int[] allowedValues = new int[] { 32, 64, 128, 256, 512, 1024, 2048 };

            // Mevcut değeri al
            int currentValue = (int)prop.floatValue;

            // Slider çizimi (min-max aralığı first-last)
            float sliderVal = EditorGUILayout.Slider(label, currentValue, allowedValues[0], allowedValues[allowedValues.Length - 1]);

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

            // Property güncelle
            prop.floatValue = closest;
        }
        #endregion

        #region Float Slider With Free Input
        /// <summary>
        /// Displays a float slider with a numeric field that allows manual override.
        /// Single field: left side is slider, right side is numeric text field.
        /// </summary>
        /// <param name="materialEditor">Reference to the MaterialEditor.</param>
        /// <param name="prop">Float MaterialProperty</param>
        /// <param name="label">Inspector label</param>
        /// <param name="min">Slider Min value</param>
        /// <param name="max">Slider Max value</param>
        public static void FloatSliderFree(MaterialEditor materialEditor, MaterialProperty prop, string label, float min, float max, float fieldWidth = 50f)
        {
            if (prop == null) return;

            int indent = EditorGUI.indentLevel;
            float indentOffset = indent * 15f;
            fieldWidth += indentOffset;
            EditorGUI.BeginChangeCheck();

            Rect rect = EditorGUILayout.GetControlRect();
            Rect RRect = EditorGUI.PrefixLabel(rect, new GUIContent(label));

            float sliderWidth = (RRect.width - fieldWidth + indentOffset) - 5f;

            Rect sliderRect = new Rect(RRect.x, RRect.y, sliderWidth, RRect.height);
            Rect fieldRect = new Rect(RRect.x + sliderWidth - indentOffset + 5f, RRect.y, fieldWidth, RRect.height);

            float value = prop.floatValue;

            value = GUI.HorizontalSlider(sliderRect, value, min, max);
            value = EditorGUI.FloatField(fieldRect, value);

            if (EditorGUI.EndChangeCheck())
            {
                prop.floatValue = value;
                foreach (var obj in prop.targets)
                    EditorUtility.SetDirty(obj);
            }
        }
        #endregion

        ///////

        #region Surface Control
        public static void SurfaceControls(Material targetMat, int surfType, bool AlphaClip, int AlpToMask, ref int tmpQ)
        {
            int tempRendQ = 0;
            targetMat.SetInt("_AlphaToMask", AlpToMask);

            if (targetMat.renderQueue >= 3000)
            {
                tempRendQ = targetMat.renderQueue - 3000;
            }

            switch (surfType)
            {
                #region Opaque
                case 0:
                    targetMat.SetOverrideTag("QUEUE", "Geometry");
                    targetMat.SetOverrideTag("RenderType", "Opaque");
                    targetMat.renderQueue = (int)(UnityEngine.Rendering.RenderQueue.Geometry);

                    targetMat.DisableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                    targetMat.SetShaderPassEnabled("DepthOnly", true);

                    targetMat.SetInt("_Zwrite", 1);
                    break;
                #endregion
                #region Transparent
                case 1:
                    targetMat.SetOverrideTag("QUEUE", "Transparent");
                    if (AlphaClip)
                    {
                        targetMat.SetOverrideTag("RenderType", "TransparentCutOut");
                    }
                    else
                    {
                        targetMat.SetOverrideTag("RenderType", "Transparent");
                    }
                    if(tempRendQ > 0)
                    {
                        targetMat.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent + tempRendQ;
                    }

                    targetMat.EnableKeyword(keyword: "_SURFACE_TYPE_TRANSPARENT");
                    targetMat.SetShaderPassEnabled("DepthOnly", false);

                    targetMat.SetInt("_Zwrite", 0);
                    break;
                    #endregion
            }
            tmpQ = tempRendQ;
        }
        #endregion

        #region Workflow Control
        public static void WorkflowControl(Material targetMat, ref int isSpecular)
        {
            isSpecular = targetMat.GetInt("_WorkflowMode");
            switch (isSpecular)
            {
                case 0:
                    targetMat.DisableKeyword("_SPECULAR_SETUP");
                    break;
                case 1:
                    targetMat.EnableKeyword("_SPECULAR_SETUP");
                    break;
            }
        }
        #endregion
    }
}



/* Informations
        targetMat.SetInt("_AlphaToMask", 1);
        //targetMat.SetInt("_AlhaClip", 1);

        targetMat.EnableKeyword("_ALPHATEST_ON");
        targetMat.EnableKeyword("_ALPHAPREMULTIPLY_ON");
        targetMat.EnableKeyword("_ALPHAMODULATE_ON");
        targetMat.EnableKeyword("_MASKMAP");
        
*/
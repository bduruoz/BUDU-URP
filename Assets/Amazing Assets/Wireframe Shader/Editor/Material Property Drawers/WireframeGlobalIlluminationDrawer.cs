// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    public class WireframeGlobalIlluminationDrawer : WireframeMaterialBasePropertyDrawer
    {
        static string keywordName = "_EMISSION";

        public override void OnGUI(Rect position, MaterialProperty prop, string label, MaterialEditor editor)
        {
            Init(editor);

            float value = prop.floatValue;

            EditorGUI.BeginChangeCheck();
            if (editor.EmissionEnabledProperty())
            {
                value = EditorGUILayout.FloatField("Meta Pass Multiplier", value);


            }

            bool shouldEmissionBeEnabled = (targetMaterial.globalIlluminationFlags & MaterialGlobalIlluminationFlags.EmissiveIsBlack) == 0;

            if (EditorGUI.EndChangeCheck())
            {
                Undo.RecordObject(targetMaterial, "Change" + label);

                prop.floatValue = value < 0 ? 0 : value;


                if (shouldEmissionBeEnabled)
                    targetMaterial.EnableKeyword(keywordName);
                else
                    targetMaterial.DisableKeyword(keywordName);
            }
        }


        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return 0;
        }
    }
}
// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    public class WireframeTitleDrawer : MaterialPropertyDrawer
    {
        public override void OnGUI(Rect position, MaterialProperty prop, string label, MaterialEditor editor)
        {
            position.xMin += 1;
            position.yMin += 5;
            position.height = 18;

            using (new EditorGUIHelper.GUIBackgroundColor(UnityEditor.EditorGUIUtility.isProSkin ? Color.grey * 0.9f : Color.grey))
            {
                GUI.Box(position, string.Empty);
                GUI.Label(position, label, EditorResources.GUIStyleBoldLabelMiddleCenterWhite);
            }
        }


        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return 22;
        }
    }
}
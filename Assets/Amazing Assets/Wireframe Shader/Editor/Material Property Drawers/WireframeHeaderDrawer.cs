// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEditor;
using UnityEngine;


namespace AmazingAssets.WireframeShader.Editor
{
    public class WireframeHeaderDrawer : MaterialPropertyDrawer
    {
        public override void OnGUI(Rect position, MaterialProperty prop, string label, MaterialEditor editor)
        {
            position.y += 4;

            GUI.Label(position, label, EditorStyles.boldLabel);

            GUI.Box(new Rect(position.xMin, position.yMax - 4, position.width, 1), string.Empty);
        }


        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return 26;
        }
    }
}
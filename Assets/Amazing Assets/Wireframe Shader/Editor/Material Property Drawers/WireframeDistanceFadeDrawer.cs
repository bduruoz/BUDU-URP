// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    public class WireframeDistanceFadeDrawer : WireframeMaterialPropertyDrawer
    {
        public WireframeDistanceFadeDrawer() : base(new string[] { "", "WIREFRAME_DISTANCE_FADE_ON" },
                                                    new string[] { "Off", "On" })
        {

        }

        public override void OnGUI(Rect position, MaterialProperty prop, string label, MaterialEditor editor)
        {
            int keywordID = DrawBaseGUI(position, "Distance Fade", editor);
            if (keywordID == 0)
                return;



            #region Load
            MaterialProperty _Wireframe_DistanceFadeStart = null;
            MaterialProperty _Wireframe_DistanceFadeEnd = null;

            LoadParameters(ref _Wireframe_DistanceFadeStart, "_Wireframe_DistanceFadeStart");
            LoadParameters(ref _Wireframe_DistanceFadeEnd, "_Wireframe_DistanceFadeEnd");
            #endregion


            #region Draw
            using (new EditorGUIHelper.EditorGUIIndentLevel(1))
            {
                editor.FloatProperty(_Wireframe_DistanceFadeStart, "Start");
                editor.FloatProperty(_Wireframe_DistanceFadeEnd, "End");
            }
            #endregion
        }


        public override float GetPropertyHeight(MaterialProperty prop, string label, MaterialEditor editor)
        {
            return 18;
        }
    }
}
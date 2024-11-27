// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.WireframeShader.Examples
{
    public class MaterialTryQuad : MonoBehaviour
    {
        public Material wireframeMaterial;

        public void OnUIToggleTryQuad(bool value)
        {
            if (wireframeMaterial != null)
            {
                if (value)
                    wireframeMaterial.EnableKeyword("WIREFRAME_TRY_QUAD_ON");
                else
                    wireframeMaterial.DisableKeyword("WIREFRAME_TRY_QUAD_ON");
            }
        }
    }
}

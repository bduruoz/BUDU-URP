// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.Linq;
using System.Collections.Generic;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    public class WireframeMaterialBasePropertyDrawer : MaterialPropertyDrawer
    {
        public Material targetMaterial;

        public void Init(MaterialEditor editor)
        {
            targetMaterial = editor.target as Material;
        }

        public void ModifyKeyWords(string[] _keywords, string _newKeyword)
        {
            List<string> newKeywords = targetMaterial.shaderKeywords.ToList();

            newKeywords = newKeywords.Except(_keywords).ToList();

            if (string.IsNullOrEmpty(_newKeyword.Trim()) == false)
                newKeywords.Add(_newKeyword);

            targetMaterial.shaderKeywords = newKeywords.ToArray();
        }

        public void LoadParameters(ref MaterialProperty _prop, string _name)
        {
            Material[] mats = new Material[] { targetMaterial };

            _prop = MaterialEditor.GetMaterialProperty(mats, _name);
        }
    }
}
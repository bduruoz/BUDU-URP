// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.TextureCreator
{
    internal class GeneratedAssetsImporter
    {       
        static public void ReimportTextures(string[] assetsPath, int size)
        {
            AssetDatabase.Refresh();

            if (assetsPath == null || assetsPath.Length == 0)
                return;


            for (int i = 0; i < assetsPath.Length; i++)
            {
                TextureImporter textureImporter = (TextureImporter)AssetImporter.GetAtPath(assetsPath[i]);
                if (textureImporter != null)
                {
                    textureImporter.textureType = TextureImporterType.Default;
                    textureImporter.textureShape = TextureImporterShape.Texture2D;

                    textureImporter.maxTextureSize = size;

                    textureImporter.SaveAndReimport();
                }
            }
        }
    }
}

// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.MeshCreator
{
    [CustomEditor(typeof(WireframeShader.WireframeShaderPrefab))]
    public class WireframeMeshConversionDetailsEditor : UnityEditor.Editor
    {
        public override void OnInspectorGUI()
        {
            using (new EditorGUIHelper.GUIEnabled(false))
            {
                EditorGUILayout.HelpBox("Script is not used in Runtime, only inside Editor for prefab management.", MessageType.Info);
            }
        }

        static public int FindPrefabReferencesInScene(GameObject prefab)
        {
            int counter = 0;

            GameObject[] sceneRootGameObjects = UnityEngine.SceneManagement.SceneManager.GetActiveScene().GetRootGameObjects();

            for (int i = 0; i < sceneRootGameObjects.Length; i++)
            {
                WireframeShader.WireframeShaderPrefab[] conversionDetails = sceneRootGameObjects[i].GetComponentsInChildren<WireframeShader.WireframeShaderPrefab>(true);

                string prefabProjectPath = AssetDatabase.GetAssetPath(prefab);


                for (int j = 0; j < conversionDetails.Length; j++)
                {
                    if (conversionDetails[j] != null &&
                        conversionDetails[j].prefabProjectPath == prefabProjectPath)
                    {
                        counter += 1;

                        PrefabUtility.RevertPrefabInstance(conversionDetails[j].gameObject, InteractionMode.AutomatedAction);
                    }

                }
            }

            return counter;
        }
    }
} 
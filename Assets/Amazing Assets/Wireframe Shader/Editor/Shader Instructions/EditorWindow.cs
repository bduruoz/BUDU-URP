// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.IO;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor.ShaderInstructions
{
    internal class EditorWindow : UnityEditor.EditorWindow
    {
        public enum ShaderFileType
        {
            cginc,
            UnityShaderGraphCore, UnityShaderGraphMaskPlane, UnityShaderGraphMaskSphere, UnityShaderGraphMaskBox, UnityShaderGraphDistanceFade,
            AmplifyShaderEditorCore, AmplifyShaderEditorMaskPlane, AmplifyShaderEditorMaskSphere, AmplifyShaderEditorMaskBox, AmplifyShaderEditorDistanceFade
        }

        static string wireframeShaderCGINCFilePath;
        static bool? packageShaderGraphIsInstalled;
        static bool? packageAmplfyShaderEditorIsInstalled;


        Vector2 scroll;


        [MenuItem("Window/Amazing Assets/Wireframe Shader/Shader Instructions", false, 3103)]
        static public void ShowWindow()
        {
            EditorWindow window = GetWindow<EditorWindow>("Wireframe Shader Instructions");

            window.Show();
        }

        void OnGUI()
        {
            GUILayout.Space(10);


            scroll = EditorGUILayout.BeginScrollView(scroll);
            {
                //Hand Written
                using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                {
                    EditorGUILayout.LabelField("Hand Written Methods", EditorStyles.miniBoldLabel);
                    {
                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.ObjectField("CGINC File", AssetDatabase.LoadAssetAtPath(GetWireframeShaderCGINCFilePath(), typeof(UnityEngine.Object)), typeof(UnityEngine.Object), false);

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy Path", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = GetWireframeShaderCGINCFilePathForShader();
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }

                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.TextField("Read Wireframe", "WireframeShaderReadTriangleMassFromUV");

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = "WireframeShaderReadTriangleMassFromUV(/*float3*/ texcoord3, /*float*/ thickness, /*float*/ smoothness)";
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }

                        GUILayout.Space(5);
                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.TextField("Distance Fade", "WireframeShaderDistanceFade");

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = "WireframeShaderDistanceFade(/*float3*/ cameraPositionWS, /*float3*/ vertexPositionWS, /*float*/ startDistance, /*float*/ endDistance)";
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }

                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.TextField("Mask Plane", "WireframeShaderMaskPlane");

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = "WireframeShaderMaskPlane(/*float3*/ planePositionWS, /*float3*/ planeNormalWS, /*float3*/ vertexPositionWS, /*float*/ edgeFalloff, /*float*/ invert)";
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }

                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.TextField("Mask Sphere", "WireframeShaderMaskSphere");

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = "WireframeShaderMaskSphere(/*float3*/ spherePositionWS, /*float*/ sphereRadius, /*float3*/ vertexPositionWS, /*float*/ edgeFalloff, /*float*/ invert)";
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }

                        using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                        {
                            EditorGUILayout.TextField("Mask Box", "WireframeShaderMaskBox");

                            using (new EditorGUIHelper.GUIBackgroundColor(GUI.skin.settings.selectionColor))
                            {
                                if (GUILayout.Button("Copy", GUILayout.MaxWidth(100)))
                                {
                                    TextEditor te = new TextEditor();
                                    te.text = "WireframeShaderMaskBox(/*float4x4*/ boxTRSMatrix, /*float3*/ boundingBox, /*float3*/ vertexPositionWS, /*float*/ edgeFalloff, /*float*/ invert)";
                                    te.SelectAll();
                                    te.Copy();

                                    Utilities.Log(te.text);
                                }
                            }
                        }
                    }
                }

                GUILayout.Space(5);
                using (new EditorGUIHelper.EditorGUILayoutBeginHorizontal())
                {
                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {
                        EditorGUILayout.LabelField("Shader Graph Nodes", EditorResources.MiniBoldLabelCenter);

                        if (packageShaderGraphIsInstalled.HasValue == false)
                            packageShaderGraphIsInstalled = EditorUtilities.IsPackageInstalled("com.unity.shadergraph");

                        using (new EditorGUIHelper.GUIEnabled(packageShaderGraphIsInstalled.Value ||
                              (Utilities.GetCurrentRenderPipeline() == Enum.RenderPipeline.Universal || Utilities.GetCurrentRenderPipeline() == Enum.RenderPipeline.HighDefinition)))
                        {
                            GUILayout.Space(5);
                            if (GUILayout.Button(new GUIContent(" Read Wireframe", EditorResources.IconWireframe), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.UnityShaderGraphCore);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent("Distance Fade", EditorResources.IconDistanceFade), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.UnityShaderGraphDistanceFade);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Plane", EditorResources.IconMaskPlane), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.UnityShaderGraphMaskPlane);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Plane mask variables:\nVector3 _WireframeShaderMaskPlanePosition\nVector3 _WireframeShaderMaskPlaneNormal");
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Sphere", EditorResources.IconMaskSphere), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.UnityShaderGraphMaskSphere);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Sphere mask variables:\nVector3 _WireframeShaderMaskSpherePosition\nfloat _WireframeShaderMaskSphereRadius");
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Box", EditorResources.IconMaskBox), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.UnityShaderGraphMaskBox);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Box mask variables:\nMatrix4 _WireframeShaderMaskBoxMatrixTRS\nVector3 _WireframeShaderMaskBoxBoundingBox");
                                }
                            }
                        }

                        GUILayout.Space(3);
                    }


                    using (new EditorGUIHelper.EditorGUILayoutBeginVertical(EditorStyles.helpBox))
                    {
                        EditorGUILayout.LabelField("Amplify Shader Functions", EditorResources.MiniBoldLabelCenter);

                        if (packageAmplfyShaderEditorIsInstalled.HasValue == false)
                            packageAmplfyShaderEditorIsInstalled = EditorUtilities.IsFileInProject("AmplifyShaderEditor", ".asmdef");

                        using (new EditorGUIHelper.GUIEnabled(packageAmplfyShaderEditorIsInstalled.Value))
                        {
                            GUILayout.Space(5);
                            if (GUILayout.Button(new GUIContent(" Read Wireframe", EditorResources.IconWireframe), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.AmplifyShaderEditorCore);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent("Distance Fade", EditorResources.IconDistanceFade), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.AmplifyShaderEditorDistanceFade);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Plane", EditorResources.IconMaskPlane), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.AmplifyShaderEditorMaskPlane);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Plane mask variables:\nVector3 _WireframeShaderMaskPlanePosition\nVector3 _WireframeShaderMaskPlaneNormal");
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Sphere", EditorResources.IconMaskSphere), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.AmplifyShaderEditorMaskSphere);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Sphere mask variables:\nVector3 _WireframeShaderMaskSpherePosition\nfloat _WireframeShaderMaskSphereRadius");
                                }
                            }

                            GUILayout.Space(1);
                            if (GUILayout.Button(new GUIContent(" Mask Box", EditorResources.IconMaskBox), GUILayout.MaxHeight(24)))
                            {
                                string subGrapFileLocation = GetSubGraphFileLocation(ShaderFileType.AmplifyShaderEditorMaskBox);

                                if (File.Exists(subGrapFileLocation))
                                {
                                    EditorUtilities.PingObject(subGrapFileLocation);

                                    Utilities.Log("Box mask variables:\nMatrix4 _WireframeShaderMaskBoxMatrixTRS\nVector3 _WireframeShaderMaskBoxBoundingBox");
                                }
                            }
                        }

                        GUILayout.Space(3);
                    }
                }
            }
            EditorGUILayout.EndScrollView();
        }

        static public string GetWireframeShaderCGINCFilePath()
        {
            if (string.IsNullOrEmpty(wireframeShaderCGINCFilePath) || File.Exists(wireframeShaderCGINCFilePath) == false)
                wireframeShaderCGINCFilePath = Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "cginc", "WireframeShader.cginc");

            return wireframeShaderCGINCFilePath;
        }
        static public string GetWireframeShaderCGINCFilePathForShader()
        {
            string pathToTransformCGINC = "\"" + GetWireframeShaderCGINCFilePath() + "\"";
            pathToTransformCGINC = pathToTransformCGINC.Replace(Path.DirectorySeparatorChar, '/');
            pathToTransformCGINC = pathToTransformCGINC.Replace('\\', '/');

            return "#include " + pathToTransformCGINC;
        }
        static public string GetSubGraphFileLocation(ShaderFileType extenstion)
        {
            switch (extenstion)
            {
                case ShaderFileType.cginc:
                    return GetWireframeShaderCGINCFilePath();

                case ShaderFileType.UnityShaderGraphCore:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Unity Shader Graph", "Read Wireframe.shadersubgraph");
                case ShaderFileType.UnityShaderGraphMaskPlane:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Unity Shader Graph", "Mask (Plane).shadersubgraph");
                case ShaderFileType.UnityShaderGraphMaskSphere:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Unity Shader Graph", "Mask (Sphere).shadersubgraph");
                case ShaderFileType.UnityShaderGraphMaskBox:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Unity Shader Graph", "Mask (Box).shadersubgraph");
                case ShaderFileType.UnityShaderGraphDistanceFade:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Unity Shader Graph", "Distance Fade.shadersubgraph");

                case ShaderFileType.AmplifyShaderEditorCore:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Amplify Shader Editor", "Read Wireframe.asset");
                case ShaderFileType.AmplifyShaderEditorMaskPlane:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Amplify Shader Editor", "Mask (Plane).asset");
                case ShaderFileType.AmplifyShaderEditorMaskSphere:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Amplify Shader Editor", "Mask (Sphere).asset");
                case ShaderFileType.AmplifyShaderEditorMaskBox:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Amplify Shader Editor", "Mask (Box).asset");
                case ShaderFileType.AmplifyShaderEditorDistanceFade:
                    return Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Shaders", "Amplify Shader Editor", "Distance Fade.asset");

                default:
                    return string.Empty;
            }
        }
    }
}

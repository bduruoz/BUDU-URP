#if UNITY_EDITOR
using System.IO;
using NKStudio.ShaderGraph.HotKey;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

namespace ShaderGraphHotKey
{
    public class ShaderGraphSettings : EditorWindow
    {
        [SerializeField]
        private VisualTreeAsset UxmlPath;
        
        [MenuItem("Window/ShaderGraph HotKey/Setup Window")]
        public static void Title()
        {
            ShaderGraphSettings wnd = GetWindow<ShaderGraphSettings>();
            wnd.titleContent = new GUIContent("Setup Window");

            wnd.minSize = new Vector2(434, 180);
            wnd.maxSize = new Vector2(434, 180);
        }

        public void CreateGUI()
        {
            #region Init

            if (!UxmlPath) return;

            // Each editor window contains a root VisualElement object
            VisualElement root = rootVisualElement;

            // Import UXML
            VisualElement container = UxmlPath.Instantiate();
            root.Add(container);

            #endregion

            #region Button

            Button shaderActiveButton = root.Q<Button>("shader-active-button");

            #endregion

            #region VisualLayout

            VisualElement errorBox = root.Q<VisualElement>("error-box");
            VisualElement finishBox = root.Q<VisualElement>("FinishMessage");

            #endregion

            #region Label

            Label finishText = root.Q<Label>("finish-text");
            Label errorBoxText = root.Q<Label>("errorBox-text");

            #endregion

            InitSetUp();

            InitLanguage();
            
            shaderActiveButton.clicked += () =>
            {
                bool authority;
                if (Application.systemLanguage == SystemLanguage.Korean)
                {
                    authority = EditorUtility.DisplayDialog("EmbedShaderGraph",
                        "쉐이더 그래프 단축키를 적용 하시겠습니까?",
                        "예", "아니오");
                }
                else
                {
                    authority = EditorUtility.DisplayDialog("EmbedShaderGraph",
                        "Apply shader graph shortcuts?",
                        "Yes", "No");
                }

                if (!authority) return;

                //성공 메세지 출력
                EditorPrefs.SetBool("SGHPatch", true);

                //디파인을 추가합니다.
                HotKeyUtility.InstallDefine();
            };

            void InitSetUp()
            {
                //쉐이더 그래프 패키지가 없을 경우
                if (!HotKeyUtility.HasShaderGraph())
                {
                    errorBox.style.display = DisplayStyle.Flex;
                    return;
                }

                //임베드가 되어 있지 않을 경우
                //임베드는 되어있으나 핫 키 적용이 안되어 있을 경우
                if (!HotKeyUtility.HasHotKeyDefine())
                {
                    shaderActiveButton.style.display = DisplayStyle.Flex;
                }
                else
                {
                    //피니쉬 되었음을 처리합니다.
                    finishBox.style.display = DisplayStyle.Flex;
                }
            }

            void InitLanguage()
            {
                SystemLanguage language = Application.systemLanguage;

                if (language == SystemLanguage.Korean)
                {
                    shaderActiveButton.text = "쉐이더 그래프 단축키 적용";
                    finishText.text = "단축키 적용이 완료되었습니다.";
                    errorBoxText.text = "쉐이더 그래프가 설치되어 있지 않습니다.";
                }
                else
                {
                    shaderActiveButton.text = "Apply shortcuts";
                    finishText.text = "Shortcut application is complete.";
                    errorBoxText.text = "Shader Graph is not installed.";
                }
            }
        }

        [InitializeOnLoadMethod]
        private static void InitMessage()
        {
            bool sghPatch = EditorPrefs.GetBool("SGHPatch", false);

            if (!sghPatch) return;

            Debug.Log(Application.systemLanguage == SystemLanguage.Korean
                ? "쉐이더 그래프 단축키 기능이 활성화 되었습니다."
                : "Shader Graph shortcut function has been activated.");

            EditorPrefs.DeleteKey("SGHPatch");
        }

#if SHADER_GRAPH_HOTKEY
        [MenuItem("Window/ShaderGraph HotKey/Disable")]
        private static void CleanUpHotKey()
        {
#if ENABLE_SHADERGRAPH
            if (HotKeyUtility.HasHotKeyDefine())
            {
                bool yes;
                if (Application.systemLanguage == SystemLanguage.Korean)
                    yes = EditorUtility.DisplayDialog("기능 해제", "쉐이더 그래프 단축키 기능을 해제하겠습니까?",
                        "네", "아니오");
                else
                    yes = EditorUtility.DisplayDialog("FUNCTION OFF", "Disable Shader Graph Shortcuts?",
                        "yes", "no");

                if (!yes) return;
                HotKeyUtility.RemoveDefine();
            }
            else
            {
                if (Application.systemLanguage == SystemLanguage.Korean)
                    Debug.LogWarning("쉐이더 그래프 단축키 시스템이 적용되어 있지 않습니다.");
                else
                    Debug.LogWarning("Shader Graph shortcut system is not applied.");
            }
#else
            if (Application.systemLanguage == SystemLanguage.Korean)
                Debug.LogWarning("쉐이더 그래프가 설치되어 있지 않습니다.");
            else
                Debug.LogWarning("Shader Graph is not installed.");
#endif
        }
#endif

#if SHADER_GRAPH_HOTKEY
        [MenuItem("Window/ShaderGraph HotKey/KeyBinding")]
        private static void SelectPath()
        {
#if ENABLE_SHADERGRAPH
            string[] settings = AssetDatabase.FindAssets("HotKeySettings");

            if (settings.Length < 1)
            {
                if (Application.systemLanguage == SystemLanguage.Korean)
                    Debug.Log("단축키를 처리할 HotKeySettings이 없습니다.");
                else
                    Debug.Log("No HotKeySettings to handle hotkeys.");
                return;
            }

            string assetPath = AssetDatabase.GUIDToAssetPath(settings[0]);
            NodeManager nodeManager = AssetDatabase.LoadAssetAtPath<NodeManager>(assetPath);

            Selection.activeObject = nodeManager;

            EditorGUIUtility.PingObject(nodeManager);
#else
            if (Application.systemLanguage == SystemLanguage.Korean)
                Debug.LogWarning("쉐이더 그래프가 설치되어 있지 않습니다.");
            else
                Debug.LogWarning("Shader Graph is not installed.");
#endif
        }
#endif

#if SHADER_GRAPH_HOTKEY
        [MenuItem("Window/ShaderGraph HotKey/CreateHotKeySettings")]
        private static void CreateHotKeySettings()
        {
#if ENABLE_SHADERGRAPH
            string[] settings = AssetDatabase.FindAssets("HotKeySettings");

            if (settings.Length > 0)
            {
                if (Application.systemLanguage == SystemLanguage.Korean)
                    Debug.Log("이미 단축키를 처리할 HotKeySettings를 가지고 있습니다.");
                else
                    Debug.Log("I already have HotKeySettings to handle the hotkeys.");
                return;
            }

            NodeManager nodeManager = CreateInstance<NodeManager>();
            nodeManager.cashNodes.Add(new CashNode("IntegerNode", KeyCode.Alpha0));
            nodeManager.cashNodes.Add(new CashNode("Vector1Node", KeyCode.Alpha1));
            nodeManager.cashNodes.Add(new CashNode("Vector2Node", KeyCode.Alpha2));
            nodeManager.cashNodes.Add(new CashNode("Vector3Node", KeyCode.Alpha3));
            nodeManager.cashNodes.Add(new CashNode("Vector4Node", KeyCode.Alpha4));
            nodeManager.cashNodes.Add(new CashNode("ColorNode", KeyCode.Alpha5));
            nodeManager.cashNodes.Add(new CashNode("SampleTexture2DNode", KeyCode.T));
            nodeManager.cashNodes.Add(new CashNode("UVNode", KeyCode.U));
            nodeManager.cashNodes.Add(new CashNode("AddNode", KeyCode.A));
            nodeManager.cashNodes.Add(new CashNode("SubtractNode", KeyCode.S));
            nodeManager.cashNodes.Add(new CashNode("MultiplyNode", KeyCode.M));
            nodeManager.cashNodes.Add(new CashNode("DivideNode", KeyCode.D));
            nodeManager.cashNodes.Add(new CashNode("OneMinusNode", KeyCode.O));
            nodeManager.cashNodes.Add(new CashNode("PowerNode", KeyCode.E));
            nodeManager.cashNodes.Add(new CashNode("LerpNode", KeyCode.L));
            nodeManager.cashNodes.Add(new CashNode("SplitNode", KeyCode.B));
            nodeManager.cashNodes.Add(new CashNode("SwizzleNode", KeyCode.Z));
            nodeManager.cashNodes.Add(new CashNode("NormalizeNode", KeyCode.N));
            nodeManager.cashNodes.Add(new CashNode("DotProductNode", KeyCode.Period));
            nodeManager.cashNodes.Add(new CashNode("Get Variable", KeyCode.G));
            nodeManager.cashNodes.Add(new CashNode("Register Variable", KeyCode.R));

            const string settingsPath = "Assets/Plugins/ShaderGraphHotKey/Settings";
            bool hasSettings = Directory.Exists(settingsPath);
            if (!hasSettings) AssetDatabase.CreateFolder("Assets", "Settings");
            AssetDatabase.CreateAsset(nodeManager, $"{settingsPath}/HotKeySettings.asset");
            AssetDatabase.SaveAssets();
            Selection.activeObject = nodeManager;

            if (Application.systemLanguage == SystemLanguage.Korean)
                Debug.Log("생성되었습니다!");
            else
                Debug.Log("Created!");
#else
            if (Application.systemLanguage == SystemLanguage.Korean)
                Debug.LogWarning("쉐이더 그래프가 설치되어 있지 않습니다.");
            else
                Debug.LogWarning("Shader Graph is not installed.");
#endif
        }
#endif
    }
}
#endif
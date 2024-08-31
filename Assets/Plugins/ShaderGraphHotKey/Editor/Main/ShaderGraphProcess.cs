using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System;
using System.IO;
using System.Linq;
using System.Reflection;
using UnityEngine.UIElements;
using UnityEditor.Experimental.GraphView;
using UnityEditor.Rendering;
using UnityEditor.ShaderGraph;
using UnityEditor.ShaderGraph.Drawing;
using UnityEditorInternal;
using Object = UnityEngine.Object;
#if SHADER_GRAPH_HOTKEY
using UnityEditor.ShaderGraph;
using UnityEditor.ShaderGraph.Drawing;
#endif

namespace ShaderGraphHotKey
{
    public class ShaderGraphProcess : Editor
    {
        private static float _initTime;


#if SHADER_GRAPH_HOTKEY
        private static string _currentNode = string.Empty;
        private static FieldInfo _searchWindowProviderField;
#endif

        private const BindingFlags BindingFlags =
            System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.NonPublic |
            System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Static;

        #region HotKey

        private static object _graphData;
        private static object _graphEditorView;

        private static FieldInfo _onConnectField;
        private static FieldInfo _onDisconnectField;
        private static FieldInfo _graphEditorViewField;
        private static FieldInfo _graphViewField;
        private static FieldInfo _graphDataField;
        private static FieldInfo _synonymsField;
        private static PropertyInfo _drawStateProperty;
        private static Type _materialGraphEditWindowType;
        private static Type _graphEditorViewType;
        private static Type _graphDataType;
        private static Type _abstractMaterialNodeType;
        private static Type _listTypeGenericParam0;
        private static Type _materialSlotType;
        private static Type _userViewSettingsType;

        private static GraphView _graphView;
        private static EditorWindow _prev;

        #endregion

        #region Register Variable

        private static PropertyInfo _objectIdProperty;
        private static PropertyInfo _shaderPortSlotProperty;
        private static PropertyInfo _materialSlotReferenceProperty;

        private static MethodInfo _connectMethod;
        private static MethodInfo _connectNoValidateMethod;
        private static MethodInfo _getInputSlotsMaterialSlot;
        private static MethodInfo _getOutputSlotsMaterialSlot;
        private static MethodInfo _getEdges;
        private static MethodInfo _removeEdge;
        private static MethodInfo _validateGraph;
        private static MethodInfo _addValidationError;
        private static MethodInfo _clearErrorsForNode;
        private static MethodInfo _removeNode;

        private static Type _edgeType;
        private static Type _listTypeIEdge;
        private static Type _listTypeMaterialSlot;

        private static bool _loadVariables;
        private static readonly List<Port> EditedPorts = new List<Port>();

        // (가변 필드의 문자열 너비를 가져오는 데 필요한 글꼴)
        private static readonly Font
            InterFont = EditorGUIUtility.LoadRequired("Fonts/Inter/Inter-Regular.ttf") as Font;

        //Register/Get Variables
        private static readonly Dictionary<string, Node> Variables = new Dictionary<string, Node>();

        // RegisterGet 변수 노드는 이러한 유형을 지원하며 포트 순서와 일치해야 합니다.
        private enum NodePortType
        {
            Vector4, //Vector2, Vector3 및 DynamicVector, DynamicValue에도 사용됨
            Float
        }

        #endregion

        #region ScreenShot

        private const string SavePath = "/SG-Screenshot";
        private const float TimeBetweenScreenshots = 0.1f;
        private static bool _isProcessing;
        private static int _progressID;
        private static string _filename;

        private static EditorWindow _shaderGraphWindow;

        private static IEnumerator _processingEnumerator;
        private static float _lastTime;

        #endregion

        [InitializeOnLoadMethod]
        private static void Initialize()
        {
            _initTime = Time.realtimeSinceStartup;
            EditorApplication.update += CheckForGraphs;
            Undo.undoRedoPerformed += OnUndoRedo;
        }

        private static void OnUndoRedo()
        {
            _prev = null;
            _initTime = Time.realtimeSinceStartup;
        }

        private static void GetShaderGraphTypes()
        {
            Assembly assembly = Assembly.Load(new AssemblyName("Unity.ShaderGraph.Editor"));

            //MaterialGraphEditWindow:EditorWindow 클래스 타입 가져옴
            _materialGraphEditWindowType = assembly.GetType("UnityEditor.ShaderGraph.Drawing.MaterialGraphEditWindow");
            _abstractMaterialNodeType = assembly.GetType("UnityEditor.ShaderGraph.AbstractMaterialNode");
            _materialSlotType = assembly.GetType("UnityEditor.ShaderGraph.MaterialSlot");
            _edgeType = assembly.GetType("UnityEditor.Graphing.IEdge");
            _userViewSettingsType = assembly.GetType("UnityEditor.ShaderGraph.Drawing.UserViewSettings");
        }

        private static GraphView GetGraphViewFromMaterialGraphEditorWindow(EditorWindow win)
        {
            #region Init

            if (_materialGraphEditWindowType == null)
            {
                GetShaderGraphTypes();
                if (_materialGraphEditWindowType == null) return null;
            }

            #endregion

            //그래프 에디터 뷰 필드를 가져온다.
            _graphEditorViewField = _materialGraphEditWindowType.GetField("m_GraphEditorView", BindingFlags);

            //값을 가져온다.
            if (_graphEditorViewField != null)
                _graphEditorView = _graphEditorViewField.GetValue(win);

            //실패시 Null반환
            if (_graphEditorView == null) return null;

            //그래프 뷰와 그래프 값을 적용
            if (_graphEditorViewType == null)
            {
                _graphEditorViewType = _graphEditorView.GetType();
                _graphViewField = _graphEditorViewType.GetField("m_GraphView", BindingFlags);
                _graphDataField = _graphEditorViewType.GetField("m_Graph", BindingFlags);
#if SHADER_GRAPH_HOTKEY
                _searchWindowProviderField = _graphEditorViewType.GetField("m_SearchWindowProvider", BindingFlags);
#endif
            }

            //그래프 뷰 값을 바인딩하고 데이터를 가져온다.
            if (_graphViewField != null)
            {
                GraphView graphView = (GraphView)_graphViewField.GetValue(_graphEditorView);

                if (_graphDataField != null)
                    _graphData = _graphDataField.GetValue(_graphEditorView);

                if (_graphDataType == null) _graphDataType = _graphData.GetType();

#if SHADER_GRAPH_HOTKEY
                HintOverride();
#endif

                return graphView;
            }

            return null;
        }

        private static void CheckForGraphs()
        {
            if (Time.realtimeSinceStartup < _initTime + 3f) return;

            //현재 포커스된 에디터를 가져옵니다.
            EditorWindow focusedWindow = EditorWindow.focusedWindow;

            try
            {
                //현재 띄운게 쉐이더 그래프 에디터일 경우
                if (!focusedWindow.GetType().ToString()
                        .Contains("UnityEditor.ShaderGraph.Drawing.MaterialGraphEditWindow")) return;
            }
            catch (NullReferenceException)
            {
                return;
            }

            //현재 포커스된게 이전에 정의된 뷰랑 다를 경우, 그래프 뷰가 전혀 없을 경우
            if (focusedWindow != _prev || _graphView == null)
            {
                _graphView = GetGraphViewFromMaterialGraphEditorWindow(focusedWindow);

                Variables.Clear();
                _loadVariables = true;

                _prev = focusedWindow;
#if SHADER_GRAPH_HOTKEY
                try
                {
                    //현재 그래프 뷰를 대입함
                    _graphView.RegisterCallback<PointerDownEvent>(OnMouseDownEvent, TrickleDown.TrickleDown);
                    _graphView.RegisterCallback<KeyDownEvent>(OnKeyDownEvent);
                    _graphView.RegisterCallback<KeyUpEvent>(OnKeyUpEvent);
                }
                catch (Exception)
                {
                }
#endif
            }

            if (_graphView == null) return;
#if SHADER_GRAPH_HOTKEY
            ScreenShot(focusedWindow);
#endif
            UpdateVariableNodes();
            _loadVariables = false;
        }

#if SHADER_GRAPH_HOTKEY
        private static void ScreenShot(EditorWindow focusedWindow)
        {

            try
            {
                // 부모 요소 가져오기
                VisualElement nodeSettingsContainer = _graphView.Q<VisualElement>("graphSettings");

                if (nodeSettingsContainer.Q<Button>("Screenshot-Node") == null)
                {
                    // 자식 요소 추가
                    Button button = new()
                    {
                        text = "Screenshot Node",
                        name = "Screenshot-Node",
                        tooltip = "노드를 스크린 캡쳐합니다.",
                        style =
                        {
                            marginTop = 10, marginLeft = 20, marginRight = 20, height = 40,
                            fontSize = 15
                        }
                    };
                    button.clicked += () =>
                    {
                        EditorWindow window = EditorWindow.focusedWindow;
                        StartShaderGraphToPng(window.titleContent.text, focusedWindow);
                    };
                    nodeSettingsContainer.Add(button);
                }
            }
            catch (Exception)
            {
            }
        }
#endif

        #region HotKey

#if SHADER_GRAPH_HOTKEY
        private static void OnKeyUpEvent(KeyUpEvent evt)
        {
            _currentNode = string.Empty;
        }

        private static void OnKeyDownEvent(KeyDownEvent evt)
        {
            KeyCode evtPath = evt.keyCode;

            if (evtPath == KeyCode.None) return;

            _currentNode = DefaultSetKeyPath(evtPath);
        }

        private static string DefaultSetKeyPath(KeyCode keyPath)
        {
            string[] settings = AssetDatabase.FindAssets("HotKeySettings");

            if (settings.Length == 0)
            {
                Debug.Log(Application.systemLanguage == SystemLanguage.Korean
                    ? "단축키를 처리할 HotKeySettings이 없습니다."
                    : "The HotKeySettings file could not be found.");

                return string.Empty;
            }

            string assetPath = AssetDatabase.GUIDToAssetPath(settings[0]);
            NodeManager nodeManager = AssetDatabase.LoadAssetAtPath<NodeManager>(assetPath);

            foreach (CashNode cashNode in nodeManager.cashNodes)
            {
                if (cashNode.nodePath == keyPath)
                    return cashNode.nodeName;
            }

            return string.Empty;
        }

        private static void OnMouseDownEvent(PointerDownEvent evt)
        {
            if (_graphView == null) return;

            if (string.IsNullOrEmpty(_currentNode)) return;

            #region Position

            Rect pos = new Rect();

            Vector2 mousePosition = evt.originalMousePosition;
            mousePosition.y -= 35;

            Matrix4x4 matrix = _graphView.viewTransform.matrix.inverse;
            Vector3 changeMousePositionByLocalToWorld = matrix.MultiplyPoint(mousePosition);

            pos.position = changeMousePositionByLocalToWorld;

            #endregion

            try
            {
                //노드를 가져옵니다.
                Type targetType = Type.GetType(IsSubShaderGraph(_currentNode)
                    ? "UnityEditor.ShaderGraph.SubGraphNode, Unity.ShaderGraph.Editor"
                    : $"UnityEditor.ShaderGraph.{_currentNode}, Unity.ShaderGraph.Editor");

                //비어있으면 안가져온다.
                if (targetType == null) return;

                //drawState프로퍼티를 가져옵니다.
                if (_drawStateProperty == null)
                    _drawStateProperty = _abstractMaterialNodeType.GetProperty("drawState", BindingFlags);

                //자료형을 알 수 없으므로 Activator.CreateInstance를 사용하여 임으로 생성한다.
                object currentTypeNode = Activator.CreateInstance(targetType);

                //해당 인스턴스의 drawState 변수 가져오기.
                if (_drawStateProperty != null)
                {
                    object drawState = _drawStateProperty.GetValue(currentTypeNode);

                    //drawState안에 Position과 expanded가져오기
                    PropertyInfo positionProperty = drawState.GetType().GetProperty("position", BindingFlags);

                    //포지션 값 적용
                    if (positionProperty != null)
                        positionProperty.SetValue(drawState, pos);

                    //draw상태 적용
                    _drawStateProperty.SetValue(currentTypeNode, drawState);
                }

                //AddNode함수 가져옴
                MethodInfo addNodeMethod = _graphDataType.GetMethod("AddNode", BindingFlags);

                #region Test

                if (IsSubShaderGraph(_currentNode))
                {
                    PropertyInfo subGraphAssetProperty = targetType.GetProperty("asset");
                    string guidPath = NodeNameToGuid(_currentNode);

                    //에러 방지
                    if (string.IsNullOrEmpty(guidPath))
                        return;

                    object asset = GetSubGraphAsset(guidPath);
                    if (asset != null) subGraphAssetProperty?.SetValue(currentTypeNode, asset);
                }

                #endregion

                //현재 그래프 데이터를 넘기며 생성시킬 값 보냄
                if (addNodeMethod != null)
                    addNodeMethod.Invoke(_graphData, new[] { currentTypeNode });
            }
            catch (Exception e)
            {
                Debug.LogError(e + $"{_currentNode}");
                throw;
            }
        }

        private static string NodeNameToGuid(string currentNode)
        {
            string[] shadergraphsAssetGuid = AssetDatabase.FindAssets("t:UnityEditor.ShaderGraph.SubGraphAsset");
            if (shadergraphsAssetGuid.Length == 0) return string.Empty;

            foreach (string s in shadergraphsAssetGuid)
            {
                string path = AssetDatabase.GUIDToAssetPath(s);
                string name = Path.GetFileNameWithoutExtension(path);
                if (name == currentNode)
                    return s;
            }

            return string.Empty;
        }

        private static bool IsSubShaderGraph(string currentNode)
        {
            string[] findAssets = AssetDatabase.FindAssets("t:UnityEditor.ShaderGraph.SubGraphAsset");
            if (findAssets.Length == 0) return false;
            return findAssets
                .Select(AssetDatabase.GUIDToAssetPath)
                .Select(Path.GetFileNameWithoutExtension).Any(name => name == currentNode);
        }

        private static object GetSubGraphAsset(string guidString)
        {
            return AssetDatabase.LoadAssetAtPath(AssetDatabase.GUIDToAssetPath(guidString), typeof(SubGraphAsset));
        }

        /// <summary>
        /// 키코드를 이름으로 변경합니다.
        /// </summary>
        /// <param name="keyCode"></param>
        /// <returns></returns>
        private static string KeycodeToPath(KeyCode keyCode)
        {
            if ((int)keyCode >= 48 && (int)keyCode <= 57)
            {
                int formatInt = (int)keyCode - 48;
                return $"{formatInt}";
            }

            if ((int)keyCode >= 97 && (int)keyCode <= 122)
            {
                string formatString = keyCode.ToString().ToUpper();
                return $"{formatString}";
            }

            if ((int)keyCode >= 256 && (int)keyCode <= 265)
            {
                int formatInt = (int)keyCode - 256;
                return $"Keypad : {formatInt}";
            }

            if ((int)keyCode >= 282 && (int)keyCode <= 296)
                return keyCode.ToString();

            switch (keyCode)
            {
                case KeyCode.Semicolon:
                    return ";";
                case KeyCode.Slash:
                    return "/";
                case KeyCode.Backslash:
                    return @"\";
                case KeyCode.Comma:
                    return ",";
                case KeyCode.Equals:
                    return "=";
                case KeyCode.Minus:
                    return "-";
                case KeyCode.Period:
                    return ".";
                case KeyCode.Quote:
                    return "'";
                case KeyCode.BackQuote:
                    return "`";
                case KeyCode.DownArrow:
                    return "↓";
                case KeyCode.LeftArrow:
                    return "←";
                case KeyCode.RightArrow:
                    return "→";
                case KeyCode.UpArrow:
                    return "↑";
                case KeyCode.LeftBracket:
                    return "[";
                case KeyCode.RightBracket:
                    return "]";
                case KeyCode.LeftAlt:
                    return "L-Alt";
                case KeyCode.RightAlt:
                    return "R-Alt";
                case KeyCode.LeftControl:
                    return "L-Ctrl";
                case KeyCode.RightControl:
                    return "R-Ctrl";
                case KeyCode.LeftShift:
                    return "L-Shift";
                case KeyCode.RightShift:
                    return "R-Shift";
                case KeyCode.CapsLock:
                    return "capsLock";
                case KeyCode.Escape:
                    return "ESC";
            }

            return string.Empty;
        }

        public static void HintOverride()
        {
            #region Init

            if (_searchWindowProviderField == null) return;

            SearchWindowProvider provider =
                _searchWindowProviderField.GetValue(_graphEditorView) as SearchWindowProvider;

            string[] settings = AssetDatabase.FindAssets("HotKeySettings");

            if (provider == null) return;

            if (settings.Length == 0) return;

            //세팅 데이터
            string assetPath = AssetDatabase.GUIDToAssetPath(settings[0]);
            NodeManager nodeManager = AssetDatabase.LoadAssetAtPath<NodeManager>(assetPath);

            //검색창에 기록되는 노드들
            List<NodeEntry> nodeEntries = provider.currentNodeEntries;

            //캐시노드
            List<CashNode> cashNodes = nodeManager.cashNodes;

            #endregion

            //검색창 노드 개수만큼 순례를 돈다.
            foreach (NodeEntry nodeEntry in nodeEntries)
            {
                //세팅 데이터만큼 순례를 돈다.
                foreach (CashNode cashNode in cashNodes)
                {
                    //노드 엔트리랑 캐쉬파일 이름이 같다면,
                    if (nodeEntry.node.GetType().Name == cashNode.nodeName ||
                        nodeEntry.title.Contains(cashNode.nodeName))
                    {
                        //단축키를 글자s
                        string hotKey = KeycodeToPath(cashNode.nodePath);

                        //전체 크기를 구해서 마지막 타이틀을 찾는다.
                        int titleSlot = nodeEntry.title.Length;
                        string name = nodeEntry.title[titleSlot - 1];

                        //만약 괄호가 추가되어 있다면,
                        if (name.Contains('('))
                        {
                            int cutLine = name.LastIndexOf('(');
                            name = name.Substring(0, cutLine - 1);
                        }

                        nodeEntry.title[titleSlot - 1] = $"{name} ({hotKey})";
                    }
                }
            }
        }
#endif

        #endregion

        #region Register Node

        //변수 노드를 업데이트합니다.
        private static void UpdateVariableNodes()
        {
            HandlePortUpdates();

            void NodeAction(Node node)
            {
                if (node == null) return;
                switch (node.title)
                {
                    case "Register Variable":
                    {
                        TextField field = TryGetTextField(node);

                        if (field == null)
                        {
                            // 변수 설정 등록(한 번 호출)
                            field = CreateTextField(node, out string variableName);
                            field.style.marginLeft = 25;
                            field.style.marginRight = 4;

                            if (!variableName.Equals(""))
                                // 노드 등록
                                Register("", variableName, node);

                            field.RegisterValueChangedCallback(x => Register(x.previousValue, x.newValue, node));

                            // 노드 유형 설정(VectorFloat)
                            UQueryState<Port> inputPorts = GetInputPorts(node);
                            Port inputVector = inputPorts.AtIndex(0);
                            Port inputFloat = inputPorts.AtIndex(1);
                            Port connectedOutput = GetConnectedPort(inputVector);
                            Port connectedOutputF = GetConnectedPort(inputFloat);
                            NodePortType portType = NodePortType.Vector4;

                            if (connectedOutput != null)
                                if (GetPortType(connectedOutput).Contains("Vector1"))
                                    portType = NodePortType.Float;

                            if (connectedOutputF != null)
                                if (GetPortType(connectedOutputF).Contains("Vector1"))
                                    portType = NodePortType.Float;

                            SetNodePortType(node, portType);

                            if (connectedOutput == null && connectedOutputF == null)
                            {
                            }
                            else if (connectedOutput == null || connectedOutputF == null)
                            {
                                if (connectedOutput == null)
                                {
                                    Connect(connectedOutputF, inputVector);
                                    Connect(connectedOutputF, inputFloat);
                                }
                                else
                                {
                                    Connect(connectedOutput, inputVector);
                                    Connect(connectedOutput, inputFloat);
                                }
                            }

                            UQueryState<Port> outputPorts = GetOutputPorts(node);
                            Port outputVector = outputPorts.AtIndex(0);
                            Port outputFloat = outputPorts.AtIndex(1);
                            Port connectedInput = GetConnectedPort(outputVector);
                            Port connectedInputF = GetConnectedPort(outputFloat);
                            if ((connectedInput != null && !connectedInput.node.title.Equals("Get Variable")) ||
                                (connectedInputF != null && !connectedInputF.node.title.Equals("Get Variable")))
                            {
                                // 변수 등록 노드의 입력에 연결할 수 없습니다.
                                // (자동으로 연결되는 Get Variable 노드가 아니라면)
                                // 이것은 입력 포트에서 가장자리를 드래그하는 동안 노드가 생성된 경우 발생할 수 있습니다.
                                DisconnectAllOutputs(node);
                            }

                            // port.OnConnect port.OnDisconnect에 메서드를 등록합니다(내부이므로 리플렉션 사용).
                            inputPorts.ForEach(port =>
                            {
                                RegisterPortDelegates(port, OnRegisterNodeInputPortConnected,
                                    OnRegisterNodeInputPortDisconnected);
                            });
                            // 이것이 중단되면 대안은 다른 유형에 대해 각 프레임의 포트를 확인하는 것입니다.
                        }
                        else
                        {
                            // 변수 업데이트 등록
                            if (_loadVariables)
                                Register("", field.value, node);

                            UQueryState<Port> inputPorts = GetInputPorts(node);
                            UQueryState<Port> outputPorts = GetOutputPorts(node);
                            Port inputPort = GetActivePort(inputPorts);

                            //가장자리를 보이지 않게 만들기
                            Action<Port> portAction = output =>
                            {
                                foreach (Edge edge in output.connections)
                                {
                                    if (!edge.input.node.title.Equals("Get Variable")) continue;
                                    if (edge.visible) edge.visible = false;
                                }
                            };
                            outputPorts.ForEach(portAction);

                            // 가장자리를 보이지 않게 만들기(활성화된 입력 포트가 아닌 경우)
                            portAction = input =>
                            {
                                foreach (Edge edge in input.connections)
                                {
                                    if (edge.input == inputPort) continue;
                                    if (edge.visible) edge.visible = false;
                                }
                            };
                            inputPorts.ForEach(portAction);

                            if (!node.expanded)
                            {
                                bool hasPorts = node.RefreshPorts();
                                if (!hasPorts) HideElement(field);
                            }
                            else
                                ShowElement(field);
                        }

                        break;
                    }
                    case "Get Variable":
                    {
                        TextField field = TryGetTextField(node);
                        if (field == null)
                        {
                            // 변수 설정 가져오기(한 번 호출됨)
                            field = CreateTextField(node, out string _);
                            field.style.marginLeft = 4;
                            field.style.marginRight = 25;
                            field.RegisterValueChangedCallback(x => Get(x.newValue, node));

                            UQueryState<Port> outputPorts = GetOutputPorts(node);
                            Port outputVector = outputPorts.AtIndex(0);
                            Port outputFloat = outputPorts.AtIndex(1);

                            // 두 출력 포트가 모두 표시되면 설정을 수행하십시오. :
                            // (변수 등록 노드가 먼저 트리거할 수 있으므로)
                            if (!IsPortHidden(outputVector) && !IsPortHidden(outputFloat))
                            {
                                string key = GetSerializedVariableKey(node);
                                Get(key, node);
                            }
                            else if (_loadVariables)
                            {
                                string key = GetSerializedVariableKey(node);
                                ResizeNodeToFitText(node, key);
                            }

                            Port connectedInputF = GetConnectedPort(outputFloat);
                            NodePortType portType = GetNodePortType(node);
                            if (connectedInputF != null && portType == NodePortType.Vector4)
                            {
                                // 유형이 Vector일 때 Float 포트에 무언가가 연결되어 있습니다.
                                // 이것은 입력 포트에서 가장자리를 드래그하는 동안 노드가 생성된 경우 발생할 수 있습니다.
                                MoveAllOutputs(outputFloat, outputVector);
                            }
                        }
                        else
                        {
                            if (!node.expanded)
                            {
                                bool hasPorts = node.RefreshPorts();
                                if (!hasPorts) HideElement(field);
                            }
                            else
                                ShowElement(field);
                        }

                        break;
                    }
                }
            }

            _graphView.nodes.ForEach(NodeAction);
        }

        /// <summary>
        /// 노드의 모든 출력을 동일한 노드의 다른 포트로 이동합니다(toPort가 다른 노드에도 있는 경우 작동할 수 있음).
        /// </summary>
        private static void MoveAllOutputs(Port port, Port toPort)
        {
            // 모든 연결을 포트에서 포트로 이동(동일한 노드에서)
            List<Port> toConnect = port.connections.Select(edge => edge.input).ToList();
            //DisconnectAllEdges(노드, 포트); 이전 포트에서 모든 가장자리 제거
            // 가장자리를 분리할 필요가 없는 것 같습니다. 아마도 우리가 연결하고 있기 때문일 것입니다.
            //1개의 가장자리만 가질 수 있는 동일한 입력에 대해 재정의됩니다.

            foreach (Port t in toConnect)
                Connect(toPort, t, true);

            ValidateGraph();
        }

        /// <summary>
        /// graphData.ValidateGraph() 호출(리플렉션을 통해)
        /// </summary>
        private static void ValidateGraph()
        {
            if (_validateGraph == null)
                _validateGraph = _graphDataType.GetMethod("ValidateGraph");

            if (_validateGraph != null) _validateGraph.Invoke(_graphData, null);
        }

        private static void HandlePortUpdates()
        {
            for (int i = EditedPorts.Count - 1; i >= 0; i--)
            {
                Port port = EditedPorts[i];
                Node node = port.node;
                if (node == null)
                {
                    // 노드가 삭제되었습니다. 무시
                    EditedPorts.RemoveAt(i);
                    continue;
                }

                Port outputConnectedToInput = GetConnectedPort(port);
                if (outputConnectedToInput != null)
                {
                    UQueryState<Port> inputPorts = GetInputPorts(node);
                    Port inputVector = inputPorts.AtIndex(0);
                    Port inputFloat = inputPorts.AtIndex(1);

                    // 입력 연결 끊기 및 다시 연결
                    if (IsPortHidden(inputVector))
                    {
                        DisconnectAllEdges(node, inputVector);
                        Connect(outputConnectedToInput, inputVector);
                    }
                    else
                    {
                        DisconnectAllEdges(node, inputFloat);
                        Connect(outputConnectedToInput, inputFloat);
                    }
                    //무한 루프를 방지하기 위해 활성 포트를 변경하지 않습니다.

                    string connectedSlotType = GetPortType(outputConnectedToInput);
                    string inputSlotType = GetPortType(port);

                    if (connectedSlotType != inputSlotType)
                    {
                        NodePortType portType = NodePortType.Vector4;
                        if (connectedSlotType.Contains("Vector1"))
                        {
                            portType = NodePortType.Float;
                        }

                        if (inputSlotType.Contains("Vector4") && portType == NodePortType.Float)
                        {
                            // 포트가 현재 Vector4이지만 Float가 연결된 경우
                            SetNodePortType(node, NodePortType.Float);
                        }
                        else if (inputSlotType.Contains("Vector1") && portType == NodePortType.Vector4)
                        {
                            // 포트가 현재 Float이지만 Vector234가 연결된 경우
                            SetNodePortType(node, NodePortType.Vector4);
                        }
                    }
                }
                else
                {
                    // 제거된 포트
                    UQueryState<Port> inputPorts = GetInputPorts(node);
                    inputPorts.ForEach(p =>
                    {
                        if (p != port)
                        {
                            // we avoid changing the active port to prevent infinite loop
                            DisconnectAllEdges(node, p);
                        }
                    });

                    // 기본값은 Vector4 유형입니다.
                    SetNodePortType(node, NodePortType.Vector4);
                }

                EditedPorts.RemoveAt(i);
            }
        }

        /// <summary>
        /// 지정된 노드 및 포트에서 모든 에지의 연결을 끊습니다.
        /// </summary>
        private static void DisconnectAllEdges(Node node, Port port)
        {
            // 이미 연결이 없으면 계속 진행하지 마십시오.
            int n = port.connections.Count();

            if (n == 0) return;

            //이것은 시각적으로 포트의 모든 연결을 끊습니다.
            port.DisconnectAll();

            int index;
            if (port.direction == Direction.Input)
            {
                // SubGraph 입력 포트에는 그룹화된 추가 요소가 있습니다.
                // (연결되지 않을 때 값을 표시하기 위해, 예를 들어 (0,0,0,0) 것)
                VisualElement parent = port.parent;
                index = parent.parent.IndexOf(parent);
            }
            else
                index = port.parent.IndexOf(port);

            // 이것은 셰이더 그래프 데이터 측면에서 포트의 모든 연결을 끊습니다.
            DisconnectAllReflection(node, index, port.direction);
        }

        private static void DisconnectAllReflection(Node node, int portIndex, Direction direction)
        {
            object abstractMaterialNode = NodeToMaterialNode(node);

#if UNITY_2021_2_OR_NEWER
            // Reflection for : AbstractMaterialNode.GetInputSlots(List<MaterialSlot> list) / GetOutputSlots(List<MaterialSlot> list)
            _listTypeGenericParam0 ??= typeof(List<>).MakeGenericType(Type.MakeGenericMethodParameter(0));

            if (_getInputSlotsMaterialSlot == null)
            {
                MethodInfo getInputSlots =
                    _abstractMaterialNodeType.GetMethod("GetInputSlots", new[] { _listTypeGenericParam0 });
                if (getInputSlots != null)
                    _getInputSlotsMaterialSlot = getInputSlots.MakeGenericMethod(_materialSlotType);
            }

            if (_getOutputSlotsMaterialSlot == null)
            {
                MethodInfo getOutputSlots =
                    _abstractMaterialNodeType.GetMethod("GetOutputSlots", new[] { _listTypeGenericParam0 });
                if (getOutputSlots != null)
                    _getOutputSlotsMaterialSlot = getOutputSlots.MakeGenericMethod(_materialSlotType);
            }
#else
            if (_getOutputSlotsMaterialSlot == null)
            {
                MethodInfo getInputSlots = _abstractMaterialNodeType.GetMethod("GetInputSlots");
                _getOutputSlotsMaterialSlot = getInputSlots.MakeGenericMethod(_materialSlotType);
            }

            if (_getOutputSlotsMaterialSlot == null)
            {
                MethodInfo getOutputSlots = _abstractMaterialNodeType.GetMethod("GetOutputSlots");
                _getOutputSlotsMaterialSlot = getOutputSlots.MakeGenericMethod(_materialSlotType);
            }
#endif

            _listTypeMaterialSlot ??= typeof(List<>).MakeGenericType(_materialSlotType);

            IList materialSlotList = (IList)Activator.CreateInstance(_listTypeMaterialSlot);
            MethodInfo method = direction == Direction.Input
                ? _getInputSlotsMaterialSlot
                : _getOutputSlotsMaterialSlot;
            if (method != null) method.Invoke(abstractMaterialNode, new object[] { materialSlotList });

            object slot = materialSlotList[portIndex]; // Type : (MaterialSlot)
            object slotReference = GetSlotReference(slot);

            // Reflection for : graphData.GetEdges(SlotReference slot, List<IEdge> list)
            _listTypeIEdge ??= typeof(List<>).MakeGenericType(_edgeType);
            if (_getEdges == null)
                _getEdges = _graphDataType.GetMethod("GetEdges", new[] { slotReference.GetType(), _listTypeIEdge });

            IList edgeList = (IList)Activator.CreateInstance(_listTypeIEdge);
            if (_getEdges != null) _getEdges.Invoke(_graphData, new[] { slotReference, edgeList });

            if (_removeEdge == null)
                _removeEdge = _graphDataType.GetMethod("RemoveEdgeNoValidate", BindingFlags);

            foreach (object edge in edgeList)
            {
                if (_removeEdge != null)
                    _removeEdge.Invoke(_graphData, new[] { edge, true });
            }

            // 이제 ValidateGraph를 수동으로 트리거합니다.
            ValidateGraph();
        }

        private static object GetSlotReference(object materialSlot)
        {
            // MaterialSlot -> SlotReference "slotReference"
            if (_materialSlotReferenceProperty == null)
                _materialSlotReferenceProperty = materialSlot.GetType().GetProperty("slotReference");
            return _materialSlotReferenceProperty?.GetValue(materialSlot);
        }

        /// <summary>
        /// 동의어에 저장된 값을 가져옵니다(SG에 의해 직렬화됨). 입력은 NodeSGMaterialNode(노드)여야 합니다.
        /// </summary>
        private static string[] GetSerializedValues(object materialNode)
        {
            // 노드의 "동의어" 필드에 값을 저장합니다.
            // 노드는 일반적으로 검색 상자에 이를 사용하므로 사용자가 "Vector 1"을 입력하더라도 "Float"를 표시할 수 있습니다.
            // 하지만 실제 셰이더 그래프 파일에서도 직렬화되어 그 당시에는 실제로 사용되지 않았으므로 이제 내 것입니다!~
            if (_synonymsField == null) _synonymsField = _abstractMaterialNodeType.GetField("synonyms");
            return (string[])_synonymsField.GetValue(materialNode);
        }

        /// <summary>
        /// 텍스트 필드를 반환합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static TextField TryGetTextField(VisualElement node) => node.ElementAt(1) as TextField;

        /// <summary>
        /// 텍스트 필드를 만듭니다.
        /// </summary>
        /// <param name="node"></param>
        /// <param name="variableName"></param>
        /// <returns></returns>
        private static TextField CreateTextField(VisualElement node, out string variableName)
        {
            // 변수 이름 가져오기(노드의 "동의어" 필드에 저장됨)
            variableName = GetSerializedVariableKey(node);

            // 텍스트 필드 설정
            TextField field = new TextField()
            {
                style =
                {
                    position = Position.Absolute,
                    top = 39, // 첫 번째 입력 출력 포트 위에 필드 넣기
                },
                name = "textNK"
            };

            //부모 사이즈에 맞게 늘립니다.
            field.StretchToParentWidth();

            //참고: 나중에 필요한 포트를 숨기지 않도록 여백도 조정합니다.
            //VisualElement textInput = field.hierarchy.childCount

#if UNITY_2022_1_OR_NEWER
            VisualElement textInput = field.ElementAt(0); //textNK
            VisualElement text = textInput.hierarchy[0]; //textSize
            text.style.fontSize = 22;
#elif UNITY_2021 || UNITY_2020_3
            VisualElement textInput = field.ElementAt(0); // textNK
            textInput.style.fontSize = 22;
#endif
            textInput.style.height = 33;
            textInput.style.unityTextAlign = TextAnchor.MiddleCenter;
            field.value = variableName;

            // 노드 VisualElement에 TextField 추가
            // 참고: 이것은 TryGetTextField에 있는 것과 일치해야 합니다.
            node.Insert(1, field);

            return field;
        }

        /// <summary>
        /// 노드 포트 타입을 설정합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <param name="portType"></param>
        private static void SetNodePortType(Node node, NodePortType portType)
        {
            bool isRegisterNode = (node.title.Equals("Register Variable"));

            UQueryState<Port> inputPorts = GetInputPorts(node);
            UQueryState<Port> outputPorts = GetOutputPorts(node);

            NodePortType currentPortType = GetNodePortType(node);
            bool typeChanged = (currentPortType != portType);

            Port inputVector = inputPorts.AtIndex(0);
            Port inputFloat = inputPorts.AtIndex(1);
            Port outputVector = outputPorts.AtIndex(0);
            Port outputFloat = outputPorts.AtIndex(1);

            // Hide Ports
            HideInputPort(inputVector);
            HideInputPort(inputFloat);
            HideOutputPort(outputVector);
            HideOutputPort(outputFloat);

            switch (portType)
            {
                // 포트 표시(Get Variable 노드 및 typeChanged인 경우 출력을 "활성" 포트로 이동)
                case NodePortType.Vector4 when isRegisterNode:
                    ShowInputPort(inputVector);
                    break;
                case NodePortType.Vector4:
                {
                    ShowOutputPort(outputVector);
                    if (typeChanged) MoveAllOutputs(outputFloat, outputVector);
                    break;
                }
                case NodePortType.Float when isRegisterNode:
                    ShowInputPort(inputFloat);
                    break;
                case NodePortType.Float:
                {
                    ShowOutputPort(outputFloat);
                    if (typeChanged) MoveAllOutputs(outputVector, outputFloat);
                    break;
                }
            }

            if (!isRegisterNode || !typeChanged) return;
            // 변수 가져오기 노드에 다시 연결
            List<Node> nodes = LinkToAllGetVariableNodes(GetSerializedVariableKey(node).ToUpper(), node);

            foreach (Node n in nodes)
                SetNodePortType(n, portType);
        }

        /// <summary>
        /// 변수 등록 노드에서 사용하여 그래프의 모든 변수 가져오기 노드에 연결합니다.
        /// </summary>
        private static List<Node> LinkToAllGetVariableNodes(string key, Node registerNode)
        {
            List<Node> linkedNodes = new List<Node>();

            void NodeAction(Node n)
            {
                if (!n.title.Equals("Get Variable")) return;
                string key2 = GetSerializedVariableKey(n).ToUpper();
                if (key != key2) return;
                LinkRegisterToGetVariableNode(registerNode, n);
                linkedNodes.Add(n);
            }

            _graphView.nodes.ForEach(NodeAction);
            ValidateGraph();
            return linkedNodes;
        }

        /// <summary>
        /// MaterialSlot 유형의 문자열을 반환합니다(예: "UnityEditor.ShaderGraph.Vector1MaterialSlot").
        /// </summary>
        private static string GetPortType(Port port)
        {
            string type = (string)port.userData;
            if (type != null) return type;
            // userData에 캐시하므로 다음에 포트가 사용되면 다시 가져올 필요가 없습니다.
            // (하지만 실행 취소가 발생하면 재설정됩니다)
            type = GetMaterialSlotTypeReflection(port);
            port.userData = type;

            return type;
        }

        /// <summary>
        /// 노드 포트 타입을 반환합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static NodePortType GetNodePortType(Node node)
        {
            bool isRegisterNode = node.title.Equals("Register Variable");

            UQueryState<Port> inputPorts = GetInputPorts(node);
            UQueryState<Port> outputPorts = GetOutputPorts(node);

            NodePortType currentPortType = NodePortType.Vector4;

            // Hide Inputs
            Port inputVector = inputPorts.AtIndex(0);
            Port inputFloat = inputPorts.AtIndex(1);
            Port outputVector = outputPorts.AtIndex(0);
            Port outputFloat = outputPorts.AtIndex(1);

            if (isRegisterNode)
            {
                if (!IsPortHidden(inputVector))
                    currentPortType = NodePortType.Vector4;
                else if (!IsPortHidden(inputFloat))
                    currentPortType = NodePortType.Float;
            }
            else
            {
                if (!IsPortHidden(outputVector))

                    currentPortType = NodePortType.Vector4;

                else if (!IsPortHidden(outputFloat))

                    currentPortType = NodePortType.Float;
            }

            return currentPortType;
        }

        /// <summary>
        /// 연결된 포트를 반환합니다.
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        private static Port GetConnectedPort(Port port)
        {
            return (from edge in port.connections
                where edge.parent != null
                let input = edge.input
                let output = edge.output
                select output == port ? input : output).FirstOrDefault();
        }

        /// <summary>
        /// 2개의 포트를 연결합니다.
        /// </summary>
        private static void Connect(Port a, Port b, bool noValidate = false)
        {
            foreach (Edge bEdge in b.connections)
            foreach (Edge aEdge in a.connections)
                if (aEdge == bEdge)
                    // 노드가 이미 연결되어 있습니다!
                    return;

            // 이것은 포트를 시각적으로 연결하지만 SG는 나중에 이것을 처리하는 것 같습니다.
            // 그래서 이것을 사용하면 우리가 원하지 않는 중복 가장자리가 생성됩니다.
            //가장자리 가장자리 = a.ConnectTo(b);

            // 그러나 Reflection 메서드에는 전달된 가장자리가 필요하므로 더미를 생성할 것입니다.
            Edge edge = new Edge()
            {
                output = a,
                input = b
            };

            // 이것은 셰이더 그래프 데이터 측면에서 포트를 연결합니다.
            object sgEdge = ConnectReflection(edge, noValidate);
            if (sgEdge == null)
            {
                ShowValidationError(edge.input.node, "Failed to Get Variable! Did you create a loop?");
                // 변수 등록 노드가 여기에서 부동 유형인 경우 미리보기가 올바르지 않을 수도 있습니다.
            }
        }

        /// <summary>
        /// 변수 사전에 (newValue, node)를 추가합니다. 올바른 노드를 편집하는 경우 이전 값을 제거합니다.
        /// </summary>
        /// <summary>
        /// Out포트를 반환합니다.
        /// </summary>
        /// <param name="newValue"></param>
        /// <param name="node"></param>
        /// <param name="previousValue"></param>
        /// <returns></returns>
        private static void Register(string previousValue, string newValue, Node node)
        {
            ResizeNodeToFitText(node, newValue);

            previousValue = previousValue.Trim().ToUpper();
            newValue = newValue.Trim();
            string key = newValue.ToUpper();

            bool previousKey = !previousValue.Equals("");
            bool newKey = !key.Equals("");

            // 사전에서 이전 키 제거(저장된 올바른 노드인 경우)
            Node n;
            if (previousKey)
                if (Variables.TryGetValue(previousValue, out n))
                    if (n == node)
                        Variables.Remove(previousValue);

            if (Variables.TryGetValue(key, out n))
            {
                // 이미 키가 포함되어 있습니다. 동일한 노드였습니까? (예를 들어 "a"에서 "A"로 대소문자를 변경하면 여전히 트리거됨)
                if (node == n)
                {
                    // 같은 노드. 새 값을 직렬화하고 반환합니다.
                    SetSerializedVariableKey(node, newValue);
                    return;
                }

                if (n?.userData == null)
                    Variables.Remove(key);
                else
                {
                    ShowValidationError(node, "변수 키가 이미 사용 중입니다!");

                    SetSerializedVariableKey(node, "");
                    return;
                }
            }
            else
                ClearErrorsForNode(node);

            // 사전에 새 키 추가
            if (newKey)
                Variables.Add(key, node);

            // 키 직렬화 허용(대문자 버전이 아닌 사용자 입력)
            SetSerializedVariableKey(node, newValue);

            UQueryState<Port> outputPorts = GetOutputPorts(node);
            if (previousKey)
            {
                // 값이 변경되면 출력 에지를 분리하십시오.
                // 그러나 먼저 변수 가져오기 노드 유형을 Vector4 기본값으로 다시 변경하십시오.
                Port outputPort =
                    outputPorts.AtIndex(0); //(모든 포트가 연결되어야 하므로 우리가 사용하는 포트는 중요하지 않습니다)
                foreach (Edge edge in outputPort.connections)
                    if (edge.input != null && edge.input.node != null)
                        SetNodePortType(edge.input.node, NodePortType.Vector4);

                DisconnectAllOutputs(node);
            }

            // 'Get Variable' 노드가 키를 사용 중인지 확인하고 연결합니다.
            if (!newKey) return;

            NodePortType portType = GetNodePortType(node);
            List<Node> nodes = LinkToAllGetVariableNodes(key, node);

            foreach (Node n2 in nodes)
                SetNodePortType(n2, portType); // outputPort
        }

        /// <summary>
        /// 입력 포트를 반환합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static UQueryState<Port> GetInputPorts(Node node)
        {
            // 작은 최적화로 UQueryState<Port>를 userData에 저장합니다.
            object userData = node.inputContainer.userData;
            if (userData != null) return (UQueryState<Port>)userData;
            UQueryState<Port> inputPorts = node.inputContainer.Query<Port>().Build();
            node.inputContainer.userData = inputPorts;
            inputPorts.ForEach(port => { port.userData = GetMaterialSlotTypeReflection(port); });
            return inputPorts;
        }

        /// <summary>
        /// 출력 포트를 반환합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static UQueryState<Port> GetOutputPorts(Node node)
        {
            // 작은 최적화로 UQueryState<Port>를 userData에 저장합니다.
            object userData = node.outputContainer.userData;
            if (userData != null) return (UQueryState<Port>)userData;

            UQueryState<Port> outputPorts = node.outputContainer.Query<Port>().Build();
            node.outputContainer.userData = outputPorts;
            outputPorts.ForEach(port => { port.userData = GetMaterialSlotTypeReflection(port); });
            return outputPorts;
        }

        /// <summary>
        /// 오류를 표시합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <param name="text"></param>
        private static void ShowValidationError(VisualElement node, string text)
        {
            if (_objectIdProperty == null)
                _objectIdProperty = _abstractMaterialNodeType.GetProperty("objectId", BindingFlags);
            if (_addValidationError == null)
                _addValidationError = _graphDataType.GetMethod("AddValidationError");

            object materialNode = NodeToMaterialNode(node);

            if (_objectIdProperty == null) return;
            object objectId = _objectIdProperty.GetValue(materialNode);

            if (_addValidationError != null)
                _addValidationError.Invoke(_graphData, new[]
                {
                    objectId, text, ShaderCompilerMessageSeverity.Error
                });
        }

        /// <summary>
        /// 연결 리플랙션
        /// </summary>
        /// <param name="edge"></param>
        /// <param name="noValidate"></param>
        /// <returns></returns>
        private static object ConnectReflection(Edge edge, bool noValidate)
        {
            if (_connectMethod == null)
                _connectMethod = _graphDataType.GetMethod("Connect");
            if (_connectNoValidateMethod == null)
                _connectNoValidateMethod = _graphDataType.GetMethod("ConnectNoValidate", BindingFlags);

            MethodInfo method = noValidate ? _connectNoValidateMethod : _connectMethod;
            object sgEdge = method?.Invoke(_graphData, new[]
            {
                GetSlotReference(GetMaterialSlot(edge.output)),
                GetSlotReference(GetMaterialSlot(edge.input))
            });
            edge.userData = sgEdge;
            return sgEdge;
        }

        /// <summary>
        /// 노드의 모든 출력 포트에서 모든 엣지의 연결을 끊습니다.
        /// </summary>
        private static void DisconnectAllOutputs(Node node)
        {
            UQueryState<Port> outputPorts = GetOutputPorts(node);
            outputPorts.ForEach(port => { DisconnectAllEdges(node, port); });
        }

        /// <summary>
        /// 포트의 OnConnect 및 OnDisconnect 대리자에 등록
        /// </summary>
        private static void RegisterPortDelegates(Port port, Action<Port> connect, Action<Port> disconnect)
        {
            // internal Action<Port> OnConnect / OnDisconnect;
            if (_onConnectField == null)
                _onConnectField = typeof(Port).GetField("OnConnect", BindingFlags);
            if (_onDisconnectField == null)
                _onDisconnectField = typeof(Port).GetField("OnDisconnect", BindingFlags);

            if (_onConnectField == null) return;
            Action<Port> onConnect = (Action<Port>)_onConnectField.GetValue(port);

            if (_onDisconnectField == null) return;
            Action<Port> onDisconnect = (Action<Port>)_onDisconnectField.GetValue(port);

            _onConnectField.SetValue(port, onConnect + connect);
            _onDisconnectField.SetValue(port, onDisconnect + disconnect);
        }

        /// <summary>
        /// 변수 사전에서 변수를 가져오고 변수 가져오기 노드를 저장된 변수 등록 노드에 연결합니다.
        /// </summary>
        private static void Get(string key, Node node)
        {
            ResizeNodeToFitText(node, key);
            key = key.Trim();

            // 키 직렬화 허용
            SetSerializedVariableKey(node, key);

            // 사전은 항상 대문자 버전의 키를 사용합니다.
            key = key.ToUpper();

            if (Variables.TryGetValue(key, out Node varNode))
            {
                //변수 가져오기 노드가 변수 등록 유형과 일치하는지 확인
                SetNodePortType(node, GetNodePortType(varNode));

                // 링크, 변수 등록 > 변수 가져오기
                DisconnectAllInputs(node);
                LinkRegisterToGetVariableNode(varNode, node);
                ValidateGraph();
            }
            else
            {
                // 키가 존재하지 않습니다. 입력이 있으면 연결을 끊으십시오.
                DisconnectAllInputs(node);

                // 기본값은 Vector4 입력입니다.
                SetNodePortType(node, NodePortType.Vector4);
            }
        }

        /// <summary>
        /// Register Variable 노드의 각 출력 포트를 Get Variable 노드의 입력에 연결합니다
        /// </summary>
        private static void LinkRegisterToGetVariableNode(Node registerNode, Node getNode)
        {
            UQueryState<Port> outputPorts = GetOutputPorts(registerNode);
            UQueryState<Port> inputPorts = GetInputPorts(getNode);
            const int portCount = 2;

            // 포트가 변경되면 업데이트해야 합니다.
            // 이것은 SubGraph가 항상 동일한 수의 입력 출력 포트를 가지고 있다고 가정합니다.
            // 두 노드의 순서는 연결을 허용하는 유형과 일치합니다.
            for (int i = 0; i < portCount; i++)
            {
                Port outputPort = outputPorts.AtIndex(i);
                Port inputPort = inputPorts.AtIndex(i);
                Connect(outputPort, inputPort, true);
            }
        }

        /// <summary>
        /// 노드의 모든 입력 포트에서 모든 엣지의 연결을 끊습니다.
        /// </summary>
        private static void DisconnectAllInputs(Node node)
        {
            UQueryState<Port> inputPorts = GetInputPorts(node);
            inputPorts.ForEach(port => { DisconnectAllEdges(node, port); });
        }

        /// <summary>
        /// VariableKey를 시리얼라이즈 합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <param name="key"></param>
        /// <exception cref="ArgumentNullException"></exception>
        private static void SetSerializedVariableKey(Node node, string key)
        {
            if (node == null) throw new ArgumentNullException(nameof(node));
            object materialNode = NodeToMaterialNode(node);
            SetSerializedValues(materialNode, new[] { key });
        }

        /// <summary>
        /// 시리얼라이즈 된 VariableKey를 반환합니다. 
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        private static string GetSerializedVariableKey(VisualElement node)
        {
            object materialNode = NodeToMaterialNode(node);
            if (materialNode == null) return "";
            string[] synonyms = GetSerializedValues(materialNode);

            if (synonyms != null && synonyms.Length > 0)
                return synonyms[0];

            return "";
        }

        /// <summary>
        /// GraphView.Node(비주얼에 사용)에서 실제 셰이더 그래프 노드(AbstractMaterialNode를 상속하는 유형)로 변환합니다.
        /// </summary>
        private static object NodeToMaterialNode(VisualElement node) => node.userData;

        /// <summary>
        /// 동의어에 저장된 값을 설정합니다. 입력은 NodeSGMaterialNode(노드)여야 합니다.
        /// </summary>
        private static void SetSerializedValues(object materialNode, IEnumerable values)
        {
            if (_synonymsField == null) _synonymsField = _abstractMaterialNodeType.GetField("synonyms");
            _synonymsField.SetValue(materialNode, values);
        }

        /// <summary>
        /// 노드에 작성된 텍스트 사이즈를 재정의 합니다.
        /// </summary>
        /// <param name="node"></param>
        /// <param name="s"></param>
        private static void ResizeNodeToFitText(VisualElement node, string s)
        {
            if (InterFont == null)
                node.style.minWidth = 250;
            else
            {
                InterFont.RequestCharactersInTexture(s);
                float width = 0;
                foreach (char c in s)
                    if (InterFont.GetCharacterInfo(c, out CharacterInfo info))
                        width += info.glyphWidth + info.advance;

                node.style.minWidth = width + 42; // margins/padding
            }

            node.MarkDirtyRepaint();
        }

        /// <summary>
        /// 등록된 노드의 입력포트를 연결합니다.
        /// </summary>
        /// <param name="port"></param>
        private static void OnRegisterNodeInputPortConnected(Port port)
        {
            if (IsPortHidden(port)) return; // 숨겨진 경우 연결 무시(무한 루프 방지에도 사용됨)

            // 슬프게도 여기에서 연결을 직접 편집할 수 없는 것 같습니다.
            // SG가 컬렉션을 반복하는 동안 컬렉션이 수정되어 오류가 발생합니다.
            // 이를 방지하기 위해 목록에 포트를 할당하고 EditorApplication.update 중에 확인합니다.
            // 그러나 이 지연된 작업으로 인해 가장자리에 약간의 결함이 발생합니다.
            EditedPorts.Add(port);
        }

        /// <summary>
        /// 등록된 노드의 입력포트를 끊습니다.
        /// </summary>
        /// <param name="port"></param>
        private static void OnRegisterNodeInputPortDisconnected(Port port)
        {
            if (IsPortHidden(port)) return; // 숨겨진 경우 연결 무시(무한 루프 방지에도 사용됨)

            EditedPorts.Add(port);
        }

        /// <summary>
        /// 활성화된 포트를 가져옵니다.
        /// </summary>
        /// <param name="ports"></param>
        /// <returns></returns>
        private static Port GetActivePort(UQueryState<Port> ports)
        {
            List<Port> portsList = ports.ToList();
            return portsList.FirstOrDefault(p => !IsPortHidden(p));
        }

        /// <summary>
        /// 포트가 숨겨져있으면 true, 아니면 false를 반환
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        private static bool IsPortHidden(VisualElement port) =>
            port.style.display == DisplayStyle.None || port.parent.style.display == DisplayStyle.None;

        /// <summary>
        /// 마테리얼 슬롯을 반환합니다.
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        private static object GetMaterialSlot(Port port)
        {
            // ShaderPort -> MaterialSlot "슬롯"
            if (_shaderPortSlotProperty == null) _shaderPortSlotProperty = port.GetType().GetProperty("slot");
            return _shaderPortSlotProperty?.GetValue(port);
        }

        /// <summary>
        /// 마테리얼 슬롯 타입을 리플랙션합니다.
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        private static string GetMaterialSlotTypeReflection(Port port) => GetMaterialSlot(port).GetType().ToString();

        /// <summary>
        /// 해당 엘리먼츠를 안보이게 합니다.
        /// </summary>
        /// <param name="visualElement"></param>
        private static void HideElement(VisualElement visualElement) => visualElement.style.display = DisplayStyle.None;

        /// <summary>
        /// 해당 엘리먼츠를 보이게 합니다.
        /// </summary>
        /// <param name="visualElement"></param>
        private static void ShowElement(VisualElement visualElement) => visualElement.style.display = DisplayStyle.Flex;

        /// <summary>
        /// 해당 인풋 포트를 숨깁니다.
        /// </summary>
        /// <param name="port"></param>
        private static void HideInputPort(VisualElement port) => HideElement(port.parent);

        /// <summary>
        /// 아웃포트를 숨깁니다.
        /// </summary>
        /// <param name="port"></param>
        private static void HideOutputPort(VisualElement port) => HideElement(port);

        /// <summary>
        /// 입력 포트를 보이게 합니다.
        /// </summary>
        /// <param name="port"></param>
        private static void ShowInputPort(VisualElement port) => ShowElement(port.parent);

        /// <summary>
        /// 아웃 포트를 보이게 합니다.
        /// </summary>
        /// <param name="port"></param>
        private static void ShowOutputPort(VisualElement port) => ShowElement(port);

        private static void ClearErrorsForNode(VisualElement node)
        {
            if (_clearErrorsForNode == null)
                _clearErrorsForNode = _graphDataType.GetMethod("ClearErrorsForNode");

            object materialNode = NodeToMaterialNode(node);
            if (_clearErrorsForNode != null) _clearErrorsForNode.Invoke(_graphData, new[] { materialNode });
        }

        #endregion

        #region ScreenShot

#if SHADER_GRAPH_HOTKEY
        /// <summary>
        /// 픽셀을 png로 저장
        /// </summary>
        private static void Save(int width, int height, Color[] pixels, string name)
        {
            RenderTexture cash = RenderTexture.active;
            RenderTexture.active = null;

            Texture2D screenshotTex2D = new Texture2D(width, height, TextureFormat.RGB24, false);
            screenshotTex2D.SetPixels(pixels);
            screenshotTex2D.Apply();

            byte[] bytes = screenshotTex2D.EncodeToPNG();

            RenderTexture.active = cash;

            DestroyImmediate(screenshotTex2D, true);

            string imagePath = Application.dataPath + SavePath;

            //해당 경로에 폴더를 만듭니다.
            Directory.CreateDirectory(imagePath);

            //유니크한 이름으로 처리
            string path = GetUniquePathName(name);

            File.WriteAllBytes(path, bytes);

            RenderTexture.active = cash;

            Debug.Log(Application.systemLanguage == SystemLanguage.Korean
                ? $"{path}에 이미지가 저장되었습니다."
                : $"The image has been saved to {path}.");
            AssetDatabase.Refresh();

            //파일을 가져옵니다.
            TextureImporter importer = AssetImporter.GetAtPath(path) as TextureImporter;

            //못가져오면 Pass
            if (importer == null) return;

            //디폴트 텍스쳐로 변경
            importer.textureType = TextureImporterType.Default;

            //적용
            AssetDatabase.WriteImportSettingsIfDirty(path);

            //해당 오브젝트 트랙킹
            Selection.activeObject = importer;
            EditorGUIUtility.PingObject(importer);
        }

        /// <summary>
        /// 유니크한 파일 이름을 반환합니다.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        private static string GetUniquePathName(string name)
        {
            string path = $"Assets{SavePath}/{name}.png";
            int i = 0;
            while (File.Exists(path))
            {
                path = $"Assets{SavePath}/{name}{i:000}.png";
                i++;
            }

            return path;
        }

        /// <summary>
        /// GraphToPng 프로세스를 시작합니다.
        /// </summary>
        private static void StartShaderGraphToPng(string filename, EditorWindow shaderGraphWindow)
        {
            _shaderGraphWindow = shaderGraphWindow;
            _filename = filename;
            _isProcessing = true;
            EditorApplication.update += EditorUpdate;
            _progressID = Progress.Start("Running one task", parentId: 0);
        }

        /// <summary> 
        /// GraphToPng 프로세스를 중지합니다.
        /// 이것은 완료되면 자동으로 수행되지만 아마도 이것을 인터럽트하는 데 사용할 수도 있습니다.
        /// </summary>
        private static void StopShaderGraphToPng()
        {
            EditorApplication.update -= EditorUpdate;
            _isProcessing = false;
            _processingEnumerator = null;
            Progress.Remove(_progressID);
        }

        private static void EditorUpdate()
        {
            _processingEnumerator ??= DoShaderGraphToPng();

            float t = 0.01f;
            if (_processingEnumerator.Current is float current)
                t = Mathf.Max(t, current);

            if (_lastTime + t < Time.realtimeSinceStartup)
            {
                _lastTime = Time.realtimeSinceStartup;
                _isProcessing = _processingEnumerator.MoveNext();
            }

            if (!_isProcessing)
                StopShaderGraphToPng(); //이 함수가 다시 호출되지 않도록 하고 창을 닫습니다.
        }

        /// <summary>
        /// 위의 EditorUpdate 함수에 의해 호출되는 주요 함수.
        /// 확대하고 셰이더 그래프 주위를 이동하여 각 타일에 대한 스크린샷을 찍습니다.
        /// 그런 다음 함께 꿰매고 PNG로 저장합니다.
        /// </summary>
        private static IEnumerator DoShaderGraphToPng()
        {
            FieldInfo userViewSettingsField = _graphEditorViewType.GetField("m_UserViewSettings", BindingFlags);
            object userViewSettings = userViewSettingsField?.GetValue(_graphEditorView);
            if (userViewSettings != null && _userViewSettingsType != null)
            {
                _userViewSettingsType.GetField("isBlackboardVisible", BindingFlags)?.SetValue(userViewSettings, false);
                _userViewSettingsType.GetField("isPreviewVisible", BindingFlags)?.SetValue(userViewSettings, false);
                _userViewSettingsType.GetField("isInspectorVisible", BindingFlags)?.SetValue(userViewSettings, false);

                _graphEditorViewType.GetMethod("UpdateSubWindowsVisibility", BindingFlags)
                    ?.Invoke(_graphEditorView, null);
            }

            //쉐이더 그래프의 뷰 사이즈를 가져옵니다.
            Rect windowScreenRect = _graphView.worldBound;

            //에디터 위치를 가져옵니다.
            windowScreenRect.position += _shaderGraphWindow.position.position;

            // 위치와 스케일 값을 가져온다.
            Vector3 originalPos = _graphView.viewTransform.position;
            Vector3 originalScale = _graphView.viewTransform.scale;

            // 왼쪽 상단 및 오른쪽 하단 위치 가져오기
            Matrix4x4 matrix = _graphView.viewTransform.matrix.inverse;
            Vector2 topLeftInGraphSpace = -matrix.MultiplyPoint(Vector2.zero);
            Vector2 bottomRightInGraphSpace = -matrix.MultiplyPoint(windowScreenRect.size);

            //쉐이더 그래프의 윈도우의 총 면적을 가져옵니다 -> 스크린 월드 기준
            Vector2Int graphTotalSizeInPixels = Vector2Int.FloorToInt(topLeftInGraphSpace - bottomRightInGraphSpace);
            Vector2Int pixelsPerTile = Vector2Int.FloorToInt(windowScreenRect.size);

            float x = graphTotalSizeInPixels.x / (float)pixelsPerTile.x;
            float y = graphTotalSizeInPixels.y / (float)pixelsPerTile.y;
            float xR = graphTotalSizeInPixels.x % (float)pixelsPerTile.x;
            float yR = graphTotalSizeInPixels.y % (float)pixelsPerTile.y;

            Vector2Int numberOfTiles = Vector2Int.CeilToInt(new Vector2(x, y));
            Vector2Int lastTileSize = Vector2Int.FloorToInt(new Vector2(xR, yR));

            if (lastTileSize.x == 0)
                lastTileSize.x = pixelsPerTile.x;
            if (lastTileSize.y == 0)
                lastTileSize.y = pixelsPerTile.y;

            Vector2 graphSpaceTileOffset = windowScreenRect.size;

            //스케일을 0으로 변경
            _graphView.viewTransform.scale = Vector3.one;

            //확대/축소 수준을 변경했을 때 최종 이미지에서 흐릿한 텍스트를 방지하기 위해 다시 칠합니다.
            _shaderGraphWindow.Repaint();
            yield return TimeBetweenScreenshots;

            // 컬러 사이즈 설정
            Color[] fullPixels = new Color[graphTotalSizeInPixels.x * graphTotalSizeInPixels.y];

            Vector2Int coordInFull = new Vector2Int(0, 0);

            int currentStep = 0;
            int total = numberOfTiles.x * numberOfTiles.y;

            for (int xTile = 0; xTile < numberOfTiles.x; xTile++)
            {
                Vector2Int tileSize = pixelsPerTile;

                if (xTile == numberOfTiles.x - 1)
                    tileSize.x = lastTileSize.x;

                for (int yTile = numberOfTiles.y - 1; yTile >= 0; yTile--)
                {
                    _graphView.viewTransform.position = topLeftInGraphSpace -
                                                        new Vector2(xTile * graphSpaceTileOffset.x,
                                                            yTile * graphSpaceTileOffset.y);

                    //현재 동작된 프로세스
                    currentStep++;

                    string msg = Application.systemLanguage == SystemLanguage.Korean
                        ? "스크린샷 캡쳐 중"
                        : "taking screenshot";

                    //프로세스 반영
                    Progress.Report(_progressID, currentStep, total, msg);

                    tileSize.y = yTile == numberOfTiles.y - 1 ? lastTileSize.y : pixelsPerTile.y;

                    windowScreenRect.size = tileSize;

                    //확대/축소 수준을 변경했을 때 최종 이미지에서 흐릿한 텍스트를 방지하기 위해 다시 칠합니다.
                    _shaderGraphWindow.Repaint();
                    yield return TimeBetweenScreenshots;

                    Color[] tilePixels = ReadScreenPixel(windowScreenRect);

                    StitchTiles(tilePixels, tileSize, fullPixels, coordInFull, graphTotalSizeInPixels);

                    coordInFull.y += tileSize.y;
                }

                coordInFull.x += tileSize.x;
                coordInFull.y = 0;
            }

            //Progress.Report(ProgressID, 50,100,"스크린샷 처리 중");
            //저장
            Save(graphTotalSizeInPixels.x, graphTotalSizeInPixels.y, fullPixels, _filename.Replace("*", ""));

            // 보기를 원래 상태로 재설정
            _graphView.viewTransform.position = originalPos;
            _graphView.viewTransform.scale = originalScale;
            _shaderGraphWindow.Repaint();
            StopShaderGraphToPng();
        }

        /// <summary>
        /// 타일을 늘리는 작업합니다.
        /// </summary>
        /// <param name="pixels"></param>
        /// <param name="size"></param>
        /// <param name="fullPixels"></param>
        /// <param name="position"></param>
        /// <param name="fullSize"></param>
        private static void StitchTiles(IReadOnlyList<Color> pixels, Vector2Int size, IList<Color> fullPixels,
            Vector2Int position,
            Vector2Int fullSize)
        {
            if (fullPixels.Count != fullSize.x * fullSize.y)
            {
                Debug.Log(Application.systemLanguage == SystemLanguage.Korean
                    ? "크기 불일치 - 배열에 추가가 sizeOfFinal에 ==가 아닙니다."
                    : "Size mismatch - append to array is not == to sizeOfFinal.");
            }

            if (pixels.Count != size.x * size.y)
            {
                Debug.Log(Application.systemLanguage == SystemLanguage.Korean
                    ? "크기 불일치 - 추가된 배열이 addedPixelsSize에 ==가 아닙니다."
                    : "Size mismatch - added array is not == for addedPixelsSize.");
            }

            for (int y = 0; y < size.y; y++)
            {
                for (int x = 0; x < size.x; x++)
                {
                    Vector2Int coordInFinal = new Vector2Int(x + position.x, y + position.y);

                    // 픽셀이 최종 이미지 경계 밖에 있는 경우 픽셀을 무시합니다.
                    if (coordInFinal.x < 0 || coordInFinal.y < 0 ||
                        coordInFinal.x > fullSize.x || coordInFinal.y > fullSize.y)
                        continue;

                    int pixelIndex = y * size.x + x;
                    int fullIndex = coordInFinal.y * fullSize.x + coordInFinal.x;

                    if (fullIndex < fullPixels.Count && pixelIndex < pixels.Count)
                        fullPixels[fullIndex] = pixels[pixelIndex];
                }
            }
        }

        /// <summary>
        /// 스크린 픽셀을 반환합니다.
        /// </summary>
        /// <param name="rectToRead"></param>
        /// <returns></returns>
        private static Color[] ReadScreenPixel(Rect rectToRead) =>
            InternalEditorUtility.ReadScreenPixel(rectToRead.position, (int)rectToRead.width,
                (int)rectToRead.height);
#endif

        #endregion
    }
}
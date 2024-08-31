#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

namespace ShaderGraphHotKey
{
#if SHADER_GRAPH_HOTKEY
    [CustomEditor(typeof(NodeManager))]
    public class HintApply : Editor
    {
        public override void OnInspectorGUI()
        {
            NodeManager no = (NodeManager) target;

            base.OnInspectorGUI();

            string InText = string.Empty;

            InText = Application.systemLanguage == SystemLanguage.Korean ? "새로고침" : "Refresh";

            GUI.enabled = no.change;
            if (GUILayout.Button(InText))
            {
                ShaderGraphProcess.HintOverride();
                no.change = false;

                Debug.Log(Application.systemLanguage == SystemLanguage.Korean ? "힌트 업데이트 완료" : "Hint update completed");
            }

            GUI.enabled = true;
        }
    }
#endif
}
#endif
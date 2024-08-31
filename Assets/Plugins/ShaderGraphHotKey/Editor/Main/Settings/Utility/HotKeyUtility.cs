#if UNITY_EDITOR
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace NKStudio.ShaderGraph.HotKey
{
    public class HotKeyUtility
    {
        private const string HotKeyDefine = "SHADER_GRAPH_HOTKEY";

        /// <summary>
        /// 쉐이더 그래프를 가지고 있으면 true,아니면 false
        /// </summary>
        /// <returns></returns>
        public static bool HasShaderGraph()
        {
#if ENABLE_SHADERGRAPH
            return true;
#else
            return false;
#endif
        }
        
        /// <summary>
        /// 디파인을 설치합니다.
        /// </summary>
        public static void InstallDefine()
        {
            if (HasHotKeyDefine())
            {
                Debug.LogWarning(Application.systemLanguage == SystemLanguage.Korean
                    ? "이미 디파인이 적용되어 있습니다."
                    : "Define already applied.");

                return;
            }

            string defines =
                PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

            if (defines.Contains(HotKeyDefine)) return;

            string addHotKeyDefineToCurrentDefine = string.Concat(defines, ";", HotKeyDefine);
            PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup,
                addHotKeyDefineToCurrentDefine);
        }

        /// <summary>
        /// 쉐이더 그래프 디파인을 제거합니다.
        /// </summary>
        public static void RemoveDefine()
        {
            string defines =
                PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

            string removeHotKeyDefineToCurrentDefine = defines.Replace(HotKeyDefine, "");
            PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup,
                removeHotKeyDefineToCurrentDefine);
        }
        
        /// <summary>
        /// 핫키 디파인을 가지고 있으면 True,아니면 false
        /// </summary>
        /// <returns></returns>
        public static bool HasHotKeyDefine()
        {
#if SHADER_GRAPH_HOTKEY
            return true;
#else
            return false;
#endif
        }
    }
}
#endif
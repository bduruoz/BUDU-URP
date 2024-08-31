#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

namespace Plugins.ShaderGraphHotKey.About
{
    public class SGHKAbout : EditorWindow
    {
        [SerializeField]
        private VisualTreeAsset AboutAsset;
        
        [MenuItem("Window/ShaderGraph HotKey/About")]
        public static void ShowExample()
        {
            SGHKAbout wnd = GetWindow<SGHKAbout>();
            wnd.titleContent = new GUIContent("About");
            wnd.minSize = new Vector2(350, 120);
            wnd.maxSize = new Vector2(350, 120);
        }

        public void CreateGUI()
        {
            if (!AboutAsset) return;
            VisualElement root = rootVisualElement;

            // Import UXML
            VisualElement container = AboutAsset.Instantiate();
            root.Add(container);
        }
    }
}
#endif
// BUDU Games 2024 - 2025
using UnityEngine;
using UnityEditor;
using System.IO;
using System.Linq;

public class SelectionSetWindow : EditorWindow
{
    private const string FolderPath = "Assets/_Main/Temp/Sel";
    private Vector2 scroll;

    [MenuItem("BUDU-Tools/Selections/Manager")]
    public static void Open()
    {
        GetWindow<SelectionSetWindow>("Selection Sets");
    }

    void OnGUI()
    {
        GUILayout.Space(5);

        if (GUILayout.Button("💾 Save Current Selection"))
        {
            SaveSelection();
        }

        if (GUILayout.Button("🗑 Clear All Sets"))
        {
            ClearAllSets();
        }

        GUILayout.Space(10);
        GUILayout.Label("Saved Sets", EditorStyles.boldLabel);

        if (!Directory.Exists(FolderPath))
        {
            EditorGUILayout.HelpBox("No Selection Set folder found.", MessageType.Info);
            return;
        }

        var guids = AssetDatabase.FindAssets("t:SelectionSet", new[] { FolderPath });
        scroll = GUILayout.BeginScrollView(scroll);

        foreach (var guid in guids)
        {
            string assetPath = AssetDatabase.GUIDToAssetPath(guid);
            var set = AssetDatabase.LoadAssetAtPath<SelectionSet>(assetPath);
            if (set == null) continue;

            GUILayout.BeginHorizontal();
            if (GUILayout.Button(set.name, GUILayout.Width(200)))
            {
                Selection.objects = set.objects.Where(o => o != null).ToArray();
            }
            if (GUILayout.Button("✏", GUILayout.Width(30)))
            {
                EditorGUIUtility.PingObject(set);
                Selection.activeObject = set;
            }
            GUILayout.EndHorizontal();
        }

        GUILayout.EndScrollView();
    }

    private void SaveSelection()
    {
        if (!Directory.Exists(FolderPath))
            Directory.CreateDirectory(FolderPath);

        string path = EditorUtility.SaveFilePanelInProject(
            "Save Selection Set",
            "SelectionSet",
            "asset",
            "Please enter a file name for the selection set",
            FolderPath);

        if (string.IsNullOrEmpty(path))
            return;

        var set = ScriptableObject.CreateInstance<SelectionSet>();
        set.objects = Selection.gameObjects;
        AssetDatabase.CreateAsset(set, path);
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }

    private void ClearAllSets()
    {
        if (!Directory.Exists(FolderPath))
            return;

        var files = Directory.GetFiles(FolderPath, "*.asset", SearchOption.AllDirectories);
        foreach (var file in files)
        {
            AssetDatabase.DeleteAsset(file);
        }
        AssetDatabase.Refresh();
    }
}

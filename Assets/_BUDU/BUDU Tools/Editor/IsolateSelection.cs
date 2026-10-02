using UnityEditor;
using UnityEngine;

public static class SceneIsolateTool
{
    [MenuItem("BUDU-Tools/Isolate Selected #_i")]
    static void Isolate()
    {
        var svm = SceneVisibilityManager.instance;

        // Önce her þeyi görünür yap
        foreach (var go in Object.FindObjectsOfType<GameObject>())
        {
            svm.Show(go, true);
        }

        // Seçili olmayanlarý gizle
        foreach (var go in Object.FindObjectsOfType<GameObject>())
        {
            if (!Selection.Contains(go))
            {
                svm.Hide(go, true);
            }
        }
    }

    [MenuItem("BUDU-Tools/Unisolate All %#_i")]
    static void Unisolate()
    {
        var svm = SceneVisibilityManager.instance;

        foreach (var go in Object.FindObjectsOfType<GameObject>())
        {
            svm.Show(go, true);
        }
    }
}
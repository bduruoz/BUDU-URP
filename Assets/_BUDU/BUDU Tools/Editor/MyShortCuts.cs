// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEditor.ShortcutManagement;
using UnityEngine;

public static class MyShortcuts
{
    [Shortcut("Custom/Toggle Active", KeyCode.T, ShortcutModifiers.Action)] // Action = Ctrl on Windows
    public static void ToggleActive()
    {
        foreach (GameObject obj in Selection.gameObjects)
        {
            Undo.RecordObject(obj, "Toggle Active");
            obj.SetActive(!obj.activeSelf);
        }
    }
}

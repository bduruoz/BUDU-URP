// BUDU Games 2024 - 2025
using UnityEditor;

[CanEditMultipleObjects]
[CustomEditor(typeof(MaterialSelector))]
public class MaterialSelectorEditor : Editor
{
    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        // Material[] alanını çiz
        SerializedProperty materialsProp = serializedObject.FindProperty("materials");
        EditorGUILayout.PropertyField(materialsProp, true);

        // AnotherObject toggle
        SerializedProperty anotherObjectProp = serializedObject.FindProperty("AnotherObjects");
        EditorGUILayout.PropertyField(anotherObjectProp);

        // MatGroup sadece AnotherObject true ise görünür
        if (anotherObjectProp.boolValue)
        {
            SerializedProperty matGroupProp = serializedObject.FindProperty("MatGroups");
            EditorGUILayout.PropertyField(matGroupProp, true);
        }

        // Dropdown
        MaterialSelector firstTarget = (MaterialSelector)target;
        if (firstTarget.materials != null && firstTarget.materials.Length > 0)
        {
            string[] names = new string[firstTarget.materials.Length];
            for (int i = 0; i < firstTarget.materials.Length; i++)
            {
                names[i] = firstTarget.materials[i] != null ? firstTarget.materials[i].name : "(None)";
            }

            EditorGUI.BeginChangeCheck();
            int newIndex = EditorGUILayout.Popup("Select Material", firstTarget.selectedMatIndex, names);
            if (EditorGUI.EndChangeCheck())
            {
                foreach (var obj in targets)
                {
                    MaterialSelector ms = (MaterialSelector)obj;
                    Undo.RecordObject(ms, "Change Selected Material");
                    ms.selectedMatIndex = newIndex;
                    ms.ApplyMaterialToChildren();
                    EditorUtility.SetDirty(ms);
                }
            }
        }
        else
        {
            EditorGUILayout.HelpBox("Material list is empty.", MessageType.Info);
        }

        serializedObject.ApplyModifiedProperties();
    }
}

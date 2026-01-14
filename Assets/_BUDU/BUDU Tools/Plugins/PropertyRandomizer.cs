using System.Reflection;
using UnityEditor;
using UnityEngine;

[System.Serializable]
public class PropertyRandomizer
{
    public string componentName = "";
    public string propertyName = "";
    public float minValue = 0f;
    public float maxValue = 1f;
    public bool useInteger = false;

    public void ApplyRandomToSelection()
    {
        var selected = UnityEditor.Selection.gameObjects;
        if (selected == null || selected.Length == 0)
        {
            Debug.LogWarning("No GameObjects selected to randomize property.");
            return;
        }

        foreach (var go in selected)
        {
            var comp = go.GetComponent(componentName);
            if (comp == null)
            {
                Debug.LogWarning($"[{go.name}] does not have component '{componentName}'");
                continue;
            }

            float randomValue = Random.Range(minValue, maxValue);
            System.Type type = comp.GetType();

            // Önce property olarak bak
            PropertyInfo prop = type.GetProperty(propertyName, BindingFlags.Public | BindingFlags.Instance);
            if (prop != null && prop.CanWrite)
            {
                object valueToSet = GetConvertedValue(prop.PropertyType, randomValue, useInteger);
                if (valueToSet != null)
                {
                    Debug.Log("yapıyoz mu");
                    Undo.RecordObject(comp, "Randomize Property");
                    prop.SetValue(comp, valueToSet);
                    EditorUtility.SetDirty(comp);
                    continue;
                }
            }

            // Sonra field olarak bak
            FieldInfo field = type.GetField(propertyName, BindingFlags.Public | BindingFlags.Instance);
            if (field != null)
            {
                object valueToSet = GetConvertedValue(field.FieldType, randomValue, useInteger);
                if (valueToSet != null)
                {
                    Undo.RecordObject(comp, "Randomize Field");
                    field.SetValue(comp, valueToSet);
                    EditorUtility.SetDirty(comp); 
                    continue;
                }
            }

            Debug.LogWarning($"[{go.name}] -> '{componentName}' üzerinde '{propertyName}' bulunamadı veya tipi desteklenmiyor.");
        }
    }

    private object GetConvertedValue(System.Type type, float randomValue, bool useInt)
    {
        if (type == typeof(float)) return randomValue;
        if (type == typeof(int)) return useInt ? Mathf.RoundToInt(randomValue) : (int)randomValue;
        if (type == typeof(double)) return (double)randomValue;
        return null; // sadece float/int/double destekliyoruz
    }
}

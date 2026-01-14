// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEngine;

[CanEditMultipleObjects]
[CustomEditor(typeof(PrefabEmitter))]
public class PrefabEmitterEditor : Editor
{
    SerializedProperty startProp;
    SerializedProperty prefabToSpawnProp;
    SerializedProperty areaSizeProp;
    SerializedProperty useParentGroupProp;
    SerializedProperty parentNameProp;
    SerializedProperty secondParentProp;
    SerializedProperty sParentNameProp;
    SerializedProperty randomizeRotateProp;
    SerializedProperty minRotateProp;
    SerializedProperty maxRotateProp;
    SerializedProperty randomizeScaleProp;
    SerializedProperty scaleMultiplierProp;
    SerializedProperty scaleRangeProp;
    SerializedProperty freezer;
    SerializedProperty ForceProp;
    SerializedProperty forceModeProp;
    SerializedProperty forceDirectionProp;
    SerializedProperty forceStrengthProp;
    SerializedProperty emitModeProp;
    SerializedProperty spawnRateProp;
    SerializedProperty durationProp;
    SerializedProperty gridXProp;
    SerializedProperty gridYProp;
    SerializedProperty gridZProp;
    SerializedProperty gridEmitInterval;

    void OnEnable()
    {
        startProp = serializedObject.FindProperty("start");
        prefabToSpawnProp = serializedObject.FindProperty("prefabToSpawn");
        areaSizeProp = serializedObject.FindProperty("areaSize");
        useParentGroupProp = serializedObject.FindProperty("useParentGroup");
        parentNameProp = serializedObject.FindProperty("parentName");
        secondParentProp = serializedObject.FindProperty("secondParent");
        sParentNameProp = serializedObject.FindProperty("sParentName");
        randomizeRotateProp = serializedObject.FindProperty("randomizeRotate");
        minRotateProp = serializedObject.FindProperty("minRotate");
        maxRotateProp = serializedObject.FindProperty("maxRotate");
        randomizeScaleProp = serializedObject.FindProperty("randomizeScale");
        scaleMultiplierProp = serializedObject.FindProperty("scaleMultiplier");
        scaleRangeProp = serializedObject.FindProperty("scaleRange");
        freezer = serializedObject.FindProperty("freezer");
        ForceProp = serializedObject.FindProperty("Force");
        forceModeProp = serializedObject.FindProperty("forceMode");
        forceDirectionProp = serializedObject.FindProperty("forceDirection");
        forceStrengthProp = serializedObject.FindProperty("forceStrength");
        emitModeProp = serializedObject.FindProperty("emitMode");
        spawnRateProp = serializedObject.FindProperty("spawnRate");
        durationProp = serializedObject.FindProperty("duration");
        gridXProp = serializedObject.FindProperty("gridX");
        gridYProp = serializedObject.FindProperty("gridY");
        gridZProp = serializedObject.FindProperty("gridZ");
        gridEmitInterval = serializedObject.FindProperty("gridEmitInterval");
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();
        EditorGUILayout.PropertyField(startProp);
        EditorGUILayout.PropertyField(prefabToSpawnProp);
        EditorGUILayout.PropertyField(areaSizeProp);

        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(useParentGroupProp);
        if (useParentGroupProp.boolValue)
        {
            EditorGUILayout.PropertyField(parentNameProp);
            EditorGUILayout.PropertyField(secondParentProp);

            if(secondParentProp.boolValue)
            {
                EditorGUILayout.PropertyField(sParentNameProp);
            }
        }
        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(randomizeRotateProp);
        if (randomizeRotateProp.boolValue)
        {
            EditorGUILayout.PropertyField(minRotateProp);
            EditorGUILayout.PropertyField(maxRotateProp);
        }

        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(scaleMultiplierProp);
        EditorGUILayout.PropertyField(randomizeScaleProp);
        if (randomizeScaleProp.boolValue)
        {
            EditorGUILayout.PropertyField(scaleRangeProp);
        }

        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(freezer);

        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(ForceProp);
        if (ForceProp.boolValue)
        {
            EditorGUILayout.PropertyField(forceModeProp);
            EditorGUILayout.PropertyField(forceDirectionProp);
            EditorGUILayout.PropertyField(forceStrengthProp);
        }

        EditorGUIHelper.Separator();

        EditorGUILayout.PropertyField(emitModeProp);

        EditorGUILayout.PropertyField(durationProp);
        EditorGUILayout.PropertyField(spawnRateProp);
        if ((PrefabEmitter.EmitMode)emitModeProp.enumValueIndex == PrefabEmitter.EmitMode.Grid)
        {
            EditorGUILayout.LabelField("Grid Emit Settings", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(gridXProp);
            EditorGUILayout.PropertyField(gridYProp);
            EditorGUILayout.PropertyField(gridZProp);
            EditorGUILayout.Space();
            EditorGUILayout.PropertyField(gridEmitInterval);
        }

        serializedObject.ApplyModifiedProperties();
    }
}


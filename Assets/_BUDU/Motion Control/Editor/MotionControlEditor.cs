// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEngine;

[CanEditMultipleObjects]
[CustomEditor(typeof(MotionControl))]
public class MotionControlEditor : Editor
{
    // Foldout'lar
    private bool showPosition = true;
    private bool showRotation = true;
    private bool showScale = true;

    // Master Toggles
    private SerializedProperty positionEnabledProp;
    private SerializedProperty rotationEnabledProp;
    private SerializedProperty scaleEnabledProp;
    private SerializedProperty uniformScaleProp;
    private SerializedProperty updateInEditorProp;
    private SerializedProperty editorTimeScaleProp;

    // MotionData’lar (her eksen için)
    private SerializedProperty[] posAxes = new SerializedProperty[3];
    private SerializedProperty[] rotAxes = new SerializedProperty[3];
    private SerializedProperty[] sclAxes = new SerializedProperty[3];

    // Ortak MotionData alt property’leri
    private readonly string[] axisNames = { "positionX", "positionY", "positionZ",
                                             "rotationX", "rotationY", "rotationZ",
                                             "scaleX",    "scaleY",    "scaleZ" };

    private void OnEnable()
    {
        if (targets == null || targets.Length == 0 || targets[0] == null)
        {
            Debug.LogWarning("[MotionControlEditor] No valid targets – shutting down.");
            return;
        }

        foreach (var t in targets)
        {
            if (t == null || !(t is MotionControl))
            {
                Debug.LogWarning("[MotionControlEditor] Invalid target found – shutting down.");
                return;
            }
        }

        var first = targets[0] as MotionControl;
        if (!first) return;

        positionEnabledProp = serializedObject.FindProperty("positionEnabled");
        rotationEnabledProp = serializedObject.FindProperty("rotationEnabled");
        scaleEnabledProp = serializedObject.FindProperty("scaleEnabled");
        uniformScaleProp = serializedObject.FindProperty("uniformScale");
        updateInEditorProp = serializedObject.FindProperty("updateInEditor");
        editorTimeScaleProp = serializedObject.FindProperty("editorTimeScale");

        for (int i = 0; i < 3; i++)
        {
            posAxes[i] = serializedObject.FindProperty(axisNames[i]);
            rotAxes[i] = serializedObject.FindProperty(axisNames[i + 3]);
            sclAxes[i] = serializedObject.FindProperty(axisNames[i + 6]);
        }
    }

    public override void OnInspectorGUI()
    {
        if (targets == null || targets.Length == 0 || targets[0] == null)
            return;

        serializedObject.Update();

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Motion Control System", EditorStyles.boldLabel);
        EditorGUILayout.Space();

        // Editor Settings
        EditorGUILayout.BeginVertical(EditorStyles.helpBox);
        EditorGUILayout.LabelField("Editor Settings", EditorStyles.boldLabel);
        EditorGUILayout.PropertyField(updateInEditorProp);
        if (updateInEditorProp.boolValue)
            EditorGUILayout.PropertyField(editorTimeScaleProp);
        EditorGUILayout.EndVertical();

        EditorGUILayout.Space();

        // Reset Buttons
        if (GUILayout.Button("Reset Motion", GUILayout.Height(25)))
            foreach (var t in targets)
                (t as MotionControl)?.ResetToInitial();

        if (GUILayout.Button("Store Current as Initial", GUILayout.Height(25)))
            foreach (var t in targets)
                (t as MotionControl)?.StoreCurrentAsInitial();

        EditorGUILayout.Space();

        // Master Toggles
        EditorGUILayout.BeginVertical(EditorStyles.helpBox);
        EditorGUILayout.LabelField("Master Controls", EditorStyles.boldLabel);
        EditorGUILayout.BeginHorizontal();
        GUILayout.Space(10);
        DrawMasterToggle(positionEnabledProp, "Position");
        DrawMasterToggle(rotationEnabledProp, "Rotation");
        DrawMasterToggle(scaleEnabledProp, "Scale");
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();

        EditorGUILayout.Space();

        if (positionEnabledProp.boolValue)
            DrawSection("Position", ref showPosition, posAxes);

        if (rotationEnabledProp.boolValue)
            DrawSection("Rotation", ref showRotation, rotAxes);

        if (scaleEnabledProp.boolValue)
        {
            DrawSection("Scale", ref showScale, sclAxes);
            if (showScale)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(uniformScaleProp);
                EditorGUI.indentLevel--;
            }
        }

        serializedObject.ApplyModifiedProperties();
    }

    private void DrawMasterToggle(SerializedProperty prop, string label)
    {
        EditorGUILayout.BeginVertical(GUILayout.Width(EditorGUIUtility.currentViewWidth / 3 - 15));
        GUI.color = prop.boolValue ? Color.green : Color.gray;
        prop.boolValue = GUILayout.Toggle(prop.boolValue, label, GUILayout.Height(20));
        GUI.color = Color.white;
        EditorGUILayout.EndVertical();
    }

    private void DrawSection(string title, ref bool fold, SerializedProperty[] axes)
    {
        EditorGUILayout.BeginVertical(EditorStyles.helpBox);
        fold = EditorGUILayout.Foldout(fold, title, true, EditorStyles.foldoutHeader);
        if (fold)
        {
            EditorGUI.indentLevel++;
            string[] labels = { "X", "Y", "Z" };
            for (int i = 0; i < 3; i++)
            {
                DrawMotionData(labels[i], axes[i]);
                if (i < 2) EditorGUILayout.Space(3);
            }
            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }

    private void DrawMotionData(string axisName, SerializedProperty axis)
    {
        var enabledProp = axis.FindPropertyRelative("enabled");
        var speedEnProp = axis.FindPropertyRelative("speedEnabled");
        var speedProp = axis.FindPropertyRelative("speed");
        var typeProp = axis.FindPropertyRelative("motionType");
        var ampProp = axis.FindPropertyRelative("amplitude");
        var freqProp = axis.FindPropertyRelative("frequency");
        var phaseProp = axis.FindPropertyRelative("phaseOffset");
        var timeOffProp = axis.FindPropertyRelative("timeOffset");
        var centerProp = axis.FindPropertyRelative("centerOffset");
        var curveProp = axis.FindPropertyRelative("customCurve");

        EditorGUILayout.BeginVertical(EditorStyles.helpBox);
        EditorGUILayout.BeginHorizontal();
        GUI.color = enabledProp.boolValue ? Color.green : Color.gray;
        enabledProp.boolValue = EditorGUILayout.ToggleLeft($"{axisName} Axis", enabledProp.boolValue, EditorStyles.boldLabel);
        GUI.color = Color.white;
        EditorGUILayout.EndHorizontal();

        if (enabledProp.boolValue)
        {
            EditorGUI.indentLevel++;

            EditorGUILayout.BeginHorizontal();
            GUI.color = speedEnProp.boolValue ? Color.cyan : Color.gray;
            speedEnProp.boolValue = EditorGUILayout.Toggle("Speed", speedEnProp.boolValue, GUILayout.Width(80));
            GUI.color = Color.white;
            if (speedEnProp.boolValue)
                EditorGUILayout.PropertyField(speedProp, GUIContent.none);
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.PropertyField(typeProp, new GUIContent("Type"));
            EditorGUILayout.PropertyField(ampProp, new GUIContent("Amplitude"));

            EditorGUILayout.Slider(freqProp, 0.01f, 10f, new GUIContent("Frequency"));
            EditorGUILayout.Slider(phaseProp, -6.28f, 6.28f, new GUIContent("Phase"));
            EditorGUILayout.Slider(timeOffProp, -10f, 10f, new GUIContent("Time Offset"));
            EditorGUILayout.Slider(centerProp, -1f, 1f, new GUIContent("Center Offset"));

            if (typeProp.enumValueIndex == (int)MotionType.CustomCurve)
                EditorGUILayout.PropertyField(curveProp, new GUIContent("Curve"));

            EditorGUI.indentLevel--;
        }
        EditorGUILayout.EndVertical();
    }
}
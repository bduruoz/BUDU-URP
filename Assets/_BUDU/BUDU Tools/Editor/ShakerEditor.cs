// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(Shaker))]
public class ShakerEditor : Editor
{
    SerializedProperty blend2InitProp;

    void OnEnable()
    {
        blend2InitProp = serializedObject.FindProperty("blend2Init");
    }

    public override void OnInspectorGUI()
    {
        Shaker myTarget = (Shaker)target;

        // --- Master Control ---
        EditorGUILayout.LabelField("Master Control", EditorStyles.boldLabel);
        myTarget.enableEditorShake = EditorGUILayout.Toggle("Enable Editor Shake", myTarget.enableEditorShake);
        myTarget.enableShake = EditorGUILayout.Toggle("Enable Shake", myTarget.enableShake);
        myTarget.intensity = EditorGUILayout.Slider("Intensity", myTarget.intensity, 0f, 1f);

        serializedObject.Update();
        EditorGUILayout.PropertyField(blend2InitProp, new GUIContent("Blend To Initial"));
        serializedObject.ApplyModifiedProperties();

        if (GUILayout.Button("Reset Shake"))
        {
            myTarget.ResetShake();
            EditorUtility.SetDirty(myTarget);
        }

        EditorGUIHelper.Separator();

        // --- Position Shake Settings ---
        EditorGUILayout.LabelField("Position Shake Settings", EditorStyles.boldLabel);
        myTarget.PositionShake = EditorGUILayout.Toggle("Enable Position Shake", myTarget.PositionShake);
        myTarget.posFrequency = EditorGUILayout.Vector3Field("Pos Frequency", myTarget.posFrequency);
        myTarget.posAmplitude = EditorGUILayout.Vector3Field("Pos Amplitude", myTarget.posAmplitude);

        // --- PosMin / PosMax read-only ---
        GUI.enabled = false;
        EditorGUILayout.Vector3Field("Pos Min", myTarget.posMin);
        EditorGUILayout.Vector3Field("Pos Max", myTarget.posMax);
        GUI.enabled = true;

        EditorGUILayout.Space(10);

        // --- Rotation Shake Settings ---
        EditorGUILayout.LabelField("Rotation Shake Settings", EditorStyles.boldLabel);
        myTarget.RotationShake = EditorGUILayout.Toggle("Enable Rotation Shake", myTarget.RotationShake);
        myTarget.rotFrequency = EditorGUILayout.Vector3Field("Rot Frequency", myTarget.rotFrequency);
        myTarget.rotAmplitude = EditorGUILayout.Vector3Field("Rot Amplitude", myTarget.rotAmplitude);

        // --- RotMin / RotMax read-only ---
        GUI.enabled = false;
        EditorGUILayout.Vector3Field("Rot Min", myTarget.rotMin);
        EditorGUILayout.Vector3Field("Rot Max", myTarget.rotMax);
        GUI.enabled = true;

        EditorGUIHelper.Separator();

        if (GUILayout.Button("Set Current As Initial"))
        {
            myTarget.CaptureInitial();
            EditorUtility.SetDirty(myTarget);
        }
        // --- Initial state read-only ---
        GUI.enabled = false;
        EditorGUILayout.Vector3Field("Initial Pos", myTarget.GetInitialPos());
        EditorGUILayout.Vector3Field("Initial Rot", myTarget.GetInitialRot());
        GUI.enabled = true;
    }
}

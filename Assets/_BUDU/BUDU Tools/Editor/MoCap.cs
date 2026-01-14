// BUDU Games 2024 - 2025
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class MoCap : EditorWindow
{
    private bool isRecording = false;
    private List<Keyframe> posX, posY, posZ;
    private List<Keyframe> rotX, rotY, rotZ, rotW;
    private float startTime;
    private Transform target;

    private bool hasStartedMotion = false;
    Vector3 lastPos;
    Quaternion lastRot;
    float moveThreshold = 0.0001f; // küçük hareketleri yok say

    private Vector3 startPos;
    private Quaternion startRot;

    private bool enableRigPreview = false;
    private RigBuilder rigBuilder;

    private const string saveFolder = "Assets/_BUDU/Temp/RecordedAnimClips/";

    [MenuItem("BUDU-Tools/MoCap Recorder")]
    public static void Init()
    {
        GetWindow<MoCap>("MoCap Recorder");
    }

    private void OnEnable()
    {
        SceneView.duringSceneGui += OnSceneGUI;
    }

    private void OnDisable()
    {
        SceneView.duringSceneGui -= OnSceneGUI;
    }

    private void OnGUI()
    {
        EditorGUILayout.LabelField("Selected Object:", Selection.activeTransform ? Selection.activeTransform.name : "(none)");

        GUI.backgroundColor = isRecording ? Color.red : Color.white;
        if (GUILayout.Button(isRecording ? "Stop & Save" : "Start Recording"))
        {
            if (!isRecording) StartRecording();
            else StopAndSave();
        }
        GUI.backgroundColor = Color.white;

        EditorGUILayout.Space();

        if (Selection.activeTransform != null)
        {
            if (GUILayout.Button("Reset to Start Position"))
            {
                ResetToStartPosition();
            }
        }

        enableRigPreview = EditorGUILayout.Toggle("Edit Mode Rig Preview", enableRigPreview);
    }

    private void OnSceneGUI(SceneView view)
    {
        if (isRecording)
        {
            Handles.BeginGUI();
            GUI.color = Color.red;
            GUI.Label(new Rect(10, 10, 100, 20), "● REC");
            GUI.color = Color.white;
            Handles.EndGUI();
        }
    }

    private void StartRecording()
    {
        if (Selection.activeTransform == null)
        {
            Debug.LogWarning("No object selected to record.");
            return;
        }

        target = Selection.activeTransform;
        startPos = target.localPosition;
        startRot = target.localRotation;

        lastPos = startPos;
        lastRot = startRot;

        isRecording = true;
        startTime = (float)EditorApplication.timeSinceStartup;

        posX = new List<Keyframe>();
        posY = new List<Keyframe>();
        posZ = new List<Keyframe>();
        rotX = new List<Keyframe>();
        rotY = new List<Keyframe>();
        rotZ = new List<Keyframe>();
        rotW = new List<Keyframe>();

        if (!Directory.Exists(saveFolder))
            Directory.CreateDirectory(saveFolder);

        EditorApplication.update += RecordFrame;
    }

    private void RecordFrame()
    {
        if (!isRecording || target == null) return;

        // ---- Edit Mode Rig Preview ----
        if (enableRigPreview)
        {
            if (rigBuilder == null)
                rigBuilder = target.GetComponentInChildren<RigBuilder>();

            if (rigBuilder != null)
            {
                rigBuilder.Build(); // rig setup
                foreach (var layer in rigBuilder.layers)
                {
                    if (layer.rig != null)
                    {
                        layer.rig.weight = layer.rig.weight; // basit tetikleme ile edit mod update
                    }
                }
            }
        }

        Vector3 currentPos = target.localPosition;
        Quaternion currentRot = target.localRotation;

        if (!hasStartedMotion)
        {
            if ((currentPos - lastPos).sqrMagnitude > moveThreshold * moveThreshold ||
                Quaternion.Angle(currentRot, lastRot) > 0.01f)
            {
                hasStartedMotion = true;
                startTime = (float)(EditorApplication.timeSinceStartup);
            }
            else
            {
                lastPos = currentPos;
                lastRot = currentRot;
                return; // henüz hareket yok, keyframe ekleme
            }
        }

        float t = (float)(EditorApplication.timeSinceStartup - startTime);

        Vector3 p = target.localPosition;
        Quaternion r = target.localRotation;

        posX.Add(new Keyframe(t, p.x));
        posY.Add(new Keyframe(t, p.y));
        posZ.Add(new Keyframe(t, p.z));

        rotX.Add(new Keyframe(t, r.x));
        rotY.Add(new Keyframe(t, r.y));
        rotZ.Add(new Keyframe(t, r.z));
        rotW.Add(new Keyframe(t, r.w));
    }

    private void StopAndSave()
    {
        isRecording = false;
        hasStartedMotion = false;
        startTime = 0f;

        lastPos = Vector3.zero;
        lastRot = Quaternion.identity;

        EditorApplication.update -= RecordFrame;

        if (target == null) return;

        AnimationClip clip = new AnimationClip();

        clip.SetCurve("", typeof(Transform), "m_LocalPosition.x", new AnimationCurve(posX.ToArray()));
        clip.SetCurve("", typeof(Transform), "m_LocalPosition.y", new AnimationCurve(posY.ToArray()));
        clip.SetCurve("", typeof(Transform), "m_LocalPosition.z", new AnimationCurve(posZ.ToArray()));

        clip.SetCurve("", typeof(Transform), "m_LocalRotation.x", new AnimationCurve(rotX.ToArray()));
        clip.SetCurve("", typeof(Transform), "m_LocalRotation.y", new AnimationCurve(rotY.ToArray()));
        clip.SetCurve("", typeof(Transform), "m_LocalRotation.z", new AnimationCurve(rotZ.ToArray()));
        clip.SetCurve("", typeof(Transform), "m_LocalRotation.w", new AnimationCurve(rotW.ToArray()));

        string baseName = target.name;
        string path = GetUniquePath(baseName);

        // Undo desteği ile asset oluştur
        AssetDatabase.CreateAsset(clip, path);
        Undo.RegisterCreatedObjectUndo(clip, "Create MoCap Animation");
        AssetDatabase.SaveAssets();

        Debug.Log($"MoCap: Animation saved at {path}");
    }

    private string GetUniquePath(string baseName)
    {
        string pathNoExt = saveFolder + baseName;
        string path = pathNoExt + ".anim";
        int counter = 1;

        while (File.Exists(path))
        {
            path = $"{pathNoExt}_{counter:D3}.anim";
            counter++;
        }

        return path;
    }

    private void ResetToStartPosition()
    {
        if (target == null) return;

        Undo.RecordObject(target, "Reset to Start Position");

        target.localPosition = startPos;
        target.localRotation = startRot;

        EditorUtility.SetDirty(target);
    }
}

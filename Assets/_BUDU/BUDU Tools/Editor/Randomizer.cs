using UnityEngine;
using UnityEditor;

public class Randomizer: EditorWindow
{
    private Texture2D banner;

    private bool showRand = true;

    //Position
    private bool randomizePosition = true;
    private float posMult = 1f;
    private Vector3 posMin = new Vector3(-1, -1, -1);
    private Vector3 posMax = new Vector3(1, 1, 1);
    private bool[] posAxis = new bool[3] { true, true, true };

    // Rotation
    private bool randomizeRotation = true;
    private float rotMult = 1f;
    private Vector3 rotMin = Vector3.zero;
    private Vector3 rotMax = new Vector3(360, 360, 360);
    private bool[] rotAxis = new bool[3] { true, true, true };

    // Scale
    private bool randomizeScale = false;
    private float sclMult = 1f;
    private Vector3 scaleMin = Vector3.one * 0.5f;
    private Vector3 scaleMax = Vector3.one * 2f;
    private float uScaleMin = 0.9f;
    private float uScaleMax = 1.1f;
    private bool[] scaleAxis = new bool[3] { true, true, true };
    private bool uniformScale = true;

    // Property Randomization
    private bool showPropertyRandomization = true;
    [SerializeField] private PropertyRandomizer propertyRandomizer = new PropertyRandomizer();

    [MenuItem("BUDU-Tools/Tools/Randomizer")]
    private static void ShowWindow()
    {
        Randomizer window = GetWindow<Randomizer>();
        window.titleContent = new GUIContent("Transform Randomizer");
        window.minSize = new Vector2(400, 700);
        window.maxSize = new Vector2(400, 700);
        window.Show();
    }

    private void OnEnable()
    {
        banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsRandomizer.png", typeof(Texture2D));
    }

    private void OnGUI()
    {
        #region Banner
        GUILayout.Space(3);
        if (banner != null)
        {
            float bannerHeight = 25f;
            float ratio = (float)banner.width / banner.height;
            float drawWidth = bannerHeight * ratio;
            Rect bannerRect = GUILayoutUtility.GetRect(drawWidth, bannerHeight, GUILayout.ExpandWidth(false));
            bannerRect.x = 2;
            GUI.DrawTexture(bannerRect, banner, ScaleMode.ScaleToFit, true);
        }
        else
        {
            GUILayout.Space(2);
            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            GUIStyle stl = new GUIStyle();
            stl.normal.textColor = Color.white;
            stl.fontSize = 18;
            stl.fontStyle = FontStyle.Bold;
            GUILayout.Label("Transform Randomizer", stl);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();
        }
        GUILayout.Space(2);
        #endregion

        showRand = EditorGUILayout.Foldout(showRand, "Translate Randomization", true);
        if (showRand)
        {
            #region Position Settings
            randomizePosition = EditorGUILayout.BeginToggleGroup("Randomize Position", randomizePosition);
            EditorGUILayout.BeginHorizontal();
            posAxis[0] = GUILayout.Toggle(posAxis[0], "Affect X", "Button");
            posAxis[1] = GUILayout.Toggle(posAxis[1], "Affect Y", "Button");
            posAxis[2] = GUILayout.Toggle(posAxis[2], "Affect Z", "Button");
            GUILayout.EndHorizontal();
            posMult = EditorGUILayout.FloatField("Position Multiplier", posMult);
            EditorGUI.BeginDisabledGroup(!posAxis[0]);
            EditorGUIHelper.MinMaxSliderWithFields("Position X", ref posMin.x, ref posMax.x, -10f, 10f);
            EditorGUI.EndDisabledGroup();

            EditorGUI.BeginDisabledGroup(!posAxis[1]);
            EditorGUIHelper.MinMaxSliderWithFields("Position Y", ref posMin.y, ref posMax.y, -10f, 10f);
            EditorGUI.EndDisabledGroup();

            EditorGUI.BeginDisabledGroup(!posAxis[2]);
            EditorGUIHelper.MinMaxSliderWithFields("Position Z", ref posMin.z, ref posMax.z, -10f, 10f);
            EditorGUI.EndDisabledGroup();

            EditorGUILayout.EndToggleGroup();
            GUILayout.Space(2);
            #endregion

            #region Rotation Settings
            randomizeRotation = EditorGUILayout.BeginToggleGroup("Randomize Rotation", randomizeRotation);
            EditorGUILayout.BeginHorizontal();
            rotAxis[0] = GUILayout.Toggle(rotAxis[0], "Affect X", "Button");
            rotAxis[1] = GUILayout.Toggle(rotAxis[1], "Affect Y", "Button");
            rotAxis[2] = GUILayout.Toggle(rotAxis[2], "Affect Z", "Button");
            GUILayout.EndHorizontal();
            rotMult = EditorGUILayout.FloatField("Rotation Multiplier", rotMult);
            rotMin = EditorGUILayout.Vector3Field("Min Rotation", rotMin);
            rotMax = EditorGUILayout.Vector3Field("Max Rotation", rotMax);
            EditorGUILayout.EndToggleGroup();
            GUILayout.Space(2);
            #endregion

            #region Scale Settings
            randomizeScale = EditorGUILayout.BeginToggleGroup("Randomize Scale", randomizeScale);
            sclMult = EditorGUILayout.FloatField("Scale Multiplier", sclMult);
            uniformScale = EditorGUILayout.Toggle("Uniform Scale", uniformScale);
            if (uniformScale)
            {
                EditorGUILayout.BeginVertical();
                EditorGUIHelper.MinMaxSliderWithFields("Scale", ref uScaleMin, ref uScaleMax, 0.01f, 2f);
                EditorGUILayout.EndVertical();
            }
            else
            {
                EditorGUILayout.BeginHorizontal();
                scaleAxis[0] = GUILayout.Toggle(scaleAxis[0], "Affect X", "Button");
                scaleAxis[1] = GUILayout.Toggle(scaleAxis[1], "Affect Y", "Button");
                scaleAxis[2] = GUILayout.Toggle(scaleAxis[2], "Affect Z", "Button");
                GUILayout.EndHorizontal();
                scaleMin = EditorGUILayout.Vector3Field("Min Scale", scaleMin);
                scaleMax = EditorGUILayout.Vector3Field("Max Scale", scaleMax);
            }
            EditorGUILayout.EndToggleGroup();
            #endregion

            if (GUILayout.Button("Randomize Selected"))
            {
                RandomizeSelection();
            }
        }
        #region Property Randomization
        showPropertyRandomization = EditorGUILayout.Foldout(showPropertyRandomization, "Property Randomization", true);
        if (showPropertyRandomization)
        {
            EditorGUI.indentLevel++; // Foldout içi biraz sağa kayar
            SerializedObject so = new SerializedObject(this);
            SerializedProperty propertyRandomizerProp = so.FindProperty("propertyRandomizer");

            EditorGUILayout.PropertyField(propertyRandomizerProp.FindPropertyRelative("componentName"), new GUIContent("Component Name"));
            EditorGUILayout.PropertyField(propertyRandomizerProp.FindPropertyRelative("propertyName"), new GUIContent("Property Name"));
            EditorGUILayout.PropertyField(propertyRandomizerProp.FindPropertyRelative("useInteger"), new GUIContent("Use Integer"));
            EditorGUILayout.PropertyField(propertyRandomizerProp.FindPropertyRelative("minValue"), new GUIContent("Min Value"));
            EditorGUILayout.PropertyField(propertyRandomizerProp.FindPropertyRelative("maxValue"), new GUIContent("Max Value"));

            so.ApplyModifiedProperties();

            if (GUILayout.Button("Randomize Property on Selection"))
            {
                propertyRandomizer.ApplyRandomToSelection();
            }
            EditorGUI.indentLevel--;
        }
        #endregion
    }

    private void RandomizeSelection()
    {
        foreach (GameObject go in Selection.gameObjects)
        {
            Undo.RecordObject(go.transform, "Randomize Transform");

            // Position
            if (randomizePosition)
            {
                Vector3 newPos = go.transform.localPosition;
                if (posAxis[0]) newPos.x = Random.Range(posMin.x, posMax.x) * posMult;
                if (posAxis[1]) newPos.y = Random.Range(posMin.y, posMax.y) * posMult;
                if (posAxis[2]) newPos.z = Random.Range(posMin.z, posMax.z) * posMult;
                go.transform.localPosition = newPos;
            }

            // Rotation
            if (randomizeRotation)
            {
                Vector3 newRot = go.transform.localEulerAngles;
                if (rotAxis[0]) newRot.x = Random.Range(rotMin.x, rotMax.x) * rotMult;
                if (rotAxis[1]) newRot.y = Random.Range(rotMin.y, rotMax.y) * rotMult;
                if (rotAxis[2]) newRot.z = Random.Range(rotMin.z, rotMax.z) * rotMult;
                go.transform.localEulerAngles = newRot;
            }

            // Scale
            if (randomizeScale)
            {
                Vector3 newScale = go.transform.localScale;
                if (uniformScale)
                {
                    float s = Random.Range(scaleMin.x, scaleMax.x) * sclMult;
                    newScale = new Vector3(s, s, s);
                }
                else
                {
                    if (scaleAxis[0]) newScale.x = Random.Range(scaleMin.x, scaleMax.x) * sclMult;
                    if (scaleAxis[1]) newScale.y = Random.Range(scaleMin.y, scaleMax.y) * sclMult;
                    if (scaleAxis[2]) newScale.z = Random.Range(scaleMin.z, scaleMax.z) * sclMult;
                }
                go.transform.localScale = newScale;
            }
        }
    }
}

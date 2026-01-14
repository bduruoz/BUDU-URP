using UnityEngine;
using UnityEditor;

public class PoolGeneratorWindow : EditorWindow
{
    private Texture2D banner;
    private float width = 10f;
    private float length = 6f;
    private float wallThickness = 0.5f;
    private float wallHeight = 2f;
    private float floorThickness = 0.5f;

    [MenuItem("BUDU-Tools/Generators/Pool Generator")]
    public static void ShowWindow()
    {
        GetWindow<PoolGeneratorWindow>("Pool Generator");
    }
    private void OnEnable()
    {
        banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsPoolGenerator.png", typeof(Texture2D));
    }


    void OnGUI()
    {
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
            GUILayout.Label("Pool Settings", stl);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();
        }
        GUILayout.Space(10);

        width = EditorGUILayout.FloatField("Width (X)", width);
        length = EditorGUILayout.FloatField("Length (Z)", length);
        wallThickness = EditorGUILayout.FloatField("Wall Thickness", wallThickness);
        wallHeight = EditorGUILayout.FloatField("Wall Height (Y)", wallHeight);
        floorThickness = EditorGUILayout.FloatField("Floor Thickness", floorThickness);

        if (GUILayout.Button("Generate Pool"))
        {
            GeneratePool();
        }
    }

    private void GeneratePool()
    {
        GameObject parent = new GameObject("Pool");
        parent.transform.position = Vector3.zero;

        // === Ground ===
        GameObject floor = GameObject.CreatePrimitive(PrimitiveType.Cube);
        floor.name = "Floor";
        floor.transform.SetParent(parent.transform);
        floor.transform.localScale = new Vector3(width, floorThickness, length);
        floor.transform.localPosition = new Vector3(0, -floorThickness * 0.5f, 0);

        // === Walls ===
        CreateWall("Wall_Left", parent, new Vector3(-width / 2f + wallThickness / 2f, wallHeight / 2f, 0),
                                 new Vector3(wallThickness, wallHeight, length));

        CreateWall("Wall_Right", parent, new Vector3(width / 2f - wallThickness / 2f, wallHeight / 2f, 0),
                                 new Vector3(wallThickness, wallHeight, length));

        CreateWall("Wall_Front", parent, new Vector3(0, wallHeight / 2f, length / 2f - wallThickness / 2f),
                                 new Vector3(width, wallHeight, wallThickness));

        CreateWall("Wall_Back", parent, new Vector3(0, wallHeight / 2f, -length / 2f + wallThickness / 2f),
                                 new Vector3(width, wallHeight, wallThickness));

        Selection.activeGameObject = parent; // yeni objeyi seç
    }

    private void CreateWall(string name, GameObject parent, Vector3 localPos, Vector3 localScale)
    {
        GameObject wall = GameObject.CreatePrimitive(PrimitiveType.Cube);
        wall.name = name;
        wall.transform.SetParent(parent.transform);
        wall.transform.localPosition = localPos;
        wall.transform.localScale = localScale;
    }
}

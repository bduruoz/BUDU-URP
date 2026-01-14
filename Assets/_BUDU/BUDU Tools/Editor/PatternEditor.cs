// BUDU Games 2024 - 2025
using UnityEngine;
using UnityEditor;
using System.IO;
using budu;
using budu.shapes;
using budu.math;

public class PatternGenerator : EditorWindow
{
    #region Fields
    private Texture2D banner;
    public enum ShapeType 
    { 
        Circle,
        Box,
        RoundedBox,
        Triangle,
        Ngon,
        Cross,
        Star,
        Arc,
        Heart,
        Pie,
        Egg,
        Squircle,
        Vesica,
        Moon,
        RoundedX,
        Spiral
    }

    public enum squircleType
    {
        Exact,
        Approx
    }

    private int resolution = 256;
    private int prevRes = 256;
    private bool Seamless = false;
    private bool cornerPattern = false;
    private bool borderPattern = false;
    private bool autoPreview = true;

    // Overall SDF values
    private bool outline = false;
    private float thickness = 0.5f;
    private float thicknessMapped = 0f;
    private float smoothness = 0.01f; // UV-space
    private bool smoothStep = false;
    private Vector2 sstep = new Vector2(0f, 1f);
    
    private float contrast = 1f;
    private float gain = 0.5f;
    private float gamma = 1f;

    private bool union = false;
    private float unionSmooth = 0.2f;

    // Shape Defaults
    private float scale = 0.5f;
    private float rotation = 0f;


    private ShapeType shape = ShapeType.Circle;

    // Circle Setup
    private bool ellipse = false;
    private Vector2 ellipseRadius = new Vector2(0.75f, 0.5f);
    // Box Setup
    private Vector4 expand = new Vector4(0f, 0f, 0f, 0f);
    // Rounded Box Setup
    private Vector4 corners = new Vector4(0.05f, 0.05f, 0.05f, 0.05f);
    // NGon
    private int ngonSides = 6;
    // Cross
    private Vector2 CrossB = new Vector2(.6f, 1.2f);
    private float roundRadius = 0.01f;
    // Star
    private int starSides = 6;
    private float starWidth = 0.75f;
    private float starRadius = 0.5f;
    // Arc
    private Vector2 arcScale = new Vector2(0.5f, 0.5f);
    private float arcOuterRadius = 0.5f;
    private float arcThickness = 0.1f;
    // Pie
    private Vector2 hPos = new Vector2(0f, 0f);
    private Vector2 PieScale = new Vector2(1f, -1f);
    // Egg
    private Vector2 EggPos = new Vector2(0f, 0f);
    private float TopEggH = 0.75f;
    private float EggBottomRadius = 0.5f;
    private float EggTopRadius = 0.25f;
    // Squircle
    private squircleType sqType = squircleType.Exact;
    private float SquircleMult = 5f;
    // Veica
    private float VesicaRadius = 0.5f;
    private float VesicaHeight= 2f;
    // Moon
    private float MoonDistCircles = 0.3f;
    private float MoonRA = 1f;
    private float MoonRB = 0.75f;
    // Rounded X
    private float RXBaseWidth = 1f;
    private float RXRadius = 0.25f;
    // Spiral
    private float SPBaseWidth = 1f;
    private float SPTightness = 5f;

    // Foldout Bools
    private bool imageSettings = false;
    private bool patternSettings = false;
    private bool renderSettings = false;

    private Texture2D previewTex;
    #endregion

    #region For Change Detection
    private ShapeType prevShape;
    private int prevResolution;
    private bool prevSeamless;
    private bool prevCornerPattern;
    private bool prevBorderPattern;

    // Overall SDF values
    private float prevScale;
    private float prevSmoothness;
    private bool prevOutline;
    private float prevThickness;
    private bool prevSmoothStep;
    private Vector2 prevSStep;

    private float prevContrast;
    private float prevGain;
    private float prevGamma;

    private bool prevUnion;
    private float prevUnionSmooth;

    private bool prevEllipse;
    private Vector2 prevEllipseRadius;
    private Vector4 prevExpand;
    private Vector4 prevCorners;
    private int prevNgonSides;
    private Vector2 prevCrossB;
    private float prevRoundRadius;
    private int prevStarSides;
    private float prevStarWidth;
    private float prevStarRadius;
    private Vector2 prevArcScale;
    private float prevArcOuterRadius;
    private float prevArcThickness;
    private Vector2 prevHPos;
    private Vector2 prevPieScale;
    private Vector2 prevEggPos;
    private float prevTopEggH;
    private float prevEggBottomRadius;
    private float prevEggTopRadius;
    private float prevSquircleMult;
    private squircleType prevSqType;
    private float prevVesicaRadius;
    private float prevVesicaHeight;
    private float prevMoonDistCircles;
    private float prevMoonRA;
    private float prevMoonRB;
    private float prevRXBaseWidth;
    private float prevRXRadius;
    private float prevSPBaseWidth;
    private float prevSPTightness;

    private float prevRotation;
    private bool prevAutoPreview;
    #endregion

    [MenuItem("BUDU-Tools/Generators/Pattern Generator")]
    public static void ShowWindow()
    {
        GetWindow<PatternGenerator>("Pattern Generator");
        PatternGenerator window = GetWindow<PatternGenerator>(true, "Pattern Generator");
        window.minSize = new Vector2(400, 600);
        window.maxSize = new Vector2(400, 600);
        window.Show();
    }

    private void OnEnable()
    {
        banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsPatternGenerator.png", typeof(Texture2D));
        prevResolution = resolution;
        prevScale = scale;
        prevRotation = rotation;
        prevOutline = outline;
        prevThickness = thickness;
        prevSmoothness = smoothness;
        prevSmoothStep = smoothStep;
        prevSStep = sstep;
        prevContrast = contrast;
        prevGain = gain;
        prevGamma = gamma;
        prevUnion = union;
        prevUnionSmooth = unionSmooth;
        prevShape = shape;
        prevEllipse = ellipse;
        prevEllipseRadius = ellipseRadius;
        prevExpand = expand;
        prevCorners = corners;
        prevNgonSides = ngonSides;
        prevCrossB = CrossB;
        prevRoundRadius = roundRadius;
        prevStarSides = starSides;
        prevStarWidth = starWidth;
        prevAutoPreview = !autoPreview;
        prevSeamless = Seamless;
        prevArcScale = arcScale;
        prevArcOuterRadius = arcOuterRadius;
        prevArcThickness = arcThickness;
        prevHPos = hPos;
        prevPieScale = PieScale;
        prevEggPos = EggPos;
        prevTopEggH = TopEggH;
        prevEggBottomRadius = EggBottomRadius;
        prevEggTopRadius = EggTopRadius;
        prevSqType = sqType;
        prevSquircleMult = SquircleMult;
        prevVesicaHeight = VesicaHeight;
        prevVesicaRadius = VesicaRadius;
        prevMoonDistCircles = MoonDistCircles;
        prevMoonRA = MoonRA;
        prevMoonRB = MoonRB;
        prevRXBaseWidth = RXBaseWidth;
        prevRXRadius = RXRadius;
        prevSPBaseWidth = SPBaseWidth;
        prevSPTightness = SPTightness;
    }

    private void OnGUI()
    {
        GUIStyle style = new GUIStyle();

        #region Header
        GUILayout.Space(3);
        EditorGUILayout.BeginVertical();
        if (banner != null)
        {
            float bannerHeight = 25f;
            float ratio = (float)banner.width / banner.height;
            float drawWidth = bannerHeight * ratio;
            Rect bannerRect = GUILayoutUtility.GetRect(drawWidth, bannerHeight, GUILayout.ExpandWidth(false));
            bannerRect.x = 0;
            GUI.DrawTexture(bannerRect, banner, ScaleMode.ScaleToFit, true);
        }
        else
        {
            GUILayout.Space(2);
            GUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            style.normal.textColor = Color.white;
            style.fontSize = 18;
            style.fontStyle = FontStyle.Bold;
            GUILayout.Label("Pattern Generator", style);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();
        }
        EditorGUILayout.EndVertical();
        GUILayout.Space(10);
        #endregion

        style.normal.textColor = BDColors.NexusOrange();
        style.fontSize = 12;
        style.fontStyle = FontStyle.Normal;

        #region Preview Area
        EditorGUILayout.BeginVertical();
        if (previewTex != null)
        {
            EditorGUILayout.LabelField("Preview:", style);
            EditorGUILayout.BeginHorizontal();
            GUILayout.FlexibleSpace();
            Rect rect = GUILayoutUtility.GetRect(Mathf.Min(256, prevRes), Mathf.Min(256, prevRes), GUILayout.ExpandWidth(false));
            EditorGUI.DrawPreviewTexture(rect, previewTex, null, ScaleMode.ScaleToFit);
            GUILayout.FlexibleSpace();
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Image Settings
        EditorGUILayout.BeginVertical();
        imageSettings = EditorGUIHelper.ColoredFoldout(ref imageSettings,"Image Settings", BDColors.NexusOrange(), BDColors.Black(50));
        if (imageSettings)
        {
            int[] stepOpt = { 32, 64, 128, 256, 512, 1024, 2048 };
            resolution = EditorGUIHelper.StepSlider("Resolution", resolution, stepOpt);
            EditorGUIHelper.Separator();
            Seamless = EditorGUILayout.Toggle("Seamless", Seamless);
            if (Seamless)
            {
                cornerPattern = EditorGUILayout.Toggle("Corner Pattern", cornerPattern);
                borderPattern = EditorGUILayout.Toggle("Border Pattern",borderPattern);
            }
            EditorGUIHelper.Separator();
            autoPreview = EditorGUILayout.Toggle("Auto Preview", autoPreview);
            EditorGUILayout.BeginHorizontal();
            if (!autoPreview && GUILayout.Button("Generate"))
            {
                GenerateTexture();
            }
            if (GUILayout.Button("Save Texture"))
            {
                SaveTexture();
            }
            EditorGUILayout.EndHorizontal();
        }
        EditorGUILayout.EndVertical();
        #endregion

        #region Pattern Settings
        EditorGUILayout.BeginVertical();
        patternSettings = EditorGUIHelper.ColoredFoldout(ref patternSettings,"Pattern Settings",BDColors.NexusOrange(),BDColors.Black(50));
        if(patternSettings)
        {
            outline = EditorGUILayout.Toggle("Outline", outline);
            if (outline)
            {
                thickness = EditorGUILayout.Slider("Outline Thickness", thickness, 0.001f, 2f);
                thicknessMapped = buduMath.LogisticMap(thickness, 0.001f, 2f,0f,2f);
            }
            smoothness = EditorGUILayout.Slider("Smoothness", smoothness, 0f, 2f);
            smoothStep = EditorGUILayout.Toggle("Smooth Step", smoothStep);
            if (smoothStep)
            {
                sstep.x = EditorGUILayout.Slider("Smooth Step Min", sstep.x, 0f, 1f);
                sstep.y = EditorGUILayout.Slider("Smooth Step Max", sstep.y, 0f, 1f);
            }

            contrast = EditorGUILayout.Slider("Contrast", contrast, 0f, 10f);
            gain = EditorGUILayout.Slider("Gain", gain, 0f, 10f);
            gamma = EditorGUILayout.Slider("Gamma", gamma, 0f, 10f);

            union = EditorGUILayout.Toggle("Union Smooth", union);
            if (union)
            {
                unionSmooth = EditorGUILayout.Slider("Smooth Strength", unionSmooth, 0.001f, 1f);
            }
            EditorGUIHelper.Separator();
            scale = EditorGUILayout.Slider("Scale", scale, 0.01f, 2f);
            rotation = EditorGUILayout.Slider("Rotation", rotation, 0f, 360f);

            shape = (ShapeType)EditorGUILayout.EnumPopup("Shape Type", shape);
            switch (shape)
            {
                case ShapeType.Circle:
                    ellipse = EditorGUILayout.Toggle("Ellipse", ellipse);
                    if (ellipse)
                    {
                        ellipseRadius.x = EditorGUILayout.Slider("Horizontal Radius", ellipseRadius.x, 0f, 1f);
                        ellipseRadius.y = EditorGUILayout.Slider("Vertical Radius", ellipseRadius.y, 0f, 1f);
                    }
                    break;
                case ShapeType.Box:
                    expand.x = EditorGUILayout.Slider("Expand L", expand.x, -0.5f, 2f);
                    expand.y = EditorGUILayout.Slider("Expand R", expand.y, -0.5f, 2f);
                    expand.z = EditorGUILayout.Slider("Expand T", expand.z, -0.5f, 2f);
                    expand.w = EditorGUILayout.Slider("Expand B", expand.w, -0.5f, 2f);
                    break;
                case ShapeType.RoundedBox:
                    expand.x = EditorGUILayout.Slider("Expand L", expand.x, 0.0f, 2f);
                    expand.y = EditorGUILayout.Slider("Expand R", expand.y, 0.0f, 2f);
                    expand.z = EditorGUILayout.Slider("Expand T", expand.z, 0.0f, 2f);
                    expand.w = EditorGUILayout.Slider("Expand B", expand.w, 0.0f, 2f);
                    corners.x = EditorGUILayout.Slider("Top Right Radius", corners.x, 0f, 0.5f);
                    corners.y = EditorGUILayout.Slider("Bottom Right Radius", corners.y, 0f, 0.5f);
                    corners.z = EditorGUILayout.Slider("Tol Left Radius", corners.z, 0f, 0.5f);
                    corners.w = EditorGUILayout.Slider("Bottom Left Radius", corners.w, 0f, 0.5f);
                    break;
                case ShapeType.Triangle:
                    break;
                case ShapeType.Ngon:
                    ngonSides = EditorGUILayout.IntSlider("Ngon Sides", ngonSides, 3, 36);
                    break;
                case ShapeType.Cross:
                    CrossB.x = EditorGUILayout.Slider("Cross Size", CrossB.x, 0f, 2f);
                    CrossB.y = EditorGUILayout.Slider("Cross Round Size", CrossB.y, 0f, 2f);
                    roundRadius = EditorGUILayout.Slider("RoundRadius", roundRadius, 0f, 1f);
                    break;
                case ShapeType.Star:
                    starSides = EditorGUILayout.IntSlider("Star Sides", starSides, 3, 36);
                    starWidth = EditorGUILayout.Slider("Star Width", starWidth, 0f, 1.3f);
                    starRadius = EditorGUILayout.Slider("Star Radius", starRadius, 0f, 1f);
                    break;
                case ShapeType.Arc:
                    arcScale.x = EditorGUILayout.Slider("Arc Magnitude", arcScale.x, 0f, 1f);
                    arcScale.y = EditorGUILayout.Slider("Arc Scale", 1 - arcScale.y, 0f, 2f);
                    arcOuterRadius = EditorGUILayout.Slider("Arc Outer Radius", arcOuterRadius, 0.0001f, 2f);
                    arcThickness = EditorGUILayout.Slider("Arc Thickness", arcThickness, 0f, 1f);
                    break;
                case ShapeType.Heart:
                    hPos.x = EditorGUILayout.Slider("Heart Pos X", hPos.x, -1f, 1f);
                    hPos.y = EditorGUILayout.Slider("Heart Pos Y", hPos.y, -1f, 1f);
                    break;
                case ShapeType.Pie:
                    PieScale.x = EditorGUILayout.Slider("Pie Magnitude", PieScale.x, 0f, 1f);
                    PieScale.y = EditorGUILayout.Slider("Pie Scale", 1 - PieScale.y, 0f, 2f);
                    break;
                case ShapeType.Egg:
                    EggPos = EditorGUILayout.Vector2Field("Egg Pos", EggPos);
                    TopEggH = EditorGUILayout.Slider("Top Circle Height", TopEggH, 0.05f, 1f);
                    EggBottomRadius = EditorGUILayout.Slider("Egg Bottom Radius", EggBottomRadius, 0f, 1f);
                    EggTopRadius = EditorGUILayout.Slider("Egg Top Radius", EggTopRadius, 0f, 1f);
                    break;
                case ShapeType.Squircle:
                    sqType = (squircleType)EditorGUILayout.EnumPopup("Squircle Type", sqType);
                    SquircleMult = EditorGUILayout.Slider("Squircle Multiplier", SquircleMult, 0.25f, 15f);
                    break;
                case ShapeType.Vesica:
                    VesicaRadius = EditorGUILayout.Slider("Vesica Radius", VesicaRadius, 0f, 10f);
                    VesicaHeight = EditorGUILayout.Slider("Vesica Height", VesicaHeight, 0f, 10f);
                    break;
                case ShapeType.Moon:
                    MoonDistCircles = EditorGUILayout.Slider("Distance Circles", MoonDistCircles, -2f, 2f);
                    MoonRA = EditorGUILayout.Slider("Circle A Radius", MoonRA, 0.1f, 2f);
                    MoonRB = EditorGUILayout.Slider("Circle B Radius", MoonRB, 0.1f, 2f);
                    break;
                case ShapeType.RoundedX:
                    RXBaseWidth = EditorGUILayout.Slider("Base Width", RXBaseWidth, 0.01f, 2f);
                    RXRadius = EditorGUILayout.Slider("Rounded X Radius", RXRadius, 0.01f, 1f);
                    break;
                case ShapeType.Spiral:
                    SPBaseWidth = EditorGUILayout.Slider("Base Width", SPBaseWidth, 1f, 10f);
                    SPTightness = EditorGUILayout.Slider("Tightness", SPTightness, 0.1f, 10f);
                    break;
            
            }

        }
        EditorGUILayout.EndVertical();
        #endregion
        EditorGUILayout.Space();
        if (autoPreview && ParamsChanged())
            GenerateTexture();
    }

    private bool ParamsChanged()
    {
        const float EPS = 1e-6f;

        if (prevShape != shape || 
            prevResolution != resolution || 
            prevOutline != outline ||
            prevThickness != thickness ||
            Mathf.Abs(prevScale - scale) > EPS ||
            Mathf.Abs(prevRotation - rotation) > EPS ||
            Mathf.Abs(prevSmoothness - smoothness) > EPS ||
            prevSmoothStep != smoothStep ||
            prevUnion != union ||
            prevUnionSmooth != unionSmooth ||
            prevSStep != sstep ||
            prevContrast != contrast ||
            prevGain != gain ||
            prevGamma != gamma ||
            prevEllipse != ellipse ||
            prevEllipseRadius != ellipseRadius ||
            prevExpand != expand || 
            prevNgonSides != ngonSides ||
            prevStarSides != starSides ||
            prevStarWidth != starWidth ||
            prevStarRadius != starRadius ||
            prevAutoPreview != autoPreview ||
            prevCrossB != CrossB ||
            prevRoundRadius != roundRadius ||
            prevSeamless != Seamless ||
            prevCornerPattern != cornerPattern ||
            prevBorderPattern != borderPattern ||
            prevArcScale != arcScale ||
            prevArcOuterRadius != arcOuterRadius ||
            prevArcThickness != arcThickness ||
            prevHPos != hPos ||
            prevPieScale != PieScale ||
            prevEggPos != EggPos ||
            prevTopEggH != TopEggH ||
            prevEggBottomRadius != EggBottomRadius ||
            prevEggTopRadius != EggTopRadius ||
            prevSquircleMult != SquircleMult ||
            prevSqType != sqType ||
            prevVesicaRadius != VesicaRadius ||
            prevVesicaHeight != VesicaHeight ||
            prevMoonRB != MoonRB ||
            prevMoonRA != MoonRA ||
            prevMoonDistCircles != MoonDistCircles ||
            prevRXBaseWidth != RXBaseWidth ||
            prevRXRadius != RXRadius ||
            prevSPTightness != SPTightness ||
            prevSPBaseWidth != SPBaseWidth ||
            !buduShapes.Approximately(prevCorners, corners))
        {
            prevResolution = resolution;
            prevSeamless = Seamless;
            prevCornerPattern = cornerPattern;
            prevBorderPattern = borderPattern;
            prevScale = scale;
            prevRotation = rotation;
            prevOutline = outline;
            prevThickness = thickness;
            prevSmoothness = smoothness;
            prevSmoothStep = smoothStep;
            prevSStep = sstep;
            prevContrast = contrast;
            prevGain = gain;
            prevGamma = gamma;
            prevUnion = union;
            prevUnionSmooth = unionSmooth;
            prevShape = shape;
            prevEllipse = ellipse;
            prevEllipseRadius = ellipseRadius;
            prevExpand = expand;
            prevNgonSides = ngonSides;
            prevStarSides = starSides;
            prevStarWidth = starWidth;
            prevStarRadius = starRadius;
            prevAutoPreview = autoPreview;
            prevCorners = corners;
            prevCrossB = CrossB;
            prevRoundRadius = roundRadius;
            prevArcScale = arcScale;    
            prevArcOuterRadius = arcOuterRadius;
            prevArcThickness = arcThickness;
            prevHPos = hPos;
            prevPieScale = PieScale;
            prevEggPos = EggPos;
            prevTopEggH = TopEggH;
            prevEggBottomRadius = EggBottomRadius;
            prevEggTopRadius = EggTopRadius;
            prevSqType = sqType;
            prevSquircleMult = SquircleMult;
            prevVesicaRadius = VesicaRadius;
            prevVesicaHeight = VesicaHeight;
            prevMoonDistCircles = MoonDistCircles;
            prevMoonRA = MoonRA;
            prevMoonRB = MoonRB;
            prevRXRadius = RXRadius;
            prevRXBaseWidth = RXBaseWidth;
            prevSPBaseWidth = SPBaseWidth;
            prevSPTightness = SPTightness;
            return true;
        }

        return false;
    }

    private void GenerateTexture()
    {
        if (resolution <= 0) return;

        previewTex = new Texture2D(resolution, resolution, TextureFormat.RGBA32, false);
        previewTex.wrapMode = TextureWrapMode.Clamp;

        float smooth = Mathf.Max(1e-6f, smoothness);

        for (int y = 0; y < resolution; y++)
        {
            for (int x = 0; x < resolution; x++)
            {
                Vector2 uv = new Vector2((x + 0.5f) / resolution * 2f - 1f, (y + 0.5f) / resolution * 2f - 1f);
                float d = 1f;
                switch (shape)
                {
                    case ShapeType.Circle:
                        d = buduShapes.SDFCircle(uv, ellipse, scale, ellipseRadius.x, ellipseRadius.y, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFCircle(uv + Offset, ellipse, scale,ellipseRadius.x,ellipseRadius.y,rotation,outline,thicknessMapped);
                                        if(union)
                                            d = buduShapes.SDFUnion(d,dCorners,unionSmooth);
                                        else
                                            d = Mathf.Min(d,dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if(xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFCircle(new Vector2(uv.x + Offset.x, uv.y + Offset.y), ellipse, scale, ellipseRadius.x, ellipseRadius.y, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Box:
                        d = buduShapes.SDFBox(uv, new Vector2(scale, scale), expand, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFBox(uv + Offset, new Vector2(scale,scale), expand, rotation, outline, thicknessMapped);
                                        if(union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d,dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFBox(uv + Offset, new Vector2(scale, scale), expand, rotation, outline, thicknessMapped);
                                            if(union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.RoundedBox:
                        d = buduShapes.SDFBoxRounded(uv, new Vector2(scale, scale),expand ,corners, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFBoxRounded(uv + Offset, new Vector2(scale, scale), expand, corners, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFBoxRounded(uv + Offset, new Vector2(scale, scale), expand, corners, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Triangle:
                        d = buduShapes.SDFTriangle(uv, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFTriangle(uv + Offset, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFTriangle(uv + Offset, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Ngon:
                        d = buduShapes.SDFNgon(uv, ngonSides, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFNgon(uv + Offset, ngonSides, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFNgon(uv + Offset, ngonSides, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Cross:
                        d = buduShapes.SDFCross(uv, CrossB, scale, roundRadius, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFCross(uv + Offset, CrossB, scale, roundRadius, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFCross(uv + Offset, CrossB, scale, roundRadius, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Star:
                        d = buduShapes.SDFStar(uv, scale, starRadius, starSides, starWidth, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFStar(uv + Offset, scale, starRadius, starSides, starWidth, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFStar(uv + Offset, scale, starRadius, starSides, starWidth, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Arc:
                        d = buduShapes.SDFArc(uv, arcScale, scale, arcOuterRadius, arcThickness, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFArc(uv + Offset, arcScale, scale, arcOuterRadius, arcThickness, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFArc(uv + Offset, arcScale, scale, arcOuterRadius, arcThickness, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Heart:
                        d = buduShapes.SDFHeart(uv + hPos, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFHeart(uv + hPos + Offset, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFHeart(uv + hPos + Offset, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Pie:
                        d = buduShapes.SDFPie(uv, PieScale, 1f, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFPie(uv + Offset, PieScale, 1f, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFPie(uv + Offset, PieScale, 1f, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Egg:
                        d = buduShapes.SDFEgg(uv + (EggPos + new Vector2(0f, 0.25f)), TopEggH, EggBottomRadius, EggTopRadius, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFEgg(uv + (EggPos + new Vector2(0f, 0.25f)) + Offset, TopEggH, EggBottomRadius, EggTopRadius, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFEgg(uv + (EggPos + new Vector2(0f, 0.25f)) + Offset, TopEggH, EggBottomRadius, EggTopRadius, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Squircle:
                        d = buduShapes.SDFSquircle(uv, SquircleMult,(int)sqType, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFSquircle(uv + Offset, SquircleMult, (int)sqType, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFSquircle(uv + Offset, SquircleMult, (int)sqType, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Vesica:
                        d = buduShapes.SDFVesica(uv, VesicaRadius, VesicaHeight, scale, rotation, outline, thicknessMapped); ;
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFVesica(uv + Offset, VesicaRadius, VesicaHeight, scale, rotation, outline, thicknessMapped); ;
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFVesica(uv + Offset, VesicaRadius, VesicaHeight, scale, rotation, outline, thicknessMapped); ;
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Moon:
                        d = buduShapes.SDFMoon(uv, MoonDistCircles, MoonRA, MoonRB, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFMoon(uv + Offset, MoonDistCircles, MoonRA, MoonRB, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFMoon(uv + Offset, MoonDistCircles, MoonRA, MoonRB, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.RoundedX:
                        d = buduShapes.SDFRoundedX(uv, RXBaseWidth, RXRadius, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFRoundedX(uv + Offset, RXBaseWidth, RXRadius, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFRoundedX(uv + Offset, RXBaseWidth, RXRadius, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case ShapeType.Spiral:
                        d = buduShapes.SDFSpiral(uv, SPBaseWidth+1, SPTightness, scale, rotation, outline, thicknessMapped);
                        if (Seamless)
                        {
                            if (cornerPattern)
                            {
                                for (int xx = -1; xx <= 1; xx += 2)
                                {
                                    for (int yy = -1; yy <= 1; yy += 2)
                                    {
                                        Vector2 Offset = new Vector2(xx * 1f, yy * 1f);
                                        float dCorners = buduShapes.SDFSpiral(uv + Offset, SPBaseWidth+1, SPTightness, scale, rotation, outline, thicknessMapped);
                                        if (union)
                                            d = buduShapes.SDFUnion(d, dCorners, unionSmooth);
                                        else
                                            d = Mathf.Min(d, dCorners);
                                    }
                                }
                            }
                            if (borderPattern)
                            {
                                for (int xx = -1; xx <= 1; xx++)
                                {
                                    for (int yy = -1; yy <= 1; yy++)
                                    {
                                        if (xx != 0 || yy != 00)
                                        {
                                            Vector2 Offset = new Vector2(xx * 2f, yy * 2f);
                                            float dBorders = buduShapes.SDFSpiral(uv + Offset, SPBaseWidth+1, SPTightness, scale, rotation, outline, thicknessMapped);
                                            if (union)
                                                d = buduShapes.SDFUnion(d, dBorders, unionSmooth);
                                            else
                                                d = Mathf.Min(d, dBorders);
                                        }
                                    }
                                }
                            }
                        }
                        break;

                }

                float t = Mathf.Clamp01((-d) / smooth);
                float v = Mathf.SmoothStep(sstep.x, sstep.y, t);
                v = buduMath.Contrast(v, contrast);
                v = buduMath.Gain(v, gain);
                v = buduMath.Gamma(v, gamma);
                v = Mathf.Clamp01(v);

                previewTex.SetPixel(x, y, new Color(v, v, v, 1f));
            }
        }

        previewTex.Apply();
    }

    private void SaveTexture()
    {
        if (previewTex == null) return;
        string path = EditorUtility.SaveFilePanel("Save Texture", Application.dataPath, "Pattern.png", "png");
        if (!string.IsNullOrEmpty(path))
        {
            File.WriteAllBytes(path, previewTex.EncodeToPNG());
            AssetDatabase.Refresh();
        }
    }
}

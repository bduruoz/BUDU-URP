// BUDU Games 2023 - 2025
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using static ScreenChartsConfig;

[Serializable]
public static class ScreenChartsConfig
{
    #region Base Controls
    public static bool showInGameView = false;
    public static bool showInSceneView = false;
    #endregion
    #region Background Overlay
    public static bool showBackgroundOverlay = false;
    public static Color backgroundOverlayColor = new Color(0, 0, 0, 0.75f);
    #endregion
    #region Screeen Frame
    [Serializable]
    public struct ScreenFrame
    {
        public bool enabled;
        public Color color;
        public int thickness;
        public ScreenFrame(Color color, int thickness = 1, bool enabled = false)
        {
            this.enabled = enabled;
            this.color = color;
            this.thickness = thickness;
        }
    }
    public static ScreenFrame screenFrame = new ScreenFrame(new Color(0.8f, 0.8f, 0.8f), 1, false);
    #endregion
    #region Safe Areas
    [Serializable]
    public struct SafeArea
    {
        public bool showSafeArea;
        public Color color;
        public float screenPercent; // 0.8 for 90%
        public int thickness;
        public SafeArea(bool showSafeArea, float screenPercent = 0.9f, Color color = default, int thickness = 1)
        {
            this.showSafeArea = showSafeArea;
            this.screenPercent = screenPercent;
            this.color = color == default ? new Color(0f, 0.5f, 0f) : color;
            this.thickness = thickness;
        }
    }
    public static SafeArea safeArea = new SafeArea(false, 0.9f, new Color(0f, 0.5f, 0f), 1);
    [Serializable]
    public struct SafeTitle
    {
        public bool showSafeTitle;
        public float titlePercent;  // 0.8 for 80%
        public bool enabled;
        public Color color;
        public SafeTitle(bool showSafeTitle, float titlePercent = 0.8f, bool enabled = false, Color color = default)
        {
            this.showSafeTitle = showSafeTitle;
            this.titlePercent = titlePercent;
            this.enabled = enabled;
            this.color = color == default ? new Color(0f, 0.5f, 0f) : color;
        }
    }
    public static SafeTitle safeTitle = new SafeTitle(false, 0.8f, true, new Color(0f, 0.5f, 0f));
    #endregion
    #region Grid
    [Serializable]
    public struct ScreenGrid
    {
        public bool enabled;
        public bool showLabels;
        public int ax;
        public int ay;
        public int gridX;
        public int gridY;
        public Color color;
        public Color labelColor;
        public int thickness;
        public int fontSize;
        public ScreenGrid(int ax = 5, int ay = 5, int gridX = 16, int gridY = 9, Color color = default, Color labelColor = default, int thickness = 1, bool enabled = false, bool showLabels = false, int fontSize = 14)
        {
            this.enabled = enabled;
            this.showLabels = showLabels;
            this.ax = ax;
            this.ay = ay;
            this.gridX = gridX;
            this.gridY = gridY;
            this.color = color == default ? Color.cyan : color;
            this.labelColor = color == default ? Color.cyan : color;
            this.thickness = thickness;
            this.fontSize = fontSize;
        }
    }
    public static ScreenGrid screenGrid = new ScreenGrid(5, 5, 16, 9, Color.cyan, Color.cyan, 1, false, false, 14);
    #endregion
    #region Golden Ratio Frame
    [Serializable]
    public struct GoldenFrame
    {
        public bool enabled;
        public Color color;
        public int thickness;
        public int iterations;
        public float coeff;
        public float iterCoeff;
        public GoldenFrame(Color color, int thickness = 1, int iterations = 3, float coeff = 0.3f, float iterCoeff = 0.1f, bool enabled = false)
        {
            this.enabled = enabled;
            this.color = color;
            this.thickness = thickness;
            this.iterations = iterations;
            this.coeff = coeff;
            this.iterCoeff = iterCoeff;
        }
    }
    public static GoldenFrame goldenFrame = new GoldenFrame(new Color(1f, 0.84f, 0f), 1, 3, 0.3f, 0.1f, false);
    #endregion
    #region Fibonacci Spiral
    [Serializable]
    public struct FibonacciSpiral
    {
        public bool enabled;
        public Color color;
        public Vector2 center;
        public int thickness;
        public float scale;
        public int segment;
        public float step;
        public int flip; // 0: none, 1: x, 2: y, 3: both
        public float rotation; // in degrees
        public float aspect; // width / height
        public string label;
        public FibonacciSpiral(Vector2 center, Color color, float aspect, int thickness = 1, float scale = 1f, int segment = 200, float step = 0.1f, int flip = 0, float rotation = 0, bool enabled = false, string label = "Default")
        {
            this.enabled = enabled;
            this.color = color;
            this.aspect = aspect;
            this.center = center;
            this.thickness = thickness;
            this.scale = scale;
            this.segment = segment;
            this.step = step;
            this.flip = flip;
            this.rotation = rotation;
            this.label = label;
        }
    }

    // list of Fibonacci Spirals
    public static List<FibonacciSpiral> fibonacciSpirals = new List<FibonacciSpiral>();
    public static bool showFibonacci = false;
    public static bool fiboEnabled = true;
    public static Vector2 fiboCenter = new Vector2(0.5f, 0.5f);
    public static Color fiboColor = Color.magenta;
    public static int fiboThickness = 1;
    public static float fiboScale = 1f;
    public static int fiboSegment = 200;
    public static float fiboStep = 0.1f;
    public static int fiboFlip = 0; // 0: none, 1: x, 2: y, 3: both
    public static float fiboRotation = 0f; // in degrees

    // helper methods
    public static void AddFibonacci(FibonacciSpiral fs) => fibonacciSpirals.Add(fs);
    public static void InsertFibonacci(int index, FibonacciSpiral fs) { if (index < 0) index = 0; if (index > fibonacciSpirals.Count) index = fibonacciSpirals.Count; fibonacciSpirals.Insert(index, fs); }
    public static bool RemoveFibonacciAt(int index) { if (index >= 0 && index < fibonacciSpirals.Count) { fibonacciSpirals.RemoveAt(index); return true; } return false; }
    public static bool RemoveFibonacci(FibonacciSpiral fs) => fibonacciSpirals.Remove(fs);
    public static void ClearFibonaccis() => fibonacciSpirals.Clear();
    #endregion
    #region Crosshair
    [Serializable]
    public struct Crosshair
    {
        public bool enabled;
        public Vector2 center;
        public bool plus;
        public Color plusColor;
        public int plusThickness;
        public float plusSize;
        public bool x;
        public Color xColor;
        public int xThickness;
        public float xSize;
        public bool circle;
        public Color circleColor;
        public int circleThickness;
        public int circleSegment;
        public int circleIter;
        public float circleSize;
        public float circleSpacing;
        public Crosshair(Vector2 center, bool plus, Color plusColor, int plusThickness, float plusSize, bool x, Color xColor, int xThickness, float xSize, bool circle, Color circleColor, int circleThickness, int circleSegment, int circleIter, float circleSize, float circleSpacing, bool enabled = false)
        {
            this.enabled = enabled;
            this.center = center;
            this.plus = plus;
            this.plusColor = plusColor;
            this.plusThickness = plusThickness;
            this.plusSize = plusSize;
            this.x = x;
            this.xColor = xColor;
            this.xThickness = xThickness;
            this.xSize = xSize;
            this.circle = circle;
            this.circleColor = circleColor;
            this.circleThickness = circleThickness;
            this.circleSegment = circleSegment;
            this.circleIter = circleIter;
            this.circleSize = circleSize;
            this.circleSpacing = circleSpacing;
        }
    }
    public static Crosshair crosshair = new Crosshair(new Vector2(0.5f, 0.5f), true, Color.white, 1, 0.1f, false, Color.white, 1, 0.1f, false, Color.white, 1, 32, 3, 0.1f, 0.02f, false);
    #endregion
    #region Center Cross
    [Serializable]
    public struct CenterCross
    {
        public bool enabled;
        public Color color;
        public Vector2 center;
        public int thickness;
        public float size;
        public CenterCross(Color color, Vector2 center, int thickness = 1, float size = 1f, bool enabled = false)
        {
            this.enabled = enabled;
            this.color = color;
            this.center = center;
            this.thickness = thickness;
            this.size = size;
        }
    }
    public static CenterCross centerCross = new CenterCross(Color.white, new Vector2(0.5f, 0.5f), 1, 0.1f, false);
    #endregion
    #region InBoxes
    [Serializable]
    public struct InBox
    {
        public bool enabled;
        public Vector2 center;
        public Vector2 size;
        public Color color;
        public int iter;
        public float aspect;
        public float step;
        public float dstep;
        public bool golden;
        public float rotation;
        public string label;

        public InBox(Vector2 center, Vector2 size, Color color, int iter, float aspect, bool enabled = true, float step = 0.2f, float dstep = 1.618f, bool golden = true, float rotation = 0, string label = "Default")
        {
            this.enabled = enabled;
            this.center = center;
            this.size = size;
            this.color = color;
            this.iter = iter;
            this.aspect = aspect;
            this.step = step;
            this.dstep = dstep;
            this.golden = golden;
            this.rotation = rotation;
            this.label = label;
        }
    }

    // list of boxes (use System.Collections.Generic.List)
    public static List<InBox> inBoxes = new List<InBox>();
    public static bool showInBoxes = false;
    public static bool inBoxEnabled = true;
    public static Vector2 inBoxCenter = new Vector2(0.5f, 0.5f);
    public static Vector2 inBoxSize = new Vector2(1f, 1f);
    public static Color inBoxColor = Color.yellow;
    public static int inBoxIterations = 4;
    public static float inBoxStep = 0.05f;
    public static float inBoxDStep = (1f + Mathf.Sqrt(5)) / 2f; // golden ratio
    public static bool inBoxGolden = false;
    public static float inBoxRotation = 0f;

    // helper methods
    public static void AddInBox(InBox box) => inBoxes.Add(box);
    public static void InsertInBox(int index, InBox box) { if (index < 0) index = 0; if (index > inBoxes.Count) index = inBoxes.Count; inBoxes.Insert(index, box); }
    public static bool RemoveInBoxAt(int index) { if (index >= 0 && index < inBoxes.Count) { inBoxes.RemoveAt(index); return true; } return false; }
    public static bool RemoveInBox(InBox box) => inBoxes.Remove(box);
    public static void ClearInBoxes() => inBoxes.Clear();
    #endregion
    #region InCircles
    [Serializable]
    public struct InCircle
    {
        public bool enabled;
        public Vector2 center;
        public Color color;
        public int thickness;
        public int segment;
        public int count;
        public float spacing;
        public float dSpacing;
        public float startRadius;
        public bool golden;
        public float rotation;
        public string label;

        public InCircle(Vector2 center, Color color, int thickness, int segment, int count, float spacing = 0.1f, float dSpacing = 1f, float startRadius = 1f, bool golden = false, float rotation = 0f, bool enabled = true, string label = "Default")
        {
            this.enabled = enabled;
            this.center = center;
            this.color = color;
            this.thickness = thickness;
            this.segment = segment;
            this.count = count;
            this.spacing = spacing;
            this.dSpacing = spacing;
            this.startRadius = startRadius;
            this.rotation = rotation;
            this.golden = golden;
            this.label = label;
        }
    }

    // list of circles
    public static List<InCircle> inCircles = new List<InCircle> ();
    public static bool showInCircles = false;
    public static bool inCircleEnabled = true;
    public static Vector2 inCircleCenter = new Vector2(0.5f, 0.5f);
    public static Color inCircleColor = Color.cyan;
    public static int inCircleThickness = 1;
    public static int inCircleSegment = 64;
    public static int inCircleCount = 10;
    public static float inCircleSpacing = 0.1f;
    public static float inCircleDSpacing = (1f + Mathf.Sqrt(5f)) / 2f; // golden ratio
    public static float inCircleStartRadius = 1f;
    public static bool inCircleGolden = false;
    public static float inCircleRotation = 0f;

    // helper methods
    public static void AddCircle(InCircle c) => inCircles.Add(c);
    public static void InsertCircle(int index, InCircle c) { if (index < 0) index = 0; if (index > inCircles.Count) index = inCircles.Count; inCircles.Insert(index, c); }
    public static bool RemoveCircleAt(int index) { if (index >= 0 && index < inCircles.Count) { inCircles.RemoveAt(index); return true; } return false; }
    public static bool RemoveCircle(InCircle c) => inCircles.Remove(c);
    public static void ClearCircles() => inCircles.Clear();
    #endregion
    #region Phyllotaxis
    [Serializable]
    public struct Phyllotaxis
    {
        public bool enabled;
        public Vector2 center;
        public int numPoints;
        public float angle;
        public float cval;
        public float zStep;
        public Color color;
        public float size;
        public Phyllotaxis(Vector2 center, int numPoints, float angle, float cval, float zStep, Color color, float size, bool enabled)
        {
            this.enabled = enabled;
            this.center = center;
            this.numPoints = numPoints;
            this.angle = angle;
            this.cval = cval;
            this.zStep = zStep;
            this.color = color;
            this.size = size;
        }
    }
    public static Phyllotaxis phyllotaxis = new Phyllotaxis(new Vector2(0.5f, 0.5f), 500, 137.508f, 0.15f, 0.0f, new Color(0f,0.5f,1.0f), 1f, false);
    #endregion

    // Snapshot / Preset API
    [Serializable]
    public struct Snapshot
    {
        public bool showInGameView;
        public bool showInSceneView;

        public bool showBackgroundOverlay;
        public Color backgroundOverlayColor;

        public ScreenFrame screenFrame;
        public SafeArea safeArea;
        public SafeTitle safeTitle;
        public ScreenGrid screenGrid;
        public GoldenFrame goldenFrame;
        public FibonacciSpiral[] fibonacciSpirals;
        public Crosshair crosshair;
        public CenterCross centerCross;
        public InBox[] inBoxes;
        public InCircle[] circles;
        public Phyllotaxis phyllotaxis;
    }

    // Capture current static config into a Snapshot
    public static Snapshot Capture()
    {
        return new Snapshot
        {
            showInGameView = showInGameView,
            showInSceneView = showInSceneView,

            showBackgroundOverlay = showBackgroundOverlay,
            backgroundOverlayColor = backgroundOverlayColor,

            screenFrame = new ScreenFrame(screenFrame.color, screenFrame.thickness, screenFrame.enabled),
            safeArea = new SafeArea(safeArea.showSafeArea, safeArea.screenPercent, safeArea.color, safeArea.thickness),
            safeTitle = new SafeTitle(safeTitle.showSafeTitle, safeTitle.titlePercent, safeTitle.enabled, safeTitle.color),
            screenGrid = new ScreenGrid(screenGrid.ax, screenGrid.ay, screenGrid.gridX, screenGrid.gridY, screenGrid.color, screenGrid.labelColor, screenGrid.thickness, screenGrid.enabled, screenGrid.showLabels, screenGrid.fontSize),
            goldenFrame = new GoldenFrame(goldenFrame.color, goldenFrame.thickness, goldenFrame.iterations, goldenFrame.coeff, goldenFrame.iterCoeff, goldenFrame.enabled),
            fibonacciSpirals = fibonacciSpirals != null ? fibonacciSpirals.ToArray() : new FibonacciSpiral[0],
            crosshair = new Crosshair(crosshair.center, crosshair.plus, crosshair.plusColor, crosshair.plusThickness, crosshair.plusSize, crosshair.x, crosshair.xColor, crosshair.xThickness, crosshair.xSize, crosshair.circle, crosshair.circleColor, crosshair.circleThickness, crosshair.circleSegment, crosshair.circleIter, crosshair.circleSize, crosshair.circleSpacing, crosshair.enabled),
            centerCross = new CenterCross(centerCross.color, centerCross.center, centerCross.thickness, centerCross.size, centerCross.enabled),
            phyllotaxis = new Phyllotaxis(phyllotaxis.center, phyllotaxis.numPoints, phyllotaxis.angle, phyllotaxis.cval, phyllotaxis.zStep, phyllotaxis.color, phyllotaxis.size, phyllotaxis.enabled),
            inBoxes = inBoxes != null ? inBoxes.ToArray() : new InBox[0],
            circles = inCircles != null ? inCircles.ToArray() : new InCircle[0]
        };
    }

    // Restore static config from a Snapshot
    public static void Restore(in Snapshot s)
    {
        showInGameView = s.showInGameView;
        showInSceneView = s.showInSceneView;

        showBackgroundOverlay = s.showBackgroundOverlay;
        backgroundOverlayColor = s.backgroundOverlayColor;

        screenFrame = s.screenFrame;
        safeArea = s.safeArea;
        safeTitle = s.safeTitle;
        screenGrid = s.screenGrid;
        goldenFrame = s.goldenFrame;
        fibonacciSpirals = s.fibonacciSpirals != null ? new List<FibonacciSpiral>(s.fibonacciSpirals) : new List<FibonacciSpiral>();
        crosshair = s.crosshair;
        centerCross = s.centerCross;
        phyllotaxis = s.phyllotaxis;
        inBoxes = s.inBoxes != null ? new List<InBox>(s.inBoxes) : new List<InBox>();
        inCircles = s.circles != null ? new List<InCircle>(s.circles) : new List<InCircle>();
    }

    // Preset asset helpers (Editor only)
#if UNITY_EDITOR
    public const string PresetFolder = "Assets/_BUDU/Screen Charts/Presets";
    public const string DefaultPresetAssetPath = PresetFolder + "/Default.asset";

    // Create/overwrite Default.asset with current Snapshot
    public static void SaveDefaultPresetAsset()
    {
        SavePresetAsset(DefaultPresetAssetPath);
    }

    // Save to a chosen asset path (Save File Panel in project)
    public static void SavePresetAsDialog()
    {
        if (!UnityEditor.AssetDatabase.IsValidFolder(PresetFolder))
            System.IO.Directory.CreateDirectory(PresetFolder);

        string path = UnityEditor.EditorUtility.SaveFilePanelInProject(
            "Save ScreenCharts Preset",
            "ScreenChartsPreset",
            "asset",
            "Save preset as asset",
            PresetFolder
        );
        if (string.IsNullOrEmpty(path)) return;
        SavePresetAsset(path);
    }

    // Actual create/update of ScriptableObject asset that holds a Snapshot
    public static void SavePresetAsset(string assetPath)
    {
        // ensure folder
        var dir = System.IO.Path.GetDirectoryName(assetPath);
        if (!string.IsNullOrEmpty(dir) && !UnityEditor.AssetDatabase.IsValidFolder(dir))
            System.IO.Directory.CreateDirectory(dir);

        // try load existing
        var existing = UnityEditor.AssetDatabase.LoadAssetAtPath<ScreenChartsConfigPresetSO>(assetPath);
        if (existing == null)
        {
            var inst = ScriptableObject.CreateInstance<ScreenChartsConfigPresetSO>();
            inst.snapshot = Capture();
            UnityEditor.AssetDatabase.CreateAsset(inst, assetPath);
            UnityEditor.AssetDatabase.SaveAssets();
            UnityEditor.AssetDatabase.Refresh();
            UnityEditor.EditorUtility.SetDirty(inst);
            UnityEditor.AssetDatabase.SaveAssets();
            UnityEditor.AssetDatabase.Refresh();
            UnityEngine.Debug.Log($"[ScreenCharts] Created preset asset: {assetPath}");
        }
        else
        {
            existing.snapshot = Capture();
            UnityEditor.EditorUtility.SetDirty(existing);
            UnityEditor.AssetDatabase.SaveAssets();
            UnityEditor.AssetDatabase.Refresh();
            UnityEngine.Debug.Log($"[ScreenCharts] Updated preset asset: {assetPath}");
        }
    }

    // Open a panel to select an asset then load it
    public static void LoadPresetDialog()
    {
        if (!System.IO.Directory.Exists(PresetFolder))
            System.IO.Directory.CreateDirectory(PresetFolder);

        string full = UnityEditor.EditorUtility.OpenFilePanel("Load ScreenCharts Preset", PresetFolder, "asset");
        if (string.IsNullOrEmpty(full)) return;
        string projectRelative = UnityEditor.FileUtil.GetProjectRelativePath(full);
        LoadPresetAsset(projectRelative);
    }

    // Load asset by project path and apply snapshot
    public static void LoadPresetAsset(string assetPath)
    {
        var preset = UnityEditor.AssetDatabase.LoadAssetAtPath<ScreenChartsConfigPresetSO>(assetPath);
        if (preset == null)
        {
            UnityEngine.Debug.LogWarning($"[ScreenCharts] Preset asset not found: {assetPath}");
            return;
        }
        Restore(in preset.snapshot);

        // repaint editor & scene so changes take effect visually
        UnityEditor.EditorWindow.focusedWindow?.Repaint();
        UnityEditor.SceneView.RepaintAll();
        UnityEditor.EditorApplication.QueuePlayerLoopUpdate();

        UnityEngine.Debug.Log($"[ScreenCharts] Loaded preset asset: {assetPath}");
    }

    // If default exists, load it. Call this from your Window.OnEnable()
    public static void LoadDefaultIfExists()
    {
        if (UnityEditor.AssetDatabase.LoadAssetAtPath<ScreenChartsConfigPresetSO>(DefaultPresetAssetPath) is ScreenChartsConfigPresetSO so)
        {
            Restore(in so.snapshot);
            UnityEditor.EditorWindow.focusedWindow?.Repaint();
            UnityEditor.SceneView.RepaintAll();
        }
    }
#endif

} // end of ScreenChartsConfig

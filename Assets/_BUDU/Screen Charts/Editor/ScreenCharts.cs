// BUDU Games 2024 - 2025
using budu;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using UnityEditor;
using UnityEngine;

public class ScreenCharts : EditorWindow
{
    string PresetFolder = ScreenChartsConfig.PresetFolder;
    string DefaultPresetPath = ScreenChartsConfig.DefaultPresetAssetPath;

    private static ScreenChartsRenderer runtimeRenderer;
    private Texture2D banner;

    private Vector2 scrollPos;

    private float aspect;

    private bool boverlay = false;
    private bool safeAreas = false;
    private bool grid = false;
    private bool goldenFrame = false;
    private bool crosshair = false;
    private bool circles = false;
    private bool centCross = false;
    private bool sFrame = false;
    private bool InBoxes = false;
    private bool FibonacciSpirals = false;
    private bool extras = false;
    private bool phyllotaxis = false;

    private Camera cam;

    // foldout states for dynamic lists
    private List<bool> inBoxFoldouts = new List<bool>();
    private List<bool> circleFoldouts = new List<bool>();
    private List<bool> fibonacciSpiralFoldouts = new List<bool>();

    private List<string> presetAssetPaths = new List<string>();
    private Vector2 presetListScroll = Vector2.zero;

    [MenuItem("BUDU-Tools/ScreenTools/Screen Charts")]
    public static void ShowWindow()
    {
        ScreenCharts window = GetWindow<ScreenCharts>("Screen Charts");
        window.minSize = new Vector2(550, 800);
        window.maxSize = new Vector2(550, 800);
        window.Show();
    }

    private void OnEnable()
    {
        AutoLoadDefault();

        banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsScreenCharts.png", typeof(Texture2D));
        cam = Camera.current;
        if (!runtimeRenderer)
        {
            cam = Camera.main;
            if (cam)
                runtimeRenderer = cam.GetComponent<ScreenChartsRenderer>() ?? cam.gameObject.AddComponent<ScreenChartsRenderer>();
        }
        aspect = (float)Screen.width / (float)Screen.height;

    }

    private void EnsureInBoxFoldouts()
    {
        int count = ScreenChartsConfig.inBoxes != null ? ScreenChartsConfig.inBoxes.Count : 0;
        while (inBoxFoldouts.Count < count) inBoxFoldouts.Add(false);
        while (inBoxFoldouts.Count > count) inBoxFoldouts.RemoveAt(inBoxFoldouts.Count - 1);
    }

    private void EnsureFiboSpiralFoldouts()
    {
        int count = ScreenChartsConfig.fibonacciSpirals != null ? ScreenChartsConfig.fibonacciSpirals.Count : 0;
        while (fibonacciSpiralFoldouts.Count < count) fibonacciSpiralFoldouts.Add(false);
        while (fibonacciSpiralFoldouts.Count > count) fibonacciSpiralFoldouts.RemoveAt(fibonacciSpiralFoldouts.Count - 1);
    }

    private void EnsureCircleFoldouts()
    {
        int count = ScreenChartsConfig.inCircles != null ? ScreenChartsConfig.inCircles.Count : 0;
        while (circleFoldouts.Count < count) circleFoldouts.Add(false);
        while (circleFoldouts.Count > count) circleFoldouts.RemoveAt(circleFoldouts.Count - 1);
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
            stl.normal.textColor = BDColors.NexusOrange();
            stl.fontSize = 18;
            stl.fontStyle = FontStyle.Bold;
            GUILayout.Label("Screen Charts Tool", stl);
            GUILayout.FlexibleSpace();
            GUILayout.EndHorizontal();
        }
        GUILayout.Space(2);
        #endregion
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos, GUILayout.Width(position.width), GUILayout.Height(position.height - 20));
        #region Background Overlay
        GUIExtras.Foldout(ref boverlay, "Background Overlay", BDColors.DarkRed(150), () =>
        {
            ScreenChartsConfig.showBackgroundOverlay = EditorGUILayout.Toggle("Background Overlay", ScreenChartsConfig.showBackgroundOverlay);
            ScreenChartsConfig.backgroundOverlayColor = EditorGUILayout.ColorField("BG Overlay Color", ScreenChartsConfig.backgroundOverlayColor);
        });
        #endregion
        #region Screen Frame
        GUIExtras.Foldout(ref sFrame, "Sceen Frame", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Screen Frame", () =>
            {
                ScreenChartsConfig.screenFrame.enabled = EditorGUILayout.BeginToggleGroup("Screen Frame", ScreenChartsConfig.screenFrame.enabled);
                ScreenChartsConfig.screenFrame.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.screenFrame.color);
                ScreenChartsConfig.screenFrame.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.screenFrame.thickness, 1, 16);
                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region Safe Areas
        GUIExtras.Foldout(ref safeAreas, "Safe Areas", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Safe Screen", () =>
            {
                ScreenChartsConfig.safeArea.showSafeArea = EditorGUILayout.BeginToggleGroup("Safe Area", ScreenChartsConfig.safeArea.showSafeArea);
                ScreenChartsConfig.safeArea.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.safeArea.color);
                ScreenChartsConfig.safeArea.screenPercent = EditorGUILayout.Slider("Screen Percent", ScreenChartsConfig.safeArea.screenPercent, 0.5f, 1f);
                ScreenChartsConfig.safeArea.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.safeArea.thickness, 1, 16);
                EditorGUILayout.EndToggleGroup();
            });
            GUIExtras.DrawSection("Safe Title", () =>
            {
                ScreenChartsConfig.safeTitle.showSafeTitle = EditorGUILayout.BeginToggleGroup("Safe Title", ScreenChartsConfig.safeTitle.showSafeTitle);
                ScreenChartsConfig.safeTitle.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.safeTitle.color);
                ScreenChartsConfig.safeTitle.titlePercent = EditorGUILayout.Slider("Title Percent", ScreenChartsConfig.safeTitle.titlePercent, 0.5f, 1f);
                ScreenChartsConfig.safeArea.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.safeArea.thickness, 1, 16);
                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region Screen Grid
        GUIExtras.Foldout(ref grid, "Grid", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Grid", () =>
            {
                ScreenChartsConfig.screenGrid.enabled = EditorGUILayout.BeginToggleGroup("Grid", ScreenChartsConfig.screenGrid.enabled);
                ScreenChartsConfig.screenGrid.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.screenGrid.color);
                ScreenChartsConfig.screenGrid.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.screenGrid.thickness, 1, 16);
                ScreenChartsConfig.screenGrid.gridX = EditorGUILayout.IntSlider("Grid X", ScreenChartsConfig.screenGrid.gridX, 1, 64);
                ScreenChartsConfig.screenGrid.gridY = EditorGUILayout.IntSlider("Grid Y", ScreenChartsConfig.screenGrid.gridY, 1, 64);
                ScreenChartsConfig.screenGrid.showLabels = EditorGUILayout.ToggleLeft("Grid Numbers", ScreenChartsConfig.screenGrid.showLabels);
                if (ScreenChartsConfig.screenGrid.showLabels)
                {
                    ScreenChartsConfig.screenGrid.labelColor = EditorGUILayout.ColorField("Label Color", ScreenChartsConfig.screenGrid.labelColor);
                    ScreenChartsConfig.screenGrid.fontSize = EditorGUILayout.IntSlider("Font Size", ScreenChartsConfig.screenGrid.fontSize, 6, 32);
                    ScreenChartsConfig.screenGrid.ax = EditorGUILayout.IntSlider("Label X", ScreenChartsConfig.screenGrid.ax, -5, 64);
                    ScreenChartsConfig.screenGrid.ay = EditorGUILayout.IntSlider("Label Y", ScreenChartsConfig.screenGrid.ay, -5, 64);
                }
                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region InBox
        // show/manage ScreenChartsConfig.inBoxes list with simple add/remove/edit + reordering
        EnsureInBoxFoldouts();
        GUIExtras.Foldout(ref InBoxes, "In Boxes", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("In Boxes", () =>
            {
                ScreenChartsConfig.showInBoxes = EditorGUILayout.BeginToggleGroup("In Boxes", ScreenChartsConfig.showInBoxes);

                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("Add Box", GUILayout.Height(22)))
                {
                    var newBox = new ScreenChartsConfig.InBox(
                        ScreenChartsConfig.inBoxCenter,
                        ScreenChartsConfig.inBoxSize,
                        ScreenChartsConfig.inBoxColor,
                        ScreenChartsConfig.inBoxIterations, aspect,
                        ScreenChartsConfig.inBoxEnabled,
                        ScreenChartsConfig.inBoxStep,
                        ScreenChartsConfig.inBoxDStep,
                        ScreenChartsConfig.inBoxGolden,
                        ScreenChartsConfig.inBoxRotation,
                        $"Box {(ScreenChartsConfig.inBoxes?.Count ?? 0) + 1}");
                    if (ScreenChartsConfig.inBoxes == null) ScreenChartsConfig.inBoxes = new List<ScreenChartsConfig.InBox>();
                    ScreenChartsConfig.inBoxes.Add(newBox);
                    inBoxFoldouts.Add(true);
                }
                if (GUILayout.Button("Clear All", GUILayout.Height(22)))
                {
                    ScreenChartsConfig.inBoxes?.Clear();
                    inBoxFoldouts.Clear();
                }
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.Space(4);

                if (ScreenChartsConfig.inBoxes != null && ScreenChartsConfig.inBoxes.Count > 0)
                {
                    for (int i = 0; i < ScreenChartsConfig.inBoxes.Count; i++)
                    {
                        var box = ScreenChartsConfig.inBoxes[i];

                        EditorGUILayout.BeginVertical("box");
                        EditorGUILayout.BeginHorizontal();
                        inBoxFoldouts[i] = EditorGUILayout.Foldout(inBoxFoldouts[i], string.IsNullOrEmpty(box.label) ? $"Box {i}" : box.label);
                        GUILayout.FlexibleSpace();
                        if (GUILayout.Button("▲", GUILayout.Width(24))) // move up
                        {
                            if (i > 0)
                            {
                                var tmp = ScreenChartsConfig.inBoxes[i - 1];
                                ScreenChartsConfig.inBoxes[i - 1] = box;
                                ScreenChartsConfig.inBoxes[i] = tmp;
                                var tf = inBoxFoldouts[i - 1];
                                inBoxFoldouts[i - 1] = inBoxFoldouts[i];
                                inBoxFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("▼", GUILayout.Width(24))) // move down
                        {
                            if (i < ScreenChartsConfig.inBoxes.Count - 1)
                            {
                                var tmp = ScreenChartsConfig.inBoxes[i + 1];
                                ScreenChartsConfig.inBoxes[i + 1] = box;
                                ScreenChartsConfig.inBoxes[i] = tmp;
                                var tf = inBoxFoldouts[i + 1];
                                inBoxFoldouts[i + 1] = inBoxFoldouts[i];
                                inBoxFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("X", GUILayout.Width(24))) // remove
                        {
                            ScreenChartsConfig.inBoxes.RemoveAt(i);
                            inBoxFoldouts.RemoveAt(i);
                            break;
                        }
                        EditorGUILayout.EndHorizontal();

                        if (inBoxFoldouts[i])
                        {
                            box.enabled = EditorGUILayout.Toggle("Enabled", box.enabled);
                            box.center.x = EditorGUILayout.Slider("Center X", box.center.x, -0.5f, 1.5f);
                            box.center.y = EditorGUILayout.Slider("Center Y", box.center.y, -0.5f, 1.5f);
                            box.size = EditorGUIHelper.Vector2Field("Size", box.size);
                            box.rotation = EditorGUILayout.Slider("Rotation", box.rotation, -360f, 360f);
                            box.color = EditorGUILayout.ColorField("Color", box.color);
                            box.iter = EditorGUILayout.IntSlider("Iter", box.iter, 1, 16);
                            box.golden = EditorGUILayout.Toggle("Divided", box.golden);
                            if (box.golden)
                            {
                                box.dstep = EditorGUILayout.Slider("Divided Step", box.dstep, 0.001f, 5f);
                            }
                            else
                            {
                                box.step = EditorGUILayout.Slider("Step", box.step, 0.001f, 2f);
                            }
                            ScreenChartsConfig.inBoxes[i] = box;
                        }

                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(4);
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("No InBoxes defined. Click Add Box to create one.", MessageType.Info);
                }

                EditorGUILayout.EndToggleGroup();
            });

        });
        #endregion
        #region Circles 
        EnsureCircleFoldouts();
        GUIExtras.Foldout(ref circles, "Circles", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Circles", () =>
            {
                GUIStyle small = new GUIStyle(GUI.skin.button) { fontSize = 11 };
                ScreenChartsConfig.showInCircles = EditorGUILayout.BeginToggleGroup("In Circles", ScreenChartsConfig.showInCircles);

                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("Add Circle", GUILayout.Height(22)))
                {
                    var newC = new ScreenChartsConfig.InCircle(
                        ScreenChartsConfig.inCircleCenter,
                        ScreenChartsConfig.inCircleColor,
                        ScreenChartsConfig.inCircleThickness,
                        ScreenChartsConfig.inCircleSegment,
                        Mathf.Max(1, ScreenChartsConfig.inCircleCount),
                        ScreenChartsConfig.inCircleSpacing,
                        ScreenChartsConfig.inCircleDSpacing,
                        ScreenChartsConfig.inCircleStartRadius,
                        ScreenChartsConfig.inCircleGolden,
                        ScreenChartsConfig.inCircleRotation,
                        ScreenChartsConfig.inCircleEnabled,
                        $"Circle {(ScreenChartsConfig.inCircles?.Count ?? 0) + 1}"
                    );
                    if (ScreenChartsConfig.inCircles == null) ScreenChartsConfig.inCircles = new List<ScreenChartsConfig.InCircle>();
                    ScreenChartsConfig.inCircles.Add(newC);
                    circleFoldouts.Add(true);
                }
                if (GUILayout.Button("Clear All", GUILayout.Height(22)))
                {
                    ScreenChartsConfig.inCircles?.Clear();
                    circleFoldouts.Clear();
                }
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.Space(4);

                if (ScreenChartsConfig.inCircles != null && ScreenChartsConfig.inCircles.Count > 0)
                {
                    for (int i = 0; i < ScreenChartsConfig.inCircles.Count; i++)
                    {
                        var c = ScreenChartsConfig.inCircles[i];

                        EditorGUILayout.BeginVertical("box");
                        EditorGUILayout.BeginHorizontal();
                        circleFoldouts[i] = EditorGUILayout.Foldout(circleFoldouts[i], string.IsNullOrEmpty(c.label) ? $"Circle {i}" : c.label);
                        GUILayout.FlexibleSpace();
                        if (GUILayout.Button("▲", GUILayout.Width(24)))
                        {
                            if (i > 0)
                            {
                                var tmp = ScreenChartsConfig.inCircles[i - 1];
                                ScreenChartsConfig.inCircles[i - 1] = c;
                                ScreenChartsConfig.inCircles[i] = tmp;
                                var tf = circleFoldouts[i - 1];
                                circleFoldouts[i - 1] = circleFoldouts[i];
                                circleFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("▼", GUILayout.Width(24)))
                        {
                            if (i < ScreenChartsConfig.inCircles.Count - 1)
                            {
                                var tmp = ScreenChartsConfig.inCircles[i + 1];
                                ScreenChartsConfig.inCircles[i + 1] = c;
                                ScreenChartsConfig.inCircles[i] = tmp;
                                var tf = circleFoldouts[i + 1];
                                circleFoldouts[i + 1] = circleFoldouts[i];
                                circleFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("X", GUILayout.Width(24)))
                        {
                            ScreenChartsConfig.inCircles.RemoveAt(i);
                            circleFoldouts.RemoveAt(i);
                            break;
                        }
                        EditorGUILayout.EndHorizontal();

                        if (circleFoldouts[i])
                        {
                            c.enabled = EditorGUILayout.Toggle("Enabled", c.enabled);
                            //c.label = EditorGUILayout.TextField("Label", c.label);
                            c.center.x = EditorGUILayout.Slider("Center X", c.center.x, -0.5f, 1.5f);
                            c.center.y = EditorGUILayout.Slider("Center Y", c.center.y, -0.5f, 1.5f);
                            c.color = EditorGUILayout.ColorField("Color", c.color);
                            c.thickness = EditorGUILayout.IntSlider("Thickness", c.thickness, 1, 10);
                            c.segment = EditorGUILayout.IntSlider("Segments", c.segment, 3, 512);
                            c.count = EditorGUILayout.IntSlider("Count", c.count, 1, 64);
                            c.golden = EditorGUILayout.Toggle("Divided", c.golden);
                            if (c.golden)
                            {
                                c.dSpacing = EditorGUILayout.Slider("Divided Spacing", c.dSpacing, 0.0001f, 5f);
                            }
                            else
                            {
                                c.spacing = EditorGUILayout.Slider("Spacing", c.spacing, 0.0001f, 5f);
                            }
                            c.startRadius = EditorGUILayout.Slider("Start Radius", c.startRadius, 0.0001f, 20f);
                            c.rotation = EditorGUILayout.Slider("Rotation (deg)", c.rotation, 0f, 360f);

                            // write back
                            ScreenChartsConfig.inCircles[i] = c;
                        }

                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(4);
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("No circles defined. Click Add Circle to create one.", MessageType.Info);
                }

                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region Golden Ratio Frame
        GUIExtras.Foldout(ref goldenFrame, "Golden Ratio Frame", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Golden Ratio Frame", () =>
            {
                ScreenChartsConfig.goldenFrame.enabled = EditorGUILayout.BeginToggleGroup("Show Golden Frame", ScreenChartsConfig.goldenFrame.enabled);
                ScreenChartsConfig.goldenFrame.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.goldenFrame.color);
                ScreenChartsConfig.goldenFrame.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.goldenFrame.thickness, 1, 10);
                ScreenChartsConfig.goldenFrame.iterations = EditorGUILayout.IntSlider("Iterations", ScreenChartsConfig.goldenFrame.iterations, 1, 20);
                ScreenChartsConfig.goldenFrame.iterCoeff = EditorGUILayout.Slider("Iteration Coefficient", ScreenChartsConfig.goldenFrame.iterCoeff, 0.001f, 1f);
                ScreenChartsConfig.goldenFrame.coeff = EditorGUILayout.Slider("Coefficient", ScreenChartsConfig.goldenFrame.coeff, 0.001f, 1f);
                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region Fibonacci Spiral
        // show/manage ScreenChartsConfig.inBoxes list with simple add/remove/edit + reordering
        EnsureFiboSpiralFoldouts();
        GUIExtras.Foldout(ref FibonacciSpirals, "Fibonacci Spirals", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Fibonacci Spirals", () =>
            {
                ScreenChartsConfig.showFibonacci = EditorGUILayout.BeginToggleGroup("Fibonacci Spirals", ScreenChartsConfig.showFibonacci);

                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("Add Spiral", GUILayout.Height(22)))
                {
                    var newFibo = new ScreenChartsConfig.FibonacciSpiral(
                        ScreenChartsConfig.fiboCenter,
                        ScreenChartsConfig.fiboColor,
                        aspect,
                        ScreenChartsConfig.fiboThickness,
                        ScreenChartsConfig.fiboScale,
                        Mathf.Max(1, ScreenChartsConfig.fiboSegment),
                        ScreenChartsConfig.fiboStep,
                        ScreenChartsConfig.fiboFlip,
                        ScreenChartsConfig.fiboRotation,
                        ScreenChartsConfig.fiboEnabled,
                        $"Fibo {(ScreenChartsConfig.fibonacciSpirals?.Count ?? 0) + 1}");
                    if (ScreenChartsConfig.fibonacciSpirals == null) ScreenChartsConfig.fibonacciSpirals = new List<ScreenChartsConfig.FibonacciSpiral>();
                    ScreenChartsConfig.fibonacciSpirals.Add(newFibo);
                    fibonacciSpiralFoldouts.Add(true);
                }
                if (GUILayout.Button("Clear All", GUILayout.Height(22)))
                {
                    ScreenChartsConfig.fibonacciSpirals?.Clear();
                    fibonacciSpiralFoldouts.Clear();
                }
                EditorGUILayout.EndHorizontal();
                EditorGUILayout.Space(4);

                if (ScreenChartsConfig.fibonacciSpirals != null && ScreenChartsConfig.fibonacciSpirals.Count > 0)
                {
                    for (int i = 0; i < ScreenChartsConfig.fibonacciSpirals.Count; i++)
                    {
                        var f = ScreenChartsConfig.fibonacciSpirals[i];

                        EditorGUILayout.BeginVertical("box");
                        EditorGUILayout.BeginHorizontal();
                        fibonacciSpiralFoldouts[i] = EditorGUILayout.Foldout(fibonacciSpiralFoldouts[i], string.IsNullOrEmpty(f.label) ? $"Fibo {i}" : f.label);
                        GUILayout.FlexibleSpace();
                        if (GUILayout.Button("▲", GUILayout.Width(24)))
                        {
                            if (i > 0)
                            {
                                var tmp = ScreenChartsConfig.fibonacciSpirals[i - 1];
                                ScreenChartsConfig.fibonacciSpirals[i - 1] = f;
                                ScreenChartsConfig.fibonacciSpirals[i] = tmp;
                                var tf = fibonacciSpiralFoldouts[i - 1];
                                fibonacciSpiralFoldouts[i - 1] = fibonacciSpiralFoldouts[i];
                                fibonacciSpiralFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("▼", GUILayout.Width(24)))
                        {
                            if (i < ScreenChartsConfig.fibonacciSpirals.Count - 1)
                            {
                                var tmp = ScreenChartsConfig.fibonacciSpirals[i + 1];
                                ScreenChartsConfig.fibonacciSpirals[i + 1] = f;
                                ScreenChartsConfig.fibonacciSpirals[i] = tmp;
                                var tf = fibonacciSpiralFoldouts[i + 1];
                                fibonacciSpiralFoldouts[i + 1] = fibonacciSpiralFoldouts[i];
                                fibonacciSpiralFoldouts[i] = tf;
                                GUIUtility.ExitGUI();
                            }
                        }
                        if (GUILayout.Button("X", GUILayout.Width(24)))
                        {
                            ScreenChartsConfig.fibonacciSpirals.RemoveAt(i);
                            fibonacciSpiralFoldouts.RemoveAt(i);
                            break;
                        }
                        EditorGUILayout.EndHorizontal();

                        if (fibonacciSpiralFoldouts[i])
                        {
                            f.enabled = EditorGUILayout.Toggle("Enabled", f.enabled);
                            f.center.x = EditorGUILayout.Slider("Center X", f.center.x, -0.5f, 1.5f);
                            f.center.y = EditorGUILayout.Slider("Center Y", f.center.y, -0.5f, 1.5f);
                            f.color = EditorGUILayout.ColorField("Color", f.color);
                            f.thickness = EditorGUILayout.IntSlider("Thickness", f.thickness, 1, 10);
                            f.segment = EditorGUILayout.IntSlider("Segments", f.segment, 16, 512);
                            f.scale = EditorGUILayout.Slider("Scale", f.scale, 0.01f, 5f);
                            f.step = EditorGUILayout.Slider("Step", f.step, 0.01f, 5f);
                            f.rotation = EditorGUILayout.Slider("Rotation (deg)", f.rotation, -360f, 360f);
                            f.flip = EditorGUILayout.IntSlider("Flip", f.flip, 0, 3);
                            ScreenChartsConfig.fibonacciSpirals[i] = f; // write back
                        }

                        EditorGUILayout.EndVertical();
                        EditorGUILayout.Space(4);
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("No Fibonacci Spirals defined. Click Add Spiral to create one.", MessageType.Info);
                }
                EditorGUILayout.EndToggleGroup();
            });
        });

        #endregion
        #region Crosshair
        GUIExtras.Foldout(ref crosshair, "Crosshair", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Crosshair", () =>
            {
                ScreenChartsConfig.crosshair.enabled = EditorGUILayout.BeginToggleGroup("Crosshair", ScreenChartsConfig.crosshair.enabled);
                ScreenChartsConfig.crosshair.center.x = EditorGUILayout.Slider( "Center X", ScreenChartsConfig.crosshair.center.x, -0.5f, 1.5f);
                ScreenChartsConfig.crosshair.center.y = EditorGUILayout.Slider("Center Y", ScreenChartsConfig.crosshair.center.y, -0.5f, 1.5f);
                ScreenChartsConfig.crosshair.plus = EditorGUILayout.Toggle("Plus Target", ScreenChartsConfig.crosshair.plus);
                if (ScreenChartsConfig.crosshair.plus)
                {
                    ScreenChartsConfig.crosshair.plusColor = EditorGUILayout.ColorField("Color", ScreenChartsConfig.crosshair.plusColor);
                    ScreenChartsConfig.crosshair.plusThickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.crosshair.plusThickness, 1, 10);
                    ScreenChartsConfig.crosshair.plusSize = EditorGUILayout.Slider("Plus Size", ScreenChartsConfig.crosshair.plusSize, 0.0001f, 1f);
                }
                ScreenChartsConfig.crosshair.x = EditorGUILayout.Toggle("Cross Target", ScreenChartsConfig.crosshair.x);
                if(ScreenChartsConfig.crosshair.x)
                {
                    ScreenChartsConfig.crosshair.xColor = EditorGUILayout.ColorField("Color", ScreenChartsConfig.crosshair.xColor);
                    ScreenChartsConfig.crosshair.xThickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.crosshair.xThickness, 1, 10);
                    ScreenChartsConfig.crosshair.xSize = EditorGUILayout.Slider("X Size", ScreenChartsConfig.crosshair.xSize, 0.0001f, 1f);
                }
                ScreenChartsConfig.crosshair.circle = EditorGUILayout.Toggle("Circle Target", ScreenChartsConfig.crosshair.circle);
                if(ScreenChartsConfig.crosshair.circle)
                {
                    ScreenChartsConfig.crosshair.circleColor = EditorGUILayout.ColorField("Color", ScreenChartsConfig.crosshair.circleColor);
                    ScreenChartsConfig.crosshair.circleThickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.crosshair.circleThickness, 1, 10);
                    ScreenChartsConfig.crosshair.circleSegment = EditorGUILayout.IntSlider("Circle Iteration", ScreenChartsConfig.crosshair.circleSegment, 3, 128);
                    ScreenChartsConfig.crosshair.circleSize = EditorGUILayout.Slider("Circle Size", ScreenChartsConfig.crosshair.circleSize, 0.0001f, 1f);
                    ScreenChartsConfig.crosshair.circleIter = EditorGUILayout.IntSlider("Circle Iteration", ScreenChartsConfig.crosshair.circleIter, 1, 12);
                    ScreenChartsConfig.crosshair.circleSpacing = EditorGUILayout.Slider("Circle Spacing", ScreenChartsConfig.crosshair.circleSpacing, 0.001f, 1f);
                }
                EditorGUILayout.EndToggleGroup();
            });

        });
        #endregion
        #region Center Cross
        GUIExtras.Foldout(ref centCross, "Cross", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Cross", () =>
            {
                ScreenChartsConfig.centerCross.enabled = EditorGUILayout.BeginToggleGroup("Cross", ScreenChartsConfig.centerCross.enabled);
                ScreenChartsConfig.centerCross.center = EditorGUIHelper.Vector2Field("Center", ScreenChartsConfig.centerCross.center);
                ScreenChartsConfig.centerCross.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.centerCross.color);
                ScreenChartsConfig.centerCross.thickness = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.centerCross.thickness, 1, 10);
                ScreenChartsConfig.centerCross.size = EditorGUILayout.Slider("Size", ScreenChartsConfig.centerCross.size, 0.001f, 1f);

                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion
        #region Phyllotaxis
        GUIExtras.Foldout(ref phyllotaxis, "Phyllotaxis", BDColors.DarkRed(120), () =>
        {
            GUIExtras.DrawSection("Phyllotaxis", () =>
            {
                ScreenChartsConfig.phyllotaxis.enabled = EditorGUILayout.BeginToggleGroup("Phyllotaxis", ScreenChartsConfig.phyllotaxis.enabled);
                ScreenChartsConfig.phyllotaxis.center = EditorGUIHelper.Vector2Field("Center", ScreenChartsConfig.phyllotaxis.center);
                ScreenChartsConfig.phyllotaxis.color = EditorGUILayout.ColorField("Color", ScreenChartsConfig.phyllotaxis.color);
                ScreenChartsConfig.phyllotaxis.numPoints = EditorGUILayout.IntSlider("Thickness", ScreenChartsConfig.phyllotaxis.numPoints, 10, 10000);
                ScreenChartsConfig.phyllotaxis.angle = EditorGUILayout.Slider("Angle (137.508)", ScreenChartsConfig.phyllotaxis.angle, 0.0f, 360.0f);
                ScreenChartsConfig.phyllotaxis.cval = EditorGUILayout.Slider("Gap Value", ScreenChartsConfig.phyllotaxis.cval, 0.01f, 2f);
                ScreenChartsConfig.phyllotaxis.size = EditorGUILayout.Slider("Point Size", ScreenChartsConfig.phyllotaxis.size, 0.1f, 1f);
                //ScreenChartsConfig.phyllotaxis.zStep = EditorGUILayout.Slider("Z Step", ScreenChartsConfig.phyllotaxis.zStep, 0.01f, 5f);
                EditorGUILayout.EndToggleGroup();
            });
        });
        #endregion

        #region Default Settings
        EditorGUIHelper.Separator(2);
        GUIExtras.Foldout(ref extras, "Extras", BDColors.DarkRed(120), () =>
        {
            ScreenChartsConfig.showInSceneView = EditorGUILayout.ToggleLeft("Scene View", ScreenChartsConfig.showInSceneView);
            ScreenChartsConfig.showInGameView = EditorGUILayout.ToggleLeft("Game View", ScreenChartsConfig.showInGameView);

            GUILayout.BeginHorizontal();
            if (GUILayout.Button("💾 Save Preset", GUILayout.Height(25)))
            {
                SavePreset(); // uses ScreenChartsConfig.SavePresetAsset internally
                RefreshPresetList();
            }
            if (GUILayout.Button("💾 Save Default", GUILayout.Height(25)))
            {
                ScreenChartsConfig.SaveDefaultPresetAsset();
                RefreshPresetList();
            }
            if (GUILayout.Button("📂 Load Preset", GUILayout.Height(25)))
            {
                LoadPreset(); // opens file panel and applies snapshot
                RefreshPresetList();
            }
            if (GUILayout.Button("🔄 Refresh", GUILayout.Height(25)))
            {
                RefreshPresetList();
            }
            if (GUILayout.Button("📥 Load Default", GUILayout.Height(25)))
            {
                ScreenChartsConfig.LoadDefaultIfExists();
            }
            GUILayout.EndHorizontal();

            GUILayout.Space(6);

            // show cached list
            if (!AssetDatabase.IsValidFolder(PresetFolder))
            {
                EditorGUILayout.HelpBox($"Preset folder not found: {PresetFolder}", MessageType.Info);
            }
            else
            {
                presetListScroll = EditorGUILayout.BeginScrollView(presetListScroll, GUILayout.Height(140));
                if (presetAssetPaths.Count == 0)
                {
                    EditorGUILayout.HelpBox("No presets found. Click Refresh or Save Preset to create one.", MessageType.Info);
                }
                else
                {
                    foreach (var p in presetAssetPaths)
                    {
                        EditorGUILayout.BeginHorizontal("box");
                        string shortName = System.IO.Path.GetFileNameWithoutExtension(p);
                        EditorGUILayout.LabelField(shortName, GUILayout.Width(200));
                        if (GUILayout.Button("Load", GUILayout.Width(60)))
                        {
                            ScreenChartsConfig.LoadPresetAsset(p);
                        }
                        if (GUILayout.Button("Overwrite", GUILayout.Width(80)))
                        {
                            if (EditorUtility.DisplayDialog("Overwrite Preset", $"Overwrite preset {p} with current settings?", "Overwrite", "Cancel"))
                            {
                                OverwritePresetAsset(p);
                            }
                        }
                        if (GUILayout.Button("Delete", GUILayout.Width(60)))
                        {
                            DeletePresetAsset(p);
                        }
                        EditorGUILayout.EndHorizontal();
                    }
                }
                EditorGUILayout.EndScrollView();
            }

            if (GUILayout.Button("Save as PNG"))
            {
                string path = EditorUtility.SaveFilePanel("Save Screen Chart", "", "ScreenChart.png", "png");
                if (!string.IsNullOrEmpty(path))
                {
                    var tex = new Texture2D(Screen.width, Screen.height, TextureFormat.RGBA32, false);
                    tex.ReadPixels(new Rect(0, 0, Screen.width, Screen.height), 0, 0);
                    tex.Apply();
                    System.IO.File.WriteAllBytes(path, tex.EncodeToPNG());
                    AssetDatabase.Refresh();
                    //Debug.Log("Saved: " + path);
                }
            }
        });
        GUILayout.Space(15);
        #endregion
        EditorGUILayout.EndScrollView();
    }
    private void SavePreset()
    {
        // 💾 SAVE
        if (!Directory.Exists(PresetFolder))
            Directory.CreateDirectory(PresetFolder);

        string path = EditorUtility.SaveFilePanelInProject(
            "Save ScreenCharts Preset",
            "NewPreset",
            "asset",
            "Choose a name for your preset",
            PresetFolder
        );
        if (string.IsNullOrEmpty(path)) return;

        // use ScreenChartsConfig helper which creates/updates ScreenChartsConfigPresetSO.snapshot
        ScreenChartsConfig.SavePresetAsset(path);

        //Debug.Log($"✅ Preset saved: {path}");
    }
    private void LoadPreset()
    {
        // 📂 LOAD
        string full = EditorUtility.OpenFilePanel("Load ScreenCharts Preset", PresetFolder, "asset");
        if (string.IsNullOrEmpty(full)) return;

        string projectRelative = FileUtil.GetProjectRelativePath(full);
        // use config helper to load & apply snapshot
        ScreenChartsConfig.LoadPresetAsset(projectRelative);
        //Debug.Log($"✅ Preset loaded: {projectRelative}");
    }
    private void AutoLoadDefault()
    {
        // 🧠 Load default when Screen Charts opens
        // delegate to ScreenChartsConfig helper that restores default if present
        ScreenChartsConfig.LoadDefaultIfExists();
    }
    private ScreenChartsConfigPresetSO CreateFromStatic()
    {
        // 🔄 Static Config -> ScriptableObject
        // Create SO and store the Snapshot directly so it serializes correctly.
        var preset = ScriptableObject.CreateInstance<ScreenChartsConfigPresetSO>();
        preset.snapshot = ScreenChartsConfig.Capture();
        return preset;
    }
    private static void CopyStaticFields(Type staticType, ScriptableObject target)
    {
        // 🔄 Reflection kopyalama yardımcıları
        // Keep for reference, but not required when using Snapshot-based presets.
        var staticFields = staticType.GetFields(BindingFlags.Public | BindingFlags.Static);
        foreach (var f in staticFields)
        {
            var instanceField = target.GetType().GetField(f.Name, BindingFlags.Public | BindingFlags.Instance);
            if (instanceField != null)
                instanceField.SetValue(target, f.GetValue(null));
        }
    }
    private void RefreshPresetList()
    {
        presetAssetPaths.Clear();
        if (!AssetDatabase.IsValidFolder(PresetFolder))
            return;

        string[] guids = AssetDatabase.FindAssets("t:ScreenChartsConfigPresetSO", new[] { PresetFolder });
        foreach (var g in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(g);
            presetAssetPaths.Add(path);
        }
    }
    private void DeletePresetAsset(string projectPath)
    {
        if (string.IsNullOrEmpty(projectPath)) return;
        if (EditorUtility.DisplayDialog("Delete Preset", $"Delete preset asset?\n{projectPath}", "Delete", "Cancel"))
        {
            AssetDatabase.DeleteAsset(projectPath);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            RefreshPresetList();
            //Debug.Log($"Deleted preset: {projectPath}");
        }
    }
    private void OverwritePresetAsset(string projectPath)
    {
        if (string.IsNullOrEmpty(projectPath)) return;
        // Save current snapshot into the existing asset
        ScreenChartsConfig.SavePresetAsset(projectPath);
        //Debug.Log($"Overwrote preset: {projectPath}");
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        RefreshPresetList();
    }
}

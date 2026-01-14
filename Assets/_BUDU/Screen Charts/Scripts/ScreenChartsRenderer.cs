// BUDU Games 2024 - 2025
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

[ExecuteAlways]
[RequireComponent(typeof(Camera))]
public class ScreenChartsRenderer : MonoBehaviour
{
    private static Material lineMaterial;
    private float aspect;

    private void OnEnable()
    {
        if (!lineMaterial)
         {
            Shader shader = Shader.Find("Hidden/Internal-Colored");
            lineMaterial = new Material(shader);
            lineMaterial.hideFlags = HideFlags.HideAndDontSave;
            lineMaterial.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
            lineMaterial.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
            lineMaterial.SetInt("_Cull", (int)UnityEngine.Rendering.CullMode.Off);
            lineMaterial.SetInt("_ZWrite", 0);
        }
        #if UNITY_EDITOR
        if(ScreenChartsConfig.showInSceneView)
        {
            RenderPipelineManager.endCameraRendering += OnEndCameraRendering;
            SceneView.duringSceneGui += OnSceneGUI;
        }
        #endif
    }

    void OnDisable()
    {
        #if UNITY_EDITOR
        if (ScreenChartsConfig.showInSceneView)
        {
            RenderPipelineManager.endCameraRendering -= OnEndCameraRendering;
            SceneView.duringSceneGui -= OnSceneGUI;
        }
        #endif
    }
    private void OnGUI()
    {
        if (ScreenChartsConfig.showInGameView && GetComponent<Camera>().cameraType == CameraType.Game && ScreenChartsConfig.screenGrid.showLabels && ScreenChartsConfig.screenGrid.enabled)
        {
            DrawGridLabels(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.labelColor, Camera.main);
        }
    }

    void OnEndCameraRendering(ScriptableRenderContext context, Camera camera)
    {
        if (ScreenChartsConfig.showInSceneView && camera.cameraType == CameraType.SceneView)
            DrawAllCharts();

        if (ScreenChartsConfig.showInGameView && camera.cameraType == CameraType.Game)
            DrawAllCharts();
    }
    private void OnSceneGUI(SceneView sceneView)
    {
        #if UNITY_EDITOR
        aspect = (float)Screen.width / (float)Screen.height;

        if (ScreenChartsConfig.screenGrid.showLabels && ScreenChartsConfig.screenGrid.enabled)
        {
            DrawGridLabels(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.labelColor, sceneView.camera);
        }
        #endif
    }
    private void DrawAllCharts()
    {
        Camera cam = Camera.current;
        if (cam == null) cam = Camera.main;
        if (cam == null) return;

        lineMaterial.SetPass(0);
        GL.PushMatrix();
        GL.LoadOrtho();

        switch (cam.name)
        {
            case "SceneCamera":
                aspect = ((float)cam.pixelWidth) / (float)cam.pixelHeight;
                break;
            default:
                aspect = (float)Screen.width / (float)Screen.height;
                break;
        }

        #region Background Overlay
        if (ScreenChartsConfig.showBackgroundOverlay)
        {
            GL.Begin(GL.QUADS);
            GL.Color(ScreenChartsConfig.backgroundOverlayColor);
            GL.Vertex3(0, 0, 0);
            GL.Vertex3(1, 0, 0);
            GL.Vertex3(1, 1, 0);
            GL.Vertex3(0, 1, 0);
            GL.End();
        }
        #endregion
        #region Safe Frames
        // Frame border
        if (ScreenChartsConfig.screenFrame.enabled)
        {
            DrawRectangle(0f, 0f, 1f, 1f, ScreenChartsConfig.screenFrame.color, ScreenChartsConfig.screenFrame.thickness, aspect);
        }

        // Safe Screen
        if (ScreenChartsConfig.safeArea.showSafeArea)
        {
            float perc = ScreenChartsConfig.safeArea.screenPercent;
            DrawRectangle((1f-perc)/2f, (1f - perc) / 2f, perc, perc, ScreenChartsConfig.safeArea.color, ScreenChartsConfig.safeArea.thickness, aspect);
        }

        // Safe Title
        if (ScreenChartsConfig.safeTitle.showSafeTitle)
        {
            float perc = ScreenChartsConfig.safeTitle.titlePercent;
            DrawRectangle((1f - perc) / 2f, (1f - perc) / 2f, perc, perc, ScreenChartsConfig.safeTitle.color, ScreenChartsConfig.safeArea.thickness, aspect);
        }
        #endregion
        #region Grid
        if (ScreenChartsConfig.screenGrid.enabled)
        {
            DrawGrid(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.color, ScreenChartsConfig.screenGrid.thickness, aspect);
        }
        #endregion
        #region Golden Frame
        if (ScreenChartsConfig.goldenFrame.enabled)
            DrawGoldenFrame(ScreenChartsConfig.goldenFrame.color, ScreenChartsConfig.goldenFrame.thickness, ScreenChartsConfig.goldenFrame.coeff, aspect);
        #endregion
        #region Fibonacci Spirals
        if (ScreenChartsConfig.showFibonacci)
        {
            for (int i = 0; i < ScreenChartsConfig.fibonacciSpirals.Count; i++)
            {
                DrawSingleFibonacciSpiral(
                    ScreenChartsConfig.fibonacciSpirals[i].center,
                    ScreenChartsConfig.fibonacciSpirals[i].color,
                    ScreenChartsConfig.fibonacciSpirals[i].aspect,
                    ScreenChartsConfig.fibonacciSpirals[i].thickness,
                    ScreenChartsConfig.fibonacciSpirals[i].scale,
                    ScreenChartsConfig.fibonacciSpirals[i].segment,
                    ScreenChartsConfig.fibonacciSpirals[i].step,
                    ScreenChartsConfig.fibonacciSpirals[i].rotation,
                    ScreenChartsConfig.fibonacciSpirals[i].flip,
                    ScreenChartsConfig.fibonacciSpirals[i].enabled
                    );
            }
        }
        #endregion
        #region Crosshair
        // Crosshair
        if (ScreenChartsConfig.crosshair.enabled)
            DrawCrosshair(aspect);
        #endregion
        #region Center Cross
        // Center Cross
        if (ScreenChartsConfig.centerCross.enabled)
            DrawCross(aspect);
        #endregion
        #region Circles
        /*
        // Center Circles
        if (ScreenChartsConfig.showCircles)
            DrawCircles(aspect);

        // Circles 1
        if (ScreenChartsConfig.showCircles1)
            DrawCircles1(aspect);

        // Circles 2
        if (ScreenChartsConfig.showCircles2)
            DrawCircles2(aspect);

        // Circles 3
        if (ScreenChartsConfig.showCircles3)
            DrawCircles3(aspect);

        // Circles 4
        if (ScreenChartsConfig.showCircles4)
            DrawCircles4(aspect);
        */
        #endregion
        #region In Boxes
        if (ScreenChartsConfig.showInBoxes)
        {
            for (int i = 0; i < ScreenChartsConfig.inBoxes.Count; i++)
            {
                DrawBox(
                    ScreenChartsConfig.inBoxes[i].center,
                    ScreenChartsConfig.inBoxes[i].size,
                    ScreenChartsConfig.inBoxes[i].color,
                    ScreenChartsConfig.inBoxes[i].iter,
                    aspect,
                    ScreenChartsConfig.inBoxes[i].step,
                    ScreenChartsConfig.inBoxes[i].dstep,
                    ScreenChartsConfig.inBoxes[i].golden,
                    ScreenChartsConfig.inBoxes[i].enabled,
                    ScreenChartsConfig.inBoxes[i].rotation);
            }
        }
        //DrawBox(new Vector2(0.5f, 0.5f), ScreenChartsConfig.inBoxAspect, ScreenChartsConfig.inBoxColor, ScreenChartsConfig.inBoxThickness, aspect, ScreenChartsConfig.inBoxScale);
        #endregion
        #region In Circles
        if (ScreenChartsConfig.showInCircles)
        {
            for (int i = 0; i < ScreenChartsConfig.inCircles.Count; i++)
            {
                DrawInCircles(aspect);
            }
        }

        #endregion

        #region Phyllotaxis
        Phyllotaxis();
        #endregion

        #region Goldens tests
        // DrawFibonacciGrid(new Vector2(0.5f, 0.5f), 1f, Color.yellow, 1, 5, (float)Screen.width / Screen.height);
        // DrawFibonacciBlocks(new Vector2(0.5f, 0.5f), 16, Color.cyan, 1);
        // DrawFibonacciSquares(new Vector2(0.5f, 0.5f), 16, Color.cyan, 1);
        // DrawFibonacciSpiralContinuous(new Vector2(0.5f, 0.5f), 16, Color.yellow);
        // Debug.Log("Camera" + cam.name + " - Aspect: " + aspect);
        // DrawBox(new Vector2(0.5f, 0.5f), 1.7777f, Color.cyan, 10, aspect, 0.75f);
        // DrawBoxBorder(new Vector2(0.5f, 0.5f), 10, Color.cyan);
        // DrawFibonacciArcs(new Vector2(0.5f, 0.5f), 10, Color.red);
        #endregion

        GL.PopMatrix();
    }

    // Draw Functions
    #region Draw Rectangle
    private void DrawRectangle(float x, float y, float w, float h, Color c, int thickness, float aspect)
    {
        GL.Begin(GL.LINES);
        GL.Color(c);

        int half = thickness / 2;
        float offsetX = 1f / Screen.width;   // 1 piksel yatay
        float offsetY = 1f / Screen.height;  // 1 piksel dikey

        for (int i = -half; i <= half; i++)
        {
            float xOffset = i * offsetX;
            float yOffset = i * offsetY;

            // Alt
            GL.Vertex3(x, y + yOffset, 0); GL.Vertex3(x + w, y + yOffset, 0);
            // Üst
            GL.Vertex3(x, y + h + yOffset, 0); GL.Vertex3(x + w, y + h + yOffset, 0);
            // Sol
            GL.Vertex3(x + xOffset, y, 0); GL.Vertex3(x + xOffset, y + h, 0);
            // Sağ
            GL.Vertex3(x + w + xOffset, y, 0); GL.Vertex3(x + w + xOffset, y + h, 0);
        }

        GL.End();
    }
    #endregion
    #region Draw Grid
    private void DrawGrid(int xCount, int yCount, Color c, int thickness, float aspect)
    {
        GL.Begin(GL.LINES);
        GL.Color(c);

        int half = thickness / 2;
        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;

        for (int t = -half; t <= half; t++)
        {
            float xOff = t * offsetX;
            float yOff = t * offsetY;

            for (int i = 1; i < xCount; i++)
            {
                float x = i / (float)xCount + xOff;
                GL.Vertex3(x, 0, 0); GL.Vertex3(x, 1, 0);
            }

            for (int j = 1; j < yCount; j++)
            {
                float y = j / (float)yCount + yOff;
                GL.Vertex3(0, y, 0); GL.Vertex3(1, y, 0);
            }
        }
        GL.End();
    }
    #endregion
    #region Draw Grid Labels
    private void DrawGridLabels(int xCount, int yCount, Color c, Camera cam)
    {
        var mat = new Material(Shader.Find("Unlit/Color"));
        mat.color = c;
        float addX = 0, addY = 0;
        int aX = ScreenChartsConfig.screenGrid.ax;
        int aY = ScreenChartsConfig.screenGrid.ay;
        Rect camRect = cam.pixelRect; 
        GUIStyle style;
        GUI.depth = -1;

        Handles.BeginGUI();
        Camera gameCam = Camera.current ?? Camera.main;
        if (cam == Camera.main)
        {
            float shortEdge = Mathf.Min(cam.pixelWidth, cam.pixelHeight);
            int fontSize = Mathf.RoundToInt(6f + (Mathf.Sqrt(shortEdge) - Mathf.Sqrt(512f)) / (Mathf.Sqrt(2048f) - Mathf.Sqrt(512f)) * 6f);
            fontSize = Mathf.Clamp(fontSize, 6, 24);
            float fSizeMult = (float)(ScreenChartsConfig.screenGrid.fontSize /8f);

            style = new GUIStyle()
            {
                
                alignment = TextAnchor.UpperLeft,
                fontSize = fontSize * Mathf.RoundToInt(fSizeMult),
                fontStyle = FontStyle.Bold,
                normal = { textColor = c }
                
            };
            addX = camRect.width / ((float)xCount);
            addY = camRect.height / ((float)yCount);
        }
        else
        {
            style = new GUIStyle()
            {
                alignment = TextAnchor.UpperLeft,
                fontSize = 14,
                fontStyle = FontStyle.Normal,
                normal = { textColor = c }
            };
            addX = camRect.width / ((float)xCount + ((float)xCount / 2f));
            addY = camRect.height / ((float)yCount + ((float)yCount / 2f));
        }


        for (int i = 1; i < xCount+1; i++)
        {
            // X labels
            float nx = ((float)i - 1) / ((float)xCount);
            Vector2 pt = new Vector2((camRect.x + nx) + (addX * (i - 1)), camRect.y + aY);
            GUI.Label(new Rect(pt.x + aX, pt.y, 80, 80), i.ToString(), style);
        }
        for (int j = 1; j < yCount+1; j++)
        {
            // Y labels
            float ny = ((float)j-1) / ((float)yCount);
            Vector2 pt = new Vector2(camRect.x + aX, (camRect.y + ny) + (addY * (j - 1)));
            GUI.Label(new Rect(pt.x, pt.y + aY , 80, 80), j.ToString(), style);
        }
        Handles.EndGUI();
    }
    #endregion
    #region Draw Golden Frame
    private void DrawGoldenFrame(Color c, int thickness, float coeff, float aspect)
    {
        int half = thickness / 2;
        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;
        float golden = 1f / 1.618f;
        float left = 0;
        float right = 1;
        float top = 1;
        float bottom = 0;
        float cf = ScreenChartsConfig.goldenFrame.iterCoeff / 3f;

        for (int i = 0; i < ScreenChartsConfig.goldenFrame.iterations; i++)
        {
            for (int t = -half; t <= half; t++)
            {
                float xOff = t * offsetX;
                float yOff = t * offsetY;

                GL.Begin(GL.LINES);
                GL.Color(c);

                float w = right - left;
                float h = top - bottom;

                float gx = w * golden * coeff;
                float gy = h * golden * coeff;

                // dikey
                GL.Vertex3(left + gx + xOff, bottom + 1, 0); GL.Vertex3(left + gx + xOff, top - 1, 0);
                GL.Vertex3(right - gx + xOff, bottom + 1, 0); GL.Vertex3(right - gx + xOff, top - 1, 0);

                // yatay
                GL.Vertex3(left - 1, bottom + gy + yOff, 0); GL.Vertex3(right + 1, bottom + gy + yOff, 0);
                GL.Vertex3(left - 1, top - gy + yOff, 0); GL.Vertex3(right + 1, top - gy + yOff, 0);

                GL.End();
            }

            left += golden * (right - left) * cf;
            right -= golden * (right - left) * cf;
            bottom += golden * (top - bottom) * cf;
            top -= golden * (top - bottom) * cf;
        }
    }
    #endregion
    #region Draw Crosshair
    private void DrawCrosshair(float aspect)
    {
        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;
        int half;

        float cx = ScreenChartsConfig.crosshair.center.x;
        float cy = ScreenChartsConfig.crosshair.center.y;

        #region Plus
        half = ScreenChartsConfig.crosshair.plusThickness / 2;
        for (int i = -half; i <= half; i++)
        {
            float xOff = i * offsetX;
            float yOff = i * offsetY;

            if (ScreenChartsConfig.crosshair.plus)
            {
                GL.Begin(GL.LINES);
                GL.Color(ScreenChartsConfig.crosshair.plusColor);

                float wx = ScreenChartsConfig.crosshair.plusSize / aspect;
                float wy = ScreenChartsConfig.crosshair.plusSize;
                GL.Vertex3(cx - wx + xOff, cy + yOff, 0); GL.Vertex3(cx + wx + xOff, cy + yOff, 0);
                GL.Vertex3(cx + xOff, cy - wy + yOff, 0); GL.Vertex3(cx + xOff, cy + wy + yOff, 0);
            }

        }
        #endregion
        #region X Cross
        half = ScreenChartsConfig.crosshair.xThickness / 2;
        for (int i = -half; i <= half; i++)
        {
            float xOff = i * offsetX;
            float yOff = i * offsetY;

            if (ScreenChartsConfig.crosshair.x)
            {
                GL.Begin(GL.LINES);
                GL.Color(ScreenChartsConfig.crosshair.xColor);

                float wx = ScreenChartsConfig.crosshair.xSize / aspect;
                float wy = ScreenChartsConfig.crosshair.xSize;
                GL.Vertex3(cx - wx + xOff, cy - wy + yOff, 0); GL.Vertex3(cx + wx + xOff, cy + wy + yOff, 0);
                GL.Vertex3(cx - wx + xOff, cy + wy + yOff, 0); GL.Vertex3(cx + wx + xOff, cy - wy + yOff, 0);
            }
        }
        #endregion
        #region Circle
        half = ScreenChartsConfig.crosshair.circleThickness / 2;
        for (int i = -half; i <= half; i++)
        {
            float xOff = i * offsetX;
            float yOff = i * offsetY;

            if (ScreenChartsConfig.crosshair.circle)
            {
                GL.Begin(GL.LINES);
                GL.Color(ScreenChartsConfig.crosshair.circleColor);

                int segments = ScreenChartsConfig.crosshair.circleSegment;
                for (int ii = 0; ii < ScreenChartsConfig.crosshair.circleIter; ii++)
                {
                    for (int s = 0; s < segments; s++)
                    {
                        float a0 = s * Mathf.PI * 2f / segments;
                        float a1 = (s + 1) * Mathf.PI * 2f / segments;

                        float r = ScreenChartsConfig.crosshair.circleSize - ii * ScreenChartsConfig.crosshair.circleSpacing;
                        GL.Vertex3(cx + Mathf.Cos(a0) * r / aspect + xOff, cy + Mathf.Sin(a0) * r + yOff, 0);
                        GL.Vertex3(cx + Mathf.Cos(a1) * r / aspect + xOff, cy + Mathf.Sin(a1) * r + yOff, 0);
                    }
                }
            }
        }
        #endregion

        GL.End();
    }
    #endregion
    #region Draw Center Cross
    public void DrawCross(float aspect)
    {
        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;
        int half;

        float cx = ScreenChartsConfig.centerCross.center.x;
        float cy = ScreenChartsConfig.centerCross.center.y;

        half = ScreenChartsConfig.centerCross.thickness / 2;
        for (int i = -half; i <= half; i++)
        {
            float xOff = i * offsetX;
            float yOff = i * offsetY;

            GL.Begin(GL.LINES);
            GL.Color(ScreenChartsConfig.centerCross.color);

            float wx = ScreenChartsConfig.centerCross.size;
            float wy = ScreenChartsConfig.centerCross.size;
            GL.Vertex3(cx - wx + xOff, cy - wy + yOff, 0); GL.Vertex3(cx + wx + xOff, cy + wy + yOff, 0);
            GL.Vertex3(cx - wx + xOff, cy + wy + yOff, 0); GL.Vertex3(cx + wx + xOff, cy - wy + yOff, 0);
        }
        GL.End();

    }
    #endregion
    #region Draw Fibonacci Spiral 
    private void DrawSingleFibonacciSpiral(
        Vector2 center,
        Color color,
        float aspect,
        int thickness,
        float scale,
        int segments,
        float step,
        float rotation,
        int flip,
        bool enabled)
    {
        if (!enabled) return;

        float phi = (1f + Mathf.Sqrt(5f)) * 0.5f;
        int half = Mathf.Max(0, thickness / 2);

        float W = Mathf.Max(1, Screen.width);
        float H = Mathf.Max(1, Screen.height);
        Vector2 centerPx = new Vector2(center.x * W, center.y * H);

        float minDim = Mathf.Min(W, H);
        float scalePx = Mathf.Max(1f, scale * minDim); // en az 1 px olsun

        float rotRad = rotation * Mathf.Deg2Rad;
        float cosR = Mathf.Cos(rotRad);
        float sinR = Mathf.Sin(rotRad);

        for (int t = -half; t <= half; t++)
        {
            GL.Begin(GL.LINES);
            GL.Color(color);

            float a = 0f;
            float prevNX = 0f, prevNY = 0f;
            bool firstPoint = true;

            // derive drawing mode from `flip` (customize mapping if you need different behaviour)
            // mapping here:
            // 0 -> drawX only, X clockwise
            // 1 -> drawY only, Y clockwise
            // 2 -> drawX only, X counter-clockwise
            // 3 -> drawY only, Y counter-clockwise
            // You can change this switch to match whatever "flip" semantics you want.
            bool drawX = false, drawY = false;
            bool clockwiseX = true, clockwiseY = true;
            switch (flip)
            {
                case 0: drawX = true; drawY = false; clockwiseX = true; clockwiseY = true; break;
                case 1: drawX = false; drawY = true; clockwiseX = true; clockwiseY = true; break;
                case 2: drawX = true; drawY = false; clockwiseX = false; clockwiseY = true; break;
                case 3: drawX = false; drawY = true; clockwiseX = true; clockwiseY = false; break;
                default: drawX = true; drawY = false; clockwiseX = true; clockwiseY = true; break;
            }

            for (int i = 0; i <= segments; i++)
            {
                float r = scalePx / Mathf.Pow(phi, a / (Mathf.PI * 0.5f));

                float lx = 0f, ly = 0f;

                if (drawX)
                {
                    float sX = clockwiseX ? 1f : -1f;
                    lx += r * Mathf.Cos(a) * sX;
                    ly += r * Mathf.Sin(a);
                }

                if (drawY)
                {
                    float sY = clockwiseY ? 1f : -1f;
                    lx += r * Mathf.Sin(a);
                    ly += r * Mathf.Cos(a) * sY;
                }

                float rx = cosR * lx - sinR * ly;
                float ry = sinR * lx + cosR * ly;

                float fx = centerPx.x + rx;
                float fy = centerPx.y + ry;

                float fxOff = fx + t;
                float fyOff = fy + t;
                float nx = fxOff / W;
                float ny = fyOff / H;

                if (!firstPoint)
                {
                    GL.Vertex3(prevNX, prevNY, 0);
                    GL.Vertex3(nx, ny, 0);
                }
                else
                {
                    firstPoint = false;
                }

                prevNX = nx;
                prevNY = ny;

                a += step;
            }

            GL.End();
        }
    }
    #endregion
    #region Boxes
    private void DrawBox(Vector2 center, Vector2 size, Color color, int iter, float aspect, float step, float dstep, bool golden, bool enabled, float rotationDeg = 0f)
    {
        if (!enabled) return;
        float w = size.x / aspect;
        float h = size.y;
        float cx = center.x;
        float cy = center.y;
        for (int i = 0; i < iter; i++)
        {
            DrawSingleBox(cx, cy, w, h, color, rotationDeg);
            if (golden)
            {
                w /= dstep;
                h /= dstep;
            }
            else
            {
                w -= step / aspect;
                h -= step;
            }
        }
    }

    private void DrawSingleBox(float cx, float cy, float w, float h, Color color, float rotationDeg = 0f)
    {
        float halfW = w * 0.5f;
        float halfH = h * 0.5f;

        // Precompute rotation
        float rad = rotationDeg * Mathf.Deg2Rad;
        float cosR = Mathf.Cos(rad);
        float sinR = Mathf.Sin(rad);

        // local corners (relative to center)
        Vector2[] local = new Vector2[4]
        {
            new Vector2(-halfW, -halfH), // a
            new Vector2( halfW, -halfH), // b
            new Vector2( halfW,  halfH), // c
            new Vector2(-halfW,  halfH)  // d
        };

        GL.Begin(GL.LINES);
        GL.Color(color);

        // If no rotation, draw faster without scaling math
        if (Mathf.Approximately(rotationDeg, 0f))
        {
            for (int i = 0; i < 4; i++)
            {
                Vector2 la = local[i];
                Vector2 lb = local[(i + 1) % 4];

                Vector3 va = new Vector3(cx + la.x, cy + la.y, 0f);
                Vector3 vb = new Vector3(cx + lb.x, cy + lb.y, 0f);

                GL.Vertex(va); GL.Vertex(vb);
            }
        }
        else
        {
            // To rotate correctly on non-square screens we rotate in "height-units"
            // Scale X by aspect (width/height), rotate, then unscale X back.
            for (int i = 0; i < 4; i++)
            {
                Vector2 la = local[i];
                Vector2 lb = local[(i + 1) % 4];

                // scale X by aspect so rotation uses consistent units
                Vector2 laS = new Vector2(la.x * aspect, la.y);
                Vector2 lbS = new Vector2(lb.x * aspect, lb.y);

                Vector2 raS = new Vector2(cosR * laS.x - sinR * laS.y, sinR * laS.x + cosR * laS.y);
                Vector2 rbS = new Vector2(cosR * lbS.x - sinR * lbS.y, sinR * lbS.x + cosR * lbS.y);

                // unscale X back to normalized coordinates
                Vector3 va = new Vector3(cx + raS.x / aspect, cy + raS.y, 0f);
                Vector3 vb = new Vector3(cx + rbS.x / aspect, cy + rbS.y, 0f);

                GL.Vertex(va); GL.Vertex(vb);
            }
        }

        GL.End();
    }
    #endregion
    #region Circles
    private void DrawInCircles(float aspect)
    {
        if (ScreenChartsConfig.inCircles == null || ScreenChartsConfig.inCircles.Count == 0) return;

        for (int idx = 0; idx < ScreenChartsConfig.inCircles.Count; idx++)
        {
            var c = ScreenChartsConfig.inCircles[idx];
            if (!c.enabled) continue;
            DrawSingleCircle(c.center, c.color, c.startRadius, c.spacing, c.dSpacing, c.count, c.segment, c.thickness, c.rotation, c.enabled, c.golden, aspect);
        }
    }

    private void DrawSingleCircle(Vector2 center, Color color, float startRadius, float spacing, float dSpacing, int count, int segments, int thickness, float rotationDeg, bool enabled, bool golden, float aspect)
    {
        if (count <= 0 || segments < 3 || !enabled) return;

        float r = 1f;
        int half = Mathf.Max(0, thickness / 2);
        float rotRad = rotationDeg * Mathf.Deg2Rad;
        float cosR = Mathf.Cos(rotRad);
        float sinR = Mathf.Sin(rotRad);

        for (int t = -half; t <= half; t++)
        {
            float xOff = t * (1f / Screen.width);
            float yOff = t * (1f / Screen.height);

            GL.Begin(GL.LINES);
            GL.Color(color);

            for (int i = 0; i < count; i++)
            {
                if (golden)
                {
                    r = (startRadius / 2f) / (i * dSpacing);
                }
                else
                {
                    r = (startRadius / 2f) - (i * spacing);
                }
                if (r <= 0f) continue;

                for (int s = 0; s < segments; s++)
                {
                    float a0 = s * Mathf.PI * 2f / segments;
                    float a1 = (s + 1) * Mathf.PI * 2f / segments;

                    // compute rotated point in "height units" to respect aspect
                    float x0 = Mathf.Cos(a0) * r;
                    float y0 = Mathf.Sin(a0) * r;
                    float x1 = Mathf.Cos(a1) * r;
                    float y1 = Mathf.Sin(a1) * r;

                    // apply rotation (in same units)
                    float rx0 = cosR * x0 - sinR * y0;
                    float ry0 = sinR * x0 + cosR * y0;
                    float rx1 = cosR * x1 - sinR * y1;
                    float ry1 = sinR * x1 + cosR * y1;

                    // aspect correction: convert X from "height units" to normalized X positions
                    float nx0 = center.x + (rx0 / aspect) + xOff;
                    float ny0 = center.y + ry0 + yOff;
                    float nx1 = center.x + (rx1 / aspect) + xOff;
                    float ny1 = center.y + ry1 + yOff;

                    GL.Vertex3(nx0, ny0, 0);
                    GL.Vertex3(nx1, ny1, 0);
                }
            }

            GL.End();
        }
    }
    #endregion
    #region Phyllotaxis
    private void Phyllotaxis()
    {
        Debug.Log("ciz");
        var cfg = ScreenChartsConfig.phyllotaxis;
        if (!cfg.enabled) return;

        GL.Begin(GL.QUADS);
        GL.Color(cfg.color);

        for (int i = 0; i < ScreenChartsConfig.phyllotaxis.numPoints; i++)
        {
            float theta = Mathf.Deg2Rad * (i * cfg.angle - 1f);
            float x = cfg.cval * Mathf.Sqrt(i * 1f) * Mathf.Cos(theta);
            float z = cfg.cval * Mathf.Sqrt(i * 1f) * Mathf.Sin(theta);

            float nx = ScreenChartsConfig.phyllotaxis.center.x + (x / aspect) * 0.1f;
            float ny = ScreenChartsConfig.phyllotaxis.center.y + z * 0.1f;

            float s = ((ScreenChartsConfig.phyllotaxis.size * 0.2f) + 0.1f) * 0.01f;

            GL.Vertex3(nx - (s/aspect), ny - s, 0);
            GL.Vertex3(nx + (s/aspect), ny - s, 0);
            GL.Vertex3(nx + (s/aspect), ny + s, 0);
            GL.Vertex3(nx - (s/aspect), ny + s, 0);
        }

        GL.End();
    }
    #endregion

    #region Golden Tests

    #region Fibonacci Grid Yanlis
    /// <summary>
    /// Altın oran ile iç içe dikdörtgenler ve onların köşegen çizgileri.
    /// Tüm koordinatlar 0-1 arası (normalized).
    /// </summary>
    private void DrawFibonacciGrid(Vector2 center,
                                   float size,
                                   Color color,
                                   int thickness,
                                   int iterations,
                                   float aspect)
    {
        const float golden = 1.61803398875f;

        float left = center.x - size * 0.5f;
        float right = center.x + size * 0.5f;
        float bottom = center.y - size * 0.5f;
        float top = center.y + size * 0.5f;

        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;

        for (int i = 0; i < iterations; i++)
        {
            float w = right - left;
            float h = top - bottom;

            float square = Mathf.Min(w, h);            // çıkarılacak kare kenarı
            float goldenSquare = square / golden;      // altın oranlı dikdörtgen

            /*  kalınlık için multi-line  */
            for (int t = -thickness / 2; t <= thickness / 2; t++)
            {
                float ox = t * offsetX;
                float oy = t * offsetY;

                GL.Begin(GL.LINES);
                GL.Color(color);

                /*  dikey çizgiler  */
                float vx1 = left + goldenSquare + ox;
                float vx2 = right - goldenSquare + ox;
                GL.Vertex3(vx1, bottom + oy, 0);
                GL.Vertex3(vx1, top + oy, 0);
                GL.Vertex3(vx2, bottom + oy, 0);
                GL.Vertex3(vx2, top + oy, 0);

                /*  yatay çizgiler  */
                float hy1 = bottom + goldenSquare + oy;
                float hy2 = top - goldenSquare + oy;
                GL.Vertex3(left + ox, hy1, 0);
                GL.Vertex3(right + ox, hy1, 0);
                GL.Vertex3(left + ox, hy2, 0);
                GL.Vertex3(right + ox, hy2, 0);

                GL.End();
            }

            /*  bir sonraki iç dikdörtgene daral  */
            if (w > h)      // yatay uzunsa → soldan kırp
                left += goldenSquare;
            else            // dikey uzunsa → alttan kırp
                bottom += goldenSquare;
        }
    }
    #endregion
    #region Fibonacci Blocks Yanlis
    private void DrawFibonacciBlocks(Vector2 centerNorm, int count, Color color, int thickness)
    {
        float[] fib = new float[count];
        fib[0] = 1f;
        fib[1] = 1f;
        for (int i = 2; i < count; i++)
            fib[i] = fib[i - 1] + fib[i - 2];

        float scale = 0.005f; // Kare boyutunu ekrana göre ayarla
        float px = centerNorm.x;
        float py = centerNorm.y;

        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;

        // Başlangıç: merkezden sola ve yukarıya doğru offset
        float x = px - fib[0] * scale * 0.5f;
        float y = py - fib[0] * scale * 0.5f;

        for (int i = 0; i < count; i++)
        {
            float size = fib[i] * scale;
            float half = thickness / 2f;

            for (int t = -thickness / 2; t <= thickness / 2; t++)
            {
                float ox = t * offsetX;
                float oy = t * offsetY;

                GL.Begin(GL.LINES);
                GL.Color(color);

                // Kare kenarları
                GL.Vertex3(x + ox, y + oy, 0);
                GL.Vertex3(x + size + ox, y + oy, 0);

                GL.Vertex3(x + size + ox, y + oy, 0);
                GL.Vertex3(x + size + ox, y + size + oy, 0);

                GL.Vertex3(x + size + ox, y + size + oy, 0);
                GL.Vertex3(x + ox, y + size + oy, 0);

                GL.Vertex3(x + ox, y + size + oy, 0);
                GL.Vertex3(x + ox, y + oy, 0);

                GL.End();
            }

            // Sonraki kareye geç: saat yönünde döngü
            // Yön: sağ → yukarı → sol → aşağı
            int dir = i % 4;
            if (dir == 0)       // sağ
                x += size;
            else if (dir == 1)  // yukarı
                y += size;
            else if (dir == 2)  // sol
                x -= fib[i + 1] * scale;
            else                // aşağı
                y -= fib[i + 1] * scale;
        }
    }
    #endregion
    #region Fibonacci Squares Yanlis
    // ----------  Kareler (KARE) ----------
    private void DrawFibonacciSquares(Vector2 centerNorm, int count, Color color, int thickness)
    {
        float size;
        float basePx = 10f; // 1 fib birimi = kaç px
        float[] fib = new float[count];
        fib[0] = 1f; fib[1] = 1f;
        // karesel ölçek: kısa kenar üzerinden
        float shortEdgePx = Mathf.Min(Screen.width, Screen.height);
        float scale = basePx / shortEdgePx; // px → normalized

        float px = centerNorm.x;
        float py = centerNorm.y;

        for (int i = 2; i < count; i++)
        {
            fib[i] = fib[i - 1] + fib[i - 2];
        }
        Vector2 centerPx = new Vector2(centerNorm.x * Screen.width,
                                       centerNorm.y * Screen.height);
        Vector2 startPx = centerPx - Vector2.one * (fib[0] * basePx * 0.5f);

        float offsetX = 1f / Screen.width;
        float offsetY = 1f / Screen.height;

        float x = px - fib[0] * scale * 0.5f;
        float y = py - fib[0] * scale * 0.5f;

        float off = thickness * 0.05f;

        size = 0.05f;
        for (int t = -thickness / 2; t <= thickness / 2; t++)
        {
            float ox = t * offsetX;
            float oy = t * offsetY;
            GL.Begin(GL.QUADS);
            GL.Color(color);

            Vector2 pos = startPx;
            for (int i = 0; i < count; i++)
            {
                float s = fib[i] * basePx; // karenin kenarı (px)

                GL.Vertex3(x + ox, y + oy, 0);
                GL.Vertex3(x + size + ox, y + oy, 0);

                GL.Vertex3(x + size + ox, y + oy, 0);
                GL.Vertex3(x + size + ox, y + size + oy, 0);

                GL.Vertex3(x + size + ox, y + size + oy, 0);
                GL.Vertex3(x + ox, y + size + oy, 0);

                GL.Vertex3(x + ox, y + size + oy, 0);
                GL.Vertex3(x + ox, y + oy, 0);

                //Vector2 p0 = pos + Vector2.right * o;
                //Vector2 p1 = pos + Vector2.right * (s + o);
                //Vector2 p2 = pos + Vector2.one * (s + o);
                //Vector2 p3 = pos + Vector2.up * (s + o);

                // normalization → GL
                //GL.Vertex3(p0.x , p0.y, 0);
                //GL.Vertex3(p1.x , p1.y, 0);
                //GL.Vertex3(p2.x, p2.y, 0);
                //GL.Vertex3(p3.x, p3.y, 0);

                // bir sonraki kareye geç
                int dir = i % 4;
                if (i == count - 1) break;
                switch (dir)
                {
                    case 0: pos.x += s; break;
                    case 1: pos.y += s; break;
                    case 2: pos.x -= fib[i + 1] * basePx; break;
                    case 3: pos.y -= fib[i + 1] * basePx; break;
                }
            }
            GL.End();
        }
    }

    #endregion
    #region DrawFibonacciSpiralContinuous Yanlis
    // ----------  Kesintisiz Spiral ----------
    private void DrawFibonacciSpiralContinuous(Vector2 centerNorm, int count, Color color)
    {
        float basePx = 10f; // karelerle AYNI
        float[] fib = new float[count];
        fib[0] = 1f; fib[1] = 1f;
        for (int i = 2; i < count; i++) fib[i] = fib[i - 1] + fib[i - 2];

        float shortEdgePx = Mathf.Min(Screen.width, Screen.height);
        float scale = basePx / shortEdgePx; // normalized

        Vector2 centerPx = new Vector2(centerNorm.x * Screen.width,
                                       centerNorm.y * Screen.height);
        Vector2 startPx = centerPx - Vector2.one * (fib[0] * basePx * 0.5f);

        GL.Begin(GL.LINE_STRIP);
        GL.Color(color);

        Vector2 pos = startPx;
        Vector2 lastPoint = Vector2.zero;

        for (int i = 0; i < count; i++)
        {
            float r = fib[i] * basePx; // radius = karenin kenarı (px)
            int segs = 64;
            int dir = i % 4;

            Vector2 centerCircle = Vector2.zero;
            float baseAng = 180f + dir * 90f;

            switch (dir)
            {
                case 0: centerCircle = pos; break;
                case 1: centerCircle = pos + Vector2.right * r; break;
                case 2: centerCircle = pos + Vector2.one * r; break;
                case 3: centerCircle = pos + Vector2.up * r; break;
            }

            /*  başlangıç = önceki bitiş  */
            if (i == 0)
                lastPoint = centerCircle + new Vector2(Mathf.Cos(baseAng * Mathf.Deg2Rad),
                                                       Mathf.Sin(baseAng * Mathf.Deg2Rad)) * r;
            else
                GL.Vertex3(lastPoint.x / Screen.width, lastPoint.y / Screen.height, 0);

            /*  quarter-circle (son nokta dahil)  */
            for (int s = 1; s <= segs; s++)
            {
                float ang = Mathf.Deg2Rad * (baseAng - s * 90f / segs);
                lastPoint = centerCircle + new Vector2(Mathf.Cos(ang), Mathf.Sin(ang)) * r;
                GL.Vertex3(lastPoint.x / Screen.width, lastPoint.y / Screen.height, 0);
            }

            // bir sonraki kareye geç
            if (i == count - 1) break;
            switch (dir)
            {
                case 0: pos.x += r; break;
                case 1: pos.y += r; break;
                case 2: pos.x -= fib[i + 1] * basePx; break;
                case 3: pos.y -= fib[i + 1] * basePx; break;
            }
        }

        GL.End();
    }
    #endregion
    #region Fibonacci Boxes Yanlis
    private void DrawFibonacciBoxes(Vector2 center, int count, float scale, Color color, float aspect)
    {
        Vector2 C = center;
        float F = 1f, _F = 0f, f;

        GL.Begin(GL.LINES);
        GL.Color(color);

        for (int i = 0; i < count; i++)
        {
            Vector2 V = new Vector2(Mathf.Cos(1.5708f * (i + 1)), Mathf.Cos(1.5708f * i));
            float r = F * 0.5f * scale;
            Vector2 P = C - r * new Vector2(V.y + V.x, V.y - V.x);

            // Aspect düzeltmesi (ekran en-boy oranına göre kare koruma)
            float w = r * aspect;
            float h = r;

            // Dört köşe
            Vector3 a = new Vector3(P.x - w, P.y - h, 0);
            Vector3 b = new Vector3(P.x + w, P.y - h, 0);
            Vector3 c = new Vector3(P.x + w, P.y + h, 0);
            Vector3 d = new Vector3(P.x - w, P.y + h, 0);

            // Kare çizgileri
            GL.Vertex(a); GL.Vertex(b);
            GL.Vertex(b); GL.Vertex(c);
            GL.Vertex(c); GL.Vertex(d);
            GL.Vertex(d); GL.Vertex(a);

            // Fibonacci ilerleme
            C += _F * V;
            f = F;
            F += _F;
            _F = f;
        }

        GL.End();
    }
    #endregion

    #endregion
}

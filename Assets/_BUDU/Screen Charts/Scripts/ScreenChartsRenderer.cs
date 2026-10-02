// © BUDU Games 2024 - 2026

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
        CreateMaterial();
        // Unity 6 SRP uyumlu event kaydı
        RenderPipelineManager.endCameraRendering += OnEndCameraRendering;

#if UNITY_EDITOR
        SceneView.duringSceneGui += OnSceneGUI;
#endif
    }

    private void OnDisable()
    {
        RenderPipelineManager.endCameraRendering -= OnEndCameraRendering;

#if UNITY_EDITOR
        SceneView.duringSceneGui -= OnSceneGUI;
#endif
    }

    private static void CreateMaterial()
    {
        if (!lineMaterial)
        {
            Shader shader = Shader.Find("Hidden/Internal-Colored");
            lineMaterial = new Material(shader);
            lineMaterial.hideFlags = HideFlags.HideAndDontSave;
            lineMaterial.SetInt("_SrcBlend", (int)BlendMode.SrcAlpha);
            lineMaterial.SetInt("_DstBlend", (int)BlendMode.OneMinusSrcAlpha);
            lineMaterial.SetInt("_Cull", (int)CullMode.Off);
            lineMaterial.SetInt("_ZWrite", 0);
        }
    }

    private void OnEndCameraRendering(ScriptableRenderContext context, Camera camera)
    {
        // Sadece Game ve Scene kameralarına çizim yap
        bool isSceneView = camera.cameraType == CameraType.SceneView && ScreenChartsConfig.showInSceneView;
        bool isGameView = camera.cameraType == CameraType.Game && ScreenChartsConfig.showInGameView;

        if (isSceneView || isGameView)
        {
            DrawAllCharts(camera);
        }
    }

    private void OnSceneGUI(SceneView sceneView)
    {
        if (ScreenChartsConfig.showInSceneView && ScreenChartsConfig.screenGrid.showLabels && ScreenChartsConfig.screenGrid.enabled)
        {
            DrawGridLabels(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.labelColor, sceneView.camera);
        }
    }

    private void OnGUI()
    {
        if (ScreenChartsConfig.showInGameView && ScreenChartsConfig.screenGrid.showLabels && ScreenChartsConfig.screenGrid.enabled)
        {
            Camera cam = GetComponent<Camera>();
            if (cam.cameraType == CameraType.Game)
                DrawGridLabels(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.labelColor, cam);
        }
    }

    private void DrawAllCharts(Camera cam)
    {
        if (lineMaterial == null) CreateMaterial();

        lineMaterial.SetPass(0);
        GL.PushMatrix();
        GL.LoadOrtho();

        // Aspect oranını o an render edilen kameradan alıyoruz (Unity 6 fix)
        aspect = (float)cam.pixelWidth / (float)cam.pixelHeight;

        #region Background Overlay
        if (ScreenChartsConfig.showBackgroundOverlay)
        {
            GL.Begin(GL.QUADS);
            GL.Color(ScreenChartsConfig.backgroundOverlayColor);
            GL.Vertex3(0, 0, 0); GL.Vertex3(1, 0, 0); GL.Vertex3(1, 1, 0); GL.Vertex3(0, 1, 0);
            GL.End();
        }
        #endregion

        #region Screen / Safe Frames
        if (ScreenChartsConfig.screenFrame.enabled)
            DrawRectangle(0f, 0f, 1f, 1f, ScreenChartsConfig.screenFrame.color, ScreenChartsConfig.screenFrame.thickness, cam);

        if (ScreenChartsConfig.safeArea.showSafeArea)
        {
            float perc = ScreenChartsConfig.safeArea.screenPercent;
            DrawRectangle((1f - perc) / 2f, (1f - perc) / 2f, perc, perc, ScreenChartsConfig.safeArea.color, ScreenChartsConfig.safeArea.thickness, cam);
        }

        if (ScreenChartsConfig.safeTitle.showSafeTitle)
        {
            float perc = ScreenChartsConfig.safeTitle.titlePercent;
            DrawRectangle((1f - perc) / 2f, (1f - perc) / 2f, perc, perc, ScreenChartsConfig.safeTitle.color, ScreenChartsConfig.safeArea.thickness, cam);
        }
        #endregion

        #region Grid
        if (ScreenChartsConfig.screenGrid.enabled)
            DrawGrid(ScreenChartsConfig.screenGrid.gridX, ScreenChartsConfig.screenGrid.gridY, ScreenChartsConfig.screenGrid.color, ScreenChartsConfig.screenGrid.thickness, cam);
        #endregion

        #region Golden Frame
        if (ScreenChartsConfig.goldenFrame.enabled)
            DrawGoldenFrame(ScreenChartsConfig.goldenFrame.color, ScreenChartsConfig.goldenFrame.thickness, ScreenChartsConfig.goldenFrame.coeff, cam);
        #endregion

        #region Fibonacci Spirals
        if (ScreenChartsConfig.showFibonacci)
        {
            for (int i = 0; i < ScreenChartsConfig.fibonacciSpirals.Count; i++)
            {
                DrawSingleFibonacciSpiral(cam, ScreenChartsConfig.fibonacciSpirals[i]);
            }
        }
        #endregion

        #region Crosshairs
        if (ScreenChartsConfig.crosshair.enabled)
            DrawCrosshair(cam);

        if (ScreenChartsConfig.centerCross.enabled)
            DrawCross(cam);
        #endregion

        #region In Boxes
        if (ScreenChartsConfig.showInBoxes)
        {
            for (int i = 0; i < ScreenChartsConfig.inBoxes.Count; i++)
            {
                var box = ScreenChartsConfig.inBoxes[i];
                DrawBox(cam, box);
            }
        }
        #endregion

        #region In Circles
        if (ScreenChartsConfig.showInCircles)
        {
            foreach (var c in ScreenChartsConfig.inCircles)
            {
                if (c.enabled)
                    DrawSingleCircle(cam, c);
            }
        }
        #endregion

        #region Phyllotaxis
        if (ScreenChartsConfig.phyllotaxis.enabled)
            DrawPhyllotaxis(cam);
        #endregion

        GL.PopMatrix();
    }

    // --- TEMEL ÇİZİM FONKSİYONLARI ---

    private void DrawRectangle(float x, float y, float w, float h, Color c, int thickness, Camera cam)
    {
        GL.Begin(GL.LINES);
        GL.Color(c);
        float offsetX = 1f / cam.pixelWidth;
        float offsetY = 1f / cam.pixelHeight;
        int half = thickness / 2;
        for (int i = -half; i <= half; i++)
        {
            float xO = i * offsetX; float yO = i * offsetY;
            GL.Vertex3(x, y + yO, 0); GL.Vertex3(x + w, y + yO, 0);
            GL.Vertex3(x, y + h + yO, 0); GL.Vertex3(x + w, y + h + yO, 0);
            GL.Vertex3(x + xO, y, 0); GL.Vertex3(x + xO, y + h, 0);
            GL.Vertex3(x + w + xO, y, 0); GL.Vertex3(x + w + xO, y + h, 0);
        }
        GL.End();
    }

    private void DrawGrid(int xCount, int yCount, Color c, int thickness, Camera cam)
    {
        GL.Begin(GL.LINES);
        GL.Color(c);
        float oX = 1f / cam.pixelWidth; float oY = 1f / cam.pixelHeight;
        int half = thickness / 2;
        for (int t = -half; t <= half; t++)
        {
            float xO = t * oX; float yO = t * oY;
            for (int i = 1; i < xCount; i++) { float x = i / (float)xCount + xO; GL.Vertex3(x, 0, 0); GL.Vertex3(x, 1, 0); }
            for (int j = 1; j < yCount; j++) { float y = j / (float)yCount + yO; GL.Vertex3(0, y, 0); GL.Vertex3(1, y, 0); }
        }
        GL.End();
    }

    private void DrawGoldenFrame(Color c, int thickness, float coeff, Camera cam)
    {
        float oX = 1f / cam.pixelWidth; float oY = 1f / cam.pixelHeight;
        float golden = 1f / 1.618f;
        float L = 0, R = 1, T = 1, B = 0;
        float cf = ScreenChartsConfig.goldenFrame.iterCoeff / 3f;

        for (int i = 0; i < ScreenChartsConfig.goldenFrame.iterations; i++)
        {
            GL.Begin(GL.LINES); GL.Color(c);
            float w = R - L; float h = T - B;
            float gx = w * golden * coeff; float gy = h * golden * coeff;
            GL.Vertex3(L + gx, B, 0); GL.Vertex3(L + gx, T, 0);
            GL.Vertex3(R - gx, B, 0); GL.Vertex3(R - gx, T, 0);
            GL.Vertex3(L, B + gy, 0); GL.Vertex3(R, B + gy, 0);
            GL.Vertex3(L, T - gy, 0); GL.Vertex3(R, T - gy, 0);
            GL.End();
            L += golden * (R - L) * cf; R -= golden * (R - L) * cf;
            B += golden * (T - B) * cf; T -= golden * (T - B) * cf;
        }
    }

    private void DrawSingleFibonacciSpiral(Camera cam, ScreenChartsConfig.FibonacciSpiral f)
    {
        if (!f.enabled) return;
        float phi = 1.618f;
        float W = cam.pixelWidth; float H = cam.pixelHeight;
        float scalePx = f.scale * Mathf.Min(W, H);
        float rotRad = f.rotation * Mathf.Deg2Rad;

        GL.Begin(GL.LINES); GL.Color(f.color);
        float a = 0f; Vector2 lastP = Vector2.zero;
        for (int i = 0; i <= f.segment; i++)
        {
            float r = scalePx / Mathf.Pow(phi, a / (Mathf.PI * 0.5f));
            float lx = r * Mathf.Cos(a); float ly = r * Mathf.Sin(a);
            // Flip & Rotation logic
            if (f.flip == 1 || f.flip == 3) lx *= -1;
            if (f.flip == 2 || f.flip == 3) ly *= -1;
            float rx = Mathf.Cos(rotRad) * lx - Mathf.Sin(rotRad) * ly;
            float ry = Mathf.Sin(rotRad) * lx + Mathf.Cos(rotRad) * ly;
            Vector2 p = new Vector2((f.center.x * W + rx) / W, (f.center.y * H + ry) / H);
            if (i > 0) { GL.Vertex3(lastP.x, lastP.y, 0); GL.Vertex3(p.x, p.y, 0); }
            lastP = p; a += f.step;
        }
        GL.End();
    }

    private void DrawCrosshair(Camera cam)
    {
        var ch = ScreenChartsConfig.crosshair;
        float oX = 1f / cam.pixelWidth; float oY = 1f / cam.pixelHeight;
        float cx = ch.center.x; float cy = ch.center.y;
        float asp = (float)cam.pixelWidth / cam.pixelHeight;

        GL.Begin(GL.LINES); GL.Color(ch.plusColor);
        if (ch.plus)
        {
            float sz = ch.plusSize;
            GL.Vertex3(cx - sz / asp, cy, 0); GL.Vertex3(cx + sz / asp, cy, 0);
            GL.Vertex3(cx, cy - sz, 0); GL.Vertex3(cx, cy + sz, 0);
        }
        if (ch.x)
        {
            GL.Color(ch.xColor); float sz = ch.xSize;
            GL.Vertex3(cx - sz / asp, cy - sz, 0); GL.Vertex3(cx + sz / asp, cy + sz, 0);
            GL.Vertex3(cx - sz / asp, cy + sz, 0); GL.Vertex3(cx + sz / asp, cy - sz, 0);
        }
        GL.End();
    }

    private void DrawCross(Camera cam)
    {
        var cc = ScreenChartsConfig.centerCross;
        GL.Begin(GL.LINES); GL.Color(cc.color);
        float sz = cc.size; float asp = (float)cam.pixelWidth / cam.pixelHeight;
        GL.Vertex3(cc.center.x - sz / asp, cc.center.y - sz, 0); GL.Vertex3(cc.center.x + sz / asp, cc.center.y + sz, 0);
        GL.Vertex3(cc.center.x - sz / asp, cc.center.y + sz, 0); GL.Vertex3(cc.center.x + sz / asp, cc.center.y - sz, 0);
        GL.End();
    }

    private void DrawBox(Camera cam, ScreenChartsConfig.InBox box)
    {
        float w = box.size.x / aspect; float h = box.size.y;
        float rad = box.rotation * Mathf.Deg2Rad;
        for (int i = 0; i < box.iter; i++)
        {
            GL.Begin(GL.LINES); GL.Color(box.color);
            Vector2[] pts = { new Vector2(-w / 2, -h / 2), new Vector2(w / 2, -h / 2), new Vector2(w / 2, h / 2), new Vector2(-w / 2, h / 2) };
            for (int j = 0; j < 4; j++)
            {
                Vector2 p1 = pts[j]; Vector2 p2 = pts[(j + 1) % 4];
                // Rotate
                p1 = new Vector2(p1.x * Mathf.Cos(rad) - p1.y * Mathf.Sin(rad), p1.x * Mathf.Sin(rad) + p1.y * Mathf.Cos(rad));
                p2 = new Vector2(p2.x * Mathf.Cos(rad) - p2.y * Mathf.Sin(rad), p2.x * Mathf.Sin(rad) + p2.y * Mathf.Cos(rad));
                GL.Vertex3(box.center.x + p1.x, box.center.y + p1.y, 0);
                GL.Vertex3(box.center.x + p2.x, box.center.y + p2.y, 0);
            }
            GL.End();
            if (box.golden) { w /= box.dstep; h /= box.dstep; } else { w -= box.step / aspect; h -= box.step; }
        }
    }

    private void DrawSingleCircle(Camera cam, ScreenChartsConfig.InCircle c)
    {
        float r; float rotRad = c.rotation * Mathf.Deg2Rad;
        for (int i = 0; i < c.count; i++)
        {
            r = c.golden ? (c.startRadius / 2f) / (i * c.dSpacing + 1) : (c.startRadius / 2f) - (i * c.spacing);
            if (r <= 0) continue;
            GL.Begin(GL.LINES); GL.Color(c.color);
            for (int s = 0; s < c.segment; s++)
            {
                float a0 = s * Mathf.PI * 2f / c.segment; float a1 = (s + 1) * Mathf.PI * 2f / c.segment;
                Vector2 p0 = new Vector2(Mathf.Cos(a0) * r / aspect, Mathf.Sin(a0) * r);
                Vector2 p1 = new Vector2(Mathf.Cos(a1) * r / aspect, Mathf.Sin(a1) * r);
                GL.Vertex3(c.center.x + p0.x, c.center.y + p0.y, 0); GL.Vertex3(c.center.x + p1.x, c.center.y + p1.y, 0);
            }
            GL.End();
        }
    }

    private void DrawPhyllotaxis(Camera cam)
    {
        var cfg = ScreenChartsConfig.phyllotaxis;
        GL.Begin(GL.QUADS); GL.Color(cfg.color);
        for (int i = 0; i < cfg.numPoints; i++)
        {
            float theta = i * cfg.angle * Mathf.Deg2Rad;
            float r = cfg.cval * Mathf.Sqrt(i) * 0.01f;
            float nx = cfg.center.x + r * Mathf.Cos(theta) / aspect;
            float ny = cfg.center.y + r * Mathf.Sin(theta);
            float s = cfg.size * 0.002f;
            GL.Vertex3(nx - s / aspect, ny - s, 0); GL.Vertex3(nx + s / aspect, ny - s, 0);
            GL.Vertex3(nx + s / aspect, ny + s, 0); GL.Vertex3(nx - s / aspect, ny + s, 0);
        }
        GL.End();
    }

    private void DrawGridLabels(int xCount, int yCount, Color c, Camera cam)
    {
        Rect camRect = cam.pixelRect;
        GUIStyle style = new GUIStyle { normal = { textColor = c }, fontSize = ScreenChartsConfig.screenGrid.fontSize, fontStyle = FontStyle.Bold };
        Handles.BeginGUI();
        for (int i = 1; i <= xCount; i++)
        {
            float nx = (float)(i - 1) / xCount;
            GUI.Label(new Rect(camRect.x + nx * camRect.width + ScreenChartsConfig.screenGrid.ax, camRect.y + ScreenChartsConfig.screenGrid.ay, 50, 20), i.ToString(), style);
        }
        for (int j = 1; j <= yCount; j++)
        {
            float ny = (float)(j - 1) / yCount;
            GUI.Label(new Rect(camRect.x + ScreenChartsConfig.screenGrid.ax, camRect.y + ny * camRect.height + ScreenChartsConfig.screenGrid.ay, 50, 20), j.ToString(), style);
        }
        Handles.EndGUI();
    }
}
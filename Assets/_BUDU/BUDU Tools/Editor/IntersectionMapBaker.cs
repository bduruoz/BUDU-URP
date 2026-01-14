// BUDU-Tools 2024 - 2025
// Intersection Map Baker

using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace budu.tools
{
    public class IntersectionMapBaker : EditorWindow
    {
        private Texture2D banner;
        Renderer quadRend;
        int resolution = 512;
        int dilateRadius = 2;
        bool combineAllOutlines = true;
        float blurAmount = 8f;
        float focus = 1f;

        [MenuItem("BUDU-Tools/Bakers/Intersection Map Baker")]
        static void Open() 
        { 
            GetWindow<IntersectionMapBaker>("Intersection Map Baker");
            IntersectionMapBaker window = GetWindow<IntersectionMapBaker>(true, "Intersection Map Baker");
            window.minSize = new Vector2(400, 400);
            window.maxSize = new Vector2(400, 400);
            window.Show();
        }

        private void OnEnable()
        {
            banner = (Texture2D)AssetDatabase.LoadAssetAtPath("Assets/_BUDU/GUI/BUDU-ToolsIntersectionMapBaker.png", typeof(Texture2D));
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
                GUILayout.Label("Intersection Map Baker", stl);
                GUILayout.FlexibleSpace();
                GUILayout.EndHorizontal();
            }
            GUILayout.Space(10);
            quadRend = Selection.activeGameObject?.GetComponent<Renderer>();
            EditorGUI.BeginDisabledGroup(true);
            quadRend = (Renderer)EditorGUILayout.ObjectField("Quad Renderer", quadRend, typeof(Renderer), true);
            EditorGUI.EndDisabledGroup();
            resolution = EditorGUILayout.IntSlider("Resolution", resolution, 64, 2048);
            dilateRadius = EditorGUILayout.IntSlider("Dilate Radius", dilateRadius, 0, 20);
            combineAllOutlines = EditorGUILayout.Toggle("Combine All Outlines", combineAllOutlines);
            blurAmount = EditorGUILayout.Slider("Blur Amount", blurAmount, 0f, 100f);
            focus = EditorGUILayout.Slider("Focus", focus, 0.1f, 5f);

            if (GUILayout.Button("Bake"))
                Bake();
        }

        void Bake()
        {
            if (quadRend == null) { Debug.LogError("Please select a planar model."); return; }

            Vector3 quadCenter = quadRend.bounds.center;
            Vector3 quadNormal = quadRend.transform.forward;
            Plane slicePlane = new Plane(quadNormal, quadCenter);

            Texture2D mask = new Texture2D(resolution, resolution, TextureFormat.RGBAFloat, false);
            Color[] cols = new Color[resolution * resolution];
            System.Array.Fill(cols, Color.black);
            mask.SetPixels(cols);

            Renderer[] allRen = Object.FindObjectsByType<Renderer>(FindObjectsSortMode.None);
            Matrix4x4 world2Local = quadRend.transform.worldToLocalMatrix;

            List<LineSegment> allSegments = new List<LineSegment>();

            foreach (var r in allRen)
            {
                if (r == quadRend) continue;
                Mesh m = GetMeshFromRenderer(r);
                if (m == null) continue;

                Matrix4x4 l2w = r.localToWorldMatrix;
                Vector3[] verts = m.vertices;
                int[] tris = m.triangles;

                for (int i = 0; i < tris.Length; i += 3)
                {
                    Vector3 v0 = l2w.MultiplyPoint3x4(verts[tris[i]]);
                    Vector3 v1 = l2w.MultiplyPoint3x4(verts[tris[i + 1]]);
                    Vector3 v2 = l2w.MultiplyPoint3x4(verts[tris[i + 2]]);

                    List<Vector3> hits = new List<Vector3>();
                    AddSegmentIfCrosses(v0, v1, slicePlane, hits);
                    AddSegmentIfCrosses(v1, v2, slicePlane, hits);
                    AddSegmentIfCrosses(v2, v0, slicePlane, hits);

                    for (int j = 0; j < hits.Count - 1; j++)
                    {
                        Vector2 uv1 = WorldToUV(hits[j], world2Local, r);
                        Vector2 uv2 = WorldToUV(hits[j + 1], world2Local, r);

                        if (IsUVInBounds(uv1) && IsUVInBounds(uv2))
                        {
                            allSegments.Add(new LineSegment(uv1, uv2));
                            DrawThickLineUV(uv1, uv2, mask, resolution, 2);
                        }
                    }
                }
            }

            if (allSegments.Count >= 3)
            {
                if (combineAllOutlines)
                {
                    ProcessCombinedOutlines(allSegments, mask, resolution);
                }
                else
                {
                    List<List<Vector2>> polygons = BuildPolygonsFromSegments(allSegments);
                    foreach (var polygon in polygons)
                    {
                        if (polygon.Count >= 3)
                        {
                            DrawPolygon(polygon, mask, resolution);
                            FillPolygonRobust(polygon, mask, resolution);
                        }
                    }
                }

                if (dilateRadius > 0)
                {
                    mask = MorphologicalClose(mask, resolution, dilateRadius);
                }

                FillRemainingGaps(mask, resolution);

                #region Blur
                // Applying Binary threshold 
                float[,] maskData = ExtractMaskBinary(mask, resolution);
                float sigma = blurAmount / focus;
                maskData = BUDUEffects.ApplyGaussianBlurSeparable(maskData, resolution, (int)blurAmount, sigma);
                //maskData = BUDUEffects.ApplyAdaptiveBlur(maskData, resolution, (int)blurAmount); // Same
                //maskData = BUDUEffects.ApplyTrueGaussianBlur(maskData, resolution, (int)blurAmount, sigma); // Same
                //maskData = BUDUEffects.ApplyGaussianBlurWithNormalization(maskData, resolution, (int)blurAmount, sigma); // Normalize but Same
                //maskData = BUDUEffects.ApplyGaussianBlurWithContrast(maskData, resolution, (int)blurAmount, sigma, 1f); // Contrasted
                //maskData = BUDUEffects.ApplyGaussianBlurFloat2(maskData, resolution, (int)blurAmount,sigma); // Slow
                //maskData = BUDUEffects.GaussianBlur(maskData, resolution, (int)blurAmount, sigma); // Slow
                //maskData = BUDUEffects.ApplyGaussianBlurFloatSeparable(maskData, resolution, ((int)blurAmount), sigma); // over dilate
                //maskData = BUDUEffects.ApplyGaussianBlurFloat(maskData, resolution, ((int)blurAmount), sigma); // ultra slow

                // Texture'a yaz
                for (int y = 0; y < resolution; y++)
                    for (int x = 0; x < resolution; x++)
                        mask.SetPixel(x, y, new Color(maskData[x, y], maskData[x, y], maskData[x, y], 1f));

                #endregion

                mask.Apply();
            }

            string path = EditorUtility.SaveFilePanelInProject("Save Mask", "BUDU_IntersectionMask", "png", "");
            if (!string.IsNullOrEmpty(path))
            {
                System.IO.File.WriteAllBytes(path, mask.EncodeToPNG());
                AssetDatabase.ImportAsset(path);
                //Debug.Log($"[BUDU] Mask saved: {path}");
            }
        }

        Mesh GetMeshFromRenderer(Renderer r)
        {
            if (r is MeshRenderer mr)
            {
                MeshFilter mf = mr.GetComponent<MeshFilter>();
                return mf?.sharedMesh;
            }
            if (r is SkinnedMeshRenderer smr)
            {
                Mesh m = new Mesh();
                smr.BakeMesh(m);
                return m;
            }
            return null;
        }
        static void AddSegmentIfCrosses(Vector3 a, Vector3 b, Plane p, List<Vector3> outPts)
        {
            float da = p.GetDistanceToPoint(a);
            float db = p.GetDistanceToPoint(b);

            if (Mathf.Abs(da) < 0.0001f)
            {
                outPts.Add(a);
                return;
            }
            if (Mathf.Abs(db) < 0.0001f)
            {
                outPts.Add(b);
                return;
            }

            if (da * db > 0) return;

            float t = da / (da - db);
            Vector3 hit = Vector3.Lerp(a, b, t);
            outPts.Add(hit);
        }

        #region Extract Mask Methods
        float[,] ExtractMask(Texture2D tex, int res)
        {
            float[,] mask = new float[res, res];
            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                    mask[x, y] = tex.GetPixel(x, y).r; // 0-1 float
            return mask;
        }
        float[,] ExtractMaskBinary(Texture2D tex, int res)
        {
            float[,] mask = new float[res, res];
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float value = tex.GetPixel(x, y).r;
                    // Binary threshold uygula - sadece 0 veya 1
                    mask[x, y] = value > 0.5f ? 1f : 0f;
                }
            }

            // Debug: kaç tane 0 ve 1 olduğunu kontrol et
            int zeros = 0, ones = 0;
            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                    if (mask[x, y] == 0f) zeros++; else ones++;

            //Debug.Log($"After binary threshold - Zeros: {zeros}, Ones: {ones}");

            return mask;
        }
        #endregion

        #region Combined Outline methods
        void ProcessCombinedOutlines(List<LineSegment> allSegments, Texture2D tex, int res)
        {
            List<List<Vector2>> polygons = BuildPolygonsFromSegments(allSegments);
            if (polygons.Count == 0) return;

            Color[] pixels = new Color[res * res];
            System.Array.Fill(pixels, Color.black);

            foreach (var poly in polygons)
            {
                int count = poly.Count;
                for (int i = 0; i < count; i++)
                {
                    Vector2 p0 = poly[i] * res;
                    Vector2 p1 = poly[(i + 1) % count] * res;

                    int steps = Mathf.CeilToInt(Vector2.Distance(p0, p1));
                    if (steps == 0) steps = 1;

                    for (int s = 0; s <= steps; s++)
                    {
                        Vector2 pt = Vector2.Lerp(p0, p1, (float)s / steps);
                        int x = Mathf.Clamp((int)pt.x, 0, res - 1);
                        int y = Mathf.Clamp((int)pt.y, 0, res - 1);
                        pixels[y * res + x] = Color.white;
                    }
                }
            }

            for (int y = 0; y < res; y++)
            {
                List<int> crossings = new List<int>();

                foreach (var poly in polygons)
                {
                    int count = poly.Count;
                    for (int i = 0; i < count; i++)
                    {
                        Vector2 v0 = poly[i] * res;
                        Vector2 v1 = poly[(i + 1) % count] * res;

                        if ((v0.y <= y && v1.y > y) || (v1.y <= y && v0.y > y))
                        {
                            float t = (y - v0.y) / (v1.y - v0.y);
                            int xCross = Mathf.Clamp(Mathf.RoundToInt(v0.x + t * (v1.x - v0.x)), 0, res - 1);
                            crossings.Add(xCross);
                        }
                    }
                }

                crossings.Sort();

                for (int i = 0; i + 1 < crossings.Count; i += 2)
                {
                    int xStart = crossings[i];
                    int xEnd = crossings[i + 1];
                    for (int x = xStart; x <= xEnd; x++)
                        pixels[y * res + x] = Color.white;
                }
            }

            tex.SetPixels(pixels);

            if (dilateRadius > 0)
                tex = MorphologicalClose(tex, res, dilateRadius);

            FillRemainingGaps(tex, res);

            tex.Apply();
        }
        void ProcessCombinedOutlinesOld(List<LineSegment> allSegments, Texture2D tex, int res)
        {
            foreach (var segment in allSegments)
            {
                DrawThickLineUV(segment.start, segment.end, tex, res, 3);
            }

            List<Vector2> allPoints = new List<Vector2>();
            foreach (var segment in allSegments)
            {
                allPoints.Add(segment.start);
                allPoints.Add(segment.end);
            }

            if (allPoints.Count >= 3)
            {
                List<Vector2> hull = ComputeSimpleHull(allPoints);
                DrawPolygon(hull, tex, res);
                FillPolygonRobust(hull, tex, res);
                Debug.Log($"[BUDU] Combined hull with {hull.Count} points");
            }

            FillLargeBlackAreas(tex, res);
        }
        void ProcessCombinedOutlinesFast(List<LineSegment> allSegments, Texture2D tex, int res)
        {
            List<List<Vector2>> polygons = BuildPolygonsFromSegments(allSegments);
            if (polygons.Count == 0) return;

            Color[] pixels = new Color[res * res];
            System.Array.Fill(pixels, Color.black);

            // Önce outline'ları array'e çiz
            foreach (var polygon in polygons)
            {
                if (polygon.Count < 3) continue;

                int count = polygon.Count;
                for (int i = 0; i < count; i++)
                {
                    Vector2 p0 = polygon[i];
                    Vector2 p1 = polygon[(i + 1) % count];

                    int steps = Mathf.CeilToInt(Vector2.Distance(p0 * res, p1 * res));
                    if (steps == 0) steps = 1;

                    for (int s = 0; s <= steps; s++)
                    {
                        Vector2 uv = Vector2.Lerp(p0, p1, (float)s / steps);
                        int x = Mathf.Clamp((int)(uv.x * res), 0, res - 1);
                        int y = Mathf.Clamp((int)(uv.y * res), 0, res - 1);
                        pixels[y * res + x] = Color.white;
                    }
                }
            }

            bool IsPointInPolygonEvenOdd(Vector2 point, List<Vector2> polygon)
            {
                bool inside = false;
                int j = polygon.Count - 1;
                for (int i = 0; i < polygon.Count; i++)
                {
                    if (((polygon[i].y > point.y) != (polygon[j].y > point.y)) &&
                        (point.x < (polygon[j].x - polygon[i].x) * (point.y - polygon[i].y) / (polygon[j].y - polygon[i].y) + polygon[i].x))
                    {
                        inside = !inside;
                    }
                    j = i;
                }
                return inside;
            }

            // Even-odd fill, bounding box taraması
            foreach (var polygon in polygons)
            {
                float minX = polygon.Min(p => p.x);
                float maxX = polygon.Max(p => p.x);
                float minY = polygon.Min(p => p.y);
                float maxY = polygon.Max(p => p.y);

                int startX = Mathf.Clamp((int)(minX * res), 0, res - 1);
                int endX = Mathf.Clamp((int)(maxX * res), 0, res - 1);
                int startY = Mathf.Clamp((int)(minY * res), 0, res - 1);
                int endY = Mathf.Clamp((int)(maxY * res), 0, res - 1);

                for (int y = startY; y <= endY; y++)
                {
                    for (int x = startX; x <= endX; x++)
                    {
                        Vector2 point = new Vector2((float)x / res, (float)y / res);
                        if (IsPointInPolygonEvenOdd(point, polygon))
                            pixels[y * res + x] = Color.white;
                    }
                }
            }

            tex.SetPixels(pixels);

            // Morfolojik close
            if (dilateRadius > 0)
                tex = MorphologicalClose(tex, res, dilateRadius);

            // Küçük boşlukları doldur
            FillRemainingGaps(tex, res);

            tex.Apply();

            Debug.Log($"[BUDU] Fast Process: {polygons.Count} polygons processed");
        }
        #endregion

        bool IsPointInPolygon(Vector2 point, List<Vector2> polygon)
        {
            bool inside = false;
            int j = polygon.Count - 1;

            for (int i = 0; i < polygon.Count; i++)
            {
                if (((polygon[i].y > point.y) != (polygon[j].y > point.y)) &&
                    (point.x < (polygon[j].x - polygon[i].x) * (point.y - polygon[i].y) / (polygon[j].y - polygon[i].y) + polygon[i].x))
                {
                    inside = !inside;
                }
                j = i;
            }
            return inside;
        }
        void FillPolygonRobust(List<Vector2> polygon, Texture2D tex, int res)
        {
            if (polygon.Count < 3) return;

            float minX = polygon.Min(p => p.x);
            float maxX = polygon.Max(p => p.x);
            float minY = polygon.Min(p => p.y);
            float maxY = polygon.Max(p => p.y);

            int startX = Mathf.Clamp((int)(minX * res), 0, res - 1);
            int endX = Mathf.Clamp((int)(maxX * res), 0, res - 1);
            int startY = Mathf.Clamp((int)(minY * res), 0, res - 1);
            int endY = Mathf.Clamp((int)(maxY * res), 0, res - 1);

            for (int y = startY; y <= endY; y++)
            {
                for (int x = startX; x <= endX; x++)
                {
                    Vector2 point = new Vector2((float)x / res, (float)y / res);
                    if (IsPointInPolygon(point, polygon)) tex.SetPixel(x, y, Color.white);
                }
            }
        }
        List<Vector2> CleanPolygon(List<Vector2> polygon)
        {
            List<Vector2> cleaned = new List<Vector2>();

            for (int i = 0; i < polygon.Count; i++)
            {
                Vector2 current = polygon[i];
                Vector2 next = polygon[(i + 1) % polygon.Count];
                if (Vector2.Distance(current, next) > 0.001f) cleaned.Add(current);
            }

            if (cleaned.Count > 2 && Vector2.Distance(cleaned[0], cleaned[cleaned.Count - 1]) < 0.001f)
            {
                cleaned.RemoveAt(cleaned.Count - 1);
            }

            return cleaned.Count >= 3 ? cleaned : polygon;
        }


        #region Line Methods
        List<Vector2> ComputeSimpleHull(List<Vector2> points)
        {
            if (points.Count < 3) return points;

            float minX = points.Min(p => p.x);
            float maxX = points.Max(p => p.x);
            float minY = points.Min(p => p.y);
            float maxY = points.Max(p => p.y);

            float padding = 0.02f;
            minX = Mathf.Max(0f, minX - padding);
            maxX = Mathf.Min(1f, maxX + padding);
            minY = Mathf.Max(0f, minY - padding);
            maxY = Mathf.Min(1f, maxY + padding);

            return new List<Vector2>
        {
            new Vector2(minX, minY),
            new Vector2(maxX, minY),
            new Vector2(maxX, maxY),
            new Vector2(minX, maxY)
        };
        }
        struct LineSegment
        {
            public Vector2 start;
            public Vector2 end;

            public LineSegment(Vector2 start, Vector2 end)
            {
                this.start = start;
                this.end = end;
            }

            public override bool Equals(object obj)
            {
                if (!(obj is LineSegment)) return false;
                LineSegment other = (LineSegment)obj;
                return (start == other.start && end == other.end) || (start == other.end && end == other.start);
            }

            public override int GetHashCode()
            {
                return start.GetHashCode() ^ end.GetHashCode();
            }
        }
        List<List<Vector2>> BuildPolygonsFromSegments(List<LineSegment> segments)
        {
            List<List<Vector2>> polygons = new List<List<Vector2>>();
            HashSet<LineSegment> usedSegments = new HashSet<LineSegment>();

            foreach (var segment in segments)
            {
                if (usedSegments.Contains(segment)) continue;

                List<Vector2> polygon = new List<Vector2>();
                Vector2 currentPoint = segment.start;
                polygon.Add(currentPoint);

                bool foundNext = true;
                while (foundNext)
                {
                    foundNext = false;
                    LineSegment? nextSegmentNullable = null;

                    foreach (var seg in segments)
                    {
                        if (usedSegments.Contains(seg)) continue;

                        if (Vector2.Distance(seg.start, currentPoint) < 0.001f)
                        {
                            nextSegmentNullable = seg;
                            currentPoint = seg.end;
                            break;
                        }
                        else if (Vector2.Distance(seg.end, currentPoint) < 0.001f)
                        {
                            nextSegmentNullable = seg;
                            currentPoint = seg.start;
                            break;
                        }
                    }

                    if (nextSegmentNullable.HasValue)
                    {
                        LineSegment nextSegment = nextSegmentNullable.Value;
                        usedSegments.Add(nextSegment);

                        if (polygon.Count > 2 && Vector2.Distance(polygon[0], currentPoint) < 0.001f)
                        {
                            break;
                        }

                        polygon.Add(currentPoint);
                        foundNext = true;
                    }
                }

                polygon = CleanPolygon(polygon);
                if (polygon.Count >= 3) polygons.Add(polygon);
            }

            return polygons;
        }
        void DrawPolygon(List<Vector2> polygon, Texture2D tex, int res)
        {
            for (int i = 0; i < polygon.Count; i++)
            {
                Vector2 p1 = polygon[i];
                Vector2 p2 = polygon[(i + 1) % polygon.Count];
                DrawLineUV(p1, p2, tex, res);
            }
        }

        static void DrawLineUV(Vector2 uv0, Vector2 uv1, Texture2D tex, int res)
        {
            Vector2 clampedUV0 = new Vector2(Mathf.Clamp(uv0.x, 0f, 1f), Mathf.Clamp(uv0.y, 0f, 1f));
            Vector2 clampedUV1 = new Vector2(Mathf.Clamp(uv1.x, 0f, 1f), Mathf.Clamp(uv1.y, 0f, 1f));

            int steps = Mathf.CeilToInt(Vector2.Distance(clampedUV0 * res, clampedUV1 * res));
            if (steps == 0) steps = 1;

            for (int i = 0; i <= steps; i++)
            {
                float t = (float)i / steps;
                Vector2 uv = Vector2.Lerp(clampedUV0, clampedUV1, t);
                int x = Mathf.Clamp((int)(uv.x * res), 0, res - 1);
                int y = Mathf.Clamp((int)(uv.y * res), 0, res - 1);
                tex.SetPixel(x, y, Color.white);
            }
        }
        void DrawThickLineUV(Vector2 uv0, Vector2 uv1, Texture2D tex, int res, int thickness)
        {
            Vector2 clampedUV0 = new Vector2(Mathf.Clamp(uv0.x, 0f, 1f), Mathf.Clamp(uv0.y, 0f, 1f));
            Vector2 clampedUV1 = new Vector2(Mathf.Clamp(uv1.x, 0f, 1f), Mathf.Clamp(uv1.y, 0f, 1f));

            Vector2 dir = (clampedUV1 - clampedUV0).normalized;
            Vector2 perpendicular = new Vector2(-dir.y, dir.x) * (thickness / (float)res);

            int steps = Mathf.CeilToInt(Vector2.Distance(clampedUV0 * res, clampedUV1 * res));
            if (steps == 0) steps = 1;

            for (int i = 0; i <= steps; i++)
            {
                float t = (float)i / steps;
                Vector2 uv = Vector2.Lerp(clampedUV0, clampedUV1, t);

                for (int j = -thickness / 2; j <= thickness / 2; j++)
                {
                    Vector2 offset = perpendicular * j;
                    Vector2 thickUV = uv + offset;

                    int x = Mathf.Clamp((int)(thickUV.x * res), 0, res - 1);
                    int y = Mathf.Clamp((int)(thickUV.y * res), 0, res - 1);
                    tex.SetPixel(x, y, Color.white);
                }
            }
        }
        #endregion

        #region Texture and UV methods
        Texture2D MorphologicalClose(Texture2D tex, int res, int radius)
        {
            Texture2D temp = new Texture2D(res, res, TextureFormat.RGBA32, false);

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (tex.GetPixel(x, y) == Color.white)
                    {
                        for (int dy = -radius; dy <= radius; dy++)
                        {
                            for (int dx = -radius; dx <= radius; dx++)
                            {
                                int nx = x + dx;
                                int ny = y + dy;
                                if (nx >= 0 && nx < res && ny >= 0 && ny < res)
                                {
                                    temp.SetPixel(nx, ny, Color.white);
                                }
                            }
                        }
                    }
                }
            }
            temp.Apply();

            Texture2D result = new Texture2D(res, res, TextureFormat.RGBA32, false);
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (temp.GetPixel(x, y) == Color.white)
                    {
                        int whiteCount = 0;
                        for (int dy = -1; dy <= 1; dy++)
                        {
                            for (int dx = -1; dx <= 1; dx++)
                            {
                                int nx = x + dx;
                                int ny = y + dy;
                                if (nx >= 0 && nx < res && ny >= 0 && ny < res && temp.GetPixel(nx, ny) == Color.white)
                                {
                                    whiteCount++;
                                }
                            }
                        }
                        result.SetPixel(x, y, whiteCount >= 3 ? Color.white : Color.black);
                    }
                    else
                    {
                        result.SetPixel(x, y, Color.black);
                    }
                }
            }

            DestroyImmediate(temp);
            return result;
        }
        Vector2 WorldToUV(Vector3 worldPos, Matrix4x4 world2Local, Renderer quad)
        {
            Vector3 local = quad.transform.InverseTransformPoint(worldPos);
            Vector3 localPos = world2Local.MultiplyPoint3x4(worldPos);
            return new Vector2((localPos.x + 0.5f), (localPos.y + 0.5f));
        }
        bool IsUVInBounds(Vector2 uv)
        {
            return uv.x >= 0f && uv.x <= 1f && uv.y >= 0f && uv.y <= 1f;
        }
        #endregion

        #region Fill Methods
        void FillLargeBlackAreas(Texture2D tex, int res)
        {
            bool[,] visited = new bool[res, res];
            int largeAreasFilled = 0;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (tex.GetPixel(x, y) == Color.black && !visited[x, y])
                    {
                        int size = MeasureRegionSize(tex, res, visited, x, y);
                        if (size > 500 && size < res * res * 0.8f)
                        {
                            FillRegion(tex, res, visited, x, y);
                            largeAreasFilled++;
                        }
                    }
                }
            }

            if (largeAreasFilled > 0) Debug.Log($"[BUDU] Filled {largeAreasFilled} large black areas");
        }
        void FillRemainingGaps(Texture2D tex, int res)
        {
            bool[,] visited = new bool[res, res];
            int smallGapsFilled = 0;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (tex.GetPixel(x, y) == Color.black && !visited[x, y])
                    {
                        int size = MeasureRegionSize(tex, res, visited, x, y);
                        if (size < 100)
                        {
                            FillRegion(tex, res, visited, x, y);
                            smallGapsFilled++;
                        }
                    }
                }
            }

            if (smallGapsFilled > 0) Debug.Log($"[BUDU] Filled {smallGapsFilled} small gaps");
        }
        int MeasureRegionSize(Texture2D tex, int res, bool[,] visited, int startX, int startY)
        {
            Queue<Vector2Int> queue = new Queue<Vector2Int>();
            queue.Enqueue(new Vector2Int(startX, startY));
            int size = 0;

            while (queue.Count > 0)
            {
                Vector2Int point = queue.Dequeue();
                int x = point.x, y = point.y;
                if (x < 0 || x >= res || y < 0 || y >= res || visited[x, y] || tex.GetPixel(x, y) == Color.white) continue;

                visited[x, y] = true;
                size++;
                queue.Enqueue(new Vector2Int(x + 1, y));
                queue.Enqueue(new Vector2Int(x - 1, y));
                queue.Enqueue(new Vector2Int(x, y + 1));
                queue.Enqueue(new Vector2Int(x, y - 1));
            }
            return size;
        }
        void FillRegion(Texture2D tex, int res, bool[,] visited, int startX, int startY)
        {
            Queue<Vector2Int> queue = new Queue<Vector2Int>();
            queue.Enqueue(new Vector2Int(startX, startY));

            while (queue.Count > 0)
            {
                Vector2Int point = queue.Dequeue();
                int x = point.x, y = point.y;
                if (x < 0 || x >= res || y < 0 || y >= res || visited[x, y] || tex.GetPixel(x, y) == Color.white) continue;

                visited[x, y] = true;
                tex.SetPixel(x, y, Color.white);
                queue.Enqueue(new Vector2Int(x + 1, y));
                queue.Enqueue(new Vector2Int(x - 1, y));
                queue.Enqueue(new Vector2Int(x, y + 1));
                queue.Enqueue(new Vector2Int(x, y - 1));
            }
        }
        #endregion

    }
}
// © BUDU Games 2024 - 2026

using UnityEngine;

namespace budu.shapes
{
    public class buduShapes
    {
        /// <summary>
        /// Circle SDF
        /// </summary>
        /// <param name="p">2D point to evaluate</param>
        /// <param name="ellipse">Ellipse On/Off</param>
        /// <param name="scale">Scale</param>
        /// <param name="radiusX">X radius</param>
        /// <param name="radiusY">Y radius</param>
        /// <param name="angle">Rotate Angle</param>
        /// <param name="outline">Outline flag</param>
        /// <param name="thickness">Outline thickness</param>
        /// <returns>Signed distance</returns>
        public static float SDFCircle(Vector2 p, bool ellipse, float scale, float radiusX, float radiusY, float angle, bool outline = false, float thickness = 0.01f)
        {
            p = p / scale;
            p = SDFRotate(p, angle);
            if (!ellipse)
            {
                radiusX = scale;
                radiusY = scale;
            }
            // normalize point
            float nx = p.x / radiusX;
            float ny = p.y / radiusY;

            // elips SDF
            float d = Mathf.Sqrt(nx * nx + ny * ny) - 1f;

            if (outline)
            {
                return Mathf.Abs(d) - thickness;
            }
            else
            {
                return d;
            }
        }

        /// <summary>
        /// Box SDF
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="halfSize">Base half-size of the box in x and y directions.</param>
        /// <param name="expand">Extra expansion for each side: (left, right, bottom, top)</param>
        /// <param name="angle">Rotation of the box in radians.</param>
        /// <returns>Signed distance to the box.</returns>
        public static float SDFBox(Vector2 p, Vector2 halfSize, Vector4 expand, float angle, bool outline = false, float thickness = 0.05f)
        {
            Vector2 rp = SDFRotate(p, angle);

            float xRight = halfSize.x + expand.x;
            float xLeft = halfSize.x + expand.y;
            float dx = (rp.x > 0) ? rp.x - xRight : -rp.x - xLeft;

            float yTop = halfSize.y + expand.z;
            float yBottom = halfSize.y + expand.w;
            float dy = (rp.y > 0) ? rp.y - yTop : -rp.y - yBottom;

            Vector2 dPos = new Vector2(Mathf.Max(dx, 0f), Mathf.Max(dy, 0f));
            float outside = dPos.magnitude;
            float inside = Mathf.Min(Mathf.Max(dx, dy), 0f);
            float d = outside + inside;

            if (outline)
                d = Mathf.Abs(d) - thickness;

            return d;
        }

        /// <summary>
        /// RoundBox SDF
        /// </summary>
        /// <param name="p">Point to evaluate.</param>
        /// <param name="halfSize">Base half-size of the box in x/y.</param>
        /// <param name="expand">Extra expansion: (right, left, top, bottom).</param>
        /// <param name="radius">Corner radius per corner: (topRight, topLeft, bottomLeft, bottomRight)</param>
        /// <param name="angle">Rotation in radians.</param>
        /// <param name="outline">If true, returns SDF for the outline.</param>
        /// <param name="thickness">Outline thickness (ignored if outline is false).</param>        /// <returns>Signed distance to rounded box.</returns>
        public static float SDFBoxRounded(Vector2 p, Vector2 halfSize, Vector4 expand, Vector4 radius, float angle, bool outline = false, float thickness = 0.05f)
        {
            // Rotate point
            Vector2 rp = SDFRotate(p, angle);

            // Compute expanded half-size per side
            float hx = halfSize.x + ((rp.x > 0f) ? expand.x : expand.y);
            float hy = halfSize.y + ((rp.y > 0f) ? expand.z : expand.w);

            // Determine which corner radius to use
            float cornerRadius;
            if (rp.x > 0f && rp.y > 0f) cornerRadius = radius.x; // top-right
            else if (rp.x < 0f && rp.y > 0f) cornerRadius = radius.y; // top-left
            else if (rp.x < 0f && rp.y < 0f) cornerRadius = radius.z; // bottom-left
            else cornerRadius = radius.w; // bottom-right

            // Compute q vector for SDF
            Vector2 q = new Vector2(Mathf.Abs(rp.x), Mathf.Abs(rp.y)) - new Vector2(hx, hy) + new Vector2(cornerRadius, cornerRadius);

            float d;
            if (Mathf.Min(q.x, q.y) < 0f)
                d = Mathf.Max(q.x, q.y) - cornerRadius;
            else
            {
                Vector2 uv = new Vector2(Mathf.Abs(q.x - q.y), q.x + q.y - cornerRadius) / cornerRadius;
                d = SDFCornerCircle(uv) * cornerRadius * Mathf.Sqrt(0.5f);
            }

            if (outline)
                d = Mathf.Abs(d) - thickness;

            return d;
        }

        /// <summary>
        /// Triangle SDF
        /// </summary>
        /// <param name="p">Point to evaluate.</param>
        /// <param name="size">Triangle size (height from base to top vertex).</param>
        /// <param name="angle">Rotation in radians.</param>
        /// <param name="outline">If true, computes SDF for the outline.</param>
        /// <param name="thickness">Outline thickness (ignored if outline is false).</param>
        /// <returns>Signed distance to triangle.</returns>
        public static float SDFTriangle(Vector2 p, float size, float angle, bool outline, float thickness)
        {
            Vector2 rp = SDFRotate(p, angle);

            float L = size * Mathf.Sqrt(3f);
            float halfW = L * 0.5f;
            float topY = size;
            float bottomY = -0.5f * size;

            Vector2 a = new Vector2(0f, topY);
            Vector2 b = new Vector2(-halfW, bottomY);
            Vector2 c = new Vector2(halfW, bottomY);

            float da = DistPointSegment(rp, a, b);
            float db = DistPointSegment(rp, b, c);
            float dc = DistPointSegment(rp, c, a);
            float minD = Mathf.Min(da, Mathf.Min(db, dc));

            bool inside = PointInTriangle(rp, a, b, c);
            float d = inside ? -minD : minD;

            if (outline)
                d = Mathf.Abs(d) - thickness;

            return d;
        }

        /// <summary>
        /// Ngon SDF
        /// </summary>
        /// <param name="uv">uv</param>
        /// <param name="n">Number of sides</param>
        /// <param name="r">Radius</param>
        /// <param name="angle">Rotation angle (radians)</param>
        /// <param name="outlineThickness">Outline thickness</param>
        /// <returns>Signed distance</returns>
        public static float SDFNgon(Vector2 uv, int n, float r, float angle, bool outline, float thickness)
        {
            Vector2 p = SDFRotate(uv, angle);

            float angleF = Mathf.Atan2(p.y, p.x);
            float len = p.magnitude;
            float an = Mathf.PI * 2f / n;

            float d = Mathf.Cos(Mathf.Floor(0.5f + angleF / an) * an - angleF) * len - r;

            if (outline)
                return Mathf.Abs(d) - thickness;

            return d;
        }

        /// <summary>
        /// Cross SDF
        /// </summary>
        /// <param name="p">Point</param>
        /// <param name="b">Half size vector</param>
        /// <param name="r">Thickness / radius</param>
        /// <param name="angle">Rotation angle (radians)</param>
        /// <param name="outline">If true, returns outline SDF</param>
        /// <param name="outlineThickness">Outline band half-thickness</param>
        /// <returns>Signed distance</returns>
        public static float SDFCross(Vector2 p, Vector2 b, float scale, float r, float angle, bool outline, float thickness)
        {
            p = p / scale;
            p = SDFRotate(p, angle);
            p = new Vector2(Mathf.Abs(p.x), Mathf.Abs(p.y));
            if (p.y > p.x) p = new Vector2(p.y, p.x);
            Vector2 q = p - b;
            float k = Mathf.Max(q.y, q.x);
            Vector2 w = (k > 0f) ? q : new Vector2(b.y - p.x, -k);
            Vector2 wMax = new Vector2(Mathf.Max(w.x, 0f), Mathf.Max(w.y, 0f));
            float d = wMax.magnitude;
            d = ((k > 0f) ? d : -d) + r;

            if (outline)
                return Mathf.Abs(d) - thickness;

            return d;
        }

        /// <summary>
        /// Star SDF
        /// </summary>
        /// <param name="p">Point</param>
        /// <param name="scale">Scale factor</param>
        /// <param name="r">Radius</param>
        /// <param name="n">Number of star points</param>
        /// <param name="w">Inner/Outer width ratio</param>
        /// <param name="angle">Rotation angle (radians)</param>
        /// <param name="outline">Enable outline mode</param>
        /// <param name="outlineThickness">Thickness of outline</param>
        /// <returns>Signed distance</returns>
        public static float SDFStar(Vector2 p, float scale, float r, float n, float w, float angle, bool outline = false, float outlineThickness = 0.01f)
        {
            p = p / scale;
            p = SDFRotate(p, angle);

            float m = n + w * (2f - n);
            float an = Mathf.PI / n;
            float en = Mathf.PI / m;

            Vector2 racs = r * new Vector2(Mathf.Cos(an), Mathf.Sin(an));
            Vector2 ecs = new Vector2(Mathf.Cos(en), Mathf.Sin(en));

            // Reduce to first sector
            float bn = Mathf.Repeat(Mathf.Atan2(p.y, p.x), 2f * an) - an;
            float len = p.magnitude;
            p = len * new Vector2(Mathf.Cos(bn), Mathf.Abs(Mathf.Sin(bn)));

            // Line SDF
            p -= racs;
            float dotPECS = Vector2.Dot(p, ecs);
            float clampVal = Mathf.Clamp(-dotPECS, 0f, racs.y / ecs.y);
            p += ecs * clampVal;

            float d = p.magnitude * Mathf.Sign(p.x);

            if (outline)
            {
                // Outline mode: distance to border
                return Mathf.Abs(d) - outlineThickness;
            }

            return d;
        }

        /// <summary>
        /// Arc SDF
        /// </summary>
        /// <param name="p">Point</param>
        /// <param name="sc">arc scale x = magnitude y = scale</param>
        /// <param name="scale">Scale factor</param>
        /// <param name="ra">Arc Out Radius</param>
        /// <param name="rb">Arc Thickness</param>
        /// <param name="angle">Rotation angle (radians)</param>
        /// <param name="outline">Enable outline mode</param>
        /// <param name="outlineThickness">Thickness of outline</param>
        /// <returns>Signed distance</returns>
        public static float SDFArc(Vector2 p, Vector2 sc, float scale, float ra, float rb, float angle, bool outline = false, float outlineThickness = 0.01f)
        {
            p = p / scale;

            p = SDFRotate(p, angle);


            // mirror x as in GLSL
            p.x = Mathf.Abs(p.x);

            // guard + normalize sc (GLSL code assumed direction)
            if (sc.sqrMagnitude < 1e-8f)
            {
                float d = Mathf.Abs(p.magnitude - ra) - rb;
                if (outline) d = Mathf.Abs(d) - outlineThickness;
                return d;
            }

            Vector2 s = sc.normalized;

            float dist;
            // condition exactly like GLSL
            if (s.y * p.x > s.x * p.y)
            {
                // distance to arc endpoint direction
                dist = (p - s * ra).magnitude - rb;
            }
            else
            {
                // distance to circular arc itself
                dist = Mathf.Abs(p.magnitude - ra) - rb;
            }

            if (outline)
                dist = Mathf.Abs(dist) - outlineThickness;

            return dist;
        }

        /// <summary>
        /// Heart SDF
        /// </summary>
        /// <param name="p">Point to evaluate</param>
        /// <param name="angle">Rotation angle in radians</param>
        /// <param name="scale">Shape scale</param>
        /// <param name="outline">If true, returns outline distance instead of fill</param>
        /// <param name="outlineThickness">Thickness of the outline band</param>
        /// <returns>
        /// Signed distance (or outline band if outline enabled).
        /// Negative = inside, 0 = boundary, Positive = outside
        /// </returns>
        public static float SDFHeart(Vector2 p, float scale, float angle, bool outline = false, float outlineThickness = 0.01f)
        {
            p = p / scale;
            p.y += 0.5f;
            p = SDFRotate(p, angle);
            p.x = Mathf.Abs(p.x);

            float d;
            if (p.y + p.x > 1.0f)
            {
                Vector2 a = p - new Vector2(0.25f, 0.75f);
                d = Mathf.Sqrt(Vector2.Dot(a, a)) - Mathf.Sqrt(2.0f) / 4.0f;
            }
            else
            {
                Vector2 b = p - new Vector2(0.0f, 1.0f);
                float maxVal = Mathf.Max(p.x + p.y, 0.0f);
                Vector2 c = p - 0.5f * new Vector2(maxVal, maxVal);

                float d1 = Vector2.Dot(b, b);
                float d2 = Vector2.Dot(c, c);

                d = Mathf.Sqrt(Mathf.Min(d1, d2)) * Mathf.Sign(p.x - p.y);
            }

            if (outline)
            {
                return Mathf.Abs(d) - outlineThickness;
            }
            return d;
        }

        /// <summary>
        /// Pie SDF
        /// </summary>
        /// <param name="p">Point to evaluate</param>
        /// <param name="c">Direction vector that defines the angle/orientation of the pie slice (should be normalized)</param>
        /// <param name="r">Radius of the pie slice</param>
        /// <param name="angle">Rotation angle in radians</param>
        /// <param name="scale">scale of the pie slice</param>
        /// <param name="outline">If true, returns distance for outline</param>
        /// <param name="outlineThickness">Thickness of the outline</param>
        /// <returns>
        /// Signed distance to the pie slice boundary:
        /// Negative = inside, 0 = on the boundary, Positive = outside
        /// If outline is enabled, distance to the outline band
        /// </returns>
        public static float SDFPie(Vector2 p, Vector2 sc, float r, float scale, float angle, bool outline = false, float outlineThickness = 0.05f)
        {
            p /= scale;
            p = SDFRotate(p, angle);
            p.x = Mathf.Abs(p.x);
            float l = p.magnitude - r;
            Vector2 s = (sc.sqrMagnitude > 1e-8f) ? sc.normalized : sc;
            float dotVal = Vector2.Dot(p, s);
            float clamped = Mathf.Clamp(dotVal, 0f, r);
            Vector2 diff = p - s * clamped;
            float m = diff.magnitude;
            float d = Mathf.Max(l, m * Mathf.Sign(sc.y * p.x - sc.x * p.y));
            if (outline)
            {
                s = (sc.sqrMagnitude > 1e-8f) ? sc.normalized : sc;
                float dRadial = m;
                float cross = s.x * p.y - s.y * p.x;
                float dCircle = (cross >= 0f) ? Mathf.Abs(l) : float.MaxValue;
                return Mathf.Min(dRadial, dCircle) - outlineThickness;
            }
            return d;
        }

        /// <summary>
        /// Egg SDF
        /// </summary>
        /// <param name="p">2D point to evaluate.</param>
        /// <param name="he">Height factor of the egg shape.</param>
        /// <param name="ra">Bottom radius.</param>
        /// <param name="rb">Top radius.</param>
        /// <param name="scale">Scale factor.</param>
        /// <param name="angle">Rotation angle.</param>
        /// <param name="outline">If true, returns outline distance instead of filled SDF.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance from point <paramref name="p"/> to the egg shape.</returns>
        public static float SDFEgg(Vector2 p, float he, float ra, float rb, float scale, float angle, bool outline = false, float outlineThickness = 0.05f)
        {
            p /= scale;
            p = SDFRotate(p, angle);
            float ce = 0.5f * (he * he - (ra - rb) * (ra - rb)) / (ra - rb);
            p.x = Mathf.Abs(p.x);
            float d;
            Vector2 center;
            float radius;
            if (p.y < 0.0f)
            {
                center = Vector2.zero;
                radius = ra;
                d = (p - center).magnitude - radius;
            }
            else if (p.y * ce - p.x * he > he * ce)
            {
                center = new Vector2(0f, he);
                radius = rb;
                d = (p - center).magnitude - radius;
            }
            else
            {
                center = new Vector2(-ce, 0f);
                radius = ce + ra;
                d = (p - center).magnitude - radius;
            }
            if (outline)
            {
                return Mathf.Abs(d) - outlineThickness;
            }

            return d;
        }

        /// <summary>
        /// Squircle SDF
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="n">Shape exponent (n=2 gives a circle, larger n approaches a square).</param>
        /// <param name="type">0 = Approximate, 1 = Exact.</param>
        /// <param name="scale">Scale factor for the shape.</param>
        /// <param name="angle">Rotation angle in radians.</param>
        /// <param name="outline">If true, returns only the outline distance.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance to the squircle. Negative = inside, Positive = outside.</returns>
        public static float SDFSquircle(Vector2 p, float n, int type, float scale,float angle, bool outline, float outlineThickness)
        {
            // Scale ve rotate
            p /= scale;
            p = SDFRotate(p, angle);

            float retd = 0;

            switch (type)
            {
                case 0:
                    // symmetries
                    p = new Vector2(Mathf.Abs(p.x), Mathf.Abs(p.y));
                    if (p.y > p.x)
                    {
                        p = new Vector2(p.y, p.x);
                    }

                    float w = Mathf.Pow(p.x, n) + Mathf.Pow(p.y, n);

                    // implicit
                    // return Mathf.Pow(w, 1.0f / n) - 1.0f;

                    // linearized implicit (taylor)
                    float b = 2.0f * n - 2.0f;
                    float a = 1.0f - 1.0f / n;

                    // inversesqrt(x) = 1.0 / sqrt(x)
                    float denom = Mathf.Pow(p.x, b) + Mathf.Pow(p.y, b);
                    float invSqrt = 1.0f / Mathf.Sqrt(denom);

                    retd = (w - Mathf.Pow(w, a)) * invSqrt;

                    break;
                case 1:
                    // symmetries
                    p = new Vector2(Mathf.Abs(p.x), Mathf.Abs(p.y));
                    if (p.y > p.x) p = new Vector2(p.y, p.x);

                    n = 2.0f / n; // remap

                    float xa = 0.0f;
                    float xb = Mathf.PI * 2.0f / 8.0f; // 45° aralığı
                    for (int i = 0; i < 6; i++)
                    {
                        float x = 0.5f * (xa + xb);
                        float c = Mathf.Cos(x);
                        float s = Mathf.Sin(x);
                        float cn = Mathf.Pow(c, n);
                        float sn = Mathf.Pow(s, n);
                        float y = (p.x - cn) * cn * s * s - (p.y - sn) * sn * c * c;

                        if (y < 0.0f) xa = x;
                        else xb = x;
                    }

                    // compute distance
                    Vector2 qa = new Vector2(Mathf.Pow(Mathf.Cos(xa), n), Mathf.Pow(Mathf.Sin(xa), n));
                    Vector2 qb = new Vector2(Mathf.Pow(Mathf.Cos(xb), n), Mathf.Pow(Mathf.Sin(xb), n));

                    Vector2 pa = p - qa;
                    Vector2 ba = qb - qa;
                    float h = Mathf.Clamp(Vector2.Dot(pa, ba) / Vector2.Dot(ba, ba), 0.0f, 1.0f);

                    retd = (pa - ba * h).magnitude * Mathf.Sign(pa.x * ba.y - pa.y * ba.x);

                    break;
            }

            if(outline)
            {
                return Mathf.Abs(retd) - outlineThickness;
            }

            return retd;

        }

        /// <summary>
        /// Vesica Piscis SDF 
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="r">Radius of each circle.</param>
        /// <param name="d">Half-distance between the centers of the two circles (d &lt; r for proper intersection).</param>
        /// <param name="scale">Scale factor for the shape.</param>
        /// <param name="rotation">Rotation angle in radians.</param>
        /// <param name="outline">If true, returns only the outline distance.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance to the vesica piscis. Negative = inside, Positive = outside.</returns>
        public static float SDFVesica(Vector2 p, float r, float d, float scale, float rotation, bool outline, float outlineThickness)
        {
            p /= scale;
            p = SDFRotate(p, rotation);
            p = new Vector2(Mathf.Abs(p.x), Mathf.Abs(p.y));

            float b = Mathf.Sqrt(r * r - d * d); // buradaki sqrt, d < r olduğu durumda tanımlı

            float retd = 0f;

            if ((p.y - b) * d > p.x * b)
            {
                retd = (p - new Vector2(0.0f, b)).magnitude * Mathf.Sign(d);
            }
            else
            {
                retd = (p - new Vector2(-d, 0.0f)).magnitude - r;
            }

            if (outline)
            {
                retd = Mathf.Abs(retd) - outlineThickness;
            }

            return retd;
        }

        /// <summary>
        /// Moon SDF
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="d">Distance between the centers of the two circles.</param>
        /// <param name="ra">Radius of the first (main) circle.</param>
        /// <param name="rb">Radius of the second (cut) circle.</param>
        /// <param name="scale">Scale factor for the shape.</param>
        /// <param name="rotation">Rotation angle in radians.</param>
        /// <param name="outline">If true, returns only the outline distance.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance to the moon shape. Negative = inside, Positive = outside.</returns>
        public static float SDFMoon(Vector2 p, float d, float ra, float rb, float scale, float rotation, bool outline, float outlineThickness)
        {
            // Apply scale and rotation
            p /= scale;
            p = SDFRotate(p, rotation);

            // Mirror Y for symmetry
            p.y = Mathf.Abs(p.y);

            float a = (ra * ra - rb * rb + d * d) / (2.0f * d);
            float b = Mathf.Sqrt(Mathf.Max(ra * ra - a * a, 0.0f));

            float retd;

            if (d * (p.x * b - p.y * a) > d * d * Mathf.Max(b - p.y, 0.0f))
            {
                retd = (p - new Vector2(a, b)).magnitude;
            }
            else
            {
                retd = Mathf.Max((p).magnitude - ra, -(p - new Vector2(d, 0)).magnitude + rb);
            }

            if (outline)
                retd = Mathf.Abs(retd) - outlineThickness;

            return retd;
        }

        /// <summary>
        /// Rounded X SDF
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="w">Base width of the shape.</param>
        /// <param name="r">Radius of the rounded corners.</param>
        /// <param name="scale">Scale factor for the shape.</param>
        /// <param name="rotation">Rotation angle in radians.</param>
        /// <param name="outline">If true, returns only the outline distance.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance to the rounded X shape. Negative = inside, Positive = outside.</returns>
        public static float SDFRoundedX(Vector2 p, float w, float r, float scale, float rotation, bool outline, float outlineThickness)
        {
            // Apply scale and rotation
            p /= scale;
            p = SDFRotate(p, rotation);

            // Symmetry
            p = new Vector2(Mathf.Abs(p.x), Mathf.Abs(p.y));

            // Compute distance
            float retd = (p - Vector2.one * Mathf.Min(p.x + p.y, w) * 0.5f).magnitude - r;

            if (outline)
                retd = Mathf.Abs(retd) - outlineThickness;

            return retd;
        }

        /// <summary>
        /// Spiral SDF
        /// </summary>
        /// <param name="p">The 2D point to evaluate.</param>
        /// <param name="w">Base width of the spiral arms.</param>
        /// <param name="k">Spiral tightness factor.</param>
        /// <param name="scale">Scale factor for the shape.</param>
        /// <param name="rotation">Rotation angle in radians.</param>
        /// <param name="outline">If true, returns only the outline distance.</param>
        /// <param name="outlineThickness">Thickness of the outline.</param>
        /// <returns>Signed distance to the spiral shape. Negative = inside, Positive = outside.</returns>
        public static float SDFSpiral(Vector2 p, float w, float k, float scale, float rotation, bool outline, float outlineThickness)
        {
            const float kTau = 6.283185307f;

            // Apply scale and rotation
            p /= scale;
            p = SDFRotate(p, rotation);

            float r = p.magnitude;
            float a = Mathf.Atan2(p.y, p.x);

            float n = Mathf.Floor(0.5f / w + (Mathf.Log(r / w, 2.0f) * k - a) / kTau);
            float ra = w * Mathf.Pow(2.0f, (a + kTau * (Mathf.Min(n + 0.0f, 0.0f) - 0.5f)) / k);
            float rb = w * Mathf.Pow(2.0f, (a + kTau * (Mathf.Min(n + 1.0f, 0.0f) - 0.5f)) / k);

            float d = Mathf.Min(Mathf.Abs(r - ra), Mathf.Abs(r - rb));

            // Tip of the spiral
            float tip = (p + new Vector2(w, 0.50f)).magnitude;

            float retd = Mathf.Min(d, tip);

            //if (outline)
            retd = Mathf.Abs(retd) - outlineThickness;

            return retd;
        }





        // Helpers
        public static Vector2 SDFRotate(Vector2 p, float angleDegrees)
        {
            float rad = angleDegrees * Mathf.Deg2Rad;
            float cos = Mathf.Cos(rad);
            float sin = Mathf.Sin(rad);
            return new Vector2(cos * p.x - sin * p.y, sin * p.x + cos * p.y);
        }

        public static float SDFCornerCircle(Vector2 p)
        {
            return (p - new Vector2(0f, -1f)).magnitude - Mathf.Sqrt(2f);
        }

        public static float DistPointSegment(Vector2 p, Vector2 a, Vector2 b)
        {
            Vector2 pa = p - a;
            Vector2 ba = b - a;
            float h = Mathf.Clamp01(Vector2.Dot(pa, ba) / Vector2.Dot(ba, ba));
            return (pa - ba * h).magnitude;
        }

        public static bool PointInTriangle(Vector2 p, Vector2 a, Vector2 b, Vector2 c)
        {
            float c0 = Cross(b - a, p - a);
            float c1 = Cross(c - b, p - b);
            float c2 = Cross(a - c, p - c);
            bool hasNeg = (c0 < 0f) || (c1 < 0f) || (c2 < 0f);
            bool hasPos = (c0 > 0f) || (c1 > 0f) || (c2 > 0f);
            return !(hasNeg && hasPos);
        }

        public static float Cross(Vector2 u, Vector2 v) => u.x * v.y - u.y * v.x;

        public static bool Approximately(Vector4 a, Vector4 b, float eps = 1e-6f)
        {
            return Mathf.Abs(a.x - b.x) < eps &&
                   Mathf.Abs(a.y - b.y) < eps &&
                   Mathf.Abs(a.z - b.z) < eps &&
                   Mathf.Abs(a.w - b.w) < eps;
        }



        public static float SDFUnion(float d1, float d2, float k)
        {
            float h = Mathf.Clamp01(0.5f + 0.5f * (d2 - d1) / k);
            return Mathf.Lerp(d2, d1, h) - k * h * (1.0f - h);
        }

        public static float SDFIntersection(float d1, float d2, float k)
        {
            float h = Mathf.Clamp01(0.5f - 0.5f * (d2 - d1) / k);
            return Mathf.Lerp(d2, d1, h) + k * h * (1.0f - h);
        }

        public static float SDFSubtract(float d1, float d2, float k)
        {
            float h = Mathf.Clamp01(0.5f - 0.5f * (-d2 - d1) / k);
            return Mathf.Lerp(d1, -d2, h) + k * h * (1.0f - h);
        }

    }
}

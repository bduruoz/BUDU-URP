// BUDU Games 2024 - 2025
using UnityEngine;
public static class Interpolation
{
    #region Catmull-Roms
    /// <summary>
    /// Catmull-Rom step
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float CatmullRomStep(float s, float e, float i, bool normalize = true)
    {
        i = Mathf.Clamp01(i);

        float i2 = i * i;
        float i3 = i2 * i;

        // Catmull-Rom kernel cubic interpolation
        float curve = (-0.5f * i3) + (1.5f * i2) - (1.0f * i) + 0.0f;

        if (normalize)
        {
            // normalize  curve 0-1
            curve = Mathf.Clamp01(curve + i);
        }

        return Mathf.Lerp(s, e, curve);
    }

    /// <summary>
    /// Normalised Catmull-Rom step
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float CatmullRomEase(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float i2 = i * i;
        float i3 = i2 * i;

        // cubic polynomial: normalized Catmull-Rom function
        float ease = -0.5f * i3 + i2 + 0.5f * i;

        return Mathf.Lerp(s, e, ease);
    }

    /// <summary>
    /// Catmull-Rom spline interpolation.
    /// Calculates a smooth curve between p1 and p2,
    /// using p0 and p3 as control points for tangents.
    /// </summary>
    /// <param name="p0"> point before the segment (controls entry slope) </param>
    /// <param name="p1"> start point of the segment </param>
    /// <param name="p2"> end point of the segment </param>
    /// <param name="p3"> point after the segment (controls exit slope) </param>
    /// <param name="i"> interpolation parameter in [0,1]:
    ///                  0 → returns p1, 1 → returns p2, in between follows the spline </param>
    /// <returns></returns>
    public static float CatmullRom(float p0, float p1, float p2, float p3, float i)
    {
        i = Mathf.Clamp01(i);
        float t2 = i * i;
        float t3 = t2 * i;

        return 0.5f * (
            (2f * p1) +
            (-p0 + p2) * i +
            (2f * p0 - 5f * p1 + 4f * p2 - p3) * t2 +
            (-p0 + 3f * p1 - 3f * p2 + p3) * t3
        );
    }
    #endregion

    #region Gaussian
    /// <summary>
    /// Gaussian-style interpolation between start and end.
    /// Produces a bell-shaped easing curve (peaking in the middle).
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <param name="sigma"> Sharpness of the curve </param>
    /// <returns></returns>
    public static float Gaussian(float s, float e, float i, float sigma = 0.15f)
    {
        i = Mathf.Clamp01(i);
        float x = 2f * i - 1f;
        float y = Mathf.Exp(-0.5f * (x * x) / (sigma * sigma));
        float yNorm = y / Mathf.Exp(-0.5f * 0 / (sigma * sigma));

        return Mathf.Lerp(s, e, yNorm);
    }
    #endregion

    #region Cubic
    /// <summary>
    /// Cubic Hermite interpolation (SmoothStep-style).
    /// Produces a smooth cubic curve between two values,
    /// easing in and out more gently than linear interpolation.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float Cubic(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float i2 = i * i;
        float i3 = i2 * i;
        float curve = (3f * i2 - 2f * i3); // smoothstep cubic polynomial
        return Mathf.Lerp(s, e, curve);
    }
    #endregion

    #region Quadric
    /// <summary>
    /// Quadratic easing interpolation.
    /// Produces a smooth ease-in-out curve between two values
    /// using a second-degree (quadratic) polynomial.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float Quadric(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float curve = i * i; // quadratic growth
        return Mathf.Lerp(s, e, curve);
    }
    #endregion

    #region Quadratic
    /// <summary>
    /// Quadric (parabolic) interpolation.
    /// Produces a smooth ease-in curve using a second-degree polynomial.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float Quadratic(float from, float to, float i)
    {
        i = Mathf.Clamp01(i);
        float curve = i < 0.5f ? 2f * i * i : -1f + (4f - 2f * i) * i;
        return Mathf.Lerp(from, to, curve);
    }
    #endregion

    #region Mitchell-Netravali
    /// <summary>
    /// Mitchell–Netravali reconstruction filter kernel.
    /// Produces smooth, visually pleasant interpolation often used in image resampling.
    /// </summary>
    /// <param name="x"> distance from the center (can be negative) </param>
    /// <param name="B"> tension parameter (default 1/3, controls smoothness) </param>
    /// <param name="C"> bias parameter (default 1/3, controls sharpness) </param>
    /// 
    /// Returns the weight for the given distance. Typically used with
    /// neighboring sample points to compute weighted interpolation.
    /// <returns></returns>
    public static float MitchellNetravali(float x, float B = 1f / 3f, float C = 1f / 3f)
    {
        x = Mathf.Abs(x);
        float x2 = x * x;
        float x3 = x2 * x;

        if (x < 1)
        {
            return ((12 - 9 * B - 6 * C) * x3 +
                   (-18 + 12 * B + 6 * C) * x2 +
                   (6 - 2 * B)) / 6f;
        }
        else if (x < 2)
        {
            return ((-B - 6 * C) * x3 +
                   (6 * B + 30 * C) * x2 +
                   (-12 * B - 48 * C) * x +
                   (8 * B + 24 * C)) / 6f;
        }
        return 0f;
    }
    #endregion

    #region Lanczos
    /// <summary>
    /// Lanczos reconstruction filter kernel.
    /// Produces high-quality interpolation weights using a windowed sinc function,
    /// commonly used for image resampling and upscaling.
    /// </summary>
    /// <param name="x"> distance from the center (can be negative) </param>
    /// <param name="a"> kernel size / window radius (default 3) </param>
    /// <returns></returns>
    public static float Lanczos(float x, int a = 3)
    {
        if (x == 0f) return 1f;
        if (Mathf.Abs(x) >= a) return 0f;

        float pix = Mathf.PI * x;
        return (Mathf.Sin(pix) / pix) * (Mathf.Sin(pix / a) / (pix / a));
    }
    #endregion

    #region Hermite
    /// <summary>
    /// Hermite interpolation (cubic easing).
    /// Produces a smooth curve between start and end values.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float Hermite(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float t2 = i * i;
        float t3 = t2 * i;
        float curve = t3 * (2f * i - 3f) + 1f; // smooth cubic Hermite
        return Mathf.Lerp(s, e, curve);
    }
    #endregion

    #region Sin Cos Ease
    /// <summary>
    /// Sin / Cos easing interpolation.
    /// Produces a smooth sinusoidal ease-in-out curve between start and end.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float SinCosEase(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float curve = -(Mathf.Cos(Mathf.PI * i) - 1f) * 0.5f; // ease-in-out
        return Mathf.Lerp(s, e, curve);
    }
    #endregion

    #region PingPong
    /// <summary>
    /// PingPong / Oscillating interpolation.
    /// Oscillates smoothly between start and end based on input.
    /// </summary>
    /// <param name="s"> Start </param>
    /// <param name="e"> End </param>
    /// <param name="i"> Input </param>
    /// <returns></returns>
    public static float PingPong(float s, float e, float i)
    {
        i = Mathf.Clamp01(i);
        float curve = Mathf.PingPong(i * 2f, 1f); // oscillates 0->1->0
        return Mathf.Lerp(s, e, curve);
    }
    #endregion
}

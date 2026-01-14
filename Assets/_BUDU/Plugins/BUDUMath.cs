// BUDU Games 2024 - 2025
using UnityEngine;

namespace budu.math
{
    using UnityEngine;

    public class buduMath
    {
        private static float Remap01(float value, float inMin, float inMax)
        {
            return Mathf.Clamp01((value - inMin) / (inMax - inMin));
        }

        public static float LogMap(float value, float inMin, float inMax, float outMin, float outMax)
        {
            float t = Remap01(value, inMin, inMax);
            float v = Mathf.Log10(1f + 9f * t); // 0–1 arası log eğrisi
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float PowMap(float value, float inMin, float inMax, float outMin, float outMax, float exp = 0.5f)
        {
            float t = Remap01(value, inMin, inMax);
            float v = Mathf.Pow(t, exp);
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float SmoothStepMap(float value, float inMin, float inMax, float outMin, float outMax)
        {
            float t = Remap01(value, inMin, inMax);
            float v = t * t * (3f - 2f * t); // Smoothstep
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float ExpMap(float value, float inMin, float inMax, float outMin, float outMax, float k = 5f)
        {
            float t = Remap01(value, inMin, inMax);
            float v = 1f - Mathf.Exp(-k * t);
            v /= 1f - Mathf.Exp(-k); // normalize 0–1
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float LogisticMap(float value, float inMin, float inMax, float outMin, float outMax, float k = 10f)
        {
            float t = Remap01(value, inMin, inMax);
            float v = 1f / (1f + Mathf.Exp(-k * (t - 0.5f)));
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float EaseInOutMap(float value, float inMin, float inMax, float outMin, float outMax)
        {
            float t = Remap01(value, inMin, inMax);
            float v = t * t * (3f - 2f * t);
            return Mathf.Lerp(outMin, outMax, v);
        }

        public static float Contrast(float t, float contrast = 1f)
        {
            return (t - 0.5f) * contrast + 0.5f;
        }

        public static float Gamma(float t, float gamma = 2f)
        {
            return Mathf.Pow(t, gamma);
        }

        public static float Gain(float t, float gain = 0.5f)
        {
            if (t < 0.5f)
                return 0.5f * Mathf.Pow(2f * t, Mathf.Log(gain) / Mathf.Log(0.5f));
            else
                return 1f - 0.5f * Mathf.Pow(2f * (1f - t), Mathf.Log(gain) / Mathf.Log(0.5f));
        }

    }

}

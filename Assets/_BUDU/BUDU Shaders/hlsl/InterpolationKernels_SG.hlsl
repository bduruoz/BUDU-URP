// © BUDU Games 2024 - 2026
// InterpolationKernels_SG_OutParam.hlsl

#ifndef INTERPOLATION_KERNELS_SG_OUTPARAM
#define INTERPOLATION_KERNELS_SG_OUTPARAM

#define CLAMP01(x) saturate(x)
#define PI 3.14159265

float SmoothT(float t)
{
    return t * t * (3.0 - 2.0 * t); // smoothstep-like sıkıştırma
}

float4 SmoothT4(float4 t)
{
    return t * t * (3.0 - 2.0 * t);
}

// ------------------------------
// Catmull-Rom
float4 CatmullRom_float(float4 start, float4 end, float4 t, out float4 output)
{
    t = saturate(t);
    float4 t2 = SmoothT4(saturate(t)); // t sıkıştırıldı
    float4 p0 = start;
    float4 p1 = start;
    float4 p2 = end;
    float4 p3 = end;
    output = 0.5 * ((2.0 * p1) + (-p0 + p2) * t2 + (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3) * t2 * t2 + (-p0 + 3.0 * p1 - 3.0 * p2 + p3) * t2 * t2 * t2);
    return output;
}

// ------------------------------
// Catmull-Rom Step
float4 CatmullRomStep_float(float4 start, float4 end, float4 t, out float4 output)
{
    float4 temp;
    CatmullRom_float(start, end, t, temp);
    output = saturate(temp);
    return output;
}

// ------------------------------
// Catmull-Rom Ease
float4 CatmullRomEase_float(float4 start, float4 end, float4 t, out float4 output)
{
    float4 temp;
    CatmullRom_float(start, end, t * t * (3.0 - 2.0 * t), temp);
    output = temp;
    return output;
}

// ------------------------------
// Gaussian
float4 Gaussian_float(float4 start, float4 end, float4 t, float4 sigma, out float4 output)
{
    float4 y = exp(-0.5 * pow(1.0 * t - 1.0, 2) / (sigma * sigma));
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// Cubic
float Cubic_float(float start, float end, float t, out float output)
{
    float y = t * t * (3.0 - 2.0 * t);
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// Quadric
float Quadric_float(float start, float end, float t, out float output)
{
    float y = t * t;
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// Quadratic
float Quadratic_float(float start, float end, float t, out float output)
{
    float y = (t < 0.5) ? 2.0 * t * t : -1.0 + (4.0 - 2.0 * t) * t;
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// Mitchell-Netravali
float Mitchell_float(float start, float end, float t, float B, float C, out float output)
{
    float x = t;
    float val;
    if (x < 1.0)
        val = ((12 - 9 * B - 6 * C) * x * x * x + (-18 + 12 * B + 6 * C) * x * x + (6 - 2 * B)) / 6.0;
    else
        val = ((-B - 6 * C) * x * x * x + (6 * B + 30 * C) * x * x + (-12 * B - 48 * C) * x + (8 * B + 24 * C)) / 6.0;
    output = lerp(start, end, val);
    return output;
}

// ------------------------------
// Lanczos
float Lanczos_float(float start, float end, float t, float a, out float output)
{
    float val = (t == 0.0) ? 1.0 : (sin(PI * t) / (PI * t)) * (sin(PI * t / a) / (PI * t / a));
    output = lerp(start, end, val);
    return output;
}

// ------------------------------
// Hermite
float Hermite_float(float start, float end, float t, out float output)
{
    float y = t * t * t * (2.0 * t - 3.0) + 1.0;
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// SinCosEase
float SinCosEase_float(float start, float end, float t, out float output)
{
    float y = -(cos(PI * t) - 1.0) * 0.5;
    output = lerp(start, end, y);
    return output;
}

// ------------------------------
// PingPong
float PingPong_float(float start, float end, float t, out float output)
{
    float tt = frac(t * 2.0);
    tt = (tt < 1.0) ? tt : 2.0 - tt;
    output = lerp(start, end, tt);
    return output;
}

#endif

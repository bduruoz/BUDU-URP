// BUDU Games 2024 - 2025
// Random Dots

#include "Assets/_BUDU/BUDU Shaders/hlsl/BUDUNoises/brandom.hlsl"

#define MAX_COUNT 1    

float CircleSDF(float2 uv, float2 center, float radius)
{
    return length(uv - center) - radius;
}

float SmoothCircle(float2 uv, float2 center, float radius, float smoothness)
{
    float d = CircleSDF(uv, center, radius);
    return smoothstep(0.0, smoothness, -d);
}

float GaussianCircle(float2 uv, float2 center, float radius, float sigma)
{
    float d = length(uv - center) - radius;
    return saturate(exp(-d * d / (2.0 * sigma * sigma)));
}

float GaussianDisk(float2 uv, float2 center, float radius, float sigma)
{
    float d = length(uv - center);          // merkeze uzaklık
    float delta = max(d - radius, 0.0);     // SDF’in “dışa” kısmı
    return saturate(exp(-delta * delta / (2.0 * sigma * sigma)));
}

float soft_diff(float a, float b, float k)
{
    float h = saturate(0.5 + 0.5 * (a + b) / k);
    return lerp(a, -b, h) + k * h * (1.0 - h);
}

void MultiSmoothCircles_float(
    float2 uv,
    int pointCount,
    float scaleMin,
    float scaleMax,
    float smoothMin,
    float smoothMax,
    float opacityMin,
    float opacityMax,
    float seed,
    int type,
    int resultType,
    out float output,
	out float dotout
    )
{
    float acc = 0.0;
    float c = 0.0;
    float cc = 0.0;
	int count = MAX_COUNT * pointCount;

    for (int i = 0; i < count; i++)
    {
        float2 rnd = hash2((int)i * 13.37 + seed);
        float2 center = rnd;

        float scale = lerp(scaleMin, scaleMax, hash(i * 74.43 + seed));
        float smooth = lerp(smoothMin, smoothMax, hash(i * 25.34 + seed));
        float opacity = lerp(opacityMin, opacityMax, hash(i * 741.123 + seed));

        switch (type)
        {
        case 0: // linear
            c = SmoothCircle(uv, center, scale, smooth);
            break;
        case 1: // gaussian
            c = GaussianDisk(uv, center, scale / 100, smooth / 10);
            break;
        case 2:    
            c = GaussianCircle(uv, center, scale / 100, smooth / 10);
            break;

        }
        c *= (opacity/10.0);
        switch (resultType)
        {
            case 0: // Max
                acc = max(acc, c);
                break;
            case 1: // Soft Max - Screen
                acc += c;
                break;
            case 2: // Max + Soft Max
                acc = max(acc, c) + c;
                break;
            case 3: // Difference
                acc = max(c - acc, acc);
                //acc = soft_diff(acc, c, 0.01);
                break;
        }

        cc = max(cc, GaussianDisk(uv, center, lerp(0.000, 0.0015, 1), 0.0005));
    }
    output = saturate(acc);
    dotout = saturate(cc);
}


// BUDU Games 2024
// Math Ramps

#include "Assets/_Main/Shaders/hlsl/Functions/MathRampFunctions.hlsl"

void linearRamp_float(float2 uv, out float ramp, out float raw)
{
    ramp = linearRamp(uv.x);
    raw = pow(ramp,2.2);
}

void sinusRamp_float(float2 uv, out float ramp, out float raw)
{
    ramp = sinusRamp(uv.x);
    raw = ramp - 0.5;
}

void cosinusRamp_float(float2 uv, out float ramp, out float raw)
{
    ramp = cosinusRamp(uv.x);
    raw = ramp - 0.5;
}

void addSinRamp_float(float2 uv, out float ramp, out float raw)
{
    raw = addSinRamp(uv.x);
    ramp = raw + 0.5;
}


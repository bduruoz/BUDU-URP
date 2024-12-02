// BUDU Games 2024
// Math Ramps

#include "Assets/_Main/Shaders/hlsl/Functions/MathRampFunctions.hlsl"

void linearRamp_float(float2 uv, out float2 ramp, out float2 raw)
{
    ramp.x = linearRamp(uv.x);
    ramp.y = linearRamp(uv.y);
    raw = pow(ramp,2.2);
}

void sinusRamp_float(float2 uv, out float2 ramp, out float2 raw)
{
    ramp.x = sinusRamp(uv.x);
    ramp.y = sinusRamp(uv.y);
    raw = ramp - 0.5;
}

void cosinusRamp_float(float2 uv, out float2 ramp, out float2 raw)
{
    ramp.x = cosinusRamp(uv.x);
    ramp.y = cosinusRamp(uv.y);
    raw = ramp - 0.5;
}

void addSinRamp_float(float2 uv, out float2 ramp, out float2 raw)
{
    raw.x = addSinRamp(uv.x);
    raw.y = addSinRamp(uv.y);
    ramp = raw + 0.5;
}


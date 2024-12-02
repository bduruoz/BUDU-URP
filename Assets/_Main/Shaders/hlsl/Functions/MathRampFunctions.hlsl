// BUDU Games 2024
// Math Ramp Functions

#ifndef BUDU_MATHRAMPS
#define BUDU_MATHRAMPS

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"

float linearRamp(float2 x)
{
    return frac(x);
}

float sinusRamp(float x)
{
    return (sin((x * 2) * PI - 1.5) + 1) / 2;
}

float cosinusRamp(float x)
{
    return (cos((x * 2) * PI - 1.5) + 1) / 2;
}

float addSinRamp(float x)
{
    return (sin((x * PI) * 2 + sin((x * PI) * 2))) / 2;
}

#endif

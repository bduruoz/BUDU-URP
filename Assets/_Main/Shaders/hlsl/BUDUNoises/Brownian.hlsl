// BUDU Games 2024
// Brownian Noise (fbm) 2D

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

float2 rotate(float2 vec, float rot)
{
    float s = sin(rot);
    float c = cos(rot);
    return float2(vec.x * c - vec.y * s, vec.x * s + vec.y * c);
}

float brownian2D_calc(
    float2 uv,
    float time,
    float octave,
    float scale,
    float iterScl,
    float iterAtt
    )
{
    float val = 0.0;
    float scl = scale;
    float att = 0.5;
    float cnt = 0.0;

    if(octave < 1) octave = 1;
    if(octave > 16) octave = 16;

    for(int i = 0; i < octave; i++)
    {
        cnt += att;
        val += noise_v3(uv * scl + time, float(i)) * att;

        scl *= iterScl;
        att *= iterAtt;

        uv = rotate(uv, 0.125 * PI);
    }
    return val/cnt;
}

void brownian2D_float(
    float2 uv,
    float time,
    float octave,
    float scale,
    float iterScl,
    float iterAtt,
    out float output
    )
{
    float result = brownian2D_calc(uv, time, octave, scale, iterScl, iterAtt);
    output = result;
}


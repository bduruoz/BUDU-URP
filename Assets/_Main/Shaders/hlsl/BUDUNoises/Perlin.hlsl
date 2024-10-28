// BUDU Games 2024
// Perlin Noise 2D Animated

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

float perlin_calc(float2 p, float time)
{
	float2 pi = floor(p);
    float2 pf = p - pi;
    
    float2 w = pf*pf*(3.-2.*pf);
    
    float f00 = dot(hash22(pi + float2(0.0, 0.0), time), pf - float2(0.0, 0.0));
    float f01 = dot(hash22(pi + float2(0.0, 1.0), time), pf - float2(0.0, 1.0));
    float f10 = dot(hash22(pi + float2(1.0, 0.0), time) ,pf - float2(1.0, 0.0));
    float f11 = dot(hash22(pi + float2(1.0, 1.0), time) ,pf - float2(1.0, 1.0));
    
    float xm1 = lerp(f00, f10, w.x);
    float xm2 = lerp(f01, f11, w.x);
    
    float ym = lerp(xm1, xm2, w.y); 
    return ym;
}

void perlin_float(
    float2 uv,
    float time,
    float amplitude,
    float frequency,
    float octave,
    out float output,
    out float raw
    )
{
    uv *= frequency;

    float a = amplitude;
    float r = 0.0;
    float s = 0.0;

    if(octave < 1) octave = 1;
    if(octave > 16) octave = 16;

    for(int i = 0; i < octave; i++)
    {
        r += a * perlin_calc(uv, time);
        //r += a * abs(perlin_calc(uv, time));

        s += a;
        uv *= 2.0;
        a *= 0.5;
    }
    raw = (r/s);
    output = raw + 0.5;
}

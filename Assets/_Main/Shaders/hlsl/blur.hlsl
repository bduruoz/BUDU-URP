// BUDU Games 2024
// Blur Calculations

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

void blur_float(
    bool grab,
    UnityTexture2D screenGrab,
    UnityTexture2D tex, 
    float2 guv,
    float2 uv, 
    UnitySamplerState sampler_tex, 
    float blur,
    bool customNoise, 
    float noise, 
    float numSamples, 
    float msk, 
    out float4 output)
{
    float2 getuv = float2(0, 0);
    const float bsamp  = numSamples;
    float4 result = 0;
    float bl = blur * 10 * (1 - msk);
    float2 offs = float2(0,0);
    float a = 0;
    float d = 0;

    if(grab == true)
    {
        getuv = guv;
        bl *= 0.01;
    }
    else
    {
        getuv = uv;
        bl *= 0.005;
    }

    if(customNoise == true)
    {
        a += noise;
    }
    else
    {
        a += noise_v1(getuv) * TAU;
    }
    
    for(int i = 0; i < bsamp; i++)
    {
        offs = float2(sin(a * d), cos(a * d)) * bl;
        d = frac(sin((i + a) * 123.45) * 456.78);
        d = log(sqrt(d * 10));
        offs *= d;

        if(grab == true)
        {
            result += SAMPLE_TEXTURE2D(screenGrab, sampler_tex, getuv + offs);
        }
        else
        {
            result += SAMPLE_TEXTURE2D(tex, sampler_tex, getuv + offs);
        }

        a++;
    }

    result /= bsamp;
    output = result;
}

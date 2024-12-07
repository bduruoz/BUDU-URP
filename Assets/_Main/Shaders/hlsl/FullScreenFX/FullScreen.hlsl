// BUDU GAMES © 2024
// Full Screen Effects

#include "Assets/_Main/Shaders/hlsl/Functions/Functions.hlsl"

void ZoomBlur_float(
    float4 uv,
    float2 position,
    float strength,
    float numSample,
    float intensity,
    float decay,
    float type,
    bool additive,
    UnityTexture2D _CameraOpaqueTexture,
    UnitySamplerState sampler_CameraOpaqueTexture,
    out float3 Output)
{
    // types
    // 0 = Linear
    // 1 = Square
    // 3 = additive
    // 4 = integralSmoothstep

    if(numSample < 4) numSample = 4;
    if(numSample > 256) numSample = 256;

    float2 tuv = 0;
    float2 result = 0;
    
    switch(type)
    {
        case 0:
            strength *= 0.2;
            break;
        case 1:
            strength *= 0.01;
            break;
        case 2:
            strength *= 0.01;
            break;
        case 3:
            strength *= 0.5;
            break;
        case 4:
            strength *= 0.1;
            break;
    }

    float smpRange = strength/numSample;
    float ti = 0;

    if(additive)
    {
        Output = SAMPLE_TEXTURE2D(_CameraOpaqueTexture, sampler_CameraOpaqueTexture, uv);
    }
    else
    {
        Output = 0;
    }

    for(int i = 0; i < numSample;i++)
    {
        switch(type)
        {
            case 0:
                ti = i;
                break;
            case 1:
                ti = (i - 1) * (i - 1);
                break;
            case 2:
                ti += i;
                break;
            case 3:
                ti = integralSmoothstep(i, numSample);
                break;
            case 4:
                //ti = -sqrt(i+1);
                //ti = trunc_fallof(i, 8);
                //ti = cubicSmoothstep(-i) / (numSample*100);
                //ti = -quarticSmoothstep(i) / (numSample*10000);
                ti = quinticSmoothstep(i) / (numSample*5000000);
                //ti += smpRange*i*10;
                break;
        }

        tuv = (smpRange * ti) * (position - uv.xy);
        result = uv + tuv;
        Output += saturate((SAMPLE_TEXTURE2D(_CameraOpaqueTexture, sampler_CameraOpaqueTexture, result) / numSample) * intensity);// * (i/numSample));
        intensity -= (smpRange * decay);
    }
}

void RadialBlur_float(
    UnityTexture2D mulriple_tex, 
    float2 uv, 
    UnitySamplerState origin_tex, 
    float2 pos,
    float R, 
    int type,
    float strength,
    float numSample,
    out float3 Result)
{

    if(strength<1) strength = 1;
    const float2 center = pos;
    if(numSample < 4) numSample = 4;
    const int ns = numSample;

    float2 offset = uv - center;
    offset = normalize(offset);

    float2 direction = offset;
    if(type == 1)
    {
        direction = float2(-offset.y, offset.x);
    }
    
    //float mulriple = SAMPLE_TEXTURE2D(mulriple_tex, origin_tex, uv).r;
    float r = R * 0.1;

    float3 sum_c = 0.0;

    int se = int(ns/2);
    


    for(float i = -se; i < se; i++)
    {
    	float2 uv2 = uv + direction * (i/numSample) *  r * strength;
        sum_c += SAMPLE_TEXTURE2D(mulriple_tex, origin_tex, uv2).rgb;
    }
    sum_c /= numSample;
    //return sum_c;

    Result = sum_c;
}

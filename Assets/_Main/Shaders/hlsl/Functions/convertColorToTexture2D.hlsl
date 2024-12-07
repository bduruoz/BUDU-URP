// BUDU Games 2024
// Convert Color To Texture2D

#ifndef CONVERT_TEXTURE
#define CONVERT_TEXTURE

TEXTURE2D(_gColorMap);
SAMPLER(sampler_gColorMap);
float4 _gColorMap_TexelSize;
float4 _gColorMap_ST;


void ColorToTexture_float(float4 input, float2 uv, out float dummy, out UnityTexture2D Result)
{
    //SAMPLE_TEXTURE2D(_gColorMap, sampler_gColorMap, uv);
    _gColorMap = tex2D(sampler_gColorMap, uv);

    dummy = input;
    Result = UnityBuildTexture2DStruct(_gColorMap);
}

// void ColorToTexture_half(float4 input, out float dummy, out UnityTexture2D Result)
// {
//     float4 ainput = float4(1,0,0,1);

//     float4 res = ainput * SAMPLE_TEXTURE2D(_gColorMap,sampler_gColorMap, input);
//     dummy = 1;
//     Result = UnityBuildTexture2DStruct(_gColorMap);
// }

#endif


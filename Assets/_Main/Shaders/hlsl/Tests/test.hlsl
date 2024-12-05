// BUDU GAMES © 2024
// Text Functions

void neoluyor_float(float a, float b, out float c)
{
    c = 0;
    c = a + b;
}

void Unity_SceneColor_float(
    float4 uv,
    UnityTexture2D _CameraOpaqueTexture,
    UnitySamplerState sampler_CameraOpaqueTexture,
    out float3 Out)
{
    
    Out = SAMPLE_TEXTURE2D(_CameraOpaqueTexture, sampler_CameraOpaqueTexture, uv);
}



////////////////////////////////////

#ifndef UNITY_SHADER_VARIABLES_FUNCTIONS_INCLUDED
#define UNITY_SHADER_VARIABLES_FUNCTIONS_INCLUDED

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderVariablesFunctions.deprecated.hlsl"

void nedir_float(float3 input, out float4 posCS, out float4 posNDC)
{
    posCS = posiCS(input);
    posNDC = posiNDC(input);
}

float4 posiCS(float3 input)
{
    input = float3(0,0,0);
    float4 positionCS = TransformWorldToHClip(input.positionOS.xyz);
    
    return positionCS;
}


float4 posiNDC(float3 input)
{
    float4 positionCS = posiCS(input);
    float4 positionNDC = positionCS * 0.5f;

    positionNDC.xy = float2(positionNDC.x, positionNDC.y * _ProjectionParams.x) + positionNDC.w;
    positionNDC.zw = positionCS.zw;

    return positionNDC;
}

 #endif

 // Clip Space Position (calculated for vertex shader SV_POSITION output)

//float4 positionCS 	= TransformWorldToHClip(input.positionOS.xyz);
//OUT.positionCS 		= positionCS;

// Remap, Handled automatically for the SV_POSITION semantic.
// Note that it's w (eye depth) component remains untouched, even when passed into the fragment.
// Other semantics (TEXCOORDX) passing clip space through would need to do this manually

// float4 positionNDC	= positionCS * 0.5f;
// positionNDC.xy 		= float2(positionNDC.x, positionNDC.y * _ProjectionParams.x) + positionNDC.w;
// positionNDC.zw 		= positionCS.zw;

// OUT.positionNDC 	= positionNDC;
// or just
// OUT.positionNDC 	= ComputeScreenPos(positionCS);

// Perspective Divide (handled in Fragment shader)

// float3 pd 			= IN.positionNDC.xyz / IN.positionNDC.w;
// float2 screenUV 	= pd.xy;
// float depth 		= pd.z; // for OpenGL, also need * 0.5 + 0.5;

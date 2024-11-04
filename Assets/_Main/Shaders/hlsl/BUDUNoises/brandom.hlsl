// BUDU Games 2024
// Pseudo Randoms

#ifndef BUDU_RANDOM
#define BUDU_RANDOM

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"

// noise v1 Hash23
float2 noise_v1(float2 p)
{
    float3 a = frac(float3(p.x, p.y, p.x) * float3(123.34, 234.45, 345.65));
    a += dot(a, a + 34.345);

    return frac(float2(a.x * a.y, a.y * a.z));
}

// noise v2 Hash23
float2 noise_v2(float2 p)
{
    p = float2( dot(p,float2(127.1, 311.7)), dot(p,float2(269.5, 183.3)) );
    return frac(sin(p) * 43758.5453);
} 

// Hash13 Hash without Sine: https://www.shadertoy.com/view/4djSRW
float hash13(float2 p, float o)
{
    float3 p3 = float3(p, o);
    p3  = frac(p3 * 0.1031);
    p3 += dot(p3, p3.zyx + 31.32);
    return frac((p3.x + p3.y) * p3.z);
}

float noise_v3(float2 p, float o)
{
    float4 b = float4(floor(p), ceil(p));
    float2 f = smoothstep(0.0, 1.0, frac(p));
    return lerp
        (
        lerp(
            hash13(b.xy, o),    hash13(b.zy, o),    f.x
            ), 
        lerp(
            hash13(b.xw, o),    hash13(b.zw, o),    f.x
            ), 
            f.y
        );
}

float hash21(float2 p)
{
	float h = dot(p, float2(127.1, 311.7));
	
    return  -1.0 + 2.0 * frac(sin(h) * 43758.5453123);
}

float2 hash22(float2 p, float time, float seed)
{
    if(seed == 0) seed = 86;
    matrix <float,2,2> amtx = {127.1, 311.7, 269.5, 183.3};
    p.x = amtx[0,0] * p.x + amtx[0,1] * p.y;
    p.y = amtx[1,0] * p.x + amtx[1,1] * p.y;
	p = -1.0 + 2.0 * frac(sin(p) * (14375.5453123 * seed));
	return sin(p * TAU + time);
}

float remap(float v, float minOld, float maxOld, float minNew, float maxNew) {
    return minNew + (v-minOld) * (maxNew - minNew) / (maxOld-minOld);
}

#endif

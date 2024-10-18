#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

void buduRandom_v1_float( float2 uv, float seed, out float buduRandom )
{
    buduRandom = noise_v1(uv + seed);
}

void buduRandom_v2_float( float2 uv, float seed, out float buduRandom)
{
    buduRandom = noise_v2(uv + seed);
}
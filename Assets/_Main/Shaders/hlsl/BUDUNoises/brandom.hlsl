// budu noises
#ifndef BURCAK
#define BURCAK

#define PI          3.14159265359
#define TAU         6.28318530718

float2 noise_v1(float2 p)
{
    float3 a = frac(p.xyx*float3(123.34,234.45,345.65));
    a += dot(a, a + 34.45);
    return frac(float2(a.x * a.y, a.y * a.z));
}
float2 noise_v2(float2 p)
{
    p = float2( dot(p,float2(127.1,311.7)), dot(p,float2(269.5,183.3)) );
    return frac(sin(p)*43758.5453);
}
#endif

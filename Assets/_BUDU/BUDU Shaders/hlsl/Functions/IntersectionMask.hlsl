// BUDU Games 2024 - 2025
// Intersection Mask

void IntersectionMask_float(float2 uv,
    UnityTexture2D tex1,
    UnitySamplerState sampler1,
    UnityTexture2D tex2,
    UnitySamplerState sampler2,
    float threshold,
    out float result)
{
    float m1 = tex1.Sample(sampler1, uv).r;
    float m2 = tex2.Sample(sampler2, uv).r;
    result = step(threshold, m1 * m2);
}


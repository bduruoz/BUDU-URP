// BUDU Games © 2024 Burcak Duruoz

void iterator_float(float2 uv, UnityTexture2D tex, UnitySamplerState sampler_tex, float3 nrm, float inter, float iter, float m, out float4 output)
{
    float4 result = 0;
    float a = 0;

    for(int i = 0; i < iter; i++)
    {
        a += (((iter * m)+inter)/abs(nrm.z)) * (nrm.xy * (1.0/256.0));
       
        result += SAMPLE_TEXTURE2D(tex, sampler_tex, uv + a);
    }
    output = result/iter;
}


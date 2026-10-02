// BUDU Games 2024 - 2025
// RippleNoise.hlsl – Shader Graph Custom Function

// Input:  uv   (float2)
// Input:  time (float1)  
// Input:  density (float1)
// Output: Out  (float1)

//#include "Assets/_BUDU/BUDU Shaders/hlsl/Includes/constants.hlsl"
#include "Assets/_BUDU/BUDU Shaders/hlsl/BUDUNoises/brandom.hlsl"

void RippleNoise_float(
    float2 uv, 
    float time, 
    float density, 
    float2 thickness,
    float radius,
    float speed,
    float2 grid,
    float seed,
    float randT,
    float faderOuter,
    float faderInner,
    float phase,
    float inRingFTime,
    out float Out)
{
    uv *= density;
    float2 p = floor(uv);
    float2 f = frac(uv);

    float va = 0.0;
    for (int j = -grid.x; j <= grid.x; j++)
    {
        for (int i = -grid.y; i <= grid.y; i++)
        {
            float2 g = float2((float)i, (float)j);
            float3 o = hash3(p + g + seed);
            float2 r = (g - f) + (o.xy * 2.0 - 1.0);
            
            // Outer Ring
            float dd1 = length(r);
            float d1 = dd1 * TAU * radius / density;
			float t1 = time * speed + (o.x + o.y) * randT;
            float wave1 = max(cos(d1 - t1), 0.0);
            float ring1 = smoothstep(thickness.x, thickness.y, wave1);
            float ripple1 = max(lerp(ring1, 0.0, pow(d1 * faderOuter, 0.1)), 0.0);

            // Inner Ring
            float dd2 = length(r*2);
            float d2 = dd2 * TAU * (radius * 0.8) / (density);
			float t2 = time * speed - phase + (o.x + o.y) * randT;
            float wave2 = max(cos(d2 - t2) / (1.0 + (d2 * d2 / inRingFTime)), 0.0);
            float ring2 = smoothstep(0.98, 1.05, wave2);
            float ripple2 = ring2 * saturate(1.0 - log(dd2 * faderInner));

            va += ripple1 + ripple2;
            //va += ripple1;// +ripple2;
            //va += ripple2;
        }
    }
    Out = saturate(va);
}



// BUDU WIP

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"

float3 mod289(float3 x)
{
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

float4 mod289(float4 x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

float4 permute(float4 x)
{
    return mod289((x * 34.0 + 1.0) * x);
}

float4 taylorInvSqrt(float4 r)
{
    return 1.79284291400159 - 0.85373472095314 * r;
}

float snoise(float3 v, float amp, float4 lac, float grid, float ringSize)
{
    const float2 C = float2(1.0 / 6.0, 1.0 / 3.0);

    // First corner
    float3 i  = floor(v + dot(v, C.yyy));
    float3 x0 = v - i + dot(i, C.xxx);

    // other corners
    float3 g = step(x0.yzx, x0.xyz);
    float3 l = 1.0 - g;
    float3 i1 = min(g.xyz, l.zxy);
    float3 i2 = max(g.xyz, l.zxy);

    // float3 x1 = x0 - i1  + 1.0 * C.xxx;
    // float3 x2 = x0 - i2  + 2.0 * C.xxx;
    // float3 x3 = x0 - 1.0 + 3.0 * C.xxx;
    
    float3 x1 = x0 - i1 + C.xxx;
    float3 x2 = x0 - i2 + C.yyy;
    float3 x3 = x0 - 0.5;

    // Permutations
    i = mod289(i); // Avoid truncation effects in permutation
    float4 p =  permute(
                permute(
                permute(
                    i.z + float4(0.0, i1.z, i2.z, 1.0)) +
                    i.y + float4(0.0, i1.y, i2.y, 1.0)) +
                    i.x + float4(0.0, i1.x, i2.x, 1.0));

    // Gradients: 7x7 points over a square, mapped onto an octahedron.
    // The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
    float4 j = p - ringSize * floor(p * (1.0 / ringSize));  // fmod(p,7*7)

    float4 x_ = floor(j * (1.0 / grid));
    float4 y_ = floor(j - grid * x_ );  // fmod(j,N)

    float4 x = x_ * (2 / grid) + 0.5 / grid - 1.0;
    float4 y = y_ * (2 / grid) + 0.5 / grid - 1.0;

    float4 h = 1 - abs(x) - abs(y);

    float4 b0 = float4(x.xy, y.xy);
    float4 b1 = float4(x.zw, y.zw);

    //float4 s0 = float4(lessThan(b0, 0.0)) * 2.0 - 1.0;
    //float4 s1 = float4(lessThan(b1, 0.0)) * 2.0 - 1.0;
    float4 s0 = floor(b0) * 2 + 1.0;
    float4 s1 = floor(b1) * 2 + 1.0;
    float4 sh = -step(h, float4(0, 0, 0, 0));

    float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
    float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

    float aa = 20;

    float3 g0 = float3(a0.xy/aa, h.x/aa) / lac.x;
    float3 g1 = float3(a0.zw/aa, h.y/aa) / lac.y;
    float3 g2 = float3(a1.xy/aa, h.z/aa) / lac.z;
    float3 g3 = float3(a1.zw/aa, h.w/aa) / lac.w;

    // Normalise gradients
    float4 norm = taylorInvSqrt(float4(dot(g0, g0), dot(g1, g1), dot(g2, g2), dot(g3, g3)));
    g0 *= norm.x * amp;
    g1 *= norm.y * amp;
    g2 *= norm.z * amp;
    g3 *= norm.w * amp;

    // Mix final noise value
    float4 m = max(0.6 - float4(dot(x0, x0), dot(x1, x1), dot(x2, x2), dot(x3, x3)), 0.0);
    m *= m;
    m *= m;

    float4 px = float4(dot(x0, g0), dot(x1, g1), dot(x2, g2), dot(x3, g3));
    
    float result = 42.0 * dot(m, px);
    
    return result;
}

float sampleNoises(float3 vec, float amp, float4 lac, float grid, float ringSize) {
    return  snoise(vec, amp, lac, grid, ringSize) + 0.5 * 
            snoise(vec * 4, amp, lac, grid, ringSize) + 0.25 * 
            snoise(vec * 12, amp, lac, grid, ringSize) + 0.125;
}

//#define MAX_STEPS 128
//#define MAX_DIST 100
//#define SURF_DIST 1e-3
#define EPSILON 0.000001

TEXTURE2D(NoiseTexture);
SAMPLER(sampler_NoiseTexture);

void test_float(
        float2 uv,
        float3 boundsMin,
        float3 boundsMax,

        float3 ShapeNoise,

        float3 offset,
        float3 rayOrigin,
        float3 rayDir,
        float3 viewDir,
        float3 lightDir,
        float3 position,

        float MaxSteps,
        float MaxLightSteps,

        out float4 result
        )
{
    result = 0;

    float stepSize = 0.1;
    float lightStepSize = 0.05;

    // Marching
    float3 samplePos = 0;

    float density = 1;
    float densityScale = 1;
    float sampled;
    float transmission = 0;
    float noise = 0;
    float n3D = 0;

    float lightAccumulation = 0;
    float lightRayOrigin = 0;
    float lightDensity = 0;
    float lightTransmission = 0;

    float amp = 1;

    float lac = 4;
    float grid = 7;
    float ringSize = 49;

    for(int i = 0; i < MaxSteps; i++)
    {
        rayOrigin += (rayDir * stepSize);
        samplePos = rayOrigin; 
        n3D = sampleNoises(samplePos, amp, lac, grid, ringSize);

        sampled = SAMPLE_TEXTURE2D(NoiseTexture, sampler_NoiseTexture, samplePos).x;
        noise = sampled + n3D;
        // lightRayOrigin = samplePos;
        // for(int j = 0; j < MaxLightSteps; j++)
        // {
        //     lightRayOrigin += -lightDir * lightStepSize;
        //     lightDensity = SAMPLE_TEXTURE2D(NoiseTexture, sampler_NoiseTexture, lightRayOrigin).x;
        //     lightAccumulation += lightDensity - noise;
        // }
        // lightTransmission = exp(-lightAccumulation);
        transmission = noise;
    }
    transmission = saturate(exp(-transmission));
    result = transmission;
}

float4 BlendUnder(float4 color, float4 newColor)
{
    color.rgb += (1.0 - color.a) * newColor.a * newColor.rgb;
    color.a += (1.0 - color.a) * newColor.a;
    return color;
}

void volray_float(
        UnityTexture3D volumeTex,
        UnitySamplerState volumeSampler,
        float3 FogColor,
        float3 rayOrigin,
        float3 rayDirection,
        float3 lightDirection,
        float3 objectPos,


        bool noiseTog,
        float3 noisePos,
        float noiseAmp,
        float noiseScale,
        float4 lac,
        float grid,
        float ringSize,

        float DensityScale,
        float darknessThreshold,

        float numLightSteps,
        float lightStepSize,
        float lightAbsorb,
        float transmittance,

        float depthFade,
        float fogDensityScale,

        out float3 result,
        out float Masks
    )
{
    result = 0;
    float3 offset = float3(0.5, 0.5, 0.5);

    float stepSize = 0.01;
    float3 samplePos = 0;
    float3 cloudSamPos = 0;
    
    float sampleCloudDensity = 0;
    float sampleDensity = 0;
    float transmission = 0;
    float n3Da = 1;
    float n3Db = 1;
    float noise = 0;

    float lightAccumulation = 0;
    float lightTransmission = 0;
    float lightDensity = 1;
    float density = 0;

    float4 color = float4(0, 0, 0, 0);
    float4 scolor = float4(1, 1, 1, 1);

    float numSteps = 128;

    samplePos = rayOrigin;

    float3 lightRayOrigin = 0;

    float shadow = 0;

    float resultLight = 0;

    float colAlpha = 0;

    float4 sampledColor = 0;
    float4 sampledColorShadow = 0;

    float3 NoiseRayOrigin = 0;
    float NoiseAccum = 0;
    float noiseTrans = 0;

    float resultnoise = 1;

    float tr = 0;
    float trmt = 0;

    float3 loloSam = 0;
    float lolo = 0;
    float rLolo = 0;

    float3 ro = 0;

    float3 offsetN2 = float3(8, 8, 8);


    // Marching
    for(int i = 0; i < numSteps; i++)
    {
        // 3D Textured Cloud
        rayOrigin += rayDirection * stepSize;
        cloudSamPos = rayOrigin + offset;
        sampleCloudDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, cloudSamPos).r;
        density += sampleCloudDensity * DensityScale;
        // End 3D Textured Cloud

        // 3D Textured Cloud Shadow
        lightRayOrigin = cloudSamPos;

        for(int j = 0; j < numLightSteps; j++)
        {
            lightRayOrigin += -lightDirection * lightStepSize;
            lightDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, lightRayOrigin).r;
            lightAccumulation += lightDensity;
        }
        lightTransmission = exp(-lightAccumulation);

        shadow = darknessThreshold + lightTransmission * (1.0 - darknessThreshold);
        // End 3D Textured Cloud Shadow

        resultLight += (density * transmittance * shadow);

        transmittance *= exp(-density * lightAbsorb);


        // 3D Noise Fog
        if( max(abs(samplePos.x), max(abs(samplePos.y), abs(samplePos.z)) ) < 0.5 + EPSILON)
        {
            if(noiseTog)
            {
                n3Da = sampleNoises((samplePos * noiseScale) + noisePos, noiseAmp, lac, grid, ringSize);
                n3Db = sampleNoises((samplePos + offsetN2 * noiseScale) - (noisePos / 2), noiseAmp, lac, grid, ringSize);
                // resultnoise = clamp(n3Da - n3Db, -0.5, 0.5);
                
                // resultnoise = clamp(n3Da + n3Db, -0.5, 0.5);
                // resultnoise = clamp(n3Da * n3Db, -0.5, 0.5);
                // resultnoise = clamp(n3Db - n3Da, -0.5, 0.5);

                resultnoise = smoothstep(0.0, 0.3, n3Db - n3Da);
            }
            else
            {
                color = 1;
            }
            sampledColor = SAMPLE_TEXTURE2D(NoiseTexture, sampler_NoiseTexture, samplePos) * resultnoise;
            
            sampledColor.a *= fogDensityScale;
            color = BlendUnder(color, sampledColor/20);
            samplePos += rayDirection * stepSize;
        }

        // End 3D Noise Fog

    }

    transmission = exp(-density);

    //result = resultLight;
    //Masks = result * color.a;

    result = saturate(color * 100);// saturate(color * 50 * depthFade);// * FogColor;// * FogColor;// * color;

    //result = transmission;

    //Masks = (1-transmission) * depthFade;//saturate(color * 5 * depthFade);// transmission;
   
    Masks = saturate(color * 200) * saturate(depthFade * 100);//saturate((color) * (1-transmission));
}



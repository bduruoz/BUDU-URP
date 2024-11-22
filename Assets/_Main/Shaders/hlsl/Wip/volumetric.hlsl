// BUDU WIP

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"

float3 mod289(float3 x, float seed)
{
    return (x + floor(seed)) - floor(x * (1.0 / 289.0)) * 289.0;
}

float4 mod289(float4 x, float seed) {
    return (x + floor(seed)) - floor(x * (1.0 / 289.0)) * 289.0;
}

float4 permute(float4 x)
{
    return mod289((x * 34.0 + 1.0) * x, 289);
}

float4 taylorInvSqrt(float4 r)
{
    return 1.79284291400159 - 0.85373472095314 * r;
}

float snoise(float3 v, float4 amp, float4 lac, float grid, float ringSize, float seed)
{
    grid = floor(grid);
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
    i = mod289(i, seed); // Avoid truncation effects in permutation
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

    float3 g0 = float3(a0.xy, h.x) / lac.x;
    float3 g1 = float3(a0.zw, h.y) / lac.y;
    float3 g2 = float3(a1.xy, h.z) / lac.z;
    float3 g3 = float3(a1.zw, h.w) / lac.w;

    // Normalise gradients
    float4 norm = taylorInvSqrt(float4(dot(g0, g0), dot(g1, g1), dot(g2, g2), dot(g3, g3)));
    g0 *= norm.x * amp.x;
    g1 *= norm.y * amp.y;
    g2 *= norm.z * amp.z;
    g3 *= norm.w * amp.w;

    // Mix final noise value
    float4 m = max(0.6 - float4(dot(x0, x0), dot(x1, x1), dot(x2, x2), dot(x3, x3)), 0.0);
    m *= m;
    m *= m;

    float4 px = float4(dot(x0, g0), dot(x1, g1), dot(x2, g2), dot(x3, g3));
    
    float result = 42.0 * dot(m, px);
    
    return result;
}

float sampleNoises(float3 vec, float4 amp, float4 lac, float grid, float ringSize, float seed) {
    return  snoise(vec, amp, lac, grid, ringSize, seed) + 0.5 * 
            snoise(vec * 4, amp, lac, grid, ringSize, seed) + 0.25 * 
            snoise(vec * 12, amp, lac, grid, ringSize, seed) + 0.125;
}

//#define MAX_DIST 100
//#define SURF_DIST 1e-3
#define EPSILON 0.000001

TEXTURE2D(NoiseTexture);
SAMPLER(sampler_NoiseTexture);

TEXTURE2D(NoiseTextureB);
SAMPLER(sampler_NoiseTextureB);

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

    float seed = 289;

    for(int i = 0; i < MaxSteps; i++)
    {
        rayOrigin += (rayDir * stepSize);
        samplePos = rayOrigin; 
        n3D = sampleNoises(samplePos, amp, lac, grid, ringSize, seed);

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
        
        float3 inst,

        float3 FogColor,
        float3 rayOrigin,
        float3 rayDirection,
        float3 lightDirection,
        float3 objectPos,

        bool noiseATog,
        bool noiseBTog,
        bool noiseAInv,
        bool noiseBInv,
        float3 noisePosA,
        float3 noisePosB,
        float4 noiseAAmp,
        float3 noiseAScale,
        float4 noiseBAmp,
        float3 noiseBScale,
        float4 lacA,
        float4 lacB,
        float gridA,
        float gridB,
        float ringSizeA,
        float ringSizeB,
        float sStepMin,
        float sStepMax,
        float seedA,
        float seedB,

        float DensityScale,
        float darknessThreshold,

        float numSteps,
        float stepSize,
        float3 SkyColor,
        float AmbientDensity,

        float numLightSteps,
        float lightStepSize,
        float lightAbsorb,
        float ambAbsorb,
        float transmittance,
        float ambTransmittance,

        float depthFade,
        float fogDensityScale,

        bool NegativeAmbient,

        out float3 Result,
        out float Masks,
        out float3 VolumeNoiseA,
        out float3 VolumeNoiseB,
        out float3 VolAmbient,
        out float3 VolLight,
        out float Shadow
    )
{
    Result = 0;
    Masks = 0;
    VolumeNoiseA = 0;
    VolumeNoiseB = 0;
    VolAmbient = 0;
    VolLight = 0;
    Shadow = 0;

    // Noise Type
    // 0 = Noise A
    // 1 = Noise B
    // 2 = Noise A - Noise B
    // 3 = Noise A + Noise B
    // 4 = Noise A * Noise BV    
    //int ctyp = 0; // floor(calcType); 


    float3 offset = float3(0.5, 0.5, 0.5);

    float sampleCloudDensity = 0;
    float sampleDensity = 0;
    float transmission = 0;

    float n3Da = 1;
    float n3Db = 1;

    float3 lightDensity = 1;
    float density = 0;
    float ambDensity = 0;

    float4 colorA = 0;
    float4 colorB = 0;

    float3 samplePos = rayOrigin;
    float3 cloudSamPos = 0;

    float3 lightRayOrigin = 0;
    float3 lightAccumulation = 0;
    float3 lightTransmission = 0;

    float3 shadow = 0;
    
    float colAlpha = 0;

    float4 sampledColor = 0;
    float4 sampledColorB = 0;
    float4 sampledColorShadow = 0;

    float3 NoiseRayOrigin = 0;
    float NoiseAccum = 0;
    float noiseTrans = 0;

    float3 ResultLight = 0;
    float3 ResultAmbient = 0;

    float ResultNoise = 1;
    float ResultNoiseB = 1;

    transmission *= 0.1;
    ambTransmittance *= 0.1;

    // Marching
    for(int i = 0; i < numSteps; i++)
    {
        // 3D Textured Cloud
        rayOrigin += rayDirection * stepSize;
        cloudSamPos = rayOrigin + offset;
        sampleCloudDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, cloudSamPos).r;
        density += sampleCloudDensity * DensityScale;
        // End 3D Textured Cloud

        // 3D Textured Cloud Light & Shadow
        lightRayOrigin = cloudSamPos;
        for(int j = 0; j < numLightSteps; j++)
        {
            lightRayOrigin += -lightDirection * lightStepSize;
            lightDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, lightRayOrigin).r;
            // Instinc Color Calculation
            lightDensity *= 1-lerp(inst, float3(0,0,0), 1/numLightSteps);
            lightAccumulation += lightDensity;
        }
        lightTransmission = exp(-lightAccumulation);
        shadow = darknessThreshold + lightTransmission * (1.0 - darknessThreshold);
        // End 3D Textured Cloud Light & Shadow

        ResultLight += (density * transmittance * shadow);
        ResultAmbient += (density * ambTransmittance * ((AmbientDensity)*100));

        transmittance *= exp(-density * lightAbsorb);
        ambTransmittance *= exp(-density * (ambAbsorb*5));

        transmission = exp(-density);

        // 3D Noise Fog
        if( max(abs(samplePos.x), max(abs(samplePos.y), abs(samplePos.z)) ) < 0.5 + EPSILON)
        {
            if(noiseATog)
            {
                n3Da = sampleNoises((samplePos * noiseAScale) + noisePosA, noiseAAmp, lacA, gridA, ringSizeA, seedA + 0.0) * depthFade;
                ResultNoise = smoothstep(sStepMin, sStepMax, clamp(n3Da, -0.5, 0.5));
                if(noiseAInv) ResultNoise = smoothstep(sStepMax, sStepMin, clamp(n3Da, -0.5, 0.5));;
                sampledColor = SAMPLE_TEXTURE2D(NoiseTexture, sampler_NoiseTexture, samplePos) * ResultNoise * (1 - transmission);


                sampledColor.a *= fogDensityScale;

                colorA = BlendUnder(colorA, sampledColor/20) ;
            }
            else
            {
                //colorA = 0;
            }

            if(noiseBTog)
            {
                n3Db = sampleNoises((samplePos * noiseBScale) + noisePosB, noiseBAmp, lacB, gridB, ringSizeB, seedB + 1.0) * depthFade;
                ResultNoiseB = smoothstep(sStepMin, sStepMax, clamp(n3Db, -0.5, 0.5));
                if(noiseBInv) ResultNoiseB = smoothstep(sStepMax, sStepMin, clamp(n3Db, -0.5, 0.5));;
                sampledColorB = SAMPLE_TEXTURE2D(NoiseTextureB, sampler_NoiseTextureB, samplePos) * ResultNoiseB * (1 - transmission);

                sampledColorB.a *= fogDensityScale;

                colorB = BlendUnder(colorB, sampledColorB/20);
            }
            else
            {
                //colorB = 0;
            }

            samplePos += rayDirection * stepSize;
        }
        // End 3D Noise Fog
    }


    if(NegativeAmbient) ResultAmbient = (1-ResultAmbient) + 0.5;
    ResultAmbient *= SkyColor;

    Result = ResultLight + ResultAmbient;
    Masks = 1-transmission;
    VolumeNoiseA = saturate(colorA * 200);
    VolumeNoiseB = saturate(colorB * 200);
    VolAmbient = saturate(ResultAmbient);
    VolLight = ResultLight;
    Shadow = shadow;
}

// Masks = Result * color.a;
// Result = saturate(color * 100);// 0.5;//saturate(color * 100);// saturate(color * 50 * depthFade);// * FogColor;// * FogColor;// * color;
// Result = transmission;
// Masks = (1-transmission) * depthFade;//saturate(color * 5 * depthFade);// transmission;
// Masks = saturate(color * 200) * saturate(depthFade * 100);//saturate((color) * (1-transmission));

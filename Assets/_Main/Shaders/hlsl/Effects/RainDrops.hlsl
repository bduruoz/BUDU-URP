// BUDU Games - Rain Drop Layer Instancer
#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

#define S(a, b, t) smoothstep(a, b, t)

// Rain Drops
// x,y = offset variables
// z = fog trail variable
float3 drops(
    float2 UV, 
    float2 aspect, 
    float2 objectAspect,
    float IDSeed, 
    float curlSize, 
    float dropNoise, 
    float trailDropNo, 
    float trailIntensity, 
    float trailNoise,
    float trailOut, float trailIn, 
    float fogTOut, float fogTIn,
    float fogTrailLength,
    float wiggleIntensity,
    float wiggleNoise, 
    float size, 
    float t,
    out float drplts
    )
{
    //aspect = aspect / objectAspect;
    drplts = 0;
    int wgType = 0;

    float2 uv = UV * size * aspect * objectAspect;
    uv.y += t * 0.25;

    float2 gv = frac(uv) - 0.5;

    float2 id = floor(uv);

    float rndw = noise_v1(id);
    if(rndw<0.333)
    {
        wgType = 0;
    }
    else if(rndw >= 0.333 || rndw < 0.666)
    {
        wgType = 1;
    }
    else
    {
        wgType = 2;
    }

    if(IDSeed == 0)
    {
        IDSeed = 21;
    }
    float n = noise_v1(id * (IDSeed + 1) * 0.02);
    t += (n * 6.28318530718);

    float curl = (saturate(n * noise_v1(id)) + 1) * 10;
    curl *= curlSize;

    float w = UV.y * curl;
    float x = (n - 0.5) * 0.8;
    
    float wiggle = 0;

    switch(wgType)
    {
        case 0:
            wiggle = sin(3 * w) * pow(sin(w), 6) * 0.45;
            break;
        case 1:
            wiggle = (sin(w*1.5 + sin(w*2.1 + sin(w*3.2))) * pow(sin(w * 0.5), 5)) * 0.45;
            break;
        case 2:
            wiggle = (sin(w*1.5 + sin(w*2 + cos(w*3))) * pow(sin(w * 1.3), 4)) * 0.45;
            break;
    }

    x += (0.4 - abs(x)) * ((wiggle + wiggleNoise) * wiggleIntensity);

    float y = -sin(t + sin(t + sin(t) * 0.5)) * 0.45; 
    y -= (gv.x - x) * (gv.x - x);

    float2 dropPos = (gv - float2(x, y)) / aspect;
    dropPos += (dropNoise * 1);
    //dropPos *= objectAspect;
    float drop =  S(0.04, 0.03, length(dropPos));
    
    float2 trailPos = (gv - float2(x, t * 0.25)) / aspect;
    trailPos.y = (frac(trailPos.y * trailDropNo) - 0.5) / trailDropNo; 

    trailPos -= (trailNoise * 0.01);

    if(trailOut<trailIn) trailOut = trailIn + 0.001;
    if(trailIn>trailOut) trailIn = trailOut - 0.001;

    float trail =  S(trailOut * 0.1, trailIn * 0.1, length(trailPos));
    
    if(fogTOut < fogTIn) fogTOut = fogTIn + 0.001;
    if(fogTIn > fogTOut) fogTIn = fogTOut - 0.001;

    float fogTrail = S(-0.05, 0.05, (dropPos.y));
    fogTrail *= S(fogTrailLength, y, gv.y);
    
    trail *= fogTrail * trailIntensity;

    fogTrail *= S(fogTOut, fogTIn, abs(dropPos.x));

    float2 offs = drop * dropPos + trail * trailPos;

    drplts += drop + trail + (fogTrail * 0.1);

    return float3(offs, fogTrail);
}

void rainDrops_float(
    int layer,
    float layerSeed,
    float2 uv,
    float2 aspect,
    float2 objectAspect,
    float IDSeed,
    float distortion,
    float curlSize,
    float dropNoise, 
    float trailDropNo,
    float trailIntensity,
    float trailNoise,
    float trailOut, float trailIn,
    float fogTOut, float fogTIn,
    float fogTrailLength,
    float wiggleIntensity,
    float wiggleNoise,
    float fogTrailIntensity,
    float size,
    float t, 
    out float2 offset, 
    out float fogTrail,
    out float droplets,
    out float debug
    )
{
    if(layer < 0)
    {
        layer = 0;
    }
    if(layer >= 10)
    {
        layer = 10;
    }

    float2 layeruv = float2(uv);
    float3 result = 0;
    float3 resultFin = float3(0,0,0);

    float a = 0;
    float b = 0;

    droplets = 0;
    offset = 0;
    fogTrail = 0;
     
    for(int i = 0; i <= layer; i++)
    {
        if(i==0)
        {
            layeruv = uv;
        }
        else
        {
            a = 1 + (noise_v1(i * (layerSeed + 1)));
            b = (remap(noise_v1(i * (layerSeed + 25)), 0, 1, 6.00, 24.00));
            
            layeruv = uv * a + b;
        }
        
        result = drops(layeruv, aspect, objectAspect, IDSeed, curlSize, dropNoise, trailDropNo, trailIntensity, trailNoise, trailOut, trailIn, fogTOut, fogTIn, fogTrailLength, wiggleIntensity, wiggleNoise, size, t, droplets);
        
        droplets += droplets;
        resultFin += result;
    }

    debug = 0;

    // distance fade
    float fade = 1-saturate(fwidth(uv) * 60);

    offset = resultFin.xy * distortion * fade;
    fogTrail = resultFin.z * fogTrailIntensity;
} 


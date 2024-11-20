// BUDU Games 2024
// Volumetric Cloud
// Based On https://shaderbits.com/blog/creating-volumetric-ray-marcher

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"
#include "Assets/_Main/Shaders/hlsl/Functions/Functions.hlsl"

// float HenyeyGreenstein(float g, float costh)
// {
//     return (1.0 - g * g) / (4.0 * PI * pow(1.0 + g * g - 2.0 * g * costh, 3.0/2.0));
// }

float HenyeyGreenstein(float theta, float g)
{
    float s = 1.0 / (4.0 * PI);
    float numer = 1.0 - g*g;
    float denom = 1.0 + g*g - 2.0 * g * cos(theta);
    return s * numer / pow(denom, 3./2.);
}
float HenyeyGreenstein_(float cos_th, float g)
{
    float s = 1.0 / 2.0;
    float numer = 1.0 - g * g;
    float denom = 1.0 + g * g - 2.0 * g * cos_th;
    return s * numer / pow(denom, 3./2.);
}

float Explicit(float x, float g) 
{ 
    return log10(HenyeyGreenstein(x, g)); 
}

float Explicit_dydx(float x, float g)
{
    /*Numeric derivative.*/
    const float dx = 0.01;
    return ( Explicit(x+dx,g) - Explicit(x-dx,g) ) / (2.*dx);
    /* Analytic derivative. If you know expression. *
    return -M*sin(M*x);
    /**/
}

void volumetricCloud_float(
        UnityTexture3D volumeTex,
        float3 Noise,
        UnitySamplerState volumeSampler,

        float3 rayOrigin, 
        float3 rayDirection, 
        float3 lightDir,

        float3 LightColor,
        float3 SkyColor,

        float numSteps,
        float stepSize,
        float densityScale, 
        float AmbientDensity,
        float AmbientStrength,

        float numLightSteps, 
        float lightStepSize, 
        float lightAbsorb, 
        float darknessThreshold,
        float transmittance,
        float transmissionCoef,

        out float3 result,
        out float3 lightEnergy
)
{
    float3 offset = float3(0.5, 0.5, 0.5);

    if (transmissionCoef<0.0001){transmissionCoef = 0.0001;}

    float density = 0;
    float ambDensity = 0;
    float transmission = 0;
    float lightAccumulation = 0;
	
    float3 lEnergy = 0;
    float shadow = 0;
    float ambShadow = 0;
    
    float3 lightRayOrigin = 0;
    float lightDensity = 0;
    float lightTransmission = 0;

    float resultLight = 0;
    float resultAmbient = 0;
    
    for (int i = 0; i < numSteps; i++)
    {
        rayOrigin += (rayDirection * stepSize);

        float3 samplePos = (rayOrigin + offset);
        float3 sampledDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, samplePos).r;
        density += sampledDensity * densityScale;
        
        lightRayOrigin = samplePos;
		
        for (int j = 0; j < numLightSteps; j++)
        {
            lightRayOrigin += -lightDir * lightStepSize;
            lightDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, lightRayOrigin).r;
            lightAccumulation += lightDensity;

        }
        ambDensity += (lightDensity + (AmbientDensity/100)) * (AmbientStrength/1000);

        lightTransmission = exp(-lightAccumulation);

        shadow = darknessThreshold + lightTransmission * (1.0 - darknessThreshold);
        ambShadow += darknessThreshold + lightTransmission * (1.0 - darknessThreshold);

        resultLight += (density * transmittance * shadow);
        resultAmbient += ambDensity * transmittance * ambShadow;
        
        transmittance *= exp(-density * lightAbsorb);
        
    }
    transmission = exp(-density/(transmissionCoef*10));//exp(-density);

    float3 ResultLight = resultLight * LightColor;
    float3 ResultAmbient = pow(smoothstep(-5,5,(resultAmbient / 1)),0.5) * SkyColor;

    lEnergy = ResultAmbient + ResultLight;

    lightEnergy = lEnergy;
    
    result = float3(resultLight, transmission, transmittance);
}

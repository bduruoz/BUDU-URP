// BUDU Games 2024
// Volumetric Cloud
// Based On https://shaderbits.com/blog/creating-volumetric-ray-marcher

#include "Assets/_Main/Shaders/hlsl/Functions/Functions.hlsl"

void volumetricCloud_float(
        UnityTexture3D volumeTex,
        float3 UV,
        UnitySamplerState volumeSampler,

        float3 rayOrigin, 
        float3 rayDirection, 
        float3 lightDir,
        float3 camDir,

        float3 LightColor,
        float3 ShadowColor,
        float3 SkyColor,
        float3 ExtinctionColor,

        float numSteps,
        float stepSize,
        float densityScale, 
        float AmbientDensity,
        float extincDensity,

        float3 offset, 
        float numLightSteps, 
        float lightStepSize, 
        float lightAbsorb, 
        float darknessThreshold,
        float transmittance,
        float exTransmittance,
        out float3 result,
        out float3 lightEnergy
)
{
    float extIntensity = 5;
    
    float density = 0;
    float exDensity = 0;
    float transmission = 0;
    float lightAccumulation = 0;
    float lightExtinc = 0;
	
    float3 lEnergy = 0;
    float shadowdist = 0;
    float ShadowDensity = 1;
    float curdensity = 0;

    float ambDensity = 0;
    float shadow = 0;
    float ambShadow = 0;
    float exShadow = 0;
    float lightTransmission = 0;
    float ambTransmission = 0;
    float exTransmission = 0;
    float contour = 0;
    
    float resultLight = 0;
    float resultEx = 0;

    float3 fresnelCloud = 0;
    float3 inv_fresnelCloud = 0;
    float3 lightScatter = 0;
    float3 inv_lightScatter = 0;
    float3 finalLight = 0;
    float3 finalAmbient = 0;
    float3 finalScatter = 0;
    float3 finalContour = 0;
    
    float3 finalShadow = 0;
    float3 finalExtinc = 0;
    
    float3 lightRayOrigin = 0;
    float lightDensity = 0;
    
    float3 test = 0;
    
    for (int i = 0; i < numSteps; i++)
    {
        rayOrigin += (rayDirection * stepSize);

        float3 samplePos = rayOrigin + offset;
        float3 sampledDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, samplePos).r;
        density += sampledDensity * densityScale;
        exDensity += (sampledDensity / 2) * extincDensity;
        
        lightRayOrigin = samplePos;
		
        for (int j = 0; j < numLightSteps; j++)
        {
            lightRayOrigin += -lightDir * lightStepSize;
            lightDensity = SAMPLE_TEXTURE3D(volumeTex, volumeSampler, lightRayOrigin).r;
            lightAccumulation += lightDensity;
            
            ambDensity += exp(lightDensity);
        }

        lightTransmission += exp(-lightAccumulation);
        ambTransmission += exp(-lightAccumulation);
        exTransmission += exp(-lightAccumulation);
        
        shadow = darknessThreshold + lightTransmission * (1.0 - darknessThreshold);
        ambShadow = darknessThreshold + ambTransmission * (1.0 - darknessThreshold);
        exShadow = darknessThreshold + exTransmission * (1.0 - darknessThreshold);
        
        resultLight += density * transmittance * shadow;
        transmittance *= exp(-density * lightAbsorb);
        
        resultEx += exDensity * exTransmittance * exShadow;
        exTransmittance *= exp(-exDensity * lightAbsorb);

        ambDensity += (sampledDensity * AmbientDensity);
        exDensity += (sampledDensity * extincDensity);

        contour += 1-sqrt(ambDensity * transmittance) * sampledDensity * 5;
    }
    transmission = exp(-density);

    fresnelCloud = saturate(1 - (density / 40));
    inv_fresnelCloud = 1 - fresnelCloud;
    
    lightScatter = pow(1.0 - ambDensity / 2000, 4.0) * 10;
    inv_lightScatter = pow(1.0 - sqrt(lightScatter), 4);
    
    finalScatter = resultEx * ExtinctionColor;
    finalAmbient = fresnelCloud * SkyColor;
    
    finalShadow = smoothstep(0.1,1,pow(resultLight + 0.5, 2));
    //finalExtinc = clamp(parabola(finalScatter, 2), 0.0, 1) * ExtinctionColor;
    
    finalLight = (resultLight * LightColor) / 3;
    
    finalContour = saturate(pow(contour / 150, 2));
    
    lEnergy = finalScatter *100000000;
    
    lightEnergy = lEnergy;
    
    result = float3(resultLight, transmission, transmittance);
}

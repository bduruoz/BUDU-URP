// © BUDU Games 2024 - 2026
// Main light Node

#ifndef MAINLIGHT_INCLUDED
#define MAINLIGHT_INCLUDED  

void GetMainLightData_float(
	float3 worldPos,
    out half3 direction, 
    out half3 color, 
    out half distanceAttenuation, 
    out half shadowAttenuation, 
    out half3 LightPos)
{
#ifdef SHADERGRAPH_PREVIEW
    direction = normalize(half3(-0.3, -0.8, 0.6));
    color = half3(1, 1, 1);
    distanceAttenuation = 1.0;
    shadowAttenuation = 1.0;
    LightPos = half3(0,0,0);
#else
    // Universal Render Pipeline
    #if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
        #if defined(SHADERPASS_UNLIT)
            // Unlit path
            float4 shadowCoord = TransformWorldToShadowCoord(worldPos);
            Light mainLight = GetMainLight(shadowCoord);
        #else
            // Lit path
            Light mainLight = GetMainLight();
        #endif
        direction = -mainLight.direction;
        color = mainLight.color;
        distanceAttenuation = mainLight.distanceAttenuation;
        shadowAttenuation = mainLight.shadowAttenuation;
        LightPos = _MainLightPosition;
    #else
        direction = normalize(half3(-0.3, -0.8, 0.6));
        color = half3(1, 1, 1);
        distanceAttenuation = 1.0;
        shadowAttenuation = 1.0;
        LightPos = half3(0, 0, 0);
    #endif

#endif
}

#endif // MAINLIGHT_INCLUDED

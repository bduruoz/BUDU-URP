// © BUDU Games 2024 - 2026
// LightNodeCustom.hlsl 
// BUDU Games - Custom Additional Lights Node for Unity URP
// Supports: Forward, Forward+ and Deferred Rendering Paths
// Unity Manual Reference:
// https://docs.unity3d.com/6000.3/Documentation/Manual/urp/use-built-in-shader-methods-additional-lights-fplus.html

#ifndef LIGHT_NODE_CUSTOM_INCLUDED
#define LIGHT_NODE_CUSTOM_INCLUDED

#if !defined(UNIVERSAL_LIGHTING_INCLUDED) && !defined(SHADERGRAPH_PREVIEW)
    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
#endif

// URP's GetAdditionalPerObjectLight() computes light.direction in half precision
// (half3 lightDirection = half3(lightVector * rsqrt(distanceSqr));). Near grazing
// angles (close to a punctual light), this direction changes very fast per-pixel,
// and the half precision quantization becomes visible as jagged/banded specular
// edges. Directional lights don't show this because their direction is constant.
// This helper recomputes the light direction in full float precision so it can
// replace light.direction before doing NdotL / half-vector specular math.
#if !defined(SHADERGRAPH_PREVIEW) && defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
    float3 GetAdditionalLightFloatDirection(uint perObjectLightIndex, float3 positionWS)
    {
        #if USE_STRUCTURED_BUFFER_FOR_LIGHT_DATA
            float4 lightPositionWS = _AdditionalLightsBuffer[perObjectLightIndex].position;
        #else
            float4 lightPositionWS = _AdditionalLightsPosition[perObjectLightIndex];
        #endif

        float3 lightVector = lightPositionWS.xyz - positionWS * lightPositionWS.w;
        float distanceSqr = max(dot(lightVector, lightVector), HALF_MIN);
        return lightVector * rsqrt(distanceSqr);
    }

    // Mirrors the index resolution done inside GetAdditionalLight(uint i, ...) so the
    // float-precision direction lines up with the same light as the loop's "i" index.
    float3 GetAdditionalLightFloatDirectionFromLoopIndex(uint i, float3 positionWS)
    {
        #if USE_CLUSTER_LIGHT_LOOP
            int perObjectLightIndex = i;
        #else
            int perObjectLightIndex = GetPerObjectLightIndex(i);
        #endif
        return GetAdditionalLightFloatDirection(perObjectLightIndex, positionWS);
    }
#endif

// Helpers: Calculate Normalized Screen Space UV for Forward+ / Clustering
float2 GetCustomNormalizedScreenUV(float3 worldPos, float4 screenPos)
{
    float2 uv = float2(0.5, 0.5);

    #if !defined(SHADERGRAPH_PREVIEW) && defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
        float4 clipPos = TransformWorldToHClip(worldPos);
        float2 ndc = clipPos.xy / max(abs(clipPos.w), 0.00001);
        float2 pixelPos = (ndc * 0.5 + 0.5) * GetScaledScreenParams().xy;
    #if UNITY_UV_STARTS_AT_TOP
        pixelPos.y = GetScaledScreenParams().y - pixelPos.y;
    #endif
        uv = GetNormalizedScreenSpaceUV(pixelPos);
    #endif
    return uv;
}

// Calculate Additional Lights !!!!
// Handles Forward, Forward+ and Deferred.
void CalculateAdditionalLights_float(float3 PositionWS, float3 reflect, float4 ScreenPosition, float3 SColor, float Smoothness,
    out half3 Diffuse, out half3 Specular)
{
    #ifdef SHADERGRAPH_PREVIEW
        half3 previewLightDir = normalize(half3(0.5, 0.8, -0.4));
        half NdotL = saturate(dot(reflect, previewLightDir));
        Diffuse = half3(0.4, 0.4, 0.45) * NdotL;

        half3 halfVec = normalize(previewLightDir + reflect);
        half NdotH = saturate(dot(reflect, halfVec));
        Specular = half3(0.3, 0.3, 0.3) * pow(NdotH, exp2(1.0 * Smoothness + 1.0));
    #else
        Diffuse = half3(0, 0, 0);
        Specular = half3(0, 0, 0);
		half3 attenColor = half3(0, 0, 0);
          
		half3 normalWS = SafeNormalize(reflect);
		half3 viewDirWS = SafeNormalize(reflect);

		#if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
			reflect = SafeNormalize(reflect);

			InputData inputData = (InputData)0;
			inputData.positionWS = PositionWS;
			inputData.normalizedScreenSpaceUV = GetCustomNormalizedScreenUV(PositionWS, ScreenPosition);

			#if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
				half4 shadowMask = inputData.shadowMask;
			#elif !defined(LIGHTMAP_ON)
				half4 shadowMask = unity_ProbesOcclusion;
			#else
				half4 shadowMask = half4(1.0, 1.0, 1.0, 1.0);
			#endif

			#ifdef _LIGHT_LAYERS
				uint meshRenderingLayers = GetMeshRenderingLayer();
			#endif

			// Main Light Contribution (Directional Light) - requires shadow coord for shadowAttenuation to work
			#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
				float4 shadowCoord = TransformWorldToShadowCoord(PositionWS);
				Light mainLight = GetMainLight(shadowCoord, PositionWS, shadowMask);
			#else
				Light mainLight = GetMainLight();
			#endif
			Specular += mainLight.color * (mainLight.distanceAttenuation * mainLight.shadowAttenuation) * pow(saturate(dot(reflect, SafeNormalize(mainLight.direction + reflect))), Smoothness);

			// 1. Clustered Directional Lights
            #if USE_CLUSTER_LIGHT_LOOP
                [loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
                {
                    CLUSTER_LIGHT_LOOP_SUBTRACTIVE_LIGHT_CHECK
                    Light light = GetAdditionalLight(lightIndex, PositionWS, shadowMask);
                    float3 lightDir = GetAdditionalLightFloatDirectionFromLoopIndex(lightIndex, PositionWS);

                    #ifdef _LIGHT_LAYERS
                        if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
                    #endif
                    {
                        half3 attenColor = light.color * (light.distanceAttenuation * light.shadowAttenuation);
                        float NdotL = saturate(dot(float3(reflect), lightDir));
                        Diffuse += attenColor * NdotL;
                        float3 halfVec = SafeNormalize(lightDir + reflect);
                        float NdotH = saturate(dot(reflect, halfVec));
                        float specTerm = pow(NdotH, Smoothness);
                        Specular += (attenColor * specTerm * SColor);
                    }
                }
            #endif

            // 2. Punctual Lights (Clustered loop in Forward+/Deferred, per-object in Forward)
            uint pixelLightCount = GetAdditionalLightsCount();
            LIGHT_LOOP_BEGIN(pixelLightCount)
                Light light = GetAdditionalLight(lightIndex, PositionWS, shadowMask);
                float3 lightDir = GetAdditionalLightFloatDirectionFromLoopIndex(lightIndex, PositionWS);

                #ifdef _LIGHT_LAYERS
                    if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
                #endif
                {
                    half3 attenColor = light.color * (light.distanceAttenuation * light.shadowAttenuation);
                    float NdotL = saturate(dot(reflect, lightDir));
                    Diffuse += attenColor * NdotL;
                    float3 halfVec = SafeNormalize(lightDir + reflect);
                    float NdotH = saturate(dot(reflect, halfVec));
                    float specTerm = pow(NdotH, exp2(Smoothness));
                    Specular += (attenColor * specTerm * SColor);
                }
            LIGHT_LOOP_END



        #endif
    #endif
}

void CalculateAdditionalLights_half(half3 PositionWS, half3 reflect, half4 ScreenPosition, float3 SColor, float Smoothness,
    out half3 Diffuse, out half3 Specular)
{
	CalculateAdditionalLights_float(PositionWS, reflect, ScreenPosition, SColor, Smoothness,
        Diffuse, Specular);
}





// Get Additional Lights Simple
// Lighter-weight accumulation:
// - Diffuse: sum of (light.color * NdotL * atten)
// - Color: sum of (light.color * atten)
// - Direction: weighted dominant incoming direction of all additional lights
void GetAdditionalLightsSimple_float(float3 WorldPos, float3 WorldNormal, float4 ScreenPosition, out half3 Diffuse, out half3 Color, out half3 Direction)
{
    #ifdef SHADERGRAPH_PREVIEW
        Direction = normalize(half3(0.5, 0.8, -0.4));
        half NdotL = saturate(dot(WorldNormal, Direction));
        Color = half3(0.4, 0.4, 0.45);
        Diffuse = Color * NdotL;
    #else
        Diffuse = half3(0, 0, 0);
        Color = half3(0, 0, 0);
        Direction = half3(0, 0, 0);

        #if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
            WorldNormal = normalize(WorldNormal);

            InputData inputData = (InputData)0;
            inputData.positionWS = WorldPos;
            inputData.normalizedScreenSpaceUV = GetCustomNormalizedScreenUV(WorldPos, ScreenPosition);

            #if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
                half4 shadowMask = inputData.shadowMask;
            #elif !defined(LIGHTMAP_ON)
                half4 shadowMask = unity_ProbesOcclusion;
            #else
                half4 shadowMask = half4(1.0, 1.0, 1.0, 1.0);
            #endif

            #ifdef _LIGHT_LAYERS
                uint meshRenderingLayers = GetMeshRenderingLayer();
            #endif

            // 1. Clustered Directional Lights
            #if USE_CLUSTER_LIGHT_LOOP
                [loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
                {
                    CLUSTER_LIGHT_LOOP_SUBTRACTIVE_LIGHT_CHECK
                    Light light = GetAdditionalLight(lightIndex, WorldPos, shadowMask);

                    #ifdef _LIGHT_LAYERS
                        if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
                    #endif
                    {
                        half3 attenColor = light.color * (light.distanceAttenuation * light.shadowAttenuation);
                        half NdotL = saturate(dot(WorldNormal, light.direction));
                        Diffuse += attenColor * NdotL;
                        Color += attenColor;
                        Direction += light.direction * max(attenColor.r, max(attenColor.g, attenColor.b));
                    }
                }
            #endif

            // 2. Punctual Lights
            uint pixelLightCount = GetAdditionalLightsCount();
            LIGHT_LOOP_BEGIN(pixelLightCount)
                Light light = GetAdditionalLight(lightIndex, WorldPos, shadowMask);

                #ifdef _LIGHT_LAYERS
                    if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
                #endif
                {
                    half3 attenColor = light.color * (light.distanceAttenuation * light.shadowAttenuation);
                    half NdotL = saturate(dot(WorldNormal, light.direction));
                    Diffuse += attenColor * NdotL;
                    Color += attenColor;
                    Direction += light.direction * max(attenColor.r, max(attenColor.g, attenColor.b));
                }
            LIGHT_LOOP_END

            if (dot(Direction, Direction) > 0.0001)
                Direction = normalize(Direction);
            else
                Direction = half3(0, 1, 0);
        #endif
    #endif
}

void GetAdditionalLightsSimple_half(half3 WorldPos, half3 WorldNormal, half4 ScreenPosition, out half3 Diffuse, out half3 Color, out half3 Direction)
{
    GetAdditionalLightsSimple_float(WorldPos, WorldNormal, ScreenPosition, Diffuse, Color, Direction);
}

// GetAdditionalLightData
// Queries individual additional light data by lightIndex.
// Matches GetMainLightData pattern from MainLightNode.hlsl.
void GetAdditionalLightData_float(float3 WorldPos, int LightIndex, float4 ScreenPosition, out half3 Direction, out half3 Color, out half DistanceAttenuation, out half ShadowAttenuation, out half3 LightPos)
{
    #ifdef SHADERGRAPH_PREVIEW
        Direction = normalize(half3(0.5, 0.8, -0.4));
        Color = half3(1, 1, 1);
        DistanceAttenuation = 1.0;
        ShadowAttenuation = 1.0;
        LightPos = half3(0, 0, 0);
    #else
        Direction = half3(0, 1, 0);
        Color = half3(0, 0, 0);
        DistanceAttenuation = 0.0;
        ShadowAttenuation = 0.0;
        LightPos = half3(0, 0, 0);

        #if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
            InputData inputData = (InputData)0;
            inputData.positionWS = WorldPos;
            inputData.normalizedScreenSpaceUV = GetCustomNormalizedScreenUV(WorldPos, ScreenPosition);

            #if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
                half4 shadowMask = inputData.shadowMask;
            #elif !defined(LIGHTMAP_ON)
                half4 shadowMask = unity_ProbesOcclusion;
            #else
                half4 shadowMask = half4(1.0, 1.0, 1.0, 1.0);
            #endif

            Light light = GetAdditionalLight(uint(LightIndex), WorldPos, shadowMask);
            Direction = light.direction;
            Color = light.color;
            DistanceAttenuation = light.distanceAttenuation;
            ShadowAttenuation = light.shadowAttenuation;
            LightPos = WorldPos + light.direction;
        #endif
    #endif
}

void GetAdditionalLightData_half(half3 WorldPos, int LightIndex, half4 ScreenPosition, out half3 Direction, out half3 Color, out half DistanceAttenuation, out half ShadowAttenuation, out half3 LightPos)
{
    GetAdditionalLightData_float(WorldPos, LightIndex, ScreenPosition, Direction, Color, DistanceAttenuation, ShadowAttenuation, LightPos);
}

// GetAdditionalLightsCount
// Returns the additional light count.
// Note: In Forward+, punctual lights are clustered and GetAdditionalLightsCount()
// returns 0, but directional additional lights count is returned.
void GetAdditionalLightsCount_float(float3 WorldPos, out int Count)
{
    #ifdef SHADERGRAPH_PREVIEW
        Count = 1;
    #else
        #if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
            #if USE_CLUSTER_LIGHT_LOOP
                Count = int(min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS));
            #else
                Count = GetAdditionalLightsCount();
            #endif
        #else
            Count = 0;
        #endif
    #endif
}

void GetAdditionalLightsCount_half(half3 WorldPos, out int Count)
{
    GetAdditionalLightsCount_float(WorldPos, Count);
}

// DebugAdditionalLights
// Raw values of the additional light loop, no specular, no tinting.
// DirectionRGB : light.direction * 0.5 + 0.5 summed over lights (world space)
// Atten        : sum of distanceAttenuation * shadowAttenuation
// NdotL        : sum of saturate(dot(N, L))
// LightCount   : number of lights iterated (visible in the loop)
void DebugAdditionalLights_float(float3 WorldPos, float3 WorldNormal, float4 ScreenPosition, out half3 DirectionRGB, out half Atten, out half NdotL, out half LightCount)
{
    DirectionRGB = half3(0, 0, 0);
    Atten = 0;
    NdotL = 0;
    LightCount = 0;

    #ifndef SHADERGRAPH_PREVIEW
        #if defined(UNIVERSAL_PIPELINE_CORE_INCLUDED)
            WorldNormal = normalize(WorldNormal);

            InputData inputData = (InputData)0;
            inputData.positionWS = WorldPos;
            inputData.normalizedScreenSpaceUV = GetCustomNormalizedScreenUV(WorldPos, ScreenPosition);

            half4 shadowMask = half4(1, 1, 1, 1);

            #if USE_CLUSTER_LIGHT_LOOP
                [loop] for (uint dIndex = 0; dIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); dIndex++)
                {
                    Light dl = GetAdditionalLight(dIndex, WorldPos, shadowMask);
                    DirectionRGB += dl.direction * 0.5 + 0.5;
                    Atten += dl.distanceAttenuation * dl.shadowAttenuation;
                    NdotL += saturate(dot(WorldNormal, dl.direction));
                    LightCount += 1;
                }
            #endif

            uint pixelLightCount = GetAdditionalLightsCount();
            LIGHT_LOOP_BEGIN(pixelLightCount)
                Light light = GetAdditionalLight(lightIndex, WorldPos, shadowMask);
                DirectionRGB += light.direction * 0.5 + 0.5;
                Atten += light.distanceAttenuation * light.shadowAttenuation;
                NdotL += saturate(dot(WorldNormal, light.direction));
                LightCount += 1;
            LIGHT_LOOP_END
        #endif
    #endif
}

void DebugAdditionalLights_half( half3 WorldPos, half3 WorldNormal, half4 ScreenPosition, out half3 DirectionRGB, out half Atten, out half NdotL, out half LightCount)
{
    DebugAdditionalLights_float(WorldPos, WorldNormal, ScreenPosition, DirectionRGB, Atten, NdotL, LightCount);
}

void SimpleReflectionProbes_float( float3 PositionWS, float3 ReflectVector, float2 ScreenPos, float smoothness, float occlusion, out float3 outref)
{
    float3 MainColor = float3(0, 0, 0);
    float3 MainSpecular = float3(0, 0, 0);
    float3 MainDiffuse = float3(0, 0, 0);

    float3 Diffuse = MainDiffuse;
    float3 Specular = MainSpecular;
    float3 Color = MainColor * (MainDiffuse + MainSpecular);

    float Smoothness = smoothness;
    float Occlusion = occlusion;
    float3 WorldPosition = PositionWS;
    float3 WorldNormal = SafeNormalize(ReflectVector);
    float3 WorldView = SafeNormalize(_WorldSpaceCameraPos - WorldPosition);
    float3 ReflectDir = SafeNormalize(ReflectVector);

#ifndef SHADERGRAPH_PREVIEW
    uint pixelLightCount = GetAdditionalLightsCount();
    half Roughness = pow(1 - Smoothness, 2);
    half Roughness2 = Roughness * Roughness;
    half Roughness2Minus1 = Roughness2 - 1;
    half normalizationTerm = (Roughness * half(4.0) + half(2.0));

    InputData inputData = (InputData)0;
    inputData.normalizedScreenSpaceUV = ScreenPos;
    inputData.positionWS = WorldPosition;

    half4 shadowMask = half4(1, 1, 1, 1);

    LIGHT_LOOP_BEGIN(pixelLightCount)
        #if !USE_CLUSTER_LIGHT_LOOP
            lightIndex = GetPerObjectLightIndex(lightIndex);
        #endif
        Light light = GetAdditionalLight(lightIndex, WorldPosition, shadowMask);
        light.shadowAttenuation = AdditionalLightRealtimeShadow(lightIndex, WorldPosition, light.direction);
        
        #if defined(_LIGHT_COOKIES)
            float3 cookieColor = SampleAdditionalLightCookie(lightIndex, PositionWS);
            light.color *= cookieColor;
        #endif
        
        float NdotL = saturate(dot(WorldNormal, light.direction));
        float atten = light.distanceAttenuation * light.shadowAttenuation;
        float thisDiffuse = NdotL * atten;

        float3 lightDirectionWSFloat3 = float3(light.direction);
        float3 halfDir = SafeNormalize(lightDirectionWSFloat3 + WorldView);
        float NoH = saturate(dot(WorldNormal, halfDir));
        half LoH = half(saturate(dot(lightDirectionWSFloat3, halfDir)));
        float d = NoH * NoH * Roughness2Minus1 + 1.00001f;
        half LoH2 = LoH * LoH;
        half spec = Roughness2 / ((d * d) * max(0.1h, LoH2) * normalizationTerm);

        #if REAL_IS_HALF
            spec = spec - HALF_MIN;
            spec = clamp(spec, 0.0, 1000.0);
        #endif
        
        float3 thisSpecular = spec * atten;

        Diffuse += thisDiffuse;
        Specular += thisSpecular;
        Color += light.color * (thisDiffuse + thisSpecular);
    LIGHT_LOOP_END

    float total = Diffuse + dot(Specular, float3(0.333, 0.333, 0.333));
    Color = total <= 0 ? MainColor : Color / total;
#endif
    outref = Color * Occlusion;

}

#endif // LIGHT_NODE_CUSTOM_INCLUDED

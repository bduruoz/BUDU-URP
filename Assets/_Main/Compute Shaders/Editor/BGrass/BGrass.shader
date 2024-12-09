Shader "BUDU Shaders/BGrass"
{
    Properties
    {
        _BaseTexture("Base Texture", 2D) = "white" {}
        _AlphaTexture("Alpha Texture", 2D) = "white" {}
        _BaseColor("Base Color", Color) = (0, 0.5, 0, 1) // Color of the lowest layer
        _TipColor("Tip Color", Color) = (0, 1, 0, 1) // Color of the highest layer
        _RandomJitterRadius("Random Jitter Radius", Float) = 0.1
        _WindTexture("Wind Texture", 2D) = "white" {}
        _WindFrequency("Wind Frequency", Float) = 1
        _WindAmplitude("Wind Amplitude", Float) = 1
        _WindLOD("Wind Texture LOD", Range(0, 8)) = 0
        _Alpha("Alpha",Range(0, 1)) = 1
        //_ShadowLightness("Shadow Lightness", Range(0,1)) = 0
    }
    SubShader
    {
        ZWrite On
        Blend SrcAlpha OneMinusSrcAlpha
        // UniversalPipeline needed to have this render in URP
        Tags { 
            "Queue" = "Transparent" 
            "RenderType" = "Transparent" 
            "RenderPipeline" = "UniversalPipeline" 
            "IgnoreProjector" = "True" }
        LOD 100

        // Forward Lit Pass
        Pass
        {
            Name "ForwardLit"
            Tags{ 
                "LightMode" = "UniversalForward" 
                }

            HLSLPROGRAM
            // Signal this shader requires a compute buffer
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            // Lighting and shadow keywords
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _ADDITIONAL_LIGHTS
            #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
            #pragma multi_compile _ _SHADOWS_SOFT
            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON

            // Register our functions
            #pragma vertex Vertex
            #pragma fragment Fragment

            // Include our logic file
            #include "BGrass.hlsl"

            ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags{ "LightMode" = "ShadowCaster" }

            HLSLPROGRAM
            // Signal this shader requires a compute buffer
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON

            #define SHADOW_CASTER_PASS

            // Register our functions
            #pragma vertex Vertex
            #pragma fragment Fragment

            // Include our logic file
            #include "BGrass.hlsl"

            ENDHLSL
        }

    }
}

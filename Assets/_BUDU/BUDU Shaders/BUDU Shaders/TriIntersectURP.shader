Shader "BUDU/TriIntersectURP"
{
    Properties{ _Color ("Color", Color) = (1,1,1,1) }

    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderPipeline"="UniversalPipeline" "Queue"="Geometry+1" }

        Pass
        {
            Name "Unlit"
            Tags { "LightMode"="UniversalForward" }

            ZWrite On
            ZTest Always          // ← depth test kapalı, her triangle çizilsin
            Cull Off
            ColorMask RGB

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            float4 _Color;
            float4 _QuadPlane;      // world plane (normal.xyz, distance)
            float4 _QuadMin;        // world AABB min
            float4 _QuadMax;        // world AABB max

            struct Attributes { float4 positionOS : POSITION; };
            struct Varyings   { float4 positionHCS : SV_POSITION;
                                float3 worldPos   : TEXCOORD0; };

            Varyings vert (Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.worldPos    = TransformObjectToWorld(IN.positionOS.xyz);
                return OUT;
            }

            half4 frag (Varyings IN) : SV_Target
            {
                // 1) AABB quick reject
                if (any(IN.worldPos < _QuadMin.xyz) || any(IN.worldPos > _QuadMax.xyz)) discard;

                // 2) Plane distance
                float dist = dot(_QuadPlane.xyz, IN.worldPos) - _QuadPlane.w;
                if (abs(dist) > 0.01) discard;          // 1 cm tolerance

                // 3) inside quad
                float3 proj = IN.worldPos - dist * _QuadPlane.xyz;
                if (any(proj < _QuadMin.xyz) || any(proj > _QuadMax.xyz)) discard;

                return _Color;
            }
            ENDHLSL
        }
    }
    FallBack Off
}
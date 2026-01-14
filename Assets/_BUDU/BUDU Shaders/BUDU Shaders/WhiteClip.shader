Shader "BUDU/WhiteClipURP"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderPipeline"="UniversalRenderPipeline" "Queue"="Geometry+1" }
        Pass
        {
            Name "Unlit"
            Tags { "LightMode"="UniversalForward" }

            ZWrite On
            Cull Off

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            float4 _Color;
            float4 _ClipRect;

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
            };

            Varyings vert (Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                return OUT;
            }

            half4 frag (Varyings IN) : SV_Target
            {
                float2 vp = (IN.positionHCS.xy / IN.positionHCS.w + 1) * 0.5;   // -1..1 → 0..1
                if (vp.x < _ClipRect.x || vp.x > _ClipRect.z ||
                    vp.y < _ClipRect.y || vp.y > _ClipRect.w)
                    discard;
                return _Color;
            }
            ENDHLSL
        }
    }
    FallBack Off
}
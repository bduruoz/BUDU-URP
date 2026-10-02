// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

Shader "Hidden/RoomBaker/OrthoDepth01_ViewLinear"
{
    SubShader
    {
        Tags { "Queue"="Geometry" "RenderType"="Opaque" }

        Pass
        {
            ZWrite On
            ZTest LEqual
            Cull Back

            HLSLPROGRAM
            #pragma target 3.0
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float4x4 _RoomBakerVP;
            float4x4 _RoomBakerView;
            float _Near;
            float _Far;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float d01 : TEXCOORD0;
            };

            v2f vert(appdata v)
            {
                v2f o;
                float4 ws = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(_RoomBakerVP, ws);

                float3 vs = mul(_RoomBakerView, ws).xyz;
                float eyeDepth = -vs.z;

                float denom = max(1e-6, (_Far - _Near));
                o.d01 = saturate((eyeDepth - _Near) / denom);

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return fixed4(i.d01, i.d01, i.d01, 1);
            }
            ENDHLSL
        }
    }

    Fallback Off
}

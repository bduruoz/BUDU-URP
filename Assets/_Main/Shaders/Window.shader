  Shader "Unlit/Window"
{
    Properties
    {
        _BaseColor("Base Color", Color) = (1, 1, 1, 1)
        _BaseMap ("Texture", 2D) = "white"
        _Size ("Size", float) = 1
        _T ("Time", float) = 1
        _Distortion ("Distort", float) = 1.0
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalRenderPipeline" "Queue"="AlphaTest+51" }
        //LOD 100

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #define S(a, b, t) smoothstep(a, b, t)


            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"  

            struct Attributes
            {
                float4 positionOS   : POSITION;      
                float2 uv           : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS  : SV_POSITION;
                float2 uv           : TEXCOORD0;
            };            

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);

            CBUFFER_START(UnityPerMaterial)
                float4 _BaseMap_ST;
                float4 _BaseColor;   
                float _Size, _T;
                float _Distortion;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;

                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

                return OUT;
            }

            float N21(float2 p)
            {
                p = frac(p * float2(123.34, 245.45));
                p += dot(p, p + 34.345);

                return frac(p.x * p.y);
            }

            half4 frag(Varyings IN) : SV_Target
            {
                float t = _Time.y;//fmod(_Time.y + _T, 7200);
                float4 col = 0;

                float2 aspect = float2(2,1);
                float2 uv = IN.uv * _Size * aspect; 
                uv.y += t * 0.25;

                float2 gv = frac(uv) - 0.5;
                
                float2 id = floor(uv);

                float n = N21(id);
                t += (n * 6.2831);

                float w = IN.uv.y * 10;
                float x = (n - 0.5) * 0.8;
                x +=  (0.4 - abs(x)) * 
                        sin(3 * w) * pow(sin(w), 6) * 0.45;

                float y = -sin(t + sin(t + sin(t) * 0.5)) * 0.45;
                y -= (gv.x - x) * (gv.x - x);

                float2 dropPos = (gv - float2(x, y)) / aspect;
                float drop =  S(0.04, 0.03, length(dropPos));

                float2 trailPos = (gv - float2(x, t * 0.25)) / aspect;
                trailPos.y = (frac(trailPos.y * 8)-0.5)/8; 
                float trail =  S(0.03, 0.01, length(trailPos));
                
                float fogTrail = S(-0.05,0.05, dropPos.y);
                fogTrail *= S(0.5, y, gv.y);
                
                trail *= fogTrail;

                fogTrail *= S(0.05, 0.04, abs(dropPos.x));

                //trail *= S(-0.05, 0.05, dropPos.y);
                //trail *= S(0.5, y, gv.y);


                col += fogTrail * 0.5;
                col += trail;
                col += drop;
                
                float2 offs = drop * dropPos + 
                        trail * trailPos;// +(fogTrail * 0.01);

                //if(gv.x > 0.48 || gv.y > 0.49) col = float4(1,0,0,1);

                //col *= 0; col += N21(id);
                //col = N21(IN.uv);
                col = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv + offs * _Distortion);

                return col;
            }
            ENDHLSL
        }
    }
}

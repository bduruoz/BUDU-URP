  Shader "Unlit/Window"
{
    Properties
    {
        _BaseColor("Base Color", Color) = (1, 1, 1, 1)
        _Picture ("Picture Toggle", integer) = 0
        _BaseMap ("Texture", 2D) = "white" {}
        _LayerN ("Number Of Layer", range(1,8)) = 4
        _Size ("Size", float) = 4
        _T ("Time", float) = 1
        _RainSpeed ("Rain Speed", range(0,3)) = 1
        _Darken ("Darken", range(0.2, 1.5)) = 1.0
        _CurlSize ("Curl Size", range(0,2)) = 0.1
        _Distortion ("Distort", float) = -5.0
        _Blur ("Blur", range(0,1.5)) = 0.0
        _BlurSamples ("Blur Samples", range(1,64)) = 8
        _Vapor ("Vapor", range(-5,5)) = 0
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "Queue"="Transparent" "RenderPipeline" = "UniversalRenderPipeline" "Queue"="AlphaTest+51" }
        LOD 100

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
                float2 grabuv       : TEXCOORD1;
            };            

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);
            TEXTURE2D(_GrabbedTexture);
            SAMPLER(sampler_GrabbedTexture);

            CBUFFER_START(UnityPerMaterial)
                int _Picture, _BlurSamples;
                float4 _BaseMap_ST;
                float4 _BaseColor;   
                float _Size, _T;
                float _Distortion;
                float _Blur, _Vapor, _CurlSize, _RainSpeed, _Darken, _LayerN;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;

                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

                float3 positionW = TransformObjectToWorld(IN.positionOS);

                half4 scrPos = mul(UNITY_MATRIX_MV, half4(positionW, 1));

                OUT.grabuv = (float2(-scrPos.x, -scrPos.y) / scrPos.z) + 0.5;

                return OUT;
            }

            float N21(float2 p)
            {
                p = frac(p * float2(123.34, 245.45));
                p += dot(p, p + 34.345);

                return frac(p.x * p.y);
            }

            float3 Layer(float2 UV, float t)
            {
                float2 aspect = float2(2,1);
                float2 uv = UV * _Size * aspect; 
                uv.y += t * 0.25;

                float2 gv = frac(uv) - 0.5;
                
                float2 id = floor(uv);

                float n = N21(id);
                t += (n * 6.2831);

                float curl = (saturate(n * N21(id)) +1) * 10;
                curl *= _CurlSize;

                float w = UV.y * curl;
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

                float2 offs = drop * dropPos + trail * trailPos;

                return float3(offs, fogTrail);
            }

            half4 frag(Varyings IN) : SV_Target
            {
                float t = fmod(_Time.y + _T, 7200) * _RainSpeed;
                float4 col = 0;

                float3 drops = Layer(IN.uv, t);
                
                if(_LayerN > 1) drops += Layer(IN.uv * 1.23 + 7.54, t);
                if(_LayerN > 2) drops += Layer(IN.uv * 1.35 + 3.74, t);
                if(_LayerN > 3) drops += Layer(IN.uv * 1.57 - 5.12, t);
                if(_LayerN > 4) drops += Layer(IN.uv * 1.15 - 9.12, t);
                if(_LayerN > 5) drops += Layer(IN.uv * 1.83 - 21.34, t);
                if(_LayerN > 6) drops += Layer(IN.uv * 1.17 - 15.72, t);
                if(_LayerN > 7) drops += Layer(IN.uv * 1.63 - 11.2, t);

                float fade = 1-saturate(fwidth(IN.uv) * 60);

                float blur = _Blur * 7 * (1 - drops.z * fade);

                float2 picUV = IN.uv;
                float2 projUV = IN.grabuv;

                picUV = IN.uv + drops.xy * _Distortion * fade;
                projUV += drops.xy * _Distortion * fade;

                const float numSamples = _BlurSamples;
                float a = N21(IN.uv) * 6.2831;
                blur *= 0.01;
                for(float i = 0; i < numSamples; i++)
                {
                    float2 offs = float2(sin(a), cos(a)) * blur;
                    float d = frac(sin((i+1)*546.)*5424.);
                    d = sqrt(d);
                    offs *= d;

                    if(_Picture > 0)
                    {
                        col += SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, picUV + offs);
                    }
                    else
                    {
                        col += SAMPLE_TEXTURE2D(_GrabbedTexture, sampler_GrabbedTexture, projUV + offs);
                    }
                    a++;
                }
                
                col /= numSamples;
                
                float vap = 0;
                if(_Picture > 0)
                {
                    vap = _Vapor * 0.01;
                }
                else
                {
                    vap = (col * _Vapor);
                }
                col += vap - (drops.z * (vap/2));

                col *= _BaseColor;

                return col * _Darken ;
            }
            ENDHLSL
        }
    }
}

Shader "Unlit/Raymarch"
{
    Properties
    {
        _BaseMap("Texture", 2D) = "white"
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalRenderPipeline" "Queue"="AlphaTest+51"}
        
        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"  
            
            #define MAX_STEPS 100
            #define MAX_DIST 100
            #define SURF_DIST 1e-3

            struct Attributes
            {
                float4 positionOS   : POSITION;      
                float2 uv           : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS  : SV_POSITION;
                float2 uv           : TEXCOORD0;
                float3 ro           : TEXCOORD1;
                float3 hitPos       : TEXCOORD2;
            };            

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);

            CBUFFER_START(UnityPerMaterial)
                float4 _BaseMap_ST;            
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);
                
                //OUT.ro = _WorldSpaceCameraPos; // World Space
                //OUT.hitPos = mul(unity_ObjectToWorld, IN.positionOS); // World Space

                OUT.ro = mul(unity_WorldToObject, float4(_WorldSpaceCameraPos,1)); // Object Space
                OUT.hitPos = IN.positionOS; // Object Space
                
                return OUT;
            }

            float SDCapsule(float3 p, float3 a, float3 b, float r){
                float3 ab = b-a;
                float3 ap = p-a;

                float t = dot(ab, ap) / dot(ab, ab);
                t = clamp(t, 0., 1.);

                float3 c = a + t * ab;

                float d = length(p - c) - r;
                return d;
            }

            float SDCylinder(float3 p, float3 a, float3 b, float r){
                float3 ab = b-a;
                float3 ap = p-a;

                float t = dot(ab, ap) / dot(ab, ab);
                //t = clamp(t, 0., 1.);

                float3 c = a + t * ab;

                float x = length(p - c) - r;
                float y = (abs(t-0.5)-0.5)*length(ab);
                float e = length(max(float2(x,y),0.0));
                float i = min(max(x,y),0);

                float d = e+i;

                return d;
            }

            float SDTorus(float3 p, float2 r){
                float x = length(p.xz) - r.x;
                float d = length(float2(x, p.y)) - r.y;
                return d;
            }

            float SDBox(float3 p, float3 s){
                return length(max(abs(p)-s, 0.0));
            }

            float SDSphere(float3 p, float r){
                return length(p) - r;
            }

            // Shape Formulas
            float GetDist(float3 p) {
                // Sphere
                float d = SDSphere(p + float3(-.2,-.2,.3), 0.1);

                // Torus
                float tr = SDTorus(p,float2(0.3, 0.05));

                // Capsule
                float3 a = float3(0,0.3,0);
                float3 b = float3(0,-0.3,0);
                float r = 0.2;
                float cp = SDCapsule(p, a, b, r);

                // Cylider
                float3 cya = float3(-0.1,0.2,0.2);
                float3 cyb = float3(0.1,-0.2,0.2);
                float cyr = 0.12;
                float cy = SDCylinder(p, cya, cyb, cyr);

                // Box
                float bx = SDBox(p - float3(-0.2,0.2,.3), float3(0.2,0.2,0.2));

                //d = min(d, sp);
                d = min(d, tr);
                d = min(d, cp);
                d = min(d, bx);
                d = min(d, cy);

                //d = length(float3(length(p.x) - .5, p.y , p.z)) - .1; // ivir zivir

                return d;
            }

            float Raymarch(float3 ro, float3 rd) {
                float dO = 0;
                float dS;
                for(int i = 0; i < MAX_STEPS; i++)
                {
                    float3 p = ro + dO * rd;
                    dS = GetDist(p);
                    dO += dS;
                    if(dS < SURF_DIST || dO > MAX_DIST) break;
                }
                return dO;
            }

            float3 GetNormal(float3 p) {
                float2 e = float2(1e-2, 0);
                float3 n = GetDist(p) - float3(
                    GetDist(p-e.xyy),
                    GetDist(p-e.yxy),
                    GetDist(p-e.yyx)
                    );
                return normalize(n);
            }

            half4 frag(Varyings IN) : SV_Target
            {
                float2 uv = IN.uv - .5;
                float3 ro = IN.ro;// float3(0, 0, -3);
                float3 rd = normalize(IN.hitPos - ro);// normalize(float3(uv.x, uv.y, 1));
                
                float d = Raymarch(ro, rd);
                half4 tex = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv);
                half4 col = 0;

                float m = dot(uv, uv);

                if(d < MAX_DIST)
                {
                    float3 p = ro + rd * d;
                    float3 n = GetNormal(p);
                    col.rgb = n;
                } 
                //else
                //    discard;
                
                col = lerp(col, tex, smoothstep(.1,.2,m));
                return col;
            }
            ENDHLSL
        }
    }
}

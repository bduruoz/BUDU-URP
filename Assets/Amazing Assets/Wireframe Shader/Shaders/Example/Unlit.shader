// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>
 
Shader "Amazing Assets/Wireframe Shader/Example/Unlit"
{
    Properties
    {
        _WireframeShader_Thickness("Thickness", Range(0, 1)) = 0
		_WireframeShader_Smoothness("Smoothness", Range(0, 1)) = 0	
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            //Path to the Wireframe cginc
            #include "Assets/Amazing Assets/Wireframe Shader/Shaders/cginc/WireframeShader.cginc"   


            float _WireframeShader_Thickness;
            float _WireframeShader_Smoothness;


            struct appdata
            {
                float4 vertex : POSITION;

                //Wireframe data is saved inside uv4 buffer (note, in shaders uv4 is read using TEXCOORD3)
                float4 uv3 : TEXCOORD3;
            };

            struct v2f
            {                
                float4 vertex : SV_POSITION;
                float3 uv3 : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);

                //Sending uv3 data from vertex to pixel stage
                o.uv3 = v.uv3.xyz;

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                //Reading wireframe data from uv
                float wireframe = WireframeShaderReadTriangleMassFromUV(i.uv3, _WireframeShader_Thickness, _WireframeShader_Smoothness);


                return wireframe;
            }
            ENDCG
        }
    }
}

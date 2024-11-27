// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>
 
Shader "Amazing Assets/Wireframe Shader/Example/Unlit (Mask)"
{
    Properties
    {
        _WireframeShader_Thickness("Thickness", Range(0, 1)) = 0
		_WireframeShader_Smoothness("Smoothness", Range(0, 1)) = 0	

        [KeywordEnum(None, Plane, Sphere, Box)] _MASK ("Mask", Float) = 0

        _Wireframe_DynamicMaskEdgeSmooth("Edge Smooth", float) = 0
        [Toggle]_Wireframe_DynamicMaskInvert("Invert", float) = 0
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

            #pragma shader_feature_local _MASK_NONE _MASK_PLANE _MASK_SPHERE _MASK_BOX



            float _WireframeShader_Thickness;
            float _WireframeShader_Smoothness;

            float _Wireframe_DynamicMaskEdgeSmooth;
            float _Wireframe_DynamicMaskInvert;


            //Mask properties updated from script
            float3   _WireframeShaderMaskPlanePosition;
            float3   _WireframeShaderMaskPlaneNormal;
            float3   _WireframeShaderMaskSpherePosition;
            float    _WireframeShaderMaskSphereRadius;
            float4x4 _WireframeShaderMaskBoxMatrixTRS;
            float3   _WireframeShaderMaskBoxBoundingBox;



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
                float3 positionWS : TEXCOORD1;
            };
             
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);

                //Sending uv3 data from vertex to pixel stage
                o.uv3 = v.uv3.xyz;

                o.positionWS = mul(unity_ObjectToWorld, v.vertex).xyz;

                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                //Reading wireframe data from uv3
                float wireframe = WireframeShaderReadTriangleMassFromUV(i.uv3, _WireframeShader_Thickness, _WireframeShader_Smoothness);


                //Mask
                float mask = 1;
                #if defined(_MASK_PLANE)
                    mask = WireframeShaderMaskPlane(_WireframeShaderMaskPlanePosition, _WireframeShaderMaskPlaneNormal, i.positionWS,_Wireframe_DynamicMaskEdgeSmooth, _Wireframe_DynamicMaskInvert);
                #elif defined(_MASK_SPHERE)
                    mask = WireframeShaderMaskSphere(_WireframeShaderMaskSpherePosition, _WireframeShaderMaskSphereRadius, i.positionWS, _Wireframe_DynamicMaskEdgeSmooth, _Wireframe_DynamicMaskInvert);
                #elif defined(_MASK_BOX)
                    mask = WireframeShaderMaskBox(_WireframeShaderMaskBoxMatrixTRS, _WireframeShaderMaskBoxBoundingBox, i.positionWS, _Wireframe_DynamicMaskEdgeSmooth, _Wireframe_DynamicMaskInvert);
                #endif


                return wireframe * mask;
            }
            ENDCG
        }
    }
}

// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/Particles/BLitParticle"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Header(INDIRECT SPECULAR)][Space(5)]_IndirectSpecularColor("Indirect Specular Color", Color) = (1,0.9568627,0.8392157,0)
		_IndirectSpecularSmoothness("Indirect Specular Smoothness", Range( 0 , 1)) = 0.25
		[Header(INDIRECT DIFFUSE)][Space(5)]_IndirectDiffuse("Indirect Diffuse", Range( 0 , 1)) = 0.85
		[Header(SHADOWS)]_ShadowStrength("Shadow Strength", Range( 0 , 1)) = 0.85
		_ShadowSharpness("Shadow Sharpness", Range( 0.01 , 1)) = 0.7
		_ShadowOffset("Shadow Offset", Range( 0 , 1)) = 0.5
		[ToggleUI]_ShadowColorEnable("Enable Shadow Color", Float) = 0
		[HDR]_ShadowColor("Shadow Color", Color) = (0.3113208,0.3113208,0.3113208,0)
		_AlphaClipThreshold("AlphaClipThreshold", Range( 0 , 1)) = 0
		[ToggleOff(_RECEIVE_SHADOWS_OFF)] _ReceiveShadows("ReceiveShadows", Float) = 0
		_ParticleTileY("Particle Tile Y", Float) = 1
		_NormOffsetX("Norm Offset X", Float) = 0
		_MaskOffsetX("Mask Offset X", Float) = 0
		_VorOffsetX("Vor Offset X", Float) = 0
		_ParticleOffsetX("Particle Offset X", Float) = 0
		_ParticleTileX("Particle Tile X", Float) = 1
		_VorTileX("Vor Tile X", Float) = 1
		_MaskTileX("Mask Tile X", Float) = 1
		_NormTileX("Norm Tile X", Float) = 1
		_VorTileY("Vor Tile Y", Float) = 1
		_MaskTileY("Mask Tile Y", Float) = 1
		_NormTileY("Norm Tile Y", Float) = 1
		_ParticleOffsetY("Particle Offset Y", Float) = 0
		_NormOffsetY("Norm Offset Y", Float) = 0
		_MaskOffsetY("Mask Offset Y", Float) = 0
		_VorOffsetY("Vor Offset Y", Float) = 0
		_VorSpeedX("Vor Speed X", Float) = 0
		_MaskSpeedX("Mask Speed X", Float) = 0
		_NormSpeedX("Norm Speed X", Float) = 0
		_ParticleSpeedX("Particle Speed X", Float) = 0
		_ParticleSpeedY("Particle Speed Y", Float) = 0
		_VorSpeedY("Vor Speed Y", Float) = 0
		_NormSpeedY("Norm Speed Y", Float) = 0
		_MaskSpeedY("Mask Speed Y", Float) = 0
		_ParticleOverallSpeed("Particle Overall Speed", Float) = 0
		_VorOverallSpeed("Vor Overall Speed", Float) = 0
		_NormOverallSpeed("Norm Overall Speed", Float) = 0
		_MaskOverallSpeed("Mask Overall Speed", Float) = 0
		_ParticleRotate("Particle Rotate", Range( -360 , 360)) = 0
		_MaskRotate("Mask Rotate", Range( -360 , 360)) = 0
		_NormRotate("Norm Rotate", Range( -360 , 360)) = 0
		_VorRotate("Vor Rotate", Range( -360 , 360)) = 0
		_VoronoiScale("Voronoi Scale", Float) = 4
		_VorAnchorX("Vor Anchor X", Float) = 0
		_NormAnchorX("Norm Anchor X", Float) = 0
		_MaskAnchorX("Mask Anchor X", Float) = 0
		_ParticleAnchorX("Particle Anchor X", Float) = 0
		_VorRotateSpeed("Vor Rotate Speed", Float) = 0
		_NormRotateSpeed("Norm Rotate Speed", Float) = 0
		_MaskRotateSpeed("Mask Rotate Speed", Float) = 0
		_SurfaceIntensity("Surface Intensity", Range( 0 , 10)) = 0.3
		_ParticleAnchorY("Particle Anchor Y", Float) = 0
		_VorAnchorY("Vor Anchor Y", Float) = 0
		_NormAnchorY("Norm Anchor Y", Float) = 0
		_MaskAnchorY("Mask Anchor Y", Float) = 0
		_ClampValue("ClampValue", Range( 0.1 , 1)) = 0.1
		[NoScaleOffset]_MaskNoiseMap("MaskNoiseMap", 2D) = "white" {}
		_VoronoiSmooth("Voronoi Smooth", Range( 0 , 0.5)) = 0
		_DeformIntensity("Deform Intensity", Range( -2 , 2)) = 0.1
		_VoronoiAngle("Voronoi Angle", Float) = 0
		_AlphaClipThresholdShadow("AlphaClipThresholdShadow", Range( 0 , 1)) = 0.01
		_AlphaNoiseWeight("Alpha Noise Weight", Range( 0 , 1)) = 0
		_AlphaExponential("Alpha Exponential", Range( 0 , 4)) = 1
		[KeywordEnum(Dot,Add,Divide,Distance,DistanceSubtract)] _MaskMethod("MaskMethod", Float) = 0
		_AlphaIntensity("AlphaIntensity", Range( 0 , 2)) = 0
		_ParticleTextureIntensity("ParticleTexture Intensity", Range( 0 , 10)) = 0
		_AreaScale("AreaScale", Range( 0 , 10)) = 0
		_AreaOffset("AreaOffset", Range( 0 , 1)) = 0
		_DarkAreaColor("Dark Area Color", Color) = (0.3,0.3,0.3)
		_DarkArea("Dark Area", Range( 0 , 1)) = 0.1
		_NormalScale("Normal Scale", Range( -10 , 10)) = 1
		[Toggle]_IndirectToggle("IndirectToggle", Float) = 0
		[Toggle]_NormalToggle("NormalToggle", Float) = 0
		[Enum(Alpha Blend,0,Premultiply,1,Additive,2,Soft Additive,3,Particle Additive,4)]_BlendingOps("Blending Ops", Int) = 0
		_SrcBlend("SrcBlend", Int) = 2
		_DstBlend("DstBlend", Int) = 0
		_ParticleRotateSpeed("Particle Rotate Speed", Float) = 0
		[NoScaleOffset]_NormalMap("Normal Map", 2D) = "bump" {}
		[Toggle(_CUSTOMALPHA_ON)] _CustomAlpha("CustomAlpha", Float) = 0
		[Toggle(_CUSTOMALPHADEBUG_ON)] _CustomAlphaDebug("CustomAlphaDebug", Float) = 0
		[Toggle]_NoiseDeformToggle("NoiseDeformToggle", Float) = 0
		[HDR]_ParticleColor("Particle Color", Color) = (0.5,0.5,0.5,1)
		[NoScaleOffset]_ParticleTexture("Particle Texture", 2D) = "white" {}
		[KeywordEnum(Exp3,Exp2,Exp,Normal,Sqrt,Sqrt2)] _CircleType("CircleType", Float) = 0
		[HideInInspector][IntRange]_aboutFold("aboutFold", Float) = 0
		[HideInInspector][IntRange]_prtTxtFold("prtTxtFold", Float) = 0
		[HideInInspector][IntRange]_vorTxtFold("vorTxtFold", Float) = 0
		[HideInInspector][IntRange]_mskTxtFold("mskTxtFold", Float) = 0
		[HideInInspector][IntRange]_nrmTxtFold("nrmTxtFold", Float) = 0
		[HideInInspector][IntRange]_CheckDef("CheckDef", Float) = 0
		[HideInInspector][IntRange]_CheckBase("CheckBase", Float) = 0
		[HideInInspector][IntRange]_CheckInd("CheckInd", Float) = 0
		[HideInInspector][IntRange]_CheckShd("CheckShd", Float) = 0


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		// Blending
		[Enum(UnityEngine.Rendering.BlendMode)]_SrcBlend("Src Blend", Float) = 1.0
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Dst Blend", Float) = 0.0
		_ZWrite("ZWrite", Float) = 1.0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Off
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend [_SrcBlend] [_DstBlend], SrcAlpha OneMinusSrcAlpha
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGB

			

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _FORWARD_PLUS


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;
			sampler2D _NormalMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			
			half4 CalculateShadowMask1_g55( half2 LightmapUV )
			{
				#if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)
				return SAMPLE_SHADOWMASK( LightmapUV.xy );
				#elif !defined (LIGHTMAP_ON)
				return unity_ProbesOcclusion;
				#else
				return half4( 1, 1, 1, 1 );
				#endif
			}
			
			float3 AdditionalLightsHalfLambertMask14x( float3 WorldPosition, float2 ScreenUV, float3 WorldNormal, float4 ShadowMask )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					#define SUM_LIGHTHALFLAMBERT(Light)\
						half3 AttLightColor = Light.color * ( Light.distanceAttenuation * Light.shadowAttenuation );\
						Color += ( dot( Light.direction, WorldNormal ) * 0.5 + 0.5 )* AttLightColor;
					InputData inputData = (InputData)0;
					inputData.normalizedScreenSpaceUV = ScreenUV;
					inputData.positionWS = WorldPosition;
					uint meshRenderingLayers = GetMeshRenderingLayer();
					uint pixelLightCount = GetAdditionalLightsCount();	
					#if USE_FORWARD_PLUS
					for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
					{
						FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTHALFLAMBERT( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition, ShadowMask);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTHALFLAMBERT( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			float3 ASEBakedGI( float3 normalWS, float2 uvStaticLightmap, bool applyScaling )
			{
			#ifdef LIGHTMAP_ON
				if( applyScaling )
					uvStaticLightmap = uvStaticLightmap * unity_LightmapST.xy + unity_LightmapST.zw;
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 AdditionalLightsSpecular14x( float3 WorldPosition, float2 ScreenUV, float3 WorldNormal, float3 WorldView, float3 SpecColor, float Smoothness )
			{
				float3 Color = 0;
				#if defined(_ADDITIONAL_LIGHTS)
					Smoothness = exp2(10 * Smoothness + 1);
					
					#define SUM_LIGHTSPECULAR(Light)\
						half3 AttLightColor = light.color * ( light.distanceAttenuation * light.shadowAttenuation );\
						Color += LightingSpecular( AttLightColor, light.direction, WorldNormal, WorldView, half4( SpecColor, 0 ), Smoothness );	
					InputData inputData = (InputData)0;
					inputData.normalizedScreenSpaceUV = ScreenUV;
					inputData.positionWS = WorldPosition;
					uint meshRenderingLayers = GetMeshRenderingLayer();		
					uint pixelLightCount = GetAdditionalLightsCount();	
					#if USE_FORWARD_PLUS
					for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
					{
						FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTSPECULAR( light );
						}
					}
					#endif
					LIGHT_LOOP_BEGIN( pixelLightCount )
						Light light = GetAdditionalLight(lightIndex, WorldPosition);
						#ifdef _LIGHT_LAYERS
						if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
						#endif
						{
							SUM_LIGHTSPECULAR( light );
						}
					LIGHT_LOOP_END
				#endif
				return Color;
			}
			
			float3 GetMainLightColorNode1402_g53( out float3 Color )
			{
				Light light = GetMainLight();
				return Color = light.color;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				
				o.ase_texcoord3.xyz = v.ase_texcoord.xyz;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				o.ase_texcoord8.xy = v.ase_texcoord1.xy;
				o.ase_texcoord8.zw = v.ase_texcoord2.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif

				o.positionCS = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord3.xyz.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float3 RF_DarkArea184 = saturate( ( _DarkArea * _DarkAreaColor ) );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 RF_LightArea185 = saturate( ( ase_lightAtten * ase_lightColor ) );
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord3.xyz.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float2 RF_CircleUV172 = texCoord27;
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord3.xyz.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord3.xyz.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float3 appendResult28 = (float3(RF_CircleUV172 , RF_CircleRender274.x));
				float3 RF__NoiseCircle178 = appendResult28;
				float3 worldToViewDir33 = normalize( mul( UNITY_MATRIX_V, float4( SafeNormalize(_MainLightPosition.xyz), 0 ) ).xyz );
				float dotResult25 = dot( ( float4( RF__NoiseCircle178 , 0.0 ) * RF_CircleRender274 * float4( IN.ase_texcoord3.xyz , 0.0 ) * _SurfaceIntensity ) , float4( worldToViewDir33 , 0.0 ) );
				float RF_AreaBlend186 = saturate( dotResult25 );
				float4 lerpResult53 = lerp( float4( RF_DarkArea184 , 0.0 ) , RF_LightArea185 , RF_AreaBlend186);
				float4 temp_output_412_0 = (( lerpResult53 * IN.ase_color )*_AreaScale + _AreaOffset);
				float2 temp_output_1_0_g52 = float2( 0,0 );
				float dotResult4_g52 = dot( temp_output_1_0_g52 , temp_output_1_0_g52 );
				float3 appendResult10_g52 = (float3((temp_output_1_0_g52).x , (temp_output_1_0_g52).y , sqrt( ( 1.0 - saturate( dotResult4_g52 ) ) )));
				float3 normalizeResult12_g52 = normalize( appendResult10_g52 );
				float2 appendResult39_g51 = (float2(_NormTileX , _NormTileY));
				float temp_output_53_0_g51 = _NormOverallSpeed;
				float mulTime27_g51 = _TimeParameters.x * ( _NormSpeedX * temp_output_53_0_g51 );
				float mulTime28_g51 = _TimeParameters.x * ( _NormSpeedY * temp_output_53_0_g51 );
				float2 appendResult34_g51 = (float2(( _NormOffsetX + mulTime27_g51 ) , ( mulTime28_g51 + _NormOffsetY )));
				float2 texCoord37_g51 = IN.ase_texcoord3.xyz.xy * appendResult39_g51 + appendResult34_g51;
				float2 appendResult36_g51 = (float2(_NormAnchorX , _NormAnchorY));
				float mulTime29_g51 = _TimeParameters.x * _NormRotateSpeed;
				float cos38_g51 = cos( ( radians( mulTime29_g51 ) + radians( _NormRotate ) ) );
				float sin38_g51 = sin( ( radians( mulTime29_g51 ) + radians( _NormRotate ) ) );
				float2 rotator38_g51 = mul( texCoord37_g51 - appendResult36_g51 , float2x2( cos38_g51 , -sin38_g51 , sin38_g51 , cos38_g51 )) + appendResult36_g51;
				float2 RF_NormalUV436 = rotator38_g51;
				float3 unpack143 = UnpackNormalScale( tex2D( _NormalMap, RF_NormalUV436 ), _NormalScale );
				unpack143.z = lerp( 1, unpack143.z, saturate(_NormalScale) );
				float3 RF_NormalMap190 = (( _NormalToggle )?( unpack143 ):( normalizeResult12_g52 ));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal464 = IN.ase_normal;
				float3 worldNormal464 = float3(dot(tanToWorld0,tanNormal464), dot(tanToWorld1,tanNormal464), dot(tanToWorld2,tanNormal464));
				float dotResult463 = dot( RF_NormalMap190 , worldNormal464 );
				float3 worldPosValue184_g58 = WorldPosition;
				float3 WorldPosition152_g58 = worldPosValue184_g58;
				float4 screenPos = IN.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenUV183_g58 = (ase_screenPosNorm).xy;
				float2 ScreenUV152_g58 = ScreenUV183_g58;
				float3 temp_output_975_0_g53 = RF_NormalMap190;
				float3 Normal1069_g53 = temp_output_975_0_g53;
				float3 tanNormal12_g58 = Normal1069_g53;
				float3 worldNormal12_g58 = normalize( float3(dot(tanToWorld0,tanNormal12_g58), dot(tanToWorld1,tanNormal12_g58), dot(tanToWorld2,tanNormal12_g58)) );
				float3 worldNormalValue185_g58 = worldNormal12_g58;
				float3 WorldNormal152_g58 = worldNormalValue185_g58;
				float2 temp_output_1390_0_g53 = (IN.ase_texcoord8.xy*(unity_LightmapST).xy + (unity_LightmapST).zw);
				half2 LightmapUV1_g55 = temp_output_1390_0_g53;
				half4 localCalculateShadowMask1_g55 = CalculateShadowMask1_g55( LightmapUV1_g55 );
				float4 shadowMaskValue182_g58 = localCalculateShadowMask1_g55;
				float4 ShadowMask152_g58 = shadowMaskValue182_g58;
				float3 localAdditionalLightsHalfLambertMask14x152_g58 = AdditionalLightsHalfLambertMask14x( WorldPosition152_g58 , ScreenUV152_g58 , WorldNormal152_g58 , ShadowMask152_g58 );
				float3 tanNormal1432_g53 = Normal1069_g53;
				float3 worldNormal1432_g53 = float3(dot(tanToWorld0,tanNormal1432_g53), dot(tanToWorld1,tanNormal1432_g53), dot(tanToWorld2,tanNormal1432_g53));
				float3 bakedGI1252_g53 = ASEBakedGI( worldNormal1432_g53, temp_output_1390_0_g53, true);
				float3 Indirect_Diffuse1422_g53 = ( ( localAdditionalLightsHalfLambertMask14x152_g58 + bakedGI1252_g53 ) * _IndirectDiffuse );
				float3 tanNormal1072_g53 = temp_output_975_0_g53;
				float3 worldNormal1072_g53 = normalize( float3(dot(tanToWorld0,tanNormal1072_g53), dot(tanToWorld1,tanNormal1072_g53), dot(tanToWorld2,tanNormal1072_g53)) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult1044_g53 = ASESafeNormalize( ( ase_worldViewDir + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult1046_g53 = dot( worldNormal1072_g53 , normalizeResult1044_g53 );
				float temp_output_1453_0_g53 = max( dotResult1046_g53 , 0.0 );
				float Dot_NdotH1098_g53 = temp_output_1453_0_g53;
				float temp_output_1108_0_g53 = ( 1.0 - ( ( 1.0 - Dot_NdotH1098_g53 ) * _MainLightPosition.w ) );
				float LightColorIntensity1349_g53 = max( ase_lightColor.a , 0.0 );
				float3 temp_output_1112_0_g53 = ( Indirect_Diffuse1422_g53 * temp_output_1108_0_g53 * LightColorIntensity1349_g53 );
				float dotResult1055_g53 = dot( worldNormal1072_g53 , SafeNormalize(_MainLightPosition.xyz) );
				float temp_output_1455_0_g53 = max( dotResult1055_g53 , 0.0 );
				float Dot_NdotL1100_g53 = temp_output_1455_0_g53;
				float dotResult1048_g53 = dot( worldNormal1072_g53 , ase_worldViewDir );
				float temp_output_1454_0_g53 = max( dotResult1048_g53 , 0.0 );
				float Dot_NdotV1099_g53 = temp_output_1454_0_g53;
				float Shadow_Strength1138_g53 = _ShadowStrength;
				float temp_output_1132_0_g53 = ( Shadow_Strength1138_g53 * Shadow_Strength1138_g53 * 0.7978846 );
				float temp_output_1312_0_g53 = ( ( Dot_NdotV1099_g53 * temp_output_1132_0_g53 ) + ( 1.0 - temp_output_1132_0_g53 ) );
				float temp_output_1117_0_g53 = saturate( ( ( ( Dot_NdotL1100_g53 * temp_output_1312_0_g53 * temp_output_1312_0_g53 ) + _ShadowOffset ) / _ShadowSharpness ) );
				float Shadow_1438_g53 = temp_output_1117_0_g53;
				float lerpResult1109_g53 = lerp( ( Shadow_1438_g53 * Dot_NdotH1098_g53 ) , temp_output_1108_0_g53 , _ShadowStrength);
				float3 temp_output_898_0_g53 = temp_output_412_0.rgb;
				float3 temp_output_1210_0_g53 = saturate( ( ( temp_output_1112_0_g53 + lerpResult1109_g53 ) * temp_output_898_0_g53 ) );
				float3 worldPosValue184_g54 = WorldPosition;
				float3 WorldPosition158_g54 = worldPosValue184_g54;
				float2 ScreenUV183_g54 = (ase_screenPosNorm).xy;
				float2 ScreenUV158_g54 = ScreenUV183_g54;
				float3 tanNormal1260_g53 = Normal1069_g53;
				float3 worldNormal1260_g53 = normalize( float3(dot(tanToWorld0,tanNormal1260_g53), dot(tanToWorld1,tanNormal1260_g53), dot(tanToWorld2,tanNormal1260_g53)) );
				float3 worldNormalValue185_g54 = worldNormal1260_g53;
				float3 WorldNormal158_g54 = worldNormalValue185_g54;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 View_Dir1397_g53 = ase_worldViewDir;
				float3 temp_output_15_0_g54 = View_Dir1397_g53;
				float3 WorldView158_g54 = temp_output_15_0_g54;
				float3 temp_output_1196_0_g53 = (_IndirectSpecularColor).rgb;
				float3 temp_output_14_0_g54 = temp_output_1196_0_g53;
				float3 SpecColor158_g54 = temp_output_14_0_g54;
				float temp_output_18_0_g54 = _IndirectSpecularSmoothness;
				float Smoothness158_g54 = temp_output_18_0_g54;
				float3 localAdditionalLightsSpecular14x158_g54 = AdditionalLightsSpecular14x( WorldPosition158_g54 , ScreenUV158_g54 , WorldNormal158_g54 , WorldView158_g54 , SpecColor158_g54 , Smoothness158_g54 );
				float3 Color1402_g53 = float3( 0,0,0 );
				float3 localGetMainLightColorNode1402_g53 = GetMainLightColorNode1402_g53( Color1402_g53 );
				float3 temp_output_1192_0_g53 = ( temp_output_1196_0_g53 * ( Dot_NdotH1098_g53 * Color1402_g53 ) * pow( Dot_NdotH1098_g53 , exp2( (_IndirectSpecularSmoothness*10.0 + 1.0) ) ) );
				float3 temp_output_1202_0_g53 = ( localAdditionalLightsSpecular14x158_g54 + temp_output_1192_0_g53 );
				float3 _Vector2 = float3(0,0,0);
				float3 Indirect_Specular_1392_g53 = ( temp_output_1202_0_g53 + _Vector2 );
				float fresnelNdotV1262_g53 = dot( worldNormal1260_g53, ase_worldViewDir );
				float fresnelNode1262_g53 = ( 0.04 + _IndirectSpecularSmoothness * pow( 1.0 - fresnelNdotV1262_g53, 5.0 ) );
				float Indirect_Specular_Fresnel1393_g53 = saturate( fresnelNode1262_g53 );
				float3 lerpResult1236_g53 = lerp( temp_output_1210_0_g53 , Indirect_Specular_1392_g53 , Indirect_Specular_Fresnel1393_g53);
				float3 temp_cast_18 = (temp_output_1117_0_g53).xxx;
				float3 temp_cast_19 = (temp_output_1117_0_g53).xxx;
				float3 lerpResult1379_g53 = lerp( (_ShadowColor).rgb , temp_cast_19 , temp_output_1117_0_g53);
				float3 lerpResult1377_g53 = lerp( temp_cast_18 , lerpResult1379_g53 , _ShadowColorEnable);
				float3 Shadow_Color1439_g53 = lerpResult1377_g53;
				float4 RF_MaterialLighting194 = (( _IndirectToggle )?( float4( ( lerpResult1236_g53 * Shadow_Color1439_g53 ) , 0.0 ) ):( saturate( ( temp_output_412_0 + dotResult463 ) ) ));
				float4 RF_Color439 = ( RF_MainParticle192 * RF_MaterialLighting194 );
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch533 = RF_CircleRender274;
				#else
				float4 staticSwitch533 = RF_Color439;
				#endif
				
				float4 temp_cast_23 = (RF_MainParticle192.w).xxxx;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_23;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_24 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_24;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = staticSwitch533.xyz;
				float Alpha = staticSwitch534.x;
				float AlphaClipThreshold = _AlphaClipThreshold;
				float AlphaClipThresholdShadow = (0.001 + (_AlphaClipThresholdShadow - 0.0) * (1.0 - 0.001) / (1.0 - 0.0));

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.positionCS, Color);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir( v.normalOS );

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord2.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float4 temp_cast_1 = (RF_MainParticle192.w).xxxx;
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord2.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord2.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord2.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_1;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_13 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_13;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				

				float Alpha = staticSwitch534.x;
				float AlphaClipThreshold = _AlphaClipThreshold;
				float AlphaClipThresholdShadow = (0.001 + (_AlphaClipThresholdShadow - 0.0) * (1.0 - 0.001) / (1.0 - 0.0));

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord2.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float4 temp_cast_1 = (RF_MainParticle192.w).xxxx;
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord2.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord2.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord2.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_1;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_13 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_13;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				

				float Alpha = staticSwitch534.x;
				float AlphaClipThreshold = _AlphaClipThreshold;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			

			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float4 temp_cast_1 = (RF_MainParticle192.w).xxxx;
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float4 screenPos = IN.ase_texcoord1;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_1;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_13 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_13;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				

				surfaceDescription.Alpha = staticSwitch534.x;
				surfaceDescription.AlphaClipThreshold = _AlphaClipThreshold;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			

			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float4 temp_cast_1 = (RF_MainParticle192.w).xxxx;
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float4 screenPos = IN.ase_texcoord1;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_1;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_13 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_13;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				

				surfaceDescription.Alpha = staticSwitch534.x;
				surfaceDescription.AlphaClipThreshold = _AlphaClipThreshold;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

        	#pragma multi_compile_instancing
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define ASE_FOG 1
        	#define _SURFACE_TYPE_TRANSPARENT 1
        	#define _ALPHATEST_SHADOW_ON 1
        	#define _ALPHATEST_ON 1
        	#define ASE_SRP_VERSION 140010
        	#define REQUIRE_DEPTH_TEXTURE 1


			

        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local _CUSTOMALPHADEBUG_ON
			#pragma shader_feature_local _CUSTOMALPHA_ON
			#pragma shader_feature_local _CIRCLETYPE_EXP3 _CIRCLETYPE_EXP2 _CIRCLETYPE_EXP _CIRCLETYPE_NORMAL _CIRCLETYPE_SQRT _CIRCLETYPE_SQRT2
			#pragma shader_feature_local _MASKMETHOD_DOT _MASKMETHOD_ADD _MASKMETHOD_DIVIDE _MASKMETHOD_DISTANCE _MASKMETHOD_DISTANCESUBTRACT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadowColor;
			float4 _IndirectSpecularColor;
			float4 _ParticleColor;
			float3 _DarkAreaColor;
			float _CheckBase;
			float _AreaScale;
			float _SurfaceIntensity;
			float _ClampValue;
			float _AlphaExponential;
			float _AlphaNoiseWeight;
			float _MaskRotate;
			float _MaskAnchorY;
			float _AreaOffset;
			float _MaskAnchorX;
			float _MaskOffsetY;
			float _MaskSpeedY;
			float _MaskOverallSpeed;
			float _MaskSpeedX;
			float _MaskOffsetX;
			float _MaskTileY;
			float _MaskRotateSpeed;
			float _NormalToggle;
			float _NormTileY;
			float _MaskTileX;
			float _AlphaIntensity;
			float _ShadowColorEnable;
			half _IndirectSpecularSmoothness;
			half _ShadowSharpness;
			half _ShadowOffset;
			half _ShadowStrength;
			float _IndirectDiffuse;
			float _NormalScale;
			float _NormRotate;
			float _NormRotateSpeed;
			float _NormAnchorY;
			float _NormAnchorX;
			float _NormOffsetY;
			float _NormSpeedY;
			float _NormOverallSpeed;
			float _NormSpeedX;
			float _NormOffsetX;
			float _NormTileX;
			float _DeformIntensity;
			float _VorRotate;
			float _VorRotateSpeed;
			float _ParticleSpeedY;
			float _ParticleOverallSpeed;
			float _ParticleSpeedX;
			float _ParticleOffsetX;
			float _ParticleTileY;
			float _ParticleTileX;
			float _vorTxtFold;
			float _mskTxtFold;
			float _aboutFold;
			float _nrmTxtFold;
			float _prtTxtFold;
			int _BlendingOps;
			int _DstBlend;
			int _SrcBlend;
			float _CheckDef;
			float _CheckShd;
			float _CheckInd;
			float _ParticleOffsetY;
			float _AlphaClipThreshold;
			float _ParticleAnchorX;
			float _ParticleRotateSpeed;
			float _VorAnchorY;
			float _VorAnchorX;
			float _VorOffsetY;
			float _VorSpeedY;
			float _VorOverallSpeed;
			float _VorSpeedX;
			float _VorOffsetX;
			float _VorTileY;
			float _VorTileX;
			float _VoronoiSmooth;
			float _VoronoiAngle;
			float _VoronoiScale;
			float _NoiseDeformToggle;
			float _DarkArea;
			float _IndirectToggle;
			float _ParticleTextureIntensity;
			float _ParticleRotate;
			float _ParticleAnchorY;
			float _AlphaClipThresholdShadow;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ParticleTexture;
			sampler2D _MaskNoiseMap;


			float2 voronoihash316( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi316( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
			{
				float2 n = floor( v );
				float2 f = frac( v );
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for ( int j = -1; j <= 1; j++ )
				{
					for ( int i = -1; i <= 1; i++ )
				 	{
				 		float2 g = float2( i, j );
				 		float2 o = voronoihash316( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 //		if( d<F1 ) {
				 //			F2 = F1;
				 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
				 //		} else if( d<F2 ) {
				 //			F2 = d;
				
				 //		}
				 	}
				}
				return F1;
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.normalOS);

				o.positionCS = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 appendResult39_g50 = (float2(_ParticleTileX , _ParticleTileY));
				float temp_output_53_0_g50 = _ParticleOverallSpeed;
				float mulTime27_g50 = _TimeParameters.x * ( _ParticleSpeedX * temp_output_53_0_g50 );
				float mulTime28_g50 = _TimeParameters.x * ( _ParticleSpeedY * temp_output_53_0_g50 );
				float2 appendResult34_g50 = (float2(( _ParticleOffsetX + mulTime27_g50 ) , ( mulTime28_g50 + _ParticleOffsetY )));
				float2 texCoord37_g50 = IN.ase_texcoord1.xy * appendResult39_g50 + appendResult34_g50;
				float2 appendResult36_g50 = (float2(_ParticleAnchorX , _ParticleAnchorY));
				float mulTime29_g50 = _TimeParameters.x * _ParticleRotateSpeed;
				float cos38_g50 = cos( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float sin38_g50 = sin( ( radians( mulTime29_g50 ) + radians( _ParticleRotate ) ) );
				float2 rotator38_g50 = mul( texCoord37_g50 - appendResult36_g50 , float2x2( cos38_g50 , -sin38_g50 , sin38_g50 , cos38_g50 )) + appendResult36_g50;
				float2 RF_ParticleTextureUV398 = rotator38_g50;
				float4 tex2DNode103 = tex2D( _ParticleTexture, RF_ParticleTextureUV398 );
				float3 appendResult453 = (float3(IN.ase_color.rgb));
				float4 appendResult451 = (float4(( _ParticleColor.rgb * tex2DNode103.rgb * _ParticleTextureIntensity * appendResult453 ) , ( _ParticleColor.a * tex2DNode103.a * IN.ase_color.a )));
				float4 RF_MainParticle192 = appendResult451;
				float4 temp_cast_1 = (RF_MainParticle192.w).xxxx;
				float2 appendResult368 = (float2(2.0 , 2.0));
				float2 texCoord27 = IN.ase_texcoord1.xy * appendResult368 + -( appendResult368 / float2( 2,2 ) );
				float dotResult29 = dot( texCoord27 , texCoord27 );
				float3 temp_cast_2 = (dotResult29).xxx;
				float mulTime321 = _TimeParameters.x * _VoronoiAngle;
				float time316 = mulTime321;
				float2 voronoiSmoothId316 = 0;
				float voronoiSmooth316 = _VoronoiSmooth;
				float2 appendResult39_g6 = (float2(_VorTileX , _VorTileY));
				float temp_output_53_0_g6 = _VorOverallSpeed;
				float mulTime27_g6 = _TimeParameters.x * ( _VorSpeedX * temp_output_53_0_g6 );
				float mulTime28_g6 = _TimeParameters.x * ( _VorSpeedY * temp_output_53_0_g6 );
				float2 appendResult34_g6 = (float2(( _VorOffsetX + mulTime27_g6 ) , ( mulTime28_g6 + _VorOffsetY )));
				float2 texCoord37_g6 = IN.ase_texcoord1.xy * appendResult39_g6 + appendResult34_g6;
				float2 appendResult36_g6 = (float2(_VorAnchorX , _VorAnchorY));
				float mulTime29_g6 = _TimeParameters.x * _VorRotateSpeed;
				float cos38_g6 = cos( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float sin38_g6 = sin( ( radians( mulTime29_g6 ) + radians( _VorRotate ) ) );
				float2 rotator38_g6 = mul( texCoord37_g6 - appendResult36_g6 , float2x2( cos38_g6 , -sin38_g6 , sin38_g6 , cos38_g6 )) + appendResult36_g6;
				float2 RF_VoronoiUV391 = rotator38_g6;
				float2 coords316 = RF_VoronoiUV391 * _VoronoiScale;
				float2 id316 = 0;
				float2 uv316 = 0;
				float fade316 = 0.5;
				float voroi316 = 0;
				float rest316 = 0;
				for( int it316 = 0; it316 <4; it316++ ){
				voroi316 += fade316 * voronoi316( coords316, time316, id316, uv316, voronoiSmooth316,voronoiSmoothId316 );
				rest316 += fade316;
				coords316 *= 2;
				fade316 *= 0.5;
				}//Voronoi316
				voroi316 /= rest316;
				float2 appendResult39_g7 = (float2(_MaskTileX , _MaskTileY));
				float temp_output_53_0_g7 = _MaskOverallSpeed;
				float mulTime27_g7 = _TimeParameters.x * ( _MaskSpeedX * temp_output_53_0_g7 );
				float mulTime28_g7 = _TimeParameters.x * ( _MaskSpeedY * temp_output_53_0_g7 );
				float2 appendResult34_g7 = (float2(( _MaskOffsetX + mulTime27_g7 ) , ( mulTime28_g7 + _MaskOffsetY )));
				float2 texCoord37_g7 = IN.ase_texcoord1.xy * appendResult39_g7 + appendResult34_g7;
				float2 appendResult36_g7 = (float2(_MaskAnchorX , _MaskAnchorY));
				float mulTime29_g7 = _TimeParameters.x * _MaskRotateSpeed;
				float cos38_g7 = cos( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float sin38_g7 = sin( ( radians( mulTime29_g7 ) + radians( _MaskRotate ) ) );
				float2 rotator38_g7 = mul( texCoord37_g7 - appendResult36_g7 , float2x2( cos38_g7 , -sin38_g7 , sin38_g7 , cos38_g7 )) + appendResult36_g7;
				float2 RF_MaskUV330 = rotator38_g7;
				float3 temp_output_12_0_g8 = ( ( 1.0 - tex2D( _MaskNoiseMap, ( ( (( _NoiseDeformToggle )?( voroi316 ):( 0.0 )) * _DeformIntensity ) + RF_MaskUV330 ) ).rgb ) * _AlphaNoiseWeight );
				float dotResult28_g8 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g8 );
				float3 temp_cast_3 = (dotResult28_g8).xxx;
				float3 lerpResult31_g8 = lerp( temp_cast_3 , temp_output_12_0_g8 , 0.0);
				float3 RF_MaskNoiseMap374 = lerpResult31_g8;
				float3 temp_cast_4 = (dotResult29).xxx;
				float temp_output_360_0 = distance( temp_cast_4 , RF_MaskNoiseMap374 );
				float3 temp_cast_5 = (temp_output_360_0).xxx;
				float3 temp_cast_6 = (temp_output_360_0).xxx;
				float3 temp_cast_7 = (dotResult29).xxx;
				#if defined( _MASKMETHOD_DOT )
				float3 staticSwitch395 = temp_cast_7;
				#elif defined( _MASKMETHOD_ADD )
				float3 staticSwitch395 = ( dotResult29 + RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DIVIDE )
				float3 staticSwitch395 = ( dotResult29 / RF_MaskNoiseMap374 );
				#elif defined( _MASKMETHOD_DISTANCE )
				float3 staticSwitch395 = temp_cast_5;
				#elif defined( _MASKMETHOD_DISTANCESUBTRACT )
				float3 staticSwitch395 = ( temp_cast_6 - RF_MaskNoiseMap374 );
				#else
				float3 staticSwitch395 = temp_cast_7;
				#endif
				float4 temp_output_40_0_g10 = sqrt( sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) ) );
				float4 temp_output_6_0_g10 = sqrt( sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				float4 temp_output_7_0_g10 = sqrt( saturate( float4( staticSwitch395 , 0.0 ) ) );
				float4 temp_output_8_0_g10 = ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) );
				#if defined( _CIRCLETYPE_EXP3 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP2 )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_6_0_g10 ) );
				#elif defined( _CIRCLETYPE_EXP )
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_7_0_g10 ) );
				#elif defined( _CIRCLETYPE_NORMAL )
				float4 staticSwitch273 = saturate( ( 1.0 - saturate( float4( staticSwitch395 , 0.0 ) ) ) );
				#elif defined( _CIRCLETYPE_SQRT )
				float4 staticSwitch273 = sqrt( saturate( temp_output_8_0_g10 ) );
				#elif defined( _CIRCLETYPE_SQRT2 )
				float4 staticSwitch273 = sqrt( sqrt( saturate( temp_output_8_0_g10 ) ) );
				#else
				float4 staticSwitch273 = saturate( ( 1.0 - temp_output_40_0_g10 ) );
				#endif
				float4 RF_CircleRenderSel337 = staticSwitch273;
				float4 temp_cast_9 = (_AlphaExponential).xxxx;
				float4 temp_cast_11 = (_ClampValue).xxxx;
				float4 clampResult277 = clamp( ( pow( RF_CircleRenderSel337 , temp_cast_9 ) - float4( RF_MaskNoiseMap374 , 0.0 ) ) , float4( 0,0,0,0 ) , temp_cast_11 );
				float4 temp_cast_12 = (_ClampValue).xxxx;
				float4 RF_CircleRender274 = saturate( (float4( 0,0,0,0 ) + (clampResult277 - float4( 0,0,0,0 )) * (float4( 1,1,1,1 ) - float4( 0,0,0,0 )) / (temp_cast_12 - float4( 0,0,0,0 ))) );
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth57 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth57 = saturate( abs( ( screenDepth57 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( 1.0 ) ) );
				float4 smoothstepResult52 = smoothstep( float4( 0,0,0,0 ) , float4( 1,1,1,1 ) , ( RF_CircleRender274 * IN.ase_color.a * distanceDepth57 ));
				float4 RF_CustomAlpha49 = smoothstepResult52;
				#ifdef _CUSTOMALPHA_ON
				float4 staticSwitch532 = ( RF_CustomAlpha49 * _AlphaIntensity );
				#else
				float4 staticSwitch532 = temp_cast_1;
				#endif
				float4 RF_Alpha448 = saturate( staticSwitch532 );
				float RF_One205 = 1.0;
				float4 temp_cast_13 = (RF_One205).xxxx;
				#ifdef _CUSTOMALPHADEBUG_ON
				float4 staticSwitch534 = temp_cast_13;
				#else
				float4 staticSwitch534 = RF_Alpha448;
				#endif
				

				surfaceDescription.Alpha = staticSwitch534.x;
				surfaceDescription.AlphaClipThreshold = _AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(IN.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = IN.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "BLitParticleEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;378;-8192,-1760;Inherit;False;863.3917;792.1345;Voronoi UV;13;379;391;390;389;388;387;386;385;384;383;382;381;380;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;382;-8128,-1568;Inherit;False;Property;_VorOffsetX;Vor Offset X;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;383;-8128,-1504;Inherit;False;Property;_VorOffsetY;Vor Offset Y;34;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;384;-8128,-1440;Inherit;False;Property;_VorSpeedX;Vor Speed X;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;-8128,-1376;Inherit;False;Property;_VorSpeedY;Vor Speed Y;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;386;-8160,-1312;Inherit;False;Property;_VorOverallSpeed;Vor Overall Speed;44;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;388;-8160,-1184;Inherit;False;Property;_VorRotateSpeed;Vor Rotate Speed;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-8128,-1120;Inherit;False;Property;_VorAnchorX;Vor Anchor X;52;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-8128,-1056;Inherit;False;Property;_VorAnchorY;Vor Anchor Y;61;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;381;-8096,-1632;Inherit;False;Property;_VorTileY;Vor Tile Y;28;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;380;-8096,-1696;Inherit;False;Property;_VorTileX;Vor Tile X;25;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-8160,-1248;Inherit;False;Property;_VorRotate;Vor Rotate;50;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;394;-6400,-1424;Inherit;False;2152;446.0001;Mask Noise Settings;17;297;374;351;350;349;359;325;327;331;326;316;324;318;321;392;328;567;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;379;-7840,-1536;Inherit;False;BUDU UVTileOffsetAnimate;0;;6;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;298;-7296,-1760;Inherit;False;863.3922;790.4971;Mask UV;13;310;330;309;308;306;305;303;302;301;304;300;311;307;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;391;-7552,-1536;Inherit;False;RF_VoronoiUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;328;-6384,-1296;Inherit;False;Property;_VoronoiAngle;Voronoi Angle;68;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-7232,-1632;Inherit;False;Property;_MaskTileY;Mask Tile Y;29;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;300;-7232,-1568;Inherit;False;Property;_MaskOffsetX;Mask Offset X;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;304;-7232,-1504;Inherit;False;Property;_MaskOffsetY;Mask Offset Y;33;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-7232,-1440;Inherit;False;Property;_MaskSpeedX;Mask Speed X;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;302;-7232,-1376;Inherit;False;Property;_MaskSpeedY;Mask Speed Y;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-7264,-1312;Inherit;False;Property;_MaskOverallSpeed;Mask Overall Speed;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;306;-7264,-1184;Inherit;False;Property;_MaskRotateSpeed;Mask Rotate Speed;58;0;Create;True;0;0;0;False;0;False;0;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;308;-7232,-1120;Inherit;False;Property;_MaskAnchorX;Mask Anchor X;54;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-7232,-1056;Inherit;False;Property;_MaskAnchorY;Mask Anchor Y;63;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;307;-7232,-1696;Inherit;False;Property;_MaskTileX;Mask Tile X;26;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;305;-7264,-1248;Inherit;False;Property;_MaskRotate;Mask Rotate;48;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;392;-6224,-1376;Inherit;False;391;RF_VoronoiUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;321;-6192,-1296;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;318;-6192,-1216;Inherit;False;Property;_VoronoiScale;Voronoi Scale;51;0;Create;True;0;0;0;False;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;324;-6288,-1136;Inherit;False;Property;_VoronoiSmooth;Voronoi Smooth;66;0;Create;True;0;0;0;False;0;False;0;0.167;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;310;-6944,-1536;Inherit;False;BUDU UVTileOffsetAnimate;0;;7;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VoronoiNode;316;-6000,-1376;Inherit;False;0;0;1;0;4;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT;4;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;330;-6656,-1536;Inherit;False;RF_MaskUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-6288,-1056;Inherit;False;Property;_DeformIntensity;Deform Intensity;67;0;Create;True;0;0;0;False;0;False;0.1;0.5;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;567;-5856,-1152;Inherit;False;Property;_NoiseDeformToggle;NoiseDeformToggle;89;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;331;-5696,-1264;Inherit;False;330;RF_MaskUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;325;-5664,-1376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;36;-8192,-960;Inherit;False;3451.924;679.4277;Circle Texture;25;172;274;278;277;279;346;375;335;336;337;273;402;395;363;377;393;360;29;376;27;371;370;368;364;499;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;327;-5488,-1376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;364;-8160,-880;Inherit;False;Constant;_MTileConst;MTileConst;58;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;297;-5360,-1376;Inherit;True;Property;_MaskNoiseMap;MaskNoiseMap;65;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;368;-7968,-896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;359;-5056,-1376;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;349;-5184,-1168;Inherit;False;Property;_AlphaNoiseWeight;Alpha Noise Weight;70;0;Create;True;0;0;0;False;0;False;0;0.445;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;370;-7808,-816;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;350;-4896,-1376;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;371;-7648,-816;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;351;-4736,-1376;Inherit;False;Saturation;-1;;8;4f383aa3b2a7ef640be83276d286e709;0;2;12;FLOAT3;0,0,0;False;21;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;27;-7488,-896;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;2,2;False;1;FLOAT2;-1,-1;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;374;-4512,-1376;Inherit;False;RF_MaskNoiseMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;29;-7232,-832;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;376;-7584,-528;Inherit;False;374;RF_MaskNoiseMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DistanceOpNode;360;-7104,-496;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;393;-6944,-384;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;377;-7072,-720;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;363;-7104,-608;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;395;-6784,-832;Inherit;False;Property;_MaskMethod;MaskMethod;72;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Dot;Add;Divide;Distance;DistanceSubtract;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;402;-6496,-832;Inherit;False;BUDUSelectGrades;-1;;10;0b1bf645d1ec18f499d32448c12c9427;6,44,1,35,1,36,1,38,1,39,1,46,1;1;50;FLOAT4;0,0,0,0;False;6;FLOAT4;0;FLOAT4;1;FLOAT4;2;FLOAT4;3;FLOAT4;4;FLOAT4;5
Node;AmplifyShaderEditor.StaticSwitch;273;-6272,-832;Inherit;False;Property;_CircleType;CircleType;92;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;6;Exp3;Exp2;Exp;Normal;Sqrt;Sqrt2;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;337;-6048,-832;Inherit;False;RF_CircleRenderSel;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;336;-6064,-720;Inherit;False;Property;_AlphaExponential;Alpha Exponential;71;0;Create;True;0;0;0;False;0;False;1;0.64;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;335;-5792,-832;Inherit;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;375;-5872,-576;Inherit;False;374;RF_MaskNoiseMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;346;-5536,-832;Inherit;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-5616,-576;Inherit;False;Property;_ClampValue;ClampValue;64;0;Create;True;0;0;0;False;0;False;0.1;0.486;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;257;-8192,-2576;Inherit;False;862.1569;797.7559;Particle UV;13;398;245;246;256;255;253;249;252;251;250;248;247;497;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;277;-5328,-832;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0.21,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-8096,-2448;Inherit;False;Property;_ParticleTileY;Particle Tile Y;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;248;-8128,-2384;Inherit;False;Property;_ParticleOffsetX;Particle Offset X;23;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;250;-8128,-2256;Inherit;False;Property;_ParticleSpeedX;Particle Speed X;38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-8128,-2192;Inherit;False;Property;_ParticleSpeedY;Particle Speed Y;39;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;252;-8160,-2128;Inherit;False;Property;_ParticleOverallSpeed;Particle Overall Speed;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-8128,-2320;Inherit;False;Property;_ParticleOffsetY;Particle Offset Y;31;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;255;-8128,-1936;Inherit;False;Property;_ParticleAnchorX;Particle Anchor X;55;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;256;-8128,-1872;Inherit;False;Property;_ParticleAnchorY;Particle Anchor Y;60;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;246;-8096,-2512;Inherit;False;Property;_ParticleTileX;Particle Tile X;24;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;253;-8160,-2064;Inherit;False;Property;_ParticleRotate;Particle Rotate;47;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;497;-8160,-2000;Inherit;False;Property;_ParticleRotateSpeed;Particle Rotate Speed;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;278;-5168,-832;Inherit;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;245;-7872,-2352;Inherit;False;BUDU UVTileOffsetAnimate;0;;50;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;499;-5008,-672;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;196;-4704,-960;Inherit;False;1180.631;766.8425;Particle Settings;10;457;451;450;104;103;453;102;410;452;192;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;398;-7584,-2352;Inherit;False;RF_ParticleTextureUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;214;-5504,-1968;Inherit;False;889.3331;521.0001;Alpha Settings;6;49;52;51;180;57;56;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;274;-4960,-832;Inherit;False;RF_CircleRender;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;452;-4320,-384;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;457;-4672,-592;Inherit;False;398;RF_ParticleTextureUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;410;-4416,-896;Inherit;False;Property;_ParticleTextureIntensity;ParticleTexture Intensity;74;0;Create;True;0;0;0;False;0;False;0;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;102;-4352,-800;Inherit;False;Property;_ParticleColor;Particle Color;90;1;[HDR];Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.632,0.632,0.632,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;453;-4128,-384;Inherit;False;FLOAT3;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;103;-4416,-592;Inherit;True;Property;_ParticleTexture;Particle Texture;91;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;180;-5440,-1824;Inherit;False;274;RF_CircleRender;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DepthFade;57;-5472,-1552;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;56;-5408,-1744;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-4096,-800;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;450;-4096,-592;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-5184,-1744;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;451;-3904,-688;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SmoothstepOpNode;52;-5024,-1744;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;443;-3104,-1440;Inherit;False;1344;577.9999;Final Comps;11;165;439;195;448;568;532;476;446;442;193;408;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;-3744,-688;Inherit;False;RF_MainParticle;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;49;-4832,-1744;Inherit;False;RF_CustomAlpha;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;408;-2912,-960;Inherit;False;Property;_AlphaIntensity;AlphaIntensity;73;0;Create;True;0;0;0;True;0;False;0;1.397;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;-3040,-1376;Inherit;False;192;RF_MainParticle;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;442;-2848,-1056;Inherit;False;49;RF_CustomAlpha;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;446;-2784,-1216;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;476;-2560,-1024;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;201;-3104,-2096;Inherit;False;1311.032;641.2596;Local Vars;27;509;507;504;508;506;505;571;495;203;473;458;479;482;481;202;455;454;444;211;210;209;208;171;207;206;205;204;;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;532;-2400,-1152;Inherit;False;Property;_CustomAlpha;CustomAlpha;87;0;Create;True;0;0;0;True;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;204;-3072,-1904;Inherit;False;Constant;_One2;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;568;-2144,-1152;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-2912,-1904;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;448;-1984,-1152;Inherit;False;RF_Alpha;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;422;-5248,-2256;Inherit;False;641.3335;261.3333;CircleNoise Settings;4;178;28;396;397;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-4576,-2256;Inherit;False;1090;703;Area Blend Settings;10;186;25;34;33;120;121;24;179;177;183;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;424;-7296,-2592;Inherit;False;863.3922;796.2863;Norm UV;13;435;434;431;433;432;430;429;428;427;426;425;437;436;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;199;-6400,-2176;Inherit;False;835.3334;295.3334;Light Area Settings;5;185;159;60;59;58;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;198;-6400,-1856;Inherit;False;864;322.3334;Dark Area Settings;5;145;184;148;146;61;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;197;-6400,-2592;Inherit;False;1087.422;382.8847;Normal Settings;6;471;190;472;143;438;144;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;213;-6624,-256;Inherit;False;1887.506;657.3289;Material Lighting Settings;18;194;467;464;191;413;414;463;412;461;470;469;459;187;68;55;53;189;188;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;493;-2128,-384;Inherit;False;448;RF_Alpha;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;517;-2128,-304;Inherit;False;205;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;172;-4960,-912;Inherit;False;RF_CircleUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;397;-5216,-2096;Inherit;False;274;RF_CircleRender;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;396;-5184,-2192;Inherit;False;172;RF_CircleUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;28;-4992,-2160;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;178;-4832,-2160;Inherit;False;RF_ NoiseCircle;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;425;-7232,-2528;Inherit;False;Property;_NormTileX;Norm Tile X;27;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;427;-7232,-2400;Inherit;False;Property;_NormOffsetX;Norm Offset X;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-7232,-2336;Inherit;False;Property;_NormOffsetY;Norm Offset Y;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;429;-7232,-2272;Inherit;False;Property;_NormSpeedX;Norm Speed X;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;430;-7232,-2208;Inherit;False;Property;_NormSpeedY;Norm Speed Y;41;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-7264,-2144;Inherit;False;Property;_NormOverallSpeed;Norm Overall Speed;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;-7232,-1952;Inherit;False;Property;_NormAnchorX;Norm Anchor X;53;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;-7232,-1888;Inherit;False;Property;_NormAnchorY;Norm Anchor Y;62;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;183;-4544,-1840;Inherit;False;Property;_SurfaceIntensity;Surface Intensity;59;0;Create;True;0;0;0;False;0;False;0.3;2.21;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;-4480,-2096;Inherit;False;274;RF_CircleRender;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;179;-4480,-2192;Inherit;False;178;RF_ NoiseCircle;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;24;-4512,-1728;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TexCoordVertexDataNode;121;-4480,-2000;Inherit;False;0;3;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;426;-7232,-2464;Inherit;False;Property;_NormTileY;Norm Tile Y;30;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-6368,-1792;Inherit;False;Property;_DarkArea;Dark Area;78;0;Create;True;0;0;0;False;0;False;0.1;0.319;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;58;-6368,-2112;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;59;-6336,-2016;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;437;-6944,-2352;Inherit;False;BUDU UVTileOffsetAnimate;0;;51;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-4192,-2096;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TransformDirectionNode;33;-4256,-1728;Inherit;False;World;View;True;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;145;-6304,-1696;Inherit;False;Property;_DarkAreaColor;Dark Area Color;77;0;Create;True;0;0;0;False;0;False;0.3,0.3,0.3,0;0.1999999,0.1999999,0.1999999,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;146;-6080,-1760;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-6112,-2112;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;436;-6656,-2368;Inherit;False;RF_NormalUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;25;-4000,-2000;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;148;-5920,-1760;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;159;-5952,-2112;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;34;-3872,-2000;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;144;-6368,-2304;Inherit;False;Property;_NormalScale;Normal Scale;79;0;Create;True;0;0;0;False;0;False;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;184;-5760,-1760;Inherit;False;RF_DarkArea;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;185;-5792,-2112;Inherit;False;RF_LightArea;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;186;-3712,-2000;Inherit;False;RF_AreaBlend;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;143;-6080,-2416;Inherit;True;Property;_NormalMap;Normal Map;86;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;5062329c834beb9469cdb4211084bae3;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;472;-6048,-2528;Inherit;False;Normal Reconstruct Z;-1;;52;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;188;-6592,-112;Inherit;False;185;RF_LightArea;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;189;-6592,-16;Inherit;False;186;RF_AreaBlend;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-6560,-192;Inherit;False;184;RF_DarkArea;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;471;-5760,-2464;Inherit;False;Property;_NormalToggle;NormalToggle;81;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;53;-6336,-144;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;1,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;55;-6368,-16;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;190;-5536,-2464;Inherit;False;RF_NormalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;467;-6112,240;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-6176,-112;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;464;-5920,240;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ScaleAndOffsetNode;412;-5728,-112;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;5;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;463;-5632,128;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;469;-5504,-112;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;470;-5376,-112;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;461;-5472,16;Inherit;False;Material Lighting;6;;53;b5db59747a6f5584db32cde93c4695e4;9,1445,1,1322,0,1288,0,1289,0,1290,0,1074,0,1323,0,1280,1,1128,1;8;898;FLOAT3;0,0,0;False;975;FLOAT3;0,0,1;False;1081;FLOAT;0;False;1079;FLOAT;0;False;1077;FLOAT;0;False;1075;FLOAT;0;False;1246;FLOAT2;0,0;False;1250;FLOAT2;0,0;False;1;FLOAT3;894
Node;AmplifyShaderEditor.ToggleSwitchNode;459;-5216,-112;Inherit;False;Property;_IndirectToggle;IndirectToggle;80;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;194;-4992,-112;Inherit;False;RF_MaterialLighting;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-3072,-1824;Inherit;False;Constant;_Zero2;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;207;-2912,-1824;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;419;-1776,-1888;Inherit;False;559.3335;432.0002;Blending Ops;Blending Ops;1,1,1,1;			Src				Dst$Alpha Blend = 	Src Alpha			One Minus Src Alpha$Premultiplied =	One				One Minus Src Alpha$Additive =		One				One$Soft Additive =	One Minus Dst Color	One$Multiplicative =	Dst Color			Zero$2x Multiplicative =	Dst Color			Src Color$Particle Additive = 	Src Alpha			One$$$$ilginc multy benzeri = Src Color 			One Minus Src Color$multiply yakın=	One Minus Dst Alpha	One Minus Src Color$black alfa = 		One Minus Dst Alpha	One Minus Src Alpha$difference - burn =	Src Alpha Saturate		One Minus Src Color$black alfa2 = 		Src Alpha Saturate		One Minus Src Alpha$$$$BLitParticleEditor;0;0
Node;AmplifyShaderEditor.StaticSwitch;171;-3072,-2032;Inherit;False;Property;_ReceiveShadows;ReceiveShadows;18;0;Create;True;0;0;0;True;0;False;0;0;0;True;_RECEIVE_SHADOWS_OFF;ToggleOff;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;208;-3072,-1744;Inherit;False;Constant;_Gray1;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;209;-2912,-1744;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;210;-2912,-1664;Inherit;False;RF_90;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;211;-3072,-1664;Inherit;False;Constant;_Ninety;[Ninety];14;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;444;-2656,-1952;Inherit;False;Property;_CheckBase;CheckBase;99;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;195;-3072,-1296;Inherit;False;194;RF_MaterialLighting;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;439;-2624,-1344;Inherit;False;RF_Color;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;165;-2784,-1344;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;454;-2640,-1872;Inherit;False;Property;_CheckInd;CheckInd;100;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;455;-2640,-1792;Inherit;False;Property;_CheckShd;CheckShd;101;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-2640,-2032;Inherit;False;Property;_CheckDef;CheckDef;98;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;413;-6016,-48;Inherit;False;Property;_AreaScale;AreaScale;75;0;Create;True;0;0;0;False;0;False;0;10;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;414;-6016,48;Inherit;False;Property;_AreaOffset;AreaOffset;76;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;438;-6304,-2400;Inherit;False;436;RF_NormalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;433;-7264,-2016;Inherit;False;Property;_NormRotateSpeed;Norm Rotate Speed;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;432;-7264,-2080;Inherit;False;Property;_NormRotate;Norm Rotate;49;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;191;-5952,144;Inherit;False;190;RF_NormalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;481;-3072,-1552;Inherit;False;Property;_SrcBlend;SrcBlend;83;0;Create;True;0;0;0;True;0;False;2;5;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;482;-2912,-1552;Inherit;False;Property;_DstBlend;DstBlend;84;0;Create;True;0;0;0;True;0;False;0;10;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;479;-2752,-1552;Inherit;False;Property;_BlendingOps;Blending Ops;82;1;[Enum];Create;True;0;5;Alpha Blend;0;Premultiply;1;Additive;2;Soft Additive;3;Particle Additive;4;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;458;-2432,-1952;Inherit;False;Property;_prtTxtFold;prtTxtFold;94;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;473;-2448,-1872;Inherit;False;Property;_nrmTxtFold;nrmTxtFold;97;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;203;-2432,-2032;Inherit;False;Property;_aboutFold;aboutFold;93;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;495;-2448,-1792;Inherit;False;Property;_mskTxtFold;mskTxtFold;96;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-2448,-1712;Inherit;False;Property;_vorTxtFold;vorTxtFold;95;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;505;-2240,-2032;Inherit;False;Constant;_Red;[Red];24;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;506;-2240,-1888;Inherit;False;Constant;_Green;[Green];24;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;508;-2016,-2032;Inherit;False;RF_Red;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;504;-2016,-1888;Inherit;False;RF_Green;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;507;-2240,-1744;Inherit;False;Constant;_Blue;[Blue];24;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;509;-2016,-1744;Inherit;False;RF_Blue;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;534;-1904,-368;Inherit;False;Property;_Keyword0;Keyword 0;88;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;533;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;449;-2160,-464;Inherit;False;274;RF_CircleRender;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;440;-2128,-544;Inherit;False;439;RF_Color;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;533;-1936,-528;Inherit;False;Property;_CustomAlphaDebug;CustomAlphaDebug;88;0;Create;True;0;0;0;True;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-2224,-224;Inherit;False;Property;_AlphaClipThreshold;AlphaClipThreshold;17;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-2224,-144;Inherit;False;Property;_AlphaClipThresholdShadow;AlphaClipThresholdShadow;69;0;Create;True;0;0;0;False;0;False;0.01;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;570;-1920,-144;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;556;-1712,-432;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;558;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;559;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;560;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;561;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;562;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;563;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;564;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;565;-576,-768;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;557;-1584,-432;Float;False;True;-1;2;BLitParticleEditor;0;18;BUDU Shaders/Particles/BLitParticle;7489fd76ebdb00b448e337e26be4b0c3;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;True;True;2;5;True;_SrcBlend;10;True;_DstBlend;2;5;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;False;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;True;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;22;Surface;1;638585797746991689;  Blend;0;0;Two Sided;0;638585798709907402;Forward Only;1;638585797637566472;Cast Shadows;1;0;  Use Shadow Threshold;1;638585797789887783;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;True;True;False;False;True;True;True;False;False;;False;0
WireConnection;379;21;380;0
WireConnection;379;14;381;0
WireConnection;379;16;382;0
WireConnection;379;17;383;0
WireConnection;379;51;384;0
WireConnection;379;52;385;0
WireConnection;379;53;386;0
WireConnection;379;20;387;0
WireConnection;379;54;388;0
WireConnection;379;18;389;0
WireConnection;379;19;390;0
WireConnection;391;0;379;0
WireConnection;321;0;328;0
WireConnection;310;21;307;0
WireConnection;310;14;311;0
WireConnection;310;16;300;0
WireConnection;310;17;304;0
WireConnection;310;51;301;0
WireConnection;310;52;302;0
WireConnection;310;53;303;0
WireConnection;310;20;305;0
WireConnection;310;54;306;0
WireConnection;310;18;308;0
WireConnection;310;19;309;0
WireConnection;316;0;392;0
WireConnection;316;1;321;0
WireConnection;316;2;318;0
WireConnection;316;3;324;0
WireConnection;330;0;310;0
WireConnection;567;1;316;0
WireConnection;325;0;567;0
WireConnection;325;1;326;0
WireConnection;327;0;325;0
WireConnection;327;1;331;0
WireConnection;297;1;327;0
WireConnection;368;0;364;0
WireConnection;368;1;364;0
WireConnection;359;0;297;5
WireConnection;370;0;368;0
WireConnection;350;0;359;0
WireConnection;350;1;349;0
WireConnection;371;0;370;0
WireConnection;351;12;350;0
WireConnection;27;0;368;0
WireConnection;27;1;371;0
WireConnection;374;0;351;0
WireConnection;29;0;27;0
WireConnection;29;1;27;0
WireConnection;360;0;29;0
WireConnection;360;1;376;0
WireConnection;393;0;360;0
WireConnection;393;1;376;0
WireConnection;377;0;29;0
WireConnection;377;1;376;0
WireConnection;363;0;29;0
WireConnection;363;1;376;0
WireConnection;395;1;29;0
WireConnection;395;0;377;0
WireConnection;395;2;363;0
WireConnection;395;3;360;0
WireConnection;395;4;393;0
WireConnection;402;50;395;0
WireConnection;273;1;402;0
WireConnection;273;0;402;1
WireConnection;273;2;402;2
WireConnection;273;3;402;3
WireConnection;273;4;402;4
WireConnection;273;5;402;5
WireConnection;337;0;273;0
WireConnection;335;0;337;0
WireConnection;335;1;336;0
WireConnection;346;0;335;0
WireConnection;346;1;375;0
WireConnection;277;0;346;0
WireConnection;277;2;279;0
WireConnection;278;0;277;0
WireConnection;278;2;279;0
WireConnection;245;21;246;0
WireConnection;245;14;247;0
WireConnection;245;16;248;0
WireConnection;245;17;249;0
WireConnection;245;51;250;0
WireConnection;245;52;251;0
WireConnection;245;53;252;0
WireConnection;245;20;253;0
WireConnection;245;54;497;0
WireConnection;245;18;255;0
WireConnection;245;19;256;0
WireConnection;499;0;278;0
WireConnection;398;0;245;0
WireConnection;274;0;499;0
WireConnection;453;0;452;0
WireConnection;103;1;457;0
WireConnection;104;0;102;5
WireConnection;104;1;103;5
WireConnection;104;2;410;0
WireConnection;104;3;453;0
WireConnection;450;0;102;4
WireConnection;450;1;103;4
WireConnection;450;2;452;4
WireConnection;51;0;180;0
WireConnection;51;1;56;4
WireConnection;51;2;57;0
WireConnection;451;0;104;0
WireConnection;451;3;450;0
WireConnection;52;0;51;0
WireConnection;192;0;451;0
WireConnection;49;0;52;0
WireConnection;446;0;193;0
WireConnection;476;0;442;0
WireConnection;476;1;408;0
WireConnection;532;1;446;3
WireConnection;532;0;476;0
WireConnection;568;0;532;0
WireConnection;205;0;204;0
WireConnection;448;0;568;0
WireConnection;172;0;27;0
WireConnection;28;0;396;0
WireConnection;28;2;397;0
WireConnection;178;0;28;0
WireConnection;437;21;425;0
WireConnection;437;14;426;0
WireConnection;437;16;427;0
WireConnection;437;17;428;0
WireConnection;437;51;429;0
WireConnection;437;52;430;0
WireConnection;437;53;431;0
WireConnection;437;20;432;0
WireConnection;437;54;433;0
WireConnection;437;18;434;0
WireConnection;437;19;435;0
WireConnection;120;0;179;0
WireConnection;120;1;177;0
WireConnection;120;2;121;0
WireConnection;120;3;183;0
WireConnection;33;0;24;0
WireConnection;146;0;61;0
WireConnection;146;1;145;0
WireConnection;60;0;58;0
WireConnection;60;1;59;0
WireConnection;436;0;437;0
WireConnection;25;0;120;0
WireConnection;25;1;33;0
WireConnection;148;0;146;0
WireConnection;159;0;60;0
WireConnection;34;0;25;0
WireConnection;184;0;148;0
WireConnection;185;0;159;0
WireConnection;186;0;34;0
WireConnection;143;1;438;0
WireConnection;143;5;144;0
WireConnection;471;0;472;0
WireConnection;471;1;143;0
WireConnection;53;0;187;0
WireConnection;53;1;188;0
WireConnection;53;2;189;0
WireConnection;190;0;471;0
WireConnection;68;0;53;0
WireConnection;68;1;55;0
WireConnection;464;0;467;0
WireConnection;412;0;68;0
WireConnection;412;1;413;0
WireConnection;412;2;414;0
WireConnection;463;0;191;0
WireConnection;463;1;464;0
WireConnection;469;0;412;0
WireConnection;469;1;463;0
WireConnection;470;0;469;0
WireConnection;461;898;412;0
WireConnection;461;975;191;0
WireConnection;459;0;470;0
WireConnection;459;1;461;894
WireConnection;194;0;459;0
WireConnection;207;0;206;0
WireConnection;209;0;208;0
WireConnection;210;0;211;0
WireConnection;439;0;165;0
WireConnection;165;0;193;0
WireConnection;165;1;195;0
WireConnection;508;0;505;0
WireConnection;504;0;506;0
WireConnection;509;0;507;0
WireConnection;534;1;493;0
WireConnection;534;0;517;0
WireConnection;533;1;440;0
WireConnection;533;0;449;0
WireConnection;570;0;154;0
WireConnection;557;2;533;0
WireConnection;557;3;534;0
WireConnection;557;4;152;0
WireConnection;557;7;570;0
ASEEND*/
//CHKSM=FE1E89FA14D1BC84DF6019B3B0045941EF12B0D5
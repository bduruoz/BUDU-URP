// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BSurfaceMetallic"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_BaseColor("Base Color", Color) = (0.5,0.5,0.5,1)
		_EmissionColor("Emission Color", Color) = (0.5,0.5,0.5,1)
		_EmissionMap("Emission Map", 2D) = "white" {}
		[Toggle]_Normal("Normal", Float) = 0
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		[Enum(Rim On,1,Rim Off,0)]_RimSwitch("RimSwitch", Int) = 0
		_RimLightIntensity("Rim Light Intensity", Range( 0 , 1)) = 1
		_RimLightColor("Rim Light Color", Color) = (0.5220125,0.5220125,0.5220125,0)
		[Toggle]_RimLightInvert("Rim Light Invert", Float) = 0
		_RimLightBias("Rim Light Bias", Range( 0 , 1)) = 0
		_RimLightScale("Rim Light Scale", Range( 0 , 5)) = 1
		_RimLightPower("Rim Light Power", Range( 0 , 5)) = 1
		[Toggle]_Reflect("Reflect", Float) = 0
		_ReflectionStrength("Reflection Strength", Range( 0 , 1)) = 1
		_ReflectionMultiplier("Reflection Multiplier", Range( 1 , 10)) = 1
		[HDR]_ReflectColor("Reflect Color", Color) = (1,1,1,1)
		[NoScaleOffset]_ReflectMap("Reflect Map", CUBE) = "white" {}
		_CubeMapRotate("Cube Map Rotate", Range( 0 , 360)) = 0
		_CMYPos("CM Y Pos", Range( -5 , 5)) = 0
		_SpecularOut("Specular Out", Range( 0.1 , 1)) = 0.8
		_CMXPos("CM X Pos", Range( -2 , 2)) = 0
		_CMZPos("CM Z Pos", Range( -2 , 2)) = 0
		_BGloss("BGloss", Range( 0 , 5)) = 1
		_SpecularIn("Specular In", Range( 0 , 2)) = 0.2
		_FresnelSwitch("Fresnel Switch", Int) = 0
		_SpecularSaturation("Specular Saturation", Range( 0 , 1)) = 1
		[Toggle]_RefFresnelInvert("Ref Fresnel Invert", Float) = 0
		_RefFresnelBias("RefFresnelBias", Range( 0 , 1)) = 0
		_SpecularIntensity("Specular Intensity", Range( 0 , 1)) = 1
		_RefFresnelScale("RefFresnelScale", Range( 0 , 5)) = 1
		_RefFresnelPower("RefFresnelPower", Range( 0 , 5)) = 1
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1)
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		_SpecularMap("Specular Map", 2D) = "white" {}
		_Softness("Softness", Range( 0 , 3)) = 0.001
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_AOIntensity("AOIntensity", Range( 0 , 1)) = 1
		_AmbientOcclusionMap("Ambient Occlusion Map", 2D) = "white" {}
		[Toggle]_SpecularInvert("SpecularInvert", Float) = 0
		_MetallicMap("Metallic Map", 2D) = "white" {}
		[Toggle]_EmissionToggle("Emission Toggle", Float) = 0
		_EmissionIntensity("Emission Intensity", Range( 0 , 1)) = 0
		[Toggle]_EmissionInvert("Emission Invert", Float) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		_SpecToggle("SpecToggle", Int) = 1
		_SpecularExtras("SpecularExtras", Int) = 0
		_FresnelFold("FresnelFold", Int) = 0
		_AOToggle("AOToggle", Int) = 0
		_CubeMapExtras("CubeMapExtras", Int) = 0
		[Toggle]_MetallicInvert("Metallic Invert", Float) = 0
		_RefFresnelSwitch("RefFresnelSwitch", Int) = 0
		[Toggle]_AffectAO("AffectAO", Float) = 1
		[Toggle]_SmoothnessInvert("Smoothness Invert", Float) = 0
		[NoScaleOffset]_BluricRefractionPattern("Bluric Refraction Pattern", 2D) = "bump" {}
		_SSSize("SSSize", Float) = 10
		_PatternHeight("PatternHeight", Range( -10 , 10)) = 0.1
		_SpecMax("SpecMax", Range( 0 , 1)) = 1
		_PatternRotator("PatternRotator", Range( -360 , 360)) = 0
		_SSTileX("SSTileX", Float) = 1
		_SpecMin("SpecMin", Range( 0 , 1)) = 0
		_SSTileY("SSTileY", Float) = 1
		_SSOffX("SSOffX", Float) = 0
		_RougnessMap("Rougness Map", 2D) = "white" {}
		[KeywordEnum(Linear,Normal,Gamma)] _SpecType("SpecType", Float) = 0
		_SSOffY("SSOffY", Float) = 0
		[Toggle]_SSBluricTransparent("SS Bluric Transparent", Float) = 0
		_SpecularNormalIntensity("SpecularNormalIntensity", Range( 0 , 1)) = 0.3
		[HideInInspector]_CheckDef("CheckDef", Int) = 0
		[Toggle]_AffectAO_Spec("AffectAO_Spec", Float) = 0
		[Toggle]_AffectMetallic("AffectMetallic", Float) = 0
		_NFallOff("NFallOff", Range( -5 , 5)) = 1
		[Toggle]_AffectAO_Rim("AffectAO_Rim", Float) = 0
		[HideInInspector]_CheckBase("CheckBase", Int) = 0
		[NoScaleOffset][Normal]_NormalMap("NormalMap", 2D) = "bump" {}
		_FallOff("FallOff", Range( -5 , 5)) = 1
		[Toggle]_TriplanarNMap("TriplanarNMap", Float) = 0
		[NoScaleOffset]_BaseMap("Base Map", 2D) = "white" {}
		_NTileX("NTileX", Float) = 1
		[Toggle]_TriplanarMap("TriplanarMap", Float) = 1
		_NOffsetX("NOffsetX", Float) = 0
		_TileX("TileX", Float) = 0
		_NOffsetY("NOffsetY", Float) = 0
		_OffsetX("OffsetX", Float) = 0
		_NTileY("NTileY", Float) = 1
		_NormalMultiplier("NormalMultiplier", Range( 1 , 5)) = 1
		_OffsetY("OffsetY", Float) = 0
		_TileY("TileY", Float) = 0
		[Toggle]_MetallicToggle("MetallicToggle", Float) = 1
		[Toggle]_SmoothnessToggle("Smoothness Toggle", Float) = 0
		_MScale("M Scale", Float) = 1
		_MOffset("M Offset", Float) = 0
		_EmissionMultiplier("Emission Multiplier", Range( 1 , 20)) = 1
		[Toggle]_AverageCalc("AverageCalc", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		// Blending
		[Enum(UnityEngine.Rendering.BlendMode)]_SrcBlend("Src Blend", Float) = 1.0
		[Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Dst Blend", Float) = 0.0
		_ZWrite("ZWrite", Float) = 1.0

	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
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
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS

			
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
		

			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			
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

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _AmbientOcclusionMap;
			samplerCUBE _ReflectMap;
			sampler2D _MetallicMap;
			sampler2D _EmissionMap;
			sampler2D _SpecularMap;
			sampler2D _RougnessMap;


			inline float4 TriplanarSampling274( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling481( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;

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
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 appendResult285 = (float2(_TileX , _TileY));
				float2 appendResult288 = (float2(_OffsetX , _OffsetY));
				float2 texCoord282 = IN.ase_texcoord8.xyz.xy * appendResult285 + appendResult288;
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord9.xyz, IN.ase_normal, _FallOff, appendResult285, 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				
				float2 temp_output_1_0_g151 = float2( 0,0 );
				float dotResult4_g151 = dot( temp_output_1_0_g151 , temp_output_1_0_g151 );
				float3 appendResult10_g151 = (float3((temp_output_1_0_g151).x , (temp_output_1_0_g151).y , sqrt( ( 1.0 - saturate( dotResult4_g151 ) ) )));
				float3 normalizeResult12_g151 = normalize( appendResult10_g151 );
				float2 appendResult459 = (float2(_NTileX , _NTileY));
				float2 appendResult462 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord465 = IN.ase_texcoord8.xyz.xy * appendResult459 + appendResult462;
				float temp_output_458_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack468 = UnpackNormalScale( tex2D( _NormalMap, texCoord465 ), temp_output_458_0 );
				unpack468.z = lerp( 1, unpack468.z, saturate(temp_output_458_0) );
				float4 triplanar481 = TriplanarSampling481( _NormalMap, IN.ase_texcoord9.xyz, IN.ase_normal, _NFallOff, ( appendResult459 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack469 = UnpackNormalScale( triplanar481, ( temp_output_458_0 * -1.4 ) );
				unpack469.z = lerp( 1, unpack469.z, saturate(( temp_output_458_0 * -1.4 )) );
				float3 appendResult479 = (float3(-unpack469.x , unpack469.y , unpack469.z));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float2 appendResult257 = (float2(_SSOffX , _SSOffY));
				float2 texCoord252 = IN.ase_texcoord8.xyz.xy * appendResult258 + appendResult257;
				float cos250 = cos( radians( _PatternRotator ) );
				float sin250 = sin( radians( _PatternRotator ) );
				float2 rotator250 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord252, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0,0 );
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator250 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal484 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) ));
				
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal68 = RF_NewObjectNormal484;
				float3 worldNormal68 = float3(dot(tanToWorld0,tanNormal68), dot(tanToWorld1,tanNormal68), dot(tanToWorld2,tanNormal68));
				float fresnelNdotV62 = dot( normalize( worldNormal68 ), WorldViewDirection );
				float fresnelNode62 = ( _RimLightBias + _RimLightScale * pow( max( 1.0 - fresnelNdotV62 , 0.0001 ), _RimLightPower ) );
				float4 RF_BaseTexture23 = (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) ));
				float RF_One15 = 1.0;
				float4 temp_cast_7 = (RF_One15).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord8.xyz.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 temp_output_161_0 = ( ( 1.0 - _AOIntensity ) + tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap ) );
				float4 RF_AbsoluteAO242 = temp_output_161_0;
				float4 RF_RimLightResult66 = ( ( _RimLightColor * (( _RimLightInvert )?( ( 1.0 - fresnelNode62 ) ):( fresnelNode62 )) * _RimLightIntensity * RF_BaseTexture23 ) * _RimSwitch * (( _AffectAO_Rim )?( RF_AbsoluteAO242 ):( temp_cast_7 )) );
				float RF_Zero16 = 0.0;
				float4 temp_cast_8 = (RF_Zero16).xxxx;
				float3 worldRefl95 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, RF_NewObjectNormal484 ), dot( tanToWorld1, RF_NewObjectNormal484 ), dot( tanToWorld2, RF_NewObjectNormal484 ) ) ) );
				float3 VertexPos5_g147 = worldRefl95;
				float3 appendResult10_g147 = (float3(0.0 , VertexPos5_g147.y , 0.0));
				float3 VertexPosRotationAxis11_g147 = appendResult10_g147;
				float3 break13_g147 = VertexPos5_g147;
				float3 appendResult14_g147 = (float3(break13_g147.x , 0.0 , break13_g147.z));
				float3 VertexPosOtherAxis12_g147 = appendResult14_g147;
				float Angle3_g147 = radians( _CubeMapRotate );
				float3 appendResult113 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal86 = RF_NewObjectNormal484;
				float3 worldNormal86 = float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86));
				float fresnelNdotV80 = dot( normalize( worldNormal86 ), WorldViewDirection );
				float fresnelNode80 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV80 , 0.0001 ), _RefFresnelPower ) );
				float RF_RefFresnelResult84 = ( saturate( (( _RefFresnelInvert )?( fresnelNode80 ):( ( 1.0 - fresnelNode80 ) )) ) * _FresnelSwitch );
				int RF_RefFresnelSwitch87 = _FresnelSwitch;
				float4 temp_cast_9 = (RF_One15).xxxx;
				float4 temp_cast_10 = (RF_One15).xxxx;
				float2 uv_MetallicMap = IN.ase_texcoord8.xyz.xy * _MetallicMap_ST.xy + _MetallicMap_ST.zw;
				float4 temp_output_342_0 = (tex2D( _MetallicMap, uv_MetallicMap )*_MScale + _MOffset);
				float4 RF_MetallicResult322 = (( _MetallicToggle )?( ( _Metallic * (( _MetallicInvert )?( saturate( ( 1.0 - temp_output_342_0 ) ) ):( temp_output_342_0 )) ) ):( temp_cast_10 ));
				float4 RF_Reflect107 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g147 + ( VertexPosOtherAxis12_g147 * cos( Angle3_g147 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g147 ) * sin( Angle3_g147 ) ) ) + appendResult113 ) ) * _ReflectColor ) * ( 1.0 - RF_RefFresnelResult84 ) * ( ( _ReflectionMultiplier * RF_RefFresnelSwitch87 ) + RF_One15 ) * (( _AffectAO )?( RF_AbsoluteAO242 ):( temp_cast_9 )) * RF_MetallicResult322 ) ):( temp_cast_8 ));
				float4 temp_cast_11 = (RF_Zero16).xxxx;
				float2 uv_EmissionMap = IN.ase_texcoord8.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float4 tex2DNode134 = tex2D( _EmissionMap, uv_EmissionMap );
				float4 temp_output_144_0 = ( 1.0 - tex2DNode134 );
				float4 RF_EmissionResult137 = (( _EmissionToggle )?( ( _EmissionColor * (( _EmissionInvert )?( temp_output_144_0 ):( tex2DNode134 )) * ( _EmissionIntensity * _EmissionMultiplier ) ) ):( temp_cast_11 ));
				float4 temp_cast_12 = (RF_Zero16).xxxx;
				float ifLocalVar437 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar437 = _SpecularOut;
				else
				ifLocalVar437 = _SpecularIn;
				float3 temp_cast_13 = (ifLocalVar437).xxx;
				float3 temp_cast_14 = (_SpecularOut).xxx;
				float ifLocalVar415 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar415 = _SpecMax;
				else
				ifLocalVar415 = _SpecMin;
				float3 temp_cast_15 = ((0)).xxx;
				float3 tanNormal408 = temp_cast_15;
				float3 worldNormal408 = normalize( float3(dot(tanToWorld0,tanNormal408), dot(tanToWorld1,tanNormal408), dot(tanToWorld2,tanNormal408)) );
				float3 normalizeResult401 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float dotResult405 = dot( ( worldNormal408 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult401 );
				float RF_LightNormal410 = dotResult405;
				float saferPower412 = abs( RF_LightNormal410 );
				float smoothstepResult417 = smoothstep( ifLocalVar415 , _SpecMax , pow( saferPower412 , _BGloss ));
				float temp_output_2_0_g149 = smoothstepResult417;
				float temp_output_419_0 = saturate( ( temp_output_2_0_g149 * temp_output_2_0_g149 ) );
				float3 temp_cast_16 = (temp_output_419_0).xxx;
				float3 temp_cast_17 = (temp_output_419_0).xxx;
				float3 gammaToLinear420 = Gamma22ToLinear( temp_cast_17 );
				float3 temp_cast_18 = (temp_output_419_0).xxx;
				float3 temp_cast_19 = (temp_output_419_0).xxx;
				float3 temp_cast_20 = (temp_output_419_0).xxx;
				float3 linearToGamma421 = LinearToGamma22( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_419_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch422 = gammaToLinear420;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch422 = temp_cast_18;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch422 = linearToGamma421;
				#else
				float3 staticSwitch422 = gammaToLinear420;
				#endif
				float3 smoothstepResult436 = smoothstep( temp_cast_13 , temp_cast_14 , ( 1.0 - sqrt( staticSwitch422 ) ));
				float3 saferPower435 = abs( smoothstepResult436 );
				float3 temp_cast_22 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_23 = (0.0).xxx;
				float3 temp_cast_24 = (_SpecularSaturation).xxx;
				float3 clampResult447 = clamp( ( 1.0 - pow( saferPower435 , temp_cast_22 ) ) , temp_cast_23 , temp_cast_24 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 uv_SpecularMap = IN.ase_texcoord8.xyz.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode427 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_27 = (RF_One15).xxxx;
				float4 temp_cast_28 = (RF_One15).xxxx;
				float4 RF_Specular452 = (( _SpecularSwitch )?( ( ( float4( clampResult447 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode427 ) ):( tex2DNode427 )) * (( _AffectAO_Spec )?( RF_AbsoluteAO242 ):( temp_cast_27 )) * (( _AffectMetallic )?( RF_MetallicResult322 ):( temp_cast_28 )) ) * _SpecularIntensity ) ):( temp_cast_12 ));
				float4 temp_output_116_0 = ( RF_RimLightResult66 + saturate( RF_Reflect107 ) + RF_EmissionResult137 + RF_Specular452 );
				float4 RF_FinalEmission486 = (( _AverageCalc )?( ( temp_output_116_0 / float4( 0,0,0,0 ) ) ):( temp_output_116_0 ));
				
				float4 temp_cast_31 = (RF_Zero16).xxxx;
				float2 uv_RougnessMap = IN.ase_texcoord8.xyz.xy * _RougnessMap_ST.xy + _RougnessMap_ST.zw;
				float4 tex2DNode330 = tex2D( _RougnessMap, uv_RougnessMap );
				float4 RF_SmoothnessResult334 = (( _SmoothnessToggle )?( ( (( _SmoothnessInvert )?( ( 1.0 - tex2DNode330 ) ):( tex2DNode330 )) * _Smoothness ) ):( temp_cast_31 ));
				
				int RF_AOToggle233 = _AOToggle;
				float4 RF_AOResult154 = ( temp_output_161_0 + ( 1.0 - RF_AOToggle233 ) );
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float3 Normal = RF_NewObjectNormal484;
				float3 Emission = RF_FinalEmission486.rgb;
				float3 Specular = 0.5;
				float Metallic = RF_MetallicResult322.r;
				float Smoothness = RF_SmoothnessResult334.r;
				float Occlusion = RF_AOResult154.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				#ifdef _ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
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

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

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

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

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
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
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

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
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

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

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

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
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

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
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
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _AmbientOcclusionMap;
			samplerCUBE _ReflectMap;
			sampler2D _MetallicMap;
			sampler2D _EmissionMap;
			sampler2D _SpecularMap;


			inline float4 TriplanarSampling274( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling481( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xyz = v.texcoord0.xyz;
				o.ase_texcoord6 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;

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

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

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
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;

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
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_tangent = v.ase_tangent;
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
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float2 appendResult285 = (float2(_TileX , _TileY));
				float2 appendResult288 = (float2(_OffsetX , _OffsetY));
				float2 texCoord282 = IN.ase_texcoord4.xyz.xy * appendResult285 + appendResult288;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord6.xyz, IN.ase_normal, _FallOff, appendResult285, 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g151 = float2( 0,0 );
				float dotResult4_g151 = dot( temp_output_1_0_g151 , temp_output_1_0_g151 );
				float3 appendResult10_g151 = (float3((temp_output_1_0_g151).x , (temp_output_1_0_g151).y , sqrt( ( 1.0 - saturate( dotResult4_g151 ) ) )));
				float3 normalizeResult12_g151 = normalize( appendResult10_g151 );
				float2 appendResult459 = (float2(_NTileX , _NTileY));
				float2 appendResult462 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord465 = IN.ase_texcoord4.xyz.xy * appendResult459 + appendResult462;
				float temp_output_458_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack468 = UnpackNormalScale( tex2D( _NormalMap, texCoord465 ), temp_output_458_0 );
				unpack468.z = lerp( 1, unpack468.z, saturate(temp_output_458_0) );
				float4 triplanar481 = TriplanarSampling481( _NormalMap, IN.ase_texcoord6.xyz, IN.ase_normal, _NFallOff, ( appendResult459 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack469 = UnpackNormalScale( triplanar481, ( temp_output_458_0 * -1.4 ) );
				unpack469.z = lerp( 1, unpack469.z, saturate(( temp_output_458_0 * -1.4 )) );
				float3 appendResult479 = (float3(-unpack469.x , unpack469.y , unpack469.z));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float2 appendResult257 = (float2(_SSOffX , _SSOffY));
				float2 texCoord252 = IN.ase_texcoord4.xyz.xy * appendResult258 + appendResult257;
				float cos250 = cos( radians( _PatternRotator ) );
				float sin250 = sin( radians( _PatternRotator ) );
				float2 rotator250 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord252, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0,0 );
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator250 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal484 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) ));
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal68 = RF_NewObjectNormal484;
				float3 worldNormal68 = float3(dot(tanToWorld0,tanNormal68), dot(tanToWorld1,tanNormal68), dot(tanToWorld2,tanNormal68));
				float fresnelNdotV62 = dot( normalize( worldNormal68 ), ase_worldViewDir );
				float fresnelNode62 = ( _RimLightBias + _RimLightScale * pow( max( 1.0 - fresnelNdotV62 , 0.0001 ), _RimLightPower ) );
				float4 RF_BaseTexture23 = (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) ));
				float RF_One15 = 1.0;
				float4 temp_cast_7 = (RF_One15).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord4.xyz.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 temp_output_161_0 = ( ( 1.0 - _AOIntensity ) + tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap ) );
				float4 RF_AbsoluteAO242 = temp_output_161_0;
				float4 RF_RimLightResult66 = ( ( _RimLightColor * (( _RimLightInvert )?( ( 1.0 - fresnelNode62 ) ):( fresnelNode62 )) * _RimLightIntensity * RF_BaseTexture23 ) * _RimSwitch * (( _AffectAO_Rim )?( RF_AbsoluteAO242 ):( temp_cast_7 )) );
				float RF_Zero16 = 0.0;
				float4 temp_cast_8 = (RF_Zero16).xxxx;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl95 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, RF_NewObjectNormal484 ), dot( tanToWorld1, RF_NewObjectNormal484 ), dot( tanToWorld2, RF_NewObjectNormal484 ) ) ) );
				float3 VertexPos5_g147 = worldRefl95;
				float3 appendResult10_g147 = (float3(0.0 , VertexPos5_g147.y , 0.0));
				float3 VertexPosRotationAxis11_g147 = appendResult10_g147;
				float3 break13_g147 = VertexPos5_g147;
				float3 appendResult14_g147 = (float3(break13_g147.x , 0.0 , break13_g147.z));
				float3 VertexPosOtherAxis12_g147 = appendResult14_g147;
				float Angle3_g147 = radians( _CubeMapRotate );
				float3 appendResult113 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal86 = RF_NewObjectNormal484;
				float3 worldNormal86 = float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86));
				float fresnelNdotV80 = dot( normalize( worldNormal86 ), ase_worldViewDir );
				float fresnelNode80 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV80 , 0.0001 ), _RefFresnelPower ) );
				float RF_RefFresnelResult84 = ( saturate( (( _RefFresnelInvert )?( fresnelNode80 ):( ( 1.0 - fresnelNode80 ) )) ) * _FresnelSwitch );
				int RF_RefFresnelSwitch87 = _FresnelSwitch;
				float4 temp_cast_9 = (RF_One15).xxxx;
				float4 temp_cast_10 = (RF_One15).xxxx;
				float2 uv_MetallicMap = IN.ase_texcoord4.xyz.xy * _MetallicMap_ST.xy + _MetallicMap_ST.zw;
				float4 temp_output_342_0 = (tex2D( _MetallicMap, uv_MetallicMap )*_MScale + _MOffset);
				float4 RF_MetallicResult322 = (( _MetallicToggle )?( ( _Metallic * (( _MetallicInvert )?( saturate( ( 1.0 - temp_output_342_0 ) ) ):( temp_output_342_0 )) ) ):( temp_cast_10 ));
				float4 RF_Reflect107 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g147 + ( VertexPosOtherAxis12_g147 * cos( Angle3_g147 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g147 ) * sin( Angle3_g147 ) ) ) + appendResult113 ) ) * _ReflectColor ) * ( 1.0 - RF_RefFresnelResult84 ) * ( ( _ReflectionMultiplier * RF_RefFresnelSwitch87 ) + RF_One15 ) * (( _AffectAO )?( RF_AbsoluteAO242 ):( temp_cast_9 )) * RF_MetallicResult322 ) ):( temp_cast_8 ));
				float4 temp_cast_11 = (RF_Zero16).xxxx;
				float2 uv_EmissionMap = IN.ase_texcoord4.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float4 tex2DNode134 = tex2D( _EmissionMap, uv_EmissionMap );
				float4 temp_output_144_0 = ( 1.0 - tex2DNode134 );
				float4 RF_EmissionResult137 = (( _EmissionToggle )?( ( _EmissionColor * (( _EmissionInvert )?( temp_output_144_0 ):( tex2DNode134 )) * ( _EmissionIntensity * _EmissionMultiplier ) ) ):( temp_cast_11 ));
				float4 temp_cast_12 = (RF_Zero16).xxxx;
				float ifLocalVar437 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar437 = _SpecularOut;
				else
				ifLocalVar437 = _SpecularIn;
				float3 temp_cast_13 = (ifLocalVar437).xxx;
				float3 temp_cast_14 = (_SpecularOut).xxx;
				float ifLocalVar415 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar415 = _SpecMax;
				else
				ifLocalVar415 = _SpecMin;
				float3 temp_cast_15 = ((0)).xxx;
				float3 tanNormal408 = temp_cast_15;
				float3 worldNormal408 = normalize( float3(dot(tanToWorld0,tanNormal408), dot(tanToWorld1,tanNormal408), dot(tanToWorld2,tanNormal408)) );
				float3 normalizeResult401 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float dotResult405 = dot( ( worldNormal408 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult401 );
				float RF_LightNormal410 = dotResult405;
				float saferPower412 = abs( RF_LightNormal410 );
				float smoothstepResult417 = smoothstep( ifLocalVar415 , _SpecMax , pow( saferPower412 , _BGloss ));
				float temp_output_2_0_g149 = smoothstepResult417;
				float temp_output_419_0 = saturate( ( temp_output_2_0_g149 * temp_output_2_0_g149 ) );
				float3 temp_cast_16 = (temp_output_419_0).xxx;
				float3 temp_cast_17 = (temp_output_419_0).xxx;
				float3 gammaToLinear420 = Gamma22ToLinear( temp_cast_17 );
				float3 temp_cast_18 = (temp_output_419_0).xxx;
				float3 temp_cast_19 = (temp_output_419_0).xxx;
				float3 temp_cast_20 = (temp_output_419_0).xxx;
				float3 linearToGamma421 = LinearToGamma22( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_419_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch422 = gammaToLinear420;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch422 = temp_cast_18;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch422 = linearToGamma421;
				#else
				float3 staticSwitch422 = gammaToLinear420;
				#endif
				float3 smoothstepResult436 = smoothstep( temp_cast_13 , temp_cast_14 , ( 1.0 - sqrt( staticSwitch422 ) ));
				float3 saferPower435 = abs( smoothstepResult436 );
				float3 temp_cast_22 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_23 = (0.0).xxx;
				float3 temp_cast_24 = (_SpecularSaturation).xxx;
				float3 clampResult447 = clamp( ( 1.0 - pow( saferPower435 , temp_cast_22 ) ) , temp_cast_23 , temp_cast_24 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 uv_SpecularMap = IN.ase_texcoord4.xyz.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode427 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_27 = (RF_One15).xxxx;
				float4 temp_cast_28 = (RF_One15).xxxx;
				float4 RF_Specular452 = (( _SpecularSwitch )?( ( ( float4( clampResult447 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode427 ) ):( tex2DNode427 )) * (( _AffectAO_Spec )?( RF_AbsoluteAO242 ):( temp_cast_27 )) * (( _AffectMetallic )?( RF_MetallicResult322 ):( temp_cast_28 )) ) * _SpecularIntensity ) ):( temp_cast_12 ));
				float4 temp_output_116_0 = ( RF_RimLightResult66 + saturate( RF_Reflect107 ) + RF_EmissionResult137 + RF_Specular452 );
				float4 RF_FinalEmission486 = (( _AverageCalc )?( ( temp_output_116_0 / float4( 0,0,0,0 ) ) ):( temp_output_116_0 ));
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float3 Emission = RF_FinalEmission486.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _BaseMap;


			inline float4 TriplanarSampling274( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord4 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;

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

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

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

				float2 appendResult285 = (float2(_TileX , _TileY));
				float2 appendResult288 = (float2(_OffsetX , _OffsetY));
				float2 texCoord282 = IN.ase_texcoord2.xy * appendResult285 + appendResult288;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord4.xyz, IN.ase_normal, _FallOff, appendResult285, 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			
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

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;


			inline float4 TriplanarSampling481( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_texcoord6 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
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
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

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
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 temp_output_1_0_g151 = float2( 0,0 );
				float dotResult4_g151 = dot( temp_output_1_0_g151 , temp_output_1_0_g151 );
				float3 appendResult10_g151 = (float3((temp_output_1_0_g151).x , (temp_output_1_0_g151).y , sqrt( ( 1.0 - saturate( dotResult4_g151 ) ) )));
				float3 normalizeResult12_g151 = normalize( appendResult10_g151 );
				float2 appendResult459 = (float2(_NTileX , _NTileY));
				float2 appendResult462 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord465 = IN.ase_texcoord5.xy * appendResult459 + appendResult462;
				float temp_output_458_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack468 = UnpackNormalScale( tex2D( _NormalMap, texCoord465 ), temp_output_458_0 );
				unpack468.z = lerp( 1, unpack468.z, saturate(temp_output_458_0) );
				float4 triplanar481 = TriplanarSampling481( _NormalMap, IN.ase_texcoord6.xyz, IN.ase_normal, _NFallOff, ( appendResult459 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack469 = UnpackNormalScale( triplanar481, ( temp_output_458_0 * -1.4 ) );
				unpack469.z = lerp( 1, unpack469.z, saturate(( temp_output_458_0 * -1.4 )) );
				float3 appendResult479 = (float3(-unpack469.x , unpack469.y , unpack469.z));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float2 appendResult257 = (float2(_SSOffX , _SSOffY));
				float2 texCoord252 = IN.ase_texcoord5.xy * appendResult258 + appendResult257;
				float cos250 = cos( radians( _PatternRotator ) );
				float sin250 = sin( radians( _PatternRotator ) );
				float2 rotator250 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord252, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0,0 );
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator250 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal484 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) ));
				

				float3 Normal = RF_NewObjectNormal484;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
      
			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER

			
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

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _AmbientOcclusionMap;
			samplerCUBE _ReflectMap;
			sampler2D _MetallicMap;
			sampler2D _EmissionMap;
			sampler2D _SpecularMap;
			sampler2D _RougnessMap;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			inline float4 TriplanarSampling274( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling481( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.positionOS;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
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
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 appendResult285 = (float2(_TileX , _TileY));
				float2 appendResult288 = (float2(_OffsetX , _OffsetY));
				float2 texCoord282 = IN.ase_texcoord8.xyz.xy * appendResult285 + appendResult288;
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord9.xyz, IN.ase_normal, _FallOff, appendResult285, 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				
				float2 temp_output_1_0_g151 = float2( 0,0 );
				float dotResult4_g151 = dot( temp_output_1_0_g151 , temp_output_1_0_g151 );
				float3 appendResult10_g151 = (float3((temp_output_1_0_g151).x , (temp_output_1_0_g151).y , sqrt( ( 1.0 - saturate( dotResult4_g151 ) ) )));
				float3 normalizeResult12_g151 = normalize( appendResult10_g151 );
				float2 appendResult459 = (float2(_NTileX , _NTileY));
				float2 appendResult462 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord465 = IN.ase_texcoord8.xyz.xy * appendResult459 + appendResult462;
				float temp_output_458_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack468 = UnpackNormalScale( tex2D( _NormalMap, texCoord465 ), temp_output_458_0 );
				unpack468.z = lerp( 1, unpack468.z, saturate(temp_output_458_0) );
				float4 triplanar481 = TriplanarSampling481( _NormalMap, IN.ase_texcoord9.xyz, IN.ase_normal, _NFallOff, ( appendResult459 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack469 = UnpackNormalScale( triplanar481, ( temp_output_458_0 * -1.4 ) );
				unpack469.z = lerp( 1, unpack469.z, saturate(( temp_output_458_0 * -1.4 )) );
				float3 appendResult479 = (float3(-unpack469.x , unpack469.y , unpack469.z));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float2 appendResult257 = (float2(_SSOffX , _SSOffY));
				float2 texCoord252 = IN.ase_texcoord8.xyz.xy * appendResult258 + appendResult257;
				float cos250 = cos( radians( _PatternRotator ) );
				float sin250 = sin( radians( _PatternRotator ) );
				float2 rotator250 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord252, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0,0 );
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator250 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal484 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult479 ):( unpack468 )) ):( normalizeResult12_g151 )) ));
				
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal68 = RF_NewObjectNormal484;
				float3 worldNormal68 = float3(dot(tanToWorld0,tanNormal68), dot(tanToWorld1,tanNormal68), dot(tanToWorld2,tanNormal68));
				float fresnelNdotV62 = dot( normalize( worldNormal68 ), WorldViewDirection );
				float fresnelNode62 = ( _RimLightBias + _RimLightScale * pow( max( 1.0 - fresnelNdotV62 , 0.0001 ), _RimLightPower ) );
				float4 RF_BaseTexture23 = (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) ));
				float RF_One15 = 1.0;
				float4 temp_cast_7 = (RF_One15).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord8.xyz.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 temp_output_161_0 = ( ( 1.0 - _AOIntensity ) + tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap ) );
				float4 RF_AbsoluteAO242 = temp_output_161_0;
				float4 RF_RimLightResult66 = ( ( _RimLightColor * (( _RimLightInvert )?( ( 1.0 - fresnelNode62 ) ):( fresnelNode62 )) * _RimLightIntensity * RF_BaseTexture23 ) * _RimSwitch * (( _AffectAO_Rim )?( RF_AbsoluteAO242 ):( temp_cast_7 )) );
				float RF_Zero16 = 0.0;
				float4 temp_cast_8 = (RF_Zero16).xxxx;
				float3 worldRefl95 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, RF_NewObjectNormal484 ), dot( tanToWorld1, RF_NewObjectNormal484 ), dot( tanToWorld2, RF_NewObjectNormal484 ) ) ) );
				float3 VertexPos5_g147 = worldRefl95;
				float3 appendResult10_g147 = (float3(0.0 , VertexPos5_g147.y , 0.0));
				float3 VertexPosRotationAxis11_g147 = appendResult10_g147;
				float3 break13_g147 = VertexPos5_g147;
				float3 appendResult14_g147 = (float3(break13_g147.x , 0.0 , break13_g147.z));
				float3 VertexPosOtherAxis12_g147 = appendResult14_g147;
				float Angle3_g147 = radians( _CubeMapRotate );
				float3 appendResult113 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal86 = RF_NewObjectNormal484;
				float3 worldNormal86 = float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86));
				float fresnelNdotV80 = dot( normalize( worldNormal86 ), WorldViewDirection );
				float fresnelNode80 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV80 , 0.0001 ), _RefFresnelPower ) );
				float RF_RefFresnelResult84 = ( saturate( (( _RefFresnelInvert )?( fresnelNode80 ):( ( 1.0 - fresnelNode80 ) )) ) * _FresnelSwitch );
				int RF_RefFresnelSwitch87 = _FresnelSwitch;
				float4 temp_cast_9 = (RF_One15).xxxx;
				float4 temp_cast_10 = (RF_One15).xxxx;
				float2 uv_MetallicMap = IN.ase_texcoord8.xyz.xy * _MetallicMap_ST.xy + _MetallicMap_ST.zw;
				float4 temp_output_342_0 = (tex2D( _MetallicMap, uv_MetallicMap )*_MScale + _MOffset);
				float4 RF_MetallicResult322 = (( _MetallicToggle )?( ( _Metallic * (( _MetallicInvert )?( saturate( ( 1.0 - temp_output_342_0 ) ) ):( temp_output_342_0 )) ) ):( temp_cast_10 ));
				float4 RF_Reflect107 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g147 + ( VertexPosOtherAxis12_g147 * cos( Angle3_g147 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g147 ) * sin( Angle3_g147 ) ) ) + appendResult113 ) ) * _ReflectColor ) * ( 1.0 - RF_RefFresnelResult84 ) * ( ( _ReflectionMultiplier * RF_RefFresnelSwitch87 ) + RF_One15 ) * (( _AffectAO )?( RF_AbsoluteAO242 ):( temp_cast_9 )) * RF_MetallicResult322 ) ):( temp_cast_8 ));
				float4 temp_cast_11 = (RF_Zero16).xxxx;
				float2 uv_EmissionMap = IN.ase_texcoord8.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float4 tex2DNode134 = tex2D( _EmissionMap, uv_EmissionMap );
				float4 temp_output_144_0 = ( 1.0 - tex2DNode134 );
				float4 RF_EmissionResult137 = (( _EmissionToggle )?( ( _EmissionColor * (( _EmissionInvert )?( temp_output_144_0 ):( tex2DNode134 )) * ( _EmissionIntensity * _EmissionMultiplier ) ) ):( temp_cast_11 ));
				float4 temp_cast_12 = (RF_Zero16).xxxx;
				float ifLocalVar437 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar437 = _SpecularOut;
				else
				ifLocalVar437 = _SpecularIn;
				float3 temp_cast_13 = (ifLocalVar437).xxx;
				float3 temp_cast_14 = (_SpecularOut).xxx;
				float ifLocalVar415 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar415 = _SpecMax;
				else
				ifLocalVar415 = _SpecMin;
				float3 temp_cast_15 = ((0)).xxx;
				float3 tanNormal408 = temp_cast_15;
				float3 worldNormal408 = normalize( float3(dot(tanToWorld0,tanNormal408), dot(tanToWorld1,tanNormal408), dot(tanToWorld2,tanNormal408)) );
				float3 normalizeResult401 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float dotResult405 = dot( ( worldNormal408 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult401 );
				float RF_LightNormal410 = dotResult405;
				float saferPower412 = abs( RF_LightNormal410 );
				float smoothstepResult417 = smoothstep( ifLocalVar415 , _SpecMax , pow( saferPower412 , _BGloss ));
				float temp_output_2_0_g149 = smoothstepResult417;
				float temp_output_419_0 = saturate( ( temp_output_2_0_g149 * temp_output_2_0_g149 ) );
				float3 temp_cast_16 = (temp_output_419_0).xxx;
				float3 temp_cast_17 = (temp_output_419_0).xxx;
				float3 gammaToLinear420 = Gamma22ToLinear( temp_cast_17 );
				float3 temp_cast_18 = (temp_output_419_0).xxx;
				float3 temp_cast_19 = (temp_output_419_0).xxx;
				float3 temp_cast_20 = (temp_output_419_0).xxx;
				float3 linearToGamma421 = LinearToGamma22( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_419_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch422 = gammaToLinear420;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch422 = temp_cast_18;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch422 = linearToGamma421;
				#else
				float3 staticSwitch422 = gammaToLinear420;
				#endif
				float3 smoothstepResult436 = smoothstep( temp_cast_13 , temp_cast_14 , ( 1.0 - sqrt( staticSwitch422 ) ));
				float3 saferPower435 = abs( smoothstepResult436 );
				float3 temp_cast_22 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_23 = (0.0).xxx;
				float3 temp_cast_24 = (_SpecularSaturation).xxx;
				float3 clampResult447 = clamp( ( 1.0 - pow( saferPower435 , temp_cast_22 ) ) , temp_cast_23 , temp_cast_24 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 uv_SpecularMap = IN.ase_texcoord8.xyz.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode427 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_27 = (RF_One15).xxxx;
				float4 temp_cast_28 = (RF_One15).xxxx;
				float4 RF_Specular452 = (( _SpecularSwitch )?( ( ( float4( clampResult447 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode427 ) ):( tex2DNode427 )) * (( _AffectAO_Spec )?( RF_AbsoluteAO242 ):( temp_cast_27 )) * (( _AffectMetallic )?( RF_MetallicResult322 ):( temp_cast_28 )) ) * _SpecularIntensity ) ):( temp_cast_12 ));
				float4 temp_output_116_0 = ( RF_RimLightResult66 + saturate( RF_Reflect107 ) + RF_EmissionResult137 + RF_Specular452 );
				float4 RF_FinalEmission486 = (( _AverageCalc )?( ( temp_output_116_0 / float4( 0,0,0,0 ) ) ):( temp_output_116_0 ));
				
				float4 temp_cast_31 = (RF_Zero16).xxxx;
				float2 uv_RougnessMap = IN.ase_texcoord8.xyz.xy * _RougnessMap_ST.xy + _RougnessMap_ST.zw;
				float4 tex2DNode330 = tex2D( _RougnessMap, uv_RougnessMap );
				float4 RF_SmoothnessResult334 = (( _SmoothnessToggle )?( ( (( _SmoothnessInvert )?( ( 1.0 - tex2DNode330 ) ):( tex2DNode330 )) * _Smoothness ) ):( temp_cast_31 ));
				
				int RF_AOToggle233 = _AOToggle;
				float4 RF_AOResult154 = ( temp_output_161_0 + ( 1.0 - RF_AOToggle233 ) );
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float3 Normal = RF_NewObjectNormal484;
				float3 Emission = RF_FinalEmission486.rgb;
				float3 Specular = 0.5;
				float Metallic = RF_MetallicResult322.r;
				float Smoothness = RF_SmoothnessResult334.r;
				float Occlusion = RF_AOResult154.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
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

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

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

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissionMap_ST;
			float4 _MetallicMap_ST;
			float4 _RimLightColor;
			float4 _SpecularMap_ST;
			float4 _BaseColor;
			float4 _EmissionColor;
			float4 _ReflectColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _RougnessMap_ST;
			float3 _SpecColor;
			float _RefFresnelBias;
			float _MOffset;
			float _MScale;
			float _MetallicInvert;
			float _Metallic;
			float _MetallicToggle;
			float _AffectAO;
			float _RefFresnelInvert;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _EmissionToggle;
			float _RefFresnelScale;
			float _CMZPos;
			float _RefFresnelPower;
			int _SpecToggle;
			float _CMYPos;
			float _SmoothnessInvert;
			float _SmoothnessToggle;
			float _SpecularIntensity;
			float _AffectMetallic;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _EmissionInvert;
			float _CMXPos;
			float _ReflectionStrength;
			float _Smoothness;
			float _NTileY;
			float _NTileX;
			float _TriplanarNMap;
			float _Normal;
			float _SSBluricTransparent;
			float _FallOff;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _FresnelFold;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _SpecularExtras;
			float _NOffsetX;
			float _NOffsetY;
			float _NormalScale;
			float _NormalMultiplier;
			float _Reflect;
			float _AOIntensity;
			float _AffectAO_Rim;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _RimLightScale;
			float _RimLightBias;
			float _CubeMapRotate;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSOffY;
			float _SSOffX;
			float _SSTileY;
			float _SSTileX;
			float _SSSize;
			float _NFallOff;
			float _AverageCalc;
			int _AOToggle;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "BSurfaceMetallicEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19600
Node;AmplifyShaderEditor.CommentaryNode;243;-1536,-1920;Inherit;False;1239.333;402.6667;Emission Final Comp ;9;489;488;486;187;142;115;70;366;116;Emission Final Comp ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-2272,-848;Inherit;False;703.6443;719.4359;Local Vars;16;398;397;225;230;233;226;224;221;12;13;14;218;17;16;15;217;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-4240,-2512;Inherit;False;1637.623;622.979;Base Settings;16;277;288;285;283;284;286;287;282;280;19;281;274;23;22;21;20;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;26;-3056,-2928;Inherit;False;676.8701;328.0168;Normal Light Direction;4;35;40;42;41;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;27;-3056,-3280;Inherit;False;632.0288;320.7563;Normal View Direction;4;39;37;36;38;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;57;-5888,-848;Inherit;False;1883.602;766.88;Fresnel Settings;20;69;66;63;65;72;71;73;64;74;68;61;60;59;67;62;58;229;271;272;273;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;75;-5888,-48;Inherit;False;1859.299;773.7678;Fresnel Settings;14;87;84;83;81;228;82;79;78;77;117;86;85;80;76;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;88;-4000,-48;Inherit;False;2316.879;992.8001;Reflection Map;29;236;240;102;98;99;106;107;97;96;114;103;101;104;105;90;91;94;100;92;108;110;111;109;93;113;112;95;89;358;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;133;-3968,-848;Inherit;False;1664.324;717.2957;Emission Settings;17;313;312;311;310;305;144;143;137;139;140;136;135;134;141;367;368;369;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;150;-4496,1344;Inherit;False;945.1326;426.7336;AO Settings;9;154;152;235;234;161;151;162;241;242;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;244;-5872,-2576;Inherit;False;1614.521;695.5657;Screen Space Bump Map Settings;19;263;262;261;260;259;258;257;256;255;254;253;252;251;250;249;248;247;246;245;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;316;-5888,752;Inherit;False;1685.545;563.3906;Metallic Settings;13;322;324;325;317;318;321;320;355;343;344;342;319;357;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;329;-5888,1344;Inherit;False;1373.765;361.0161;Smoothness Settings;8;337;330;332;331;335;340;362;334;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;399;-2576,-2544;Inherit;False;1019;653.2667;Light Specular Direction;11;410;409;408;407;406;405;404;403;402;401;400;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;411;-5872,-1856;Inherit;False;3867.9;982.1675;Specular Setup;41;454;443;445;439;438;437;416;417;412;433;453;450;449;431;452;434;423;451;448;447;446;441;440;436;435;432;430;429;428;427;426;425;424;422;421;420;419;418;415;414;413;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;455;-5872,-3376;Inherit;False;2794.22;774.9243;Normals;30;485;484;483;482;481;480;479;478;477;476;475;474;473;472;471;470;469;468;467;466;465;464;463;462;461;460;459;458;457;456;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;58;-5632,-544;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;62;-5312,-576;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;67;-5024,-496;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-5632,-336;Inherit;False;Property;_RimLightBias;Rim Light Bias;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-5632,-256;Inherit;False;Property;_RimLightScale;Rim Light Scale;10;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-5632,-176;Inherit;False;Property;_RimLightPower;Rim Light Power;11;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;68;-5632,-768;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RadiansOpNode;89;-3664,272;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector;95;-3744,32;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;112;-3536,432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;113;-3392,384;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-4560,-608;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-4400,-608;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;INT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;76;-5632,256;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;80;-5312,224;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;85;-5024,304;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;86;-5632,32;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;64;-4800,-576;Inherit;False;Property;_RimLightInvert;Rim Light Invert;8;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-5856,-768;Inherit;False;484;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;217;-2240,-544;Inherit;False;Property;_SpecToggle;SpecToggle;44;0;Create;True;0;0;0;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-2224,-640;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-2224,-720;Inherit;False;Constant;_Zero;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-2224,-800;Inherit;False;Constant;_One;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-3936,272;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;17;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-3808,352;Inherit;False;Property;_CMXPos;CM X Pos;20;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-3808,432;Inherit;False;Property;_CMYPos;CM Y Pos;18;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-3808,512;Inherit;False;Property;_CMZPos;CM Z Pos;21;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-5632,464;Inherit;False;Property;_RefFresnelBias;RefFresnelBias;27;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-5632,544;Inherit;False;Property;_RefFresnelScale;RefFresnelScale;29;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-5632,624;Inherit;False;Property;_RefFresnelPower;RefFresnelPower;30;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;82;-4848,224;Inherit;False;Property;_RefFresnelInvert;Ref Fresnel Invert;26;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;228;-4624,224;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;81;-4656,336;Inherit;False;Property;_FresnelSwitch;Fresnel Switch;24;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-4464,224;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;221;-2240,-368;Inherit;False;Property;_SpecularExtras;SpecularExtras;45;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;224;-2240,-288;Inherit;False;Property;_CubeMapExtras;CubeMapExtras;48;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;226;-2064,-288;Inherit;False;Property;_RefFresnelSwitch;RefFresnelSwitch;50;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;230;-2240,-448;Inherit;False;Property;_AOToggle;AOToggle;47;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;-2720,80;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;91;-3232,80;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;90;-3488,80;Inherit;False;BUDUComputeRotationY;-1;;147;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;105;-2736,320;Inherit;False;84;RF_RefFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-2688,400;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;101;-2960,272;Inherit;False;Property;_ReflectColor;Reflect Color;15;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;103;-2992,448;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;14;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;114;-2928,528;Inherit;False;87;RF_RefFresnelSwitch;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;96;-2304,80;Inherit;False;6;6;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-2368,0;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;106;-2160,48;Inherit;False;Property;_Reflect;Reflect;12;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;99;-2512,432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;98;-2528,304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;271;-4848,-160;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;-4848,-240;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;229;-4768,-352;Inherit;False;23;RF_BaseTexture;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;162;-4192,1392;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;235;-4208,1680;Inherit;False;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;161;-4016,1472;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;241;-3888,1472;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;136;-2944,-688;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;-2976,-768;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;139;-2768,-736;Inherit;False;Property;_EmissionToggle;Emission Toggle;40;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;143;-3184,-560;Inherit;False;Property;_EmissionInvert;Emission Invert;42;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;144;-3648,-480;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;225;-2064,-368;Inherit;False;Property;_FresnelFold;FresnelFold;46;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-3520,-416;Inherit;False;Constant;_EOldMin;E Old Min;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-3520,-352;Inherit;False;Constant;_EOldMax;E Old Max;75;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-3520,-288;Inherit;False;Constant;_ENewMin;E New Min;75;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-3552,-224;Inherit;False;Constant;_ENewMax;E New Max;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;342;-5552,976;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;4;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;355;-5168,1040;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;320;-5328,1040;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;317;-4800,912;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-4864,-448;Inherit;False;Property;_RimLightIntensity;Rim Light Intensity;6;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;272;-4640,-240;Inherit;False;Property;_AffectAO_Rim;AffectAO_Rim;71;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;63;-4560,-464;Inherit;False;Property;_RimSwitch;RimSwitch;5;1;[Enum];Create;True;0;2;Rim On;1;Rim Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;94;-3024,80;Inherit;True;Property;_ReflectMap;Reflect Map;16;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;100;-2768,0;Inherit;False;Property;_ReflectionStrength;Reflection Strength;13;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;368;-3408,-640;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;367;-3696,-608;Inherit;False;Property;_EmissionMultiplier;Emission Multiplier;91;0;Create;True;0;0;0;True;0;False;1;1;1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-3696,-688;Inherit;False;Property;_EmissionIntensity;Emission Intensity;41;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;305;-3376,-432;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;369;-3184,-416;Inherit;False;150;100;New Note;;1,1,1,1;Farklı bir negatif için Remap'e bak;0;0
Node;AmplifyShaderEditor.SamplerNode;319;-5856,960;Inherit;True;Property;_MetallicMap;Metallic Map;39;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;71;-4800,-768;Inherit;False;Property;_RimLightColor;Rim Light Color;7;0;Create;True;0;0;0;False;0;False;0.5220125,0.5220125,0.5220125,0;0.5597484,0.5597484,0.5597484,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;135;-3264,-784;Inherit;False;Property;_EmissionColor;Emission Color;1;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5019608,0.5019608,0.5019608,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;134;-3952,-544;Inherit;True;Property;_EmissionMap;Emission Map;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;318;-5088,896;Inherit;False;Property;_Metallic;Metallic;35;0;Create;True;0;0;0;True;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;321;-5024,976;Inherit;False;Property;_MetallicInvert;Metallic Invert;49;0;Create;False;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;343;-5712,1152;Inherit;False;Property;_MScale;M Scale;89;0;Create;True;0;0;0;True;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-5712,1232;Inherit;False;Property;_MOffset;M Offset;90;0;Create;True;0;0;0;True;0;False;0;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-4480,1392;Inherit;False;Property;_AOIntensity;AOIntensity;36;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;151;-4336,1472;Inherit;True;Property;_AmbientOcclusionMap;Ambient Occlusion Map;37;0;Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;234;-4400,1680;Inherit;False;233;RF_AOToggle;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;413;-5840,-1600;Inherit;False;Property;_SpecMin;SpecMin;59;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;414;-5840,-1504;Inherit;False;Property;_SpecMax;SpecMax;56;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;415;-5552,-1600;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;418;-5168,-1760;Inherit;False;Square;-1;;149;fea980a1f68019543b2cd91d506986e8;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;419;-5008,-1760;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;420;-4848,-1792;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;421;-4848,-1680;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;422;-4624,-1760;Inherit;False;Property;_SpecType;SpecType;63;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;424;-2608,-1584;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;425;-2768,-1584;Inherit;False;6;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;426;-2896,-1392;Inherit;False;Property;_SpecularIntensity;Specular Intensity;28;0;Create;True;0;0;0;False;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;427;-3568,-1344;Inherit;True;Property;_SpecularMap;Specular Map;33;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;428;-3280,-1232;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;429;-3120,-1280;Inherit;False;Property;_SpecularInvert;SpecularInvert;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;430;-3088,-1424;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;432;-3312,-1136;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;435;-3376,-1792;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.56;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;436;-3792,-1792;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;440;-4272,-1792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SqrtOpNode;441;-4400,-1792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;446;-3216,-1792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;447;-3056,-1792;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.347,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;448;-3408,-1600;Inherit;False;Property;_SpecularSaturation;Specular Saturation;25;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;451;-2640,-1680;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;423;-2448,-1648;Inherit;False;Property;_SpecularSwitch;Specular Switch;32;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;434;-3120,-1632;Inherit;False;Property;_SpecColor;Spec Color;31;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;452;-2224,-1648;Inherit;False;RF_Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;240;-2528,544;Inherit;False;Property;_AffectAO;AffectAO;51;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;102;-2704,512;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;236;-2704,608;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;431;-3120,-1136;Inherit;False;Property;_AffectAO_Spec;AffectAO_Spec;68;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;449;-3344,-1680;Inherit;False;Constant;_SpecularAmbient;Specular Ambient;31;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;450;-5776,-1792;Inherit;False;410;RF_LightNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;453;-3120,-1008;Inherit;False;Property;_AffectMetallic;AffectMetallic;69;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;433;-3312,-1056;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;412;-5520,-1760;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;417;-5360,-1760;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;416;-5840,-1696;Inherit;False;Property;_BGloss;BGloss;22;0;Create;True;0;0;0;False;0;False;1;25;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;437;-4080,-1680;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;438;-4400,-1680;Inherit;False;Property;_SpecularIn;Specular In;23;0;Create;True;0;0;0;True;0;False;0.2;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;439;-4400,-1584;Inherit;False;Property;_SpecularOut;Specular Out;19;0;Create;True;0;0;0;True;0;False;0.8;0.1;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;445;-3888,-1632;Inherit;False;Property;_Softness;Softness;34;0;Create;True;0;0;0;False;0;False;0.001;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;443;-3600,-1632;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0.01;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;454;-3344,-960;Inherit;False;322;RF_MetallicResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;245;-5408,-2064;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;246;-5680,-2064;Inherit;False;Property;_PatternRotator;PatternRotator;57;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-5232,-2064;Inherit;False;Property;_PatternHeight;PatternHeight;55;0;Create;True;0;0;0;False;0;False;0.1;0.1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;249;-4960,-2064;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;250;-5008,-2224;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-5184,-2224;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;252;-5440,-2432;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;253;-5760,-2512;Inherit;False;Property;_SSTileX;SSTileX;58;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-5760,-2448;Inherit;False;Property;_SSTileY;SSTileY;60;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;255;-5760,-2384;Inherit;False;Property;_SSOffX;SSOffX;61;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;256;-5760,-2320;Inherit;False;Property;_SSOffY;SSOffY;64;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;257;-5600,-2368;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;258;-5600,-2480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;259;-4768,-2224;Inherit;True;Property;_BluricRefractionPattern;Bluric Refraction Pattern;53;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;ae0130e6c3e94ee43b67fef77b52e0e9;ae0130e6c3e94ee43b67fef77b52e0e9;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;260;-5440,-2240;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;261;-5856,-2240;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;262;-5664,-2240;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;263;-5376,-2160;Inherit;False;Property;_SSSize;SSSize;54;0;Create;True;0;0;0;False;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-3264,-2400;Inherit;False;Property;_BaseColor;Base Color;0;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-3040,-2400;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TriplanarNode;274;-3648,-2160;Inherit;True;Spherical;Object;False;TriplanarTexture;_TriplanarTexture;white;0;None;Mid Texture 0;_MidTexture0;white;1;None;Bot Texture 0;_BotTexture0;white;0;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;2,2;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;19;-3616,-2352;Inherit;True;Property;_BaseMapOld;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode;282;-3888,-2384;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;287;-4208,-2192;Inherit;False;Property;_OffsetY;OffsetY;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;286;-4208,-2272;Inherit;False;Property;_OffsetX;OffsetX;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;284;-4208,-2368;Inherit;False;Property;_TileY;TileY;86;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-4208,-2448;Inherit;False;Property;_TileX;TileX;80;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;285;-4048,-2432;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;288;-4048,-2240;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;277;-3936,-2000;Inherit;False;Property;_FallOff;FallOff;74;0;Create;True;0;0;0;False;0;False;1;1;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;281;-3264,-2208;Inherit;False;Property;_TriplanarMap;TriplanarMap;78;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexturePropertyNode;280;-3888,-2208;Inherit;True;Property;_BaseMap;Base Map;76;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DotProductOpNode;41;-2768,-2864;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-2960,-2864;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;40;-3024,-2768;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;38;-2816,-3232;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;-3008,-3232;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;37;-3008,-3136;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;400;-2080,-2304;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;401;-2080,-2144;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;402;-2208,-2144;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;405;-1920,-2176;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;406;-2272,-2480;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.75;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;408;-2272,-2304;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;410;-1792,-2176;Inherit;False;RF_LightNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;404;-2528,-2048;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;403;-2464,-2208;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;409;-2560,-2480;Inherit;False;Property;_SpecularNormalIntensity;SpecularNormalIntensity;66;0;Create;True;0;0;0;False;0;False;0.3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;407;-2496,-2304;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;362;-5168,1392;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;340;-5008,1472;Inherit;False;Property;_SmoothnessToggle;Smoothness Toggle;88;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;335;-5168,1472;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;331;-5568,1536;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;332;-5424,1472;Inherit;False;Property;_SmoothnessInvert;Smoothness Invert;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;330;-5856,1472;Inherit;True;Property;_RougnessMap;Rougness Map;62;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;337;-5440,1616;Inherit;False;Property;_Smoothness;Smoothness;43;0;Create;False;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;456;-5408,-2688;Inherit;False;Property;_NFallOff;NFallOff;70;0;Create;True;0;0;0;False;0;False;1;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;458;-5520,-3264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;459;-5680,-3120;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;462;-5680,-2928;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;465;-5520,-3072;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;466;-5808,-3232;Inherit;False;Property;_NormalMultiplier;NormalMultiplier;84;0;Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;467;-5504,-2816;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;4,4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;468;-4976,-3200;Inherit;True;Property;_BaseMapOld1;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.UnpackScaleNormalNode;469;-4672,-2832;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;470;-4192,-3040;Inherit;False;Property;_Normal;Normal;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;471;-3968,-2976;Inherit;False;1;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;473;-4192,-2928;Inherit;False;248;RF_BumpForSmooth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;474;-4448,-3072;Inherit;False;Normal Reconstruct Z;-1;;151;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;476;-3504,-3152;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;477;-4464,-2864;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;478;-4128,-2848;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;479;-4256,-2816;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;480;-4416,-2816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;483;-3312,-3152;Float;False;RF_NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;485;-5360,-3312;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;472;-3744,-3040;Inherit;False;Property;_SSBluricTransparent;SS Bluric Transparent;65;0;Create;False;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;457;-5808,-3312;Float;False;Property;_NormalScale;Normal Scale;4;0;Create;True;0;0;0;True;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-5840,-3136;Inherit;False;Property;_NTileX;NTileX;77;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;-5840,-3056;Inherit;False;Property;_NTileY;NTileY;83;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;463;-5840,-2960;Inherit;False;Property;_NOffsetX;NOffsetX;79;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;464;-5840,-2880;Inherit;False;Property;_NOffsetY;NOffsetY;81;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;481;-5040,-2832;Inherit;True;Spherical;Object;False;Top Texture 0;_TopTexture0;white;0;None;Mid Texture 1;_MidTexture1;white;1;None;Bot Texture 1;_BotTexture1;white;0;None;Triplanar Sampler;World;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;2,2;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;482;-5296,-2976;Inherit;True;Property;_NormalMap;NormalMap;73;2;[NoScaleOffset];[Normal];Create;True;0;0;0;True;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ToggleSwitchNode;475;-4416,-2976;Inherit;False;Property;_TriplanarNMap;TriplanarNMap;75;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;484;-3312,-2928;Inherit;False;RF_NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;117;-5856,32;Inherit;False;484;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;358;-2528,704;Inherit;False;322;RF_MetallicResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;324;-4624,912;Inherit;False;Property;_MetallicToggle;MetallicToggle;87;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;325;-4832,832;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-3984,32;Inherit;True;484;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;242;-3760,1600;Inherit;False;RF_AbsoluteAO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;154;-3760,1472;Inherit;False;RF_AOResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;334;-4768,1472;Inherit;False;RF_SmoothnessResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;322;-4416,912;Inherit;False;RF_MetallicResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;357;-4688,1072;Inherit;False;RF_Metallic;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-4304,336;Inherit;False;RF_RefFresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;84;-4304,224;Inherit;False;RF_RefFresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;107;-1952,48;Inherit;False;RF_Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;233;-2064,-448;Inherit;False;RF_AOToggle;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;218;-2064,-544;Inherit;False;RF_SpecToggleRef;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-2064,-640;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-2064,-720;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-2064,-800;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;-2544,-736;Inherit;False;RF_EmissionResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-2832,-2400;Inherit;True;RF_MainDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-2832,-2176;Inherit;True;RF_BaseTexture;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;248;-4480,-2224;Inherit;False;RF_BumpForSmooth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-2688,-3232;Float;False;RF_NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-2640,-2864;Float;False;RF_NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-4240,-608;Inherit;False;RF_RimLightResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;69;-4240,-464;Inherit;False;RF_RimLightSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;116;-1088,-1792;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;366;-1248,-1776;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;70;-1504,-1856;Inherit;False;66;RF_RimLightResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;115;-1440,-1776;Inherit;False;107;RF_Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;142;-1504,-1696;Inherit;False;137;RF_EmissionResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-1440,-1616;Inherit;False;452;RF_Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-992,-1328;Inherit;False;484;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;487;-960,-1248;Inherit;False;486;RF_FinalEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;314;-960,-1168;Inherit;False;322;RF_MetallicResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;486;-528,-1792;Inherit;False;RF_FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;488;-752,-1792;Inherit;False;Property;_AverageCalc;AverageCalc;92;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;489;-928,-1712;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;-960,-1408;Inherit;False;22;RF_MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;219;-992,-1088;Inherit;False;334;RF_SmoothnessResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-960,-1008;Inherit;False;154;RF_AOResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;397;-1792,-800;Inherit;False;Property;_CheckDef;CheckDef;67;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;398;-1808,-720;Inherit;False;Property;_CheckBase;CheckBase;72;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;-656,-1312;Float;False;True;-1;2;BSurfaceMetallicEditor;0;19;BUDU Shaders/BSurfaceMetallic;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;0;638531408731002507;Workflow;1;638531408747533712;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_TransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_TRStrength;0;  Normal Distortion;0.5,True,_TRNormDist;0;  Scattering;2,True,_TRScattering;0;  Direct;0.9,True,_TRDirec;0;  Ambient;0.1,True,_TRAmbient;0;  Shadow;0.5,True,_TRShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
WireConnection;62;0;68;0
WireConnection;62;4;58;0
WireConnection;62;1;59;0
WireConnection;62;2;60;0
WireConnection;62;3;61;0
WireConnection;67;0;62;0
WireConnection;68;0;74;0
WireConnection;89;0;93;0
WireConnection;95;0;108;0
WireConnection;112;0;111;0
WireConnection;113;0;109;0
WireConnection;113;1;112;0
WireConnection;113;2;110;0
WireConnection;72;0;71;0
WireConnection;72;1;64;0
WireConnection;72;2;73;0
WireConnection;72;3;229;0
WireConnection;65;0;72;0
WireConnection;65;1;63;0
WireConnection;65;2;272;0
WireConnection;80;0;86;0
WireConnection;80;4;76;0
WireConnection;80;1;77;0
WireConnection;80;2;78;0
WireConnection;80;3;79;0
WireConnection;85;0;80;0
WireConnection;86;0;117;0
WireConnection;64;0;62;0
WireConnection;64;1;67;0
WireConnection;82;0;85;0
WireConnection;82;1;80;0
WireConnection;228;0;82;0
WireConnection;83;0;228;0
WireConnection;83;1;81;0
WireConnection;92;0;94;0
WireConnection;92;1;101;0
WireConnection;91;0;90;0
WireConnection;91;1;113;0
WireConnection;90;4;95;0
WireConnection;90;2;89;0
WireConnection;104;0;103;0
WireConnection;104;1;114;0
WireConnection;96;0;100;0
WireConnection;96;1;92;0
WireConnection;96;2;98;0
WireConnection;96;3;99;0
WireConnection;96;4;240;0
WireConnection;96;5;358;0
WireConnection;106;0;97;0
WireConnection;106;1;96;0
WireConnection;99;0;104;0
WireConnection;99;1;102;0
WireConnection;98;0;105;0
WireConnection;162;0;152;0
WireConnection;235;0;234;0
WireConnection;161;0;162;0
WireConnection;161;1;151;0
WireConnection;241;0;161;0
WireConnection;241;1;235;0
WireConnection;136;0;135;0
WireConnection;136;1;143;0
WireConnection;136;2;368;0
WireConnection;139;0;140;0
WireConnection;139;1;136;0
WireConnection;143;0;134;0
WireConnection;143;1;144;0
WireConnection;144;0;134;0
WireConnection;342;0;319;0
WireConnection;342;1;343;0
WireConnection;342;2;344;0
WireConnection;355;0;320;0
WireConnection;320;0;342;0
WireConnection;317;0;318;0
WireConnection;317;1;321;0
WireConnection;272;0;273;0
WireConnection;272;1;271;0
WireConnection;94;1;91;0
WireConnection;368;0;141;0
WireConnection;368;1;367;0
WireConnection;305;0;144;0
WireConnection;305;1;310;0
WireConnection;305;2;311;0
WireConnection;305;3;312;0
WireConnection;305;4;313;0
WireConnection;321;0;342;0
WireConnection;321;1;355;0
WireConnection;415;0;413;0
WireConnection;415;1;414;0
WireConnection;415;2;414;0
WireConnection;415;3;414;0
WireConnection;415;4;413;0
WireConnection;418;2;417;0
WireConnection;419;0;418;0
WireConnection;420;0;419;0
WireConnection;421;0;419;0
WireConnection;422;1;420;0
WireConnection;422;0;419;0
WireConnection;422;2;421;0
WireConnection;424;0;425;0
WireConnection;424;1;426;0
WireConnection;425;0;447;0
WireConnection;425;1;434;0
WireConnection;425;2;430;0
WireConnection;425;3;429;0
WireConnection;425;4;431;0
WireConnection;425;5;453;0
WireConnection;428;0;427;0
WireConnection;429;0;427;0
WireConnection;429;1;428;0
WireConnection;435;0;436;0
WireConnection;435;1;443;0
WireConnection;436;0;440;0
WireConnection;436;1;437;0
WireConnection;436;2;439;0
WireConnection;440;0;441;0
WireConnection;441;0;422;0
WireConnection;446;0;435;0
WireConnection;447;0;446;0
WireConnection;447;1;449;0
WireConnection;447;2;448;0
WireConnection;423;0;451;0
WireConnection;423;1;424;0
WireConnection;452;0;423;0
WireConnection;240;0;102;0
WireConnection;240;1;236;0
WireConnection;431;0;432;0
WireConnection;431;1;433;0
WireConnection;453;0;432;0
WireConnection;453;1;454;0
WireConnection;412;0;450;0
WireConnection;412;1;416;0
WireConnection;417;0;412;0
WireConnection;417;1;415;0
WireConnection;417;2;414;0
WireConnection;437;0;438;0
WireConnection;437;1;439;0
WireConnection;437;2;439;0
WireConnection;437;3;439;0
WireConnection;437;4;438;0
WireConnection;443;0;445;0
WireConnection;245;0;246;0
WireConnection;249;0;247;0
WireConnection;250;0;251;0
WireConnection;250;2;245;0
WireConnection;251;0;260;0
WireConnection;251;1;263;0
WireConnection;251;2;252;0
WireConnection;252;0;258;0
WireConnection;252;1;257;0
WireConnection;257;0;255;0
WireConnection;257;1;256;0
WireConnection;258;0;253;0
WireConnection;258;1;254;0
WireConnection;259;1;250;0
WireConnection;259;5;249;0
WireConnection;260;0;262;0
WireConnection;262;0;261;0
WireConnection;21;0;20;0
WireConnection;21;1;281;0
WireConnection;274;0;280;0
WireConnection;274;3;285;0
WireConnection;274;4;277;0
WireConnection;19;0;280;0
WireConnection;19;1;282;0
WireConnection;282;0;285;0
WireConnection;282;1;288;0
WireConnection;285;0;283;0
WireConnection;285;1;284;0
WireConnection;288;0;286;0
WireConnection;288;1;287;0
WireConnection;281;0;19;0
WireConnection;281;1;274;0
WireConnection;41;0;42;0
WireConnection;41;1;40;0
WireConnection;38;0;36;0
WireConnection;38;1;37;0
WireConnection;400;0;408;0
WireConnection;400;1;406;0
WireConnection;401;0;402;0
WireConnection;402;0;403;0
WireConnection;402;1;404;0
WireConnection;405;0;400;0
WireConnection;405;1;401;0
WireConnection;406;0;409;0
WireConnection;408;0;407;0
WireConnection;410;0;405;0
WireConnection;340;0;362;0
WireConnection;340;1;335;0
WireConnection;335;0;332;0
WireConnection;335;1;337;0
WireConnection;331;0;330;0
WireConnection;332;0;330;0
WireConnection;332;1;331;0
WireConnection;458;0;457;0
WireConnection;458;1;466;0
WireConnection;459;0;460;0
WireConnection;459;1;461;0
WireConnection;462;0;463;0
WireConnection;462;1;464;0
WireConnection;465;0;459;0
WireConnection;465;1;462;0
WireConnection;467;0;459;0
WireConnection;468;0;482;0
WireConnection;468;1;465;0
WireConnection;468;5;458;0
WireConnection;469;0;481;0
WireConnection;469;1;485;0
WireConnection;470;0;474;0
WireConnection;470;1;475;0
WireConnection;471;0;470;0
WireConnection;471;1;473;0
WireConnection;476;0;472;0
WireConnection;477;0;478;0
WireConnection;478;0;479;0
WireConnection;479;0;480;0
WireConnection;479;1;469;2
WireConnection;479;2;469;3
WireConnection;480;0;469;1
WireConnection;483;0;476;0
WireConnection;485;0;458;0
WireConnection;472;0;470;0
WireConnection;472;1;471;0
WireConnection;481;0;482;0
WireConnection;481;3;467;0
WireConnection;481;4;456;0
WireConnection;475;0;468;0
WireConnection;475;1;477;0
WireConnection;484;0;472;0
WireConnection;324;0;325;0
WireConnection;324;1;317;0
WireConnection;242;0;161;0
WireConnection;154;0;241;0
WireConnection;334;0;340;0
WireConnection;322;0;324;0
WireConnection;357;0;321;0
WireConnection;87;0;81;0
WireConnection;84;0;83;0
WireConnection;107;0;106;0
WireConnection;233;0;230;0
WireConnection;218;0;217;0
WireConnection;17;0;14;0
WireConnection;16;0;13;0
WireConnection;15;0;12;0
WireConnection;137;0;139;0
WireConnection;22;0;21;0
WireConnection;23;0;281;0
WireConnection;248;0;259;0
WireConnection;39;0;38;0
WireConnection;35;0;41;0
WireConnection;66;0;65;0
WireConnection;69;0;63;0
WireConnection;116;0;70;0
WireConnection;116;1;366;0
WireConnection;116;2;142;0
WireConnection;116;3;187;0
WireConnection;366;0;115;0
WireConnection;486;0;488;0
WireConnection;488;0;116;0
WireConnection;488;1;489;0
WireConnection;489;0;116;0
WireConnection;2;0;24;0
WireConnection;2;1;43;0
WireConnection;2;2;487;0
WireConnection;2;3;314;0
WireConnection;2;4;219;0
WireConnection;2;5;158;0
ASEEND*/
//CHKSM=7608381F1B53CD1773B7E74A55C421AD21C63C99
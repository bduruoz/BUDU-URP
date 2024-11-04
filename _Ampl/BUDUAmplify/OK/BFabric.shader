// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders ASE/BFabric"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HDR]_BaseColor("Base Color", Color) = (0.5,0.5,0.5)
		_BaseMap("Base Map", 2D) = "white" {}
		_TextureContrast("Texture Contrast", Range( -1 , 1)) = 0.2
		_TextureAdd("TextureAdd", Range( 0 , 1)) = 0
		[Toggle]_TwoColors("TwoColors", Float) = 0
		[HDR]_SecondColor("Second Color", Color) = (1,1,1)
		[Toggle]_SecondColorTextureSwitch("SecondColorTextureSwitch", Float) = 0
		[Enum(On,1,Off,0)]_VelvetSwitch("VelvetSwitch", Int) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _VelvetType("VelvetType", Float) = 0
		[Toggle]_VelvetInvert("VelvetInvert", Float) = 0
		[HDR]_VelvetIntensity("Velvet Intensity", Range( 0 , 5)) = 1
		_VelvetBias("VelvetBias", Range( 0 , 1)) = 0
		_VelvetScale("VelvetScale", Range( 0 , 5)) = 5
		_VelvetPower("VelvetPower", Range( 0 , 5)) = 0
		[Header(Shade Settings)]_ShadeColor("Shade Color", Color) = (1,0,0,1)
		[Toggle]_ShadeColorToggle("ShadeColorToggle", Float) = 0
		_ShadingIntensity("Shading Intensity", Range( 0 , 2)) = 1
		_ShadeContrast("Shade Contrast", Range( 0 , 2)) = 2
		_ShadingContrast("Shading Contrast", Range( 0 , 5)) = 1
		_ShadingContribution("Shading Contribution", Range( 0 , 10)) = 1
		_SpecularOut("Specular Out", Range( 0.1 , 1)) = 0.8
		_ShadingOffset("Shading Offset", Range( 0 , 2)) = 0
		_BaseCellOffset("Base Cell Offset", Range( 0 , 1)) = 0
		_BGloss("BGloss", Range( 0 , 5)) = 1
		_BaseCellSharpness("Base Cell Sharpness", Range( 0 , 1)) = 1
		[Toggle]_DefSpecSwitch("DefSpecSwitch", Float) = 0
		_SpecularIn("Specular In", Range( 0 , 2)) = 0.2
		_SpecularIntensity("Specular Intensity", Range( 0 , 2)) = 1
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		_SpecularSaturation("Specular Saturation", Range( 0 , 1)) = 1
		[Toggle]_Normal("Normal", Float) = 1
		_SecSpecularIntensity("SecSpecular Intensity", Range( 0 , 1)) = 1
		[Header(Normal Controls)][Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_NormalScaleMultiplier("Normal Scale Multiplier", Range( 1 , 10)) = 1
		[Toggle]_SatinSwitch("SatinSwitch", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SatinType("SatinType", Float) = 0
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1)
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		[HDR]_SatinColor("Satin Color", Color) = (1,1,1)
		_SpecularMap("Specular Map", 2D) = "white" {}
		_SatinIntensity("Satin Intensity", Range( 0 , 1)) = 0.5
		_SatinContrast("Satin Contrast", Range( -2 , 2)) = 1
		_Softness("Softness", Range( 0 , 3)) = 0.001
		_SatinSmoothing("Satin Smoothing", Range( 0 , 1)) = 0.5
		_SatinLightShade("Satin Light Shade", Range( 0 , 1)) = 0
		[Toggle]_AOSwitch("AOSwitch", Float) = 0
		[Toggle]_SpecularInvert("SpecularInvert", Float) = 0
		[Toggle]_AffectBaseAO("AffectBaseAO", Float) = 0
		_AmbientOcclusionMap("AmbientOcclusionMap", 2D) = "black" {}
		_AmbientOcclusionIntensity("Ambient Occlusion Intensity", Range( 0 , 1)) = 1
		[Toggle]_ThicknessSwitch("ThicknessSwitch", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _ThicknessType("ThicknessType", Float) = 0
		[Toggle]_ThicknessInvert("Thickness Invert", Float) = 0
		_ThicknessIntensity("Thickness Intensity", Range( 0 , 1)) = 0
		_ThickPatternIntensity("Thick Pattern Intensity", Range( 0 , 1)) = 1
		_ThicknessColor("Thickness Color", Color) = (1,1,1)
		_ThicknessMap("Thickness Map", 2D) = "white" {}
		[Toggle]_CurvatureSwitch("Curvature Switch", Float) = 0
		[Toggle]_CurvatureInvert("CurvatureInvert", Float) = 0
		_CurvatureIntensity("Curvature Intensity", Range( 0 , 1)) = 1
		_CurvatureColor("Curvature Color", Color) = (1,1,1)
		_CurvatureMap("Curvature Map", 2D) = "white" {}
		_CurvScale("CurvScale", Float) = 1
		_CurvOffset("CurvOffset", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _BaseMapType("BaseMapType", Float) = 1
		_SpecMax("SpecMax", Range( 0 , 1)) = 1
		[KeywordEnum(Linear,Normal,Gamma)] _AOType("AOType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _CurvType("CurvType", Float) = 0
		_SpecMin("SpecMin", Range( 0 , 1)) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SpecType("SpecType", Float) = 0
		_SpecularNormalIntensity("SpecularNormalIntensity", Range( 0 , 1)) = 0.3
		[Toggle]_AffectAO_Spec("AffectAO_Spec", Float) = 0
		_Opacity("Opacity", Range( 0 , 4)) = 1
		[HideInInspector]_CheckDef("CheckDef", Int) = 0
		[Enum(Opaque,0,Transparent,1,Premultiplied,2,Additive,3)]_BlendingOp("BlendingOp", Int) = 0
		[Toggle]_TransparentSwitch("TransparentSwitch", Float) = 0
		_TransparentMap("Transparent Map", 2D) = "white" {}
		_AdditiveTransparency("Additive Transparency", Range( 0 , 1)) = 0
		[Toggle]_TransparentInvert("Transparent Invert", Float) = 0
		[HideInInspector]_CheckBase("CheckBase", Int) = 0
		_ClipThreshold("Clip Threshold", Range( 0 , 1)) = 0
		_TransContrast("TransContrast", Float) = 1
		_TransOffset("TransOffset", Float) = 0
		[Enum(Back,2,Front,1,Off,0)]_CullOp("CullOp", Int) = 0
		[Enum(On,1,Off,0)]_AlphaCoverage("AlphaCoverage", Int) = 0
		_TwoColSwitch("TwoColSwitch", Int) = 0
		_ShaderExtras("ShaderExtras", Int) = 0
		_SpecularExtras("SpecularExtras", Int) = 0
		[HDR]_SpecularColor("SpecularColor", Color) = (1,1,1,1)
		_SrcBlend("SrcBlend", Float) = 0
		_DstBlend("DstBlend", Float) = 0
		[Toggle]_SatinTransparency("SatinTransparency", Float) = 0
		_SatinMap("SatinMap", 2D) = "white" {}
		[Toggle]_BaseMapInvert("BaseMapInvert", Float) = 0
		_AOOver("AOOver", Range( 0 , 1)) = 0
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

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 0
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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="SimpleLit" }

		Cull [_CullOp]
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask [_TransparentAntialiasing]

		

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
			ZWrite On
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
			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma shader_feature_local _BASEMAPTYPE_LINEAR _BASEMAPTYPE_NORMAL _BASEMAPTYPE_GAMMA
			#pragma shader_feature_local _VELVETTYPE_LINEAR _VELVETTYPE_NORMAL _VELVETTYPE_GAMMA
			#pragma shader_feature_local _AOTYPE_LINEAR _AOTYPE_NORMAL _AOTYPE_GAMMA
			#pragma shader_feature_local _SATINTYPE_LINEAR _SATINTYPE_NORMAL _SATINTYPE_GAMMA
			#pragma shader_feature_local _THICKNESSTYPE_LINEAR _THICKNESSTYPE_NORMAL _THICKNESSTYPE_GAMMA
			#pragma shader_feature_local _CURVTYPE_LINEAR _CURVTYPE_NORMAL _CURVTYPE_GAMMA
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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
			sampler2D _AmbientOcclusionMap;
			sampler2D _TransparentMap;
			sampler2D _SatinMap;
			sampler2D _ThicknessMap;
			sampler2D _CurvatureMap;
			sampler2D _SpecularMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

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

				float2 uv_BaseMap = IN.ase_texcoord8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode27 = tex2D( _BaseMap, uv_BaseMap );
				float3 gammaToLinear370 = FastSRGBToLinear( tex2DNode27.rgb );
				float3 linearToGamma369 = FastLinearToSRGB( tex2DNode27.rgb );
				#if defined( _BASEMAPTYPE_LINEAR )
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#elif defined( _BASEMAPTYPE_NORMAL )
				float4 staticSwitch371 = tex2DNode27;
				#elif defined( _BASEMAPTYPE_GAMMA )
				float4 staticSwitch371 = float4( linearToGamma369 , 0.0 );
				#else
				float4 staticSwitch371 = tex2DNode27;
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( float4( _BaseColor , 0.0 ) * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = normalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 RF_NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal22 = RF_NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), WorldViewDirection );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_11 );
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_14 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_14 );
				float3 temp_cast_15 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_12;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 RF_FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( float4( _SecondColor , 0.0 ) * temp_output_208_0 ) ):( float4( _SecondColor , 0.0 ) )) , float4( RF_FresnelResult20 , 0.0 ));
				float RF_One74 = 1.0;
				float4 temp_cast_18 = (RF_One74).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord8.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 tex2DNode172 = tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap );
				float3 gammaToLinear128 = Gamma22ToLinear( tex2DNode172.rgb );
				float3 linearToGamma130 = LinearToGamma22( tex2DNode172.rgb );
				#if defined( _AOTYPE_LINEAR )
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#elif defined( _AOTYPE_NORMAL )
				float4 staticSwitch376 = tex2DNode172;
				#elif defined( _AOTYPE_GAMMA )
				float4 staticSwitch376 = float4( linearToGamma130 , 0.0 );
				#else
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#endif
				float4 saferPower378 = abs( saturate( ( ( 1.0 - _AmbientOcclusionIntensity ) + staticSwitch376 ) ) );
				float4 temp_cast_27 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 RF_AO219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_27 ) ):( temp_cast_18 ));
				float4 RF_BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float RF_Zero75 = 0.0;
				float4 temp_cast_29 = (RF_Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_31 = (temp_output_151_0).xxx;
				float3 temp_cast_32 = (-temp_output_151_0).xxx;
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 RF_NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , RF_NewNormals83 );
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 temp_cast_34 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_34 );
				float3 temp_cast_35 = (dotResult147).xxx;
				float3 temp_cast_36 = (dotResult147).xxx;
				float3 temp_cast_37 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_37 );
				float3 temp_cast_38 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_35;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_39 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_31 , temp_cast_32 , pow( saferPower136 , temp_cast_39 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_41 = (RF_One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord8.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float RF_SatinSampler464 = dotResult147;
				float2 temp_cast_42 = (RF_SatinSampler464).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( float4( _SatinColor , 0.0 ) * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( TransparentMapRef348 ):( temp_cast_41 )) * tex2D( _SatinMap, temp_cast_42 ) ) ):( temp_cast_29 ));
				float4 temp_cast_43 = (RF_Zero75).xxxx;
				float dotResult96 = dot( RF_NewNormals83 , _MainLightPosition.xyz );
				float RF_NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 RF_BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_46 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * RF_BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -RF_NormalLightDirection90 * RF_BaseTexture98 ) ) , temp_cast_46 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_47 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 RF_ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_47 ) * ase_lightColor ) ):( temp_cast_43 ));
				float4 temp_cast_48 = (RF_Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * RF_BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
				float3 gammaToLinear186 = FastSRGBToLinear( temp_output_222_0.rgb );
				float3 linearToGamma185 = FastLinearToSRGB( temp_output_222_0.rgb );
				#if defined( _THICKNESSTYPE_LINEAR )
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#elif defined( _THICKNESSTYPE_NORMAL )
				float4 staticSwitch184 = temp_output_222_0;
				#elif defined( _THICKNESSTYPE_GAMMA )
				float4 staticSwitch184 = float4( linearToGamma185 , 0.0 );
				#else
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#endif
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( float4( _ThicknessColor , 0.0 ) * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_48 ));
				float4 temp_cast_58 = (RF_Zero75).xxxx;
				float2 uv_CurvatureMap = IN.ase_texcoord8.xy * _CurvatureMap_ST.xy + _CurvatureMap_ST.zw;
				float4 tex2DNode260 = tex2D( _CurvatureMap, uv_CurvatureMap );
				float3 gammaToLinear364 = FastSRGBToLinear( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				float3 linearToGamma363 = FastLinearToSRGB( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				#if defined( _CURVTYPE_LINEAR )
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#elif defined( _CURVTYPE_NORMAL )
				float4 staticSwitch365 = (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 ));
				#elif defined( _CURVTYPE_GAMMA )
				float4 staticSwitch365 = float4( linearToGamma363 , 0.0 );
				#else
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#endif
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * float4( _CurvatureColor , 0.0 ) ) ):( temp_cast_58 ));
				float4 temp_cast_68 = (RF_Zero75).xxxx;
				float ifLocalVar456 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar456 = _SpecularOut;
				else
				ifLocalVar456 = _SpecularIn;
				float3 temp_cast_69 = (ifLocalVar456).xxx;
				float3 temp_cast_70 = (_SpecularOut).xxx;
				float ifLocalVar444 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar444 = _SpecMax;
				else
				ifLocalVar444 = _SpecMin;
				float3 tanNormal422 = RF_NewObjectNormal84;
				float3 worldNormal422 = normalize( float3(dot(tanToWorld0,tanNormal422), dot(tanToWorld1,tanNormal422), dot(tanToWorld2,tanNormal422)) );
				float3 normalizeResult415 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float dotResult419 = dot( ( worldNormal422 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult415 );
				float RF_LightNormal424 = dotResult419;
				float smoothstepResult446 = smoothstep( ifLocalVar444 , _SpecMax , pow( RF_LightNormal424 , _BGloss ));
				float temp_output_2_0_g168 = smoothstepResult446;
				float temp_output_448_0 = saturate( ( temp_output_2_0_g168 * temp_output_2_0_g168 ) );
				float3 temp_cast_71 = (temp_output_448_0).xxx;
				float3 temp_cast_72 = (temp_output_448_0).xxx;
				float3 gammaToLinear449 = Gamma22ToLinear( temp_cast_72 );
				float3 temp_cast_73 = (temp_output_448_0).xxx;
				float3 temp_cast_74 = (temp_output_448_0).xxx;
				float3 temp_cast_75 = (temp_output_448_0).xxx;
				float3 linearToGamma450 = LinearToGamma22( temp_cast_75 );
				float3 temp_cast_76 = (temp_output_448_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch451 = gammaToLinear449;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch451 = temp_cast_73;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch451 = linearToGamma450;
				#else
				float3 staticSwitch451 = gammaToLinear449;
				#endif
				float3 smoothstepResult462 = smoothstep( temp_cast_69 , temp_cast_70 , ( 1.0 - sqrt( staticSwitch451 ) ));
				float3 saferPower461 = abs( smoothstepResult462 );
				float3 temp_cast_77 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_78 = (0.0).xxx;
				float3 temp_cast_79 = (_SpecularSaturation).xxx;
				float3 clampResult436 = clamp( ( 1.0 - pow( saferPower461 , temp_cast_77 ) ) , temp_cast_78 , temp_cast_79 );
				float2 uv_SpecularMap = IN.ase_texcoord8.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode452 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_82 = (RF_One74).xxxx;
				float4 RF_Specular440 = (( _SpecularSwitch )?( ( ( float4( clampResult436 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode452 ) ):( tex2DNode452 )) * (( _AffectAO_Spec )?( RF_AO219 ):( temp_cast_82 )) ) * _SecSpecularIntensity ) ):( temp_cast_68 ));
				float4 RF_FinalEmission467 = ( Satin156 + RF_ShadeColor57 + ThicknessRef201 + CurvatureRef261 + RF_Specular440 );
				
				float4 temp_cast_84 = (RF_Zero75).xxxx;
				float4 RF_DefSpec214 = (( _DefSpecSwitch )?( ( _SpecularColor * _SpecularIntensity ) ):( temp_cast_84 ));
				
				float RF_DefSmooth215 = _Smoothness;
				
				float3 temp_cast_87 = (RF_One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_87 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = RF_BaseDiffuse29.rgb;
				float3 Normal = RF_NewObjectNormal84;
				float3 Emission = RF_FinalEmission467.rgb;
				float3 Specular = RF_DefSpec214.rgb;
				float Metallic = 0;
				float Smoothness = RF_DefSmooth215;
				float Occlusion = RF_AO219.r;
				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"


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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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

			sampler2D _TransparentMap;


			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

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

				float RF_One74 = 1.0;
				float3 temp_cast_0 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord3.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"


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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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

			sampler2D _TransparentMap;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

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

				float RF_One74 = 1.0;
				float3 temp_cast_0 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord3.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;

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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma shader_feature_local _BASEMAPTYPE_LINEAR _BASEMAPTYPE_NORMAL _BASEMAPTYPE_GAMMA
			#pragma shader_feature_local _VELVETTYPE_LINEAR _VELVETTYPE_NORMAL _VELVETTYPE_GAMMA
			#pragma shader_feature_local _AOTYPE_LINEAR _AOTYPE_NORMAL _AOTYPE_GAMMA
			#pragma shader_feature_local _SATINTYPE_LINEAR _SATINTYPE_NORMAL _SATINTYPE_GAMMA
			#pragma shader_feature_local _THICKNESSTYPE_LINEAR _THICKNESSTYPE_NORMAL _THICKNESSTYPE_GAMMA
			#pragma shader_feature_local _CURVTYPE_LINEAR _CURVTYPE_NORMAL _CURVTYPE_GAMMA
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
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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
			sampler2D _AmbientOcclusionMap;
			sampler2D _TransparentMap;
			sampler2D _SatinMap;
			sampler2D _ThicknessMap;
			sampler2D _CurvatureMap;
			sampler2D _SpecularMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

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

				float2 uv_BaseMap = IN.ase_texcoord4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode27 = tex2D( _BaseMap, uv_BaseMap );
				float3 gammaToLinear370 = FastSRGBToLinear( tex2DNode27.rgb );
				float3 linearToGamma369 = FastLinearToSRGB( tex2DNode27.rgb );
				#if defined( _BASEMAPTYPE_LINEAR )
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#elif defined( _BASEMAPTYPE_NORMAL )
				float4 staticSwitch371 = tex2DNode27;
				#elif defined( _BASEMAPTYPE_GAMMA )
				float4 staticSwitch371 = float4( linearToGamma369 , 0.0 );
				#else
				float4 staticSwitch371 = tex2DNode27;
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( float4( _BaseColor , 0.0 ) * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = normalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord4.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 RF_NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal22 = RF_NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), ase_worldViewDir );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_11 );
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_14 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_14 );
				float3 temp_cast_15 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_12;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 RF_FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( float4( _SecondColor , 0.0 ) * temp_output_208_0 ) ):( float4( _SecondColor , 0.0 ) )) , float4( RF_FresnelResult20 , 0.0 ));
				float RF_One74 = 1.0;
				float4 temp_cast_18 = (RF_One74).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord4.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 tex2DNode172 = tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap );
				float3 gammaToLinear128 = Gamma22ToLinear( tex2DNode172.rgb );
				float3 linearToGamma130 = LinearToGamma22( tex2DNode172.rgb );
				#if defined( _AOTYPE_LINEAR )
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#elif defined( _AOTYPE_NORMAL )
				float4 staticSwitch376 = tex2DNode172;
				#elif defined( _AOTYPE_GAMMA )
				float4 staticSwitch376 = float4( linearToGamma130 , 0.0 );
				#else
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#endif
				float4 saferPower378 = abs( saturate( ( ( 1.0 - _AmbientOcclusionIntensity ) + staticSwitch376 ) ) );
				float4 temp_cast_27 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 RF_AO219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_27 ) ):( temp_cast_18 ));
				float4 RF_BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float RF_Zero75 = 0.0;
				float4 temp_cast_29 = (RF_Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_31 = (temp_output_151_0).xxx;
				float3 temp_cast_32 = (-temp_output_151_0).xxx;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 RF_NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , RF_NewNormals83 );
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 temp_cast_34 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_34 );
				float3 temp_cast_35 = (dotResult147).xxx;
				float3 temp_cast_36 = (dotResult147).xxx;
				float3 temp_cast_37 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_37 );
				float3 temp_cast_38 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_35;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_39 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_31 , temp_cast_32 , pow( saferPower136 , temp_cast_39 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_41 = (RF_One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord4.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float RF_SatinSampler464 = dotResult147;
				float2 temp_cast_42 = (RF_SatinSampler464).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( float4( _SatinColor , 0.0 ) * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( TransparentMapRef348 ):( temp_cast_41 )) * tex2D( _SatinMap, temp_cast_42 ) ) ):( temp_cast_29 ));
				float4 temp_cast_43 = (RF_Zero75).xxxx;
				float dotResult96 = dot( RF_NewNormals83 , _MainLightPosition.xyz );
				float RF_NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 RF_BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_46 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * RF_BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -RF_NormalLightDirection90 * RF_BaseTexture98 ) ) , temp_cast_46 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_47 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 RF_ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_47 ) * ase_lightColor ) ):( temp_cast_43 ));
				float4 temp_cast_48 = (RF_Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord4.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * RF_BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
				float3 gammaToLinear186 = FastSRGBToLinear( temp_output_222_0.rgb );
				float3 linearToGamma185 = FastLinearToSRGB( temp_output_222_0.rgb );
				#if defined( _THICKNESSTYPE_LINEAR )
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#elif defined( _THICKNESSTYPE_NORMAL )
				float4 staticSwitch184 = temp_output_222_0;
				#elif defined( _THICKNESSTYPE_GAMMA )
				float4 staticSwitch184 = float4( linearToGamma185 , 0.0 );
				#else
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#endif
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( float4( _ThicknessColor , 0.0 ) * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_48 ));
				float4 temp_cast_58 = (RF_Zero75).xxxx;
				float2 uv_CurvatureMap = IN.ase_texcoord4.xy * _CurvatureMap_ST.xy + _CurvatureMap_ST.zw;
				float4 tex2DNode260 = tex2D( _CurvatureMap, uv_CurvatureMap );
				float3 gammaToLinear364 = FastSRGBToLinear( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				float3 linearToGamma363 = FastLinearToSRGB( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				#if defined( _CURVTYPE_LINEAR )
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#elif defined( _CURVTYPE_NORMAL )
				float4 staticSwitch365 = (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 ));
				#elif defined( _CURVTYPE_GAMMA )
				float4 staticSwitch365 = float4( linearToGamma363 , 0.0 );
				#else
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#endif
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * float4( _CurvatureColor , 0.0 ) ) ):( temp_cast_58 ));
				float4 temp_cast_68 = (RF_Zero75).xxxx;
				float ifLocalVar456 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar456 = _SpecularOut;
				else
				ifLocalVar456 = _SpecularIn;
				float3 temp_cast_69 = (ifLocalVar456).xxx;
				float3 temp_cast_70 = (_SpecularOut).xxx;
				float ifLocalVar444 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar444 = _SpecMax;
				else
				ifLocalVar444 = _SpecMin;
				float3 tanNormal422 = RF_NewObjectNormal84;
				float3 worldNormal422 = normalize( float3(dot(tanToWorld0,tanNormal422), dot(tanToWorld1,tanNormal422), dot(tanToWorld2,tanNormal422)) );
				float3 normalizeResult415 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float dotResult419 = dot( ( worldNormal422 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult415 );
				float RF_LightNormal424 = dotResult419;
				float smoothstepResult446 = smoothstep( ifLocalVar444 , _SpecMax , pow( RF_LightNormal424 , _BGloss ));
				float temp_output_2_0_g168 = smoothstepResult446;
				float temp_output_448_0 = saturate( ( temp_output_2_0_g168 * temp_output_2_0_g168 ) );
				float3 temp_cast_71 = (temp_output_448_0).xxx;
				float3 temp_cast_72 = (temp_output_448_0).xxx;
				float3 gammaToLinear449 = Gamma22ToLinear( temp_cast_72 );
				float3 temp_cast_73 = (temp_output_448_0).xxx;
				float3 temp_cast_74 = (temp_output_448_0).xxx;
				float3 temp_cast_75 = (temp_output_448_0).xxx;
				float3 linearToGamma450 = LinearToGamma22( temp_cast_75 );
				float3 temp_cast_76 = (temp_output_448_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch451 = gammaToLinear449;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch451 = temp_cast_73;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch451 = linearToGamma450;
				#else
				float3 staticSwitch451 = gammaToLinear449;
				#endif
				float3 smoothstepResult462 = smoothstep( temp_cast_69 , temp_cast_70 , ( 1.0 - sqrt( staticSwitch451 ) ));
				float3 saferPower461 = abs( smoothstepResult462 );
				float3 temp_cast_77 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_78 = (0.0).xxx;
				float3 temp_cast_79 = (_SpecularSaturation).xxx;
				float3 clampResult436 = clamp( ( 1.0 - pow( saferPower461 , temp_cast_77 ) ) , temp_cast_78 , temp_cast_79 );
				float2 uv_SpecularMap = IN.ase_texcoord4.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode452 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_82 = (RF_One74).xxxx;
				float4 RF_Specular440 = (( _SpecularSwitch )?( ( ( float4( clampResult436 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode452 ) ):( tex2DNode452 )) * (( _AffectAO_Spec )?( RF_AO219 ):( temp_cast_82 )) ) * _SecSpecularIntensity ) ):( temp_cast_68 ));
				float4 RF_FinalEmission467 = ( Satin156 + RF_ShadeColor57 + ThicknessRef201 + CurvatureRef261 + RF_Specular440 );
				
				float3 temp_cast_84 = (RF_One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_84 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = RF_BaseDiffuse29.rgb;
				float3 Emission = RF_FinalEmission467.rgb;
				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;

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
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _BASEMAPTYPE_LINEAR _BASEMAPTYPE_NORMAL _BASEMAPTYPE_GAMMA
			#pragma shader_feature_local _VELVETTYPE_LINEAR _VELVETTYPE_NORMAL _VELVETTYPE_GAMMA
			#pragma shader_feature_local _AOTYPE_LINEAR _AOTYPE_NORMAL _AOTYPE_GAMMA


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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
			sampler2D _AmbientOcclusionMap;
			sampler2D _TransparentMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

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
				o.ase_texcoord = v.ase_texcoord;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_BaseMap = IN.ase_texcoord2.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode27 = tex2D( _BaseMap, uv_BaseMap );
				float3 gammaToLinear370 = FastSRGBToLinear( tex2DNode27.rgb );
				float3 linearToGamma369 = FastLinearToSRGB( tex2DNode27.rgb );
				#if defined( _BASEMAPTYPE_LINEAR )
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#elif defined( _BASEMAPTYPE_NORMAL )
				float4 staticSwitch371 = tex2DNode27;
				#elif defined( _BASEMAPTYPE_GAMMA )
				float4 staticSwitch371 = float4( linearToGamma369 , 0.0 );
				#else
				float4 staticSwitch371 = tex2DNode27;
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( float4( _BaseColor , 0.0 ) * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = normalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 RF_NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal22 = RF_NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), ase_worldViewDir );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_11 );
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_14 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_14 );
				float3 temp_cast_15 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_12;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 RF_FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( float4( _SecondColor , 0.0 ) * temp_output_208_0 ) ):( float4( _SecondColor , 0.0 ) )) , float4( RF_FresnelResult20 , 0.0 ));
				float RF_One74 = 1.0;
				float4 temp_cast_18 = (RF_One74).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord2.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 tex2DNode172 = tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap );
				float3 gammaToLinear128 = Gamma22ToLinear( tex2DNode172.rgb );
				float3 linearToGamma130 = LinearToGamma22( tex2DNode172.rgb );
				#if defined( _AOTYPE_LINEAR )
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#elif defined( _AOTYPE_NORMAL )
				float4 staticSwitch376 = tex2DNode172;
				#elif defined( _AOTYPE_GAMMA )
				float4 staticSwitch376 = float4( linearToGamma130 , 0.0 );
				#else
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#endif
				float4 saferPower378 = abs( saturate( ( ( 1.0 - _AmbientOcclusionIntensity ) + staticSwitch376 ) ) );
				float4 temp_cast_27 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 RF_AO219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_27 ) ):( temp_cast_18 ));
				float4 RF_BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float3 temp_cast_29 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord2.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_29 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = RF_BaseDiffuse29.rgb;
				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;

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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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
			sampler2D _TransparentMap;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
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

				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = normalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 RF_NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				
				float RF_One74 = 1.0;
				float3 temp_cast_0 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord5.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 Normal = RF_NewObjectNormal84;
				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;

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
			ZWrite On
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
			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma shader_feature_local _BASEMAPTYPE_LINEAR _BASEMAPTYPE_NORMAL _BASEMAPTYPE_GAMMA
			#pragma shader_feature_local _VELVETTYPE_LINEAR _VELVETTYPE_NORMAL _VELVETTYPE_GAMMA
			#pragma shader_feature_local _AOTYPE_LINEAR _AOTYPE_NORMAL _AOTYPE_GAMMA
			#pragma shader_feature_local _SATINTYPE_LINEAR _SATINTYPE_NORMAL _SATINTYPE_GAMMA
			#pragma shader_feature_local _THICKNESSTYPE_LINEAR _THICKNESSTYPE_NORMAL _THICKNESSTYPE_GAMMA
			#pragma shader_feature_local _CURVTYPE_LINEAR _CURVTYPE_NORMAL _CURVTYPE_GAMMA
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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
			sampler2D _AmbientOcclusionMap;
			sampler2D _TransparentMap;
			sampler2D _SatinMap;
			sampler2D _ThicknessMap;
			sampler2D _CurvatureMap;
			sampler2D _SpecularMap;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
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

				float2 uv_BaseMap = IN.ase_texcoord8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode27 = tex2D( _BaseMap, uv_BaseMap );
				float3 gammaToLinear370 = FastSRGBToLinear( tex2DNode27.rgb );
				float3 linearToGamma369 = FastLinearToSRGB( tex2DNode27.rgb );
				#if defined( _BASEMAPTYPE_LINEAR )
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#elif defined( _BASEMAPTYPE_NORMAL )
				float4 staticSwitch371 = tex2DNode27;
				#elif defined( _BASEMAPTYPE_GAMMA )
				float4 staticSwitch371 = float4( linearToGamma369 , 0.0 );
				#else
				float4 staticSwitch371 = tex2DNode27;
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( float4( _BaseColor , 0.0 ) * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = normalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 RF_NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal22 = RF_NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), WorldViewDirection );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_11 );
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_14 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_14 );
				float3 temp_cast_15 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_12;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 RF_FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( float4( _SecondColor , 0.0 ) * temp_output_208_0 ) ):( float4( _SecondColor , 0.0 ) )) , float4( RF_FresnelResult20 , 0.0 ));
				float RF_One74 = 1.0;
				float4 temp_cast_18 = (RF_One74).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord8.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 tex2DNode172 = tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap );
				float3 gammaToLinear128 = Gamma22ToLinear( tex2DNode172.rgb );
				float3 linearToGamma130 = LinearToGamma22( tex2DNode172.rgb );
				#if defined( _AOTYPE_LINEAR )
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#elif defined( _AOTYPE_NORMAL )
				float4 staticSwitch376 = tex2DNode172;
				#elif defined( _AOTYPE_GAMMA )
				float4 staticSwitch376 = float4( linearToGamma130 , 0.0 );
				#else
				float4 staticSwitch376 = float4( gammaToLinear128 , 0.0 );
				#endif
				float4 saferPower378 = abs( saturate( ( ( 1.0 - _AmbientOcclusionIntensity ) + staticSwitch376 ) ) );
				float4 temp_cast_27 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 RF_AO219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_27 ) ):( temp_cast_18 ));
				float4 RF_BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float RF_Zero75 = 0.0;
				float4 temp_cast_29 = (RF_Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_31 = (temp_output_151_0).xxx;
				float3 temp_cast_32 = (-temp_output_151_0).xxx;
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 RF_NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , RF_NewNormals83 );
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 temp_cast_34 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_34 );
				float3 temp_cast_35 = (dotResult147).xxx;
				float3 temp_cast_36 = (dotResult147).xxx;
				float3 temp_cast_37 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_37 );
				float3 temp_cast_38 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_35;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_39 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_31 , temp_cast_32 , pow( saferPower136 , temp_cast_39 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_41 = (RF_One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord8.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float RF_SatinSampler464 = dotResult147;
				float2 temp_cast_42 = (RF_SatinSampler464).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( float4( _SatinColor , 0.0 ) * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( TransparentMapRef348 ):( temp_cast_41 )) * tex2D( _SatinMap, temp_cast_42 ) ) ):( temp_cast_29 ));
				float4 temp_cast_43 = (RF_Zero75).xxxx;
				float dotResult96 = dot( RF_NewNormals83 , _MainLightPosition.xyz );
				float RF_NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 RF_BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * RF_AO219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_46 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * RF_BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -RF_NormalLightDirection90 * RF_BaseTexture98 ) ) , temp_cast_46 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_47 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 RF_ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_47 ) * ase_lightColor ) ):( temp_cast_43 ));
				float4 temp_cast_48 = (RF_Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * RF_BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
				float3 gammaToLinear186 = FastSRGBToLinear( temp_output_222_0.rgb );
				float3 linearToGamma185 = FastLinearToSRGB( temp_output_222_0.rgb );
				#if defined( _THICKNESSTYPE_LINEAR )
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#elif defined( _THICKNESSTYPE_NORMAL )
				float4 staticSwitch184 = temp_output_222_0;
				#elif defined( _THICKNESSTYPE_GAMMA )
				float4 staticSwitch184 = float4( linearToGamma185 , 0.0 );
				#else
				float4 staticSwitch184 = float4( gammaToLinear186 , 0.0 );
				#endif
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( float4( _ThicknessColor , 0.0 ) * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_48 ));
				float4 temp_cast_58 = (RF_Zero75).xxxx;
				float2 uv_CurvatureMap = IN.ase_texcoord8.xy * _CurvatureMap_ST.xy + _CurvatureMap_ST.zw;
				float4 tex2DNode260 = tex2D( _CurvatureMap, uv_CurvatureMap );
				float3 gammaToLinear364 = FastSRGBToLinear( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				float3 linearToGamma363 = FastLinearToSRGB( (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 )).rgb );
				#if defined( _CURVTYPE_LINEAR )
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#elif defined( _CURVTYPE_NORMAL )
				float4 staticSwitch365 = (( _CurvatureInvert )?( ( 1.0 - tex2DNode260 ) ):( tex2DNode260 ));
				#elif defined( _CURVTYPE_GAMMA )
				float4 staticSwitch365 = float4( linearToGamma363 , 0.0 );
				#else
				float4 staticSwitch365 = float4( gammaToLinear364 , 0.0 );
				#endif
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * float4( _CurvatureColor , 0.0 ) ) ):( temp_cast_58 ));
				float4 temp_cast_68 = (RF_Zero75).xxxx;
				float ifLocalVar456 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar456 = _SpecularOut;
				else
				ifLocalVar456 = _SpecularIn;
				float3 temp_cast_69 = (ifLocalVar456).xxx;
				float3 temp_cast_70 = (_SpecularOut).xxx;
				float ifLocalVar444 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar444 = _SpecMax;
				else
				ifLocalVar444 = _SpecMin;
				float3 tanNormal422 = RF_NewObjectNormal84;
				float3 worldNormal422 = normalize( float3(dot(tanToWorld0,tanNormal422), dot(tanToWorld1,tanNormal422), dot(tanToWorld2,tanNormal422)) );
				float3 normalizeResult415 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float dotResult419 = dot( ( worldNormal422 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult415 );
				float RF_LightNormal424 = dotResult419;
				float smoothstepResult446 = smoothstep( ifLocalVar444 , _SpecMax , pow( RF_LightNormal424 , _BGloss ));
				float temp_output_2_0_g168 = smoothstepResult446;
				float temp_output_448_0 = saturate( ( temp_output_2_0_g168 * temp_output_2_0_g168 ) );
				float3 temp_cast_71 = (temp_output_448_0).xxx;
				float3 temp_cast_72 = (temp_output_448_0).xxx;
				float3 gammaToLinear449 = Gamma22ToLinear( temp_cast_72 );
				float3 temp_cast_73 = (temp_output_448_0).xxx;
				float3 temp_cast_74 = (temp_output_448_0).xxx;
				float3 temp_cast_75 = (temp_output_448_0).xxx;
				float3 linearToGamma450 = LinearToGamma22( temp_cast_75 );
				float3 temp_cast_76 = (temp_output_448_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch451 = gammaToLinear449;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch451 = temp_cast_73;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch451 = linearToGamma450;
				#else
				float3 staticSwitch451 = gammaToLinear449;
				#endif
				float3 smoothstepResult462 = smoothstep( temp_cast_69 , temp_cast_70 , ( 1.0 - sqrt( staticSwitch451 ) ));
				float3 saferPower461 = abs( smoothstepResult462 );
				float3 temp_cast_77 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_78 = (0.0).xxx;
				float3 temp_cast_79 = (_SpecularSaturation).xxx;
				float3 clampResult436 = clamp( ( 1.0 - pow( saferPower461 , temp_cast_77 ) ) , temp_cast_78 , temp_cast_79 );
				float2 uv_SpecularMap = IN.ase_texcoord8.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode452 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_82 = (RF_One74).xxxx;
				float4 RF_Specular440 = (( _SpecularSwitch )?( ( ( float4( clampResult436 , 0.0 ) * float4( _SpecColor , 0.0 ) * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode452 ) ):( tex2DNode452 )) * (( _AffectAO_Spec )?( RF_AO219 ):( temp_cast_82 )) ) * _SecSpecularIntensity ) ):( temp_cast_68 ));
				float4 RF_FinalEmission467 = ( Satin156 + RF_ShadeColor57 + ThicknessRef201 + CurvatureRef261 + RF_Specular440 );
				
				float4 temp_cast_84 = (RF_Zero75).xxxx;
				float4 RF_DefSpec214 = (( _DefSpecSwitch )?( ( _SpecularColor * _SpecularIntensity ) ):( temp_cast_84 ));
				
				float RF_DefSmooth215 = _Smoothness;
				
				float3 temp_cast_87 = (RF_One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_87 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = RF_BaseDiffuse29.rgb;
				float3 Normal = RF_NewObjectNormal84;
				float3 Emission = RF_FinalEmission467.rgb;
				float3 Specular = RF_DefSpec214.rgb;
				float Metallic = 0;
				float Smoothness = RF_DefSmooth215;
				float Occlusion = RF_AO219.r;
				float Alpha = TransparentRef336.x;
				float AlphaClipThreshold = ClipThresholdRef337;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"


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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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

			sampler2D _TransparentMap;


			
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

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float RF_One74 = 1.0;
				float3 temp_cast_0 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				surfaceDescription.Alpha = TransparentRef336.x;
				surfaceDescription.AlphaClipThreshold = ClipThresholdRef337;

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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"


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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _NormalMap_ST;
			float4 _BaseMap_ST;
			float4 _SpecularMap_ST;
			float4 _SpecularColor;
			float4 _CurvatureMap_ST;
			float4 _ThicknessMap_ST;
			float4 _TransparentMap_ST;
			float3 _SecondColor;
			float3 _CurvatureColor;
			float3 _BaseColor;
			float3 _ThicknessColor;
			float3 _SatinColor;
			float3 _SpecColor;
			float _ThicknessSwitch;
			float _CurvatureIntensity;
			float _CurvOffset;
			float _ThicknessIntensity;
			float _ThicknessInvert;
			float _ThickPatternIntensity;
			float _SpecularSwitch;
			float _CurvatureInvert;
			float _CurvatureSwitch;
			float _CurvScale;
			float _SpecularIn;
			float _SpecularNormalIntensity;
			float _SpecMin;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _SpecularIntensity;
			float _SpecularOut;
			float _DefSpecSwitch;
			float _AffectAO_Spec;
			float _SpecularInvert;
			float _SpecularSaturation;
			float _Softness;
			float _BGloss;
			float _ShadeContrast;
			float _SpecMax;
			float _SecSpecularIntensity;
			float _ShadingIntensity;
			int _TwoColSwitch;
			float _ShadingContribution;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _BaseMapInvert;
			float _NormalScaleMultiplier;
			float _TwoColors;
			int _CheckBase;
			int _CheckDef;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _AffectBaseAO;
			float _ShadingOffset;
			float _VelvetBias;
			float _VelvetPower;
			float _ShadingContrast;
			float _AdditiveTransparency;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _VelvetScale;
			float _SatinIntensity;
			float _SatinContrast;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinSmoothing;
			float _ClipThreshold;
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

			sampler2D _TransparentMap;


			
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

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float RF_One74 = 1.0;
				float3 temp_cast_0 = (RF_One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				surfaceDescription.Alpha = TransparentRef336.x;
				surfaceDescription.AlphaClipThreshold = ClipThresholdRef337;

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
	
	
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;335;-2960,-4112;Inherit;False;2193.333;426.3335;Transparent Settings;17;344;343;337;336;334;316;320;313;319;318;323;330;307;342;331;317;348;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;317;-2912,-3936;Inherit;True;Property;_TransparentMap;Transparent Map;77;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LinearToGammaNode;331;-2624,-3936;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-2592,-3776;Inherit;False;Property;_TransOffset;TransOffset;83;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;343;-2592,-3856;Inherit;False;Property;_TransContrast;TransContrast;82;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;342;-2384,-3936;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;73;-1280,-3664;Inherit;False;511.0963;763.2918;Local Vars;16;74;76;75;411;410;359;358;310;346;353;352;77;345;351;78;79;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;330;-2160,-3840;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;323;-2016,-3936;Inherit;False;Property;_TransparentInvert;Transparent Invert;79;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-1216,-3616;Inherit;False;Constant;_One1;[One];20;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;307;-2016,-4064;Inherit;False;Property;_Opacity;Opacity;73;0;Create;True;0;0;0;False;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;318;-1568,-3952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;319;-1696,-3824;Inherit;False;Property;_AdditiveTransparency;Additive Transparency;78;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;74;-1008,-3616;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;313;-1488,-4032;Inherit;False;74;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;320;-1424,-3952;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;316;-1296,-4032;Inherit;False;Property;_TransparentSwitch;TransparentSwitch;76;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;334;-1328,-3840;Inherit;False;Property;_ClipThreshold;Clip Threshold;81;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;276;112,-3392;Inherit;False;658.6666;473.3328;Emission Final Comp;7;467;159;158;284;262;202;72;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;275;-5680,-5312;Inherit;False;2253.341;481.4673;Curvature Settings;16;274;264;263;261;270;273;272;271;268;265;365;364;363;269;260;267;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;218;-2912,-2000;Inherit;False;1655.196;454.6149;AO Settings;14;374;375;372;172;376;130;128;171;174;173;378;219;177;175;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;213;-2848,-3376;Inherit;False;1005.081;472.9957;Default Specular Settings;8;215;214;100;99;170;223;224;354;;0.7044024,0.6168197,0.369922,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-5680,-4800;Inherit;False;2312.076;670.5859;Thickness Settings;17;222;221;180;183;182;186;185;184;199;198;197;201;195;196;178;179;181;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-3040,-2880;Inherit;False;2005.635;629.9246;Velvet Settings;17;20;23;134;13;17;167;165;166;212;19;18;21;16;15;14;12;22;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-5680,-2000;Inherit;False;2742.451;597.9147;Base Map Settings;24;27;30;98;29;259;257;258;33;31;34;32;203;26;371;370;369;132;210;28;367;209;208;366;211;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;35;-5680,-2880;Inherit;False;2608.624;842.6057;Shading Settings;36;71;70;69;68;67;66;65;64;63;62;61;60;59;58;57;56;55;54;53;52;51;50;49;48;47;46;45;44;43;42;41;40;39;38;37;36;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;80;-5680,-3248;Inherit;False;1432.627;351.597;Normals;9;304;84;86;83;306;88;89;87;85;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;81;-4224,-3232;Inherit;False;670.0347;333.4726;Normal Light Direction;4;90;96;97;95;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;82;-3536,-3232;Inherit;False;656.0239;328.5383;Normal View Direction;4;94;93;92;91;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;135;-5680,-4112;Inherit;False;2686.206;842.7446;Satin;35;156;160;161;145;360;362;465;464;144;350;349;361;140;153;141;142;143;139;138;152;151;150;137;136;149;155;164;162;163;147;146;157;469;470;471;;1,0.5447499,0.2924527,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;336;-1040,-4032;Inherit;False;TransparentRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;337;-1040,-3840;Inherit;False;ClipThresholdRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;412;-3344,-5040;Inherit;False;3643.588;903.8438;Specular Setup;39;463;462;461;460;459;458;457;456;455;454;453;452;451;450;449;448;447;446;445;444;443;442;441;440;439;438;437;436;435;434;433;432;431;430;429;428;427;426;425;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;413;-736,-4112;Inherit;False;1019;653.2667;Light Specular Direction;11;424;423;422;421;420;419;418;417;416;415;414;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;43;-4656,-2400;Inherit;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;45;-5008,-2400;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;46;-5168,-2400;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;54;-4160,-2704;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;63;-4032,-2704;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-5312,-2400;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;70;-3952,-2240;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;71;-5440,-2192;Inherit;False;Property;_ShadingContrast;Shading Contrast;18;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;56;-3712,-2784;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;61;-3872,-2704;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-4352,-2416;Inherit;False;Property;_ShadeContrast;Shade Contrast;17;0;Create;True;0;0;0;False;0;False;2;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;48;-4528,-2832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-3696,-2608;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-5312,-2640;Float;False;Property;_BaseCellSharpness;Base Cell Sharpness;24;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-5008,-2128;Inherit;False;Property;_ShadingIntensity;Shading Intensity;16;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;41;-4656,-2656;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;42;-4512,-2656;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-4352,-2832;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-5216,-2832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;47;-4800,-2768;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-4576,-2736;Inherit;False;29;RF_BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;62;-4064,-2416;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;4;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-5008,-2288;Inherit;False;Property;_ShadingContribution;Shading Contribution;19;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-4016,-4624;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-4320,-4576;Inherit;False;Property;_ThicknessIntensity;Thickness Intensity;54;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;-4032,-4720;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;201;-3616,-4688;Inherit;False;ThicknessRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;170;-2544,-3216;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;197;-5584,-4416;Inherit;False;98;RF_BaseTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;198;-5648,-4496;Inherit;False;Property;_ThickPatternIntensity;Thick Pattern Intensity;55;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;-5360,-4448;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;184;-4624,-4480;Inherit;False;Property;_ThicknessType;ThicknessType;52;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;185;-4848,-4384;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;186;-4848,-4496;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;182;-4224,-4480;Inherit;False;Property;_ThicknessInvert;Thickness Invert;53;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;183;-4368,-4384;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;180;-5504,-4336;Inherit;True;Property;_ThicknessMap;Thickness Map;57;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;221;-5200,-4448;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;222;-5088,-4448;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;224;-2560,-3312;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;44;-4672,-2576;Inherit;False;Property;_ShadeColor;Shade Color;14;1;[Header];Create;True;1;Shade Settings;0;0;False;0;False;1,0,0,1;0.6313726,0.227451,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;267;-5312,-5104;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;260;-5632,-5184;Inherit;True;Property;_CurvatureMap;Curvature Map;62;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;85;-4928,-3200;Inherit;False;Property;_Normal;Normal;30;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;87;-5200,-3200;Inherit;False;Normal Reconstruct Z;-1;;167;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;89;-5232,-3120;Inherit;True;Property;_NormalMap;Normal Map;32;2;[Header];[Normal];Create;False;1;Normal Controls;0;0;False;0;False;-1;5062329c834beb9469cdb4211084bae3;5062329c834beb9469cdb4211084bae3;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;88;-5648,-3072;Float;False;Property;_NormalScale;Normal Scale;33;0;Create;False;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;306;-5376,-3040;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;348;-2624,-4048;Inherit;False;TransparentMapRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-1216,-3536;Inherit;False;Constant;_Zero1;[Zero];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;351;-976,-3360;Inherit;False;Property;_TwoColSwitch;TwoColSwitch;86;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;345;-1216,-3280;Inherit;False;Property;_CullOp;CullOp;84;1;[Enum];Create;True;0;3;Back;2;Front;1;Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-1216,-3456;Inherit;False;Constant;_Gray;[Gray];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;352;-976,-3280;Inherit;False;Property;_ShaderExtras;ShaderExtras;87;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;353;-976,-3200;Inherit;False;Property;_SpecularExtras;SpecularExtras;88;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;-2832,-3136;Inherit;False;Property;_SpecularIntensity;Specular Intensity;27;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-2832,-3056;Inherit;False;Property;_Smoothness;Smoothness;28;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;354;-2816,-3328;Inherit;False;Property;_SpecularColor;SpecularColor;89;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.IntNode;346;-1232,-3200;Inherit;False;Property;_AlphaCoverage;AlphaCoverage;85;1;[Enum];Create;True;0;2;On;1;Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;310;-1232,-3360;Inherit;False;Property;_BlendingOp;BlendingOp;75;1;[Enum];Create;True;0;4;Opaque;0;Transparent;1;Premultiplied;2;Additive;3;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;269;-5152,-5184;Inherit;False;Property;_CurvatureInvert;CurvatureInvert;59;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;363;-4944,-5104;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;364;-4944,-5216;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;365;-4720,-5200;Inherit;False;Property;_CurvType;CurvType;68;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;265;-4496,-5200;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;268;-4288,-5200;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;271;-4128,-5200;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;-4160,-5280;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;-4416,-5072;Inherit;False;Property;_CurvatureIntensity;Curvature Intensity;60;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;261;-3648,-5200;Inherit;False;CurvatureRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-4688,-5056;Inherit;False;Property;_CurvScale;CurvScale;63;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;264;-4688,-4960;Inherit;False;Property;_CurvOffset;CurvOffset;64;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;366;-4480,-1712;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;208;-4752,-1776;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;209;-4864,-1776;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;367;-4320,-1776;Inherit;False;Property;_BaseMapInvert;BaseMapInvert;94;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-4096,-1840;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;371;-5120,-1776;Inherit;False;Property;_BaseMapType;BaseMapType;65;0;Create;True;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;175;-1712,-1952;Inherit;False;Property;_AOSwitch;AOSwitch;46;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;-1904,-1952;Inherit;False;74;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;378;-1872,-1856;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;173;-2144,-1856;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;174;-2304,-1856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-2592,-1856;Inherit;False;Property;_AmbientOcclusionIntensity;Ambient Occlusion Intensity;50;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;128;-2576,-1776;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;130;-2576,-1680;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;376;-2368,-1760;Inherit;False;Property;_AOType;AOType;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;172;-2880,-1760;Inherit;True;Property;_AmbientOcclusionMap;AmbientOcclusionMap;49;0;Create;True;0;0;0;False;0;False;-1;593285cff36703c4b96849cdd499deaf;593285cff36703c4b96849cdd499deaf;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;374;-2368,-1632;Inherit;False;Property;_AOOver;AOOver;95;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;372;-2016,-1856;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;223;-2352,-3216;Inherit;False;Property;_DefSpecSwitch;DefSpecSwitch;25;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;358;-960,-3120;Inherit;False;Property;_SrcBlend;SrcBlend;90;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;359;-960,-3040;Inherit;False;Property;_DstBlend;DstBlend;91;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;410;-1216,-3120;Inherit;False;Property;_CheckDef;CheckDef;74;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;411;-1232,-3040;Inherit;False;Property;_CheckBase;CheckBase;80;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;-240,-3872;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;415;-240,-3712;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;417;-624,-3776;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;418;-688,-3616;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;420;-432,-4048;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.75;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;422;-432,-3872;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;423;-720,-4048;Inherit;False;Property;_SpecularNormalIntensity;SpecularNormalIntensity;71;0;Create;True;0;0;0;False;0;False;0.3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;425;-144,-4832;Inherit;False;Property;_SpecularSwitch;Specular Switch;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;426;-304,-4768;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;427;-464,-4768;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;435;-912,-4976;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;436;-752,-4976;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.347,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;441;-2976,-4944;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;446;-2816,-4944;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;447;-2624,-4944;Inherit;False;Square;-1;;168;fea980a1f68019543b2cd91d506986e8;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;448;-2464,-4944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;449;-2304,-4976;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;450;-2304,-4864;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;451;-2080,-4944;Inherit;False;Property;_SpecType;SpecType;70;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;453;-1728,-4976;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SqrtOpNode;454;-1856,-4976;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;456;-1840,-4784;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;461;-1104,-4976;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.56;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;462;-1536,-4976;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;75;-1008,-3536;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;76;-1008,-3456;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-3296,-2608;Float;False;RF_ShadeColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;96;-3936,-3120;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;304;-5648,-2976;Inherit;False;Property;_NormalScaleMultiplier;Normal Scale Multiplier;34;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;215;-2064,-3056;Inherit;False;RF_DefSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;214;-2064,-3216;Inherit;False;RF_DefSpec;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;26;-4320,-1920;Inherit;False;Property;_BaseColor;Base Color;0;1;[HDR];Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;258;-3552,-1760;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;259;-3392,-1840;Inherit;False;Property;_AffectBaseAO;AffectBaseAO;48;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;274;-4352,-4992;Inherit;False;Property;_CurvatureColor;Curvature Color;61;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;178;-4272,-4752;Inherit;False;Property;_ThicknessColor;Thickness Color;56;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LinearToGammaNode;163;-5136,-3840;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;150;-5152,-3552;Inherit;False;Property;_SatinContrast;Satin Contrast;42;0;Create;True;0;0;0;False;0;False;1;2;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;152;-4688,-3552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;138;-4432,-4048;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;139;-4304,-4048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;143;-4592,-4048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;142;-4880,-4048;Inherit;False;Property;_SatinLightShade;Satin Light Shade;45;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;361;-4112,-3568;Inherit;False;74;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;144;-4144,-3952;Inherit;False;Property;_SatinColor;Satin Color;39;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;465;-4144,-3376;Inherit;False;464;RF_SatinSampler;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;362;-3904,-3472;Inherit;True;Property;_SatinMap;SatinMap;93;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;161;-3632,-3888;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;92;-3504,-3088;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;93;-3312,-3136;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;94;-3184,-3136;Float;False;RF_NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;439;-336,-4864;Inherit;False;75;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-3168,-1840;Inherit;False;RF_BaseDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;98;-3168,-1744;Inherit;False;RF_BaseTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;440;80,-4832;Inherit;False;RF_Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;445;-3296,-4880;Inherit;False;Property;_BGloss;BGloss;23;0;Create;True;0;0;0;False;0;False;1;25;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-3296,-4784;Inherit;False;Property;_SpecMin;SpecMin;69;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;443;-3296,-4688;Inherit;False;Property;_SpecMax;SpecMax;66;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;457;-2160,-4784;Inherit;False;Property;_SpecularIn;Specular In;26;0;Create;True;0;0;0;True;0;False;0.2;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;438;-1040,-4864;Inherit;False;Constant;_SpecularAmbient;Specular Ambient;31;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;434;-816,-4816;Inherit;False;Property;_SpecColor;Spec Color;37;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;431;-784,-4656;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;430;-816,-4512;Inherit;False;Property;_SpecularInvert;SpecularInvert;47;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;433;-1008,-4368;Inherit;False;74;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;452;-1264,-4576;Inherit;True;Property;_SpecularMap;Specular Map;40;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;463;-1008,-4288;Inherit;False;219;RF_AO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;432;-816,-4352;Inherit;False;Property;_AffectAO_Spec;AffectAO_Spec;72;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;429;-976,-4464;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;84;-4464,-3104;Inherit;False;RF_NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;91;-3520,-3168;Inherit;False;83;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;195;-3840,-4688;Inherit;False;Property;_ThicknessSwitch;ThicknessSwitch;51;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;272;-3920,-5200;Inherit;False;Property;_CurvatureSwitch;Curvature Switch;58;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;31;-3776,-1840;Inherit;False;Property;_TwoColors;TwoColors;4;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;33;-3936,-1776;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;30;-4704,-1648;Inherit;False;Property;_SecondColor;Second Color;5;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-4480,-1584;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;203;-4288,-1648;Inherit;False;Property;_SecondColorTextureSwitch;SecondColorTextureSwitch;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;421;-688,-3872;Inherit;False;84;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;22;-2768,-2816;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;12;-2768,-2656;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;14;-2864,-2416;Inherit;False;Property;_VelvetScale;VelvetScale;12;0;Create;True;0;0;0;False;0;False;5;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-2864,-2336;Inherit;False;Property;_VelvetPower;VelvetPower;13;0;Create;True;0;0;0;False;0;False;0;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;16;-2560,-2656;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;21;-2272,-2528;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;18;-2096,-2608;Inherit;False;Property;_VelvetInvert;VelvetInvert;9;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1424,-2624;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;INT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;166;-1872,-2528;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;165;-1872,-2640;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;167;-1648,-2624;Inherit;False;Property;_VelvetType;VelvetType;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;17;-1616,-2480;Inherit;False;Property;_VelvetSwitch;VelvetSwitch;7;1;[Enum];Create;True;0;2;On;1;Off;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-2864,-2496;Inherit;False;Property;_VelvetBias;VelvetBias;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;-3008,-2816;Inherit;False;84;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-1264,-2496;Inherit;False;RF_FresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;20;-1264,-2624;Inherit;False;RF_FresnelResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-592,-4576;Inherit;False;Property;_SecSpecularIntensity;SecSpecular Intensity;31;0;Create;True;0;0;0;False;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;437;-1104,-4784;Inherit;False;Property;_SpecularSaturation;Specular Saturation;29;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;459;-1616,-4784;Inherit;False;Property;_Softness;Softness;43;0;Create;True;0;0;0;False;0;False;0.001;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;458;-2160,-4688;Inherit;False;Property;_SpecularOut;Specular Out;20;0;Create;True;0;0;0;True;0;False;0.8;0.1;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1712,-2736;Inherit;False;Property;_VelvetIntensity;Velvet Intensity;10;1;[HDR];Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-5008,-2208;Inherit;False;Property;_ShadingOffset;Shading Offset;21;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;360;-3904,-3584;Inherit;False;Property;_SatinTransparency;SatinTransparency;92;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;349;-4352,-3488;Inherit;False;348;TransparentMapRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;350;-4480,-3376;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-5152,-1872;Inherit;False;Property;_TextureAdd;TextureAdd;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;27;-5664,-1792;Inherit;True;Property;_BaseMap;Base Map;1;0;Create;True;0;0;0;False;0;False;-1;2272f2dfdb7932b43921aa9b38213a6e;2272f2dfdb7932b43921aa9b38213a6e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GammaToLinearNode;370;-5376,-1952;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;369;-5376,-1632;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-5200,-1600;Inherit;False;Property;_TextureContrast;Texture Contrast;2;0;Create;True;0;0;0;False;0;False;0.2;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;211;-4896,-1600;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-2;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-4224,-1552;Inherit;False;20;RF_FresnelResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;58;-3536,-2608;Inherit;False;Property;_ShadeColorToggle;ShadeColorToggle;15;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;257;-3744,-1728;Inherit;False;219;RF_AO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;375;-2048,-1760;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;219;-1488,-1952;Inherit;False;RF_AO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;216;1120,-3136;Inherit;False;214;RF_DefSpec;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;468;1088,-3216;Inherit;False;467;RF_FinalEmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;176,-3328;Inherit;False;156;Satin;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;149;-5088,-3744;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;151;-4880,-3552;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;153;-4448,-3680;Inherit;False;Property;_SatinIntensity;Satin Intensity;41;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;141;-4656,-3968;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-5376,-3680;Inherit;False;Property;_SatinSmoothing;Satin Smoothing;44;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;-5616,-4032;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;464;-5136,-4064;Inherit;False;RF_SatinSampler;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;469;-5648,-3472;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;157;-5632,-3760;Inherit;True;83;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;148;-5936,-4160;Inherit;True;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightPos;154;-6016,-3904;Inherit;True;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.DotProductOpNode;147;-5392,-3936;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;162;-5152,-3968;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;164;-4912,-3936;Inherit;False;Property;_SatinType;SatinType;36;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;136;-4688,-3856;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;137;-4512,-3808;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0,0;False;2;FLOAT3;-0.1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;-4144,-3792;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;145;-3600,-3808;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;160;-3456,-3856;Inherit;False;Property;_SatinSwitch;SatinSwitch;35;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-3136,-3552;Inherit;False;Satin;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GradientSampleNode;471;-3328,-4048;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GradientNode;470;-3584,-4048;Inherit;False;0;2;2;0,1,0,0;1,0,0,1;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.WorldNormalVector;86;-4704,-3200;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;95;-4192,-3072;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;90;-3824,-3120;Float;False;RF_NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-5536,-2336;Inherit;False;98;RF_BaseTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;467;544,-3232;Inherit;False;RF_FinalEmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;159;416,-3232;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;39;-5168,-2192;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;51;-5392,-2832;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.4;False;4;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;37;-5040,-2640;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;60;-4624,-2160;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-4384,-2576;Inherit;True;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-5664,-2832;Float;False;Property;_BaseCellOffset;Base Cell Offset;22;0;Create;True;0;0;0;False;0;False;0;-0.151;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;67;-5472,-2432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-5664,-2624;Inherit;True;90;RF_NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-4160,-3168;Inherit;False;83;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;83;-4464,-3200;Float;False;RF_NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;144,-3248;Inherit;False;57;RF_ShadeColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;144,-3168;Inherit;False;201;ThicknessRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;262;144,-3088;Inherit;False;261;CurvatureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;284;176,-3008;Inherit;False;440;RF_Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;455;-3232,-4976;Inherit;False;424;RF_LightNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;416;-368,-3712;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;419;-80,-3744;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;424;48,-3744;Inherit;False;RF_LightNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;444;-2672,-4768;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;460;-1328,-4784;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0.01;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;339;1088,-2800;Inherit;False;337;ClipThresholdRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;338;1088,-2896;Inherit;False;336;TransparentRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;220;1120,-2976;Inherit;False;219;RF_AO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;217;1088,-3056;Inherit;False;215;RF_DefSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;1088,-3392;Inherit;False;29;RF_BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;168;1056,-3312;Inherit;False;84;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;1424,-3264;Float;False;True;-1;2;;0;19;BUDU Shaders ASE/BFabric;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_TransparentAntialiasing;True;True;0;True;_CullOp;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638535519660674896;Workflow;0;638535519593557860;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;638536160684890531;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_TransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_TRStrength;0;  Normal Distortion;0.5,True,_TRNormDist;0;  Scattering;2,True,_TRScattering;0;  Direct;0.9,True,_TRDirec;0;  Ambient;0.1,True,_TRAmbient;0;  Shadow;0.5,True,_TRShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
WireConnection;331;0;317;0
WireConnection;342;0;331;0
WireConnection;342;1;343;0
WireConnection;342;2;344;0
WireConnection;330;0;342;0
WireConnection;323;0;342;0
WireConnection;323;1;330;0
WireConnection;318;0;307;0
WireConnection;318;1;323;0
WireConnection;74;0;79;0
WireConnection;320;0;318;0
WireConnection;320;1;319;0
WireConnection;316;0;313;0
WireConnection;316;1;320;0
WireConnection;336;0;316;0
WireConnection;337;0;334;0
WireConnection;43;0;45;0
WireConnection;43;1;69;0
WireConnection;43;2;53;0
WireConnection;45;0;46;0
WireConnection;45;1;39;0
WireConnection;46;0;65;0
WireConnection;54;0;49;0
WireConnection;54;1;38;0
WireConnection;63;0;54;0
WireConnection;65;0;67;0
WireConnection;65;1;68;0
WireConnection;61;0;63;0
WireConnection;61;1;62;0
WireConnection;48;0;47;0
WireConnection;55;0;61;0
WireConnection;55;1;70;0
WireConnection;41;0;47;0
WireConnection;42;0;41;0
WireConnection;49;0;48;0
WireConnection;49;1;40;0
WireConnection;52;0;51;0
WireConnection;52;1;66;0
WireConnection;47;0;52;0
WireConnection;47;1;37;0
WireConnection;62;0;64;0
WireConnection;181;0;178;0
WireConnection;181;1;182;0
WireConnection;181;2;179;0
WireConnection;201;0;195;0
WireConnection;170;0;354;0
WireConnection;170;1;99;0
WireConnection;199;0;198;0
WireConnection;199;1;197;0
WireConnection;184;1;186;0
WireConnection;184;0;222;0
WireConnection;184;2;185;0
WireConnection;185;0;222;0
WireConnection;186;0;222;0
WireConnection;182;0;184;0
WireConnection;182;1;183;0
WireConnection;183;0;184;0
WireConnection;221;0;199;0
WireConnection;221;1;180;0
WireConnection;222;0;221;0
WireConnection;267;0;260;0
WireConnection;85;0;87;0
WireConnection;85;1;89;0
WireConnection;89;5;306;0
WireConnection;306;0;88;0
WireConnection;306;1;304;0
WireConnection;348;0;317;0
WireConnection;269;0;260;0
WireConnection;269;1;267;0
WireConnection;363;0;269;0
WireConnection;364;0;269;0
WireConnection;365;1;364;0
WireConnection;365;0;269;0
WireConnection;365;2;363;0
WireConnection;265;0;365;0
WireConnection;265;1;263;0
WireConnection;265;2;264;0
WireConnection;268;0;265;0
WireConnection;271;0;268;0
WireConnection;271;1;270;0
WireConnection;271;2;274;0
WireConnection;261;0;272;0
WireConnection;366;0;208;0
WireConnection;208;1;209;0
WireConnection;208;0;211;0
WireConnection;209;0;132;0
WireConnection;209;1;371;0
WireConnection;367;0;208;0
WireConnection;367;1;366;0
WireConnection;28;0;26;0
WireConnection;28;1;367;0
WireConnection;371;1;370;0
WireConnection;371;0;27;0
WireConnection;371;2;369;0
WireConnection;175;0;177;0
WireConnection;175;1;378;0
WireConnection;378;0;372;0
WireConnection;378;1;375;0
WireConnection;173;0;174;0
WireConnection;173;1;376;0
WireConnection;174;0;171;0
WireConnection;128;0;172;0
WireConnection;130;0;172;0
WireConnection;376;1;128;0
WireConnection;376;0;172;0
WireConnection;376;2;130;0
WireConnection;372;0;173;0
WireConnection;223;0;224;0
WireConnection;223;1;170;0
WireConnection;414;0;422;0
WireConnection;414;1;420;0
WireConnection;415;0;416;0
WireConnection;420;0;423;0
WireConnection;422;0;421;0
WireConnection;425;0;439;0
WireConnection;425;1;426;0
WireConnection;426;0;427;0
WireConnection;426;1;428;0
WireConnection;427;0;436;0
WireConnection;427;1;434;0
WireConnection;427;2;431;0
WireConnection;427;3;430;0
WireConnection;427;4;432;0
WireConnection;435;0;461;0
WireConnection;436;0;435;0
WireConnection;436;1;438;0
WireConnection;436;2;437;0
WireConnection;441;0;455;0
WireConnection;441;1;445;0
WireConnection;446;0;441;0
WireConnection;446;1;444;0
WireConnection;446;2;443;0
WireConnection;447;2;446;0
WireConnection;448;0;447;0
WireConnection;449;0;448;0
WireConnection;450;0;448;0
WireConnection;451;1;449;0
WireConnection;451;0;448;0
WireConnection;451;2;450;0
WireConnection;453;0;454;0
WireConnection;454;0;451;0
WireConnection;456;0;457;0
WireConnection;456;1;458;0
WireConnection;456;2;458;0
WireConnection;456;3;458;0
WireConnection;456;4;457;0
WireConnection;461;0;462;0
WireConnection;461;1;460;0
WireConnection;462;0;453;0
WireConnection;462;1;456;0
WireConnection;462;2;458;0
WireConnection;75;0;78;0
WireConnection;76;0;77;0
WireConnection;57;0;58;0
WireConnection;96;0;97;0
WireConnection;96;1;95;0
WireConnection;215;0;100;0
WireConnection;214;0;223;0
WireConnection;258;0;31;0
WireConnection;258;1;257;0
WireConnection;259;0;31;0
WireConnection;259;1;258;0
WireConnection;163;0;147;0
WireConnection;152;0;151;0
WireConnection;138;0;143;0
WireConnection;138;1;141;0
WireConnection;139;0;138;0
WireConnection;143;0;142;0
WireConnection;362;1;465;0
WireConnection;93;0;91;0
WireConnection;93;1;92;0
WireConnection;94;0;93;0
WireConnection;29;0;259;0
WireConnection;98;0;259;0
WireConnection;440;0;425;0
WireConnection;430;0;452;0
WireConnection;430;1;429;0
WireConnection;432;0;433;0
WireConnection;432;1;463;0
WireConnection;429;0;452;0
WireConnection;84;0;85;0
WireConnection;195;0;196;0
WireConnection;195;1;181;0
WireConnection;272;0;273;0
WireConnection;272;1;271;0
WireConnection;31;0;28;0
WireConnection;31;1;33;0
WireConnection;33;0;28;0
WireConnection;33;1;203;0
WireConnection;33;2;34;0
WireConnection;32;0;30;0
WireConnection;32;1;208;0
WireConnection;203;0;30;0
WireConnection;203;1;32;0
WireConnection;22;0;134;0
WireConnection;16;0;22;0
WireConnection;16;4;12;0
WireConnection;16;1;13;0
WireConnection;16;2;14;0
WireConnection;16;3;15;0
WireConnection;21;0;16;0
WireConnection;18;0;16;0
WireConnection;18;1;21;0
WireConnection;19;0;167;0
WireConnection;19;1;17;0
WireConnection;19;2;212;0
WireConnection;166;0;18;0
WireConnection;165;0;18;0
WireConnection;167;1;165;0
WireConnection;167;0;18;0
WireConnection;167;2;166;0
WireConnection;23;0;17;0
WireConnection;20;0;19;0
WireConnection;360;0;361;0
WireConnection;360;1;349;0
WireConnection;370;0;27;0
WireConnection;369;0;27;0
WireConnection;211;0;210;0
WireConnection;58;0;56;0
WireConnection;58;1;55;0
WireConnection;375;0;374;0
WireConnection;219;0;175;0
WireConnection;149;0;155;0
WireConnection;151;0;150;0
WireConnection;146;0;148;0
WireConnection;146;1;154;1
WireConnection;464;0;147;0
WireConnection;147;0;146;0
WireConnection;147;1;157;0
WireConnection;162;0;147;0
WireConnection;164;1;162;0
WireConnection;164;0;147;0
WireConnection;164;2;163;0
WireConnection;136;0;164;0
WireConnection;136;1;149;0
WireConnection;137;0;136;0
WireConnection;137;1;151;0
WireConnection;137;2;152;0
WireConnection;140;0;137;0
WireConnection;140;1;153;0
WireConnection;140;2;139;0
WireConnection;145;0;144;0
WireConnection;145;1;140;0
WireConnection;145;2;360;0
WireConnection;145;3;362;0
WireConnection;160;0;161;0
WireConnection;160;1;145;0
WireConnection;156;0;160;0
WireConnection;471;0;470;0
WireConnection;471;1;160;0
WireConnection;86;0;85;0
WireConnection;90;0;96;0
WireConnection;467;0;159;0
WireConnection;159;0;158;0
WireConnection;159;1;72;0
WireConnection;159;2;202;0
WireConnection;159;3;262;0
WireConnection;159;4;284;0
WireConnection;39;0;71;0
WireConnection;51;0;50;0
WireConnection;37;0;36;0
WireConnection;60;0;59;0
WireConnection;38;0;42;0
WireConnection;38;1;44;0
WireConnection;38;2;43;0
WireConnection;38;3;60;0
WireConnection;67;0;66;0
WireConnection;83;0;86;0
WireConnection;416;0;417;0
WireConnection;416;1;418;0
WireConnection;419;0;414;0
WireConnection;419;1;415;0
WireConnection;424;0;419;0
WireConnection;444;0;442;0
WireConnection;444;1;443;0
WireConnection;444;2;443;0
WireConnection;444;3;443;0
WireConnection;444;4;442;0
WireConnection;460;0;459;0
WireConnection;2;0;24;0
WireConnection;2;1;168;0
WireConnection;2;2;468;0
WireConnection;2;9;216;0
WireConnection;2;4;217;0
WireConnection;2;5;220;0
WireConnection;2;6;338;0
WireConnection;2;7;339;0
ASEEND*/
//CHKSM=0E2153FC8C88A5695D737D7E9E5126066F954FE3
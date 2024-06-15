// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BFabric"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HDR]_BaseColor("Base Color", Color) = (0.5,0.5,0.5,1)
		_BaseMap("Base Map", 2D) = "white" {}
		_TextureContrast("Texture Contrast", Range( -1 , 1)) = 0.2
		_TextureAdd("TextureAdd", Range( 0 , 1)) = 0
		[Toggle]_TwoColors("TwoColors", Float) = 0
		[HDR]_SecondColor("Second Color", Color) = (1,1,1,1)
		[Toggle]_SecondColorTextureSwitch("SecondColorTextureSwitch", Float) = 0
		[Enum(On,1,Off,0)]_VelvetSwitch("VelvetSwitch", Int) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _VelvetType("VelvetType", Float) = 0
		[Toggle]_VelvetInvert("VelvetInvert", Float) = 0
		_VelvetIntensity("Velvet Intensity", Range( 0 , 1)) = 1
		_VelvetBias("VelvetBias", Range( 0 , 1)) = 0
		_VelvetScale("VelvetScale", Range( 0 , 5)) = 1
		_VelvetPower("VelvetPower", Range( 0 , 5)) = 1
		[Header(Shade Settings)]_ShadeColor("Shade Color", Color) = (0.35,0.35,0.35,1)
		[Toggle]_ShadeColorToggle("ShadeColorToggle", Float) = 0
		_ShadingIntensity("Shading Intensity", Range( 0 , 2)) = 1
		_ShadeContrast("Shade Contrast", Range( 0 , 2)) = 2
		_ShadingContrast("Shading Contrast", Range( 0 , 5)) = 1
		_ShadingContribution("Shading Contribution", Range( 0 , 10)) = 1
		_ShadingOffset("Shading Offset", Range( 0 , 2)) = 0
		_BaseCellOffset("Base Cell Offset", Range( 0 , 1)) = 0
		_BaseCellSharpness("Base Cell Sharpness", Range( 0 , 1)) = 1
		[Toggle]_DefSpecSwitch("DefSpecSwitch", Float) = 0
		_SpecularIntensity("Specular Intensity", Range( 0 , 2)) = 1
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		[Toggle]_Normal("Normal", Float) = 0
		[Header(Normal Controls)][Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_NormalScaleMultiplier("Normal Scale Multiplier", Range( 1 , 10)) = 1
		[Toggle]_SatinSwitch("SatinSwitch", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SatinType("SatinType", Float) = 0
		[HDR]_SatinColor("Satin Color", Color) = (1,1,1,1)
		_SatinIntensity("Satin Intensity", Range( 0 , 1)) = 0.5
		_SatinContrast("Satin Contrast", Range( -2 , 2)) = 1
		_SatinSmoothing("Satin Smoothing", Range( 0 , 1)) = 0.5
		_SatinLightShade("Satin Light Shade", Range( 0 , 1)) = 0
		[Toggle]_AOSwitch("AOSwitch", Float) = 0
		[Toggle]_AffectBaseAO("AffectBaseAO", Float) = 0
		_AmbientOcclusionMap("AmbientOcclusionMap", 2D) = "black" {}
		_AmbientOcclusionIntensity("Ambient Occlusion Intensity", Range( 0 , 1)) = 1
		[Toggle]_ThicknessSwitch("ThicknessSwitch", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _ThicknessType("ThicknessType", Float) = 0
		[Toggle]_ThicknessInvert("Thickness Invert", Float) = 0
		_ThicknessIntensity("Thickness Intensity", Range( 0 , 1)) = 0
		_ThickPatternIntensity("Thick Pattern Intensity", Range( 0 , 1)) = 1
		_ThicknessColor("Thickness Color", Color) = (1,1,1,1)
		_ThicknessMap("Thickness Map", 2D) = "white" {}
		[Toggle]_CurvatureSwitch("Curvature Switch", Float) = 0
		[Toggle]_CurvatureInvert("CurvatureInvert", Float) = 0
		_CurvatureIntensity("Curvature Intensity", Range( 0 , 1)) = 1
		_CurvatureColor("Curvature Color", Color) = (1,1,1,1)
		_CurvatureMap("Curvature Map", 2D) = "white" {}
		_CurvScale("CurvScale", Float) = 1
		_CurvOffset("CurvOffset", Float) = 0
		[Toggle]_BlinnSpecSwitch("BlinnSpecSwitch", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _BaseMapType("BaseMapType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _AOType("AOType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _BlinnType("BlinnType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _CurvType("CurvType", Float) = 0
		_BlinnSpecIntensity("Blinn Spec Intensity", Range( 0 , 1)) = 1
		[HDR]_BlinnSpecColor("Blinn Spec Color", Color) = (1,1,1,1)
		_BSpecular("BSpecular", Range( -10 , 10)) = 0
		_BGloss("BGloss", Range( 0 , 2)) = 0
		_BLightWrapping("BLightWrapping", Range( 0 , 1)) = 0
		_BlinnScale("Blinn Scale", Float) = 1
		_BlinnOffset("Blinn Offset", Float) = 0
		_Opacity("Opacity", Range( 0 , 4)) = 1
		[Enum(Opaque,0,Transparent,1,Premultiplied,2,Additive,3)]_BlendingOp("BlendingOp", Int) = 0
		[Toggle]_TransparentSwitch("TransparentSwitch", Float) = 0
		_TransparentMap("Transparent Map", 2D) = "white" {}
		_AdditiveTransparency("Additive Transparency", Range( 0 , 1)) = 0
		[Toggle]_TransparentInvert("Transparent Invert", Float) = 0
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

			Blend [_SrcBlend] [_DstBlend], SrcAlpha One
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
			#pragma shader_feature_local _BLINNTYPE_LINEAR _BLINNTYPE_NORMAL _BLINNTYPE_GAMMA


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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( _BaseColor * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = ASESafeNormalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal22 = NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), WorldViewDirection );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_8 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_9 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_9 );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_12 );
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_10;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( _SecondColor * temp_output_208_0 ) ):( _SecondColor )) , float4( FresnelResult20 , 0.0 ));
				float One74 = 1.0;
				float4 temp_cast_15 = (One74).xxxx;
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
				float4 temp_cast_24 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 AORef219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_24 ) ):( temp_cast_15 ));
				float4 BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float Zero75 = 0.0;
				float4 temp_cast_26 = (Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_27 = (temp_output_151_0).xxx;
				float3 temp_cast_28 = (-temp_output_151_0).xxx;
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , NewNormals83 );
				float3 temp_cast_29 = (dotResult147).xxx;
				float3 temp_cast_30 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (dotResult147).xxx;
				float3 temp_cast_32 = (dotResult147).xxx;
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_31;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_35 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_27 , temp_cast_28 , pow( saferPower136 , temp_cast_35 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_37 = (One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord8.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float2 temp_cast_38 = (dotResult147).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( _SatinColor * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( ( 1.0 - TransparentMapRef348 ) ):( temp_cast_37 )) * tex2D( _SatinMap, temp_cast_38 ) ) ):( temp_cast_26 ));
				float4 temp_cast_39 = (Zero75).xxxx;
				float dotResult96 = dot( NewNormals83 , _MainLightPosition.xyz );
				float NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_40 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection90 * BaseTexture98 ) ) , temp_cast_40 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_41 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_41 ) * ase_lightColor ) ):( temp_cast_39 ));
				float4 temp_cast_42 = (Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
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
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( _ThicknessColor * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_42 ));
				float4 temp_cast_51 = (Zero75).xxxx;
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
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * _CurvatureColor ) ):( temp_cast_51 ));
				float3 temp_cast_60 = (Zero75).xxx;
				float3 LightWrapVector47_g166 = (( (-1.0 + (_BLightWrapping - 0.0) * (-100.0 - -1.0) / (1.0 - 0.0)) * 0.5 )).xxx;
				float3 tanNormal19_g166 = NewObjectNormal84;
				float3 worldNormal19_g166 = normalize( float3(dot(tanToWorld0,tanNormal19_g166), dot(tanToWorld1,tanNormal19_g166), dot(tanToWorld2,tanNormal19_g166)) );
				float3 CurrentNormal23_g166 = worldNormal19_g166;
				float dotResult20_g166 = dot( CurrentNormal23_g166 , _MainLightPosition.xyz );
				float NDotL21_g166 = dotResult20_g166;
				float3 AttenuationColor8_g166 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 DiffuseColor70_g166 = ( ( ( max( ( LightWrapVector47_g166 + ( ( 1.0 - LightWrapVector47_g166 ) * NDotL21_g166 ) ) , float3(0,0,0) ) * AttenuationColor8_g166 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * ( _BlinnSpecIntensity * _BlinnSpecColor ).rgb );
				float3 normalizeResult77_g166 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g166 = normalize( ( normalizeResult77_g166 + WorldViewDirection ) );
				float3 HalfDirection29_g166 = normalizeResult28_g166;
				float dotResult32_g166 = dot( HalfDirection29_g166 , CurrentNormal23_g166 );
				float SpecularPower14_g166 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g166 = ( AttenuationColor8_g166 * pow( max( dotResult32_g166 , 0.0 ) , SpecularPower14_g166 ) * _BSpecular );
				float3 temp_output_277_0 = ( DiffuseColor70_g166 + specularFinalColor42_g166 );
				float3 gammaToLinear299 = FastSRGBToLinear( temp_output_277_0 );
				float3 linearToGamma298 = FastLinearToSRGB( temp_output_277_0 );
				#if defined( _BLINNTYPE_LINEAR )
				float3 staticSwitch300 = gammaToLinear299;
				#elif defined( _BLINNTYPE_NORMAL )
				float3 staticSwitch300 = temp_output_277_0;
				#elif defined( _BLINNTYPE_GAMMA )
				float3 staticSwitch300 = linearToGamma298;
				#else
				float3 staticSwitch300 = gammaToLinear299;
				#endif
				float3 BlinnSpecularRef283 = (( _BlinnSpecSwitch )?( (saturate( staticSwitch300 )*_BlinnScale + _BlinnOffset) ):( temp_cast_60 ));
				
				float4 temp_cast_64 = (Zero75).xxxx;
				float4 DefSpecRef214 = (( _DefSpecSwitch )?( ( _SpecularColor * _SpecularIntensity ) ):( temp_cast_64 ));
				
				float DefSmoothRef215 = _Smoothness;
				
				float3 temp_cast_67 = (One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_67 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = BaseDiffuse29.rgb;
				float3 Normal = NewObjectNormal84;
				float3 Emission = ( Satin156 + ShadeColor57 + ThicknessRef201 + CurvatureRef261 + float4( BlinnSpecularRef283 , 0.0 ) ).rgb;
				float3 Specular = DefSpecRef214.rgb;
				float Metallic = 0;
				float Smoothness = DefSmoothRef215;
				float Occlusion = AORef219.r;
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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

				float One74 = 1.0;
				float3 temp_cast_0 = (One74).xxx;
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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

				float One74 = 1.0;
				float3 temp_cast_0 = (One74).xxx;
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
			#pragma shader_feature_local _BLINNTYPE_LINEAR _BLINNTYPE_NORMAL _BLINNTYPE_GAMMA


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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( _BaseColor * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = ASESafeNormalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord4.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal22 = NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), ase_worldViewDir );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_8 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_9 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_9 );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_12 );
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_10;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( _SecondColor * temp_output_208_0 ) ):( _SecondColor )) , float4( FresnelResult20 , 0.0 ));
				float One74 = 1.0;
				float4 temp_cast_15 = (One74).xxxx;
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
				float4 temp_cast_24 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 AORef219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_24 ) ):( temp_cast_15 ));
				float4 BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float Zero75 = 0.0;
				float4 temp_cast_26 = (Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_27 = (temp_output_151_0).xxx;
				float3 temp_cast_28 = (-temp_output_151_0).xxx;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , NewNormals83 );
				float3 temp_cast_29 = (dotResult147).xxx;
				float3 temp_cast_30 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (dotResult147).xxx;
				float3 temp_cast_32 = (dotResult147).xxx;
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_31;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_35 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_27 , temp_cast_28 , pow( saferPower136 , temp_cast_35 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_37 = (One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord4.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float2 temp_cast_38 = (dotResult147).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( _SatinColor * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( ( 1.0 - TransparentMapRef348 ) ):( temp_cast_37 )) * tex2D( _SatinMap, temp_cast_38 ) ) ):( temp_cast_26 ));
				float4 temp_cast_39 = (Zero75).xxxx;
				float dotResult96 = dot( NewNormals83 , _MainLightPosition.xyz );
				float NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_40 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection90 * BaseTexture98 ) ) , temp_cast_40 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_41 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_41 ) * ase_lightColor ) ):( temp_cast_39 ));
				float4 temp_cast_42 = (Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord4.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
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
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( _ThicknessColor * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_42 ));
				float4 temp_cast_51 = (Zero75).xxxx;
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
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * _CurvatureColor ) ):( temp_cast_51 ));
				float3 temp_cast_60 = (Zero75).xxx;
				float3 LightWrapVector47_g166 = (( (-1.0 + (_BLightWrapping - 0.0) * (-100.0 - -1.0) / (1.0 - 0.0)) * 0.5 )).xxx;
				float3 tanNormal19_g166 = NewObjectNormal84;
				float3 worldNormal19_g166 = normalize( float3(dot(tanToWorld0,tanNormal19_g166), dot(tanToWorld1,tanNormal19_g166), dot(tanToWorld2,tanNormal19_g166)) );
				float3 CurrentNormal23_g166 = worldNormal19_g166;
				float dotResult20_g166 = dot( CurrentNormal23_g166 , _MainLightPosition.xyz );
				float NDotL21_g166 = dotResult20_g166;
				float3 AttenuationColor8_g166 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 DiffuseColor70_g166 = ( ( ( max( ( LightWrapVector47_g166 + ( ( 1.0 - LightWrapVector47_g166 ) * NDotL21_g166 ) ) , float3(0,0,0) ) * AttenuationColor8_g166 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * ( _BlinnSpecIntensity * _BlinnSpecColor ).rgb );
				float3 normalizeResult77_g166 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g166 = normalize( ( normalizeResult77_g166 + ase_worldViewDir ) );
				float3 HalfDirection29_g166 = normalizeResult28_g166;
				float dotResult32_g166 = dot( HalfDirection29_g166 , CurrentNormal23_g166 );
				float SpecularPower14_g166 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g166 = ( AttenuationColor8_g166 * pow( max( dotResult32_g166 , 0.0 ) , SpecularPower14_g166 ) * _BSpecular );
				float3 temp_output_277_0 = ( DiffuseColor70_g166 + specularFinalColor42_g166 );
				float3 gammaToLinear299 = FastSRGBToLinear( temp_output_277_0 );
				float3 linearToGamma298 = FastLinearToSRGB( temp_output_277_0 );
				#if defined( _BLINNTYPE_LINEAR )
				float3 staticSwitch300 = gammaToLinear299;
				#elif defined( _BLINNTYPE_NORMAL )
				float3 staticSwitch300 = temp_output_277_0;
				#elif defined( _BLINNTYPE_GAMMA )
				float3 staticSwitch300 = linearToGamma298;
				#else
				float3 staticSwitch300 = gammaToLinear299;
				#endif
				float3 BlinnSpecularRef283 = (( _BlinnSpecSwitch )?( (saturate( staticSwitch300 )*_BlinnScale + _BlinnOffset) ):( temp_cast_60 ));
				
				float3 temp_cast_64 = (One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_64 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = BaseDiffuse29.rgb;
				float3 Emission = ( Satin156 + ShadeColor57 + ThicknessRef201 + CurvatureRef261 + float4( BlinnSpecularRef283 , 0.0 ) ).rgb;
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

			Blend [_SrcBlend] [_DstBlend], SrcAlpha One
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( _BaseColor * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = ASESafeNormalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal22 = NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), ase_worldViewDir );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_8 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_9 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_9 );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_12 );
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_10;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( _SecondColor * temp_output_208_0 ) ):( _SecondColor )) , float4( FresnelResult20 , 0.0 ));
				float One74 = 1.0;
				float4 temp_cast_15 = (One74).xxxx;
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
				float4 temp_cast_24 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 AORef219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_24 ) ):( temp_cast_15 ));
				float4 BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float3 temp_cast_26 = (One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord2.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_26 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = BaseDiffuse29.rgb;
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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


			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

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
				float3 normalizeResult12_g167 = ASESafeNormalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				
				float One74 = 1.0;
				float3 temp_cast_0 = (One74).xxx;
				float2 uv_TransparentMap = IN.ase_texcoord5.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_0 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 Normal = NewObjectNormal84;
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

			Blend [_SrcBlend] [_DstBlend], SrcAlpha One
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
			#pragma shader_feature_local _BLINNTYPE_LINEAR _BLINNTYPE_NORMAL _BLINNTYPE_GAMMA


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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float4 staticSwitch371 = float4( gammaToLinear370 , 0.0 );
				#endif
				float4 temp_output_208_0 = CalculateContrast((-2.0 + (_TextureContrast - -1.0) * (2.0 - -2.0) / (1.0 - -1.0)),( _TextureAdd + staticSwitch371 ));
				float4 temp_output_28_0 = ( _BaseColor * (( _BaseMapInvert )?( ( 1.0 - temp_output_208_0 ) ):( temp_output_208_0 )) );
				float2 temp_output_1_0_g167 = float2( 0,0 );
				float dotResult4_g167 = dot( temp_output_1_0_g167 , temp_output_1_0_g167 );
				float3 appendResult10_g167 = (float3((temp_output_1_0_g167).x , (temp_output_1_0_g167).y , sqrt( ( 1.0 - saturate( dotResult4_g167 ) ) )));
				float3 normalizeResult12_g167 = ASESafeNormalize( appendResult10_g167 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack89 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), ( _NormalScale * _NormalScaleMultiplier ) );
				unpack89.z = lerp( 1, unpack89.z, saturate(( _NormalScale * _NormalScaleMultiplier )) );
				float3 NewObjectNormal84 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal22 = NewObjectNormal84;
				float3 worldNormal22 = float3(dot(tanToWorld0,tanNormal22), dot(tanToWorld1,tanNormal22), dot(tanToWorld2,tanNormal22));
				float fresnelNdotV16 = dot( normalize( worldNormal22 ), WorldViewDirection );
				float fresnelNode16 = ( _VelvetBias + _VelvetScale * pow( max( 1.0 - fresnelNdotV16 , 0.0001 ), _VelvetPower ) );
				float3 temp_cast_8 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_9 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 gammaToLinear165 = FastSRGBToLinear( temp_cast_9 );
				float3 temp_cast_10 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_11 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 temp_cast_12 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				float3 linearToGamma166 = FastLinearToSRGB( temp_cast_12 );
				float3 temp_cast_13 = ((( _VelvetInvert )?( ( 1.0 - fresnelNode16 ) ):( fresnelNode16 ))).xxx;
				#if defined( _VELVETTYPE_LINEAR )
				float3 staticSwitch167 = gammaToLinear165;
				#elif defined( _VELVETTYPE_NORMAL )
				float3 staticSwitch167 = temp_cast_10;
				#elif defined( _VELVETTYPE_GAMMA )
				float3 staticSwitch167 = linearToGamma166;
				#else
				float3 staticSwitch167 = gammaToLinear165;
				#endif
				float3 FresnelResult20 = ( staticSwitch167 * _VelvetSwitch * _VelvetIntensity );
				float4 lerpResult33 = lerp( temp_output_28_0 , (( _SecondColorTextureSwitch )?( ( _SecondColor * temp_output_208_0 ) ):( _SecondColor )) , float4( FresnelResult20 , 0.0 ));
				float One74 = 1.0;
				float4 temp_cast_15 = (One74).xxxx;
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
				float4 temp_cast_24 = ((1.0 + (_AOOver - 0.0) * (10.0 - 1.0) / (1.0 - 0.0))).xxxx;
				float4 AORef219 = (( _AOSwitch )?( pow( saferPower378 , temp_cast_24 ) ):( temp_cast_15 ));
				float4 BaseDiffuse29 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				
				float Zero75 = 0.0;
				float4 temp_cast_26 = (Zero75).xxxx;
				float temp_output_151_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 temp_cast_27 = (temp_output_151_0).xxx;
				float3 temp_cast_28 = (-temp_output_151_0).xxx;
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float3 tanNormal86 = (( _Normal )?( unpack89 ):( normalizeResult12_g167 ));
				float3 worldNormal86 = normalize( float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86)) );
				float3 NewNormals83 = worldNormal86;
				float dotResult147 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , NewNormals83 );
				float3 temp_cast_29 = (dotResult147).xxx;
				float3 temp_cast_30 = (dotResult147).xxx;
				float3 gammaToLinear162 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (dotResult147).xxx;
				float3 temp_cast_32 = (dotResult147).xxx;
				float3 temp_cast_33 = (dotResult147).xxx;
				float3 linearToGamma163 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (dotResult147).xxx;
				#if defined( _SATINTYPE_LINEAR )
				float3 staticSwitch164 = gammaToLinear162;
				#elif defined( _SATINTYPE_NORMAL )
				float3 staticSwitch164 = temp_cast_31;
				#elif defined( _SATINTYPE_GAMMA )
				float3 staticSwitch164 = linearToGamma163;
				#else
				float3 staticSwitch164 = gammaToLinear162;
				#endif
				float3 saferPower136 = abs( staticSwitch164 );
				float3 temp_cast_35 = ((0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0))).xxx;
				float3 smoothstepResult137 = smoothstep( temp_cast_27 , temp_cast_28 , pow( saferPower136 , temp_cast_35 ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_cast_37 = (One74).xxxx;
				float2 uv_TransparentMap = IN.ase_texcoord8.xy * _TransparentMap_ST.xy + _TransparentMap_ST.zw;
				float4 tex2DNode317 = tex2D( _TransparentMap, uv_TransparentMap );
				float4 TransparentMapRef348 = tex2DNode317;
				float2 temp_cast_38 = (dotResult147).xx;
				float4 Satin156 = (( _SatinSwitch )?( ( _SatinColor * float4( ( smoothstepResult137 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) , 0.0 ) * (( _SatinTransparency )?( ( 1.0 - TransparentMapRef348 ) ):( temp_cast_37 )) * tex2D( _SatinMap, temp_cast_38 ) ) ):( temp_cast_26 ));
				float4 temp_cast_39 = (Zero75).xxxx;
				float dotResult96 = dot( NewNormals83 , _MainLightPosition.xyz );
				float NormalLightDirection90 = dotResult96;
				float temp_output_47_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection90 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float4 BaseTexture98 = (( _AffectBaseAO )?( ( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) * AORef219 ) ):( (( _TwoColors )?( lerpResult33 ):( temp_output_28_0 )) ));
				float clampResult39 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_40 = (clampResult39).xxxx;
				float4 saferPower61 = abs( saturate( ( ( saturate( temp_output_47_0 ) * BaseDiffuse29 ) + ( saturate( ( 1.0 - temp_output_47_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection90 * BaseTexture98 ) ) , temp_cast_40 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_41 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 ShadeColor57 = (( _ShadeColorToggle )?( ( pow( saferPower61 , temp_cast_41 ) * ase_lightColor ) ):( temp_cast_39 ));
				float4 temp_cast_42 = (Zero75).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_222_0 = saturate( ( ( _ThickPatternIntensity * BaseTexture98 ) + tex2D( _ThicknessMap, uv_ThicknessMap ) ) );
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
				float4 ThicknessRef201 = (( _ThicknessSwitch )?( ( _ThicknessColor * (( _ThicknessInvert )?( ( 1.0 - staticSwitch184 ) ):( staticSwitch184 )) * _ThicknessIntensity ) ):( temp_cast_42 ));
				float4 temp_cast_51 = (Zero75).xxxx;
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
				float4 CurvatureRef261 = (( _CurvatureSwitch )?( ( saturate( (staticSwitch365*_CurvScale + _CurvOffset) ) * _CurvatureIntensity * _CurvatureColor ) ):( temp_cast_51 ));
				float3 temp_cast_60 = (Zero75).xxx;
				float3 LightWrapVector47_g166 = (( (-1.0 + (_BLightWrapping - 0.0) * (-100.0 - -1.0) / (1.0 - 0.0)) * 0.5 )).xxx;
				float3 tanNormal19_g166 = NewObjectNormal84;
				float3 worldNormal19_g166 = normalize( float3(dot(tanToWorld0,tanNormal19_g166), dot(tanToWorld1,tanNormal19_g166), dot(tanToWorld2,tanNormal19_g166)) );
				float3 CurrentNormal23_g166 = worldNormal19_g166;
				float dotResult20_g166 = dot( CurrentNormal23_g166 , _MainLightPosition.xyz );
				float NDotL21_g166 = dotResult20_g166;
				float3 AttenuationColor8_g166 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 DiffuseColor70_g166 = ( ( ( max( ( LightWrapVector47_g166 + ( ( 1.0 - LightWrapVector47_g166 ) * NDotL21_g166 ) ) , float3(0,0,0) ) * AttenuationColor8_g166 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * ( _BlinnSpecIntensity * _BlinnSpecColor ).rgb );
				float3 normalizeResult77_g166 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g166 = normalize( ( normalizeResult77_g166 + WorldViewDirection ) );
				float3 HalfDirection29_g166 = normalizeResult28_g166;
				float dotResult32_g166 = dot( HalfDirection29_g166 , CurrentNormal23_g166 );
				float SpecularPower14_g166 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g166 = ( AttenuationColor8_g166 * pow( max( dotResult32_g166 , 0.0 ) , SpecularPower14_g166 ) * _BSpecular );
				float3 temp_output_277_0 = ( DiffuseColor70_g166 + specularFinalColor42_g166 );
				float3 gammaToLinear299 = FastSRGBToLinear( temp_output_277_0 );
				float3 linearToGamma298 = FastLinearToSRGB( temp_output_277_0 );
				#if defined( _BLINNTYPE_LINEAR )
				float3 staticSwitch300 = gammaToLinear299;
				#elif defined( _BLINNTYPE_NORMAL )
				float3 staticSwitch300 = temp_output_277_0;
				#elif defined( _BLINNTYPE_GAMMA )
				float3 staticSwitch300 = linearToGamma298;
				#else
				float3 staticSwitch300 = gammaToLinear299;
				#endif
				float3 BlinnSpecularRef283 = (( _BlinnSpecSwitch )?( (saturate( staticSwitch300 )*_BlinnScale + _BlinnOffset) ):( temp_cast_60 ));
				
				float4 temp_cast_64 = (Zero75).xxxx;
				float4 DefSpecRef214 = (( _DefSpecSwitch )?( ( _SpecularColor * _SpecularIntensity ) ):( temp_cast_64 ));
				
				float DefSmoothRef215 = _Smoothness;
				
				float3 temp_cast_67 = (One74).xxx;
				float3 linearToGamma331 = LinearToGamma22( tex2DNode317.rgb );
				float3 temp_output_342_0 = (linearToGamma331*_TransContrast + _TransOffset);
				float3 TransparentRef336 = (( _TransparentSwitch )?( ( ( _Opacity * (( _TransparentInvert )?( ( 1.0 - temp_output_342_0 ) ):( temp_output_342_0 )) ) + _AdditiveTransparency ) ):( temp_cast_67 ));
				
				float ClipThresholdRef337 = _ClipThreshold;
				

				float3 BaseColor = BaseDiffuse29.rgb;
				float3 Normal = NewObjectNormal84;
				float3 Emission = ( Satin156 + ShadeColor57 + ThicknessRef201 + CurvatureRef261 + float4( BlinnSpecularRef283 , 0.0 ) ).rgb;
				float3 Specular = DefSpecRef214.rgb;
				float Metallic = 0;
				float Smoothness = DefSmoothRef215;
				float Occlusion = AORef219.r;
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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

				float One74 = 1.0;
				float3 temp_cast_0 = (One74).xxx;
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
			float4 _CurvatureMap_ST;
			float4 _ShadeColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransparentMap_ST;
			float4 _ThicknessColor;
			float4 _BlinnSpecColor;
			float4 _NormalMap_ST;
			float4 _BaseColor;
			float4 _SpecularColor;
			float4 _ThicknessMap_ST;
			float4 _CurvatureColor;
			float4 _BaseMap_ST;
			float4 _SatinColor;
			float4 _SecondColor;
			int _TwoColSwitch;
			float _CurvatureInvert;
			float _ThicknessIntensity;
			float _ThickPatternIntensity;
			float _ThicknessInvert;
			float _ThicknessSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _CurvatureSwitch;
			float _CurvScale;
			float _BLightWrapping;
			float _CurvatureIntensity;
			float _TransOffset;
			float _TransContrast;
			float _TransparentInvert;
			float _Opacity;
			float _TransparentSwitch;
			float _Smoothness;
			float _CurvOffset;
			float _SpecularIntensity;
			float _BlinnOffset;
			float _BlinnScale;
			float _BSpecular;
			float _BGloss;
			float _BlinnSpecIntensity;
			float _BlinnSpecSwitch;
			float _DefSpecSwitch;
			float _ShadingOffset;
			float _BaseCellOffset;
			float _ShadingContrast;
			float _NormalScale;
			float _Normal;
			float _VelvetInvert;
			float _SecondColorTextureSwitch;
			float _TextureAdd;
			float _TextureContrast;
			float _NormalScaleMultiplier;
			float _BaseMapInvert;
			float _AffectBaseAO;
			int _BlendingOp;
			int _AlphaCoverage;
			int _SpecularExtras;
			int _ShaderExtras;
			int _CullOp;
			float _TwoColors;
			float _ShadingContribution;
			float _VelvetBias;
			float _VelvetPower;
			float _BaseCellSharpness;
			float _AdditiveTransparency;
			float _ShadeColorToggle;
			float _SatinTransparency;
			float _SatinLightShade;
			float _SatinIntensity;
			float _VelvetScale;
			float _SatinSmoothing;
			float _SatinSwitch;
			float _AOOver;
			float _AmbientOcclusionIntensity;
			float _AOSwitch;
			float _VelvetIntensity;
			int _VelvetSwitch;
			float _SatinContrast;
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

				float One74 = 1.0;
				float3 temp_cast_0 = (One74).xxx;
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
	
	CustomEditor "BFabricEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;335;-5664,-5392;Inherit;False;2193.333;426.3335;Transparent Settings;17;344;343;337;336;334;316;320;313;319;318;323;330;307;342;331;317;348;Transparent Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;317;-5616,-5216;Inherit;True;Property;_TransparentMap;Transparent Map;70;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LinearToGammaNode;331;-5328,-5216;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-5296,-5056;Inherit;False;Property;_TransOffset;TransOffset;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;343;-5296,-5136;Inherit;False;Property;_TransContrast;TransContrast;74;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;342;-5088,-5216;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;73;-1008,-2448;Inherit;False;500.4297;637.82;Local Vars;14;359;358;310;346;353;352;77;345;351;78;76;75;74;79;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;330;-4864,-5120;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;323;-4720,-5216;Inherit;False;Property;_TransparentInvert;Transparent Invert;72;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-944,-2400;Inherit;False;Constant;_One1;[One];20;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;307;-4720,-5344;Inherit;False;Property;_Opacity;Opacity;67;0;Create;True;0;0;0;False;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;318;-4272,-5232;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;74;-736,-2400;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;319;-4400,-5104;Inherit;False;Property;_AdditiveTransparency;Additive Transparency;71;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;313;-4192,-5312;Inherit;False;74;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;320;-4128,-5232;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;316;-4000,-5312;Inherit;False;Property;_TransparentSwitch;TransparentSwitch;69;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;334;-4032,-5120;Inherit;False;Property;_ClipThreshold;Clip Threshold;73;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;303;-3008,-3248;Inherit;False;2483.125;705.3333;Blinn Spec Settings;19;283;301;302;291;295;293;292;300;299;298;277;288;286;287;278;280;279;294;281;Blinn Spec Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;276;-192,-3408;Inherit;False;471.3333;469.3333;Emission Final Comp;6;284;159;158;72;262;202;Emission Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;275;-2592,-4832;Inherit;False;2251.341;523.4673;Curvature Settings;16;264;263;261;274;270;273;272;271;268;265;365;364;363;269;260;267;Curvature Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;218;-4741.356,-1968;Inherit;False;1655.196;454.6149;AO Settings;14;374;375;372;172;376;130;128;171;174;173;378;219;177;175;AO Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;213;-5680,-4048;Inherit;False;1005.081;472.9957;Default Specular Settings;8;215;214;100;99;170;223;224;354;Default Specular Settings;0.7044024,0.6168197,0.369922,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-3424,-5648;Inherit;False;2312.076;670.5859;Thickness Settings;17;222;221;180;183;182;186;185;184;199;198;197;201;195;196;178;179;181;Thickness Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-3008,-2448;Inherit;False;1965.694;634.7175;Velvet Settings;17;167;165;166;212;23;20;19;17;18;21;16;13;15;14;12;22;134;Velvet Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-3118.067,-4000;Inherit;False;2822.332;706.2274;Base Map Settings;24;371;370;369;210;29;98;259;258;257;31;33;34;203;26;28;367;209;208;366;32;30;211;27;132;Base Map Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;35;-5680,-2880;Inherit;False;2608.624;842.6057;Shading Settings;36;71;70;69;68;67;66;65;64;63;62;61;60;59;58;57;56;55;54;53;52;51;50;49;48;47;46;45;44;43;42;41;40;39;38;37;36;Shading Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;80;-5680,-3488;Inherit;False;1677.697;524.9119;Normals;9;304;88;89;87;85;86;84;83;306;Normals;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;81;-3968,-4064;Inherit;False;776.7012;500.1391;Normal Light Direction;4;97;96;95;90;Normal Light Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;82;-3968,-3488;Inherit;False;759.532;517.5227;Normal View Direction;4;94;93;92;91;Normal View Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;135;-5664,-4928;Inherit;False;3023.64;842.0127;Satin;32;156;160;161;145;360;350;349;361;140;144;164;162;163;154;157;148;147;146;136;149;155;153;152;151;150;143;142;141;139;138;137;362;Satin;1,0.5447499,0.2924527,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;336;-3744,-5312;Inherit;False;TransparentRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;337;-3744,-5120;Inherit;False;ClipThresholdRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;43;-4656,-2400;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;45;-5008,-2400;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;46;-5168,-2400;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;54;-4160,-2704;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-3296,-2608;Float;False;ShadeColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;63;-4032,-2704;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-5312,-2400;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;70;-3952,-2240;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;71;-5440,-2192;Inherit;False;Property;_ShadingContrast;Shading Contrast;18;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;83;-4224,-3440;Float;True;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;84;-4224,-3216;Inherit;True;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;86;-4464,-3440;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;91;-3936,-3440;Inherit;True;83;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;92;-3936,-3200;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;93;-3696,-3328;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;94;-3472,-3328;Float;True;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;95;-3936,-3776;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;90;-3456,-3904;Float;True;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;56;-3712,-2784;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-3936,-4016;Inherit;True;83;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;96;-3680,-3904;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;61;-3872,-2704;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-4352,-2416;Inherit;False;Property;_ShadeContrast;Shade Contrast;17;0;Create;True;0;0;0;False;0;False;2;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-5664,-2832;Float;False;Property;_BaseCellOffset;Base Cell Offset;21;0;Create;True;0;0;0;False;0;False;0;-0.151;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;48;-4528,-2832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;58;-3536,-2608;Inherit;False;Property;_ShadeColorToggle;ShadeColorToggle;15;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-3696,-2608;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-5008,-2208;Inherit;False;Property;_ShadingOffset;Shading Offset;20;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-5312,-2640;Float;False;Property;_BaseCellSharpness;Base Cell Sharpness;22;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-5664,-2624;Inherit;False;90;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-5536,-2336;Inherit;False;98;BaseTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;67;-5472,-2512;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-5008,-2128;Inherit;False;Property;_ShadingIntensity;Shading Intensity;16;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;60;-4624,-2272;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;41;-4656,-2656;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;42;-4512,-2656;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-4336,-2576;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-4352,-2832;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;51;-5392,-2832;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.4;False;4;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-5216,-2832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;47;-4800,-2768;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;37;-5040,-2640;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-4576,-2736;Inherit;False;29;BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;62;-4064,-2416;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;4;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;39;-5168,-2192;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-5008,-2288;Inherit;False;Property;_ShadingContribution;Shading Contribution;19;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;137;-4144,-4624;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0.1,0,0;False;2;FLOAT3;-0.1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;138;-4160,-4864;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;139;-3952,-4864;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;141;-4400,-4688;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;142;-4624,-4864;Inherit;False;Property;_SatinLightShade;Satin Light Shade;36;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;143;-4336,-4864;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;150;-4784,-4496;Inherit;False;Property;_SatinContrast;Satin Contrast;34;0;Create;True;0;0;0;False;0;False;1;2;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;151;-4512,-4496;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;152;-4320,-4496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;153;-4080,-4496;Inherit;False;Property;_SatinIntensity;Satin Intensity;33;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-5264,-4496;Inherit;False;Property;_SatinSmoothing;Satin Smoothing;35;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;149;-4992,-4496;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;136;-4496,-4608;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;-5312,-4784;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;147;-5168,-4720;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;148;-5568,-4864;Inherit;False;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;157;-5568,-4592;Inherit;False;83;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;154;-5632,-4704;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LinearToGammaNode;163;-5040,-4608;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;162;-5040,-4736;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;164;-4752,-4704;Inherit;False;Property;_SatinType;SatinType;31;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-1760,-5472;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-2064,-5424;Inherit;False;Property;_ThicknessIntensity;Thickness Intensity;44;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;-1776,-5568;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;195;-1584,-5536;Inherit;False;Property;_ThicknessSwitch;ThicknessSwitch;41;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;201;-1360,-5536;Inherit;False;ThicknessRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;170;-5376,-3888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;197;-3328,-5264;Inherit;False;98;BaseTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;198;-3392,-5344;Inherit;False;Property;_ThickPatternIntensity;Thick Pattern Intensity;45;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;-3104,-5296;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;184;-2368,-5328;Inherit;False;Property;_ThicknessType;ThicknessType;42;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;185;-2592,-5232;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;186;-2592,-5344;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;182;-1968,-5328;Inherit;False;Property;_ThicknessInvert;Thickness Invert;43;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;183;-2112,-5232;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;180;-3248,-5184;Inherit;True;Property;_ThicknessMap;Thickness Map;47;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;221;-2944,-5296;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;222;-2832,-5296;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;214;-4896,-3888;Inherit;False;DefSpecRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;215;-4896,-3728;Inherit;False;DefSmoothRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;224;-5392,-3984;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;178;-2016,-5600;Inherit;False;Property;_ThicknessColor;Thickness Color;46;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;-4672,-2576;Inherit;False;Property;_ShadeColor;Shade Color;14;1;[Header];Create;True;1;Shade Settings;0;0;False;0;False;0.35,0.35,0.35,1;0.6313726,0.227451,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;267;-2224,-4624;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;260;-2544,-4704;Inherit;True;Property;_CurvatureMap;Curvature Map;52;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;281;-2704,-2752;Inherit;False;Property;_BLightWrapping;BLightWrapping;64;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;294;-2416,-2752;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;-100;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-2704,-2912;Inherit;False;Property;_BSpecular;BSpecular;62;0;Create;True;0;0;0;False;0;False;0;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;280;-2704,-2832;Inherit;False;Property;_BGloss;BGloss;63;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;278;-2656,-3008;Inherit;False;84;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;287;-2896,-3104;Inherit;False;Property;_BlinnSpecColor;Blinn Spec Color;61;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;286;-2960,-3200;Inherit;False;Property;_BlinnSpecIntensity;Blinn Spec Intensity;60;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;288;-2656,-3152;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;277;-2224,-3024;Inherit;False;BlinnPhongLightWrap;-1;;166;139fed909c1bc1a42a96c42d8cf09006;0;5;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;44;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;292;-1488,-2896;Inherit;False;Property;_BlinnScale;Blinn Scale;65;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-1488,-2816;Inherit;False;Property;_BlinnOffset;Blinn Offset;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;295;-1456,-2992;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;291;-1280,-2992;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;302;-1264,-3088;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;301;-1040,-3008;Inherit;False;Property;_BlinnSpecSwitch;BlinnSpecSwitch;55;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;283;-816,-3008;Inherit;False;BlinnSpecularRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;85;-4928,-3440;Inherit;True;Property;_Normal;Normal;26;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;87;-5200,-3440;Inherit;False;Normal Reconstruct Z;-1;;167;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;89;-5232,-3360;Inherit;True;Property;_NormalMap;Normal Map;27;2;[Header];[Normal];Create;False;1;Normal Controls;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;88;-5648,-3312;Float;False;Property;_NormalScale;Normal Scale;28;0;Create;False;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;306;-5376,-3280;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;348;-5328,-5328;Inherit;False;TransparentMapRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;144;-3776,-4800;Inherit;False;Property;_SatinColor;Satin Color;32;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;-3776,-4608;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;304;-5632,-3216;Inherit;False;Property;_NormalScaleMultiplier;Normal Scale Multiplier;29;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;-128,-3200;Inherit;False;201;ThicknessRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;262;-128,-3120;Inherit;False;261;CurvatureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-96,-3280;Inherit;False;57;ShadeColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-96,-3360;Inherit;False;156;Satin;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;159;144,-3280;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;284;-128,-3040;Inherit;False;283;BlinnSpecularRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;352,-3392;Inherit;False;29;BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;168;320,-3312;Inherit;False;84;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;216;352,-3216;Inherit;False;214;DefSpecRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;217;320,-3136;Inherit;False;215;DefSmoothRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;220;352,-3056;Inherit;False;219;AORef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;338;320,-2976;Inherit;False;336;TransparentRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;339;320,-2896;Inherit;False;337;ClipThresholdRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;75;-736,-2320;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;76;-736,-2240;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-944,-2320;Inherit;False;Constant;_Zero1;[Zero];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;-2976,-2384;Inherit;False;84;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;22;-2768,-2384;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;12;-2768,-2224;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;14;-2864,-1984;Inherit;False;Property;_VelvetScale;VelvetScale;12;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-2864,-1904;Inherit;False;Property;_VelvetPower;VelvetPower;13;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;16;-2560,-2224;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;21;-2272,-2096;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;18;-2096,-2176;Inherit;False;Property;_VelvetInvert;VelvetInvert;9;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1424,-2192;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;INT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;20;-1264,-2192;Inherit;False;FresnelResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-1264,-2064;Inherit;False;FresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1712,-2304;Inherit;False;Property;_VelvetIntensity;Velvet Intensity;10;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;166;-1872,-2096;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;165;-1872,-2208;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;351;-704,-2144;Inherit;False;Property;_TwoColSwitch;TwoColSwitch;78;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;345;-944,-2064;Inherit;False;Property;_CullOp;CullOp;76;1;[Enum];Create;True;0;3;Back;2;Front;1;Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-944,-2240;Inherit;False;Constant;_Gray;[Gray];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;167;-1648,-2192;Inherit;False;Property;_VelvetType;VelvetType;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;17;-1616,-2048;Inherit;False;Property;_VelvetSwitch;VelvetSwitch;7;1;[Enum];Create;True;0;2;On;1;Off;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;352;-704,-2064;Inherit;False;Property;_ShaderExtras;ShaderExtras;79;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;353;-704,-1984;Inherit;False;Property;_SpecularExtras;SpecularExtras;80;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;-5664,-3808;Inherit;False;Property;_SpecularIntensity;Specular Intensity;24;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-5664,-3728;Inherit;False;Property;_Smoothness;Smoothness;25;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;354;-5648,-4000;Inherit;False;Property;_SpecularColor;SpecularColor;81;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;13;-2864,-2064;Inherit;False;Property;_VelvetBias;VelvetBias;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;346;-960,-1984;Inherit;False;Property;_AlphaCoverage;AlphaCoverage;77;1;[Enum];Create;True;0;2;On;1;Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;310;-960,-2144;Inherit;False;Property;_BlendingOp;BlendingOp;68;1;[Enum];Create;True;0;4;Opaque;0;Transparent;1;Premultiplied;2;Additive;3;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;361;-3744,-4384;Inherit;False;74;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;349;-3984,-4304;Inherit;False;348;TransparentMapRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;350;-3712,-4304;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;360;-3552,-4400;Inherit;False;Property;_SatinTransparency;SatinTransparency;84;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;145;-3296,-4608;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;161;-3328,-4688;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;160;-3136,-4656;Inherit;False;Property;_SatinSwitch;SatinSwitch;30;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-2912,-4656;Inherit;True;Satin;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;362;-3584,-4272;Inherit;True;Property;_SatinMap;SatinMap;85;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;269;-2064,-4704;Inherit;False;Property;_CurvatureInvert;CurvatureInvert;49;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;363;-1856,-4624;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;364;-1856,-4736;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;365;-1632,-4720;Inherit;False;Property;_CurvType;CurvType;59;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;265;-1408,-4720;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;268;-1200,-4720;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;271;-1040,-4720;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;272;-832,-4720;Inherit;False;Property;_CurvatureSwitch;Curvature Switch;48;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;-1072,-4800;Inherit;False;75;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;-1328,-4592;Inherit;False;Property;_CurvatureIntensity;Curvature Intensity;50;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;274;-1264,-4512;Inherit;False;Property;_CurvatureColor;Curvature Color;51;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;261;-560,-4720;Inherit;False;CurvatureRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-1600,-4576;Inherit;False;Property;_CurvScale;CurvScale;53;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;264;-1600,-4480;Inherit;False;Property;_CurvOffset;CurvOffset;54;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;211;-2320,-3600;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-2;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;30;-2128,-3616;Inherit;False;Property;_SecondColor;Second Color;5;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1888,-3536;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;366;-1904,-3712;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;208;-2176,-3776;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;209;-2288,-3776;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;367;-1744,-3776;Inherit;False;Property;_BaseMapInvert;BaseMapInvert;86;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1520,-3840;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;26;-1744,-3952;Inherit;False;Property;_BaseColor;Base Color;0;1;[HDR];Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;203;-1680,-3600;Inherit;False;Property;_SecondColorTextureSwitch;SecondColorTextureSwitch;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-1616,-3488;Inherit;False;20;FresnelResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;33;-1280,-3744;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;31;-1136,-3840;Inherit;False;Property;_TwoColors;TwoColors;4;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;257;-1296,-3600;Inherit;False;219;AORef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;258;-912,-3760;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;259;-752,-3840;Inherit;False;Property;_AffectBaseAO;AffectBaseAO;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;98;-528,-3744;Inherit;False;BaseTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-528,-3840;Inherit;False;BaseDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-2624,-3600;Inherit;False;Property;_TextureContrast;Texture Contrast;2;0;Create;True;0;0;0;False;0;False;0.2;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;298;-1936,-2912;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;299;-1936,-3024;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-3088,-3872;Inherit;False;Property;_TextureAdd;TextureAdd;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;27;-3088,-3792;Inherit;True;Property;_BaseMap;Base Map;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LinearToGammaNode;369;-2768,-3680;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;370;-2768,-3792;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;371;-2544,-3776;Inherit;False;Property;_BaseMapType;BaseMapType;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;300;-1712,-3008;Inherit;False;Property;_BlinnType;BlinnType;58;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;175;-3536,-1920;Inherit;False;Property;_AOSwitch;AOSwitch;37;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;-3728,-1920;Inherit;False;74;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;219;-3312,-1920;Inherit;False;AORef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;378;-3696,-1824;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;173;-3968,-1824;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;174;-4128,-1824;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-4416,-1824;Inherit;False;Property;_AmbientOcclusionIntensity;Ambient Occlusion Intensity;40;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;128;-4400,-1744;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;130;-4400,-1648;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;376;-4192,-1728;Inherit;False;Property;_AOType;AOType;57;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;172;-4704,-1728;Inherit;True;Property;_AmbientOcclusionMap;AmbientOcclusionMap;39;0;Create;True;0;0;0;False;0;False;-1;593285cff36703c4b96849cdd499deaf;593285cff36703c4b96849cdd499deaf;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;375;-3872,-1728;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;374;-4192,-1600;Inherit;False;Property;_AOOver;AOOver;87;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;372;-3840,-1824;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;223;-5184,-3888;Inherit;False;Property;_DefSpecSwitch;DefSpecSwitch;23;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;359;-944,-1904;Inherit;False;Property;_DstBlend;DstBlend;83;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;358;-688,-1904;Inherit;False;Property;_SrcBlend;SrcBlend;82;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;True;_SrcBlend;10;True;_DstBlend;8;5;False;;1;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;True;_SrcBlend;10;True;_DstBlend;8;5;False;;1;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;656,-3328;Float;False;True;-1;2;BFabricEditor;0;19;BUDU Shaders/BFabric;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_TransparentAntialiasing;True;True;0;True;_CullOp;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;True;True;1;1;True;_SrcBlend;10;True;_DstBlend;8;5;False;;1;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638535519660674896;Workflow;0;638535519593557860;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;638536160684890531;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
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
WireConnection;57;0;58;0
WireConnection;63;0;54;0
WireConnection;65;0;67;0
WireConnection;65;1;68;0
WireConnection;83;0;86;0
WireConnection;84;0;85;0
WireConnection;86;0;85;0
WireConnection;93;0;91;0
WireConnection;93;1;92;0
WireConnection;94;0;93;0
WireConnection;90;0;96;0
WireConnection;96;0;97;0
WireConnection;96;1;95;0
WireConnection;61;0;63;0
WireConnection;61;1;62;0
WireConnection;48;0;47;0
WireConnection;58;0;56;0
WireConnection;58;1;55;0
WireConnection;55;0;61;0
WireConnection;55;1;70;0
WireConnection;67;0;66;0
WireConnection;60;0;59;0
WireConnection;41;0;47;0
WireConnection;42;0;41;0
WireConnection;38;0;42;0
WireConnection;38;1;44;0
WireConnection;38;2;43;0
WireConnection;38;3;60;0
WireConnection;49;0;48;0
WireConnection;49;1;40;0
WireConnection;51;0;50;0
WireConnection;52;0;51;0
WireConnection;52;1;66;0
WireConnection;47;0;52;0
WireConnection;47;1;37;0
WireConnection;37;0;36;0
WireConnection;62;0;64;0
WireConnection;39;0;71;0
WireConnection;137;0;136;0
WireConnection;137;1;151;0
WireConnection;137;2;152;0
WireConnection;138;0;143;0
WireConnection;138;1;141;0
WireConnection;139;0;138;0
WireConnection;143;0;142;0
WireConnection;151;0;150;0
WireConnection;152;0;151;0
WireConnection;149;0;155;0
WireConnection;136;0;164;0
WireConnection;136;1;149;0
WireConnection;146;0;148;0
WireConnection;146;1;154;1
WireConnection;147;0;146;0
WireConnection;147;1;157;0
WireConnection;163;0;147;0
WireConnection;162;0;147;0
WireConnection;164;1;162;0
WireConnection;164;0;147;0
WireConnection;164;2;163;0
WireConnection;181;0;178;0
WireConnection;181;1;182;0
WireConnection;181;2;179;0
WireConnection;195;0;196;0
WireConnection;195;1;181;0
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
WireConnection;214;0;223;0
WireConnection;215;0;100;0
WireConnection;267;0;260;0
WireConnection;294;0;281;0
WireConnection;288;0;286;0
WireConnection;288;1;287;0
WireConnection;277;1;288;0
WireConnection;277;4;278;0
WireConnection;277;2;279;0
WireConnection;277;3;280;0
WireConnection;277;44;294;0
WireConnection;295;0;300;0
WireConnection;291;0;295;0
WireConnection;291;1;292;0
WireConnection;291;2;293;0
WireConnection;301;0;302;0
WireConnection;301;1;291;0
WireConnection;283;0;301;0
WireConnection;85;0;87;0
WireConnection;85;1;89;0
WireConnection;89;5;306;0
WireConnection;306;0;88;0
WireConnection;306;1;304;0
WireConnection;348;0;317;0
WireConnection;140;0;137;0
WireConnection;140;1;153;0
WireConnection;140;2;139;0
WireConnection;159;0;158;0
WireConnection;159;1;72;0
WireConnection;159;2;202;0
WireConnection;159;3;262;0
WireConnection;159;4;284;0
WireConnection;75;0;78;0
WireConnection;76;0;77;0
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
WireConnection;20;0;19;0
WireConnection;23;0;17;0
WireConnection;166;0;18;0
WireConnection;165;0;18;0
WireConnection;167;1;165;0
WireConnection;167;0;18;0
WireConnection;167;2;166;0
WireConnection;350;0;349;0
WireConnection;360;0;361;0
WireConnection;360;1;350;0
WireConnection;145;0;144;0
WireConnection;145;1;140;0
WireConnection;145;2;360;0
WireConnection;145;3;362;0
WireConnection;160;0;161;0
WireConnection;160;1;145;0
WireConnection;156;0;160;0
WireConnection;362;1;147;0
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
WireConnection;272;0;273;0
WireConnection;272;1;271;0
WireConnection;261;0;272;0
WireConnection;211;0;210;0
WireConnection;32;0;30;0
WireConnection;32;1;208;0
WireConnection;366;0;208;0
WireConnection;208;1;209;0
WireConnection;208;0;211;0
WireConnection;209;0;132;0
WireConnection;209;1;371;0
WireConnection;367;0;208;0
WireConnection;367;1;366;0
WireConnection;28;0;26;0
WireConnection;28;1;367;0
WireConnection;203;0;30;0
WireConnection;203;1;32;0
WireConnection;33;0;28;0
WireConnection;33;1;203;0
WireConnection;33;2;34;0
WireConnection;31;0;28;0
WireConnection;31;1;33;0
WireConnection;258;0;31;0
WireConnection;258;1;257;0
WireConnection;259;0;31;0
WireConnection;259;1;258;0
WireConnection;98;0;259;0
WireConnection;29;0;259;0
WireConnection;298;0;277;0
WireConnection;299;0;277;0
WireConnection;369;0;27;0
WireConnection;370;0;27;0
WireConnection;371;1;370;0
WireConnection;371;0;27;0
WireConnection;371;2;369;0
WireConnection;300;1;299;0
WireConnection;300;0;277;0
WireConnection;300;2;298;0
WireConnection;175;0;177;0
WireConnection;175;1;378;0
WireConnection;219;0;175;0
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
WireConnection;375;0;374;0
WireConnection;372;0;173;0
WireConnection;223;0;224;0
WireConnection;223;1;170;0
WireConnection;2;0;24;0
WireConnection;2;1;168;0
WireConnection;2;2;159;0
WireConnection;2;9;216;0
WireConnection;2;4;217;0
WireConnection;2;5;220;0
WireConnection;2;6;338;0
WireConnection;2;7;339;0
ASEEND*/
//CHKSM=7237F77BB2E37E708A2778FDF41E07EB6384608D
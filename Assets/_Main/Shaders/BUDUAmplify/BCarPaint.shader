// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders ASE/BCarPaint"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Toggle]_TwoColors("Two Colors", Float) = 0
		_BaseColor("Base Color", Color) = (0.5,0.5,0.5)
		_SecondColor("Second Color", Color) = (0.4,0,0)
		[Toggle]_AffectReflectionFlakes("Affect Reflection Flakes", Float) = 0
		[Toggle]_FlakesNormal("FlakesNormal", Float) = 0
		[Toggle]_AffectBodyFlakes("Affect Body Flakes", Float) = 0
		[Toggle]_ColorFresnelInvert("Color Fresnel Invert", Float) = 0
		_FNormalScale("FNormal Scale", Range( -1 , 1)) = 1
		_ColFresnelBias("ColFresnelBias", Range( 0 , 1)) = 0
		_ColFresnelScale("ColFresnelScale", Range( 0 , 5)) = 1
		_ColFresnelPower("ColFresnelPower", Range( 0 , 5)) = 1
		_GradScale("GradScale", Float) = 1
		_GradOffset("GradOffset", Float) = 0
		[KeywordEnum(Fresnel,GradientY,GradientYFresnel)] _PaintMethod("PaintMethod", Float) = 0
		[Toggle]_Reflect("Reflect", Float) = 0
		[Toggle]_GradYInvert("GradYInvert", Float) = 0
		_ReflectionStrength("Reflection Strength", Range( 0 , 1)) = 1
		_ReflectionMultiplier("Reflection Multiplier", Range( 0 , 10)) = 1
		_FlakesOut("Flakes Out", Range( 0 , 1)) = 1
		[HDR]_ReflectColor("Reflect Color", Color) = (1,1,1)
		_SpecularOut("Specular Out", Range( 0 , 1)) = 1
		_Glossy("Glossy", Range( 1 , 100)) = 1
		[NoScaleOffset]_ReflectMap("Reflect Map", CUBE) = "white" {}
		_FlakesGlossy("Flakes Glossy", Range( 1 , 100)) = 1
		_CubeMapRotate("Cube Map Rotate", Range( 0 , 360)) = 0
		_RefFresnelSwitch("RefFresnelSwitch", Int) = 0
		_SpecularIn("Specular In", Range( 0 , 1)) = 0
		_CMYPos("CM Y Pos", Range( -5 , 5)) = 0
		[Toggle]_RefFresnelInvert("Ref Fresnel Invert", Float) = 0
		[Header(Shade Settings)]_ShadeColor("Shade Color", Color) = (0.35,0.35,0.35)
		_FlakesIn("Flakes In", Range( 0 , 1)) = 0
		_CMXPos("CM X Pos", Range( -2 , 2)) = 0
		_ShadeContrast("Shade Contrast", Range( 0 , 2)) = 1
		_BaseCellSharpness("Base Cell Sharpness", Range( 0 , 1)) = 1
		_RefFresnelBias("RefFresnelBias", Range( 0 , 1)) = 0
		_FlakesSaturation("Flakes Saturation", Range( 0 , 1)) = 1
		_BaseCellOffset("Base Cell Offset", Range( 0 , 1)) = 0
		_ShadingContribution("Shading Contribution", Range( 0 , 2)) = 1
		_RefFresnelScale("RefFresnelScale", Range( 0 , 5)) = 1
		_ShadingOffset("Shading Offset", Range( 0 , 2)) = 0
		_CMZPos("CM Z Pos", Range( -2 , 2)) = 0
		_ShadingContrast("Shading Contrast", Range( 0 , 5)) = 1
		_SpecularSaturation("Specular Saturation", Range( 0 , 1)) = 1
		_RefFresnelPower("RefFresnelPower", Range( 0 , 5)) = 1
		_ShadingIntensity("Shading Intensity", Range( 0 , 2)) = 1
		[Toggle]_ShadeColorToggle("ShadeColorToggle", Float) = 0
		_FlakesIntensity("Flakes Intensity", Range( 0 , 5)) = 1
		_SpecularIntensity("Specular Intensity", Range( 0 , 5)) = 2.050727
		[HDR]_FlakesColor("Flakes Color", Color) = (1,1,1)
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1)
		[Toggle]_FlakesSwitch("Flakes Switch", Float) = 0
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		[HDR]_Softness("Softness", Range( 0 , 3)) = 0.001
		[HDR]_FlakesSoftness("Flakes Softness", Range( 0 , 3)) = 1
		_CubeMapExtras("CubeMapExtras", Int) = 0
		_BaseColorToggle("BaseColorToggle", Int) = 0
		_AOFold("AOFold", Int) = 0
		_CheckDef("CheckDef", Int) = 0
		_FresnelFold("FresnelFold", Int) = 0
		_SpecularExtras("SpecularExtras", Int) = 0
		_TexturedFlakesToggle("TexturedFlakesToggle", Int) = 0
		_ShadeExtras("ShadeExtras", Int) = 0
		_SpecularNormalIntensity("SpecularNormalIntensity", Range( 0 , 1)) = 0.3
		_FlakesExtras("FlakesExtras", Int) = 0
		_FlakesNormalExtras("FlakesNormalExtras", Int) = 0
		[NoScaleOffset]_FlakesNormalMap("FlakesNormalMap", 2D) = "bump" {}
		_FNTileX("FNTileX", Float) = 1
		_FNOffsetX("FNOffsetX", Float) = 0
		_FNOffsetY("FNOffsetY", Float) = 0
		_FNTileY("FNTileY", Float) = 1
		_FNormalMultiplier("FNormalMultiplier", Range( 1 , 10)) = 1
		_BodyFNormalMulti("BodyFNormalMulti", Range( -1 , 1)) = 0.1
		_RefFNormalMulti("RefFNormalMulti", Range( -1 , 1)) = 0.1
		_BaseSpecular("BaseSpecular", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_FlakesGloss("Flakes Gloss", Range( 0 , 1)) = 1
		_FlakesMax("FlakesMax", Range( 0 , 1)) = 1
		_FlakesMin("FlakesMin", Range( 0 , 1)) = 0
		_FlakesTileY("FlakesTile Y", Float) = 1
		_FlakesTileX("FlakesTile X", Float) = 1
		_FlakesRotSpeed("Flakes Rot Speed", Range( 0 , 4)) = 0.3
		[Toggle]_TexturedFlakes("TexturedFlakes", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _FresnelType("FresnelType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _GradType("GradType", Float) = 2
		[KeywordEnum(Linear,Normal,Gamma)] _RefFrsType("RefFrsType", Float) = 0
		[NoScaleOffset]_FlakesTexture("Flakes Texture", 2D) = "white" {}
		_BGloss("BGloss", Range( 0 , 5)) = 1
		_SpecMax("SpecMax", Range( 0 , 1)) = 1
		_SpecMin("SpecMin", Range( 0 , 1)) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SpecType("SpecType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _FlakesType("FlakesType", Float) = 0
		_FlakesTextureIntensity("FlakesTextureIntensity", Range( 0 , 10)) = 1
		_ReflectLightPower("ReflectLightPower", Range( 0 , 10)) = 1
		_ReflectLightAdd("ReflectLightAdd", Range( 0 , 1)) = 0.02
		[Toggle]_ReflectLightAffect("ReflectLightAffect", Float) = 0
		_AmbientOcclusionTexture("Ambient Occlusion Texture", 2D) = "white" {}
		_AOTextureContrast("AO Texture Contrast", Range( 0 , 4)) = 1
		_AOTextureIntensity("AO Texture Intensity", Range( 0 , 1)) = 1
		[Toggle]_AOToggle("AOToggle", Float) = 0
		_AOColor("AOColor", Color) = (0,0,0)
		[Toggle]_RefAffectAO("RefAffectAO", Float) = 0
		_RefAOIntensity("RefAOIntensity", Range( 0 , 1)) = 0.2
		[HDR]_BaseSpecularColor("BaseSpecularColor", Color) = (1,1,1)
		[Toggle]_BaseSpecularSwitch("BaseSpecularSwitch", Float) = 0
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
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

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
			#define _NORMAL_DROPOFF_TS 1
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
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _PAINTMETHOD_FRESNEL _PAINTMETHOD_GRADIENTY _PAINTMETHOD_GRADIENTYFRESNEL
			#pragma shader_feature_local _FRESNELTYPE_LINEAR _FRESNELTYPE_NORMAL _FRESNELTYPE_GAMMA
			#pragma shader_feature_local _GRADTYPE_LINEAR _GRADTYPE_NORMAL _GRADTYPE_GAMMA
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA
			#pragma shader_feature_local _FLAKESTYPE_LINEAR _FLAKESTYPE_NORMAL _FLAKESTYPE_GAMMA
			#pragma shader_feature_local _REFFRSTYPE_LINEAR _REFFRSTYPE_NORMAL _REFFRSTYPE_GAMMA


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
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			sampler2D _FlakesNormalMap;
			sampler2D _AmbientOcclusionTexture;
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


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

				o.ase_texcoord8.xyz = v.texcoord.xyz;
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

				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = normalize( appendResult10_g157 );
				float3 temp_output_976_0 = normalizeResult12_g157;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord8.xyz.xy * appendResult661 + appendResult662;
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 RF_FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal527 = RF_FlakesObjectNormals776;
				float3 worldNormal527 = float3(dot(tanToWorld0,tanNormal527), dot(tanToWorld1,tanNormal527), dot(tanToWorld2,tanNormal527));
				float fresnelNdotV525 = dot( normalize( worldNormal527 ), ase_tanViewDir );
				float fresnelNode525 = ( _ColFresnelBias + _ColFresnelScale * pow( max( 1.0 - fresnelNdotV525 , 0.0001 ), _ColFresnelPower ) );
				float3 temp_cast_0 = (fresnelNode525).xxx;
				float3 temp_cast_1 = (fresnelNode525).xxx;
				float3 gammaToLinear771 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (fresnelNode525).xxx;
				float3 temp_cast_3 = (fresnelNode525).xxx;
				float3 temp_cast_4 = (fresnelNode525).xxx;
				float3 linearToGamma1015 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (fresnelNode525).xxx;
				#if defined( _FRESNELTYPE_LINEAR )
				float3 staticSwitch1017 = gammaToLinear771;
				#elif defined( _FRESNELTYPE_NORMAL )
				float3 staticSwitch1017 = temp_cast_2;
				#elif defined( _FRESNELTYPE_GAMMA )
				float3 staticSwitch1017 = linearToGamma1015;
				#else
				float3 staticSwitch1017 = gammaToLinear771;
				#endif
				float3 RF_ColFresnel536 = saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) );
				float temp_output_565_0 = (0.0 + (IN.ase_normal.y - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float3 temp_cast_6 = (temp_output_565_0).xxx;
				float3 temp_cast_7 = (temp_output_565_0).xxx;
				float3 gammaToLinear1018 = Gamma22ToLinear( temp_cast_7 );
				float3 temp_cast_8 = (temp_output_565_0).xxx;
				float3 temp_cast_9 = (temp_output_565_0).xxx;
				float3 temp_cast_10 = (temp_output_565_0).xxx;
				float3 linearToGamma1019 = LinearToGamma22( temp_cast_10 );
				float3 temp_cast_11 = (temp_output_565_0).xxx;
				#if defined( _GRADTYPE_LINEAR )
				float3 staticSwitch1020 = gammaToLinear1018;
				#elif defined( _GRADTYPE_NORMAL )
				float3 staticSwitch1020 = temp_cast_8;
				#elif defined( _GRADTYPE_GAMMA )
				float3 staticSwitch1020 = linearToGamma1019;
				#else
				float3 staticSwitch1020 = linearToGamma1019;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 RF_ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = RF_ColFresnel536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = RF_ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( RF_ColFresnel536 + RF_ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = RF_ColFresnel536;
				#endif
				float3 lerpResult538 = lerp( _BaseColor , _SecondColor , saturate( staticSwitch574 ));
				float RF_One514 = 1.0;
				float4 temp_cast_13 = (RF_One514).xxxx;
				float2 uv_AmbientOcclusionTexture = IN.ase_texcoord8.xyz.xy * _AmbientOcclusionTexture_ST.xy + _AmbientOcclusionTexture_ST.zw;
				float4 temp_output_1345_0 = ( ( tex2D( _AmbientOcclusionTexture, uv_AmbientOcclusionTexture ) + ( 1.0 - _AOTextureIntensity ) ) + float4( _AOColor , 0.0 ) );
				float4 RF_AOColor1346 = (( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_13 ));
				float4 RF_BaseDiffuse540 = ( float4( (( _TwoColors )?( lerpResult538 ):( _BaseColor )) , 0.0 ) * RF_AOColor1346 );
				
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 RF_FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				
				float RF_Zero515 = 0.0;
				float3 temp_cast_16 = (RF_Zero515).xxx;
				float ifLocalVar1356 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar1356 = _SpecularOut;
				else
				ifLocalVar1356 = _SpecularIn;
				float3 temp_cast_17 = (ifLocalVar1356).xxx;
				float3 temp_cast_18 = (_SpecularOut).xxx;
				float ifLocalVar1299 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar1299 = _SpecMax;
				else
				ifLocalVar1299 = _SpecMin;
				float3 tanNormal1361 = RF_FlakesObjectNormals776;
				float3 worldNormal1361 = float3(dot(tanToWorld0,tanNormal1361), dot(tanToWorld1,tanNormal1361), dot(tanToWorld2,tanNormal1361));
				float3 normalizeResult1362 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult1367 = dot( ( worldNormal1361 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult1362 );
				float RF_LightNormal1368 = dotResult1367;
				float smoothstepResult1278 = smoothstep( ifLocalVar1299 , _SpecMax , pow( RF_LightNormal1368 , (0.01 + (_BGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g3 = smoothstepResult1278;
				float temp_output_1080_0 = saturate( ( temp_output_2_0_g3 * temp_output_2_0_g3 ) );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				float3 temp_cast_23 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_23 );
				float3 temp_cast_24 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_21;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_17 , temp_cast_18 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 saferPower699 = abs( saturate( smoothstepResult977 ) );
				float3 temp_cast_25 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_26 = (0.0).xxx;
				float3 temp_cast_27 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_25 ) ) , temp_cast_26 , temp_cast_27 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 RF_Specular2698 = (( _SpecularSwitch )?( (( clampResult681 * _SpecColor * ase_lightColor.rgb )*_SpecularIntensity + 0.0) ):( temp_cast_16 ));
				float ifLocalVar1355 = 0;
				if( _FlakesIn >= _FlakesOut )
				ifLocalVar1355 = _FlakesOut;
				else
				ifLocalVar1355 = _FlakesIn;
				float4 temp_cast_29 = ((0.0 + (ifLocalVar1355 - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_30 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float ifLocalVar1300 = 0;
				if( _FlakesMin >= _FlakesMax )
				ifLocalVar1300 = _FlakesMax;
				else
				ifLocalVar1300 = _FlakesMin;
				float smoothstepResult1304 = smoothstep( ifLocalVar1300 , _FlakesMax , pow( RF_LightNormal1368 , (0.01 + (_FlakesGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g4 = smoothstepResult1304;
				float temp_output_1083_0 = saturate( ( temp_output_2_0_g4 * temp_output_2_0_g4 ) );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_32 );
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				float3 temp_cast_35 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_35 );
				float3 temp_cast_36 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_33;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_29 , temp_cast_30 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_38 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_39 = (0.0).xxxx;
				float4 temp_cast_40 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_38 ) ) , temp_cast_39 , temp_cast_40 );
				float4 temp_cast_42 = (RF_One514).xxxx;
				float2 appendResult1007 = (float2(_FlakesTileX , _FlakesTileY));
				float2 texCoord1005 = IN.ase_texcoord8.xyz.xy * appendResult1007 + float2( 1,1 );
				float mulTime1006 = _TimeParameters.x * _FlakesRotSpeed;
				float temp_output_1014_0 = radians( mulTime1006 );
				float cos1004 = cos( temp_output_1014_0 );
				float sin1004 = sin( temp_output_1014_0 );
				float2 rotator1004 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1004 , -sin1004 , sin1004 , cos1004 )) + float2( -1,-1 );
				float cos1036 = cos( ( 1.0 - temp_output_1014_0 ) );
				float sin1036 = sin( ( 1.0 - temp_output_1014_0 ) );
				float2 rotator1036 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1036 , -sin1036 , sin1036 , cos1036 )) + float2( -1,-1 );
				float4 RF_Flakes595 = (( _FlakesSwitch )?( (( clampResult590 * float4( _FlakesColor , 0.0 ) * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_42 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_43 = (RF_Zero515).xxxx;
				float3 temp_cast_44 = (_ReflectionStrength).xxx;
				float3 temp_cast_45 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_45 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) )) );
				float3 RF_FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, RF_FlakesReflectNormals810 ), dot( tanToWorld1, RF_FlakesReflectNormals810 ), dot( tanToWorld2, RF_FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g155 = worldRefl725;
				float3 appendResult10_g155 = (float3(0.0 , VertexPos5_g155.y , 0.0));
				float3 VertexPosRotationAxis11_g155 = appendResult10_g155;
				float3 break13_g155 = VertexPos5_g155;
				float3 appendResult14_g155 = (float3(break13_g155.x , 0.0 , break13_g155.z));
				float3 VertexPosOtherAxis12_g155 = appendResult14_g155;
				float Angle3_g155 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal758 = RF_FlakesReflectNormals810;
				float3 worldNormal758 = float3(dot(tanToWorld0,tanNormal758), dot(tanToWorld1,tanNormal758), dot(tanToWorld2,tanNormal758));
				float fresnelNdotV756 = dot( normalize( worldNormal758 ), WorldViewDirection );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 temp_cast_49 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_49 );
				float3 temp_cast_50 = (fresnelNode756).xxx;
				float3 temp_cast_51 = (fresnelNode756).xxx;
				float3 temp_cast_52 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_52 );
				float3 temp_cast_53 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_50;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 Rf_FresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float saferPower1320 = abs( (0) );
				float RF_ReflectLightControl1324 = (( _ReflectLightAffect )?( ( pow( saferPower1320 , _ReflectLightPower ) + _ReflectLightAdd ) ):( RF_One514 ));
				float4 temp_cast_55 = (RF_One514).xxxx;
				float luminance1351 = Luminance((( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_55 )).rgb);
				float RF_AO1334 = luminance1351;
				float4 RF_Reflect745 = (( _Reflect )?( ( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g155 + ( VertexPosOtherAxis12_g155 * cos( Angle3_g155 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g155 ) * sin( Angle3_g155 ) ) ) + appendResult727 ) ) * float4( _ReflectColor , 0.0 ) ) * float4( ( 1.0 - Rf_FresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * RF_One514 ) + RF_One514 ) ) * RF_ReflectLightControl1324 * (( _RefAffectAO )?( ( RF_AO1334 + _RefAOIntensity ) ):( RF_One514 )) ) ):( temp_cast_43 ));
				float4 temp_cast_57 = (RF_Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879));
				float3 RF_FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( RF_FlakesNormal876 , SafeNormalize(_MainLightPosition.xyz) );
				float RF_NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_59 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * RF_BaseDiffuse540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * float4( _ShadeColor , 0.0 ) * (pow( saturate( ( -RF_NormalLightDirection857 * RF_BaseDiffuse540 ) ) , temp_cast_59 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_60 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 RF_ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_60 ) * ase_lightColor ) ):( temp_cast_57 ));
				
				float3 temp_cast_62 = (RF_Zero515).xxx;
				float3 RF_BaseSpecular1379 = (( _BaseSpecularSwitch )?( ( _BaseSpecularColor * _BaseSpecular ) ):( temp_cast_62 ));
				

				float3 BaseColor = RF_BaseDiffuse540.rgb;
				float3 Normal = RF_FlakesBodyNormals806;
				float3 Emission = ( float4( RF_Specular2698 , 0.0 ) + saturate( ( RF_Flakes595 + RF_Reflect745 + RF_ShadeColor840 ) ) ).rgb;
				float3 Specular = RF_BaseSpecular1379;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = RF_AO1334;
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

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _PAINTMETHOD_FRESNEL _PAINTMETHOD_GRADIENTY _PAINTMETHOD_GRADIENTYFRESNEL
			#pragma shader_feature_local _FRESNELTYPE_LINEAR _FRESNELTYPE_NORMAL _FRESNELTYPE_GAMMA
			#pragma shader_feature_local _GRADTYPE_LINEAR _GRADTYPE_NORMAL _GRADTYPE_GAMMA
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA
			#pragma shader_feature_local _FLAKESTYPE_LINEAR _FLAKESTYPE_NORMAL _FLAKESTYPE_GAMMA
			#pragma shader_feature_local _REFFRSTYPE_LINEAR _REFFRSTYPE_NORMAL _REFFRSTYPE_GAMMA


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
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			sampler2D _FlakesNormalMap;
			sampler2D _AmbientOcclusionTexture;
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


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
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord7.xyz = v.texcoord0.xyz;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
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

				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = normalize( appendResult10_g157 );
				float3 temp_output_976_0 = normalizeResult12_g157;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord7.xyz.xy * appendResult661 + appendResult662;
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 RF_FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal527 = RF_FlakesObjectNormals776;
				float3 worldNormal527 = float3(dot(tanToWorld0,tanNormal527), dot(tanToWorld1,tanNormal527), dot(tanToWorld2,tanNormal527));
				float fresnelNdotV525 = dot( normalize( worldNormal527 ), ase_tanViewDir );
				float fresnelNode525 = ( _ColFresnelBias + _ColFresnelScale * pow( max( 1.0 - fresnelNdotV525 , 0.0001 ), _ColFresnelPower ) );
				float3 temp_cast_0 = (fresnelNode525).xxx;
				float3 temp_cast_1 = (fresnelNode525).xxx;
				float3 gammaToLinear771 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (fresnelNode525).xxx;
				float3 temp_cast_3 = (fresnelNode525).xxx;
				float3 temp_cast_4 = (fresnelNode525).xxx;
				float3 linearToGamma1015 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (fresnelNode525).xxx;
				#if defined( _FRESNELTYPE_LINEAR )
				float3 staticSwitch1017 = gammaToLinear771;
				#elif defined( _FRESNELTYPE_NORMAL )
				float3 staticSwitch1017 = temp_cast_2;
				#elif defined( _FRESNELTYPE_GAMMA )
				float3 staticSwitch1017 = linearToGamma1015;
				#else
				float3 staticSwitch1017 = gammaToLinear771;
				#endif
				float3 RF_ColFresnel536 = saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) );
				float temp_output_565_0 = (0.0 + (IN.ase_normal.y - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float3 temp_cast_6 = (temp_output_565_0).xxx;
				float3 temp_cast_7 = (temp_output_565_0).xxx;
				float3 gammaToLinear1018 = Gamma22ToLinear( temp_cast_7 );
				float3 temp_cast_8 = (temp_output_565_0).xxx;
				float3 temp_cast_9 = (temp_output_565_0).xxx;
				float3 temp_cast_10 = (temp_output_565_0).xxx;
				float3 linearToGamma1019 = LinearToGamma22( temp_cast_10 );
				float3 temp_cast_11 = (temp_output_565_0).xxx;
				#if defined( _GRADTYPE_LINEAR )
				float3 staticSwitch1020 = gammaToLinear1018;
				#elif defined( _GRADTYPE_NORMAL )
				float3 staticSwitch1020 = temp_cast_8;
				#elif defined( _GRADTYPE_GAMMA )
				float3 staticSwitch1020 = linearToGamma1019;
				#else
				float3 staticSwitch1020 = linearToGamma1019;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 RF_ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = RF_ColFresnel536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = RF_ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( RF_ColFresnel536 + RF_ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = RF_ColFresnel536;
				#endif
				float3 lerpResult538 = lerp( _BaseColor , _SecondColor , saturate( staticSwitch574 ));
				float RF_One514 = 1.0;
				float4 temp_cast_13 = (RF_One514).xxxx;
				float2 uv_AmbientOcclusionTexture = IN.ase_texcoord7.xyz.xy * _AmbientOcclusionTexture_ST.xy + _AmbientOcclusionTexture_ST.zw;
				float4 temp_output_1345_0 = ( ( tex2D( _AmbientOcclusionTexture, uv_AmbientOcclusionTexture ) + ( 1.0 - _AOTextureIntensity ) ) + float4( _AOColor , 0.0 ) );
				float4 RF_AOColor1346 = (( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_13 ));
				float4 RF_BaseDiffuse540 = ( float4( (( _TwoColors )?( lerpResult538 ):( _BaseColor )) , 0.0 ) * RF_AOColor1346 );
				
				float RF_Zero515 = 0.0;
				float3 temp_cast_16 = (RF_Zero515).xxx;
				float ifLocalVar1356 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar1356 = _SpecularOut;
				else
				ifLocalVar1356 = _SpecularIn;
				float3 temp_cast_17 = (ifLocalVar1356).xxx;
				float3 temp_cast_18 = (_SpecularOut).xxx;
				float ifLocalVar1299 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar1299 = _SpecMax;
				else
				ifLocalVar1299 = _SpecMin;
				float3 tanNormal1361 = RF_FlakesObjectNormals776;
				float3 worldNormal1361 = float3(dot(tanToWorld0,tanNormal1361), dot(tanToWorld1,tanNormal1361), dot(tanToWorld2,tanNormal1361));
				float3 normalizeResult1362 = normalize( ( ase_worldViewDir + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult1367 = dot( ( worldNormal1361 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult1362 );
				float RF_LightNormal1368 = dotResult1367;
				float smoothstepResult1278 = smoothstep( ifLocalVar1299 , _SpecMax , pow( RF_LightNormal1368 , (0.01 + (_BGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g3 = smoothstepResult1278;
				float temp_output_1080_0 = saturate( ( temp_output_2_0_g3 * temp_output_2_0_g3 ) );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				float3 temp_cast_23 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_23 );
				float3 temp_cast_24 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_21;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_17 , temp_cast_18 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 saferPower699 = abs( saturate( smoothstepResult977 ) );
				float3 temp_cast_25 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_26 = (0.0).xxx;
				float3 temp_cast_27 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_25 ) ) , temp_cast_26 , temp_cast_27 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 RF_Specular2698 = (( _SpecularSwitch )?( (( clampResult681 * _SpecColor * ase_lightColor.rgb )*_SpecularIntensity + 0.0) ):( temp_cast_16 ));
				float ifLocalVar1355 = 0;
				if( _FlakesIn >= _FlakesOut )
				ifLocalVar1355 = _FlakesOut;
				else
				ifLocalVar1355 = _FlakesIn;
				float4 temp_cast_29 = ((0.0 + (ifLocalVar1355 - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_30 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float ifLocalVar1300 = 0;
				if( _FlakesMin >= _FlakesMax )
				ifLocalVar1300 = _FlakesMax;
				else
				ifLocalVar1300 = _FlakesMin;
				float smoothstepResult1304 = smoothstep( ifLocalVar1300 , _FlakesMax , pow( RF_LightNormal1368 , (0.01 + (_FlakesGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g4 = smoothstepResult1304;
				float temp_output_1083_0 = saturate( ( temp_output_2_0_g4 * temp_output_2_0_g4 ) );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_32 );
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				float3 temp_cast_35 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_35 );
				float3 temp_cast_36 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_33;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_29 , temp_cast_30 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_38 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_39 = (0.0).xxxx;
				float4 temp_cast_40 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_38 ) ) , temp_cast_39 , temp_cast_40 );
				float4 temp_cast_42 = (RF_One514).xxxx;
				float2 appendResult1007 = (float2(_FlakesTileX , _FlakesTileY));
				float2 texCoord1005 = IN.ase_texcoord7.xyz.xy * appendResult1007 + float2( 1,1 );
				float mulTime1006 = _TimeParameters.x * _FlakesRotSpeed;
				float temp_output_1014_0 = radians( mulTime1006 );
				float cos1004 = cos( temp_output_1014_0 );
				float sin1004 = sin( temp_output_1014_0 );
				float2 rotator1004 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1004 , -sin1004 , sin1004 , cos1004 )) + float2( -1,-1 );
				float cos1036 = cos( ( 1.0 - temp_output_1014_0 ) );
				float sin1036 = sin( ( 1.0 - temp_output_1014_0 ) );
				float2 rotator1036 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1036 , -sin1036 , sin1036 , cos1036 )) + float2( -1,-1 );
				float4 RF_Flakes595 = (( _FlakesSwitch )?( (( clampResult590 * float4( _FlakesColor , 0.0 ) * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_42 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_43 = (RF_Zero515).xxxx;
				float3 temp_cast_44 = (_ReflectionStrength).xxx;
				float3 temp_cast_45 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_45 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) )) );
				float3 RF_FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, RF_FlakesReflectNormals810 ), dot( tanToWorld1, RF_FlakesReflectNormals810 ), dot( tanToWorld2, RF_FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g155 = worldRefl725;
				float3 appendResult10_g155 = (float3(0.0 , VertexPos5_g155.y , 0.0));
				float3 VertexPosRotationAxis11_g155 = appendResult10_g155;
				float3 break13_g155 = VertexPos5_g155;
				float3 appendResult14_g155 = (float3(break13_g155.x , 0.0 , break13_g155.z));
				float3 VertexPosOtherAxis12_g155 = appendResult14_g155;
				float Angle3_g155 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 tanNormal758 = RF_FlakesReflectNormals810;
				float3 worldNormal758 = float3(dot(tanToWorld0,tanNormal758), dot(tanToWorld1,tanNormal758), dot(tanToWorld2,tanNormal758));
				float fresnelNdotV756 = dot( normalize( worldNormal758 ), ase_worldViewDir );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 temp_cast_49 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_49 );
				float3 temp_cast_50 = (fresnelNode756).xxx;
				float3 temp_cast_51 = (fresnelNode756).xxx;
				float3 temp_cast_52 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_52 );
				float3 temp_cast_53 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_50;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 Rf_FresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float saferPower1320 = abs( (0) );
				float RF_ReflectLightControl1324 = (( _ReflectLightAffect )?( ( pow( saferPower1320 , _ReflectLightPower ) + _ReflectLightAdd ) ):( RF_One514 ));
				float4 temp_cast_55 = (RF_One514).xxxx;
				float luminance1351 = Luminance((( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_55 )).rgb);
				float RF_AO1334 = luminance1351;
				float4 RF_Reflect745 = (( _Reflect )?( ( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g155 + ( VertexPosOtherAxis12_g155 * cos( Angle3_g155 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g155 ) * sin( Angle3_g155 ) ) ) + appendResult727 ) ) * float4( _ReflectColor , 0.0 ) ) * float4( ( 1.0 - Rf_FresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * RF_One514 ) + RF_One514 ) ) * RF_ReflectLightControl1324 * (( _RefAffectAO )?( ( RF_AO1334 + _RefAOIntensity ) ):( RF_One514 )) ) ):( temp_cast_43 ));
				float4 temp_cast_57 = (RF_Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879));
				float3 RF_FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( RF_FlakesNormal876 , SafeNormalize(_MainLightPosition.xyz) );
				float RF_NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_59 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * RF_BaseDiffuse540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * float4( _ShadeColor , 0.0 ) * (pow( saturate( ( -RF_NormalLightDirection857 * RF_BaseDiffuse540 ) ) , temp_cast_59 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_60 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 RF_ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_60 ) * ase_lightColor ) ):( temp_cast_57 ));
				

				float3 BaseColor = RF_BaseDiffuse540.rgb;
				float3 Emission = ( float4( RF_Specular2698 , 0.0 ) + saturate( ( RF_Flakes595 + RF_Reflect745 + RF_ShadeColor840 ) ) ).rgb;
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
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _PAINTMETHOD_FRESNEL _PAINTMETHOD_GRADIENTY _PAINTMETHOD_GRADIENTYFRESNEL
			#pragma shader_feature_local _FRESNELTYPE_LINEAR _FRESNELTYPE_NORMAL _FRESNELTYPE_GAMMA
			#pragma shader_feature_local _GRADTYPE_LINEAR _GRADTYPE_NORMAL _GRADTYPE_GAMMA


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			sampler2D _FlakesNormalMap;
			sampler2D _AmbientOcclusionTexture;


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
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
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
				float4 ase_tangent : TANGENT;
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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = normalize( appendResult10_g157 );
				float3 temp_output_976_0 = normalizeResult12_g157;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord5.xy * appendResult661 + appendResult662;
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 RF_FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal527 = RF_FlakesObjectNormals776;
				float3 worldNormal527 = float3(dot(tanToWorld0,tanNormal527), dot(tanToWorld1,tanNormal527), dot(tanToWorld2,tanNormal527));
				float fresnelNdotV525 = dot( normalize( worldNormal527 ), ase_tanViewDir );
				float fresnelNode525 = ( _ColFresnelBias + _ColFresnelScale * pow( max( 1.0 - fresnelNdotV525 , 0.0001 ), _ColFresnelPower ) );
				float3 temp_cast_0 = (fresnelNode525).xxx;
				float3 temp_cast_1 = (fresnelNode525).xxx;
				float3 gammaToLinear771 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (fresnelNode525).xxx;
				float3 temp_cast_3 = (fresnelNode525).xxx;
				float3 temp_cast_4 = (fresnelNode525).xxx;
				float3 linearToGamma1015 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (fresnelNode525).xxx;
				#if defined( _FRESNELTYPE_LINEAR )
				float3 staticSwitch1017 = gammaToLinear771;
				#elif defined( _FRESNELTYPE_NORMAL )
				float3 staticSwitch1017 = temp_cast_2;
				#elif defined( _FRESNELTYPE_GAMMA )
				float3 staticSwitch1017 = linearToGamma1015;
				#else
				float3 staticSwitch1017 = gammaToLinear771;
				#endif
				float3 RF_ColFresnel536 = saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) );
				float temp_output_565_0 = (0.0 + (IN.ase_normal.y - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float3 temp_cast_6 = (temp_output_565_0).xxx;
				float3 temp_cast_7 = (temp_output_565_0).xxx;
				float3 gammaToLinear1018 = Gamma22ToLinear( temp_cast_7 );
				float3 temp_cast_8 = (temp_output_565_0).xxx;
				float3 temp_cast_9 = (temp_output_565_0).xxx;
				float3 temp_cast_10 = (temp_output_565_0).xxx;
				float3 linearToGamma1019 = LinearToGamma22( temp_cast_10 );
				float3 temp_cast_11 = (temp_output_565_0).xxx;
				#if defined( _GRADTYPE_LINEAR )
				float3 staticSwitch1020 = gammaToLinear1018;
				#elif defined( _GRADTYPE_NORMAL )
				float3 staticSwitch1020 = temp_cast_8;
				#elif defined( _GRADTYPE_GAMMA )
				float3 staticSwitch1020 = linearToGamma1019;
				#else
				float3 staticSwitch1020 = linearToGamma1019;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 RF_ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = RF_ColFresnel536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = RF_ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( RF_ColFresnel536 + RF_ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = RF_ColFresnel536;
				#endif
				float3 lerpResult538 = lerp( _BaseColor , _SecondColor , saturate( staticSwitch574 ));
				float RF_One514 = 1.0;
				float4 temp_cast_13 = (RF_One514).xxxx;
				float2 uv_AmbientOcclusionTexture = IN.ase_texcoord5.xy * _AmbientOcclusionTexture_ST.xy + _AmbientOcclusionTexture_ST.zw;
				float4 temp_output_1345_0 = ( ( tex2D( _AmbientOcclusionTexture, uv_AmbientOcclusionTexture ) + ( 1.0 - _AOTextureIntensity ) ) + float4( _AOColor , 0.0 ) );
				float4 RF_AOColor1346 = (( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_13 ));
				float4 RF_BaseDiffuse540 = ( float4( (( _TwoColors )?( lerpResult538 ):( _BaseColor )) , 0.0 ) * RF_AOColor1346 );
				

				float3 BaseColor = RF_BaseDiffuse540.rgb;
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
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

			

			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			sampler2D _FlakesNormalMap;


			
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

				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = normalize( appendResult10_g157 );
				float3 temp_output_976_0 = normalizeResult12_g157;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord5.xy * appendResult661 + appendResult662;
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 RF_FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				

				float3 Normal = RF_FlakesBodyNormals806;
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
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			

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
			#define _NORMAL_DROPOFF_TS 1
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
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _PAINTMETHOD_FRESNEL _PAINTMETHOD_GRADIENTY _PAINTMETHOD_GRADIENTYFRESNEL
			#pragma shader_feature_local _FRESNELTYPE_LINEAR _FRESNELTYPE_NORMAL _FRESNELTYPE_GAMMA
			#pragma shader_feature_local _GRADTYPE_LINEAR _GRADTYPE_NORMAL _GRADTYPE_GAMMA
			#pragma shader_feature_local _SPECTYPE_LINEAR _SPECTYPE_NORMAL _SPECTYPE_GAMMA
			#pragma shader_feature_local _FLAKESTYPE_LINEAR _FLAKESTYPE_NORMAL _FLAKESTYPE_GAMMA
			#pragma shader_feature_local _REFFRSTYPE_LINEAR _REFFRSTYPE_NORMAL _REFFRSTYPE_GAMMA


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
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			sampler2D _FlakesNormalMap;
			sampler2D _AmbientOcclusionTexture;
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


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

				o.ase_texcoord8.xyz = v.texcoord.xyz;
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

				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = normalize( appendResult10_g157 );
				float3 temp_output_976_0 = normalizeResult12_g157;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord8.xyz.xy * appendResult661 + appendResult662;
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 RF_FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal527 = RF_FlakesObjectNormals776;
				float3 worldNormal527 = float3(dot(tanToWorld0,tanNormal527), dot(tanToWorld1,tanNormal527), dot(tanToWorld2,tanNormal527));
				float fresnelNdotV525 = dot( normalize( worldNormal527 ), ase_tanViewDir );
				float fresnelNode525 = ( _ColFresnelBias + _ColFresnelScale * pow( max( 1.0 - fresnelNdotV525 , 0.0001 ), _ColFresnelPower ) );
				float3 temp_cast_0 = (fresnelNode525).xxx;
				float3 temp_cast_1 = (fresnelNode525).xxx;
				float3 gammaToLinear771 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (fresnelNode525).xxx;
				float3 temp_cast_3 = (fresnelNode525).xxx;
				float3 temp_cast_4 = (fresnelNode525).xxx;
				float3 linearToGamma1015 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (fresnelNode525).xxx;
				#if defined( _FRESNELTYPE_LINEAR )
				float3 staticSwitch1017 = gammaToLinear771;
				#elif defined( _FRESNELTYPE_NORMAL )
				float3 staticSwitch1017 = temp_cast_2;
				#elif defined( _FRESNELTYPE_GAMMA )
				float3 staticSwitch1017 = linearToGamma1015;
				#else
				float3 staticSwitch1017 = gammaToLinear771;
				#endif
				float3 RF_ColFresnel536 = saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) );
				float temp_output_565_0 = (0.0 + (IN.ase_normal.y - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
				float3 temp_cast_6 = (temp_output_565_0).xxx;
				float3 temp_cast_7 = (temp_output_565_0).xxx;
				float3 gammaToLinear1018 = Gamma22ToLinear( temp_cast_7 );
				float3 temp_cast_8 = (temp_output_565_0).xxx;
				float3 temp_cast_9 = (temp_output_565_0).xxx;
				float3 temp_cast_10 = (temp_output_565_0).xxx;
				float3 linearToGamma1019 = LinearToGamma22( temp_cast_10 );
				float3 temp_cast_11 = (temp_output_565_0).xxx;
				#if defined( _GRADTYPE_LINEAR )
				float3 staticSwitch1020 = gammaToLinear1018;
				#elif defined( _GRADTYPE_NORMAL )
				float3 staticSwitch1020 = temp_cast_8;
				#elif defined( _GRADTYPE_GAMMA )
				float3 staticSwitch1020 = linearToGamma1019;
				#else
				float3 staticSwitch1020 = linearToGamma1019;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 RF_ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = RF_ColFresnel536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = RF_ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( RF_ColFresnel536 + RF_ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = RF_ColFresnel536;
				#endif
				float3 lerpResult538 = lerp( _BaseColor , _SecondColor , saturate( staticSwitch574 ));
				float RF_One514 = 1.0;
				float4 temp_cast_13 = (RF_One514).xxxx;
				float2 uv_AmbientOcclusionTexture = IN.ase_texcoord8.xyz.xy * _AmbientOcclusionTexture_ST.xy + _AmbientOcclusionTexture_ST.zw;
				float4 temp_output_1345_0 = ( ( tex2D( _AmbientOcclusionTexture, uv_AmbientOcclusionTexture ) + ( 1.0 - _AOTextureIntensity ) ) + float4( _AOColor , 0.0 ) );
				float4 RF_AOColor1346 = (( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_13 ));
				float4 RF_BaseDiffuse540 = ( float4( (( _TwoColors )?( lerpResult538 ):( _BaseColor )) , 0.0 ) * RF_AOColor1346 );
				
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 RF_FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				
				float RF_Zero515 = 0.0;
				float3 temp_cast_16 = (RF_Zero515).xxx;
				float ifLocalVar1356 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar1356 = _SpecularOut;
				else
				ifLocalVar1356 = _SpecularIn;
				float3 temp_cast_17 = (ifLocalVar1356).xxx;
				float3 temp_cast_18 = (_SpecularOut).xxx;
				float ifLocalVar1299 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar1299 = _SpecMax;
				else
				ifLocalVar1299 = _SpecMin;
				float3 tanNormal1361 = RF_FlakesObjectNormals776;
				float3 worldNormal1361 = float3(dot(tanToWorld0,tanNormal1361), dot(tanToWorld1,tanNormal1361), dot(tanToWorld2,tanNormal1361));
				float3 normalizeResult1362 = normalize( ( WorldViewDirection + SafeNormalize(_MainLightPosition.xyz) ) );
				float dotResult1367 = dot( ( worldNormal1361 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult1362 );
				float RF_LightNormal1368 = dotResult1367;
				float smoothstepResult1278 = smoothstep( ifLocalVar1299 , _SpecMax , pow( RF_LightNormal1368 , (0.01 + (_BGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g3 = smoothstepResult1278;
				float temp_output_1080_0 = saturate( ( temp_output_2_0_g3 * temp_output_2_0_g3 ) );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				float3 temp_cast_23 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_23 );
				float3 temp_cast_24 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_21;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_17 , temp_cast_18 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 saferPower699 = abs( saturate( smoothstepResult977 ) );
				float3 temp_cast_25 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_26 = (0.0).xxx;
				float3 temp_cast_27 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_25 ) ) , temp_cast_26 , temp_cast_27 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 RF_Specular2698 = (( _SpecularSwitch )?( (( clampResult681 * _SpecColor * ase_lightColor.rgb )*_SpecularIntensity + 0.0) ):( temp_cast_16 ));
				float ifLocalVar1355 = 0;
				if( _FlakesIn >= _FlakesOut )
				ifLocalVar1355 = _FlakesOut;
				else
				ifLocalVar1355 = _FlakesIn;
				float4 temp_cast_29 = ((0.0 + (ifLocalVar1355 - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_30 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float ifLocalVar1300 = 0;
				if( _FlakesMin >= _FlakesMax )
				ifLocalVar1300 = _FlakesMax;
				else
				ifLocalVar1300 = _FlakesMin;
				float smoothstepResult1304 = smoothstep( ifLocalVar1300 , _FlakesMax , pow( RF_LightNormal1368 , (0.01 + (_FlakesGloss - 0.0) * (1.0 - 0.01) / (1.0 - 0.0)) ));
				float temp_output_2_0_g4 = smoothstepResult1304;
				float temp_output_1083_0 = saturate( ( temp_output_2_0_g4 * temp_output_2_0_g4 ) );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_32 );
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				float3 temp_cast_35 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_35 );
				float3 temp_cast_36 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_33;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_29 , temp_cast_30 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_38 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_39 = (0.0).xxxx;
				float4 temp_cast_40 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_38 ) ) , temp_cast_39 , temp_cast_40 );
				float4 temp_cast_42 = (RF_One514).xxxx;
				float2 appendResult1007 = (float2(_FlakesTileX , _FlakesTileY));
				float2 texCoord1005 = IN.ase_texcoord8.xyz.xy * appendResult1007 + float2( 1,1 );
				float mulTime1006 = _TimeParameters.x * _FlakesRotSpeed;
				float temp_output_1014_0 = radians( mulTime1006 );
				float cos1004 = cos( temp_output_1014_0 );
				float sin1004 = sin( temp_output_1014_0 );
				float2 rotator1004 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1004 , -sin1004 , sin1004 , cos1004 )) + float2( -1,-1 );
				float cos1036 = cos( ( 1.0 - temp_output_1014_0 ) );
				float sin1036 = sin( ( 1.0 - temp_output_1014_0 ) );
				float2 rotator1036 = mul( texCoord1005 - float2( -1,-1 ) , float2x2( cos1036 , -sin1036 , sin1036 , cos1036 )) + float2( -1,-1 );
				float4 RF_Flakes595 = (( _FlakesSwitch )?( (( clampResult590 * float4( _FlakesColor , 0.0 ) * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_42 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_43 = (RF_Zero515).xxxx;
				float3 temp_cast_44 = (_ReflectionStrength).xxx;
				float3 temp_cast_45 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_45 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-1.0 + (_RefFNormalMulti - -1.0) * (1.0 - -1.0) / (1.0 - -1.0)) )) );
				float3 RF_FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, RF_FlakesReflectNormals810 ), dot( tanToWorld1, RF_FlakesReflectNormals810 ), dot( tanToWorld2, RF_FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g155 = worldRefl725;
				float3 appendResult10_g155 = (float3(0.0 , VertexPos5_g155.y , 0.0));
				float3 VertexPosRotationAxis11_g155 = appendResult10_g155;
				float3 break13_g155 = VertexPos5_g155;
				float3 appendResult14_g155 = (float3(break13_g155.x , 0.0 , break13_g155.z));
				float3 VertexPosOtherAxis12_g155 = appendResult14_g155;
				float Angle3_g155 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal758 = RF_FlakesReflectNormals810;
				float3 worldNormal758 = float3(dot(tanToWorld0,tanNormal758), dot(tanToWorld1,tanNormal758), dot(tanToWorld2,tanNormal758));
				float fresnelNdotV756 = dot( normalize( worldNormal758 ), WorldViewDirection );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 temp_cast_49 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_49 );
				float3 temp_cast_50 = (fresnelNode756).xxx;
				float3 temp_cast_51 = (fresnelNode756).xxx;
				float3 temp_cast_52 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_52 );
				float3 temp_cast_53 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_50;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 Rf_FresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float saferPower1320 = abs( (0) );
				float RF_ReflectLightControl1324 = (( _ReflectLightAffect )?( ( pow( saferPower1320 , _ReflectLightPower ) + _ReflectLightAdd ) ):( RF_One514 ));
				float4 temp_cast_55 = (RF_One514).xxxx;
				float luminance1351 = Luminance((( _AOToggle )?( saturate( CalculateContrast(_AOTextureContrast,temp_output_1345_0) ) ):( temp_cast_55 )).rgb);
				float RF_AO1334 = luminance1351;
				float4 RF_Reflect745 = (( _Reflect )?( ( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g155 + ( VertexPosOtherAxis12_g155 * cos( Angle3_g155 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g155 ) * sin( Angle3_g155 ) ) ) + appendResult727 ) ) * float4( _ReflectColor , 0.0 ) ) * float4( ( 1.0 - Rf_FresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * RF_One514 ) + RF_One514 ) ) * RF_ReflectLightControl1324 * (( _RefAffectAO )?( ( RF_AO1334 + _RefAOIntensity ) ):( RF_One514 )) ) ):( temp_cast_43 ));
				float4 temp_cast_57 = (RF_Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879));
				float3 RF_FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( RF_FlakesNormal876 , SafeNormalize(_MainLightPosition.xyz) );
				float RF_NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + RF_NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_59 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * RF_BaseDiffuse540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * float4( _ShadeColor , 0.0 ) * (pow( saturate( ( -RF_NormalLightDirection857 * RF_BaseDiffuse540 ) ) , temp_cast_59 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_60 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 RF_ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_60 ) * ase_lightColor ) ):( temp_cast_57 ));
				
				float3 temp_cast_62 = (RF_Zero515).xxx;
				float3 RF_BaseSpecular1379 = (( _BaseSpecularSwitch )?( ( _BaseSpecularColor * _BaseSpecular ) ):( temp_cast_62 ));
				

				float3 BaseColor = RF_BaseDiffuse540.rgb;
				float3 Normal = RF_FlakesBodyNormals806;
				float3 Emission = ( float4( RF_Specular2698 , 0.0 ) + saturate( ( RF_Flakes595 + RF_Reflect745 + RF_ShadeColor840 ) ) ).rgb;
				float3 Specular = RF_BaseSpecular1379;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = RF_AO1334;
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

			

			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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

			

			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			float4 _AmbientOcclusionTexture_ST;
			float3 _SecondColor;
			float3 _AOColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float3 _FlakesColor;
			float3 _ReflectColor;
			float3 _SpecColor;
			float3 _BaseSpecularColor;
			float _TexturedFlakes;
			float _CMXPos;
			float _CubeMapRotate;
			float _FlakesGloss;
			float _RefFNormalMulti;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _CMYPos;
			float _FlakesSoftness;
			float _FlakesTileY;
			float _FlakesTileX;
			float _FlakesSaturation;
			int _SpecularExtras;
			float _RefFresnelInvert;
			float _FlakesMax;
			float _BaseSpecularSwitch;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _RefAOIntensity;
			float _RefAffectAO;
			float _ReflectLightAdd;
			float _ReflectLightPower;
			float _ReflectLightAffect;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _CMZPos;
			float _FlakesMin;
			float _FlakesIn;
			float _FlakesOut;
			float _ColFresnelBias;
			float _FNormalMultiplier;
			float _FNormalScale;
			float _FNOffsetY;
			float _FNOffsetX;
			float _FNTileY;
			float _FNTileX;
			float _FlakesNormal;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _CheckDef;
			int _AOFold;
			int _BaseColorToggle;
			int _FresnelFold;
			int _CubeMapExtras;
			int _ShadeExtras;
			int _FlakesExtras;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _ColFresnelScale;
			float _FlakesGlossy;
			float _ColFresnelPower;
			float _GradScale;
			float _BaseSpecular;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _BGloss;
			float _SpecularNormalIntensity;
			float _SpecMax;
			float _SpecMin;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _AffectBodyFlakes;
			float _AOTextureIntensity;
			float _AOTextureContrast;
			float _AOToggle;
			float _GradOffset;
			float _GradYInvert;
			float _Smoothness;
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
	
	CustomEditor "BCarPaintEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;1328;-5328,-3696;Inherit;False;1188;530.6667;Reflect Light Attenuation;8;1312;1320;1321;1322;1323;1327;1326;1324;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1248;-8672,-8768;Inherit;False;4260;1842;Sticker-Deneme;41;1151;1166;1128;1215;1171;1159;1158;1190;1189;1187;1179;1185;1186;1130;1234;1209;1208;1210;1178;1225;1223;1232;1233;1230;1231;1224;1227;1244;1245;1228;1229;1222;1226;1243;1184;1247;1155;1156;1246;1154;1147;Sticker-Deneme;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1097;-5040,-4704;Inherit;False;692;388;Final Comp;8;707;706;708;612;866;753;883;1;Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;865;-13360,-7376;Inherit;False;1782.021;1060.089;Flakes Normal Settings;29;776;810;806;668;876;817;677;816;879;976;669;803;807;670;667;666;665;664;662;661;672;805;809;671;1078;808;804;899;673;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;566;-14800,-5680;Inherit;False;2433.563;724.524;Base Color Settings;13;539;564;574;521;1340;540;1341;579;578;522;520;538;1384;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;562;-17040,-5168;Inherit;False;2137.461;432.5065;Color Y Gradient Settings;13;1019;1020;563;560;550;551;552;576;575;559;1018;565;561;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;513;-6304,-4784;Inherit;False;526.5706;742.8457;Local Vars;16;1376;1339;1307;1092;1093;516;515;514;1094;888;1013;897;611;517;519;518;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;523;-17024,-6016;Inherit;False;2117.577;760.5044;Color Fresnel Settings;14;1385;524;525;527;536;529;532;1017;771;1015;533;526;531;530;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;580;-10352,-3504;Inherit;False;3736.838;1111.225;Flakes Setting;54;932;892;1302;1303;893;891;1300;1304;1305;1083;595;1039;1045;1012;1044;1011;1086;1042;1041;1036;1038;1004;1010;1006;1014;1005;1008;1009;1007;937;584;585;1085;936;583;582;606;1082;1081;598;600;933;586;590;587;599;593;594;939;592;591;589;588;1355;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;679;-10832,-4928;Inherit;False;4316.067;651.3076;Specular Setup;42;1053;1271;1369;1072;695;1356;705;977;697;696;1062;1079;980;1075;701;1278;1299;1050;1054;1298;1272;698;1080;694;982;699;682;684;688;988;700;683;689;691;690;681;680;1377;812;1378;1379;1381;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;723;-14048,-3472;Inherit;False;2989.855;703.0696;Reflection Map;34;741;742;749;738;811;1325;1308;744;746;745;747;739;727;726;729;728;724;725;737;1095;734;743;748;733;740;736;735;731;730;1370;1371;1372;1373;1375;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;754;-14880,-4336;Inherit;False;2444.85;784.3678;Fresnel Settings;17;767;765;1383;768;756;761;760;1021;763;1022;769;757;766;764;758;755;762;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;818;-13840,-2656;Inherit;False;2634.624;845.2722;Shading Settings;36;840;849;841;839;853;823;851;854;852;850;848;847;846;845;844;843;842;838;837;836;835;834;833;832;831;830;829;828;827;826;825;824;822;821;820;819;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;855;-11488,-6608;Inherit;False;790.5674;500.1391;Normal Light Direction;4;857;864;863;862;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;856;-11488,-7136;Inherit;False;787.4861;494.3066;Normal View Direction;4;861;858;860;859;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1329;-12480,-5936;Inherit;False;1736.243;504.71;AO Set;14;1334;1346;1351;1337;1333;1338;1343;1344;1335;1331;1353;1345;1352;1330;AO Set;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1357;-10656,-4192;Inherit;False;1019;653.2667;Light Specular Direction;11;1368;1367;1366;1365;1364;1363;1362;1361;1360;1359;1358;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;730;-13824,-2992;Inherit;False;Property;_CMYPos;CM Y Pos;27;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-13824,-2896;Inherit;False;Property;_CMZPos;CM Z Pos;40;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;735;-13040,-3344;Inherit;True;Property;_ReflectMap;Reflect Map;22;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;736;-13248,-3344;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;762;-14544,-3664;Inherit;False;Property;_RefFresnelPower;RefFresnelPower;43;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;755;-14496,-4032;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;758;-14496,-4256;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;830;-12976,-2608;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;831;-12720,-2608;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;833;-13776,-2608;Float;False;Property;_BaseCellOffset;Base Cell Offset;36;0;Create;True;0;0;0;False;0;False;0;-0.151;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;834;-13504,-2608;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.4;False;4;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;835;-13328,-2608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;838;-11824,-2384;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;846;-12160,-2480;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;530;-16736,-5440;Inherit;False;Property;_ColFresnelScale;ColFresnelScale;9;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;531;-16736,-5360;Inherit;False;Property;_ColFresnelPower;ColFresnelPower;10;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;526;-15696,-5664;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;533;-15280,-5728;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1015;-16144,-5648;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;771;-16144,-5760;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1018;-16544,-5104;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;575;-15888,-5008;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;576;-15728,-5072;Inherit;False;Property;_GradYInvert;GradYInvert;15;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;552;-15696,-4832;Inherit;False;Property;_GradOffset;GradOffset;12;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-15664,-4912;Inherit;False;Property;_GradScale;GradScale;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;550;-15504,-5072;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;560;-15296,-5072;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;764;-13040,-4064;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;766;-12880,-4064;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1020;-16320,-5072;Inherit;False;Property;_GradType;GradType;83;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1019;-16544,-4960;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;757;-13456,-3984;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;769;-13936,-4096;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1022;-13936,-3984;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1017;-15920,-5728;Inherit;False;Property;_FresnelType;FresnelType;82;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;939;-7344,-3328;Inherit;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;4;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-7552,-3328;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;593;-7616,-3088;Inherit;False;Property;_FlakesIntensity;Flakes Intensity;46;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;587;-7920,-3424;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;590;-7728,-3424;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.347,0.347,0.347,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;933;-8368,-3440;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;763;-13264,-4064;Inherit;False;Property;_RefFresnelInvert;Ref Fresnel Invert;28;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;733;-12736,-3344;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;680;-7856,-4864;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;681;-7696,-4864;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.347,0.347,0.347;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;690;-7920,-4752;Inherit;False;Constant;_SpecularAmbient;Specular Ambient;50;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-7984,-4672;Inherit;False;Property;_SpecularSaturation;Specular Saturation;42;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;683;-7504,-4752;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;700;-7504,-4608;Inherit;False;Property;_SpecularIntensity;Specular Intensity;47;0;Create;True;0;0;0;True;0;False;2.050727;0.4472353;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;988;-7216,-4752;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;688;-7184,-4832;Inherit;False;515;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;684;-6976,-4752;Inherit;False;Property;_SpecularSwitch;Specular Switch;51;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;600;-8592,-3440;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;2.86;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;598;-8752,-3440;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1081;-9200,-3456;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1082;-9200,-3360;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-9104,-3280;Inherit;False;Property;_FlakesGlossy;Flakes Glossy;23;0;Create;True;0;0;0;True;0;False;1;25;1;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1085;-8976,-3440;Inherit;False;Property;_FlakesType;FlakesType;90;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-8640,-3264;Inherit;False;Property;_FlakesSoftness;Flakes Softness;53;1;[HDR];Create;True;0;0;0;True;0;False;1;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;584;-8368,-3264;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0.01;False;4;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1007;-9056,-2928;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1009;-9248,-2896;Inherit;False;Property;_FlakesTileY;FlakesTile Y;78;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1008;-9248,-2992;Inherit;False;Property;_FlakesTileX;FlakesTile X;79;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1005;-8864,-2896;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1,1;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;1014;-8960,-2768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1006;-9136,-2768;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1004;-8656,-2896;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;-1,-1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1038;-8800,-2736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1036;-8656,-2656;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;-1,-1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1041;-8480,-2896;Inherit;True;Property;_TextureSample0;Texture Sample 0;81;0;Create;True;0;0;0;False;0;False;-1;f674691e242745248a6214d6d2a7d336;f674691e242745248a6214d6d2a7d336;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1042;-8480,-2688;Inherit;True;Property;_TextureSample1;Texture Sample 0;81;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;1044;-8000,-2880;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1045;-8160,-2880;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1021;-13696,-4064;Inherit;False;Property;_RefFrsType;RefFrsType;84;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;748;-12512,-3056;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;804;-12800,-6848;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;808;-12800,-6736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;661;-13152,-7296;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;662;-13152,-7104;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;664;-13312,-7312;Inherit;False;Property;_FNTileX;FNTileX;66;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;665;-13312,-7232;Inherit;False;Property;_FNTileY;FNTileY;69;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;666;-13312,-7136;Inherit;False;Property;_FNOffsetX;FNOffsetX;67;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;667;-13312,-7056;Inherit;False;Property;_FNOffsetY;FNOffsetY;68;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;803;-12592,-6864;Inherit;True;Property;_BaseMapOld2;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;669;-12592,-7072;Inherit;True;Property;_BaseMapOld1;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;743;-12336,-3344;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-6240,-4640;Inherit;False;Constant;_Zero;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;519;-6240,-4720;Inherit;False;Constant;_One;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;517;-6240,-4560;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;611;-6256,-4480;Inherit;False;Property;_SpecularExtras;SpecularExtras;59;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;897;-6256,-4320;Inherit;False;Property;_FlakesNormalExtras;FlakesNormalExtras;64;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1013;-6032,-4480;Inherit;False;Property;_TexturedFlakesToggle;TexturedFlakesToggle;60;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;888;-6256,-4400;Inherit;False;Property;_FlakesExtras;FlakesExtras;63;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1094;-6256,-4240;Inherit;False;Property;_ShadeExtras;ShadeExtras;61;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TFHCRemapNode;820;-13152,-2528;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-13440,-2432;Float;False;Property;_BaseCellSharpness;Base Cell Sharpness;33;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;734;-12912,-3408;Inherit;False;Property;_ReflectionStrength;Reflection Strength;16;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;1095;-12624,-3408;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;847;-12496,-2288;Inherit;False;Property;_ShadeContrast;Shade Contrast;32;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;1098;-4080,-4144;Inherit;False;428.6665;338;Yapilacaklar;;1,0,0,1;* Sticker koymak gerekiyor$$$;0;0
Node;AmplifyShaderEditor.RangedFloatNode;760;-14544,-3824;Inherit;False;Property;_RefFresnelBias;RefFresnelBias;34;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;761;-14544,-3744;Inherit;False;Property;_RefFresnelScale;RefFresnelScale;38;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;756;-14240,-4064;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1151;-7904,-8496;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1166;-7712,-8496;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1215;-5584,-7984;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;1159;-7456,-8400;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1158;-7216,-8400;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RadiansOpNode;1190;-7264,-7760;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1189;-7424,-7760;Inherit;False;Property;_Rot;Rot;98;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1187;-7088,-7888;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;1179;-6992,-7760;Inherit;False;Property;_Offset;Offset;94;0;Create;True;0;0;0;False;0;False;2.13,0.56;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;1185;-6992,-7632;Inherit;False;Property;_Size;Size;97;0;Create;True;0;0;0;False;0;False;0.23,1.38;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1186;-6624,-7888;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1130;-6464,-7888;Inherit;True;Property;_LeftSideSticker;LeftSideSticker;92;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1234;-6464,-7296;Inherit;True;Property;_LeftSideSticker1;LeftSideSticker;93;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1209;-8224,-7888;Inherit;False;Property;_Carpma;Carpma;100;0;Create;True;0;0;0;False;0;False;100;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1208;-8048,-7984;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1210;-8624,-8096;Inherit;True;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;1178;-7840,-7984;Inherit;True;False;True;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1225;-7344,-7344;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1223;-7568,-7120;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1233;-6688,-7328;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;1230;-7248,-7200;Inherit;False;Property;_OffsetB;OffsetB;95;0;Create;True;0;0;0;False;0;False;2.13,0.56;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;1231;-7008,-7088;Inherit;False;Property;_SizeB;SizeB;96;0;Create;True;0;0;0;False;0;False;0.23,1.38;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;1224;-7728,-7120;Inherit;False;Property;_RotB;RotB;99;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1227;-8400,-7264;Inherit;False;Property;_CarpmaB;CarpmaB;101;0;Create;True;0;0;0;False;0;False;200;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1228;-8576,-7456;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1229;-8176,-7376;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1222;-5344,-8128;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1226;-7696,-7360;Inherit;True;False;True;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1243;-7872,-7616;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1184;-6768,-7888;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1247;-6672,-8352;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1155;-7216,-8720;Inherit;False;Constant;_Float0;Float 0;93;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1156;-7088,-8272;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-6880,-8352;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1154;-6896,-8608;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1147;-6688,-8608;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;50;False;2;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;682;-7728,-4400;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.PowerNode;699;-8000,-4864;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.56;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;982;-8160,-4832;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1080;-9552,-4752;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;595;-6864,-3328;Inherit;False;RF_Flakes;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;514;-6016,-4720;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;515;-6016,-4640;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;516;-6016,-4560;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;810;-11840,-6768;Inherit;False;RF_FlakesReflectNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;768;-12720,-3952;Inherit;False;RF_FresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;840;-11424,-2384;Float;False;RF_ShadeColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1298;-9696,-4752;Inherit;False;Square;-1;;3;fea980a1f68019543b2cd91d506986e8;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1083;-9344,-3424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1305;-9488,-3392;Inherit;False;Square;-1;;4;fea980a1f68019543b2cd91d506986e8;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1304;-9664,-3392;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1300;-9840,-3232;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;891;-10112,-2944;Inherit;False;Property;_FlakesMax;FlakesMax;76;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-10112,-3024;Inherit;False;Property;_FlakesMin;FlakesMin;77;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1303;-9840,-3392;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;586;-8160,-3424;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.56;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;588;-8048,-3312;Inherit;False;Constant;_FlakesArea;Flakes Area;50;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;589;-8144,-3232;Inherit;False;Property;_FlakesSaturation;Flakes Saturation;35;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;-8032,-2960;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1086;-8464,-2480;Inherit;False;Property;_FlakesTextureIntensity;FlakesTextureIntensity;91;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;671;-13280,-6960;Float;False;Property;_FNormalScale;FNormal Scale;7;0;Create;True;0;0;0;False;0;False;1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;673;-12800,-7024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;532;-15520,-5728;Inherit;False;Property;_ColorFresnelInvert;Color Fresnel Invert;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;529;-16736,-5520;Inherit;False;Property;_ColFresnelBias;ColFresnelBias;8;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;578;-14448,-5072;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;579;-14336,-5072;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;864;-11456,-6560;Inherit;True;876;RF_FlakesNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;668;-12928,-7248;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;899;-12976,-7024;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.1;False;4;FLOAT;-0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;670;-12880,-6528;Inherit;True;Property;_FlakesNormalMap;FlakesNormalMap;65;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;f805cc10b4bf5a74ea96cfb83ec9dad4;f805cc10b4bf5a74ea96cfb83ec9dad4;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DotProductOpNode;860;-11216,-6976;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;858;-11456,-7088;Inherit;True;876;RF_FlakesNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;879;-12000,-7152;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;844;-12000,-2480;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;850;-13520,-2272;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;828;-13056,-2160;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;852;-13072,-2048;Inherit;False;Property;_ShadingContribution;Shading Contribution;37;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;836;-13072,-1968;Inherit;False;Property;_ShadingOffset;Shading Offset;39;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-13072,-1888;Inherit;False;Property;_ShadingIntensity;Shading Intensity;44;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;829;-13216,-2160;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;848;-13360,-2160;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;822;-13216,-2048;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-13488,-2048;Inherit;False;Property;_ShadingContrast;Shading Contrast;41;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;851;-13584,-2128;Inherit;False;540;RF_BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;824;-12880,-2432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;825;-12720,-2432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;821;-12480,-2448;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;832;-12480,-2608;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;837;-12288,-2480;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;845;-12208,-2352;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;4;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;737;-13520,-3344;Inherit;False;BUDUComputeRotationY;-1;;155;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldReflectionVector;725;-13760,-3376;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RadiansOpNode;724;-13696,-3152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;728;-13968,-3152;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;24;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;729;-13824,-3056;Inherit;False;Property;_CMXPos;CM X Pos;31;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;726;-13552,-2992;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;727;-13408,-3024;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;739;-12672,-2960;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;747;-12480,-2960;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;863;-11200,-6448;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1171;-5584,-8288;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1093;-6000,-4320;Inherit;False;Property;_CubeMapExtras;CubeMapExtras;54;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1092;-6000,-4400;Inherit;False;Property;_FresnelFold;FresnelFold;58;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;-9424,-2768;Inherit;False;Property;_FlakesRotSpeed;Flakes Rot Speed;80;0;Create;True;0;0;0;False;0;False;0.3;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;599;-7088,-3344;Inherit;False;Property;_FlakesSwitch;Flakes Switch;50;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1011;-7840,-2944;Inherit;False;Property;_TexturedFlakes;TexturedFlakes;81;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;857;-10976,-6448;Float;False;RF_NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;806;-11840,-6880;Inherit;False;RF_FlakesBodyNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;876;-11808,-7152;Float;False;RF_FlakesNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;861;-10992,-6976;Float;False;RF_NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;816;-12240,-6880;Inherit;False;Property;_AffectBodyFlakes;Affect Body Flakes;5;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1325;-12336,-3184;Inherit;False;1324;RF_ReflectLightControl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1312;-5232,-3568;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1320;-5008,-3568;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;5.57;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1321;-4768,-3568;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1322;-5296,-3360;Inherit;False;Property;_ReflectLightPower;ReflectLightPower;102;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1327;-4832,-3648;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1326;-4640,-3616;Inherit;False;Property;_ReflectLightAffect;ReflectLightAffect;104;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1324;-4400,-3616;Inherit;False;RF_ReflectLightControl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1323;-5056,-3280;Inherit;False;Property;_ReflectLightAdd;ReflectLightAdd;103;0;Create;True;0;0;0;False;0;False;0.02;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1117;-4224,-4992;Inherit;False;1128;RF_stickerMap_deneme;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1307;-6016,-4240;Inherit;False;Property;_BaseColorToggle;BaseColorToggle;55;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;839;-11840,-2560;Inherit;False;515;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;841;-11664,-2384;Inherit;False;Property;_ShadeColorToggle;ShadeColorToggle;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1343;-12032,-5520;Inherit;False;Property;_AOTextureContrast;AO Texture Contrast;106;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;805;-13280,-6784;Inherit;False;Property;_BodyFNormalMulti;BodyFNormalMulti;71;0;Create;True;0;0;0;True;0;False;0.1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;672;-13280,-6864;Inherit;False;Property;_FNormalMultiplier;FNormalMultiplier;70;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;738;-12736,-3056;Inherit;False;767;Rf_FresnelResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;749;-12688,-2832;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;742;-12880,-2864;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;741;-12976,-2960;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;17;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;817;-12240,-6768;Inherit;False;Property;_AffectReflectionFlakes;Affect Reflection Flakes;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;807;-12592,-6656;Inherit;True;Property;_BaseMapOld3;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TFHCRemapNode;1078;-12976,-6704;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;809;-13280,-6688;Inherit;False;Property;_RefFNormalMulti;RefFNormalMulti;72;0;Create;True;0;0;0;False;0;False;0.1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;936;-8816,-3280;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;937;-8816,-3088;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;583;-9328,-3184;Inherit;False;Property;_FlakesIn;Flakes In;30;0;Create;True;0;0;0;True;0;False;0;2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;606;-9328,-3088;Inherit;False;Property;_FlakesOut;Flakes Out;18;0;Create;True;0;0;0;True;0;False;1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1355;-9024,-3184;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1054;-10352,-4624;Inherit;False;Property;_SpecMin;SpecMin;88;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-10352,-4544;Inherit;False;Property;_SpecMax;SpecMax;87;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1299;-10064,-4640;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1278;-9872,-4752;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;701;-8832,-4784;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1075;-9408,-4800;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;980;-9408,-4688;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1079;-9184,-4784;Inherit;False;Property;_SpecType;SpecType;89;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SqrtOpNode;1062;-8960,-4784;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;696;-8464,-4624;Inherit;False;Property;_Softness;Softness;52;1;[HDR];Create;True;0;0;0;True;0;False;0.001;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;697;-8176,-4624;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;977;-8368,-4800;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;705;-8960,-4608;Inherit;False;Property;_SpecularOut;Specular Out;20;0;Create;True;0;0;0;True;0;False;1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1356;-8656,-4608;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;695;-8960,-4528;Inherit;False;Property;_SpecularIn;Specular In;26;0;Create;True;0;0;0;True;0;False;0;2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1072;-8672,-4752;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1358;-10160,-3952;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;1360;-10352,-4128;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.75;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1361;-10352,-3952;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;1362;-10160,-3792;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1363;-10288,-3792;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1365;-10544,-3856;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;1367;-10000,-3824;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1271;-10320,-4752;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;745;-11280,-3408;Inherit;False;RF_Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;746;-11504,-3408;Inherit;False;Property;_Reflect;Reflect;14;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;744;-11696,-3424;Inherit;False;515;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1308;-11664,-3344;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1370;-11888,-3056;Inherit;False;Property;_RefAffectAO;RefAffectAO;110;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1372;-12240,-3088;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1371;-12240,-3008;Inherit;False;1334;RF_AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1375;-12032,-3008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1339;-5984,-4160;Inherit;False;Property;_AOFold;AOFold;56;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1373;-12336,-2928;Inherit;False;Property;_RefAOIntensity;RefAOIntensity;111;0;Create;True;0;0;0;False;0;False;0.2;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;813;-4224,-4480;Inherit;False;Property;_Smoothness;Smoothness;74;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1336;-4128,-4400;Inherit;False;1334;RF_AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;777;-4192,-4688;Inherit;False;806;RF_FlakesBodyNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1379;-6752,-4464;Inherit;False;RF_BaseSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1378;-7152,-4464;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;812;-7440,-4368;Inherit;False;Property;_BaseSpecular;BaseSpecular;73;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1376;-6240,-4160;Inherit;False;Property;_CheckDef;CheckDef;57;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1381;-7008,-4480;Inherit;False;Property;_BaseSpecularSwitch;BaseSpecularSwitch;113;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;536;-15120,-5728;Inherit;False;RF_ColFresnel;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;811;-14032,-3376;Inherit;False;810;RF_FlakesReflectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1359;-10640,-4128;Inherit;False;Property;_SpecularNormalIntensity;SpecularNormalIntensity;62;0;Create;True;0;0;0;False;0;False;0.3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;740;-12976,-3152;Inherit;False;Property;_ReflectColor;Reflect Color;19;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;591;-7840,-3296;Inherit;False;Property;_FlakesColor;Flakes Color;48;1;[HDR];Create;True;0;0;0;True;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;823;-12784,-2512;Inherit;False;540;RF_BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;827;-12784,-2352;Inherit;False;Property;_ShadeColor;Shade Color;29;1;[Header];Create;True;1;Shade Settings;0;0;False;0;False;0.35,0.35,0.35,1;0.6313726,0.227451,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ScaleAndOffsetNode;826;-12784,-2160;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;843;-12752,-2000;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1245;-5936,-7952;Inherit;False;Constant;_Color1;Color 1;99;0;Create;True;0;0;0;False;0;False;0,0.7337623,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;1244;-5808,-8592;Inherit;False;Constant;_Color0;Color 0;99;0;Create;True;0;0;0;False;0;False;1,0.9987117,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;520;-14112,-5616;Inherit;False;Property;_BaseColor;Base Color;1;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TFHCRemapNode;932;-10032,-3248;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.01;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-10320,-3248;Inherit;False;Property;_FlakesGloss;Flakes Gloss;75;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1272;-10528,-4640;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.01;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1053;-10816,-4640;Inherit;False;Property;_BGloss;BGloss;86;0;Create;True;0;0;0;True;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;694;-8960,-4704;Inherit;False;Property;_Glossy;Glossy;21;0;Create;True;0;0;0;True;0;False;1;25;1;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;976;-12576,-7184;Inherit;False;Normal Reconstruct Z;-1;;157;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;677;-12240,-7024;Inherit;False;Property;_FlakesNormal;FlakesNormal;4;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;776;-11856,-7008;Inherit;False;RF_FlakesObjectNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1364;-10640,-3952;Inherit;False;776;RF_FlakesObjectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;859;-11456,-6848;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;1232;-7024,-7344;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1128;-4656,-8304;Inherit;False;RF_stickerMap_deneme;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;574;-14176,-5200;Inherit;True;Property;_PaintMethod;PaintMethod;13;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Fresnel;GradientY;GradientYFresnel;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1384;-13680,-5120;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;522;-14112,-5408;Inherit;False;Property;_SecondColor;Second Color;2;0;Create;True;0;0;0;False;0;False;0.4,0,0,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WorldNormalVector;527;-16688,-5952;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;1377;-7376,-4512;Inherit;False;Property;_BaseSpecularColor;BaseSpecularColor;112;0;Create;True;0;0;0;True;1;HDR;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;689;-7760,-4592;Inherit;False;Property;_SpecColor;Spec Color;49;1;[HDR];Create;True;0;0;0;True;0;False;1,1,1,1;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;541;-4160,-4768;Inherit;False;540;RF_BaseDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;1366;-10608,-3696;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;862;-11456,-6320;Inherit;True;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;592;-7824,-3072;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;538;-13872,-5440;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;540;-13248,-5568;Inherit;False;RF_BaseDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1341;-13408,-5568;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;521;-13632,-5568;Inherit;False;Property;_TwoColors;Two Colors;0;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;-14752,-5104;Inherit;False;563;RF_ColorGradYResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;853;-12032,-2288;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.IntNode;765;-13072,-3952;Inherit;False;Property;_RefFresnelSwitch;RefFresnelSwitch;25;0;Create;True;0;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.FresnelNode;525;-16448,-5728;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;524;-16688,-5728;Inherit;True;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;539;-14720,-5200;Inherit;False;536;RF_ColFresnel;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;565;-16816,-5088;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;561;-17008,-5088;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;559;-16112,-5072;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;-15136,-5072;Inherit;False;RF_ColorGradYResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1340;-13600,-5456;Inherit;False;1346;RF_AOColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;612;-4992,-4640;Inherit;False;595;RF_Flakes;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;-4992,-4544;Inherit;False;745;RF_Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;866;-5008,-4448;Inherit;False;840;RF_ShadeColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;707;-4784,-4560;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;708;-4672,-4560;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;-4704,-4656;Inherit;False;698;RF_Specular2;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;883;-4496,-4624;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1385;-16992,-5952;Inherit;False;776;RF_FlakesObjectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1383;-14800,-4256;Inherit;False;810;RF_FlakesReflectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;849;-13824,-2384;Inherit;False;857;RF_NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;767;-12720,-4064;Inherit;False;Rf_FresnelResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1330;-12432,-5888;Inherit;True;Property;_AmbientOcclusionTexture;Ambient Occlusion Texture;105;0;Create;True;0;0;0;False;0;False;-1;ac405faab9f7cf14d80b3fe024979b8c;ac405faab9f7cf14d80b3fe024979b8c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;1352;-11984,-5888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1345;-11856,-5888;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1353;-12144,-5808;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1331;-12416,-5680;Inherit;False;Property;_AOTextureIntensity;AO Texture Intensity;107;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1338;-11712,-5760;Inherit;False;514;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1333;-11536,-5888;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1337;-11392,-5872;Inherit;False;Property;_AOToggle;AOToggle;108;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LuminanceNode;1351;-11168,-5792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1346;-10976,-5888;Inherit;False;RF_AOColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1334;-10976,-5792;Inherit;False;RF_AO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1344;-12128,-5728;Inherit;False;Property;_AOColor;AOColor;109;0;Create;True;0;0;0;True;0;False;0,0,0,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;1335;-11728,-5888;Inherit;False;BUDUContrast;-1;;158;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;1386;-11728,-6080;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1380;-4160,-4560;Inherit;False;1379;RF_BaseSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;698;-6752,-4752;Inherit;False;RF_Specular2;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1368;-9872,-3824;Inherit;False;RF_LightNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1039;-9024,-2688;Inherit;True;Property;_FlakesTexture;Flakes Texture;85;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;f674691e242745248a6214d6d2a7d336;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;1302;-10096,-3392;Inherit;False;1368;RF_LightNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1369;-10560,-4752;Inherit;False;1368;RF_LightNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;-4928,-4368;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;-3808,-4672;Float;False;True;-1;2;BCarPaintEditor;0;14;BUDU Shaders ASE/BCarPaint;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;0;False;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638600314721804317;Workflow;0;638600314691838890;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;638600315269319730;Forward Only;1;0;Transmission;0;638576949185450138;  Transmission Shadow;0.5,True,_TransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_TRStrength;0;  Normal Distortion;0.5,True,_TRNormDist;0;  Scattering;2,True,_TRScattering;0;  Direct;0.9,True,_TRDirec;0;  Ambient;0.1,True,_TRAmbient;0;  Shadow;0.5,True,_TRShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
WireConnection;735;1;736;0
WireConnection;736;0;737;0
WireConnection;736;1;727;0
WireConnection;758;0;1383;0
WireConnection;830;0;835;0
WireConnection;830;1;820;0
WireConnection;831;0;830;0
WireConnection;834;0;833;0
WireConnection;835;0;834;0
WireConnection;835;1;849;0
WireConnection;838;0;844;0
WireConnection;838;1;853;0
WireConnection;846;0;837;0
WireConnection;526;0;1017;0
WireConnection;533;0;532;0
WireConnection;1015;0;525;0
WireConnection;771;0;525;0
WireConnection;1018;0;565;0
WireConnection;575;0;559;0
WireConnection;576;0;575;0
WireConnection;576;1;559;0
WireConnection;550;0;576;0
WireConnection;550;1;551;0
WireConnection;550;2;552;0
WireConnection;560;0;550;0
WireConnection;764;0;763;0
WireConnection;766;0;764;0
WireConnection;766;1;765;0
WireConnection;1020;1;1018;0
WireConnection;1020;0;565;0
WireConnection;1020;2;1019;0
WireConnection;1019;0;565;0
WireConnection;757;0;1021;0
WireConnection;769;0;756;0
WireConnection;1022;0;756;0
WireConnection;1017;1;771;0
WireConnection;1017;0;525;0
WireConnection;1017;2;1015;0
WireConnection;939;0;594;0
WireConnection;939;1;593;0
WireConnection;594;0;590;0
WireConnection;594;1;591;0
WireConnection;594;2;592;0
WireConnection;594;3;1011;0
WireConnection;587;0;586;0
WireConnection;590;0;587;0
WireConnection;590;1;588;0
WireConnection;590;2;589;0
WireConnection;933;0;600;0
WireConnection;933;1;936;0
WireConnection;933;2;937;0
WireConnection;763;0;757;0
WireConnection;763;1;1021;0
WireConnection;733;0;735;0
WireConnection;733;1;740;0
WireConnection;680;0;699;0
WireConnection;681;0;680;0
WireConnection;681;1;690;0
WireConnection;681;2;691;0
WireConnection;683;0;681;0
WireConnection;683;1;689;0
WireConnection;683;2;682;1
WireConnection;988;0;683;0
WireConnection;988;1;700;0
WireConnection;684;0;688;0
WireConnection;684;1;988;0
WireConnection;600;1;598;0
WireConnection;600;0;582;0
WireConnection;598;0;1085;0
WireConnection;1081;0;1083;0
WireConnection;1082;0;1083;0
WireConnection;1085;1;1081;0
WireConnection;1085;0;1083;0
WireConnection;1085;2;1082;0
WireConnection;584;0;585;0
WireConnection;1007;0;1008;0
WireConnection;1007;1;1009;0
WireConnection;1005;0;1007;0
WireConnection;1014;0;1006;0
WireConnection;1006;0;1010;0
WireConnection;1004;0;1005;0
WireConnection;1004;2;1014;0
WireConnection;1038;0;1014;0
WireConnection;1036;0;1005;0
WireConnection;1036;2;1038;0
WireConnection;1041;0;1039;0
WireConnection;1041;1;1004;0
WireConnection;1042;0;1039;0
WireConnection;1042;1;1036;0
WireConnection;1044;0;1045;0
WireConnection;1045;0;1041;0
WireConnection;1045;1;1042;0
WireConnection;1045;2;1086;0
WireConnection;1021;1;769;0
WireConnection;1021;0;756;0
WireConnection;1021;2;1022;0
WireConnection;748;0;738;0
WireConnection;804;0;671;0
WireConnection;804;1;805;0
WireConnection;808;0;671;0
WireConnection;808;1;1078;0
WireConnection;661;0;664;0
WireConnection;661;1;665;0
WireConnection;662;0;666;0
WireConnection;662;1;667;0
WireConnection;803;0;670;0
WireConnection;803;1;668;0
WireConnection;803;5;804;0
WireConnection;669;0;670;0
WireConnection;669;1;668;0
WireConnection;669;5;673;0
WireConnection;743;0;1095;0
WireConnection;743;1;733;0
WireConnection;743;2;748;0
WireConnection;743;3;747;0
WireConnection;820;0;819;0
WireConnection;1095;0;734;0
WireConnection;756;0;758;0
WireConnection;756;4;755;0
WireConnection;756;1;760;0
WireConnection;756;2;761;0
WireConnection;756;3;762;0
WireConnection;1166;0;1151;0
WireConnection;1215;0;1156;0
WireConnection;1215;1;1234;0
WireConnection;1215;2;1245;5
WireConnection;1159;0;1166;0
WireConnection;1158;0;1159;0
WireConnection;1190;0;1189;0
WireConnection;1187;0;1178;0
WireConnection;1187;2;1190;0
WireConnection;1186;0;1184;0
WireConnection;1186;1;1185;0
WireConnection;1130;1;1186;0
WireConnection;1234;1;1233;0
WireConnection;1208;0;1210;0
WireConnection;1208;1;1209;0
WireConnection;1178;0;1208;0
WireConnection;1225;0;1226;0
WireConnection;1225;2;1223;0
WireConnection;1223;0;1224;0
WireConnection;1233;0;1232;0
WireConnection;1233;1;1231;0
WireConnection;1229;0;1228;0
WireConnection;1229;1;1227;0
WireConnection;1222;0;1171;0
WireConnection;1222;1;1215;0
WireConnection;1226;0;1229;0
WireConnection;1243;0;1229;0
WireConnection;1184;0;1187;0
WireConnection;1184;1;1179;0
WireConnection;1247;0;1246;0
WireConnection;1156;0;1158;0
WireConnection;1246;0;1155;0
WireConnection;1246;1;1158;0
WireConnection;1154;0;1155;0
WireConnection;1154;1;1156;0
WireConnection;1147;0;1154;0
WireConnection;699;0;982;0
WireConnection;699;1;697;0
WireConnection;982;0;977;0
WireConnection;1080;0;1298;0
WireConnection;595;0;599;0
WireConnection;514;0;519;0
WireConnection;515;0;518;0
WireConnection;516;0;517;0
WireConnection;810;0;817;0
WireConnection;768;0;765;0
WireConnection;840;0;841;0
WireConnection;1298;2;1278;0
WireConnection;1083;0;1305;0
WireConnection;1305;2;1304;0
WireConnection;1304;0;1303;0
WireConnection;1304;1;1300;0
WireConnection;1304;2;891;0
WireConnection;1300;0;893;0
WireConnection;1300;1;891;0
WireConnection;1300;2;891;0
WireConnection;1300;3;891;0
WireConnection;1300;4;893;0
WireConnection;1303;0;1302;0
WireConnection;1303;1;932;0
WireConnection;586;0;933;0
WireConnection;586;1;584;0
WireConnection;673;0;899;0
WireConnection;673;1;672;0
WireConnection;532;0;1017;0
WireConnection;532;1;526;0
WireConnection;578;0;539;0
WireConnection;578;1;564;0
WireConnection;579;0;578;0
WireConnection;668;0;661;0
WireConnection;668;1;662;0
WireConnection;899;0;671;0
WireConnection;860;0;858;0
WireConnection;860;1;859;0
WireConnection;879;0;677;0
WireConnection;844;0;846;0
WireConnection;844;1;845;0
WireConnection;850;0;849;0
WireConnection;828;0;829;0
WireConnection;828;1;822;0
WireConnection;829;0;848;0
WireConnection;848;0;850;0
WireConnection;848;1;851;0
WireConnection;822;0;854;0
WireConnection;824;0;830;0
WireConnection;825;0;824;0
WireConnection;821;0;825;0
WireConnection;821;1;827;0
WireConnection;821;2;826;0
WireConnection;821;3;843;0
WireConnection;832;0;831;0
WireConnection;832;1;823;0
WireConnection;837;0;832;0
WireConnection;837;1;821;0
WireConnection;845;0;847;0
WireConnection;737;4;725;0
WireConnection;737;2;724;0
WireConnection;725;0;811;0
WireConnection;724;0;728;0
WireConnection;726;0;730;0
WireConnection;727;0;729;0
WireConnection;727;1;726;0
WireConnection;727;2;731;0
WireConnection;739;0;741;0
WireConnection;739;1;742;0
WireConnection;747;0;739;0
WireConnection;747;1;749;0
WireConnection;863;0;864;0
WireConnection;863;1;862;0
WireConnection;1171;0;1147;0
WireConnection;1171;1;1130;0
WireConnection;1171;2;1244;5
WireConnection;599;1;939;0
WireConnection;1011;0;1012;0
WireConnection;1011;1;1044;0
WireConnection;857;0;863;0
WireConnection;806;0;816;0
WireConnection;876;0;879;0
WireConnection;861;0;860;0
WireConnection;816;0;976;0
WireConnection;816;1;803;0
WireConnection;1320;0;1312;0
WireConnection;1320;1;1322;0
WireConnection;1321;0;1320;0
WireConnection;1321;1;1323;0
WireConnection;1326;0;1327;0
WireConnection;1326;1;1321;0
WireConnection;1324;0;1326;0
WireConnection;841;0;839;0
WireConnection;841;1;838;0
WireConnection;817;0;976;0
WireConnection;817;1;807;0
WireConnection;807;0;670;0
WireConnection;807;1;668;0
WireConnection;807;5;808;0
WireConnection;1078;0;809;0
WireConnection;936;0;1355;0
WireConnection;937;0;606;0
WireConnection;1355;0;583;0
WireConnection;1355;1;606;0
WireConnection;1355;2;606;0
WireConnection;1355;3;606;0
WireConnection;1355;4;583;0
WireConnection;1299;0;1054;0
WireConnection;1299;1;1050;0
WireConnection;1299;2;1050;0
WireConnection;1299;3;1050;0
WireConnection;1299;4;1054;0
WireConnection;1278;0;1271;0
WireConnection;1278;1;1299;0
WireConnection;1278;2;1050;0
WireConnection;701;0;1062;0
WireConnection;1075;0;1080;0
WireConnection;980;0;1080;0
WireConnection;1079;1;1075;0
WireConnection;1079;0;1080;0
WireConnection;1079;2;980;0
WireConnection;1062;0;1079;0
WireConnection;697;0;696;0
WireConnection;977;0;1072;0
WireConnection;977;1;1356;0
WireConnection;977;2;705;0
WireConnection;1356;0;695;0
WireConnection;1356;1;705;0
WireConnection;1356;2;705;0
WireConnection;1356;3;705;0
WireConnection;1356;4;695;0
WireConnection;1072;0;701;0
WireConnection;1072;1;694;0
WireConnection;1358;0;1361;0
WireConnection;1358;1;1360;0
WireConnection;1360;0;1359;0
WireConnection;1361;0;1364;0
WireConnection;1362;0;1363;0
WireConnection;1363;0;1365;0
WireConnection;1363;1;1366;0
WireConnection;1367;0;1358;0
WireConnection;1367;1;1362;0
WireConnection;1271;0;1369;0
WireConnection;1271;1;1272;0
WireConnection;745;0;746;0
WireConnection;746;0;744;0
WireConnection;746;1;1308;0
WireConnection;1308;0;743;0
WireConnection;1308;1;1325;0
WireConnection;1308;2;1370;0
WireConnection;1370;0;1372;0
WireConnection;1370;1;1375;0
WireConnection;1375;0;1371;0
WireConnection;1375;1;1373;0
WireConnection;1379;0;1381;0
WireConnection;1378;0;1377;0
WireConnection;1378;1;812;0
WireConnection;1381;0;688;0
WireConnection;1381;1;1378;0
WireConnection;536;0;533;0
WireConnection;826;0;828;0
WireConnection;826;1;852;0
WireConnection;826;2;836;0
WireConnection;843;0;842;0
WireConnection;932;0;892;0
WireConnection;1272;0;1053;0
WireConnection;677;0;976;0
WireConnection;677;1;669;0
WireConnection;776;0;677;0
WireConnection;1232;0;1225;0
WireConnection;1232;1;1230;0
WireConnection;1128;0;1222;0
WireConnection;574;1;539;0
WireConnection;574;0;564;0
WireConnection;574;2;579;0
WireConnection;1384;0;574;0
WireConnection;527;0;1385;0
WireConnection;538;0;520;0
WireConnection;538;1;522;0
WireConnection;538;2;1384;0
WireConnection;540;0;1341;0
WireConnection;1341;0;521;0
WireConnection;1341;1;1340;0
WireConnection;521;0;520;0
WireConnection;521;1;538;0
WireConnection;525;0;527;0
WireConnection;525;4;524;0
WireConnection;525;1;529;0
WireConnection;525;2;530;0
WireConnection;525;3;531;0
WireConnection;565;0;561;2
WireConnection;559;0;1020;0
WireConnection;563;0;560;0
WireConnection;707;0;612;0
WireConnection;707;1;753;0
WireConnection;707;2;866;0
WireConnection;708;0;707;0
WireConnection;883;0;706;0
WireConnection;883;1;708;0
WireConnection;767;0;766;0
WireConnection;1352;0;1330;0
WireConnection;1352;1;1353;0
WireConnection;1345;0;1352;0
WireConnection;1345;1;1344;0
WireConnection;1353;0;1331;0
WireConnection;1333;0;1386;0
WireConnection;1337;0;1338;0
WireConnection;1337;1;1333;0
WireConnection;1351;0;1337;0
WireConnection;1346;0;1337;0
WireConnection;1334;0;1351;0
WireConnection;1335;1;1345;0
WireConnection;1335;3;1343;0
WireConnection;1386;1;1345;0
WireConnection;1386;0;1343;0
WireConnection;698;0;684;0
WireConnection;1368;0;1367;0
WireConnection;2;0;541;0
WireConnection;2;1;777;0
WireConnection;2;2;883;0
WireConnection;2;9;1380;0
WireConnection;2;4;813;0
WireConnection;2;5;1336;0
ASEEND*/
//CHKSM=70FA54B9F4BAB672BAE0F91A0606495D36894C9E
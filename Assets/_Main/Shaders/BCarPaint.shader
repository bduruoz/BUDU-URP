// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BCarPaint"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Toggle]_TwoColors("Two Colors", Float) = 0
		_BaseColor("Base Color", Color) = (0.5,0.5,0.5,1)
		_SecondColor("Second Color", Color) = (0.4,0,0,1)
		_ColorFresnelSwitch("Color Fresnel Switch", Int) = 0
		[Toggle]_AffectReflectionFlakes("Affect Reflection Flakes", Float) = 0
		[Toggle]_FlakesNormal("FlakesNormal", Float) = 0
		[Toggle]_AffectBodyFlakes("Affect Body Flakes", Float) = 0
		[Toggle]_ColorFresnelInvert("Color Fresnel Invert", Float) = 0
		_FNormalScale("FNormal Scale", Range( -1 , 1)) = 0.1
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
		[HDR]_ReflectColor("Reflect Color", Color) = (1,1,1,1)
		_SpecularOut("Specular Out", Range( 0 , 1)) = 1
		_Glossy("Glossy", Range( 0 , 100)) = 1
		[NoScaleOffset]_ReflectMap("Reflect Map", CUBE) = "white" {}
		_FlakesGlossy("Flakes Glossy", Range( 1 , 100)) = 1
		_CubeMapRotate("Cube Map Rotate", Range( 0 , 360)) = 0
		_RefFresnelSwitch("RefFresnelSwitch", Int) = 0
		_SpecularIn("Specular In", Range( 0 , 1)) = 0
		_CMYPos("CM Y Pos", Range( -5 , 5)) = 0
		[Toggle]_RefFresnelInvert("Ref Fresnel Invert", Float) = 0
		[Header(Shade Settings)]_ShadeColor("Shade Color", Color) = (0.35,0.35,0.35,1)
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
		[HDR]_FlakesColor("Flakes Color", Color) = (1,1,1,1)
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1,1)
		[Toggle]_FlakesSwitch("Flakes Switch", Float) = 0
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		[HDR]_Softness("Softness", Range( 0 , 1)) = 0.001
		[HDR]_FlakesSoftness("Flakes Softness", Range( 0 , 3)) = 1
		_CubeMapExtras("CubeMapExtras", Int) = 0
		_FresnelFold("FresnelFold", Int) = 0
		_SpecularExtras("SpecularExtras", Int) = 0
		_TexturedFlakesToggle("TexturedFlakesToggle", Int) = 0
		_ShadeExtras("ShadeExtras", Int) = 0
		_FlakesExtras("FlakesExtras", Int) = 0
		_FlakesNormalExtras("FlakesNormalExtras", Int) = 0
		[NoScaleOffset]_FlakesNormalMap("FlakesNormalMap", 2D) = "bump" {}
		_FNTileX("FNTileX", Float) = 1
		_FNOffsetX("FNOffsetX", Float) = 0
		_FNOffsetY("FNOffsetY", Float) = 0
		_FNTileY("FNTileY", Float) = 1
		_FNormalMultiplier("FNormalMultiplier", Range( 1 , 10)) = 1
		_BodyFNormalMulti("BodyFNormalMulti", Range( -1 , 1)) = 0.1
		_RefFNormalMulti("RefFNormalMulti", Range( -1 , 1)) = 0
		_Specular("Specular", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_FlakesGloss("Flakes Gloss", Range( 0 , 1)) = 0
		_FlakesSpecular("FlakesSpecular", Range( -1 , 1)) = 0
		_FlakesWrapping("Flakes Wrapping", Range( 0 , 5)) = 0
		_FlakesTileY("FlakesTile Y", Float) = 1
		_FlakesTileX("FlakesTile X", Float) = 1
		_FlakesRotSpeed("Flakes Rot Speed", Range( -1 , 1)) = 0.3
		[Toggle]_TexturedFlakes("TexturedFlakes", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _FresnelType("FresnelType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _GradType("GradType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _RefFrsType("RefFrsType", Float) = 0
		[NoScaleOffset]_FlakesTexture("Flakes Texture", 2D) = "white" {}
		_BGloss("BGloss", Range( 0 , 1)) = 0
		_BSpecular("BSpecular", Range( -1 , 1)) = 0
		_BWrapping("BWrapping", Range( 0 , 5)) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SpecType("SpecType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _FlakesType("FlakesType", Float) = 0
		_FlakesTextureIntensity("FlakesTextureIntensity", Range( 0 , 10)) = 1


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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
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

				o.ase_normal = v.normalOS;
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				
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

				float fresnelNdotV525 = dot( normalize( WorldNormal ), WorldViewDirection );
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
				float3 ColFresnelResult536 = ( saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) ) * _ColorFresnelSwitch );
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
				float3 staticSwitch1020 = gammaToLinear1018;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = ColFresnelResult536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( ColFresnelResult536 + ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = ColFresnelResult536;
				#endif
				float4 lerpResult538 = lerp( _BaseColor , _SecondColor , float4( staticSwitch574 , 0.0 ));
				float4 BaseDiffuseResult540 = (( _TwoColors )?( lerpResult538 ):( _BaseColor ));
				
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = ASESafeNormalize( appendResult10_g154 );
				float3 temp_output_976_0 = normalizeResult12_g154;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord8.xyz.xy * appendResult661 + appendResult662;
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				
				float Zero515 = 0.0;
				float4 temp_cast_14 = (Zero515).xxxx;
				float3 temp_cast_15 = ((0.0 + (_SpecularIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxx;
				float3 temp_cast_16 = ((0.3 + (_SpecularOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxx;
				float3 LightWrapVector47_g152 = (( _BWrapping * 0.5 )).xxx;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal19_g152 = float3(0,0,1);
				float3 worldNormal19_g152 = normalize( float3(dot(tanToWorld0,tanNormal19_g152), dot(tanToWorld1,tanNormal19_g152), dot(tanToWorld2,tanNormal19_g152)) );
				float3 CurrentNormal23_g152 = worldNormal19_g152;
				float dotResult20_g152 = dot( CurrentNormal23_g152 , _MainLightPosition.xyz );
				float NDotL21_g152 = dotResult20_g152;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 AttenuationColor8_g152 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float3 DiffuseColor70_g152 = ( ( ( max( ( LightWrapVector47_g152 + ( ( 1.0 - LightWrapVector47_g152 ) * NDotL21_g152 ) ) , float3(0,0,0) ) * AttenuationColor8_g152 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * normalizedWorldNormal );
				float3 normalizeResult77_g152 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g152 = normalize( ( normalizeResult77_g152 + WorldViewDirection ) );
				float3 HalfDirection29_g152 = normalizeResult28_g152;
				float dotResult32_g152 = dot( HalfDirection29_g152 , CurrentNormal23_g152 );
				float SpecularPower14_g152 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g152 = ( AttenuationColor8_g152 * pow( max( dotResult32_g152 , 0.0 ) , SpecularPower14_g152 ) * (1.0 + (_BSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult702 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g152 + specularFinalColor42_g152 ) );
				float temp_output_1080_0 = saturate( dotResult702 );
				float3 temp_cast_17 = (temp_output_1080_0).xxx;
				float3 temp_cast_18 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_18 );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_21 );
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_19;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_15 , temp_cast_16 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 temp_output_982_0 = saturate( smoothstepResult977 );
				float3 saferPower699 = abs( temp_output_982_0 );
				float3 temp_cast_23 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_24 = (0.0).xxx;
				float3 temp_cast_25 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_23 ) ) , temp_cast_24 , temp_cast_25 );
				float4 Specular2698 = (( _SpecularSwitch )?( (( float4( clampResult681 , 0.0 ) * _SpecColor * ase_lightColor )*_SpecularIntensity + 0.0) ):( temp_cast_14 ));
				float4 temp_cast_27 = ((0.0 + (_FlakesIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_28 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float3 LightWrapVector47_g153 = (( _FlakesWrapping * 0.5 )).xxx;
				float3 tanNormal19_g153 = float3(0,0,1);
				float3 worldNormal19_g153 = normalize( float3(dot(tanToWorld0,tanNormal19_g153), dot(tanToWorld1,tanNormal19_g153), dot(tanToWorld2,tanNormal19_g153)) );
				float3 CurrentNormal23_g153 = worldNormal19_g153;
				float dotResult20_g153 = dot( CurrentNormal23_g153 , _MainLightPosition.xyz );
				float NDotL21_g153 = dotResult20_g153;
				float3 AttenuationColor8_g153 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal610 = FlakesObjectNormals776;
				float3 worldNormal610 = float3(dot(tanToWorld0,tanNormal610), dot(tanToWorld1,tanNormal610), dot(tanToWorld2,tanNormal610));
				float3 DiffuseColor70_g153 = ( ( ( max( ( LightWrapVector47_g153 + ( ( 1.0 - LightWrapVector47_g153 ) * NDotL21_g153 ) ) , float3(0,0,0) ) * AttenuationColor8_g153 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * worldNormal610 );
				float3 normalizeResult77_g153 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g153 = normalize( ( normalizeResult77_g153 + WorldViewDirection ) );
				float3 HalfDirection29_g153 = normalizeResult28_g153;
				float dotResult32_g153 = dot( HalfDirection29_g153 , CurrentNormal23_g153 );
				float SpecularPower14_g153 = exp2( ( ( _FlakesGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g153 = ( AttenuationColor8_g153 * pow( max( dotResult32_g153 , 0.0 ) , SpecularPower14_g153 ) * (1.0 + (_FlakesSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult596 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g153 + specularFinalColor42_g153 ) );
				float temp_output_1083_0 = saturate( dotResult596 );
				float3 temp_cast_29 = (temp_output_1083_0).xxx;
				float3 temp_cast_30 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_31;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_27 , temp_cast_28 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_36 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_37 = (0.0).xxxx;
				float4 temp_cast_38 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_36 ) ) , temp_cast_37 , temp_cast_38 );
				float One514 = 1.0;
				float4 temp_cast_39 = (One514).xxxx;
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
				float4 Flakes_Result595 = (( _FlakesSwitch )?( (( clampResult590 * _FlakesColor * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_39 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_40 = (Zero515).xxxx;
				float3 temp_cast_41 = (_ReflectionStrength).xxx;
				float3 temp_cast_42 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_42 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) )) );
				float3 FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, FlakesReflectNormals810 ), dot( tanToWorld1, FlakesReflectNormals810 ), dot( tanToWorld2, FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g149 = worldRefl725;
				float3 appendResult10_g149 = (float3(0.0 , VertexPos5_g149.y , 0.0));
				float3 VertexPosRotationAxis11_g149 = appendResult10_g149;
				float3 break13_g149 = VertexPos5_g149;
				float3 appendResult14_g149 = (float3(break13_g149.x , 0.0 , break13_g149.z));
				float3 VertexPosOtherAxis12_g149 = appendResult14_g149;
				float Angle3_g149 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float fresnelNdotV756 = dot( normalize( WorldNormal ), WorldViewDirection );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_44 = (fresnelNode756).xxx;
				float3 temp_cast_45 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_45 );
				float3 temp_cast_46 = (fresnelNode756).xxx;
				float3 temp_cast_47 = (fresnelNode756).xxx;
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_48 );
				float3 temp_cast_49 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_46;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 RefFresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float4 Reflect745 = (( _Reflect )?( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g149 + ( VertexPosOtherAxis12_g149 * cos( Angle3_g149 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g149 ) * sin( Angle3_g149 ) ) ) + appendResult727 ) ) * _ReflectColor ) * float4( ( 1.0 - RefFresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * One514 ) + One514 ) ) ):( temp_cast_40 ));
				float4 temp_cast_51 = (Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = normalize( float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879)) );
				float3 FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( FlakesNormal876 , _MainLightPosition.xyz );
				float NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_52 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * BaseDiffuseResult540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection857 * BaseDiffuseResult540 ) ) , temp_cast_52 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_53 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_53 ) * ase_lightColor ) ):( temp_cast_51 ));
				
				float3 temp_cast_55 = (_Specular).xxx;
				

				float3 BaseColor = BaseDiffuseResult540.rgb;
				float3 Normal = FlakesBodyNormals806;
				float3 Emission = ( Specular2698 + saturate( ( Flakes_Result595 + Reflect745 + ShadeColor840 ) ) ).rgb;
				float3 Specular = temp_cast_55;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_normal = v.normalOS;
				o.ase_texcoord7.xyz = v.texcoord0.xyz;
				
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float fresnelNdotV525 = dot( normalize( ase_worldNormal ), ase_worldViewDir );
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
				float3 ColFresnelResult536 = ( saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) ) * _ColorFresnelSwitch );
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
				float3 staticSwitch1020 = gammaToLinear1018;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = ColFresnelResult536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( ColFresnelResult536 + ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = ColFresnelResult536;
				#endif
				float4 lerpResult538 = lerp( _BaseColor , _SecondColor , float4( staticSwitch574 , 0.0 ));
				float4 BaseDiffuseResult540 = (( _TwoColors )?( lerpResult538 ):( _BaseColor ));
				
				float Zero515 = 0.0;
				float4 temp_cast_14 = (Zero515).xxxx;
				float3 temp_cast_15 = ((0.0 + (_SpecularIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxx;
				float3 temp_cast_16 = ((0.3 + (_SpecularOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxx;
				float3 LightWrapVector47_g152 = (( _BWrapping * 0.5 )).xxx;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal19_g152 = float3(0,0,1);
				float3 worldNormal19_g152 = normalize( float3(dot(tanToWorld0,tanNormal19_g152), dot(tanToWorld1,tanNormal19_g152), dot(tanToWorld2,tanNormal19_g152)) );
				float3 CurrentNormal23_g152 = worldNormal19_g152;
				float dotResult20_g152 = dot( CurrentNormal23_g152 , _MainLightPosition.xyz );
				float NDotL21_g152 = dotResult20_g152;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 AttenuationColor8_g152 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 DiffuseColor70_g152 = ( ( ( max( ( LightWrapVector47_g152 + ( ( 1.0 - LightWrapVector47_g152 ) * NDotL21_g152 ) ) , float3(0,0,0) ) * AttenuationColor8_g152 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * normalizedWorldNormal );
				float3 normalizeResult77_g152 = normalize( _MainLightPosition.xyz );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult28_g152 = normalize( ( normalizeResult77_g152 + ase_worldViewDir ) );
				float3 HalfDirection29_g152 = normalizeResult28_g152;
				float dotResult32_g152 = dot( HalfDirection29_g152 , CurrentNormal23_g152 );
				float SpecularPower14_g152 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g152 = ( AttenuationColor8_g152 * pow( max( dotResult32_g152 , 0.0 ) , SpecularPower14_g152 ) * (1.0 + (_BSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult702 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g152 + specularFinalColor42_g152 ) );
				float temp_output_1080_0 = saturate( dotResult702 );
				float3 temp_cast_17 = (temp_output_1080_0).xxx;
				float3 temp_cast_18 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_18 );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_21 );
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_19;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_15 , temp_cast_16 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 temp_output_982_0 = saturate( smoothstepResult977 );
				float3 saferPower699 = abs( temp_output_982_0 );
				float3 temp_cast_23 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_24 = (0.0).xxx;
				float3 temp_cast_25 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_23 ) ) , temp_cast_24 , temp_cast_25 );
				float4 Specular2698 = (( _SpecularSwitch )?( (( float4( clampResult681 , 0.0 ) * _SpecColor * ase_lightColor )*_SpecularIntensity + 0.0) ):( temp_cast_14 ));
				float4 temp_cast_27 = ((0.0 + (_FlakesIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_28 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float3 LightWrapVector47_g153 = (( _FlakesWrapping * 0.5 )).xxx;
				float3 tanNormal19_g153 = float3(0,0,1);
				float3 worldNormal19_g153 = normalize( float3(dot(tanToWorld0,tanNormal19_g153), dot(tanToWorld1,tanNormal19_g153), dot(tanToWorld2,tanNormal19_g153)) );
				float3 CurrentNormal23_g153 = worldNormal19_g153;
				float dotResult20_g153 = dot( CurrentNormal23_g153 , _MainLightPosition.xyz );
				float NDotL21_g153 = dotResult20_g153;
				float3 AttenuationColor8_g153 = ( ase_lightColor.rgb * ase_lightAtten );
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = ASESafeNormalize( appendResult10_g154 );
				float3 temp_output_976_0 = normalizeResult12_g154;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord7.xyz.xy * appendResult661 + appendResult662;
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal610 = FlakesObjectNormals776;
				float3 worldNormal610 = float3(dot(tanToWorld0,tanNormal610), dot(tanToWorld1,tanNormal610), dot(tanToWorld2,tanNormal610));
				float3 DiffuseColor70_g153 = ( ( ( max( ( LightWrapVector47_g153 + ( ( 1.0 - LightWrapVector47_g153 ) * NDotL21_g153 ) ) , float3(0,0,0) ) * AttenuationColor8_g153 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * worldNormal610 );
				float3 normalizeResult77_g153 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g153 = normalize( ( normalizeResult77_g153 + ase_worldViewDir ) );
				float3 HalfDirection29_g153 = normalizeResult28_g153;
				float dotResult32_g153 = dot( HalfDirection29_g153 , CurrentNormal23_g153 );
				float SpecularPower14_g153 = exp2( ( ( _FlakesGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g153 = ( AttenuationColor8_g153 * pow( max( dotResult32_g153 , 0.0 ) , SpecularPower14_g153 ) * (1.0 + (_FlakesSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult596 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g153 + specularFinalColor42_g153 ) );
				float temp_output_1083_0 = saturate( dotResult596 );
				float3 temp_cast_29 = (temp_output_1083_0).xxx;
				float3 temp_cast_30 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_31;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_27 , temp_cast_28 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_36 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_37 = (0.0).xxxx;
				float4 temp_cast_38 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_36 ) ) , temp_cast_37 , temp_cast_38 );
				float One514 = 1.0;
				float4 temp_cast_39 = (One514).xxxx;
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
				float4 Flakes_Result595 = (( _FlakesSwitch )?( (( clampResult590 * _FlakesColor * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_39 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_40 = (Zero515).xxxx;
				float3 temp_cast_41 = (_ReflectionStrength).xxx;
				float3 temp_cast_42 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_42 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) )) );
				float3 FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, FlakesReflectNormals810 ), dot( tanToWorld1, FlakesReflectNormals810 ), dot( tanToWorld2, FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g149 = worldRefl725;
				float3 appendResult10_g149 = (float3(0.0 , VertexPos5_g149.y , 0.0));
				float3 VertexPosRotationAxis11_g149 = appendResult10_g149;
				float3 break13_g149 = VertexPos5_g149;
				float3 appendResult14_g149 = (float3(break13_g149.x , 0.0 , break13_g149.z));
				float3 VertexPosOtherAxis12_g149 = appendResult14_g149;
				float Angle3_g149 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float fresnelNdotV756 = dot( normalize( ase_worldNormal ), ase_worldViewDir );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_44 = (fresnelNode756).xxx;
				float3 temp_cast_45 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_45 );
				float3 temp_cast_46 = (fresnelNode756).xxx;
				float3 temp_cast_47 = (fresnelNode756).xxx;
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_48 );
				float3 temp_cast_49 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_46;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 RefFresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float4 Reflect745 = (( _Reflect )?( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g149 + ( VertexPosOtherAxis12_g149 * cos( Angle3_g149 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g149 ) * sin( Angle3_g149 ) ) ) + appendResult727 ) ) * _ReflectColor ) * float4( ( 1.0 - RefFresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * One514 ) + One514 ) ) ):( temp_cast_40 ));
				float4 temp_cast_51 = (Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = normalize( float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879)) );
				float3 FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( FlakesNormal876 , _MainLightPosition.xyz );
				float NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_52 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * BaseDiffuseResult540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection857 * BaseDiffuseResult540 ) ) , temp_cast_52 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_53 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_53 ) * ase_lightColor ) ):( temp_cast_51 ));
				

				float3 BaseColor = BaseDiffuseResult540.rgb;
				float3 Emission = ( Specular2698 + saturate( ( Flakes_Result595 + Reflect745 + ShadeColor840 ) ) ).rgb;
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

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma shader_feature_local _PAINTMETHOD_FRESNEL _PAINTMETHOD_GRADIENTY _PAINTMETHOD_GRADIENTYFRESNEL
			#pragma shader_feature_local _FRESNELTYPE_LINEAR _FRESNELTYPE_NORMAL _FRESNELTYPE_GAMMA
			#pragma shader_feature_local _GRADTYPE_LINEAR _GRADTYPE_NORMAL _GRADTYPE_GAMMA


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
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
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord2.xyz;
				float fresnelNdotV525 = dot( normalize( ase_worldNormal ), ase_worldViewDir );
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
				float3 ColFresnelResult536 = ( saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) ) * _ColorFresnelSwitch );
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
				float3 staticSwitch1020 = gammaToLinear1018;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = ColFresnelResult536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( ColFresnelResult536 + ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = ColFresnelResult536;
				#endif
				float4 lerpResult538 = lerp( _BaseColor , _SecondColor , float4( staticSwitch574 , 0.0 ));
				float4 BaseDiffuseResult540 = (( _TwoColors )?( lerpResult538 ):( _BaseColor ));
				

				float3 BaseColor = BaseDiffuseResult540.rgb;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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

				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = ASESafeNormalize( appendResult10_g154 );
				float3 temp_output_976_0 = normalizeResult12_g154;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord5.xy * appendResult661 + appendResult662;
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				

				float3 Normal = FlakesBodyNormals806;
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
			sampler2D _FlakesTexture;
			samplerCUBE _ReflectMap;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
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

				o.ase_normal = v.normalOS;
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				
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

				float fresnelNdotV525 = dot( normalize( WorldNormal ), WorldViewDirection );
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
				float3 ColFresnelResult536 = ( saturate( (( _ColorFresnelInvert )?( ( 1.0 - staticSwitch1017 ) ):( staticSwitch1017 )) ) * _ColorFresnelSwitch );
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
				float3 staticSwitch1020 = gammaToLinear1018;
				#endif
				float3 temp_output_559_0 = ( staticSwitch1020 + float3( 0,0,0 ) );
				float3 ColorGradYResult563 = saturate( ((( _GradYInvert )?( temp_output_559_0 ):( ( 1.0 - temp_output_559_0 ) ))*_GradScale + _GradOffset) );
				#if defined( _PAINTMETHOD_FRESNEL )
				float3 staticSwitch574 = ColFresnelResult536;
				#elif defined( _PAINTMETHOD_GRADIENTY )
				float3 staticSwitch574 = ColorGradYResult563;
				#elif defined( _PAINTMETHOD_GRADIENTYFRESNEL )
				float3 staticSwitch574 = saturate( ( ColFresnelResult536 + ColorGradYResult563 ) );
				#else
				float3 staticSwitch574 = ColFresnelResult536;
				#endif
				float4 lerpResult538 = lerp( _BaseColor , _SecondColor , float4( staticSwitch574 , 0.0 ));
				float4 BaseDiffuseResult540 = (( _TwoColors )?( lerpResult538 ):( _BaseColor ));
				
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = ASESafeNormalize( appendResult10_g154 );
				float3 temp_output_976_0 = normalizeResult12_g154;
				float2 appendResult661 = (float2(_FNTileX , _FNTileY));
				float2 appendResult662 = (float2(_FNOffsetX , _FNOffsetY));
				float2 texCoord668 = IN.ase_texcoord8.xyz.xy * appendResult661 + appendResult662;
				float3 unpack803 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * _BodyFNormalMulti ) );
				unpack803.z = lerp( 1, unpack803.z, saturate(( _FNormalScale * _BodyFNormalMulti )) );
				float3 FlakesBodyNormals806 = (( _AffectBodyFlakes )?( unpack803 ):( temp_output_976_0 ));
				
				float Zero515 = 0.0;
				float4 temp_cast_14 = (Zero515).xxxx;
				float3 temp_cast_15 = ((0.0 + (_SpecularIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxx;
				float3 temp_cast_16 = ((0.3 + (_SpecularOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxx;
				float3 LightWrapVector47_g152 = (( _BWrapping * 0.5 )).xxx;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal19_g152 = float3(0,0,1);
				float3 worldNormal19_g152 = normalize( float3(dot(tanToWorld0,tanNormal19_g152), dot(tanToWorld1,tanNormal19_g152), dot(tanToWorld2,tanNormal19_g152)) );
				float3 CurrentNormal23_g152 = worldNormal19_g152;
				float dotResult20_g152 = dot( CurrentNormal23_g152 , _MainLightPosition.xyz );
				float NDotL21_g152 = dotResult20_g152;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 AttenuationColor8_g152 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float3 DiffuseColor70_g152 = ( ( ( max( ( LightWrapVector47_g152 + ( ( 1.0 - LightWrapVector47_g152 ) * NDotL21_g152 ) ) , float3(0,0,0) ) * AttenuationColor8_g152 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * normalizedWorldNormal );
				float3 normalizeResult77_g152 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g152 = normalize( ( normalizeResult77_g152 + WorldViewDirection ) );
				float3 HalfDirection29_g152 = normalizeResult28_g152;
				float dotResult32_g152 = dot( HalfDirection29_g152 , CurrentNormal23_g152 );
				float SpecularPower14_g152 = exp2( ( ( _BGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g152 = ( AttenuationColor8_g152 * pow( max( dotResult32_g152 , 0.0 ) , SpecularPower14_g152 ) * (1.0 + (_BSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult702 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g152 + specularFinalColor42_g152 ) );
				float temp_output_1080_0 = saturate( dotResult702 );
				float3 temp_cast_17 = (temp_output_1080_0).xxx;
				float3 temp_cast_18 = (temp_output_1080_0).xxx;
				float3 gammaToLinear1075 = Gamma22ToLinear( temp_cast_18 );
				float3 temp_cast_19 = (temp_output_1080_0).xxx;
				float3 temp_cast_20 = (temp_output_1080_0).xxx;
				float3 temp_cast_21 = (temp_output_1080_0).xxx;
				float3 linearToGamma980 = LinearToGamma22( temp_cast_21 );
				float3 temp_cast_22 = (temp_output_1080_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch1079 = gammaToLinear1075;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch1079 = temp_cast_19;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch1079 = linearToGamma980;
				#else
				float3 staticSwitch1079 = gammaToLinear1075;
				#endif
				float3 smoothstepResult977 = smoothstep( temp_cast_15 , temp_cast_16 , (( 1.0 - sqrt( staticSwitch1079 ) )*_Glossy + 0.0));
				float3 temp_output_982_0 = saturate( smoothstepResult977 );
				float3 saferPower699 = abs( temp_output_982_0 );
				float3 temp_cast_23 = ((0.0001 + (_Softness - 0.0) * (0.1 - 0.0001) / (1.0 - 0.0))).xxx;
				float3 temp_cast_24 = (0.0).xxx;
				float3 temp_cast_25 = (_SpecularSaturation).xxx;
				float3 clampResult681 = clamp( ( 1.0 - pow( saferPower699 , temp_cast_23 ) ) , temp_cast_24 , temp_cast_25 );
				float4 Specular2698 = (( _SpecularSwitch )?( (( float4( clampResult681 , 0.0 ) * _SpecColor * ase_lightColor )*_SpecularIntensity + 0.0) ):( temp_cast_14 ));
				float4 temp_cast_27 = ((0.0 + (_FlakesIn - 0.0) * (0.7 - 0.0) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_28 = ((0.3 + (_FlakesOut - 0.0) * (1.0 - 0.3) / (1.0 - 0.0))).xxxx;
				float3 LightWrapVector47_g153 = (( _FlakesWrapping * 0.5 )).xxx;
				float3 tanNormal19_g153 = float3(0,0,1);
				float3 worldNormal19_g153 = normalize( float3(dot(tanToWorld0,tanNormal19_g153), dot(tanToWorld1,tanNormal19_g153), dot(tanToWorld2,tanNormal19_g153)) );
				float3 CurrentNormal23_g153 = worldNormal19_g153;
				float dotResult20_g153 = dot( CurrentNormal23_g153 , _MainLightPosition.xyz );
				float NDotL21_g153 = dotResult20_g153;
				float3 AttenuationColor8_g153 = ( ase_lightColor.rgb * ase_lightAtten );
				float3 unpack669 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier ) );
				unpack669.z = lerp( 1, unpack669.z, saturate(( (0.1 + (_FNormalScale - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) * _FNormalMultiplier )) );
				float3 FlakesObjectNormals776 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 tanNormal610 = FlakesObjectNormals776;
				float3 worldNormal610 = float3(dot(tanToWorld0,tanNormal610), dot(tanToWorld1,tanNormal610), dot(tanToWorld2,tanNormal610));
				float3 DiffuseColor70_g153 = ( ( ( max( ( LightWrapVector47_g153 + ( ( 1.0 - LightWrapVector47_g153 ) * NDotL21_g153 ) ) , float3(0,0,0) ) * AttenuationColor8_g153 ) + (UNITY_LIGHTMODEL_AMBIENT).rgb ) * worldNormal610 );
				float3 normalizeResult77_g153 = normalize( _MainLightPosition.xyz );
				float3 normalizeResult28_g153 = normalize( ( normalizeResult77_g153 + WorldViewDirection ) );
				float3 HalfDirection29_g153 = normalizeResult28_g153;
				float dotResult32_g153 = dot( HalfDirection29_g153 , CurrentNormal23_g153 );
				float SpecularPower14_g153 = exp2( ( ( _FlakesGloss * 10.0 ) + 1.0 ) );
				float3 specularFinalColor42_g153 = ( AttenuationColor8_g153 * pow( max( dotResult32_g153 , 0.0 ) , SpecularPower14_g153 ) * (1.0 + (_FlakesSpecular - -1.0) * (-1.0 - 1.0) / (1.0 - -1.0)) );
				float dotResult596 = dot( _MainLightPosition.xyz , ( DiffuseColor70_g153 + specularFinalColor42_g153 ) );
				float temp_output_1083_0 = saturate( dotResult596 );
				float3 temp_cast_29 = (temp_output_1083_0).xxx;
				float3 temp_cast_30 = (temp_output_1083_0).xxx;
				float3 gammaToLinear1081 = FastSRGBToLinear( temp_cast_30 );
				float3 temp_cast_31 = (temp_output_1083_0).xxx;
				float3 temp_cast_32 = (temp_output_1083_0).xxx;
				float3 temp_cast_33 = (temp_output_1083_0).xxx;
				float3 linearToGamma1082 = FastLinearToSRGB( temp_cast_33 );
				float3 temp_cast_34 = (temp_output_1083_0).xxx;
				#if defined( _FLAKESTYPE_LINEAR )
				float3 staticSwitch1085 = gammaToLinear1081;
				#elif defined( _FLAKESTYPE_NORMAL )
				float3 staticSwitch1085 = temp_cast_31;
				#elif defined( _FLAKESTYPE_GAMMA )
				float3 staticSwitch1085 = linearToGamma1082;
				#else
				float3 staticSwitch1085 = gammaToLinear1081;
				#endif
				float4 smoothstepResult933 = smoothstep( temp_cast_27 , temp_cast_28 , CalculateContrast(_FlakesGlossy,float4( ( 1.0 - staticSwitch1085 ) , 0.0 )));
				float4 saferPower586 = abs( smoothstepResult933 );
				float4 temp_cast_36 = ((0.01 + (_FlakesSoftness - 0.0) * (0.3 - 0.01) / (3.0 - 0.0))).xxxx;
				float4 temp_cast_37 = (0.0).xxxx;
				float4 temp_cast_38 = (_FlakesSaturation).xxxx;
				float4 clampResult590 = clamp( ( 1.0 - pow( saferPower586 , temp_cast_36 ) ) , temp_cast_37 , temp_cast_38 );
				float One514 = 1.0;
				float4 temp_cast_39 = (One514).xxxx;
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
				float4 Flakes_Result595 = (( _FlakesSwitch )?( (( clampResult590 * _FlakesColor * ase_lightColor * (( _TexturedFlakes )?( saturate( ( tex2D( _FlakesTexture, rotator1004 ) * tex2D( _FlakesTexture, rotator1036 ) * _FlakesTextureIntensity ) ) ):( temp_cast_39 )) )*_FlakesIntensity + 0.0) ):( float4( 0,0,0,0 ) ));
				float4 temp_cast_40 = (Zero515).xxxx;
				float3 temp_cast_41 = (_ReflectionStrength).xxx;
				float3 temp_cast_42 = (_ReflectionStrength).xxx;
				float3 gammaToLinear1095 = Gamma22ToLinear( temp_cast_42 );
				float3 unpack807 = UnpackNormalScale( tex2D( _FlakesNormalMap, texCoord668 ), ( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) ) );
				unpack807.z = lerp( 1, unpack807.z, saturate(( _FNormalScale * (-0.1 + (_RefFNormalMulti - -1.0) * (0.1 - -0.1) / (1.0 - -1.0)) )) );
				float3 FlakesReflectNormals810 = (( _AffectReflectionFlakes )?( unpack807 ):( temp_output_976_0 ));
				float3 worldRefl725 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, FlakesReflectNormals810 ), dot( tanToWorld1, FlakesReflectNormals810 ), dot( tanToWorld2, FlakesReflectNormals810 ) ) ) );
				float3 VertexPos5_g149 = worldRefl725;
				float3 appendResult10_g149 = (float3(0.0 , VertexPos5_g149.y , 0.0));
				float3 VertexPosRotationAxis11_g149 = appendResult10_g149;
				float3 break13_g149 = VertexPos5_g149;
				float3 appendResult14_g149 = (float3(break13_g149.x , 0.0 , break13_g149.z));
				float3 VertexPosOtherAxis12_g149 = appendResult14_g149;
				float Angle3_g149 = radians( _CubeMapRotate );
				float3 appendResult727 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float fresnelNdotV756 = dot( normalize( WorldNormal ), WorldViewDirection );
				float fresnelNode756 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV756 , 0.0001 ), _RefFresnelPower ) );
				float3 temp_cast_44 = (fresnelNode756).xxx;
				float3 temp_cast_45 = (fresnelNode756).xxx;
				float3 gammaToLinear769 = Gamma22ToLinear( temp_cast_45 );
				float3 temp_cast_46 = (fresnelNode756).xxx;
				float3 temp_cast_47 = (fresnelNode756).xxx;
				float3 temp_cast_48 = (fresnelNode756).xxx;
				float3 linearToGamma1022 = LinearToGamma22( temp_cast_48 );
				float3 temp_cast_49 = (fresnelNode756).xxx;
				#if defined( _REFFRSTYPE_LINEAR )
				float3 staticSwitch1021 = gammaToLinear769;
				#elif defined( _REFFRSTYPE_NORMAL )
				float3 staticSwitch1021 = temp_cast_46;
				#elif defined( _REFFRSTYPE_GAMMA )
				float3 staticSwitch1021 = linearToGamma1022;
				#else
				float3 staticSwitch1021 = gammaToLinear769;
				#endif
				float3 RefFresnelResult767 = ( saturate( (( _RefFresnelInvert )?( staticSwitch1021 ):( ( 1.0 - staticSwitch1021 ) )) ) * _RefFresnelSwitch );
				float4 Reflect745 = (( _Reflect )?( ( float4( gammaToLinear1095 , 0.0 ) * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g149 + ( VertexPosOtherAxis12_g149 * cos( Angle3_g149 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g149 ) * sin( Angle3_g149 ) ) ) + appendResult727 ) ) * _ReflectColor ) * float4( ( 1.0 - RefFresnelResult767 ) , 0.0 ) * ( ( _ReflectionMultiplier * One514 ) + One514 ) ) ):( temp_cast_40 ));
				float4 temp_cast_51 = (Zero515).xxxx;
				float3 tanNormal879 = (( _FlakesNormal )?( unpack669 ):( temp_output_976_0 ));
				float3 worldNormal879 = normalize( float3(dot(tanToWorld0,tanNormal879), dot(tanToWorld1,tanNormal879), dot(tanToWorld2,tanNormal879)) );
				float3 FlakesNormal876 = worldNormal879;
				float dotResult863 = dot( FlakesNormal876 , _MainLightPosition.xyz );
				float NormalLightDirection857 = dotResult863;
				float temp_output_830_0 = ( ( (-0.4 + (_BaseCellOffset - 0.0) * (0.4 - -0.4) / (1.0 - 0.0)) + NormalLightDirection857 ) / (0.5 + (_BaseCellSharpness - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) );
				float clampResult822 = clamp( _ShadingContrast , 0.01 , 10.0 );
				float4 temp_cast_52 = (clampResult822).xxxx;
				float4 saferPower844 = abs( saturate( ( ( saturate( temp_output_830_0 ) * BaseDiffuseResult540 ) + ( saturate( ( 1.0 - temp_output_830_0 ) ) * _ShadeColor * (pow( saturate( ( -NormalLightDirection857 * BaseDiffuseResult540 ) ) , temp_cast_52 )*_ShadingContribution + _ShadingOffset) * (0.0 + (_ShadingIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) ) ) ) );
				float4 temp_cast_53 = ((4.0 + (_ShadeContrast - 0.0) * (0.5 - 4.0) / (2.0 - 0.0))).xxxx;
				float4 ShadeColor840 = (( _ShadeColorToggle )?( ( pow( saferPower844 , temp_cast_53 ) * ase_lightColor ) ):( temp_cast_51 ));
				
				float3 temp_cast_55 = (_Specular).xxx;
				

				float3 BaseColor = BaseDiffuseResult540.rgb;
				float3 Normal = FlakesBodyNormals806;
				float3 Emission = ( Specular2698 + saturate( ( Flakes_Result595 + Reflect745 + ShadeColor840 ) ) ).rgb;
				float3 Specular = temp_cast_55;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
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
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
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
			float4 _ReflectColor;
			float4 _SpecColor;
			float4 _ShadeColor;
			float4 _FlakesColor;
			float4 _BaseColor;
			float4 _SecondColor;
			int _SpecularExtras;
			float _AffectReflectionFlakes;
			float _ReflectionStrength;
			float _Reflect;
			float _FlakesIntensity;
			float _FlakesTextureIntensity;
			float _FlakesRotSpeed;
			float _TexturedFlakes;
			float _FlakesTileX;
			float _RefFNormalMulti;
			float _FlakesSaturation;
			float _FlakesSoftness;
			float _FlakesSpecular;
			float _FlakesGloss;
			float _FlakesTileY;
			float _CubeMapRotate;
			float _CMYPos;
			float _FNormalMultiplier;
			float _ShadeContrast;
			float _ShadingIntensity;
			float _ShadingOffset;
			float _ShadingContribution;
			float _ShadingContrast;
			float _BaseCellSharpness;
			float _BaseCellOffset;
			float _ShadeColorToggle;
			float _ReflectionMultiplier;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMXPos;
			float _FlakesNormal;
			float _FlakesGlossy;
			float _Specular;
			float _GradOffset;
			float _GradScale;
			float _GradYInvert;
			int _ColorFresnelSwitch;
			float _ColFresnelPower;
			float _ColFresnelScale;
			float _ColFresnelBias;
			float _ColorFresnelInvert;
			float _TwoColors;
			int _ShadeExtras;
			int _FlakesExtras;
			int _CubeMapExtras;
			int _FresnelFold;
			int _TexturedFlakesToggle;
			int _FlakesNormalExtras;
			float _AffectBodyFlakes;
			float _FNTileX;
			float _FNTileY;
			float _FNOffsetX;
			float _FlakesOut;
			float _FlakesIn;
			float _FlakesSwitch;
			float _SpecularIntensity;
			float _SpecularSaturation;
			float _Softness;
			float _Glossy;
			float _FlakesWrapping;
			float _BSpecular;
			float _BWrapping;
			float _SpecularOut;
			float _SpecularIn;
			float _SpecularSwitch;
			float _BodyFNormalMulti;
			float _FNormalScale;
			float _FNOffsetY;
			float _BGloss;
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
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;1248;-7920,-10224;Inherit;False;4260;1842;Sticker-Deneme;41;1151;1166;1128;1215;1171;1159;1158;1190;1189;1187;1179;1185;1186;1130;1234;1209;1208;1210;1178;1225;1223;1232;1233;1230;1231;1224;1227;1244;1245;1228;1229;1222;1226;1243;1184;1247;1155;1156;1246;1154;1147;Sticker-Deneme;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1097;-3104,-5360;Inherit;False;692;388;Final Comp;8;707;706;708;612;866;753;883;1;Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;865;-9712,-4784;Inherit;False;1782.021;1060.089;Flakes Normal Settings;29;776;810;806;668;876;817;677;816;879;976;669;803;807;670;667;666;665;664;662;661;672;805;809;671;1078;808;804;899;673;Flakes Normal Settings;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;566;-5232,-6384;Inherit;False;1511.954;681.8707;Base Color Settings;10;574;540;521;538;520;522;579;578;564;539;Base Color Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;562;-10064,-2800;Inherit;False;2137.461;432.5065;Color Y Gradient Settings;13;1019;1020;563;560;550;551;552;576;575;559;1018;565;561;Color Y Gradient Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;513;-3920,-4848;Inherit;False;554.2303;682.2439;Local Vars;13;1094;888;1093;1092;1013;897;611;517;519;518;514;515;516;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;523;-10064,-3648;Inherit;False;2135.198;766.77;Color Fresnel Settings;16;1017;771;1015;532;533;537;536;534;535;526;525;531;530;529;524;527;Color Fresnel Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;580;-7888,-4848;Inherit;False;3911.593;1132.647;Flakes Setting;53;1039;1045;1012;1044;1011;1086;1042;1041;1036;1038;1004;1010;1006;1014;1005;1008;1009;1007;937;584;585;596;1083;1085;932;815;892;893;891;917;610;714;936;583;582;606;1082;1081;598;600;933;586;590;587;595;599;593;594;939;592;591;589;588;Flakes Setting;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;679;-7888,-5520;Inherit;False;4255.537;633.793;Specular Setup;38;1054;697;696;1080;713;702;1056;709;1053;1050;916;684;688;988;700;683;682;689;691;690;681;680;699;718;705;978;695;694;982;977;1072;701;1062;980;1075;1079;979;698;Specular Setup;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;723;-7888,-3648;Inherit;False;2309.188;700.4033;Reflection Map;27;811;738;748;749;747;739;742;741;733;725;746;745;744;743;740;737;736;735;734;731;730;729;728;727;726;724;1095;Reflection Map;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;754;-10064,-2288;Inherit;False;2140.85;785.0344;Fresnel Settings;16;1021;765;767;763;1022;769;757;768;766;764;756;758;755;762;761;760;Fresnel Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;818;-7888,-6416;Inherit;False;2634.624;845.2722;Shading Settings;36;840;849;841;839;853;823;851;854;852;850;848;847;846;845;844;843;842;838;837;836;835;834;833;832;831;830;829;828;827;826;825;824;822;821;820;819;Shading Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;855;-9712,-5392;Inherit;False;776.7012;500.1391;Normal Light Direction;4;864;863;862;857;Normal Light Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;856;-8896,-5392;Inherit;False;750.2195;495.1738;Normal View Direction;4;861;860;859;858;Normal View Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;539;-5184,-5952;Inherit;False;536;ColFresnelResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;-5184,-5872;Inherit;False;563;ColorGradYResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;578;-4960,-5824;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;579;-4848,-5824;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;522;-4688,-6128;Inherit;False;Property;_SecondColor;Second Color;2;0;Create;True;0;0;0;False;0;False;0.4,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;520;-4688,-6320;Inherit;False;Property;_BaseColor;Base Color;1;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;538;-4448,-6128;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;521;-4192,-6272;Inherit;False;Property;_TwoColors;Two Colors;0;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;540;-3968,-6272;Inherit;False;BaseDiffuseResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;724;-7520,-3328;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;726;-7392,-3168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;727;-7248,-3216;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;728;-7792,-3328;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;25;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;729;-7664,-3248;Inherit;False;Property;_CMXPos;CM X Pos;32;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;730;-7664,-3168;Inherit;False;Property;_CMYPos;CM Y Pos;28;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-7664,-3088;Inherit;False;Property;_CMZPos;CM Z Pos;41;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;735;-6880,-3520;Inherit;True;Property;_ReflectMap;Reflect Map;23;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;736;-7088,-3520;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;737;-7344,-3520;Inherit;False;ComputeRotationY;-1;;149;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;740;-6816,-3328;Inherit;False;Property;_ReflectColor;Reflect Color;20;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;745;-5808,-3552;Inherit;False;Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;746;-6016,-3552;Inherit;False;Property;_Reflect;Reflect;15;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;762;-10032,-1616;Inherit;False;Property;_RefFresnelPower;RefFresnelPower;44;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;755;-9984,-1984;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;758;-9984,-2208;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldReflectionVector;725;-7600,-3568;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;822;-7344,-5728;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.01;False;2;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;824;-6928,-6192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;825;-6768,-6192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;826;-6832,-5936;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;828;-7184,-5936;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;829;-7344,-5936;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;830;-7024,-6368;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;831;-6768,-6368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;832;-6528,-6368;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;833;-7824,-6368;Float;False;Property;_BaseCellOffset;Base Cell Offset;37;0;Create;True;0;0;0;False;0;False;0;-0.151;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;834;-7552,-6368;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.4;False;4;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;835;-7376,-6368;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;837;-6336,-6240;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;838;-5872,-6144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;843;-6800,-5808;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;844;-6048,-6240;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;846;-6208,-6240;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;848;-7488,-5936;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;850;-7664,-6048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-7616,-5728;Inherit;False;Property;_ShadingContrast;Shading Contrast;42;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;857;-9200,-5232;Float;True;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;859;-8864,-5104;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;860;-8624,-5232;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;861;-8400,-5232;Float;True;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;862;-9680,-5104;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;863;-9424,-5232;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;839;-5888,-6320;Inherit;False;515;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;841;-5712,-6144;Inherit;False;Property;_ShadeColorToggle;ShadeColorToggle;46;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;849;-7856,-6192;Inherit;False;857;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;864;-9680,-5344;Inherit;True;876;FlakesNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;858;-8864,-5344;Inherit;True;876;FlakesNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;516;-3632,-4624;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;515;-3632,-4704;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;514;-3632,-4784;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;527;-9968,-3584;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;524;-9968,-3360;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;529;-10016,-3152;Inherit;False;Property;_ColFresnelBias;ColFresnelBias;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;530;-10016,-3072;Inherit;False;Property;_ColFresnelScale;ColFresnelScale;10;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;531;-10016,-2992;Inherit;False;Property;_ColFresnelPower;ColFresnelPower;11;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;525;-9728,-3360;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;526;-8976,-3296;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;535;-8400,-3360;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;534;-8624,-3232;Inherit;False;Property;_ColorFresnelSwitch;Color Fresnel Switch;3;0;Create;True;0;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;536;-8240,-3360;Inherit;False;ColFresnelResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;537;-8240,-3232;Inherit;False;ColFresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.SaturateNode;533;-8560,-3360;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;532;-8800,-3360;Inherit;False;Property;_ColorFresnelInvert;Color Fresnel Invert;7;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1015;-9424,-3280;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;771;-9424,-3392;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;561;-10032,-2720;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;565;-9840,-2720;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;1018;-9568,-2736;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;559;-9136,-2704;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;575;-8912,-2640;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;576;-8752,-2704;Inherit;False;Property;_GradYInvert;GradYInvert;16;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;552;-8720,-2464;Inherit;False;Property;_GradOffset;GradOffset;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-8688,-2544;Inherit;False;Property;_GradScale;GradScale;12;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;550;-8528,-2704;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;560;-8320,-2704;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;-8160,-2704;Inherit;False;ColorGradYResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;764;-8528,-2016;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;766;-8368,-2016;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;INT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;768;-8208,-1904;Inherit;False;RefFresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.StaticSwitch;1020;-9344,-2704;Inherit;False;Property;_GradType;GradType;80;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1019;-9568,-2592;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;757;-8944,-1936;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;769;-9424,-2048;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1022;-9424,-1936;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1017;-9200,-3360;Inherit;False;Property;_FresnelType;FresnelType;79;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;574;-4704,-5952;Inherit;False;Property;_PaintMethod;PaintMethod;14;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Fresnel;GradientY;GradientYFresnel;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;698;-3856,-5312;Inherit;True;Specular2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;979;-6000,-5104;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;588;-5456,-4560;Inherit;False;Constant;_FlakesArea;Flakes Area;50;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;589;-5552,-4480;Inherit;False;Property;_FlakesSaturation;Flakes Saturation;36;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;591;-5200,-4592;Inherit;False;Property;_FlakesColor;Flakes Color;49;1;[HDR];Create;True;0;0;0;True;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightColorNode;592;-5184,-4416;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ScaleAndOffsetNode;939;-4704,-4672;Inherit;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;4;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-4912,-4672;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;593;-4976,-4432;Inherit;False;Property;_FlakesIntensity;Flakes Intensity;47;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;599;-4448,-4672;Inherit;False;Property;_FlakesSwitch;Flakes Switch;51;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;595;-4224,-4672;Inherit;True;Flakes Result;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;587;-5280,-4768;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;590;-5088,-4768;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.347,0.347,0.347,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;586;-5520,-4768;Inherit;True;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.56;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;933;-5728,-4784;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;763;-8752,-2016;Inherit;False;Property;_RefFresnelInvert;Ref Fresnel Invert;29;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;767;-8208,-2016;Inherit;False;RefFresnelResult;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;733;-6576,-3520;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;765;-8560,-1904;Inherit;False;Property;_RefFresnelSwitch;RefFresnelSwitch;26;0;Create;True;0;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.GammaToLinearNode;1075;-6768,-5456;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;980;-6768,-5344;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SqrtOpNode;1062;-6304,-5456;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;701;-6176,-5456;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1072;-6016,-5456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;977;-5776,-5456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;982;-5600,-5456;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;694;-6288,-5360;Inherit;False;Property;_Glossy;Glossy;22;0;Create;True;0;0;0;True;0;False;1;25;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;695;-6288,-5280;Inherit;False;Property;_SpecularIn;Specular In;27;0;Create;True;0;0;0;True;0;False;0;2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;978;-6000,-5280;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;705;-6288,-5104;Inherit;False;Property;_SpecularOut;Specular Out;21;0;Create;True;0;0;0;True;0;False;1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;718;-5440,-5456;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;60;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;699;-5200,-5456;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.56;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;680;-5040,-5456;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;681;-4880,-5456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.347,0.347,0.347;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;690;-5104,-5344;Inherit;False;Constant;_SpecularAmbient;Specular Ambient;50;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-5168,-5264;Inherit;False;Property;_SpecularSaturation;Specular Saturation;43;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;689;-4944,-5184;Inherit;False;Property;_SpecColor;Spec Color;50;1;[HDR];Create;True;0;0;0;True;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightColorNode;682;-4912,-5008;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;683;-4688,-5344;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;700;-4688,-5200;Inherit;False;Property;_SpecularIntensity;Specular Intensity;48;0;Create;True;0;0;0;True;0;False;2.050727;0.4472353;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;988;-4400,-5344;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;688;-4368,-5424;Inherit;False;515;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;684;-4160,-5344;Inherit;False;Property;_SpecularSwitch;Specular Switch;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;916;-7376,-5328;Inherit;True;BlinnPhongLightWrap;-1;;152;139fed909c1bc1a42a96c42d8cf09006;0;5;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;44;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-7856,-5168;Inherit;False;Property;_BSpecular;BSpecular;84;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1053;-7856,-5072;Inherit;False;Property;_BGloss;BGloss;83;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;709;-7568,-5392;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;1056;-7568,-5232;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;702;-7072,-5424;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;713;-7328,-5440;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SaturateNode;1080;-6960,-5408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1054;-7856,-4976;Inherit;False;Property;_BWrapping;BWrapping;85;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1079;-6528,-5456;Inherit;False;Property;_SpecType;SpecType;86;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;696;-5728,-5216;Inherit;False;Property;_Softness;Softness;53;1;[HDR];Create;True;0;0;0;True;0;False;0.001;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;697;-5440,-5216;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;600;-5952,-4784;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;2.86;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;598;-6112,-4784;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1081;-6560,-4800;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1082;-6560,-4704;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;606;-6464,-4432;Inherit;False;Property;_FlakesOut;Flakes Out;19;0;Create;True;0;0;0;True;0;False;1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-6464,-4624;Inherit;False;Property;_FlakesGlossy;Flakes Glossy;24;0;Create;True;0;0;0;True;0;False;1;25;1;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;583;-6464,-4528;Inherit;False;Property;_FlakesIn;Flakes In;31;0;Create;True;0;0;0;True;0;False;0;2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;936;-6176,-4624;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;714;-7104,-4768;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.WorldNormalVector;610;-7584,-4656;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;917;-7152,-4656;Inherit;True;BlinnPhongLightWrap;-1;;153;139fed909c1bc1a42a96c42d8cf09006;0;5;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;44;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;891;-7632,-4432;Inherit;False;Property;_FlakesSpecular;FlakesSpecular;73;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-7632,-4272;Inherit;False;Property;_FlakesWrapping;Flakes Wrapping;74;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-7632,-4352;Inherit;False;Property;_FlakesGloss;Flakes Gloss;72;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;815;-7856,-4656;Inherit;False;776;FlakesObjectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;932;-7344,-4592;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1085;-6336,-4784;Inherit;False;Property;_FlakesType;FlakesType;87;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1083;-6720,-4768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;596;-6848,-4768;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-6000,-4608;Inherit;False;Property;_FlakesSoftness;Flakes Softness;54;1;[HDR];Create;True;0;0;0;True;0;False;1;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;584;-5728,-4608;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0.01;False;4;FLOAT;0.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;937;-6176,-4432;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1007;-6416,-4272;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1009;-6608,-4240;Inherit;False;Property;_FlakesTileY;FlakesTile Y;75;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1008;-6608,-4336;Inherit;False;Property;_FlakesTileX;FlakesTile X;76;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1005;-6224,-4240;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1,1;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;1014;-6320,-4112;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1006;-6496,-4112;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;-6784,-4112;Inherit;False;Property;_FlakesRotSpeed;Flakes Rot Speed;77;0;Create;True;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1004;-6016,-4240;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;-1,-1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1038;-6160,-4080;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1036;-6016,-4000;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;-1,-1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1041;-5840,-4240;Inherit;True;Property;_TextureSample0;Texture Sample 0;81;0;Create;True;0;0;0;False;0;False;-1;f674691e242745248a6214d6d2a7d336;f674691e242745248a6214d6d2a7d336;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1042;-5840,-4032;Inherit;True;Property;_TextureSample1;Texture Sample 0;81;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1086;-5824,-3824;Inherit;False;Property;_FlakesTextureIntensity;FlakesTextureIntensity;88;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1011;-5200,-4288;Inherit;False;Property;_TexturedFlakes;TexturedFlakes;78;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1044;-5360,-4224;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;-5392,-4304;Inherit;False;514;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1045;-5520,-4224;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;1039;-6384,-4032;Inherit;True;Property;_FlakesTexture;Flakes Texture;82;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;f674691e242745248a6214d6d2a7d336;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.StaticSwitch;1021;-9184,-2016;Inherit;False;Property;_RefFrsType;RefFrsType;81;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;748;-6352,-3248;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;673;-9152,-4432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;899;-9328,-4432;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.1;False;4;FLOAT;-0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;804;-9152,-4256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;808;-9152,-4144;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1078;-9328,-4112;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-0.1;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;671;-9632,-4368;Float;False;Property;_FNormalScale;FNormal Scale;8;0;Create;True;0;0;0;False;0;False;0.1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;661;-9504,-4704;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;662;-9504,-4512;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;664;-9664,-4720;Inherit;False;Property;_FNTileX;FNTileX;63;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;665;-9664,-4640;Inherit;False;Property;_FNTileY;FNTileY;66;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;666;-9664,-4544;Inherit;False;Property;_FNOffsetX;FNOffsetX;64;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;667;-9664,-4464;Inherit;False;Property;_FNOffsetY;FNOffsetY;65;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;670;-9232,-3936;Inherit;True;Property;_FlakesNormalMap;FlakesNormalMap;62;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;807;-8944,-4064;Inherit;True;Property;_BaseMapOld3;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;803;-8944,-4272;Inherit;True;Property;_BaseMapOld2;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;669;-8944,-4480;Inherit;True;Property;_BaseMapOld1;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;976;-8912,-4560;Inherit;False;Normal Reconstruct Z;-1;;154;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;879;-8352,-4560;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;816;-8592,-4288;Inherit;False;Property;_AffectBodyFlakes;Affect Body Flakes;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;677;-8592,-4400;Inherit;False;Property;_FlakesNormal;FlakesNormal;5;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;817;-8592,-4176;Inherit;False;Property;_AffectReflectionFlakes;Affect Reflection Flakes;4;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;876;-8160,-4560;Float;False;FlakesNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;668;-9280,-4656;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;806;-8192,-4288;Inherit;False;FlakesBodyNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;810;-8192,-4176;Inherit;False;FlakesReflectNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;776;-8192,-4400;Inherit;False;FlakesObjectNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;811;-7856,-3568;Inherit;True;810;FlakesReflectNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;743;-6176,-3520;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;744;-6208,-3600;Inherit;False;515;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;747;-6320,-3152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;739;-6512,-3152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;749;-6528,-3040;Inherit;False;514;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;741;-6816,-3152;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;18;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;742;-6720,-3072;Inherit;False;514;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-3856,-4704;Inherit;False;Constant;_Zero;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;519;-3856,-4784;Inherit;False;Constant;_One;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;517;-3856,-4624;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;611;-3872,-4544;Inherit;False;Property;_SpecularExtras;SpecularExtras;57;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;897;-3872,-4384;Inherit;False;Property;_FlakesNormalExtras;FlakesNormalExtras;61;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1013;-3648,-4544;Inherit;False;Property;_TexturedFlakesToggle;TexturedFlakesToggle;58;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;738;-6576,-3248;Inherit;False;767;RefFresnelResult;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1092;-3616,-4464;Inherit;False;Property;_FresnelFold;FresnelFold;56;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1093;-3616,-4384;Inherit;False;Property;_CubeMapExtras;CubeMapExtras;55;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;840;-5472,-6144;Float;False;ShadeColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;888;-3872,-4464;Inherit;False;Property;_FlakesExtras;FlakesExtras;60;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1094;-3872,-4304;Inherit;False;Property;_ShadeExtras;ShadeExtras;59;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;823;-6800,-6272;Inherit;False;540;BaseDiffuseResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;852;-7120,-5824;Inherit;False;Property;_ShadingContribution;Shading Contribution;38;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;836;-7120,-5744;Inherit;False;Property;_ShadingOffset;Shading Offset;40;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-7120,-5664;Inherit;False;Property;_ShadingIntensity;Shading Intensity;45;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;820;-7200,-6288;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-7488,-6192;Float;False;Property;_BaseCellSharpness;Base Cell Sharpness;34;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;851;-7760,-5872;Inherit;False;540;BaseDiffuseResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;827;-6864,-6112;Inherit;False;Property;_ShadeColor;Shade Color;30;1;[Header];Create;True;1;Shade Settings;0;0;False;0;False;0.35,0.35,0.35,1;0.6313726,0.227451,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;805;-9632,-4192;Inherit;False;Property;_BodyFNormalMulti;BodyFNormalMulti;68;0;Create;True;0;0;0;True;0;False;0.1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;734;-6752,-3600;Inherit;False;Property;_ReflectionStrength;Reflection Strength;17;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;1095;-6464,-3600;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;853;-6080,-6048;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCRemapNode;845;-6256,-6112;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;4;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;821;-6528,-6208;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;847;-6544,-6048;Inherit;False;Property;_ShadeContrast;Shade Contrast;33;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;707;-2848,-5216;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;-2768,-5312;Inherit;False;698;Specular2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;708;-2736,-5216;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;612;-3056,-5296;Inherit;False;595;Flakes Result;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;866;-3056,-5104;Inherit;False;840;ShadeColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;753;-3056,-5200;Inherit;False;745;Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;883;-2560,-5280;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;812;-2272,-5152;Inherit;False;Property;_Specular;Specular;70;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;813;-2272,-5072;Inherit;False;Property;_Smoothness;Smoothness;71;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;541;-2256,-5344;Inherit;False;540;BaseDiffuseResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;777;-2256,-5264;Inherit;False;806;FlakesBodyNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StickyNoteNode;1098;-2308.397,-4872.516;Inherit;False;428.6665;338;Yapilacaklar;;1,0,0,1;Sticker koymak gerekiyor$Occlusion Vermek güzel olur$$;0;0
Node;AmplifyShaderEditor.RangedFloatNode;760;-10032,-1776;Inherit;False;Property;_RefFresnelBias;RefFresnelBias;35;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;761;-10032,-1696;Inherit;False;Property;_RefFresnelScale;RefFresnelScale;39;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1117;-2592,-5680;Inherit;False;1128;stickerMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;756;-9728,-2016;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1151;-7152,-9952;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1166;-6960,-9952;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1128;-3904,-9760;Inherit;False;stickerMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1215;-4832,-9440;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1171;-4832,-9744;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;1159;-6704,-9856;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1158;-6464,-9856;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RadiansOpNode;1190;-6512,-9216;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1189;-6672,-9216;Inherit;False;Property;_Rot;Rot;95;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1187;-6336,-9344;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;1179;-6240,-9216;Inherit;False;Property;_Offset;Offset;91;0;Create;True;0;0;0;False;0;False;2.13,0.56;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;1185;-6240,-9088;Inherit;False;Property;_Size;Size;94;0;Create;True;0;0;0;False;0;False;0.23,1.38;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1186;-5872,-9344;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1130;-5712,-9344;Inherit;True;Property;_LeftSideSticker;LeftSideSticker;89;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1234;-5712,-8752;Inherit;True;Property;_LeftSideSticker1;LeftSideSticker;90;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1209;-7472,-9344;Inherit;False;Property;_Carpma;Carpma;97;0;Create;True;0;0;0;False;0;False;100;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1208;-7296,-9440;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1210;-7872,-9552;Inherit;True;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;1178;-7088,-9440;Inherit;True;False;True;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1225;-6592,-8800;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1223;-6816,-8576;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1232;-6272,-8800;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1233;-5936,-8784;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;1230;-6496,-8656;Inherit;False;Property;_OffsetB;OffsetB;92;0;Create;True;0;0;0;False;0;False;2.13,0.56;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;1231;-6256,-8544;Inherit;False;Property;_SizeB;SizeB;93;0;Create;True;0;0;0;False;0;False;0.23,1.38;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;1224;-6976,-8576;Inherit;False;Property;_RotB;RotB;96;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1227;-7648,-8720;Inherit;False;Property;_CarpmaB;CarpmaB;98;0;Create;True;0;0;0;False;0;False;200;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1244;-5056,-10048;Inherit;False;Constant;_Color0;Color 0;99;0;Create;True;0;0;0;False;0;False;1,0.9987117,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1245;-5184,-9408;Inherit;False;Constant;_Color1;Color 1;99;0;Create;True;0;0;0;False;0;False;0,0.7337623,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;1228;-7824,-8912;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1229;-7424,-8832;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1222;-4592,-9584;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;1226;-6944,-8816;Inherit;True;False;True;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1243;-7120,-9072;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1184;-6016,-9344;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1247;-5920,-9808;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1155;-6464,-10176;Inherit;False;Constant;_Float0;Float 0;93;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1156;-6336,-9728;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1246;-6128,-9808;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1154;-6144,-10064;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1147;-5936,-10064;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;50;False;2;FLOAT;25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1116;-2384,-5632;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;809;-9632,-4112;Inherit;False;Property;_RefFNormalMulti;RefFNormalMulti;69;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;672;-9632,-4272;Inherit;False;Property;_FNormalMultiplier;FNormalMultiplier;67;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;-2992,-5024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;-1872,-5248;Float;False;True;-1;2;BCarPaintEditor;0;19;BUDU Shaders/BCarPaint;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;0;False;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638531041358912987;Workflow;0;638530503819159440;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
WireConnection;578;0;539;0
WireConnection;578;1;564;0
WireConnection;579;0;578;0
WireConnection;538;0;520;0
WireConnection;538;1;522;0
WireConnection;538;2;574;0
WireConnection;521;0;520;0
WireConnection;521;1;538;0
WireConnection;540;0;521;0
WireConnection;724;0;728;0
WireConnection;726;0;730;0
WireConnection;727;0;729;0
WireConnection;727;1;726;0
WireConnection;727;2;731;0
WireConnection;735;1;736;0
WireConnection;736;0;737;0
WireConnection;736;1;727;0
WireConnection;737;4;725;0
WireConnection;737;2;724;0
WireConnection;745;0;746;0
WireConnection;746;0;744;0
WireConnection;746;1;743;0
WireConnection;725;0;811;0
WireConnection;822;0;854;0
WireConnection;824;0;830;0
WireConnection;825;0;824;0
WireConnection;826;0;828;0
WireConnection;826;1;852;0
WireConnection;826;2;836;0
WireConnection;828;0;829;0
WireConnection;828;1;822;0
WireConnection;829;0;848;0
WireConnection;830;0;835;0
WireConnection;830;1;820;0
WireConnection;831;0;830;0
WireConnection;832;0;831;0
WireConnection;832;1;823;0
WireConnection;834;0;833;0
WireConnection;835;0;834;0
WireConnection;835;1;849;0
WireConnection;837;0;832;0
WireConnection;837;1;821;0
WireConnection;838;0;844;0
WireConnection;838;1;853;0
WireConnection;843;0;842;0
WireConnection;844;0;846;0
WireConnection;844;1;845;0
WireConnection;846;0;837;0
WireConnection;848;0;850;0
WireConnection;848;1;851;0
WireConnection;850;0;849;0
WireConnection;857;0;863;0
WireConnection;860;0;858;0
WireConnection;860;1;859;0
WireConnection;861;0;860;0
WireConnection;863;0;864;0
WireConnection;863;1;862;0
WireConnection;841;0;839;0
WireConnection;841;1;838;0
WireConnection;516;0;517;0
WireConnection;515;0;518;0
WireConnection;514;0;519;0
WireConnection;525;0;527;0
WireConnection;525;4;524;0
WireConnection;525;1;529;0
WireConnection;525;2;530;0
WireConnection;525;3;531;0
WireConnection;526;0;1017;0
WireConnection;535;0;533;0
WireConnection;535;1;534;0
WireConnection;536;0;535;0
WireConnection;537;0;534;0
WireConnection;533;0;532;0
WireConnection;532;0;1017;0
WireConnection;532;1;526;0
WireConnection;1015;0;525;0
WireConnection;771;0;525;0
WireConnection;565;0;561;2
WireConnection;1018;0;565;0
WireConnection;559;0;1020;0
WireConnection;575;0;559;0
WireConnection;576;0;575;0
WireConnection;576;1;559;0
WireConnection;550;0;576;0
WireConnection;550;1;551;0
WireConnection;550;2;552;0
WireConnection;560;0;550;0
WireConnection;563;0;560;0
WireConnection;764;0;763;0
WireConnection;766;0;764;0
WireConnection;766;1;765;0
WireConnection;768;0;765;0
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
WireConnection;574;1;539;0
WireConnection;574;0;564;0
WireConnection;574;2;579;0
WireConnection;698;0;684;0
WireConnection;979;0;705;0
WireConnection;939;0;594;0
WireConnection;939;1;593;0
WireConnection;594;0;590;0
WireConnection;594;1;591;0
WireConnection;594;2;592;0
WireConnection;594;3;1011;0
WireConnection;599;1;939;0
WireConnection;595;0;599;0
WireConnection;587;0;586;0
WireConnection;590;0;587;0
WireConnection;590;1;588;0
WireConnection;590;2;589;0
WireConnection;586;0;933;0
WireConnection;586;1;584;0
WireConnection;933;0;600;0
WireConnection;933;1;936;0
WireConnection;933;2;937;0
WireConnection;763;0;757;0
WireConnection;763;1;1021;0
WireConnection;767;0;766;0
WireConnection;733;0;735;0
WireConnection;733;1;740;0
WireConnection;1075;0;1080;0
WireConnection;980;0;1080;0
WireConnection;1062;0;1079;0
WireConnection;701;0;1062;0
WireConnection;1072;0;701;0
WireConnection;1072;1;694;0
WireConnection;977;0;1072;0
WireConnection;977;1;978;0
WireConnection;977;2;979;0
WireConnection;982;0;977;0
WireConnection;978;0;695;0
WireConnection;718;1;982;0
WireConnection;699;0;982;0
WireConnection;699;1;697;0
WireConnection;680;0;699;0
WireConnection;681;0;680;0
WireConnection;681;1;690;0
WireConnection;681;2;691;0
WireConnection;683;0;681;0
WireConnection;683;1;689;0
WireConnection;683;2;682;0
WireConnection;988;0;683;0
WireConnection;988;1;700;0
WireConnection;684;0;688;0
WireConnection;684;1;988;0
WireConnection;916;1;709;0
WireConnection;916;2;1056;0
WireConnection;916;3;1053;0
WireConnection;916;44;1054;0
WireConnection;1056;0;1050;0
WireConnection;702;0;713;1
WireConnection;702;1;916;0
WireConnection;1080;0;702;0
WireConnection;1079;1;1075;0
WireConnection;1079;0;1080;0
WireConnection;1079;2;980;0
WireConnection;697;0;696;0
WireConnection;600;1;598;0
WireConnection;600;0;582;0
WireConnection;598;0;1085;0
WireConnection;1081;0;1083;0
WireConnection;1082;0;1083;0
WireConnection;936;0;583;0
WireConnection;610;0;815;0
WireConnection;917;1;610;0
WireConnection;917;2;932;0
WireConnection;917;3;892;0
WireConnection;917;44;893;0
WireConnection;932;0;891;0
WireConnection;1085;1;1081;0
WireConnection;1085;0;1083;0
WireConnection;1085;2;1082;0
WireConnection;1083;0;596;0
WireConnection;596;0;714;1
WireConnection;596;1;917;0
WireConnection;584;0;585;0
WireConnection;937;0;606;0
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
WireConnection;1011;0;1012;0
WireConnection;1011;1;1044;0
WireConnection;1044;0;1045;0
WireConnection;1045;0;1041;0
WireConnection;1045;1;1042;0
WireConnection;1045;2;1086;0
WireConnection;1021;1;769;0
WireConnection;1021;0;756;0
WireConnection;1021;2;1022;0
WireConnection;748;0;738;0
WireConnection;673;0;899;0
WireConnection;673;1;672;0
WireConnection;899;0;671;0
WireConnection;804;0;671;0
WireConnection;804;1;805;0
WireConnection;808;0;671;0
WireConnection;808;1;1078;0
WireConnection;1078;0;809;0
WireConnection;661;0;664;0
WireConnection;661;1;665;0
WireConnection;662;0;666;0
WireConnection;662;1;667;0
WireConnection;807;0;670;0
WireConnection;807;1;668;0
WireConnection;807;5;808;0
WireConnection;803;0;670;0
WireConnection;803;1;668;0
WireConnection;803;5;804;0
WireConnection;669;0;670;0
WireConnection;669;1;668;0
WireConnection;669;5;673;0
WireConnection;879;0;677;0
WireConnection;816;0;976;0
WireConnection;816;1;803;0
WireConnection;677;0;976;0
WireConnection;677;1;669;0
WireConnection;817;0;976;0
WireConnection;817;1;807;0
WireConnection;876;0;879;0
WireConnection;668;0;661;0
WireConnection;668;1;662;0
WireConnection;806;0;816;0
WireConnection;810;0;817;0
WireConnection;776;0;677;0
WireConnection;743;0;1095;0
WireConnection;743;1;733;0
WireConnection;743;2;748;0
WireConnection;743;3;747;0
WireConnection;747;0;739;0
WireConnection;747;1;749;0
WireConnection;739;0;741;0
WireConnection;739;1;742;0
WireConnection;840;0;841;0
WireConnection;820;0;819;0
WireConnection;1095;0;734;0
WireConnection;845;0;847;0
WireConnection;821;0;825;0
WireConnection;821;1;827;0
WireConnection;821;2;826;0
WireConnection;821;3;843;0
WireConnection;707;0;612;0
WireConnection;707;1;753;0
WireConnection;707;2;866;0
WireConnection;708;0;707;0
WireConnection;883;0;706;0
WireConnection;883;1;708;0
WireConnection;756;0;758;0
WireConnection;756;4;755;0
WireConnection;756;1;760;0
WireConnection;756;2;761;0
WireConnection;756;3;762;0
WireConnection;1166;0;1151;0
WireConnection;1128;0;1222;0
WireConnection;1215;0;1156;0
WireConnection;1215;1;1234;0
WireConnection;1215;2;1245;0
WireConnection;1171;0;1147;0
WireConnection;1171;1;1130;0
WireConnection;1171;2;1244;0
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
WireConnection;1232;0;1225;0
WireConnection;1232;1;1230;0
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
WireConnection;1116;0;1117;0
WireConnection;2;0;541;0
WireConnection;2;1;777;0
WireConnection;2;2;883;0
WireConnection;2;9;812;0
WireConnection;2;4;813;0
ASEEND*/
//CHKSM=C702FCFDD807FFEC6B43AF837237846A0573B4F0
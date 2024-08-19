// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BTransparent"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		[Toggle]_Normal("Normal", Float) = 0
		_BaseColor("Base Color", Color) = (0,0,0,1)
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_BaseMap("Base Map", 2D) = "white" {}
		_RefFresnelBias("Ref Fresnel Bias", Range( 0 , 1)) = 0
		_RefFresnelScale("Ref Fresnel Scale", Range( 0 , 5)) = 1
		_RefFresnelPower("Ref Fresnel Power", Range( 0 , 5)) = 3
		[Enum(Rim On,1,Rim Off,0)]_RefFresnelSwitch("Ref Fresnel Switch", Int) = 0
		[Toggle]_RefFresnelInvert("Ref Fresnel Invert", Float) = 0
		_TransparentIntensity("Transparent Intensity", Range( 0 , 1)) = 1
		_CMYPos("CM Y Pos", Range( -5 , 5)) = 0
		_CMXPos("CM X Pos", Range( -2 , 2)) = 0
		_OldMin("Old Min", Float) = 0
		_CMZPos("CM Z Pos", Range( -2 , 2)) = 0
		_OldMax("Old Max", Float) = 1
		_CubeMapRotate("Cube Map Rotate", Range( 0 , 360)) = 0
		_NewMin("New Min", Float) = 0.95
		[SingleLineTexture]_ReflectMap("Reflect Map", CUBE) = "white" {}
		_NewMax("New Max", Float) = 1.2
		[HDR]_ReflectColor("Reflect Color", Color) = (1,1,1,1)
		[HDR]_DepthColor("Depth Color", Color) = (1,1,1,0)
		[Toggle]_Depth("Depth", Float) = 0
		_ReflectionStrength("Reflection Strength", Range( 0 , 1)) = 1
		[Toggle]_Reflect("Reflect", Float) = 0
		_TransScale("TransScale", Float) = 1
		_TransOffset("TransOffset", Float) = 0
		_ScreenContrast("ScreenContrast", Range( -1 , 1)) = 0
		_DepthScale("Depth Scale", Float) = 1
		_SpecularOut("Specular Out", Range( 0.1 , 2)) = 0.2
		_DepthOffset("Depth Offset", Float) = 0
		_Glossy("Glossy", Range( 0 , 100)) = 1
		_SpecularIn("Specular In", Range( 0 , 2)) = 1
		_DepthContrast("Depth Contrast", Float) = 1
		_TRScale("TRScale", Float) = 1
		_SpecularSaturation("Specular Saturation", Range( 0 , 1)) = 1
		_TROffset("TROffset", Float) = 0
		_SpecularIntensity("Specular Intensity", Range( 0 , 1)) = 1
		_SpecularAmbient("Specular Ambient", Range( 0 , 1)) = 0
		_RimContourOffset("Rim Contour Offset", Range( 0 , 1)) = 1
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1,1)
		_RimContourScale(" Rim Contour Scale", Range( 0 , 1)) = 1
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		[Gamma]_RimContourColor("Rim Contour Color", Color) = (1,1,1,0)
		_Softness("Softness", Range( 0 , 1)) = 0.01
		[Toggle]_RimCAtt("RimCAtt", Float) = 0
		[HDR]_TransparencyColor("Transparency Color", Color) = (1,1,1,1)
		_TransparentFresnelBias("Transparent Fresnel Bias", Range( 0 , 1)) = 0
		_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 0
		[NoScaleOffset]_BluricRefractionPattern("Bluric Refraction Pattern", 2D) = "bump" {}
		_TransparentFresnelScale("Transparent Fresnel Scale", Range( 0 , 10)) = 1
		_FresnelScale("Fresnel Scale", Range( 0 , 10)) = 1
		_SSSize("SSSize", Float) = 10
		_PatternHeight("PatternHeight", Range( -10 , 10)) = 0.1
		_FresnelPower("Fresnel Power", Range( 0 , 10)) = 1
		_TransparentFresnelPower("Transparent Fresnel Power", Range( 0 , 10)) = 1
		_SSOffX("SSOffX", Float) = 0
		_SSAnchorX("SSAnchorX", Float) = 0
		_RefractColor("Refract Color", Color) = (0,0,0,0)
		_SSTileX("SSTileX", Float) = 1
		[Toggle]_RefractionInvert("RefractionInvert", Float) = 0
		[Toggle]_TransparentFresnelInvert("TransparentFresnelInvert", Float) = 0
		_SSTileY("SSTileY", Float) = 1
		_SSOffY("SSOffY", Float) = 0
		[Toggle]_Refraction("Refraction", Float) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.3
		_SSAnchorY("SSAnchorY", Float) = 0
		_ReflectionMultiplier("Reflection Multiplier", Range( 1 , 10)) = 1
		_ThicknessMap("Thickness Map", 2D) = "white" {}
		[HDR]_ThicknessColor("Thickness Color", Color) = (0,0,0)
		_ThicknessIntensity("Thickness Intensity", Range( 0 , 1)) = 1
		_CurvatureScale("Curvature Scale", Range( 0 , 1)) = 1
		_CurvatureTexture("Curvature Texture", 2D) = "white" {}
		[Toggle]_TransparentFresnel("TransparentFresnel", Float) = 0
		[Toggle]_ReflectionCurvature("Reflection Curvature", Float) = 0
		_ThickScale("ThickScale", Float) = 0
		_ThickOffset("ThickOffset", Float) = 1
		[Toggle]_ThichnessInvert("Thichness Invert", Float) = 0
		[Toggle]_Thickness("Thickness", Float) = 0
		[Toggle]_SurfaceSettings("SurfaceSettings", Float) = 0
		[HideInInspector][Gamma]_TransparentToggle("TransparentToggle", Int) = 1
		_DepthToggle("DepthToggle", Int) = 0
		_TRFRFold("TRFRFold", Int) = 0
		[Toggle]_ScreenSpace("ScreenSpace", Float) = 0
		_CurvFold("CurvFold", Int) = 0
		_PatternRotator("PatternRotator", Range( -360 , 360)) = 0
		_DPFold("DPFold", Int) = 0
		_ThickFold("ThickFold", Int) = 0
		_RIFold("RIFold", Int) = 0
		_RIFineTune("RIFineTune", Int) = 0
		_checkDef("checkDef", Int) = 0
		_TRFineTune("TRFineTune", Int) = 0
		[Toggle]_RefrControl("RefrControl", Float) = 0
		[Toggle]_SSBluricTransparent("SS Bluric Transparent", Float) = 0
		[Toggle]_RimContour("Rim Contour", Float) = 0
		_RimContourIntensity("Rim Contour Intensity", Range( 0 , 1)) = 1
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
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="SimpleLit" }

		Cull Back
		ZWrite Off
		ZTest LEqual
		Offset 0,0
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _ASE_LIGHTING_SIMPLE
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#define _SURFACE_TYPE_TRANSPARENT 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_OPAQUE_TEXTURE 1


			

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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _ThicknessMap;
			samplerCUBE _ReflectMap;
			sampler2D _CurvatureTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
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

				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.positionOS;
				
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

				float Zero116 = 0.0;
				float4 temp_cast_0 = (Zero116).xxxx;
				float2 uv_BaseMap = IN.ase_texcoord8.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 MainDiffuse561 = (( _SurfaceSettings )?( ( _BaseColor * tex2D( _BaseMap, uv_BaseMap ) ) ):( temp_cast_0 ));
				
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = normalize( appendResult10_g154 );
				float2 uv_NormalMap = IN.ase_texcoord8.xyz.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack25 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack25.z = lerp( 1, unpack25.z, saturate(_NormalScale) );
				float2 appendResult703 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos705 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos706 = ComputeScreenPos( unityObjectToClipPos705 );
				float2 break699 = ( appendResult703 * (computeScreenPos706).xy );
				float temp_output_707_0 = (computeScreenPos706).w;
				float4 appendResult721 = (float4(break699.x , break699.y , (computeScreenPos706).z , temp_output_707_0));
				float2 appendResult702 = (float2(_SSOffX , _SSOffY));
				float2 texCoord701 = IN.ase_texcoord8.xyz.xy * appendResult703 + appendResult702;
				float2 appendResult700 = (float2(_SSAnchorX , _SSAnchorY));
				float cos719 = cos( radians( _PatternRotator ) );
				float sin719 = sin( radians( _PatternRotator ) );
				float2 rotator719 = mul( ( computeScreenPos706 * _SSSize * float4( texCoord701, 0.0 , 0.0 ) ).xy - appendResult700 , float2x2( cos719 , -sin719 , sin719 , cos719 )) + appendResult700;
				float3 unpack725 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator719, 0.0 , 0.0 ) ):( ( ( appendResult721 / temp_output_707_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack725.z = lerp( 1, unpack725.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth727 = unpack725;
				float3 NewObjectNormal24 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				
				float One115 = 1.0;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				float3 worldNormal29 = normalize( float3(dot(tanToWorld0,tanNormal29), dot(tanToWorld1,tanNormal29), dot(tanToWorld2,tanNormal29)) );
				float3 NewNormals23 = worldNormal29;
				float fresnelNdotV415 = dot( NewNormals23, WorldViewDirection );
				float fresnelNode415 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV415, _FresnelPower ) );
				float RefractFresnelResult420 = (( _Refraction )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode415 ) ):( fresnelNode415 )) ):( Zero116 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal223 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult420 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One115 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal24 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_302_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal223);
				float4 RefractionRef584 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult420 ) ) * temp_output_302_0 * _TransparentIntensity ) ):( ( temp_output_302_0 * _TransparentIntensity ) ));
				float4 temp_cast_10 = (Zero116).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xyz.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_569_0 = (tex2D( _ThicknessMap, uv_ThicknessMap )*_ThickScale + _ThickOffset);
				float4 ThicknessRef533 = (( _Thickness )?( (( _ThichnessInvert )?( ( 1.0 - temp_output_569_0 ) ):( temp_output_569_0 )) ):( temp_cast_10 ));
				float4 lerpResult3_g153 = lerp( RefractionRef584 , float4( _ThicknessColor , 0.0 ) , saturate( ( 1.0 - ( ( 1.0 - ThicknessRef533 ) + ( 1.0 - _ThicknessIntensity ) ) ) ));
				float4 temp_cast_12 = (One115).xxxx;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float4 temp_cast_14 = (-WorldPosition.z).xxxx;
				float4 DepthOut271 = (saturate( CalculateContrast(( ase_parentObjectScale * _DepthContrast ).x,temp_cast_14) )*_DepthScale + _DepthOffset);
				float4 TransColorRef683 = _TransparencyColor;
				int DepthTogRef681 = _DepthToggle;
				float fresnelNdotV619 = dot( NewNormals23, WorldViewDirection );
				float fresnelNode619 = ( _TransparentFresnelBias + _TransparentFresnelScale * pow( 1.0 - fresnelNdotV619, _TransparentFresnelPower ) );
				float4 temp_cast_15 = ((( _TransparentFresnelInvert )?( ( 1.0 - fresnelNode619 ) ):( fresnelNode619 ))).xxxx;
				float4 TransparentFresnelResult624 = (( _TransparentFresnel )?( temp_cast_15 ):( ( 1.0 - ( TransColorRef683 * DepthTogRef681 ) ) ));
				float4 lerpResult395 = lerp( ( _DepthColor + (( _Depth )?( DepthOut271 ):( temp_cast_12 )) ) , _TransparencyColor , saturate( TransparentFresnelResult624 ));
				float4 DepthTransRef626 = (lerpResult395*_TRScale + _TROffset);
				float4 temp_cast_17 = (Zero116).xxxx;
				float dotResult34 = dot( NewNormals23 , WorldViewDirection );
				float NormalViewDirection37 = dotResult34;
				float saferPower362 = abs( ( 1.0 - saturate( ( (0.5 + (_RimContourOffset - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) + NormalViewDirection37 ) ) ) );
				float temp_output_362_0 = pow( saferPower362 , (0.0001 + (_RimContourScale - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0)) );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_370_0 = saturate( (( _RimCAtt )?( ( temp_output_362_0 * ( Zero116 * ase_lightAtten ) ) ):( temp_output_362_0 )) );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 Toon_Rim367 = (( _RimContour )?( ( temp_output_370_0 * ( ase_lightColor * _RimContourColor ) * _RimContourIntensity ) ):( temp_cast_17 ));
				float4 temp_cast_19 = (Zero116).xxxx;
				float3 worldRefl599 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, NewObjectNormal24 ), dot( tanToWorld1, NewObjectNormal24 ), dot( tanToWorld2, NewObjectNormal24 ) ) ) );
				float3 VertexPos5_g152 = worldRefl599;
				float3 appendResult10_g152 = (float3(0.0 , VertexPos5_g152.y , 0.0));
				float3 VertexPosRotationAxis11_g152 = appendResult10_g152;
				float3 break13_g152 = VertexPos5_g152;
				float3 appendResult14_g152 = (float3(break13_g152.x , 0.0 , break13_g152.z));
				float3 VertexPosOtherAxis12_g152 = appendResult14_g152;
				float Angle3_g152 = radians( _CubeMapRotate );
				float3 appendResult590 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal46 = NewObjectNormal24;
				float3 worldNormal46 = normalize( float3(dot(tanToWorld0,tanNormal46), dot(tanToWorld1,tanNormal46), dot(tanToWorld2,tanNormal46)) );
				float fresnelNdotV43 = dot( normalize( worldNormal46 ), WorldViewDirection );
				float fresnelNode43 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV43 , 0.0001 ), _RefFresnelPower ) );
				float temp_output_228_0 = saturate( fresnelNode43 );
				float ReflectFresnelResult50 = ( (( _RefFresnelInvert )?( ( 1.0 - temp_output_228_0 ) ):( temp_output_228_0 )) * _RefFresnelSwitch );
				int ReflectFresnelSwitch51 = _RefFresnelSwitch;
				float4 Reflect602 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g152 + ( VertexPosOtherAxis12_g152 * cos( Angle3_g152 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g152 ) * sin( Angle3_g152 ) ) ) + appendResult590 ) ) * _ReflectColor ) * ( 1.0 - ReflectFresnelResult50 ) * ( ( _ReflectionMultiplier * ReflectFresnelSwitch51 ) + One115 ) ) ):( temp_cast_19 ));
				float4 temp_cast_20 = (One115).xxxx;
				float2 uv_CurvatureTexture = IN.ase_texcoord8.xyz.xy * _CurvatureTexture_ST.xy + _CurvatureTexture_ST.zw;
				float4 RefCurvatureResult630 = saturate( ( Reflect602 * saturate( (( _ReflectionCurvature )?( ( CalculateContrast((1.7 + (_CurvatureScale - 0.0) * (2.5 - 1.7) / (1.0 - 0.0)),tex2D( _CurvatureTexture, uv_CurvatureTexture )) * 15 ) ):( temp_cast_20 )) ) ) );
				float4 FinalEmissionResult563 = saturate( ( (( lerpResult3_g153 * DepthTransRef626 )*_TransScale + _TransOffset) + Toon_Rim367 + RefCurvatureResult630 ) );
				
				float4 temp_cast_23 = (Zero116).xxxx;
				float dotResult449 = dot( NewObjectNormal24 , _MainLightPosition.xyz );
				float4 temp_cast_24 = (( 1.0 - dotResult449 )).xxxx;
				float4 temp_cast_25 = (_SpecularIn).xxxx;
				float4 temp_cast_26 = (_SpecularOut).xxxx;
				float4 saferPower437 = abs( (float4( 0,0,0,0 ) + (CalculateContrast(_Glossy,temp_cast_24) - float4( 0,0,0,0 )) * (temp_cast_26 - float4( 0,0,0,0 )) / (temp_cast_25 - float4( 0,0,0,0 ))) );
				float4 temp_cast_27 = ((0.01 + (_Softness - 0.0) * (1.0 - 0.01) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_28 = (_SpecularAmbient).xxxx;
				float4 temp_cast_29 = (_SpecularSaturation).xxxx;
				float4 clampResult441 = clamp( ( 1.0 - pow( saferPower437 , temp_cast_27 ) ) , temp_cast_28 , temp_cast_29 );
				float4 Specular447 = (( _SpecularSwitch )?( ( clampResult441 * _SpecColor * ase_lightColor * _SpecularIntensity ) ):( temp_cast_23 ));
				

				float3 BaseColor = MainDiffuse561.rgb;
				float3 Normal = NewObjectNormal24;
				float3 Emission = FinalEmissionResult563.xyz;
				float3 Specular = Specular447.rgb;
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

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define _ASE_LIGHTING_SIMPLE
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define _ASE_LIGHTING_SIMPLE
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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
			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_OPAQUE_TEXTURE 1

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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _ThicknessMap;
			samplerCUBE _ReflectMap;
			sampler2D _CurvatureTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
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

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord7.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord9 = screenPos;
				
				o.ase_texcoord4.xyz = v.texcoord0.xyz;
				o.ase_texcoord5 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord6.w = 0;
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

				float Zero116 = 0.0;
				float4 temp_cast_0 = (Zero116).xxxx;
				float2 uv_BaseMap = IN.ase_texcoord4.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 MainDiffuse561 = (( _SurfaceSettings )?( ( _BaseColor * tex2D( _BaseMap, uv_BaseMap ) ) ):( temp_cast_0 ));
				
				float One115 = 1.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = normalize( appendResult10_g154 );
				float2 uv_NormalMap = IN.ase_texcoord4.xyz.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack25 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack25.z = lerp( 1, unpack25.z, saturate(_NormalScale) );
				float2 appendResult703 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos705 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord5.xyz));
				float4 computeScreenPos706 = ComputeScreenPos( unityObjectToClipPos705 );
				float2 break699 = ( appendResult703 * (computeScreenPos706).xy );
				float temp_output_707_0 = (computeScreenPos706).w;
				float4 appendResult721 = (float4(break699.x , break699.y , (computeScreenPos706).z , temp_output_707_0));
				float2 appendResult702 = (float2(_SSOffX , _SSOffY));
				float2 texCoord701 = IN.ase_texcoord4.xyz.xy * appendResult703 + appendResult702;
				float2 appendResult700 = (float2(_SSAnchorX , _SSAnchorY));
				float cos719 = cos( radians( _PatternRotator ) );
				float sin719 = sin( radians( _PatternRotator ) );
				float2 rotator719 = mul( ( computeScreenPos706 * _SSSize * float4( texCoord701, 0.0 , 0.0 ) ).xy - appendResult700 , float2x2( cos719 , -sin719 , sin719 , cos719 )) + appendResult700;
				float3 unpack725 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator719, 0.0 , 0.0 ) ):( ( ( appendResult721 / temp_output_707_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack725.z = lerp( 1, unpack725.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth727 = unpack725;
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				float3 worldNormal29 = normalize( float3(dot(tanToWorld0,tanNormal29), dot(tanToWorld1,tanNormal29), dot(tanToWorld2,tanNormal29)) );
				float3 NewNormals23 = worldNormal29;
				float fresnelNdotV415 = dot( NewNormals23, ase_worldViewDir );
				float fresnelNode415 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV415, _FresnelPower ) );
				float RefractFresnelResult420 = (( _Refraction )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode415 ) ):( fresnelNode415 )) ):( Zero116 ));
				float4 screenPos = IN.ase_texcoord9;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float3 NewObjectNormal24 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				float4 fetchOpaqueVal223 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult420 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One115 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal24 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_302_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal223);
				float4 RefractionRef584 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult420 ) ) * temp_output_302_0 * _TransparentIntensity ) ):( ( temp_output_302_0 * _TransparentIntensity ) ));
				float4 temp_cast_10 = (Zero116).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord4.xyz.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_569_0 = (tex2D( _ThicknessMap, uv_ThicknessMap )*_ThickScale + _ThickOffset);
				float4 ThicknessRef533 = (( _Thickness )?( (( _ThichnessInvert )?( ( 1.0 - temp_output_569_0 ) ):( temp_output_569_0 )) ):( temp_cast_10 ));
				float4 lerpResult3_g153 = lerp( RefractionRef584 , float4( _ThicknessColor , 0.0 ) , saturate( ( 1.0 - ( ( 1.0 - ThicknessRef533 ) + ( 1.0 - _ThicknessIntensity ) ) ) ));
				float4 temp_cast_12 = (One115).xxxx;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float4 temp_cast_14 = (-WorldPosition.z).xxxx;
				float4 DepthOut271 = (saturate( CalculateContrast(( ase_parentObjectScale * _DepthContrast ).x,temp_cast_14) )*_DepthScale + _DepthOffset);
				float4 TransColorRef683 = _TransparencyColor;
				int DepthTogRef681 = _DepthToggle;
				float fresnelNdotV619 = dot( NewNormals23, ase_worldViewDir );
				float fresnelNode619 = ( _TransparentFresnelBias + _TransparentFresnelScale * pow( 1.0 - fresnelNdotV619, _TransparentFresnelPower ) );
				float4 temp_cast_15 = ((( _TransparentFresnelInvert )?( ( 1.0 - fresnelNode619 ) ):( fresnelNode619 ))).xxxx;
				float4 TransparentFresnelResult624 = (( _TransparentFresnel )?( temp_cast_15 ):( ( 1.0 - ( TransColorRef683 * DepthTogRef681 ) ) ));
				float4 lerpResult395 = lerp( ( _DepthColor + (( _Depth )?( DepthOut271 ):( temp_cast_12 )) ) , _TransparencyColor , saturate( TransparentFresnelResult624 ));
				float4 DepthTransRef626 = (lerpResult395*_TRScale + _TROffset);
				float4 temp_cast_17 = (Zero116).xxxx;
				float dotResult34 = dot( NewNormals23 , ase_worldViewDir );
				float NormalViewDirection37 = dotResult34;
				float saferPower362 = abs( ( 1.0 - saturate( ( (0.5 + (_RimContourOffset - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) + NormalViewDirection37 ) ) ) );
				float temp_output_362_0 = pow( saferPower362 , (0.0001 + (_RimContourScale - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0)) );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_370_0 = saturate( (( _RimCAtt )?( ( temp_output_362_0 * ( Zero116 * ase_lightAtten ) ) ):( temp_output_362_0 )) );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 Toon_Rim367 = (( _RimContour )?( ( temp_output_370_0 * ( ase_lightColor * _RimContourColor ) * _RimContourIntensity ) ):( temp_cast_17 ));
				float4 temp_cast_19 = (Zero116).xxxx;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl599 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NewObjectNormal24 ), dot( tanToWorld1, NewObjectNormal24 ), dot( tanToWorld2, NewObjectNormal24 ) ) ) );
				float3 VertexPos5_g152 = worldRefl599;
				float3 appendResult10_g152 = (float3(0.0 , VertexPos5_g152.y , 0.0));
				float3 VertexPosRotationAxis11_g152 = appendResult10_g152;
				float3 break13_g152 = VertexPos5_g152;
				float3 appendResult14_g152 = (float3(break13_g152.x , 0.0 , break13_g152.z));
				float3 VertexPosOtherAxis12_g152 = appendResult14_g152;
				float Angle3_g152 = radians( _CubeMapRotate );
				float3 appendResult590 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal46 = NewObjectNormal24;
				float3 worldNormal46 = normalize( float3(dot(tanToWorld0,tanNormal46), dot(tanToWorld1,tanNormal46), dot(tanToWorld2,tanNormal46)) );
				float fresnelNdotV43 = dot( normalize( worldNormal46 ), ase_worldViewDir );
				float fresnelNode43 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV43 , 0.0001 ), _RefFresnelPower ) );
				float temp_output_228_0 = saturate( fresnelNode43 );
				float ReflectFresnelResult50 = ( (( _RefFresnelInvert )?( ( 1.0 - temp_output_228_0 ) ):( temp_output_228_0 )) * _RefFresnelSwitch );
				int ReflectFresnelSwitch51 = _RefFresnelSwitch;
				float4 Reflect602 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g152 + ( VertexPosOtherAxis12_g152 * cos( Angle3_g152 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g152 ) * sin( Angle3_g152 ) ) ) + appendResult590 ) ) * _ReflectColor ) * ( 1.0 - ReflectFresnelResult50 ) * ( ( _ReflectionMultiplier * ReflectFresnelSwitch51 ) + One115 ) ) ):( temp_cast_19 ));
				float4 temp_cast_20 = (One115).xxxx;
				float2 uv_CurvatureTexture = IN.ase_texcoord4.xyz.xy * _CurvatureTexture_ST.xy + _CurvatureTexture_ST.zw;
				float4 RefCurvatureResult630 = saturate( ( Reflect602 * saturate( (( _ReflectionCurvature )?( ( CalculateContrast((1.7 + (_CurvatureScale - 0.0) * (2.5 - 1.7) / (1.0 - 0.0)),tex2D( _CurvatureTexture, uv_CurvatureTexture )) * 15 ) ):( temp_cast_20 )) ) ) );
				float4 FinalEmissionResult563 = saturate( ( (( lerpResult3_g153 * DepthTransRef626 )*_TransScale + _TransOffset) + Toon_Rim367 + RefCurvatureResult630 ) );
				

				float3 BaseColor = MainDiffuse561.rgb;
				float3 Emission = FinalEmissionResult563.xyz;
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			sampler2D _BaseMap;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
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

				float Zero116 = 0.0;
				float4 temp_cast_0 = (Zero116).xxxx;
				float2 uv_BaseMap = IN.ase_texcoord2.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 MainDiffuse561 = (( _SurfaceSettings )?( ( _BaseColor * tex2D( _BaseMap, uv_BaseMap ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = MainDiffuse561.rgb;
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

			

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define _ASE_LIGHTING_SIMPLE
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_texcoord6 = v.positionOS;
				
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
				float3 normalizeResult12_g154 = normalize( appendResult10_g154 );
				float2 uv_NormalMap = IN.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack25 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack25.z = lerp( 1, unpack25.z, saturate(_NormalScale) );
				float2 appendResult703 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos705 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos706 = ComputeScreenPos( unityObjectToClipPos705 );
				float2 break699 = ( appendResult703 * (computeScreenPos706).xy );
				float temp_output_707_0 = (computeScreenPos706).w;
				float4 appendResult721 = (float4(break699.x , break699.y , (computeScreenPos706).z , temp_output_707_0));
				float2 appendResult702 = (float2(_SSOffX , _SSOffY));
				float2 texCoord701 = IN.ase_texcoord5.xy * appendResult703 + appendResult702;
				float2 appendResult700 = (float2(_SSAnchorX , _SSAnchorY));
				float cos719 = cos( radians( _PatternRotator ) );
				float sin719 = sin( radians( _PatternRotator ) );
				float2 rotator719 = mul( ( computeScreenPos706 * _SSSize * float4( texCoord701, 0.0 , 0.0 ) ).xy - appendResult700 , float2x2( cos719 , -sin719 , sin719 , cos719 )) + appendResult700;
				float3 unpack725 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator719, 0.0 , 0.0 ) ):( ( ( appendResult721 / temp_output_707_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack725.z = lerp( 1, unpack725.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth727 = unpack725;
				float3 NewObjectNormal24 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				

				float3 Normal = NewObjectNormal24;
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define _ASE_LIGHTING_SIMPLE
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_OPAQUE_TEXTURE 1


			

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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			sampler2D _BaseMap;
			sampler2D _NormalMap;
			sampler2D _BluricRefractionPattern;
			sampler2D _ThicknessMap;
			samplerCUBE _ReflectMap;
			sampler2D _CurvatureTexture;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
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

				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_texcoord9 = v.positionOS;
				
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

				float Zero116 = 0.0;
				float4 temp_cast_0 = (Zero116).xxxx;
				float2 uv_BaseMap = IN.ase_texcoord8.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 MainDiffuse561 = (( _SurfaceSettings )?( ( _BaseColor * tex2D( _BaseMap, uv_BaseMap ) ) ):( temp_cast_0 ));
				
				float2 temp_output_1_0_g154 = float2( 0,0 );
				float dotResult4_g154 = dot( temp_output_1_0_g154 , temp_output_1_0_g154 );
				float3 appendResult10_g154 = (float3((temp_output_1_0_g154).x , (temp_output_1_0_g154).y , sqrt( ( 1.0 - saturate( dotResult4_g154 ) ) )));
				float3 normalizeResult12_g154 = normalize( appendResult10_g154 );
				float2 uv_NormalMap = IN.ase_texcoord8.xyz.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack25 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack25.z = lerp( 1, unpack25.z, saturate(_NormalScale) );
				float2 appendResult703 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos705 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos706 = ComputeScreenPos( unityObjectToClipPos705 );
				float2 break699 = ( appendResult703 * (computeScreenPos706).xy );
				float temp_output_707_0 = (computeScreenPos706).w;
				float4 appendResult721 = (float4(break699.x , break699.y , (computeScreenPos706).z , temp_output_707_0));
				float2 appendResult702 = (float2(_SSOffX , _SSOffY));
				float2 texCoord701 = IN.ase_texcoord8.xyz.xy * appendResult703 + appendResult702;
				float2 appendResult700 = (float2(_SSAnchorX , _SSAnchorY));
				float cos719 = cos( radians( _PatternRotator ) );
				float sin719 = sin( radians( _PatternRotator ) );
				float2 rotator719 = mul( ( computeScreenPos706 * _SSSize * float4( texCoord701, 0.0 , 0.0 ) ).xy - appendResult700 , float2x2( cos719 , -sin719 , sin719 , cos719 )) + appendResult700;
				float3 unpack725 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator719, 0.0 , 0.0 ) ):( ( ( appendResult721 / temp_output_707_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack725.z = lerp( 1, unpack725.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth727 = unpack725;
				float3 NewObjectNormal24 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				
				float One115 = 1.0;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) , BumpForSmooth727 ) ):( (( _Normal )?( unpack25 ):( normalizeResult12_g154 )) ));
				float3 worldNormal29 = normalize( float3(dot(tanToWorld0,tanNormal29), dot(tanToWorld1,tanNormal29), dot(tanToWorld2,tanNormal29)) );
				float3 NewNormals23 = worldNormal29;
				float fresnelNdotV415 = dot( NewNormals23, WorldViewDirection );
				float fresnelNode415 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV415, _FresnelPower ) );
				float RefractFresnelResult420 = (( _Refraction )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode415 ) ):( fresnelNode415 )) ):( Zero116 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal223 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult420 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One115 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal24 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_302_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal223);
				float4 RefractionRef584 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult420 ) ) * temp_output_302_0 * _TransparentIntensity ) ):( ( temp_output_302_0 * _TransparentIntensity ) ));
				float4 temp_cast_10 = (Zero116).xxxx;
				float2 uv_ThicknessMap = IN.ase_texcoord8.xyz.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				float4 temp_output_569_0 = (tex2D( _ThicknessMap, uv_ThicknessMap )*_ThickScale + _ThickOffset);
				float4 ThicknessRef533 = (( _Thickness )?( (( _ThichnessInvert )?( ( 1.0 - temp_output_569_0 ) ):( temp_output_569_0 )) ):( temp_cast_10 ));
				float4 lerpResult3_g153 = lerp( RefractionRef584 , float4( _ThicknessColor , 0.0 ) , saturate( ( 1.0 - ( ( 1.0 - ThicknessRef533 ) + ( 1.0 - _ThicknessIntensity ) ) ) ));
				float4 temp_cast_12 = (One115).xxxx;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float4 temp_cast_14 = (-WorldPosition.z).xxxx;
				float4 DepthOut271 = (saturate( CalculateContrast(( ase_parentObjectScale * _DepthContrast ).x,temp_cast_14) )*_DepthScale + _DepthOffset);
				float4 TransColorRef683 = _TransparencyColor;
				int DepthTogRef681 = _DepthToggle;
				float fresnelNdotV619 = dot( NewNormals23, WorldViewDirection );
				float fresnelNode619 = ( _TransparentFresnelBias + _TransparentFresnelScale * pow( 1.0 - fresnelNdotV619, _TransparentFresnelPower ) );
				float4 temp_cast_15 = ((( _TransparentFresnelInvert )?( ( 1.0 - fresnelNode619 ) ):( fresnelNode619 ))).xxxx;
				float4 TransparentFresnelResult624 = (( _TransparentFresnel )?( temp_cast_15 ):( ( 1.0 - ( TransColorRef683 * DepthTogRef681 ) ) ));
				float4 lerpResult395 = lerp( ( _DepthColor + (( _Depth )?( DepthOut271 ):( temp_cast_12 )) ) , _TransparencyColor , saturate( TransparentFresnelResult624 ));
				float4 DepthTransRef626 = (lerpResult395*_TRScale + _TROffset);
				float4 temp_cast_17 = (Zero116).xxxx;
				float dotResult34 = dot( NewNormals23 , WorldViewDirection );
				float NormalViewDirection37 = dotResult34;
				float saferPower362 = abs( ( 1.0 - saturate( ( (0.5 + (_RimContourOffset - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) + NormalViewDirection37 ) ) ) );
				float temp_output_362_0 = pow( saferPower362 , (0.0001 + (_RimContourScale - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0)) );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_370_0 = saturate( (( _RimCAtt )?( ( temp_output_362_0 * ( Zero116 * ase_lightAtten ) ) ):( temp_output_362_0 )) );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float4 Toon_Rim367 = (( _RimContour )?( ( temp_output_370_0 * ( ase_lightColor * _RimContourColor ) * _RimContourIntensity ) ):( temp_cast_17 ));
				float4 temp_cast_19 = (Zero116).xxxx;
				float3 worldRefl599 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, NewObjectNormal24 ), dot( tanToWorld1, NewObjectNormal24 ), dot( tanToWorld2, NewObjectNormal24 ) ) ) );
				float3 VertexPos5_g152 = worldRefl599;
				float3 appendResult10_g152 = (float3(0.0 , VertexPos5_g152.y , 0.0));
				float3 VertexPosRotationAxis11_g152 = appendResult10_g152;
				float3 break13_g152 = VertexPos5_g152;
				float3 appendResult14_g152 = (float3(break13_g152.x , 0.0 , break13_g152.z));
				float3 VertexPosOtherAxis12_g152 = appendResult14_g152;
				float Angle3_g152 = radians( _CubeMapRotate );
				float3 appendResult590 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal46 = NewObjectNormal24;
				float3 worldNormal46 = normalize( float3(dot(tanToWorld0,tanNormal46), dot(tanToWorld1,tanNormal46), dot(tanToWorld2,tanNormal46)) );
				float fresnelNdotV43 = dot( normalize( worldNormal46 ), WorldViewDirection );
				float fresnelNode43 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV43 , 0.0001 ), _RefFresnelPower ) );
				float temp_output_228_0 = saturate( fresnelNode43 );
				float ReflectFresnelResult50 = ( (( _RefFresnelInvert )?( ( 1.0 - temp_output_228_0 ) ):( temp_output_228_0 )) * _RefFresnelSwitch );
				int ReflectFresnelSwitch51 = _RefFresnelSwitch;
				float4 Reflect602 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g152 + ( VertexPosOtherAxis12_g152 * cos( Angle3_g152 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g152 ) * sin( Angle3_g152 ) ) ) + appendResult590 ) ) * _ReflectColor ) * ( 1.0 - ReflectFresnelResult50 ) * ( ( _ReflectionMultiplier * ReflectFresnelSwitch51 ) + One115 ) ) ):( temp_cast_19 ));
				float4 temp_cast_20 = (One115).xxxx;
				float2 uv_CurvatureTexture = IN.ase_texcoord8.xyz.xy * _CurvatureTexture_ST.xy + _CurvatureTexture_ST.zw;
				float4 RefCurvatureResult630 = saturate( ( Reflect602 * saturate( (( _ReflectionCurvature )?( ( CalculateContrast((1.7 + (_CurvatureScale - 0.0) * (2.5 - 1.7) / (1.0 - 0.0)),tex2D( _CurvatureTexture, uv_CurvatureTexture )) * 15 ) ):( temp_cast_20 )) ) ) );
				float4 FinalEmissionResult563 = saturate( ( (( lerpResult3_g153 * DepthTransRef626 )*_TransScale + _TransOffset) + Toon_Rim367 + RefCurvatureResult630 ) );
				
				float4 temp_cast_23 = (Zero116).xxxx;
				float dotResult449 = dot( NewObjectNormal24 , _MainLightPosition.xyz );
				float4 temp_cast_24 = (( 1.0 - dotResult449 )).xxxx;
				float4 temp_cast_25 = (_SpecularIn).xxxx;
				float4 temp_cast_26 = (_SpecularOut).xxxx;
				float4 saferPower437 = abs( (float4( 0,0,0,0 ) + (CalculateContrast(_Glossy,temp_cast_24) - float4( 0,0,0,0 )) * (temp_cast_26 - float4( 0,0,0,0 )) / (temp_cast_25 - float4( 0,0,0,0 ))) );
				float4 temp_cast_27 = ((0.01 + (_Softness - 0.0) * (1.0 - 0.01) / (1.0 - 0.0))).xxxx;
				float4 temp_cast_28 = (_SpecularAmbient).xxxx;
				float4 temp_cast_29 = (_SpecularSaturation).xxxx;
				float4 clampResult441 = clamp( ( 1.0 - pow( saferPower437 , temp_cast_27 ) ) , temp_cast_28 , temp_cast_29 );
				float4 Specular447 = (( _SpecularSwitch )?( ( clampResult441 * _SpecColor * ase_lightColor * _SpecularIntensity ) ):( temp_cast_23 ));
				

				float3 BaseColor = MainDiffuse561.rgb;
				float3 Normal = NewObjectNormal24;
				float3 Emission = FinalEmissionResult563.xyz;
				float3 Specular = Specular447.rgb;
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

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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
			float4 _DepthColor;
			float4 _TransparencyColor;
			float4 _ReflectColor;
			float4 _NormalMap_ST;
			float4 _RimContourColor;
			float4 _BaseMap_ST;
			float4 _BaseColor;
			float4 _CurvatureTexture_ST;
			float4 _RefractColor;
			float4 _ThicknessMap_ST;
			float4 _SpecColor;
			float3 _ThicknessColor;
			float _TransparentFresnelScale;
			float _RimContourScale;
			float _RimContourOffset;
			float _TransparentFresnel;
			float _RimCAtt;
			float _RimContour;
			float _TransScale;
			float _TransparentFresnelPower;
			float _TROffset;
			float _TRScale;
			int _DepthToggle;
			float _TransparentFresnelInvert;
			float _TransparentFresnelBias;
			float _TransOffset;
			float _RimContourIntensity;
			float _CMXPos;
			float _ReflectionStrength;
			float _SpecularSaturation;
			float _SpecularAmbient;
			float _Softness;
			float _SpecularOut;
			float _SpecularIn;
			float _Glossy;
			float _SpecularSwitch;
			float _CurvatureScale;
			float _Reflect;
			float _ReflectionCurvature;
			int _RefFresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelBias;
			float _RefFresnelInvert;
			float _CMZPos;
			float _CMYPos;
			float _CubeMapRotate;
			float _ReflectionMultiplier;
			float _DepthOffset;
			int _RIFineTune;
			float _DepthContrast;
			float _SSOffY;
			float _SSOffX;
			float _SSSize;
			float _SSTileY;
			float _SSTileX;
			float _ScreenSpace;
			float _NormalScale;
			float _Normal;
			float _SSAnchorX;
			float _SSBluricTransparent;
			int _checkDef;
			int _RIFold;
			int _DPFold;
			int _CurvFold;
			int _ThickFold;
			int _TRFRFold;
			int _TransparentToggle;
			int _TRFineTune;
			float _SurfaceSettings;
			float _SSAnchorY;
			float _PatternRotator;
			float _PatternHeight;
			float _Depth;
			float _SpecularIntensity;
			float _ThicknessIntensity;
			float _ThickOffset;
			float _ThickScale;
			float _ThichnessInvert;
			float _Thickness;
			float _TransparentIntensity;
			float _NewMax;
			float _NewMin;
			float _OldMax;
			float _OldMin;
			float _FresnelPower;
			float _FresnelScale;
			float _FresnelBias;
			float _RefractionInvert;
			float _RefrControl;
			float _ScreenContrast;
			float _Refraction;
			float _DepthScale;
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
	
	CustomEditor "BTransparentEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;632;-3136,-2704;Inherit;False;1688.441;645.2385;Final Emission Compositing;15;563;534;382;631;381;296;472;466;295;627;582;297;285;463;585;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;629;-5216,-3344;Inherit;False;1900.888;608.8458;Reflect Curvature Settings;13;630;551;480;412;547;554;553;556;487;541;555;485;188;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;625;-5344,-2704;Inherit;False;2170.466;630.6934;Depth And Transparent Settings;24;626;356;395;292;345;391;636;332;343;357;355;286;390;387;352;344;351;388;329;271;290;392;638;683;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;583;-7584,-3728;Inherit;False;2339.747;792.5537;Refraction Settings;27;249;225;254;215;661;652;281;282;284;283;532;280;166;654;454;423;584;301;644;302;422;424;426;425;223;273;389;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;574;-5216,-3792;Inherit;False;1432;424;Thickness Settings;9;533;572;573;569;567;566;459;575;576;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;121;-2160,-2016;Inherit;False;707.1488;633.9546;Local Vars;17;640;639;675;691;637;635;681;679;117;118;662;116;119;643;120;115;729;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;38;-7584,-1216;Inherit;False;1794.864;776.4122;Fresnel Settings;14;242;46;39;51;50;48;529;44;45;228;43;42;41;40;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;20;-7584,-1616;Inherit;False;663.1602;341.7755;Normal Light Direction;4;33;30;32;31;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;21;-7584,-2032;Inherit;False;1755.914;375.5025;Normals;10;24;23;29;663;508;507;27;25;28;26;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;22;-6880,-1616;Inherit;False;658.4011;335.112;Normal View Direction;4;37;34;36;35;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;358;-7584,-416;Inherit;False;2528.341;495.4541;Toon Rim;25;369;368;367;692;694;366;370;375;374;373;372;378;380;377;364;379;376;371;365;363;362;361;360;359;695;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;414;-5760,-1216;Inherit;False;1558.097;767.1519;Refraction Fresnel Settings;11;420;428;530;531;427;415;417;418;416;419;421;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;429;-5024,-416;Inherit;False;2612.477;644.8541;Specular Setup;23;452;451;450;449;448;447;446;445;444;443;442;441;440;439;438;437;436;435;434;433;432;431;430;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;557;-3760,-3840;Inherit;False;1135.086;457.1473;Main Texture;6;561;560;559;558;633;634;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;586;-7584,-2912;Inherit;False;2212.378;839.6785;Reflection Map;26;612;611;610;609;608;607;606;605;604;603;602;601;600;599;598;597;596;595;594;593;592;591;590;589;588;587;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;613;-4176,-1216;Inherit;False;1701.43;761.1519;Transparent Fresnel Settings;14;621;624;618;620;617;616;623;619;615;614;677;684;685;689;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;696;-5344,-2032;Inherit;False;2431.518;786.3904;Screen Space Bump Map Settings;32;728;727;726;725;724;723;722;721;720;719;718;717;716;715;714;713;712;711;710;709;708;707;706;705;704;703;702;701;700;699;698;697;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;115;-1904,-1968;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-2112,-1968;Inherit;False;Constant;_One1;[One];20;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;359;-6752,-352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;360;-6912,-352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;361;-7040,-352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;362;-6576,-352;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;363;-6512,-96;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;365;-6768,0;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;371;-6336,-272;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;376;-6784,-272;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;379;-7264,-352;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;389;-7552,-3536;Inherit;False;150;100;New Note;;1,1,1,1;New Min Kırılma indisi. Bunu remapla düzenle$;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;430;-4096,-288;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.092,0.092,0.092,1;False;3;COLOR;0,0,0,0;False;4;COLOR;0.795,0.795,0.795,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;431;-4448,-288;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;2.86;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;437;-3824,-288;Inherit;True;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.56;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;438;-3584,-288;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;441;-3376,-320;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.347,0.347,0.347,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;446;-3072,-272;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;449;-4720,-288;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;451;-4608,-288;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;559;-3712,-3600;Inherit;True;Property;_BaseMap;Base Map;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;560;-3392,-3712;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;587;-7248,-2608;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;588;-7072,-2720;Inherit;False;BUDUComputeRotationY;-1;;152;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;589;-6816,-2720;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;590;-6976,-2528;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;591;-7120,-2528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;592;-6304,-2720;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;593;-7520,-2608;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;16;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;595;-7392,-2528;Inherit;False;Property;_CMYPos;CM Y Pos;11;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;596;-7392,-2448;Inherit;False;Property;_CMXPos;CM X Pos;12;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;597;-7392,-2368;Inherit;False;Property;_CMZPos;CM Z Pos;14;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector;599;-7328,-2848;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;600;-6544,-2528;Inherit;False;Property;_ReflectColor;Reflect Color;20;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;601;-5968,-2720;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;602;-5616,-2720;Inherit;True;Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;605;-6384,-2800;Inherit;False;Property;_ReflectionStrength;Reflection Strength;23;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;606;-6096,-2560;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;610;-6544,-2288;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;67;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;611;-6240,-2272;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;612;-6080,-2288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;598;-7552,-2848;Inherit;True;24;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;608;-6256,-2160;Inherit;False;115;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;607;-6304,-2480;Inherit;True;50;ReflectFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;603;-6032,-2800;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;604;-5824,-2720;Inherit;False;Property;_Reflect;Reflect;24;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;594;-6608,-2720;Inherit;True;Property;_ReflectMap;Reflect Map;18;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;609;-6480,-2208;Inherit;False;51;ReflectFresnelSwitch;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-7360,-704;Inherit;False;Property;_RefFresnelBias;Ref Fresnel Bias;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-7360,-624;Inherit;False;Property;_RefFresnelScale;Ref Fresnel Scale;6;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-7360,-544;Inherit;False;Property;_RefFresnelPower;Ref Fresnel Power;7;0;Create;True;0;0;0;False;0;False;3;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;43;-7040,-944;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;228;-6752,-944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;45;-6592,-880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;44;-6432,-944;Inherit;False;Property;_RefFresnelInvert;Ref Fresnel Invert;9;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;529;-6176,-944;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;48;-6432,-832;Inherit;False;Property;_RefFresnelSwitch;Ref Fresnel Switch;8;1;[Enum];Create;False;0;2;Rim On;1;Rim Off;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;39;-7328,-912;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;46;-7328,-1136;Inherit;True;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;242;-7552,-1136;Inherit;False;24;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;51;-6016,-832;Inherit;False;ReflectFresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-6016,-944;Inherit;False;ReflectFresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;614;-4064,-1136;Inherit;True;23;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;615;-4080,-928;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;619;-3792,-928;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;623;-3520,-832;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-4112,-720;Inherit;False;Property;_TransparentFresnelBias;Transparent Fresnel Bias;47;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;617;-4112,-640;Inherit;False;Property;_TransparentFresnelScale;Transparent Fresnel Scale;50;0;Create;True;0;0;0;False;0;False;1;2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;392;-4176,-2176;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;271;-4448,-2416;Inherit;False;DepthOut;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;329;-4672,-2416;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;-0.35;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;388;-5056,-2528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;351;-5056,-2448;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;344;-4896,-2528;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjectScaleNode;352;-5296,-2496;Inherit;True;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;387;-5248,-2656;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;286;-4208,-2656;Inherit;False;Property;_DepthColor;Depth Color;21;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;459;-5168,-3728;Inherit;True;Property;_ThicknessMap;Thickness Map;68;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;566;-5056,-3536;Inherit;False;Property;_ThickScale;ThickScale;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-5056,-3456;Inherit;False;Property;_ThickOffset;ThickOffset;76;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;569;-4864,-3584;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;573;-4608,-3504;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;533;-4000,-3584;Inherit;False;ThicknessRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;575;-4224,-3584;Inherit;False;Property;_Thickness;Thickness;78;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;576;-4416,-3664;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;485;-5168,-2928;Inherit;False;Property;_CurvatureScale;Curvature Scale;71;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;555;-4880,-2928;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1.7;False;4;FLOAT;2.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;487;-4992,-3152;Inherit;True;Property;_CurvatureTexture;Curvature Texture;72;0;Create;True;0;0;0;False;0;False;-1;86eccc92f93eca94387f602735a0ad5a;86eccc92f93eca94387f602735a0ad5a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;554;-4272,-3200;Inherit;False;Property;_ReflectionCurvature;Reflection Curvature;74;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;547;-4016,-3200;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;412;-4048,-3296;Inherit;False;602;Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;480;-3872,-3264;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;551;-3728,-3264;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;541;-4688,-3152;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;553;-4464,-3248;Inherit;False;115;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;630;-3584,-3264;Inherit;False;RefCurvatureResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;558;-3632,-3792;Inherit;False;Property;_BaseColor;Base Color;2;0;Create;True;0;0;0;False;0;False;0,0,0,1;0.5,0.5,0.5,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;-2864,-3712;Inherit;True;MainDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;633;-3120,-3712;Inherit;False;Property;_SurfaceSettings;SurfaceSettings;79;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;634;-3360,-3488;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;343;-4864,-2336;Inherit;False;Property;_DepthOffset;Depth Offset;30;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;332;-4864,-2416;Inherit;False;Property;_DepthScale;Depth Scale;28;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;636;-4688,-2528;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;345;-5328,-2304;Inherit;False;Property;_DepthContrast;Depth Contrast;33;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;585;-3056,-2560;Inherit;False;584;RefractionRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;-3056,-2640;Inherit;False;533;ThicknessRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;285;-2480,-2416;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;297;-2464,-2224;Inherit;False;Property;_TransOffset;TransOffset;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;582;-2800,-2464;Inherit;False;BUDUThicknessMap;-1;;153;5e37ebb8df554b5459f6519d0a665ea7;0;4;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;627;-2736,-2304;Inherit;False;626;DepthTransRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;620;-3344,-928;Inherit;False;Property;_TransparentFresnelInvert;TransparentFresnelInvert;61;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;618;-4112,-560;Inherit;False;Property;_TransparentFresnelPower;Transparent Fresnel Power;55;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;364;-6784,-96;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;292;-4416,-2496;Inherit;False;115;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;638;-3968,-2592;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleNode;556;-4448,-3152;Inherit;True;15;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;355;-3840,-2400;Inherit;False;Property;_TRScale;TRScale;34;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;357;-3840,-2320;Inherit;False;Property;_TROffset;TROffset;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;395;-3840,-2560;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;391;-4208,-2368;Inherit;False;Property;_TransparencyColor;Transparency Color;46;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ScaleAndOffsetNode;356;-3664,-2464;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;626;-3440,-2464;Inherit;False;DepthTransRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;390;-4464,-2176;Inherit;False;624;TransparentFresnelResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;621;-2992,-976;Inherit;False;Property;_TransparentFresnel;TransparentFresnel;73;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;624;-2752,-976;Inherit;False;TransparentFresnelResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;290;-4208,-2480;Inherit;False;Property;_Depth;Depth;22;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;683;-3536,-2272;Inherit;False;TransColorRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;689;-3152,-1024;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;685;-3312,-1088;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;684;-3552,-1120;Inherit;False;683;TransColorRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;677;-3552,-1040;Inherit;False;681;DepthTogRef;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;447;-2640,-176;Inherit;True;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;432;-4736,-176;Inherit;False;Property;_Glossy;Glossy;31;0;Create;True;0;0;0;False;0;False;1;25;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;-2464,-2304;Inherit;False;Property;_TransScale;TransScale;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;572;-4448,-3584;Inherit;False;Property;_ThichnessInvert;Thichness Invert;77;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;119;-2112,-1872;Inherit;False;Constant;_Zero1;[Zero];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;116;-1904,-1872;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;662;-1664,-1872;Inherit;False;Property;_TRFineTune;TRFineTune;91;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;118;-2112,-1776;Inherit;False;Constant;_Gray;[Gray];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;117;-1904,-1776;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;679;-2112,-1680;Inherit;False;Property;_DepthToggle;DepthToggle;81;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;681;-1904,-1680;Inherit;False;DepthTogRef;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.IntNode;635;-1680,-1776;Inherit;False;Property;_TransparentToggle;TransparentToggle;80;2;[HideInInspector];[Gamma];Create;True;0;0;0;True;0;False;1;1;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;637;-2112,-1584;Inherit;False;Property;_TRFRFold;TRFRFold;82;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;691;-1952,-1584;Inherit;False;Property;_ThickFold;ThickFold;87;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;675;-1792,-1584;Inherit;False;Property;_CurvFold;CurvFold;84;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;639;-2112,-1488;Inherit;False;Property;_DPFold;DPFold;86;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;640;-1952,-1488;Inherit;False;Property;_RIFold;RIFold;88;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;377;-7072,-176;Inherit;False;Property;_RimContourScale; Rim Contour Scale;41;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;380;-7552,-352;Inherit;False;Property;_RimContourOffset;Rim Contour Offset;39;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;372;-6112,-352;Inherit;False;Property;_RimCAtt;RimCAtt;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;373;-6080,-240;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;374;-5888,-208;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;375;-6112,-112;Inherit;False;Property;_RimContourColor;Rim Contour Color;43;1;[Gamma];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;370;-5888,-352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;366;-5712,-208;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;367;-5296,-208;Inherit;False;Toon Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;368;-5312,-368;Inherit;False;Toon Rim Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;369;-5504,-368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;694;-5712,-80;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;695;-5872,0;Inherit;False;Property;_RimContourIntensity;Rim Contour Intensity;95;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;273;-6672,-3312;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ScreenColorNode;223;-6528,-3312;Inherit;False;Global;_GrabScreen0;Grab Screen 0;11;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;425;-6416,-3552;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;426;-6304,-3552;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;424;-6672,-3664;Inherit;False;Property;_RefractColor;Refract Color;58;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleContrastOpNode;302;-6208,-3312;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;644;-6400,-3136;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.7;False;4;FLOAT;1.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-6672,-3104;Inherit;False;Property;_ScreenContrast;ScreenContrast;27;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;584;-5488,-3552;Inherit;False;RefractionRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;423;-5888,-3312;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;454;-5728,-3552;Inherit;False;Property;_Refraction;Refraction;64;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;166;-6192,-3184;Inherit;False;Property;_TransparentIntensity;Transparent Intensity;10;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;280;-7216,-3520;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.9;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-7392,-3536;Inherit;False;Property;_OldMin;Old Min;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;284;-7392,-3456;Inherit;False;Property;_OldMax;Old Max;15;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;281;-7392,-3296;Inherit;False;Property;_NewMax;New Max;19;0;Create;True;0;0;0;False;0;False;1.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;652;-6928,-3408;Inherit;False;Property;_RefrControl;RefrControl;92;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;661;-7136,-3296;Inherit;False;115;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;215;-7344,-3200;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;254;-7104,-3200;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;249;-6928,-3136;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;654;-5888,-3552;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;532;-7488,-3616;Inherit;False;420;RefractFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;421;-5648,-1136;Inherit;True;23;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;419;-5664,-928;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;416;-5696,-720;Inherit;False;Property;_FresnelBias;Fresnel Bias;48;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;418;-5696,-640;Inherit;False;Property;_FresnelScale;Fresnel Scale;51;0;Create;True;0;0;0;False;0;False;1;2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;417;-5696,-544;Inherit;False;Property;_FresnelPower;Fresnel Power;54;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;415;-5376,-928;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;427;-4912,-928;Inherit;False;Property;_RefractionInvert;RefractionInvert;60;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;531;-4688,-928;Inherit;False;Property;_Refraction;Refraction;68;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;530;-4896,-1008;Inherit;False;116;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;428;-5104,-832;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;420;-4464,-928;Inherit;False;RefractFresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;225;-7168,-3024;Inherit;False;24;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-7552,-1952;Float;False;Property;_NormalScale;Normal Scale;3;0;Create;True;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;28;-7232,-1760;Inherit;False;Normal Reconstruct Z;-1;;154;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;422;-6688,-3488;Inherit;False;420;RefractFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;697;-4640,-1520;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;698;-4416,-1616;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;699;-4256,-1616;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;700;-4608,-1648;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;701;-4432,-1920;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;702;-4608,-1840;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;703;-4608,-1984;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PosVertexDataNode;704;-5312,-1440;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;705;-5120,-1440;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;706;-4896,-1440;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;707;-4560,-1360;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;708;-4560,-1440;Inherit;False;False;False;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;709;-4752,-1984;Inherit;False;Property;_SSTileX;SSTileX;59;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;710;-4752,-1920;Inherit;False;Property;_SSTileY;SSTileY;62;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;711;-4752,-1840;Inherit;False;Property;_SSOffX;SSOffX;56;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;712;-4752,-1776;Inherit;False;Property;_SSOffY;SSOffY;63;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;713;-3872,-1424;Inherit;False;Property;_PatternHeight;PatternHeight;53;0;Create;True;0;0;0;True;0;False;0.1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;714;-4784,-1664;Inherit;False;Property;_SSAnchorX;SSAnchorX;57;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;715;-4784,-1600;Inherit;False;Property;_SSAnchorY;SSAnchorY;66;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;716;-4208,-1888;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RadiansOpNode;717;-4112,-1712;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;719;-3936,-1840;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;720;-4368,-1792;Inherit;False;Property;_SSSize;SSSize;52;0;Create;True;0;0;0;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;721;-4112,-1616;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;722;-3952,-1616;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;723;-3792,-1616;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;724;-3632,-1616;Inherit;False;Property;_ScreenSpace;ScreenSpace;83;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;726;-3600,-1424;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;728;-4112,-1456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;725;-3408,-1616;Inherit;True;Property;_BluricRefractionPattern;Bluric Refraction Pattern;49;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;ae0130e6c3e94ee43b67fef77b52e0e9;ae0130e6c3e94ee43b67fef77b52e0e9;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;727;-3120,-1616;Inherit;False;BumpForSmooth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;452;-2864,-176;Inherit;False;Property;_SpecularSwitch;Specular Switch;42;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;445;-3088,-176;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;450;-4992,-352;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;433;-4416,-48;Inherit;False;Property;_SpecularIn;Specular In;32;0;Create;True;0;0;0;True;0;False;1;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;-4416,-128;Inherit;False;Property;_SpecularOut;Specular Out;29;0;Create;True;0;0;0;True;0;False;0.2;0.1;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;436;-4304,32;Inherit;False;Property;_Softness;Softness;44;0;Create;True;0;0;0;False;0;False;0.01;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;435;-4016,-64;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.01;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;439;-3680,-64;Inherit;False;Property;_SpecularAmbient;Specular Ambient;38;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;440;-3680,16;Inherit;False;Property;_SpecularSaturation;Specular Saturation;35;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;442;-3376,-176;Inherit;False;Property;_SpecColor;Spec Color;40;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;443;-3360,16;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;444;-3408,144;Inherit;False;Property;_SpecularIntensity;Specular Intensity;37;0;Create;True;0;0;0;False;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;448;-4960,-240;Inherit;True;24;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;692;-5536,-208;Inherit;False;Property;_RimContour;Rim Contour;94;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;378;-7328,-176;Inherit;False;37;NormalViewDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;31;-7552,-1440;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;32;-7488,-1552;Inherit;False;23;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;30;-7296,-1552;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;33;-7168,-1552;Float;False;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;35;-6816,-1552;Inherit;False;23;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;36;-6816,-1456;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;34;-6624,-1552;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;-6496,-1552;Float;False;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;25;-7264,-1952;Inherit;True;Property;_NormalMap;Normal Map;0;1;[Normal];Create;True;1;Normal Controls;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;27;-6960,-1952;Inherit;False;Property;_Normal;Normal;1;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;507;-6960,-1792;Inherit;False;727;BumpForSmooth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;508;-6736,-1872;Inherit;False;1;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;663;-6512,-1952;Inherit;False;Property;_SSBluricTransparent;SS Bluric Transparent;93;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;29;-6240,-1952;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-6048,-1952;Float;False;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;24;-6048,-1856;Inherit;False;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;466;-3056,-2480;Inherit;False;Property;_ThicknessColor;Thickness Color;69;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;472;-3104,-2320;Inherit;False;Property;_ThicknessIntensity;Thickness Intensity;70;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;296;-2240,-2416;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;381;-2208,-2272;Inherit;False;367;Toon Rim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;631;-2272,-2160;Inherit;False;630;RefCurvatureResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;382;-2000,-2336;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;534;-1872,-2336;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;563;-1712,-2336;Inherit;False;FinalEmissionResult;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;456;-1248,-2288;Inherit;False;Property;_Smoothness;Smoothness;65;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;564;-1216,-2448;Inherit;False;563;FinalEmissionResult;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;114;-1184,-2528;Inherit;False;24;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;562;-1152,-2608;Inherit;False;561;MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;453;-1152,-2368;Inherit;False;447;Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;282;-7424,-3376;Inherit;False;Property;_NewMin;New Min;17;0;Create;True;0;0;0;False;0;False;0.95;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;718;-4384,-1712;Inherit;False;Property;_PatternRotator;PatternRotator;85;0;Create;True;0;0;0;True;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;643;-1664,-1968;Inherit;False;Property;_RIFineTune;RIFineTune;89;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;729;-1648,-1696;Inherit;False;Property;_checkDef;checkDef;90;0;Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;190;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;191;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;192;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;193;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;194;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;195;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;196;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;197;272,-560;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;188;-3664,-2848;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;189;-864,-2464;Float;False;True;-1;2;BTransparentEditor;0;12;BUDU Shaders/BTransparent;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638528750044231537;Workflow;0;0;Surface;1;638528914418019548;  Refraction Model;0;638528914161559270;  Blend;0;638528914640453854;Two Sided;1;638528896043533549;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;638528750495879272;Transmission;0;638528750500051780;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;638528896198100121;  Use Shadow Threshold;0;638528896253523746;Receive Shadows;1;638528896258713632;Receive SSAO;1;638529627882327557;GPU Instancing;1;0;LOD CrossFade;1;638528750566215546;Built-in Fog;1;638528750626481888;_FinalColorxAlpha;0;638528750712060261;Meta Pass;1;638528750769491642;Override Baked GI;0;0;Extra Pre Pass;0;638528751774333260;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
WireConnection;115;0;120;0
WireConnection;359;0;360;0
WireConnection;360;0;361;0
WireConnection;361;0;379;0
WireConnection;361;1;378;0
WireConnection;362;0;359;0
WireConnection;362;1;376;0
WireConnection;363;0;364;0
WireConnection;363;1;365;0
WireConnection;371;0;362;0
WireConnection;371;1;363;0
WireConnection;376;0;377;0
WireConnection;379;0;380;0
WireConnection;430;0;431;0
WireConnection;430;2;433;0
WireConnection;430;4;434;0
WireConnection;431;1;451;0
WireConnection;431;0;432;0
WireConnection;437;0;430;0
WireConnection;437;1;435;0
WireConnection;438;0;437;0
WireConnection;441;0;438;0
WireConnection;441;1;439;0
WireConnection;441;2;440;0
WireConnection;449;0;448;0
WireConnection;449;1;450;1
WireConnection;451;0;449;0
WireConnection;560;0;558;0
WireConnection;560;1;559;0
WireConnection;587;0;593;0
WireConnection;588;4;599;0
WireConnection;588;2;587;0
WireConnection;589;0;588;0
WireConnection;589;1;590;0
WireConnection;590;0;596;0
WireConnection;590;1;591;0
WireConnection;590;2;597;0
WireConnection;591;0;595;0
WireConnection;592;0;594;0
WireConnection;592;1;600;0
WireConnection;599;0;598;0
WireConnection;601;0;605;0
WireConnection;601;1;592;0
WireConnection;601;2;606;0
WireConnection;601;3;612;0
WireConnection;602;0;604;0
WireConnection;606;0;607;0
WireConnection;611;0;610;0
WireConnection;611;1;609;0
WireConnection;612;0;611;0
WireConnection;612;1;608;0
WireConnection;604;0;603;0
WireConnection;604;1;601;0
WireConnection;594;1;589;0
WireConnection;43;0;46;0
WireConnection;43;4;39;0
WireConnection;43;1;40;0
WireConnection;43;2;41;0
WireConnection;43;3;42;0
WireConnection;228;0;43;0
WireConnection;45;0;228;0
WireConnection;44;0;228;0
WireConnection;44;1;45;0
WireConnection;529;0;44;0
WireConnection;529;1;48;0
WireConnection;46;0;242;0
WireConnection;51;0;48;0
WireConnection;50;0;529;0
WireConnection;619;0;614;0
WireConnection;619;4;615;0
WireConnection;619;1;616;0
WireConnection;619;2;617;0
WireConnection;619;3;618;0
WireConnection;623;0;619;0
WireConnection;392;0;390;0
WireConnection;271;0;329;0
WireConnection;329;0;636;0
WireConnection;329;1;332;0
WireConnection;329;2;343;0
WireConnection;388;0;387;3
WireConnection;351;0;352;0
WireConnection;351;1;345;0
WireConnection;344;1;388;0
WireConnection;344;0;351;0
WireConnection;569;0;459;0
WireConnection;569;1;566;0
WireConnection;569;2;567;0
WireConnection;573;0;569;0
WireConnection;533;0;575;0
WireConnection;575;0;576;0
WireConnection;575;1;572;0
WireConnection;555;0;485;0
WireConnection;554;0;553;0
WireConnection;554;1;556;0
WireConnection;547;0;554;0
WireConnection;480;0;412;0
WireConnection;480;1;547;0
WireConnection;551;0;480;0
WireConnection;541;1;487;0
WireConnection;541;0;555;0
WireConnection;630;0;551;0
WireConnection;561;0;633;0
WireConnection;633;0;634;0
WireConnection;633;1;560;0
WireConnection;636;0;344;0
WireConnection;285;0;582;0
WireConnection;285;1;627;0
WireConnection;582;1;463;0
WireConnection;582;2;585;0
WireConnection;582;4;466;0
WireConnection;582;5;472;0
WireConnection;620;0;619;0
WireConnection;620;1;623;0
WireConnection;638;0;286;0
WireConnection;638;1;290;0
WireConnection;556;0;541;0
WireConnection;395;0;638;0
WireConnection;395;1;391;0
WireConnection;395;2;392;0
WireConnection;356;0;395;0
WireConnection;356;1;355;0
WireConnection;356;2;357;0
WireConnection;626;0;356;0
WireConnection;621;0;689;0
WireConnection;621;1;620;0
WireConnection;624;0;621;0
WireConnection;290;0;292;0
WireConnection;290;1;271;0
WireConnection;683;0;391;0
WireConnection;689;0;685;0
WireConnection;685;0;684;0
WireConnection;685;1;677;0
WireConnection;447;0;452;0
WireConnection;572;0;569;0
WireConnection;572;1;573;0
WireConnection;116;0;119;0
WireConnection;117;0;118;0
WireConnection;681;0;679;0
WireConnection;372;0;362;0
WireConnection;372;1;371;0
WireConnection;374;0;373;0
WireConnection;374;1;375;0
WireConnection;370;0;372;0
WireConnection;366;0;370;0
WireConnection;366;1;374;0
WireConnection;366;2;695;0
WireConnection;367;0;692;0
WireConnection;368;0;369;0
WireConnection;369;0;370;0
WireConnection;273;0;652;0
WireConnection;273;1;249;0
WireConnection;223;0;273;0
WireConnection;425;0;424;0
WireConnection;425;1;422;0
WireConnection;426;0;425;0
WireConnection;302;1;223;0
WireConnection;302;0;644;0
WireConnection;644;0;301;0
WireConnection;584;0;454;0
WireConnection;423;0;426;0
WireConnection;423;1;302;0
WireConnection;423;2;166;0
WireConnection;454;0;654;0
WireConnection;454;1;423;0
WireConnection;280;0;532;0
WireConnection;280;1;283;0
WireConnection;280;2;284;0
WireConnection;280;3;282;0
WireConnection;280;4;281;0
WireConnection;652;0;661;0
WireConnection;652;1;280;0
WireConnection;254;0;215;0
WireConnection;249;0;254;0
WireConnection;249;1;225;0
WireConnection;654;0;302;0
WireConnection;654;1;166;0
WireConnection;415;0;421;0
WireConnection;415;4;419;0
WireConnection;415;1;416;0
WireConnection;415;2;418;0
WireConnection;415;3;417;0
WireConnection;427;0;415;0
WireConnection;427;1;428;0
WireConnection;531;0;530;0
WireConnection;531;1;427;0
WireConnection;428;0;415;0
WireConnection;420;0;531;0
WireConnection;697;0;706;0
WireConnection;698;0;703;0
WireConnection;698;1;697;0
WireConnection;699;0;698;0
WireConnection;700;0;714;0
WireConnection;700;1;715;0
WireConnection;701;0;703;0
WireConnection;701;1;702;0
WireConnection;702;0;711;0
WireConnection;702;1;712;0
WireConnection;703;0;709;0
WireConnection;703;1;710;0
WireConnection;705;0;704;0
WireConnection;706;0;705;0
WireConnection;707;0;706;0
WireConnection;708;0;706;0
WireConnection;716;0;706;0
WireConnection;716;1;720;0
WireConnection;716;2;701;0
WireConnection;717;0;718;0
WireConnection;719;0;716;0
WireConnection;719;1;700;0
WireConnection;719;2;717;0
WireConnection;721;0;699;0
WireConnection;721;1;699;1
WireConnection;721;2;708;0
WireConnection;721;3;707;0
WireConnection;722;0;721;0
WireConnection;722;1;707;0
WireConnection;723;0;722;0
WireConnection;723;1;728;0
WireConnection;724;0;723;0
WireConnection;724;1;719;0
WireConnection;726;0;713;0
WireConnection;728;0;720;0
WireConnection;725;1;724;0
WireConnection;725;5;726;0
WireConnection;727;0;725;0
WireConnection;452;0;446;0
WireConnection;452;1;445;0
WireConnection;445;0;441;0
WireConnection;445;1;442;0
WireConnection;445;2;443;0
WireConnection;445;3;444;0
WireConnection;435;0;436;0
WireConnection;692;0;694;0
WireConnection;692;1;366;0
WireConnection;30;0;32;0
WireConnection;30;1;31;0
WireConnection;33;0;30;0
WireConnection;34;0;35;0
WireConnection;34;1;36;0
WireConnection;37;0;34;0
WireConnection;25;5;26;0
WireConnection;27;0;28;0
WireConnection;27;1;25;0
WireConnection;508;0;27;0
WireConnection;508;1;507;0
WireConnection;663;0;27;0
WireConnection;663;1;508;0
WireConnection;29;0;663;0
WireConnection;23;0;29;0
WireConnection;24;0;663;0
WireConnection;296;0;285;0
WireConnection;296;1;295;0
WireConnection;296;2;297;0
WireConnection;382;0;296;0
WireConnection;382;1;381;0
WireConnection;382;2;631;0
WireConnection;534;0;382;0
WireConnection;563;0;534;0
WireConnection;189;0;562;0
WireConnection;189;1;114;0
WireConnection;189;2;564;0
WireConnection;189;9;453;0
WireConnection;189;4;456;0
ASEEND*/
//CHKSM=8F5BDDEE86EDB5C69773F932474A4CA81EA001B8
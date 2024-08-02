// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BSurface"
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
		_RimLightIntensity("Rim Light Intensity", Range( 0 , 1)) = 0
		_RimLightColor("Rim Light Color", Color) = (0,0,0,1)
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
		_SpecularOut("Specular Out", Range( 0.1 , 2)) = 0.8
		_CMXPos("CM X Pos", Range( -2 , 2)) = 0
		_CMZPos("CM Z Pos", Range( -2 , 2)) = 0
		_BGloss("BGloss", Range( 0 , 5)) = 1
		_SpecularIn("Specular In", Range( 0 , 2)) = 0.2
		_FresnelSwitch("Fresnel Switch", Int) = 0
		_SpecularSaturation("Specular Saturation", Range( 0 , 1)) = 1
		[Toggle]_RefFresnelInvert("Ref Fresnel Invert", Float) = 0
		_SpecularIntensity("Specular Intensity", Range( 0 , 1)) = 1
		_RefFresnelBias("RefFresnelBias", Range( 0 , 1)) = 0
		_RefFresnelScale("RefFresnelScale", Range( 0 , 5)) = 1
		_RefFresnelPower("RefFresnelPower", Range( 0 , 5)) = 1
		[HDR]_SpecColor("Spec Color", Color) = (1,1,1,1)
		[Toggle]_SpecularSwitch("Specular Switch", Float) = 0
		_SpecularMap("Specular Map", 2D) = "white" {}
		_Softness("Softness", Range( 0 , 3)) = 0.001
		_AOIntensity("AOIntensity", Range( 0 , 1)) = 1
		_AmbientOcclusionMap("Ambient Occlusion Map", 2D) = "white" {}
		[Toggle]_SpecularInvert("SpecularInvert", Float) = 0
		[Toggle]_EmissionToggle("Emission Toggle", Float) = 0
		_EmissionIntensity("Emission Intensity", Range( 0 , 1)) = 0.5
		[Toggle]_EmissionInvert("Emission Invert", Float) = 0
		_SpecToggle("SpecToggle", Int) = 1
		_SpecularExtras("SpecularExtras", Int) = 0
		_FresnelFold("FresnelFold", Int) = 0
		_AOToggle("AOToggle", Int) = 0
		_CheckDef("CheckDef", Int) = 0
		_CheckBase("CheckBase", Int) = 0
		_TranslucencySettings("TranslucencySettings", Int) = 0
		_CubeMapExtras("CubeMapExtras", Int) = 0
		_RefFresnelSwitch("RefFresnelSwitch", Int) = 0
		[Toggle]_AffectAO("AffectAO", Float) = 1
		[NoScaleOffset]_BluricRefractionPattern("Bluric Refraction Pattern", 2D) = "bump" {}
		_SSSize("SSSize", Float) = 10
		_PatternHeight("PatternHeight", Range( -10 , 10)) = 0.1
		_SSOffX("SSOffX", Float) = 0
		_SSAnchorX("SSAnchorX", Float) = 0
		_SSTileX("SSTileX", Float) = 1
		_SpecMax("SpecMax", Range( 0 , 1)) = 1
		_SSTileY("SSTileY", Float) = 1
		_SpecMin("SpecMin", Range( 0 , 1)) = 0
		_SSOffY("SSOffY", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _SpecType("SpecType", Float) = 0
		_SpecularNormalIntensity("SpecularNormalIntensity", Range( 0 , 1)) = 0.3
		_SSAnchorY("SSAnchorY", Float) = 0
		[Toggle]_SSBluricTransparent("SS Bluric Transparent", Float) = 0
		[Toggle]_AffectAO_Spec("AffectAO_Spec", Float) = 0
		[Toggle]_AffectAO_Rim("AffectAO_Rim", Float) = 0
		_FallOff("FallOff", Range( -5 , 5)) = 1
		_NFallOff("NFallOff", Range( -5 , 5)) = 1
		[NoScaleOffset]_BaseMap("Base Map", 2D) = "white" {}
		[NoScaleOffset][Normal]_NormalMap("NormalMap", 2D) = "bump" {}
		[Toggle]_TriplanarMap("TriplanarMap", Float) = 0
		[Toggle]_TriplanarNMap("TriplanarNMap", Float) = 0
		_TileX("TileX", Float) = 0
		_NTileX("NTileX", Float) = 1
		_OffsetX("OffsetX", Float) = 0
		_NOffsetX("NOffsetX", Float) = 0
		_OffsetY("OffsetY", Float) = 0
		_NOffsetY("NOffsetY", Float) = 0
		_TileY("TileY", Float) = 0
		_NTileY("NTileY", Float) = 1
		_NormalMultiplier("NormalMultiplier", Range( 1 , 5)) = 1
		_EmissionMultiplier("Emission Multiplier", Range( 1 , 20)) = 1
		[Toggle]_ScreenSpace("ScreenSpace", Float) = 0
		_PatternRotator("PatternRotator", Float) = 0
		_TrnsScattering("Trns Scattering", Range( 1 , 50)) = 2
		_TrnsmisShadow("Trnsmis Shadow", Range( 0 , 1)) = 0.5
		_TrnsStrength("Trns Strength", Range( 0 , 50)) = 1
		_TrnsNormDistortion("Trns Norm Distortion", Range( 0 , 1)) = 0.5
		_TrnsDirect("Trns Direct", Range( 0 , 1)) = 0.9
		_TrnsAmbient("Trns Ambient", Range( 0 , 1)) = 0.1
		_TrnsShadow("Trns Shadow", Range( 0 , 1)) = 0.5
		_TransmissionMap("TransmissionMap", 2D) = "white" {}
		_TranslucencyMap("TranslucencyMap", 2D) = "white" {}
		[HDR]_TransmissionColor("TransmissionColor", Color) = (1,1,1)
		[Toggle]_TranslucencyToggle("TranslucencyToggle", Float) = 0
		[Toggle]_TransmissionToggle("TransmissionToggle", Float) = 0
		[HDR]_TranslucencyColor("TranslucencyColor", Color) = (1,1,1)
		[Toggle]_TransmissInvert("TransmissInvert", Float) = 0
		[Toggle]_TranslucencyInvert("TranslucencyInvert", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
			sampler2D _EmissionMap;
			sampler2D _SpecularMap;
			sampler2D _TransmissionMap;
			sampler2D _TranslucencyMap;


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
			
			inline float4 TriplanarSampling289( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord9.xyz, IN.ase_normal, _FallOff, ( appendResult285 / 4.8 ), 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				
				float2 temp_output_1_0_g153 = float2( 0,0 );
				float dotResult4_g153 = dot( temp_output_1_0_g153 , temp_output_1_0_g153 );
				float3 appendResult10_g153 = (float3((temp_output_1_0_g153).x , (temp_output_1_0_g153).y , sqrt( ( 1.0 - saturate( dotResult4_g153 ) ) )));
				float3 normalizeResult12_g153 = normalize( appendResult10_g153 );
				float2 appendResult297 = (float2(_NTileX , _NTileY));
				float2 appendResult298 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord292 = IN.ase_texcoord8.xyz.xy * appendResult297 + appendResult298;
				float temp_output_302_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack290 = UnpackNormalScale( tex2D( _NormalMap, texCoord292 ), temp_output_302_0 );
				unpack290.z = lerp( 1, unpack290.z, saturate(temp_output_302_0) );
				float4 triplanar289 = TriplanarSampling289( _NormalMap, IN.ase_texcoord9.xyz, IN.ase_normal, _NFallOff, ( appendResult297 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack461 = UnpackNormalScale( triplanar289, ( temp_output_302_0 * -1.4 ) );
				unpack461.z = lerp( 1, unpack461.z, saturate(( temp_output_302_0 * -1.4 )) );
				float3 appendResult464 = (float3(-unpack461.x , unpack461.y , unpack461.z));
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 break321 = ( appendResult258 * (computeScreenPos260).xy );
				float temp_output_320_0 = (computeScreenPos260).w;
				float4 appendResult322 = (float4(break321.x , break321.y , (computeScreenPos260).z , temp_output_320_0));
				float2 appendResult327 = (float2(_SSOffX , _SSOffY));
				float2 texCoord329 = IN.ase_texcoord8.xyz.xy * appendResult258 + appendResult327;
				float2 appendResult333 = (float2(_SSAnchorX , _SSAnchorY));
				float cos330 = cos( radians( _PatternRotator ) );
				float sin330 = sin( radians( _PatternRotator ) );
				float2 rotator330 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord329, 0.0 , 0.0 ) ).xy - appendResult333 , float2x2( cos330 , -sin330 , sin330 , cos330 )) + appendResult333;
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator330, 0.0 , 0.0 ) ):( ( ( appendResult322 / temp_output_320_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) ));
				
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal68 = RF_NewObjectNormal29;
				float3 worldNormal68 = float3(dot(tanToWorld0,tanNormal68), dot(tanToWorld1,tanNormal68), dot(tanToWorld2,tanNormal68));
				float fresnelNdotV62 = dot( normalize( worldNormal68 ), WorldViewDirection );
				float fresnelNode62 = ( _RimLightBias + _RimLightScale * pow( max( 1.0 - fresnelNdotV62 , 0.0001 ), _RimLightPower ) );
				float4 RF_BaseTexture23 = (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) ));
				float RF_One15 = 1.0;
				float4 temp_cast_9 = (RF_One15).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord8.xyz.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 temp_output_161_0 = ( ( 1.0 - _AOIntensity ) + tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap ) );
				float4 RF_AbsoluteAO242 = temp_output_161_0;
				float4 RF_RimLightResult66 = ( ( _RimLightColor * (( _RimLightInvert )?( ( 1.0 - fresnelNode62 ) ):( fresnelNode62 )) * _RimLightIntensity * RF_BaseTexture23 ) * _RimSwitch * (( _AffectAO_Rim )?( RF_AbsoluteAO242 ):( temp_cast_9 )) );
				float RF_Zero16 = 0.0;
				float4 temp_cast_10 = (RF_Zero16).xxxx;
				float3 worldRefl95 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, RF_NewObjectNormal29 ), dot( tanToWorld1, RF_NewObjectNormal29 ), dot( tanToWorld2, RF_NewObjectNormal29 ) ) ) );
				float3 VertexPos5_g150 = worldRefl95;
				float3 appendResult10_g150 = (float3(0.0 , VertexPos5_g150.y , 0.0));
				float3 VertexPosRotationAxis11_g150 = appendResult10_g150;
				float3 break13_g150 = VertexPos5_g150;
				float3 appendResult14_g150 = (float3(break13_g150.x , 0.0 , break13_g150.z));
				float3 VertexPosOtherAxis12_g150 = appendResult14_g150;
				float Angle3_g150 = radians( _CubeMapRotate );
				float3 appendResult113 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal86 = RF_NewObjectNormal29;
				float3 worldNormal86 = float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86));
				float fresnelNdotV80 = dot( normalize( worldNormal86 ), WorldViewDirection );
				float fresnelNode80 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV80 , 0.0001 ), _RefFresnelPower ) );
				float RF_RefFresnelResult84 = ( saturate( (( _RefFresnelInvert )?( fresnelNode80 ):( ( 1.0 - fresnelNode80 ) )) ) * _FresnelSwitch );
				int RF_RefFresnelSwitch87 = _FresnelSwitch;
				float4 temp_cast_11 = (RF_One15).xxxx;
				float4 RF_Reflect107 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g150 + ( VertexPosOtherAxis12_g150 * cos( Angle3_g150 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g150 ) * sin( Angle3_g150 ) ) ) + appendResult113 ) ) * _ReflectColor ) * ( 1.0 - RF_RefFresnelResult84 ) * ( ( _ReflectionMultiplier * RF_RefFresnelSwitch87 ) + RF_One15 ) * (( _AffectAO )?( RF_AbsoluteAO242 ):( temp_cast_11 )) ) ):( temp_cast_10 ));
				float4 temp_cast_12 = (RF_Zero16).xxxx;
				float2 uv_EmissionMap = IN.ase_texcoord8.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float4 tex2DNode134 = tex2D( _EmissionMap, uv_EmissionMap );
				float4 temp_output_144_0 = ( 1.0 - tex2DNode134 );
				float4 RF_EmissionResult137 = (( _EmissionToggle )?( ( _EmissionColor * (( _EmissionInvert )?( temp_output_144_0 ):( tex2DNode134 )) * ( _EmissionIntensity * _EmissionMultiplier ) ) ):( temp_cast_12 ));
				float4 temp_cast_13 = (RF_Zero16).xxxx;
				float ifLocalVar352 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar352 = _SpecularOut;
				else
				ifLocalVar352 = _SpecularIn;
				float3 temp_cast_14 = (ifLocalVar352).xxx;
				float3 temp_cast_15 = (_SpecularOut).xxx;
				float ifLocalVar359 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar359 = _SpecMax;
				else
				ifLocalVar359 = _SpecMin;
				float3 tanNormal342 = RF_NewObjectNormal29;
				float3 worldNormal342 = normalize( float3(dot(tanToWorld0,tanNormal342), dot(tanToWorld1,tanNormal342), dot(tanToWorld2,tanNormal342)) );
				float3 normalizeResult343 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float dotResult348 = dot( ( worldNormal342 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult343 );
				float RF_LightNormal349 = dotResult348;
				float smoothstepResult360 = smoothstep( ifLocalVar359 , _SpecMax , pow( RF_LightNormal349 , _BGloss ));
				float temp_output_2_0_g152 = smoothstepResult360;
				float temp_output_362_0 = saturate( ( temp_output_2_0_g152 * temp_output_2_0_g152 ) );
				float3 temp_cast_16 = (temp_output_362_0).xxx;
				float3 temp_cast_17 = (temp_output_362_0).xxx;
				float3 gammaToLinear363 = Gamma22ToLinear( temp_cast_17 );
				float3 temp_cast_18 = (temp_output_362_0).xxx;
				float3 temp_cast_19 = (temp_output_362_0).xxx;
				float3 temp_cast_20 = (temp_output_362_0).xxx;
				float3 linearToGamma364 = LinearToGamma22( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_362_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch367 = gammaToLinear363;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch367 = temp_cast_18;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch367 = linearToGamma364;
				#else
				float3 staticSwitch367 = gammaToLinear363;
				#endif
				float3 smoothstepResult353 = smoothstep( temp_cast_14 , temp_cast_15 , ( 1.0 - sqrt( staticSwitch367 ) ));
				float3 saferPower171 = abs( smoothstepResult353 );
				float3 temp_cast_22 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_23 = (0.0).xxx;
				float3 temp_cast_24 = (_SpecularSaturation).xxx;
				float3 clampResult175 = clamp( ( 1.0 - pow( saferPower171 , temp_cast_22 ) ) , temp_cast_23 , temp_cast_24 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 uv_SpecularMap = IN.ase_texcoord8.xyz.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode195 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_26 = (RF_One15).xxxx;
				float4 RF_Specular181 = (( _SpecularSwitch )?( ( ( float4( clampResult175 , 0.0 ) * _SpecColor * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode195 ) ):( tex2DNode195 )) * (( _AffectAO_Spec )?( RF_AbsoluteAO242 ):( temp_cast_26 )) ) * _SpecularIntensity ) ):( temp_cast_13 ));
				
				float3 temp_cast_28 = (RF_Zero16).xxx;
				
				int RF_AOToggle233 = _AOToggle;
				float4 RF_AOResult154 = ( temp_output_161_0 + ( 1.0 - RF_AOToggle233 ) );
				
				float2 uv_TransmissionMap = IN.ase_texcoord8.xyz.xy * _TransmissionMap_ST.xy + _TransmissionMap_ST.zw;
				float4 tex2DNode479 = tex2D( _TransmissionMap, uv_TransmissionMap );
				
				float2 uv_TranslucencyMap = IN.ase_texcoord8.xyz.xy * _TranslucencyMap_ST.xy + _TranslucencyMap_ST.zw;
				float4 tex2DNode480 = tex2D( _TranslucencyMap, uv_TranslucencyMap );
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float3 Normal = RF_NewObjectNormal29;
				float3 Emission = ( RF_RimLightResult66 + RF_Reflect107 + RF_EmissionResult137 + RF_Specular181 ).rgb;
				float3 Specular = temp_cast_28;
				float Metallic = 0;
				float Smoothness = RF_Zero16;
				float Occlusion = RF_AOResult154.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = (( _TransmissionToggle )?( ( _TransmissionColor * (( _TransmissInvert )?( ( 1.0 - tex2DNode479.rgb ) ):( tex2DNode479.rgb )) ) ):( float3( 0,0,0 ) ));
				float3 Translucency = (( _TranslucencyToggle )?( ( _TranslucencyColor * (( _TranslucencyInvert )?( ( 1.0 - tex2DNode480.rgb ) ):( tex2DNode480.rgb )) ) ):( float3( 0,0,0 ) ));

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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
			
			inline float4 TriplanarSampling289( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord6.xyz, IN.ase_normal, _FallOff, ( appendResult285 / 4.8 ), 1.0, 0 );
				float4 RF_MainDiffuse22 = ( _BaseColor * (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) )) );
				
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float2 temp_output_1_0_g153 = float2( 0,0 );
				float dotResult4_g153 = dot( temp_output_1_0_g153 , temp_output_1_0_g153 );
				float3 appendResult10_g153 = (float3((temp_output_1_0_g153).x , (temp_output_1_0_g153).y , sqrt( ( 1.0 - saturate( dotResult4_g153 ) ) )));
				float3 normalizeResult12_g153 = normalize( appendResult10_g153 );
				float2 appendResult297 = (float2(_NTileX , _NTileY));
				float2 appendResult298 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord292 = IN.ase_texcoord4.xyz.xy * appendResult297 + appendResult298;
				float temp_output_302_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack290 = UnpackNormalScale( tex2D( _NormalMap, texCoord292 ), temp_output_302_0 );
				unpack290.z = lerp( 1, unpack290.z, saturate(temp_output_302_0) );
				float4 triplanar289 = TriplanarSampling289( _NormalMap, IN.ase_texcoord6.xyz, IN.ase_normal, _NFallOff, ( appendResult297 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack461 = UnpackNormalScale( triplanar289, ( temp_output_302_0 * -1.4 ) );
				unpack461.z = lerp( 1, unpack461.z, saturate(( temp_output_302_0 * -1.4 )) );
				float3 appendResult464 = (float3(-unpack461.x , unpack461.y , unpack461.z));
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 break321 = ( appendResult258 * (computeScreenPos260).xy );
				float temp_output_320_0 = (computeScreenPos260).w;
				float4 appendResult322 = (float4(break321.x , break321.y , (computeScreenPos260).z , temp_output_320_0));
				float2 appendResult327 = (float2(_SSOffX , _SSOffY));
				float2 texCoord329 = IN.ase_texcoord4.xyz.xy * appendResult258 + appendResult327;
				float2 appendResult333 = (float2(_SSAnchorX , _SSAnchorY));
				float cos330 = cos( radians( _PatternRotator ) );
				float sin330 = sin( radians( _PatternRotator ) );
				float2 rotator330 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord329, 0.0 , 0.0 ) ).xy - appendResult333 , float2x2( cos330 , -sin330 , sin330 , cos330 )) + appendResult333;
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator330, 0.0 , 0.0 ) ):( ( ( appendResult322 / temp_output_320_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) ));
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal68 = RF_NewObjectNormal29;
				float3 worldNormal68 = float3(dot(tanToWorld0,tanNormal68), dot(tanToWorld1,tanNormal68), dot(tanToWorld2,tanNormal68));
				float fresnelNdotV62 = dot( normalize( worldNormal68 ), ase_worldViewDir );
				float fresnelNode62 = ( _RimLightBias + _RimLightScale * pow( max( 1.0 - fresnelNdotV62 , 0.0001 ), _RimLightPower ) );
				float4 RF_BaseTexture23 = (( _TriplanarMap )?( triplanar274 ):( tex2D( _BaseMap, texCoord282 ) ));
				float RF_One15 = 1.0;
				float4 temp_cast_9 = (RF_One15).xxxx;
				float2 uv_AmbientOcclusionMap = IN.ase_texcoord4.xyz.xy * _AmbientOcclusionMap_ST.xy + _AmbientOcclusionMap_ST.zw;
				float4 temp_output_161_0 = ( ( 1.0 - _AOIntensity ) + tex2D( _AmbientOcclusionMap, uv_AmbientOcclusionMap ) );
				float4 RF_AbsoluteAO242 = temp_output_161_0;
				float4 RF_RimLightResult66 = ( ( _RimLightColor * (( _RimLightInvert )?( ( 1.0 - fresnelNode62 ) ):( fresnelNode62 )) * _RimLightIntensity * RF_BaseTexture23 ) * _RimSwitch * (( _AffectAO_Rim )?( RF_AbsoluteAO242 ):( temp_cast_9 )) );
				float RF_Zero16 = 0.0;
				float4 temp_cast_10 = (RF_Zero16).xxxx;
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl95 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, RF_NewObjectNormal29 ), dot( tanToWorld1, RF_NewObjectNormal29 ), dot( tanToWorld2, RF_NewObjectNormal29 ) ) ) );
				float3 VertexPos5_g150 = worldRefl95;
				float3 appendResult10_g150 = (float3(0.0 , VertexPos5_g150.y , 0.0));
				float3 VertexPosRotationAxis11_g150 = appendResult10_g150;
				float3 break13_g150 = VertexPos5_g150;
				float3 appendResult14_g150 = (float3(break13_g150.x , 0.0 , break13_g150.z));
				float3 VertexPosOtherAxis12_g150 = appendResult14_g150;
				float Angle3_g150 = radians( _CubeMapRotate );
				float3 appendResult113 = (float3(_CMXPos , -_CMYPos , _CMZPos));
				float3 tanNormal86 = RF_NewObjectNormal29;
				float3 worldNormal86 = float3(dot(tanToWorld0,tanNormal86), dot(tanToWorld1,tanNormal86), dot(tanToWorld2,tanNormal86));
				float fresnelNdotV80 = dot( normalize( worldNormal86 ), ase_worldViewDir );
				float fresnelNode80 = ( _RefFresnelBias + _RefFresnelScale * pow( max( 1.0 - fresnelNdotV80 , 0.0001 ), _RefFresnelPower ) );
				float RF_RefFresnelResult84 = ( saturate( (( _RefFresnelInvert )?( fresnelNode80 ):( ( 1.0 - fresnelNode80 ) )) ) * _FresnelSwitch );
				int RF_RefFresnelSwitch87 = _FresnelSwitch;
				float4 temp_cast_11 = (RF_One15).xxxx;
				float4 RF_Reflect107 = (( _Reflect )?( ( _ReflectionStrength * ( texCUBE( _ReflectMap, ( ( VertexPosRotationAxis11_g150 + ( VertexPosOtherAxis12_g150 * cos( Angle3_g150 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis12_g150 ) * sin( Angle3_g150 ) ) ) + appendResult113 ) ) * _ReflectColor ) * ( 1.0 - RF_RefFresnelResult84 ) * ( ( _ReflectionMultiplier * RF_RefFresnelSwitch87 ) + RF_One15 ) * (( _AffectAO )?( RF_AbsoluteAO242 ):( temp_cast_11 )) ) ):( temp_cast_10 ));
				float4 temp_cast_12 = (RF_Zero16).xxxx;
				float2 uv_EmissionMap = IN.ase_texcoord4.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float4 tex2DNode134 = tex2D( _EmissionMap, uv_EmissionMap );
				float4 temp_output_144_0 = ( 1.0 - tex2DNode134 );
				float4 RF_EmissionResult137 = (( _EmissionToggle )?( ( _EmissionColor * (( _EmissionInvert )?( temp_output_144_0 ):( tex2DNode134 )) * ( _EmissionIntensity * _EmissionMultiplier ) ) ):( temp_cast_12 ));
				float4 temp_cast_13 = (RF_Zero16).xxxx;
				float ifLocalVar352 = 0;
				if( _SpecularIn >= _SpecularOut )
				ifLocalVar352 = _SpecularOut;
				else
				ifLocalVar352 = _SpecularIn;
				float3 temp_cast_14 = (ifLocalVar352).xxx;
				float3 temp_cast_15 = (_SpecularOut).xxx;
				float ifLocalVar359 = 0;
				if( _SpecMin >= _SpecMax )
				ifLocalVar359 = _SpecMax;
				else
				ifLocalVar359 = _SpecMin;
				float3 tanNormal342 = RF_NewObjectNormal29;
				float3 worldNormal342 = normalize( float3(dot(tanToWorld0,tanNormal342), dot(tanToWorld1,tanNormal342), dot(tanToWorld2,tanNormal342)) );
				float3 normalizeResult343 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float dotResult348 = dot( ( worldNormal342 * (0.75 + (_SpecularNormalIntensity - 0.0) * (1.0 - 0.75) / (1.0 - 0.0)) ) , normalizeResult343 );
				float RF_LightNormal349 = dotResult348;
				float smoothstepResult360 = smoothstep( ifLocalVar359 , _SpecMax , pow( RF_LightNormal349 , _BGloss ));
				float temp_output_2_0_g152 = smoothstepResult360;
				float temp_output_362_0 = saturate( ( temp_output_2_0_g152 * temp_output_2_0_g152 ) );
				float3 temp_cast_16 = (temp_output_362_0).xxx;
				float3 temp_cast_17 = (temp_output_362_0).xxx;
				float3 gammaToLinear363 = Gamma22ToLinear( temp_cast_17 );
				float3 temp_cast_18 = (temp_output_362_0).xxx;
				float3 temp_cast_19 = (temp_output_362_0).xxx;
				float3 temp_cast_20 = (temp_output_362_0).xxx;
				float3 linearToGamma364 = LinearToGamma22( temp_cast_20 );
				float3 temp_cast_21 = (temp_output_362_0).xxx;
				#if defined( _SPECTYPE_LINEAR )
				float3 staticSwitch367 = gammaToLinear363;
				#elif defined( _SPECTYPE_NORMAL )
				float3 staticSwitch367 = temp_cast_18;
				#elif defined( _SPECTYPE_GAMMA )
				float3 staticSwitch367 = linearToGamma364;
				#else
				float3 staticSwitch367 = gammaToLinear363;
				#endif
				float3 smoothstepResult353 = smoothstep( temp_cast_14 , temp_cast_15 , ( 1.0 - sqrt( staticSwitch367 ) ));
				float3 saferPower171 = abs( smoothstepResult353 );
				float3 temp_cast_22 = ((0.01 + (_Softness - 0.0) * (3.0 - 0.01) / (3.0 - 0.0))).xxx;
				float3 temp_cast_23 = (0.0).xxx;
				float3 temp_cast_24 = (_SpecularSaturation).xxx;
				float3 clampResult175 = clamp( ( 1.0 - pow( saferPower171 , temp_cast_22 ) ) , temp_cast_23 , temp_cast_24 );
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 uv_SpecularMap = IN.ase_texcoord4.xyz.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
				float4 tex2DNode195 = tex2D( _SpecularMap, uv_SpecularMap );
				float4 temp_cast_26 = (RF_One15).xxxx;
				float4 RF_Specular181 = (( _SpecularSwitch )?( ( ( float4( clampResult175 , 0.0 ) * _SpecColor * ase_lightColor * (( _SpecularInvert )?( ( 1.0 - tex2DNode195 ) ):( tex2DNode195 )) * (( _AffectAO_Spec )?( RF_AbsoluteAO242 ):( temp_cast_26 )) ) * _SpecularIntensity ) ):( temp_cast_13 ));
				

				float3 BaseColor = RF_MainDiffuse22.rgb;
				float3 Emission = ( RF_RimLightResult66 + RF_Reflect107 + RF_EmissionResult137 + RF_Specular181 ).rgb;
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
				float4 triplanar274 = TriplanarSampling274( _BaseMap, IN.ase_texcoord4.xyz, IN.ase_normal, _FallOff, ( appendResult285 / 4.8 ), 1.0, 0 );
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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


			inline float4 TriplanarSampling289( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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

				float2 temp_output_1_0_g153 = float2( 0,0 );
				float dotResult4_g153 = dot( temp_output_1_0_g153 , temp_output_1_0_g153 );
				float3 appendResult10_g153 = (float3((temp_output_1_0_g153).x , (temp_output_1_0_g153).y , sqrt( ( 1.0 - saturate( dotResult4_g153 ) ) )));
				float3 normalizeResult12_g153 = normalize( appendResult10_g153 );
				float2 appendResult297 = (float2(_NTileX , _NTileY));
				float2 appendResult298 = (float2(_NOffsetX , _NOffsetY));
				float2 texCoord292 = IN.ase_texcoord5.xy * appendResult297 + appendResult298;
				float temp_output_302_0 = ( _NormalScale * _NormalMultiplier );
				float3 unpack290 = UnpackNormalScale( tex2D( _NormalMap, texCoord292 ), temp_output_302_0 );
				unpack290.z = lerp( 1, unpack290.z, saturate(temp_output_302_0) );
				float4 triplanar289 = TriplanarSampling289( _NormalMap, IN.ase_texcoord6.xyz, IN.ase_normal, _NFallOff, ( appendResult297 / float2( 4,4 ) ), 1.0, 0 );
				float3 unpack461 = UnpackNormalScale( triplanar289, ( temp_output_302_0 * -1.4 ) );
				unpack461.z = lerp( 1, unpack461.z, saturate(( temp_output_302_0 * -1.4 )) );
				float3 appendResult464 = (float3(-unpack461.x , unpack461.y , unpack461.z));
				float2 appendResult258 = (float2(_SSTileX , _SSTileY));
				float4 unityObjectToClipPos262 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos260 = ComputeScreenPos( unityObjectToClipPos262 );
				float2 break321 = ( appendResult258 * (computeScreenPos260).xy );
				float temp_output_320_0 = (computeScreenPos260).w;
				float4 appendResult322 = (float4(break321.x , break321.y , (computeScreenPos260).z , temp_output_320_0));
				float2 appendResult327 = (float2(_SSOffX , _SSOffY));
				float2 texCoord329 = IN.ase_texcoord5.xy * appendResult258 + appendResult327;
				float2 appendResult333 = (float2(_SSAnchorX , _SSAnchorY));
				float cos330 = cos( radians( _PatternRotator ) );
				float sin330 = sin( radians( _PatternRotator ) );
				float2 rotator330 = mul( ( computeScreenPos260 * _SSSize * float4( texCoord329, 0.0 , 0.0 ) ).xy - appendResult333 , float2x2( cos330 , -sin330 , sin330 , cos330 )) + appendResult333;
				float3 unpack259 = UnpackNormalScale( tex2D( _BluricRefractionPattern, (( _ScreenSpace )?( float4( rotator330, 0.0 , 0.0 ) ):( ( ( appendResult322 / temp_output_320_0 ) * ( _SSSize * 2.0 ) ) )).xy ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack259.z = lerp( 1, unpack259.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 RF_BumpForSmooth248 = unpack259;
				float3 RF_NewObjectNormal29 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) , RF_BumpForSmooth248 ) ):( (( _Normal )?( (( _TriplanarNMap )?( appendResult464 ):( unpack290 )) ):( normalizeResult12_g153 )) ));
				

				float3 Normal = RF_NewObjectNormal29;
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
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define _SPECULAR_SETUP 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
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
			float4 _TranslucencyMap_ST;
			float4 _ReflectColor;
			float4 _BaseColor;
			float4 _EmissionMap_ST;
			float4 _SpecColor;
			float4 _SpecularMap_ST;
			float4 _RimLightColor;
			float4 _EmissionColor;
			float4 _AmbientOcclusionMap_ST;
			float4 _TransmissionMap_ST;
			float3 _TransmissionColor;
			float3 _TranslucencyColor;
			float _ReflectionStrength;
			float _EmissionToggle;
			float _AffectAO;
			float _ReflectionMultiplier;
			int _FresnelSwitch;
			float _RefFresnelPower;
			float _RefFresnelScale;
			float _RefFresnelInvert;
			float _Reflect;
			float _AOIntensity;
			float _CMZPos;
			float _CMXPos;
			float _CubeMapRotate;
			float _RefFresnelBias;
			float _CMYPos;
			float _EmissionMultiplier;
			float _EmissionIntensity;
			float _TranslucencyToggle;
			float _TransmissInvert;
			float _TransmissionToggle;
			int _AOToggle;
			float _SpecularIntensity;
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
			float _AffectAO_Rim;
			float _EmissionInvert;
			int _RimSwitch;
			float _RimLightIntensity;
			float _RimLightPower;
			float _OffsetY;
			float _OffsetX;
			float _TileY;
			float _TileX;
			float _TriplanarMap;
			int _CheckBase;
			int _CheckDef;
			int _TranslucencySettings;
			float _TrnsShadow;
			float _TrnsScattering;
			float _TrnsAmbient;
			float _TrnsDirect;
			float _TrnsNormDistortion;
			float _TrnsStrength;
			float _TrnsmisShadow;
			int _RefFresnelSwitch;
			int _CubeMapExtras;
			int _FresnelFold;
			int _SpecularExtras;
			float _FallOff;
			float _SSBluricTransparent;
			float _Normal;
			float _TriplanarNMap;
			float _RimLightScale;
			float _RimLightBias;
			float _RimLightInvert;
			float _PatternHeight;
			float _PatternRotator;
			float _SSAnchorY;
			float _SSAnchorX;
			float _SSOffY;
			float _SSOffX;
			float _TranslucencyInvert;
			float _SSSize;
			float _SSTileX;
			float _ScreenSpace;
			float _NFallOff;
			float _NormalMultiplier;
			float _NormalScale;
			float _NOffsetY;
			float _NOffsetX;
			float _NTileY;
			float _NTileX;
			float _SSTileY;
			int _SpecToggle;
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
	
	CustomEditor "BSurfaceEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19600
Node;AmplifyShaderEditor.CommentaryNode;475;-2656,-1824;Inherit;False;356;642.6666;Transmission-Translucency;7;468;469;470;471;472;473;474;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;243;-1904,-3008;Inherit;False;419.3334;396.6669;Emission Final Comp ;5;187;142;70;116;115;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-3216,-1968;Inherit;False;533.5081;790.8281;Local Vars;17;496;368;486;233;218;17;16;15;226;224;225;221;230;217;12;13;14;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-4192,-2704;Inherit;False;1565.623;566.3124;Base Settings;18;23;22;281;21;20;19;277;282;280;288;285;283;284;286;287;274;436;437;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-6656,-3504;Inherit;False;2794.22;774.9243;Normals;30;28;31;300;32;265;266;264;30;29;461;289;408;290;291;383;301;292;293;294;298;295;296;297;302;33;299;464;465;466;467;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;26;-3824,-3504;Inherit;False;674.9019;304.9238;Normal Light Direction;4;35;41;40;42;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;27;-3824,-3184;Inherit;False;602.9099;315.528;Normal View Direction;4;39;38;37;36;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;57;-6656,-1888;Inherit;False;1730.602;719.5399;Fresnel Settings;20;69;66;272;273;271;65;63;229;73;67;72;64;71;62;61;60;59;58;68;74;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;75;-6656,-1136;Inherit;False;1732.258;672.6719;Fresnel Settings;14;87;84;81;83;228;82;85;79;78;77;80;76;117;86;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;88;-4896,-1136;Inherit;False;2303.085;754.7138;Reflection Map;28;107;106;96;97;236;240;99;98;104;114;103;92;100;94;101;112;113;110;111;109;93;91;89;90;95;108;102;105;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;133;-4896,-1888;Inherit;False;1664.324;717.2957;Emission Settings;17;313;312;311;310;305;144;143;137;139;140;136;135;134;141;315;316;317;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;150;-3120,-3504;Inherit;False;959.7991;448.7336;AO Settings;9;242;154;241;161;151;152;235;234;162;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;163;-6656,-4432;Inherit;False;3643.588;903.8438;Specular Setup;39;353;171;169;170;168;167;352;366;355;185;195;367;364;363;362;361;360;365;359;358;357;356;181;180;173;174;175;172;176;269;270;268;177;197;196;178;179;350;186;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;244;-6656,-2704;Inherit;False;2431.518;786.3904;Screen Space Bump Map Settings;32;336;263;319;320;325;260;262;261;335;334;258;327;330;329;326;328;254;253;332;331;333;324;323;322;321;251;318;249;247;248;259;337;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;338;-2976,-4432;Inherit;False;1019;653.2667;Light Specular Direction;11;349;348;347;346;345;344;343;342;341;340;339;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-3136,-1760;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3136,-1840;Inherit;False;Constant;_Zero;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-3136,-1920;Inherit;False;Constant;_One;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;105;-3632,-768;Inherit;False;84;RF_RefFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;102;-3600,-576;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;134;-4880,-1584;Inherit;True;Property;_EmissionMap;Emission Map;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;136;-3872,-1728;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;-3904,-1808;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;139;-3696,-1776;Inherit;False;Property;_EmissionToggle;Emission Toggle;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;143;-4112,-1600;Inherit;False;Property;_EmissionInvert;Emission Invert;40;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;144;-4576,-1520;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-4448,-1456;Inherit;False;Constant;_EOldMin;E Old Min;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-4448,-1392;Inherit;False;Constant;_EOldMax;E Old Max;75;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-4448,-1328;Inherit;False;Constant;_ENewMin;E New Min;75;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-4480,-1264;Inherit;False;Constant;_ENewMax;E New Max;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;316;-4272,-1680;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;135;-4128,-1824;Inherit;False;Property;_EmissionColor;Emission Color;1;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;315;-4560,-1648;Inherit;False;Property;_EmissionMultiplier;Emission Multiplier;82;0;Create;True;0;0;0;True;0;False;1;1;1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-4560,-1728;Inherit;False;Property;_EmissionIntensity;Emission Intensity;39;0;Create;True;0;0;0;False;0;False;0.5;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;305;-4304,-1424;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;317;-4112,-1424;Inherit;False;150;100;New Note;;1,1,1,1;Farklı bir negatif için Remap'e bak;0;0
Node;AmplifyShaderEditor.RangedFloatNode;287;-4160,-2384;Inherit;False;Property;_OffsetY;OffsetY;77;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;286;-4160,-2464;Inherit;False;Property;_OffsetX;OffsetX;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;284;-4160,-2560;Inherit;False;Property;_TileY;TileY;79;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-4160,-2640;Inherit;False;Property;_TileX;TileX;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;285;-4000,-2624;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;288;-4000,-2432;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;318;-5952,-2192;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-5728,-2288;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;321;-5568,-2288;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;333;-5920,-2320;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;329;-5744,-2592;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;327;-5920,-2512;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;258;-5920,-2656;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PosVertexDataNode;261;-6624,-2112;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;262;-6432,-2112;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;260;-6208,-2112;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;320;-5872,-2032;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;319;-5872,-2112;Inherit;False;False;False;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;253;-6064,-2656;Inherit;False;Property;_SSTileX;SSTileX;56;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-6064,-2592;Inherit;False;Property;_SSTileY;SSTileY;58;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;328;-6064,-2512;Inherit;False;Property;_SSOffX;SSOffX;54;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-6064,-2448;Inherit;False;Property;_SSOffY;SSOffY;60;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;331;-6096,-2336;Inherit;False;Property;_SSAnchorX;SSAnchorX;55;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;332;-6096,-2272;Inherit;False;Property;_SSAnchorY;SSAnchorY;63;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;336;-5520,-2560;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RadiansOpNode;334;-5424,-2384;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-5616,-2384;Inherit;False;Property;_PatternRotator;PatternRotator;84;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;330;-5248,-2512;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-5680,-2464;Inherit;False;Property;_SSSize;SSSize;52;0;Create;True;0;0;0;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;322;-5424,-2288;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;323;-5264,-2288;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;324;-5104,-2288;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;259;-4720,-2288;Inherit;True;Property;_BluricRefractionPattern;Bluric Refraction Pattern;51;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;ae0130e6c3e94ee43b67fef77b52e0e9;ae0130e6c3e94ee43b67fef77b52e0e9;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;337;-5424,-2128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;325;-4944,-2288;Inherit;False;Property;_ScreenSpace;ScreenSpace;83;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;-3728,-3456;Inherit;False;28;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;40;-3792,-3360;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;41;-3536,-3408;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;-3792,-3120;Inherit;False;28;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;37;-3792,-3024;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;38;-3600,-3072;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;280;-3840,-2432;Inherit;True;Property;_BaseMap;Base Map;69;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;282;-3840,-2576;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;277;-3888,-2224;Inherit;False;Property;_FallOff;FallOff;67;0;Create;True;0;0;0;False;0;False;1;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;19;-3568,-2560;Inherit;True;Property;_BaseMapOld;Base Map;3;0;Create;False;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;20;-3232,-2592;Inherit;False;Property;_BaseColor;Base Color;0;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-3008,-2592;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;281;-3232,-2400;Inherit;False;Property;_TriplanarMap;TriplanarMap;71;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;162;-2800,-3440;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;234;-3008,-3152;Inherit;False;233;RF_AOToggle;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.OneMinusNode;235;-2816,-3152;Inherit;False;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-3088,-3440;Inherit;False;Property;_AOIntensity;AOIntensity;35;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;151;-2944,-3360;Inherit;True;Property;_AmbientOcclusionMap;Ambient Occlusion Map;36;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;161;-2640,-3360;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;241;-2512,-3360;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-6624,-1824;Inherit;False;29;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;249;-4912,-2128;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-5200,-2128;Inherit;False;Property;_PatternHeight;PatternHeight;53;0;Create;True;0;0;0;True;0;False;0.1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;68;-6400,-1824;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;58;-6400,-1664;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;59;-6496,-1504;Inherit;False;Property;_RimLightBias;Rim Light Bias;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-6496,-1408;Inherit;False;Property;_RimLightScale;Rim Light Scale;10;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-6496,-1312;Inherit;False;Property;_RimLightPower;Rim Light Power;11;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;62;-6144,-1696;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;71;-5728,-1824;Inherit;False;Property;_RimLightColor;Rim Light Color;7;0;Create;True;0;0;0;False;0;False;0,0,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;64;-5728,-1632;Inherit;False;Property;_RimLightInvert;Rim Light Invert;8;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-5472,-1728;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;67;-5888,-1584;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-5792,-1504;Inherit;False;Property;_RimLightIntensity;Rim Light Intensity;6;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;229;-5728,-1408;Inherit;False;23;RF_BaseTexture;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;63;-5472,-1568;Inherit;False;Property;_RimSwitch;RimSwitch;5;1;[Enum];Create;True;0;2;Rim On;1;Rim Off;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-5312,-1664;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;INT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;271;-5744,-1248;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;-5744,-1328;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;272;-5536,-1328;Inherit;False;Property;_AffectAO_Rim;AffectAO_Rim;66;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;86;-6400,-1072;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;117;-6624,-1072;Inherit;False;29;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;76;-6400,-912;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;80;-6176,-912;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-6496,-752;Inherit;False;Property;_RefFresnelBias;RefFresnelBias;28;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-6496,-656;Inherit;False;Property;_RefFresnelScale;RefFresnelScale;29;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-6496,-560;Inherit;False;Property;_RefFresnelPower;RefFresnelPower;30;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;85;-5920,-848;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;82;-5760,-912;Inherit;False;Property;_RefFresnelInvert;Ref Fresnel Invert;26;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;228;-5536,-912;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-5376,-912;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;81;-5568,-800;Inherit;False;Property;_FresnelSwitch;Fresnel Switch;24;0;Create;True;0;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;-4864,-1072;Inherit;False;29;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldReflectionVector;95;-4640,-1072;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;90;-4416,-1072;Inherit;False;BUDUComputeRotationY;-1;;150;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RadiansOpNode;89;-4576,-896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;91;-4128,-1072;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-4864,-896;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;17;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-4864,-800;Inherit;False;Property;_CMXPos;CM X Pos;20;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-4864,-720;Inherit;False;Property;_CMYPos;CM Y Pos;18;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-4864,-640;Inherit;False;Property;_CMZPos;CM Z Pos;21;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;113;-4352,-752;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;112;-4576,-720;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;101;-3904,-864;Inherit;False;Property;_ReflectColor;Reflect Color;15;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;94;-3968,-1072;Inherit;True;Property;_ReflectMap;Reflect Map;16;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;100;-3680,-1088;Inherit;False;Property;_ReflectionStrength;Reflection Strength;13;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;-3616,-1008;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-3968,-656;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;14;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;114;-3904,-560;Inherit;False;87;RF_RefFresnelSwitch;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-3568,-688;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;98;-3408,-768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;99;-3376,-656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;240;-3392,-544;Inherit;False;Property;_AffectAO;AffectAO;50;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;236;-3600,-480;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;97;-3232,-1088;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;96;-3200,-1008;Inherit;False;5;5;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;106;-3040,-1040;Inherit;False;Property;_Reflect;Reflect;12;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;217;-3152,-1664;Inherit;False;Property;_SpecToggle;SpecToggle;41;0;Create;True;0;0;0;True;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;230;-3136,-1584;Inherit;False;Property;_AOToggle;AOToggle;44;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;221;-3152,-1504;Inherit;False;Property;_SpecularExtras;SpecularExtras;42;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;225;-2912,-1504;Inherit;False;Property;_FresnelFold;FresnelFold;43;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;224;-3152,-1424;Inherit;False;Property;_CubeMapExtras;CubeMapExtras;48;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;226;-2928,-1424;Inherit;False;Property;_RefFresnelSwitch;RefFresnelSwitch;49;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TriplanarNode;274;-3600,-2352;Inherit;True;Spherical;Object;False;TriplanarTexture;_TriplanarTexture;white;0;None;Mid Texture 0;_MidTexture0;white;1;None;Bot Texture 0;_BotTexture0;white;0;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;2,2;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;436;-4000,-2320;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;437;-4160,-2272;Inherit;False;Constant;_Coeff;Coeff;84;0;Create;True;0;0;0;False;0;False;4.8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;154;-2384,-3360;Inherit;False;RF_AOResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;242;-2384,-3264;Inherit;False;RF_AbsoluteAO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-3408,-3408;Float;False;RF_NormalLightDir;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-3472,-3072;Float;False;RF_NormalViewDir;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-2848,-2592;Inherit;False;RF_MainDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;23;-2848,-2400;Inherit;False;RF_BaseTexture;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-2928,-1920;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-2928,-1840;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-2928,-1760;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;218;-2928,-1664;Inherit;False;RF_SpecToggleRef;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;233;-2928,-1584;Inherit;False;RF_AOToggle;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;-3472,-1776;Inherit;False;RF_EmissionResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;107;-2816,-1040;Inherit;False;RF_Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-5152,-1664;Inherit;False;RF_RimLightResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;69;-5152,-1568;Inherit;False;RF_RimLightSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;84;-5216,-912;Inherit;False;RF_RefFresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-5216,-800;Inherit;False;RF_RefFresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;248;-4432,-2288;Inherit;False;RF_BumpForSmooth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;468;-2608,-1776;Inherit;False;Property;_TrnsmisShadow;Trnsmis Shadow;86;0;Create;True;0;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;-2608,-1696;Inherit;False;Property;_TrnsStrength;Trns Strength;87;0;Create;True;0;0;0;True;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;470;-2608,-1616;Inherit;False;Property;_TrnsNormDistortion;Trns Norm Distortion;88;0;Create;True;0;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;471;-2608,-1456;Inherit;False;Property;_TrnsDirect;Trns Direct;89;0;Create;True;0;0;0;True;0;False;0.9;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;-2608,-1376;Inherit;False;Property;_TrnsAmbient;Trns Ambient;90;0;Create;True;0;0;0;True;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;473;-2608,-1536;Inherit;False;Property;_TrnsScattering;Trns Scattering;85;0;Create;True;0;0;0;True;0;False;2;0;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;474;-2608,-1296;Inherit;False;Property;_TrnsShadow;Trns Shadow;91;0;Create;True;0;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;486;-3184,-1344;Inherit;False;Property;_TranslucencySettings;TranslucencySettings;47;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-1808,-2704;Inherit;False;181;RF_Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;116;-1616,-2896;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;115;-1808,-2864;Inherit;False;107;RF_Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;70;-1872,-2944;Inherit;False;66;RF_RimLightResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;142;-1872,-2784;Inherit;False;137;RF_EmissionResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;219;-1392,-2816;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;-1424,-3008;Inherit;False;22;RF_MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-1456,-2928;Inherit;False;29;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-1424,-2736;Inherit;False;154;RF_AOResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-1632,-2176;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;489;-1456,-2176;Inherit;False;Property;_TranslucencyToggle;TranslucencyToggle;95;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;482;-1632,-2560;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;490;-1456,-2560;Inherit;False;Property;_TransmissionToggle;TransmissionToggle;96;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;481;-1856,-2560;Inherit;False;Property;_TransmissionColor;TransmissionColor;94;0;Create;True;0;0;0;True;1;HDR;False;1,1,1,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;483;-1856,-2176;Inherit;False;Property;_TranslucencyColor;TranslucencyColor;97;1;[HDR];Create;True;0;0;0;True;0;False;1,1,1,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;479;-2320,-2416;Inherit;True;Property;_TransmissionMap;TransmissionMap;92;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;492;-2016,-2336;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;480;-2304,-2032;Inherit;True;Property;_TranslucencyMap;TranslucencyMap;93;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;494;-2016,-1952;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;491;-1856,-2400;Inherit;False;Property;_TransmissInvert;TransmissInvert;98;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;493;-1856,-2016;Inherit;False;Property;_TranslucencyInvert;TranslucencyInvert;99;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-6192,-2816;Inherit;False;Property;_NFallOff;NFallOff;68;0;Create;True;0;0;0;False;0;False;1;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-6592,-3440;Float;False;Property;_NormalScale;Normal Scale;4;0;Create;False;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;302;-6304,-3392;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;297;-6464,-3248;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;296;-6624,-3264;Inherit;False;Property;_NTileX;NTileX;74;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;-6624,-3184;Inherit;False;Property;_NTileY;NTileY;80;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;298;-6464,-3056;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-6624,-3088;Inherit;False;Property;_NOffsetX;NOffsetX;76;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-6624,-3008;Inherit;False;Property;_NOffsetY;NOffsetY;78;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;292;-6304,-3200;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;301;-6592,-3360;Inherit;False;Property;_NormalMultiplier;NormalMultiplier;81;0;Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;383;-6288,-2944;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;4,4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;290;-5760,-3328;Inherit;True;Property;_BaseMapOld1;Base Map;3;0;Create;False;0;0;0;True;0;False;291;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.UnpackScaleNormalNode;461;-5456,-2960;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;30;-4976,-3168;Inherit;False;Property;_Normal;Normal;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;264;-4752,-3104;Inherit;False;1;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;266;-4528,-3168;Inherit;False;Property;_SSBluricTransparent;SS Bluric Transparent;64;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;265;-4976,-3056;Inherit;False;248;RF_BumpForSmooth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;32;-5232,-3200;Inherit;False;Normal Reconstruct Z;-1;;153;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;300;-5200,-3104;Inherit;False;Property;_TriplanarNMap;TriplanarNMap;72;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;31;-4288,-3280;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;465;-5248,-2992;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;466;-4912,-2976;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;464;-5040,-2944;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;467;-5200,-2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;289;-5824,-2960;Inherit;True;Spherical;Object;False;Top Texture 0;_TopTexture0;white;0;None;Mid Texture 1;_MidTexture1;white;1;None;Bot Texture 1;_BotTexture1;white;0;None;Triplanar Sampler;World;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;2,2;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;291;-6080,-3104;Inherit;True;Property;_NormalMap;NormalMap;70;2;[NoScaleOffset];[Normal];Create;True;0;0;0;True;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;28;-4096,-3280;Float;False;RF_NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-4096,-3056;Inherit;False;RF_NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;408;-6144,-3440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;496;-2896,-1264;Inherit;False;Property;_CheckDef;CheckDef;45;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;368;-2912,-1344;Inherit;False;Property;_CheckBase;CheckBase;46;0;Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;339;-2480,-4192;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;343;-2480,-4032;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;344;-2608,-4032;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;346;-2864,-4096;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;347;-2928,-3936;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;348;-2320,-4064;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;341;-2672,-4368;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.75;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;345;-2896,-4192;Inherit;False;29;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;342;-2672,-4192;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;340;-2960,-4368;Inherit;False;Property;_SpecularNormalIntensity;SpecularNormalIntensity;62;0;Create;True;0;0;0;False;0;False;0.3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;349;-2192,-4064;Inherit;False;RF_LightNormal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;186;-3456,-4224;Inherit;False;Property;_SpecularSwitch;Specular Switch;32;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;350;-3616,-4160;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;179;-3776,-4160;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-3904,-3968;Inherit;False;Property;_SpecularIntensity;Specular Intensity;27;0;Create;True;0;0;0;False;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;196;-4288,-3808;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;197;-4128,-3856;Inherit;False;Property;_SpecularInvert;SpecularInvert;37;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;177;-4096,-4000;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;268;-4128,-3712;Inherit;False;Property;_AffectAO_Spec;AffectAO_Spec;65;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;270;-4320,-3712;Inherit;False;15;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;176;-4128,-4208;Inherit;False;Property;_SpecColor;Spec Color;31;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;172;-4224,-4368;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;175;-4064,-4368;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0.347,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;174;-4416,-4176;Inherit;False;Property;_SpecularSaturation;Specular Saturation;25;0;Create;True;0;0;0;True;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-4352,-4256;Inherit;False;Constant;_SpecularAmbient;Specular Ambient;31;0;Create;True;0;0;0;True;0;False;0;0.3364706;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;-3648,-4256;Inherit;False;16;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;181;-3232,-4224;Inherit;False;RF_Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;356;-6288,-4336;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;357;-6608,-4176;Inherit;False;Property;_SpecMin;SpecMin;59;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;358;-6608,-4080;Inherit;False;Property;_SpecMax;SpecMax;57;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;359;-6320,-4176;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;365;-6608,-4272;Inherit;False;Property;_BGloss;BGloss;22;0;Create;True;0;0;0;False;0;False;1;25;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;360;-6128,-4336;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;361;-5936,-4336;Inherit;False;Square;-1;;152;fea980a1f68019543b2cd91d506986e8;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;362;-5776,-4336;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;363;-5616,-4368;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;364;-5616,-4256;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;367;-5392,-4336;Inherit;False;Property;_SpecType;SpecType;61;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;195;-4576,-3920;Inherit;True;Property;_SpecularMap;Specular Map;33;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;185;-5040,-4368;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SqrtOpNode;355;-5168,-4368;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;366;-6544,-4368;Inherit;False;349;RF_LightNormal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;352;-5152,-4176;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;167;-5472,-4176;Inherit;False;Property;_SpecularIn;Specular In;23;0;Create;True;0;0;0;True;0;False;0.2;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;-5472,-4080;Inherit;False;Property;_SpecularOut;Specular Out;19;0;Create;True;0;0;0;True;0;False;0.8;0.1;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;170;-4928,-4176;Inherit;False;Property;_Softness;Softness;34;0;Create;True;0;0;0;False;0;False;0.001;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;169;-4640,-4176;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0.01;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;171;-4416,-4368;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.56;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;353;-4848,-4368;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;269;-4320,-3616;Inherit;False;242;RF_AbsoluteAO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;-1184,-2944;Float;False;True;-1;2;BSurfaceEditor;0;19;BUDU Shaders/BSurface;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;0;False;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638531041358912987;Workflow;0;638530503819159440;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;638576024544035975;Forward Only;1;0;Transmission;1;638576025411080263;  Transmission Shadow;0.5,True,_TransmissionShadow;638576088163058211;Translucency;1;638576025148573880;  Translucency Strength;1,True,_TRStrength;638576088071820866;  Normal Distortion;0.5,True,_TRNormDist;638576088094157916;  Scattering;2,True,_TRScattering;638576088099024553;  Direct;0.9,True,_TRDirec;638576088103313003;  Ambient;0.1,True,_TRAmbient;638576088107408158;  Shadow;0.5,True,_TRShadow;638576088111675147;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;False;0
WireConnection;136;0;135;0
WireConnection;136;1;143;0
WireConnection;136;2;316;0
WireConnection;139;0;140;0
WireConnection;139;1;136;0
WireConnection;143;0;134;0
WireConnection;143;1;144;0
WireConnection;144;0;134;0
WireConnection;316;0;141;0
WireConnection;316;1;315;0
WireConnection;305;0;144;0
WireConnection;305;1;310;0
WireConnection;305;2;311;0
WireConnection;305;3;312;0
WireConnection;305;4;313;0
WireConnection;285;0;283;0
WireConnection;285;1;284;0
WireConnection;288;0;286;0
WireConnection;288;1;287;0
WireConnection;318;0;260;0
WireConnection;251;0;258;0
WireConnection;251;1;318;0
WireConnection;321;0;251;0
WireConnection;333;0;331;0
WireConnection;333;1;332;0
WireConnection;329;0;258;0
WireConnection;329;1;327;0
WireConnection;327;0;328;0
WireConnection;327;1;326;0
WireConnection;258;0;253;0
WireConnection;258;1;254;0
WireConnection;262;0;261;0
WireConnection;260;0;262;0
WireConnection;320;0;260;0
WireConnection;319;0;260;0
WireConnection;336;0;260;0
WireConnection;336;1;263;0
WireConnection;336;2;329;0
WireConnection;334;0;335;0
WireConnection;330;0;336;0
WireConnection;330;1;333;0
WireConnection;330;2;334;0
WireConnection;322;0;321;0
WireConnection;322;1;321;1
WireConnection;322;2;319;0
WireConnection;322;3;320;0
WireConnection;323;0;322;0
WireConnection;323;1;320;0
WireConnection;324;0;323;0
WireConnection;324;1;337;0
WireConnection;259;1;325;0
WireConnection;259;5;249;0
WireConnection;337;0;263;0
WireConnection;325;0;324;0
WireConnection;325;1;330;0
WireConnection;41;0;42;0
WireConnection;41;1;40;0
WireConnection;38;0;36;0
WireConnection;38;1;37;0
WireConnection;282;0;285;0
WireConnection;282;1;288;0
WireConnection;19;0;280;0
WireConnection;19;1;282;0
WireConnection;21;0;20;0
WireConnection;21;1;281;0
WireConnection;281;0;19;0
WireConnection;281;1;274;0
WireConnection;162;0;152;0
WireConnection;235;0;234;0
WireConnection;161;0;162;0
WireConnection;161;1;151;0
WireConnection;241;0;161;0
WireConnection;241;1;235;0
WireConnection;249;0;247;0
WireConnection;68;0;74;0
WireConnection;62;0;68;0
WireConnection;62;4;58;0
WireConnection;62;1;59;0
WireConnection;62;2;60;0
WireConnection;62;3;61;0
WireConnection;64;0;62;0
WireConnection;64;1;67;0
WireConnection;72;0;71;0
WireConnection;72;1;64;0
WireConnection;72;2;73;0
WireConnection;72;3;229;0
WireConnection;67;0;62;0
WireConnection;65;0;72;0
WireConnection;65;1;63;0
WireConnection;65;2;272;0
WireConnection;272;0;273;0
WireConnection;272;1;271;0
WireConnection;86;0;117;0
WireConnection;80;0;86;0
WireConnection;80;4;76;0
WireConnection;80;1;77;0
WireConnection;80;2;78;0
WireConnection;80;3;79;0
WireConnection;85;0;80;0
WireConnection;82;0;85;0
WireConnection;82;1;80;0
WireConnection;228;0;82;0
WireConnection;83;0;228;0
WireConnection;83;1;81;0
WireConnection;95;0;108;0
WireConnection;90;4;95;0
WireConnection;90;2;89;0
WireConnection;89;0;93;0
WireConnection;91;0;90;0
WireConnection;91;1;113;0
WireConnection;113;0;109;0
WireConnection;113;1;112;0
WireConnection;113;2;110;0
WireConnection;112;0;111;0
WireConnection;94;1;91;0
WireConnection;92;0;94;0
WireConnection;92;1;101;0
WireConnection;104;0;103;0
WireConnection;104;1;114;0
WireConnection;98;0;105;0
WireConnection;99;0;104;0
WireConnection;99;1;102;0
WireConnection;240;0;102;0
WireConnection;240;1;236;0
WireConnection;96;0;100;0
WireConnection;96;1;92;0
WireConnection;96;2;98;0
WireConnection;96;3;99;0
WireConnection;96;4;240;0
WireConnection;106;0;97;0
WireConnection;106;1;96;0
WireConnection;274;0;280;0
WireConnection;274;3;436;0
WireConnection;274;4;277;0
WireConnection;436;0;285;0
WireConnection;436;1;437;0
WireConnection;154;0;241;0
WireConnection;242;0;161;0
WireConnection;35;0;41;0
WireConnection;39;0;38;0
WireConnection;22;0;21;0
WireConnection;23;0;281;0
WireConnection;15;0;12;0
WireConnection;16;0;13;0
WireConnection;17;0;14;0
WireConnection;218;0;217;0
WireConnection;233;0;230;0
WireConnection;137;0;139;0
WireConnection;107;0;106;0
WireConnection;66;0;65;0
WireConnection;69;0;63;0
WireConnection;84;0;83;0
WireConnection;87;0;81;0
WireConnection;248;0;259;0
WireConnection;116;0;70;0
WireConnection;116;1;115;0
WireConnection;116;2;142;0
WireConnection;116;3;187;0
WireConnection;484;0;483;0
WireConnection;484;1;493;0
WireConnection;489;1;484;0
WireConnection;482;0;481;0
WireConnection;482;1;491;0
WireConnection;490;1;482;0
WireConnection;492;0;479;5
WireConnection;494;0;480;5
WireConnection;491;0;479;5
WireConnection;491;1;492;0
WireConnection;493;0;480;5
WireConnection;493;1;494;0
WireConnection;302;0;33;0
WireConnection;302;1;301;0
WireConnection;297;0;296;0
WireConnection;297;1;295;0
WireConnection;298;0;294;0
WireConnection;298;1;293;0
WireConnection;292;0;297;0
WireConnection;292;1;298;0
WireConnection;383;0;297;0
WireConnection;290;0;291;0
WireConnection;290;1;292;0
WireConnection;290;5;302;0
WireConnection;461;0;289;0
WireConnection;461;1;408;0
WireConnection;30;0;32;0
WireConnection;30;1;300;0
WireConnection;264;0;30;0
WireConnection;264;1;265;0
WireConnection;266;0;30;0
WireConnection;266;1;264;0
WireConnection;300;0;290;0
WireConnection;300;1;465;0
WireConnection;31;0;266;0
WireConnection;465;0;466;0
WireConnection;466;0;464;0
WireConnection;464;0;467;0
WireConnection;464;1;461;2
WireConnection;464;2;461;3
WireConnection;467;0;461;1
WireConnection;289;0;291;0
WireConnection;289;3;383;0
WireConnection;289;4;299;0
WireConnection;28;0;31;0
WireConnection;29;0;266;0
WireConnection;408;0;302;0
WireConnection;339;0;342;0
WireConnection;339;1;341;0
WireConnection;343;0;344;0
WireConnection;344;0;346;0
WireConnection;344;1;347;0
WireConnection;348;0;339;0
WireConnection;348;1;343;0
WireConnection;341;0;340;0
WireConnection;342;0;345;0
WireConnection;349;0;348;0
WireConnection;186;0;180;0
WireConnection;186;1;350;0
WireConnection;350;0;179;0
WireConnection;350;1;178;0
WireConnection;179;0;175;0
WireConnection;179;1;176;0
WireConnection;179;2;177;0
WireConnection;179;3;197;0
WireConnection;179;4;268;0
WireConnection;196;0;195;0
WireConnection;197;0;195;0
WireConnection;197;1;196;0
WireConnection;268;0;270;0
WireConnection;268;1;269;0
WireConnection;172;0;171;0
WireConnection;175;0;172;0
WireConnection;175;1;173;0
WireConnection;175;2;174;0
WireConnection;181;0;186;0
WireConnection;356;0;366;0
WireConnection;356;1;365;0
WireConnection;359;0;357;0
WireConnection;359;1;358;0
WireConnection;359;2;358;0
WireConnection;359;3;358;0
WireConnection;359;4;357;0
WireConnection;360;0;356;0
WireConnection;360;1;359;0
WireConnection;360;2;358;0
WireConnection;361;2;360;0
WireConnection;362;0;361;0
WireConnection;363;0;362;0
WireConnection;364;0;362;0
WireConnection;367;1;363;0
WireConnection;367;0;362;0
WireConnection;367;2;364;0
WireConnection;185;0;355;0
WireConnection;355;0;367;0
WireConnection;352;0;167;0
WireConnection;352;1;168;0
WireConnection;352;2;168;0
WireConnection;352;3;168;0
WireConnection;352;4;167;0
WireConnection;169;0;170;0
WireConnection;171;0;353;0
WireConnection;171;1;169;0
WireConnection;353;0;185;0
WireConnection;353;1;352;0
WireConnection;353;2;168;0
WireConnection;2;0;24;0
WireConnection;2;1;43;0
WireConnection;2;2;116;0
WireConnection;2;9;219;0
WireConnection;2;4;219;0
WireConnection;2;5;158;0
WireConnection;2;14;490;0
WireConnection;2;15;489;0
ASEEND*/
//CHKSM=FFA441152A28F7E3573944DC323A95A804E297D3
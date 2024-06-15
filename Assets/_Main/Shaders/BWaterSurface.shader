// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BWaterSurface"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[KeywordEnum(Linear,Normal,Gamma)] _DepthGradeType2("DepthGradeType2", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _TextureGradeType("TextureGradeType", Float) = 0
		[Toggle]_Normal("Normal", Float) = 0
		[HDR]_ShoreColor("Shore Color", Color) = (1,1,1,1)
		_ShoreTexture("Shore Texture", 2D) = "white" {}
		[Toggle]_InvertShoreTexture("Invert Shore Texture", Float) = 0
		_ShoreTileX("ShoreTileX", Float) = 1
		_ShoreTileY("ShoreTileY", Float) = 1
		_WaveSpeedX("WaveSpeedX", Float) = 1
		_WaveSpeedY("WaveSpeedY", Float) = 1
		_ShoreGradeScale("Shore Grade Scale", Float) = 1
		_TransparentIntensity("Transparent Intensity", Range( 0 , 1)) = 1
		_ShoreGradeOffset("Shore Grade Offset", Float) = 0
		_FoamTexture("Foam Texture", 2D) = "white" {}
		[Toggle]_InvertFoamTexture("Invert Foam Texture", Float) = 1
		_FoamTileX("FoamTileX", Float) = 1
		_OldMin("Old Min", Float) = 0
		_FoamTileY("FoamTileY", Float) = 1
		_OldMax("Old Max", Float) = 1
		_FoamGradeScale("Foam Grade Scale", Float) = 1
		_FoamGradeOffset("Foam Grade Offset", Float) = 0
		_FoamSpeedX("FoamSpeedX", Float) = 0.1
		_NewMin("New Min", Float) = 0
		_FoamSpeedY("FoamSpeedY", Float) = 0.1
		_NewMax("New Max", Float) = 1
		_DepthDistance("Depth Distance", Float) = 1
		_DepthExponential("Depth Exponential", Float) = 1
		_GradeScale("Grade Scale", Float) = 1
		_GradeOffset("Grade Offset", Float) = 0
		_GradeExponential("Grade Exponential", Float) = 1
		_DepthSize("Depth Size", Float) = 1
		[KeywordEnum(VorAVorB,VorAPerA,VorAPerB,PerAPerB,VorBPerA,VorBPerB)] _NoiseType("Noise Type", Float) = 0
		_ScreenContrast("ScreenContrast", Range( -1 , 1)) = 0
		_NoiseGradeScale("Noise Grade Scale", Float) = 1
		_NoiseGradeOffset("Noise Grade Offset", Float) = 0
		_VorAScale("VorAScale", Float) = 4
		_VorATileX("Vor A TileX", Float) = 1
		_VorATileY("Vor A TileY", Float) = 1
		_VorAAngleSpeed("Vor A Angle Speed", Float) = 1
		_VorASpeedX("Vor A Speed X", Float) = 0.1
		_VorASpeedY("Vor A Speed Y", Float) = 0.1
		_VorASmooth("Vor A Smooth", Float) = 1
		_VorBScale("VorBScale", Float) = 4
		_VorBTileX("Vor B TileX", Float) = 1
		_VorBTileY("Vor B TileY", Float) = 1
		_VorBAngleSpeed("Vor B Angle Speed", Float) = 1
		_VorBSpeedX("Vor B Speed X", Float) = -0.1
		_VorBSpeedY("Vor B Speed Y", Float) = -0.1
		_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 0
		_VorBSmooth("Vor B Smooth", Float) = 1
		_PerAScale("PerAScale", Float) = 4
		_PerATileX("Per A TileX", Float) = 1
		_FresnelScale("Fresnel Scale", Range( 0 , 10)) = 1
		_FresnelPower("Fresnel Power", Range( 0 , 10)) = 1
		_PerATileY("Per A TileY", Float) = 1
		_PerASpeedX("Per A Speed X", Float) = 0.1
		_PerASpeedY("Per A Speed Y", Float) = 0.1
		_PerBScale("PerBScale", Float) = 4
		[Toggle]_RefractionInvert("RefractionInvert", Float) = 0
		_PerBTileX("Per B TileX", Float) = 1
		[NoScaleOffset]_BluricRefractionPattern("Bluric Refraction Pattern", 2D) = "white" {}
		_PerBTileY("Per B TileY", Float) = 1
		_SSSize("SSSize", Float) = 10
		_PerBSpeedX("Per B Speed X", Float) = -0.1
		_PerBSpeedY("Per B Speed Y", Float) = -0.1
		_PatternHeight("PatternHeight", Range( -10 , 10)) = 0.1
		_RefractColor("Refract Color", Color) = (0,0,0,0)
		_PatternRotator("PatternRotator", Range( -360 , 360)) = 0
		_ShoreColorMap("Shore Color Map", 2D) = "white" {}
		_ShoreCRotSpeed("ShoreC Rot Speed", Float) = 1
		_ShoreCAnchorX("ShoreC Anchor X", Float) = 0
		[Toggle]_Refraction("Refraction", Float) = 0
		_ShoreCAnchorY("ShoreC Anchor Y", Float) = 0
		_ShoreCTileX("ShoreC Tile X", Float) = 0
		_ShoreCTileY("ShoreC Tile Y", Float) = 0
		_ShoreCSpeedX("ShoreC Speed X", Float) = 0
		_ShoreCSpeedY("ShoreC Speed Y", Float) = 0
		[Toggle]_Refraction1("Refraction", Float) = 0
		_ShoreCBRotSpeed("ShoreC B Rot Speed", Float) = 1
		_ShoreCBAnchorX("ShoreC B Anchor X", Float) = 0
		_ShoreCBAnchorY("ShoreC B Anchor Y", Float) = 0
		_ShoreCBTileX("ShoreC B Tile X", Float) = 0
		_ShoreCBTileY("ShoreC B Tile Y", Float) = 0
		_ShoreCBSpeedX("ShoreC B Speed X", Float) = 0
		_ShoreCBSpeedY("ShoreC B Speed Y", Float) = 0
		[KeywordEnum(Additive,Subtractive,Multiplicative,Divide)] _ShoreTextureBlendingType("Shore Texture Blending Type", Float) = 0
		[Space(50)][Header(Noise)][Space(5)][KeywordEnum(None,Voronoi,Perlin,Texture)] _NormNoiseTypeA("NormNoiseTypeA", Float) = 0
		_SSTileX("SSTileX", Float) = 1
		[Space(50)][Header(Noise)][Space(5)][KeywordEnum(None,Voronoi,Perlin,Texture)] _NoiseTypeA("NoiseTypeA", Float) = 0
		[KeywordEnum(None,Voronoi,Perlin,Texture)] _NoiseTypeB("NoiseTypeB", Float) = 0
		_SSTileY("SSTileY", Float) = 1
		[KeywordEnum(None,Voronoi,Perlin,Texture)] _NormNoiseTypeB("NormNoiseTypeB", Float) = 0
		_SSOffX("SSOffX", Float) = 0
		[KeywordEnum(Multiply,Add,Subtract,Divide,Dot)] _DefNoiseMixType("DefNoiseMixType", Float) = 0
		_SSOffY("SSOffY", Float) = 0
		[KeywordEnum(Multiply,Add,Subtract,Divide,Dot)] _NormNoiseMixType("NormNoiseMixType", Float) = 0
		[Toggle]_SSBluricTransparent("SS Bluric Transparent", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DefNoiseGradeType("DefNoiseGradeType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _NormNoiseGradeType("NormNoiseGradeType", Float) = 0
		_NormNoiseContrast("NormNoiseContrast", Float) = 1
		_DefNoiseContrast("DefNoiseContrast", Float) = 1
		_DefNoiseGradeScale("DefNoiseGradeScale", Float) = 1
		_NormNoiseGradeScale("NormNoiseGradeScale", Float) = 1
		_NormNoiseGradeOffset("NormNoiseGradeOffset", Float) = 0.1
		_DefNoiseGradeOffset("DefNoiseGradeOffset", Float) = 0.1
		_DefNoiseFinalScale("DefNoiseFinalScale", Range( 0 , 50)) = 1
		_NormNoiseFinalScale("NormNoiseFinalScale", Range( 0 , 50)) = 1
		_NormNoiseFinalOffset("NormNoiseFinalOffset", Range( 0 , 1)) = 0
		_DefNoiseFinalOffset("DefNoiseFinalOffset", Range( 0 , 1)) = 0
		_NormPerlinScale("NormPerlinScale", Float) = 1
		_DefPerlinScale("DefPerlinScale", Float) = 1
		[Space(10)]_NormNoiseAMap("NormNoiseAMap", 2D) = "white" {}
		[Space(10)]_DefNoiseAMap("DefNoiseAMap", 2D) = "white" {}
		[Toggle]_DefNoiseAInvert("DefNoiseAInvert", Float) = 0
		[Toggle]_NormNoiseAInvert("NormNoiseAInvert", Float) = 0
		_DefNoiseTypeAExponential("DefNoiseTypeAExponential", Float) = 1
		_NormNoiseTypeAExponential("NormNoiseTypeAExponential", Float) = 1
		_NormNoiseTypeAMult("NormNoiseTypeAMult", Float) = 1
		_DefNoiseTypeAMult("DefNoiseTypeAMult", Float) = 1
		_NormNoiseAScale("NormNoiseAScale", Float) = 8
		_DefNoiseAScale("DefNoiseAScale", Float) = 8
		_NormVorAAngle("NormVorAAngle", Range( -8 , 8)) = 0.1
		_DefVorAAngle("DefVorAAngle", Range( -8 , 8)) = 0.1
		[Toggle]_RefrControl("RefrControl", Float) = 0
		_NormVorATileX("NormVorATileX", Float) = 1
		_DefVorATileX("DefVorATileX", Float) = 1
		_NormVorATileY("NormVorATileY", Float) = 1
		_DefVorATileY("DefVorATileY", Float) = 1
		_DefVorASpeedX("DefVorASpeedX", Range( -0.5 , 0.5)) = 0
		_NormVorASpeedX("NormVorASpeedX", Range( -0.5 , 0.5)) = 0
		_NormVorASpeedY("NormVorASpeedY", Range( -0.5 , 0.5)) = 0
		_DefVorASpeedY("DefVorASpeedY", Range( -0.5 , 0.5)) = 0
		_NormTypeARotSpeed("NormTypeARotSpeed", Float) = 0
		_DefTypeARotSpeed("DefTypeARotSpeed", Float) = 0
		_DefTypeAAnchorX("DefTypeAAnchorX", Float) = 0
		_NormTypeAAnchorX("NormTypeAAnchorX", Float) = 0
		_DefTypeAAnchorY("DefTypeAAnchorY", Float) = 0
		_NormTypeAAnchorY("NormTypeAAnchorY", Float) = 0
		[Space(10)]_DefNoiseBMap("DefNoiseBMap", 2D) = "white" {}
		[Space(10)]_NormNoiseBMap("NormNoiseBMap", 2D) = "white" {}
		[Toggle]_NormNoiseBInvert("NormNoiseBInvert", Float) = 0
		[Toggle]_DefNoiseBInvert("DefNoiseBInvert", Float) = 0
		_DefNoiseTypeBExponential("DefNoiseTypeBExponential", Float) = 1
		_NormNoiseTypeBExponential("NormNoiseTypeBExponential", Float) = 1
		_NormNoiseTypeBMult("NormNoiseTypeBMult", Float) = 1
		_DefNoiseTypeBMult("DefNoiseTypeBMult", Float) = 1
		_NormNoiseBScale("NormNoiseBScale", Float) = 5
		_DefNoiseBScale("DefNoiseBScale", Float) = 5
		_NormVorBAngle("NormVorBAngle", Range( -8 , 8)) = 0.1
		_DefVorBAngle("DefVorBAngle", Range( -8 , 8)) = 0.1
		_DefVorBTileX("DefVorBTileX", Float) = 1
		_NormVorBTileX("NormVorBTileX", Float) = 1
		_DefVorBTileY("DefVorBTileY", Float) = 1
		_NormVorBTileY("NormVorBTileY", Float) = 1
		_NormVorBSpeedX("NormVorBSpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorBSpeedX("DefVorBSpeedX", Range( -0.5 , 0.5)) = 0
		_NormVorBSpeedY("NormVorBSpeedY", Range( -0.5 , 0.5)) = 0
		_DefVorBSpeedY("DefVorBSpeedY", Range( -0.5 , 0.5)) = 0
		_NormTypeBRotSpeed("NormTypeBRotSpeed", Float) = 0
		_DefTypeBRotSpeed("DefTypeBRotSpeed", Float) = 0
		_NormTypeBAnchorX("NormTypeBAnchorX", Float) = 0
		_DefTypeBAnchorX("DefTypeBAnchorX", Float) = 0
		_NormTypeBAnchorY("NormTypeBAnchorY", Float) = 0
		_DefTypeBAnchorY("DefTypeBAnchorY", Float) = 0
		[Toggle]_AffectFoamDeformation("AffectFoamDeformation", Float) = 0
		_MiddleWaveIntensity("Middle Wave Intensity", Range( 0 , 1)) = 0.5
		_NormMiddleWaveIntensity("Norm Middle Wave Intensity", Range( 0 , 1)) = 0.5
		_MiddleWaveEdgeControl("Middle Wave Edge Control", Float) = 1
		_Specular("Specular", Range( 0 , 3)) = 0.5
		_Smoothnes("Smoothnes", Range( 0 , 1)) = 0.5
		_NormalStrenggth("NormalStrenggth", Range( -10 , 10)) = 1
		_NormalSize("NormalSize", Float) = 0


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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="SimpleLit" }

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

			Blend SrcAlpha OneMinusSrcAlpha
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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _SHORETEXTUREBLENDINGTYPE_ADDITIVE _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE _SHORETEXTUREBLENDINGTYPE_DIVIDE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreColorMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			
			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
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
				o.ase_texcoord9 = v.positionOS;
				
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

				float2 appendResult506 = (float2(_ShoreCTileX , _ShoreCTileY));
				float mulTime583 = _TimeParameters.x * _ShoreCSpeedX;
				float mulTime584 = _TimeParameters.x * _ShoreCSpeedY;
				float2 appendResult580 = (float2(mulTime583 , mulTime584));
				float2 texCoord464 = IN.ase_texcoord8.xy * appendResult506 + appendResult580;
				float2 appendResult585 = (float2(_ShoreCAnchorX , _ShoreCAnchorY));
				float mulTime474 = _TimeParameters.x * _ShoreCRotSpeed;
				float cos465 = cos( radians( mulTime474 ) );
				float sin465 = sin( radians( mulTime474 ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 tex2DNode458 = tex2D( _ShoreColorMap, rotator465 );
				float2 appendResult609 = (float2(_ShoreCBTileX , _ShoreCBTileY));
				float mulTime614 = _TimeParameters.x * _ShoreCBSpeedX;
				float mulTime615 = _TimeParameters.x * _ShoreCBSpeedY;
				float2 appendResult602 = (float2(mulTime614 , mulTime615));
				float2 texCoord599 = IN.ase_texcoord8.xy * appendResult609 + appendResult602;
				float2 appendResult619 = (float2(_ShoreCBAnchorX , _ShoreCBAnchorY));
				float mulTime617 = _TimeParameters.x * _ShoreCBRotSpeed;
				float cos597 = cos( radians( mulTime617 ) );
				float sin597 = sin( radians( mulTime617 ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 tex2DNode596 = tex2D( _ShoreColorMap, rotator597 );
				#if defined( _SHORETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE )
				float4 staticSwitch623 = ( tex2DNode458 - tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE )
				float4 staticSwitch623 = ( tex2DNode458 * tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch623 = ( tex2DNode458 / tex2DNode596 );
				#else
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#endif
				float4 ShoreRef592 = ( _ShoreColor * saturate( staticSwitch623 ) );
				
				float3 surf_pos107_g156 = WorldPosition;
				float3 surf_norm107_g156 = WorldNormal;
				float Gray913 = 0.5;
				float4 temp_cast_1 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord8.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_2 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_4 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_5 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_5;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_2;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_4;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_5;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_9 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_9 );
				float4 temp_cast_10 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord8.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_11 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_13 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_14 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_14;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_11;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_13;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_14;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_18 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_18 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_19 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_19;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_22 = (temp_output_344_0).xxx;
				float3 temp_cast_23 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_23 );
				float3 temp_cast_24 = (temp_output_344_0).xxx;
				float3 temp_cast_25 = (temp_output_344_0).xxx;
				float3 temp_cast_26 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_26 );
				float3 temp_cast_27 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_24;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord8.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord8.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord8.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord8.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_31 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_31 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord8.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord8.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float4 temp_cast_44 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord8.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_45 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_47 = (simplePerlin3D865).xxxx;
				float4 temp_cast_48 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_48;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_45;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_47;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_48;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_52 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_52 );
				float4 temp_cast_53 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord8.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_54 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_56 = (simplePerlin3D866).xxxx;
				float4 temp_cast_57 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_57;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_54;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_56;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_57;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_61 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_61 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_62 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_62;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float fresnelNdotV980 = dot( half3(0,0,0), WorldViewDirection );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord8.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				
				float3 temp_cast_70 = (_Specular).xxx;
				

				float3 BaseColor = ShoreRef592.rgb;
				float3 Normal = WaveNormalRef1103;
				float3 Emission = temp_output_1140_0.rgb;
				float3 Specular = temp_cast_70;
				float Metallic = 0;
				float Smoothness = _Smoothnes;
				float Occlusion = 1;
				float Alpha = temp_output_1140_0.r;
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
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1


			

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
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE


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
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
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
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord7 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
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

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_0 = (temp_output_344_0).xxx;
				float3 temp_cast_1 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (temp_output_344_0).xxx;
				float3 temp_cast_3 = (temp_output_344_0).xxx;
				float3 temp_cast_4 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_2;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord3.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord3.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord3.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord3.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_9 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_9 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord3.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord3.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float Gray913 = 0.5;
				float4 temp_cast_22 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord3.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_23 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_25 = (simplePerlin3D865).xxxx;
				float4 temp_cast_26 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_26;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_23;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_25;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_26;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_30 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_30 );
				float4 temp_cast_31 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord3.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_32 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_34 = (simplePerlin3D866).xxxx;
				float4 temp_cast_35 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_35;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_32;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_34;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_35;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_39 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_39 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_40 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_40;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 surf_pos107_g156 = WorldPosition;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 surf_norm107_g156 = ase_worldNormal;
				float4 temp_cast_43 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord3.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_44 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_46 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_47 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_47;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_44;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_46;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_47;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_51 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_51 );
				float4 temp_cast_52 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord3.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_53 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_55 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_56 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_56;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_53;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_55;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_56;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_60 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_60 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_61 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_61;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord7.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord3.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				float Alpha = temp_output_1140_0.r;
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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _SHORETEXTUREBLENDINGTYPE_ADDITIVE _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE _SHORETEXTUREBLENDINGTYPE_DIVIDE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE


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
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreColorMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
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

				float2 appendResult506 = (float2(_ShoreCTileX , _ShoreCTileY));
				float mulTime583 = _TimeParameters.x * _ShoreCSpeedX;
				float mulTime584 = _TimeParameters.x * _ShoreCSpeedY;
				float2 appendResult580 = (float2(mulTime583 , mulTime584));
				float2 texCoord464 = IN.ase_texcoord4.xy * appendResult506 + appendResult580;
				float2 appendResult585 = (float2(_ShoreCAnchorX , _ShoreCAnchorY));
				float mulTime474 = _TimeParameters.x * _ShoreCRotSpeed;
				float cos465 = cos( radians( mulTime474 ) );
				float sin465 = sin( radians( mulTime474 ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 tex2DNode458 = tex2D( _ShoreColorMap, rotator465 );
				float2 appendResult609 = (float2(_ShoreCBTileX , _ShoreCBTileY));
				float mulTime614 = _TimeParameters.x * _ShoreCBSpeedX;
				float mulTime615 = _TimeParameters.x * _ShoreCBSpeedY;
				float2 appendResult602 = (float2(mulTime614 , mulTime615));
				float2 texCoord599 = IN.ase_texcoord4.xy * appendResult609 + appendResult602;
				float2 appendResult619 = (float2(_ShoreCBAnchorX , _ShoreCBAnchorY));
				float mulTime617 = _TimeParameters.x * _ShoreCBRotSpeed;
				float cos597 = cos( radians( mulTime617 ) );
				float sin597 = sin( radians( mulTime617 ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 tex2DNode596 = tex2D( _ShoreColorMap, rotator597 );
				#if defined( _SHORETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE )
				float4 staticSwitch623 = ( tex2DNode458 - tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE )
				float4 staticSwitch623 = ( tex2DNode458 * tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch623 = ( tex2DNode458 / tex2DNode596 );
				#else
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#endif
				float4 ShoreRef592 = ( _ShoreColor * saturate( staticSwitch623 ) );
				
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_1 = (temp_output_344_0).xxx;
				float3 temp_cast_2 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_2 );
				float3 temp_cast_3 = (temp_output_344_0).xxx;
				float3 temp_cast_4 = (temp_output_344_0).xxx;
				float3 temp_cast_5 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_5 );
				float3 temp_cast_6 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_3;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord4.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord4.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord4.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord4.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_10 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_10 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord4.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord4.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float Gray913 = 0.5;
				float4 temp_cast_23 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord4.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_24 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_26 = (simplePerlin3D865).xxxx;
				float4 temp_cast_27 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_27;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_24;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_26;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_27;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_31 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_31 );
				float4 temp_cast_32 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord4.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_33 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_35 = (simplePerlin3D866).xxxx;
				float4 temp_cast_36 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_36;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_33;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_35;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_36;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_40 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_40 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_41 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_41;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 surf_pos107_g156 = WorldPosition;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 surf_norm107_g156 = ase_worldNormal;
				float4 temp_cast_44 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord4.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_45 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_47 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_48 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_48;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_45;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_47;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_48;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_52 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_52 );
				float4 temp_cast_53 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord4.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_54 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_56 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_57 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_57;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_54;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_56;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_57;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_61 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_61 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_62 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_62;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord4.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				float3 BaseColor = ShoreRef592.rgb;
				float3 Emission = temp_output_1140_0.rgb;
				float Alpha = temp_output_1140_0.r;
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

			Blend SrcAlpha OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1


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
			#pragma shader_feature_local _SHORETEXTUREBLENDINGTYPE_ADDITIVE _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE _SHORETEXTUREBLENDINGTYPE_DIVIDE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE


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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreColorMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord7 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
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

				float2 appendResult506 = (float2(_ShoreCTileX , _ShoreCTileY));
				float mulTime583 = _TimeParameters.x * _ShoreCSpeedX;
				float mulTime584 = _TimeParameters.x * _ShoreCSpeedY;
				float2 appendResult580 = (float2(mulTime583 , mulTime584));
				float2 texCoord464 = IN.ase_texcoord2.xy * appendResult506 + appendResult580;
				float2 appendResult585 = (float2(_ShoreCAnchorX , _ShoreCAnchorY));
				float mulTime474 = _TimeParameters.x * _ShoreCRotSpeed;
				float cos465 = cos( radians( mulTime474 ) );
				float sin465 = sin( radians( mulTime474 ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 tex2DNode458 = tex2D( _ShoreColorMap, rotator465 );
				float2 appendResult609 = (float2(_ShoreCBTileX , _ShoreCBTileY));
				float mulTime614 = _TimeParameters.x * _ShoreCBSpeedX;
				float mulTime615 = _TimeParameters.x * _ShoreCBSpeedY;
				float2 appendResult602 = (float2(mulTime614 , mulTime615));
				float2 texCoord599 = IN.ase_texcoord2.xy * appendResult609 + appendResult602;
				float2 appendResult619 = (float2(_ShoreCBAnchorX , _ShoreCBAnchorY));
				float mulTime617 = _TimeParameters.x * _ShoreCBRotSpeed;
				float cos597 = cos( radians( mulTime617 ) );
				float sin597 = sin( radians( mulTime617 ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 tex2DNode596 = tex2D( _ShoreColorMap, rotator597 );
				#if defined( _SHORETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE )
				float4 staticSwitch623 = ( tex2DNode458 - tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE )
				float4 staticSwitch623 = ( tex2DNode458 * tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch623 = ( tex2DNode458 / tex2DNode596 );
				#else
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#endif
				float4 ShoreRef592 = ( _ShoreColor * saturate( staticSwitch623 ) );
				
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_1 = (temp_output_344_0).xxx;
				float3 temp_cast_2 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_2 );
				float3 temp_cast_3 = (temp_output_344_0).xxx;
				float3 temp_cast_4 = (temp_output_344_0).xxx;
				float3 temp_cast_5 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_5 );
				float3 temp_cast_6 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_3;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord2.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord2.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord2.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord2.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_10 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_10 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord2.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord2.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float Gray913 = 0.5;
				float4 temp_cast_23 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord2.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_24 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_26 = (simplePerlin3D865).xxxx;
				float4 temp_cast_27 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_27;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_24;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_26;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_27;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_31 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_31 );
				float4 temp_cast_32 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord2.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_33 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_35 = (simplePerlin3D866).xxxx;
				float4 temp_cast_36 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_36;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_33;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_35;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_36;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_40 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_40 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_41 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_41;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 surf_pos107_g156 = WorldPosition;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 surf_norm107_g156 = ase_worldNormal;
				float4 temp_cast_44 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord2.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_45 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_47 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_48 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_48;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_45;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_47;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_48;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_52 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_52 );
				float4 temp_cast_53 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord2.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_54 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_56 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_57 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_57;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_54;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_56;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_57;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_61 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_61 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_62 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_62;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord7.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord2.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				float3 BaseColor = ShoreRef592.rgb;
				float Alpha = temp_output_1140_0.r;
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

			

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1


			

			

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			
			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
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

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_texcoord7 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
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

				float3 surf_pos107_g156 = WorldPosition;
				float3 surf_norm107_g156 = WorldNormal;
				float Gray913 = 0.5;
				float4 temp_cast_0 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord5.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_1 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_3 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_4 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_4;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_1;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_3;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_4;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_8 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_8 );
				float4 temp_cast_9 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord5.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_10 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_12 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_13 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_13;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_10;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_12;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_13;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_17 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_17 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_18 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_18;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_21 = (temp_output_344_0).xxx;
				float3 temp_cast_22 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_22 );
				float3 temp_cast_23 = (temp_output_344_0).xxx;
				float3 temp_cast_24 = (temp_output_344_0).xxx;
				float3 temp_cast_25 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_25 );
				float3 temp_cast_26 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_23;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord5.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord5.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord5.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord5.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_30 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_30 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord5.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord5.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float4 temp_cast_43 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord5.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_44 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_46 = (simplePerlin3D865).xxxx;
				float4 temp_cast_47 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_47;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_44;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_46;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_47;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_51 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_51 );
				float4 temp_cast_52 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord5.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_53 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_55 = (simplePerlin3D866).xxxx;
				float4 temp_cast_56 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_56;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_53;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_55;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_56;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_60 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_60 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_61 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_61;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord7.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord5.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				float3 Normal = WaveNormalRef1103;
				float Alpha = temp_output_1140_0.r;
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

			Blend SrcAlpha OneMinusSrcAlpha
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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _SHORETEXTUREBLENDINGTYPE_ADDITIVE _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE _SHORETEXTUREBLENDINGTYPE_DIVIDE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreColorMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _BluricRefractionPattern;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			
			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
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
				o.ase_texcoord9 = v.positionOS;
				
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

				float2 appendResult506 = (float2(_ShoreCTileX , _ShoreCTileY));
				float mulTime583 = _TimeParameters.x * _ShoreCSpeedX;
				float mulTime584 = _TimeParameters.x * _ShoreCSpeedY;
				float2 appendResult580 = (float2(mulTime583 , mulTime584));
				float2 texCoord464 = IN.ase_texcoord8.xy * appendResult506 + appendResult580;
				float2 appendResult585 = (float2(_ShoreCAnchorX , _ShoreCAnchorY));
				float mulTime474 = _TimeParameters.x * _ShoreCRotSpeed;
				float cos465 = cos( radians( mulTime474 ) );
				float sin465 = sin( radians( mulTime474 ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 tex2DNode458 = tex2D( _ShoreColorMap, rotator465 );
				float2 appendResult609 = (float2(_ShoreCBTileX , _ShoreCBTileY));
				float mulTime614 = _TimeParameters.x * _ShoreCBSpeedX;
				float mulTime615 = _TimeParameters.x * _ShoreCBSpeedY;
				float2 appendResult602 = (float2(mulTime614 , mulTime615));
				float2 texCoord599 = IN.ase_texcoord8.xy * appendResult609 + appendResult602;
				float2 appendResult619 = (float2(_ShoreCBAnchorX , _ShoreCBAnchorY));
				float mulTime617 = _TimeParameters.x * _ShoreCBRotSpeed;
				float cos597 = cos( radians( mulTime617 ) );
				float sin597 = sin( radians( mulTime617 ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 tex2DNode596 = tex2D( _ShoreColorMap, rotator597 );
				#if defined( _SHORETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE )
				float4 staticSwitch623 = ( tex2DNode458 - tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE )
				float4 staticSwitch623 = ( tex2DNode458 * tex2DNode596 );
				#elif defined( _SHORETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch623 = ( tex2DNode458 / tex2DNode596 );
				#else
				float4 staticSwitch623 = ( tex2DNode458 + tex2DNode596 );
				#endif
				float4 ShoreRef592 = ( _ShoreColor * saturate( staticSwitch623 ) );
				
				float3 surf_pos107_g156 = WorldPosition;
				float3 surf_norm107_g156 = WorldNormal;
				float Gray913 = 0.5;
				float4 temp_cast_1 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord8.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_2 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_4 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_5 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_5;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_2;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_4;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_5;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_9 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_9 );
				float4 temp_cast_10 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord8.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_11 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_13 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_14 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_14;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_11;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_13;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_14;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_18 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_18 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_19 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_19;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_22 = (temp_output_344_0).xxx;
				float3 temp_cast_23 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_23 );
				float3 temp_cast_24 = (temp_output_344_0).xxx;
				float3 temp_cast_25 = (temp_output_344_0).xxx;
				float3 temp_cast_26 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_26 );
				float3 temp_cast_27 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_24;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord8.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord8.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord8.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord8.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_31 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_31 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord8.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord8.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float4 temp_cast_44 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord8.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_45 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_47 = (simplePerlin3D865).xxxx;
				float4 temp_cast_48 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_48;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_45;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_47;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_48;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_52 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_52 );
				float4 temp_cast_53 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord8.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_54 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_56 = (simplePerlin3D866).xxxx;
				float4 temp_cast_57 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_57;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_54;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_56;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_57;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_61 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_61 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_62 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_62;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float fresnelNdotV980 = dot( half3(0,0,0), WorldViewDirection );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord9.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord8.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				
				float3 temp_cast_70 = (_Specular).xxx;
				

				float3 BaseColor = ShoreRef592.rgb;
				float3 Normal = WaveNormalRef1103;
				float3 Emission = temp_output_1140_0.rgb;
				float3 Specular = temp_cast_70;
				float Metallic = 0;
				float Smoothness = _Smoothnes;
				float Occlusion = 1;
				float Alpha = temp_output_1140_0.r;
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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1


			

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
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE


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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
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
				o.ase_texcoord = screenPos;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord6 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float4 screenPos = IN.ase_texcoord;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_0 = (temp_output_344_0).xxx;
				float3 temp_cast_1 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (temp_output_344_0).xxx;
				float3 temp_cast_3 = (temp_output_344_0).xxx;
				float3 temp_cast_4 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_2;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord1.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord1.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord1.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord1.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_9 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_9 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord1.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord1.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float Gray913 = 0.5;
				float4 temp_cast_22 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord1.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_23 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_25 = (simplePerlin3D865).xxxx;
				float4 temp_cast_26 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_26;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_23;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_25;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_26;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_30 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_30 );
				float4 temp_cast_31 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord1.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_32 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_34 = (simplePerlin3D866).xxxx;
				float4 temp_cast_35 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_35;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_32;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_34;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_35;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_39 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_39 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_40 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_40;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldPos = IN.ase_texcoord2.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 surf_pos107_g156 = ase_worldPos;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 surf_norm107_g156 = ase_worldNormal;
				float4 temp_cast_43 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord1.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_44 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_46 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_47 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_47;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_44;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_46;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_47;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_51 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_51 );
				float4 temp_cast_52 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord1.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_53 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_55 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_56 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_56;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_53;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_55;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_56;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_60 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_60 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_61 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_61;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord1.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				surfaceDescription.Alpha = temp_output_1140_0.r;
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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1


			

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
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _NORMNOISEGRADETYPE_LINEAR _NORMNOISEGRADETYPE_NORMAL _NORMNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NORMNOISEMIXTYPE_MULTIPLY _NORMNOISEMIXTYPE_ADD _NORMNOISEMIXTYPE_SUBTRACT _NORMNOISEMIXTYPE_DIVIDE _NORMNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NORMNOISETYPEA_NONE _NORMNOISETYPEA_VORONOI _NORMNOISETYPEA_PERLIN _NORMNOISETYPEA_TEXTURE
			#pragma shader_feature_local _NORMNOISETYPEB_NONE _NORMNOISETYPEB_VORONOI _NORMNOISETYPEB_PERLIN _NORMNOISETYPEB_TEXTURE


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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float4 _RefractColor;
			float _DefNoiseAScale;
			float _DefVorAAngle;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefVorASpeedX;
			float _DefNoiseTypeAMult;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefTypeARotSpeed;
			float _DefPerlinScale;
			float _DefNoiseTypeAExponential;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _NoiseGradeScale;
			float _NoiseGradeOffset;
			float _ShoreTileX;
			float _ShoreTileY;
			float _MiddleWaveEdgeControl;
			float _WaveSpeedX;
			float _WaveSpeedY;
			float _ShoreGradeScale;
			float _ShoreGradeOffset;
			float _InvertFoamTexture;
			float _AffectFoamDeformation;
			float _FoamTileX;
			float _FoamTileY;
			float _FoamSpeedX;
			float _FoamSpeedY;
			float _DefVorBAngle;
			float _DefVorBTileX;
			float _DefVorBTileY;
			float _DefVorBSpeedX;
			float _OldMin;
			float _OldMax;
			float _NewMin;
			float _NewMax;
			float _SSBluricTransparent;
			float _Normal;
			float _NormalSize;
			float _SSSize;
			float _SSTileX;
			float _SSTileY;
			float _SSOffX;
			float _SSOffY;
			float _PatternRotator;
			float _PatternHeight;
			float _TransparentIntensity;
			float _FresnelPower;
			float _PerBScale;
			float _FresnelScale;
			float _RefractionInvert;
			float _DefNoiseTypeBMult;
			float _DefVorBSpeedY;
			float _DefTypeBAnchorX;
			float _DefTypeBAnchorY;
			float _DefTypeBRotSpeed;
			float _DefNoiseTypeBExponential;
			float _DefNoiseFinalScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseGradeOffset;
			float _MiddleWaveIntensity;
			float _Refraction;
			float _ScreenContrast;
			float _RefrControl;
			float _Refraction1;
			float _FresnelBias;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _NormVorATileY;
			float _NormVorASpeedX;
			float _NormNoiseTypeAMult;
			float _NormVorASpeedY;
			float _NormTypeAAnchorX;
			float _NormTypeAAnchorY;
			float _NormTypeARotSpeed;
			float _NormPerlinScale;
			float _NormNoiseTypeAExponential;
			float _NormNoiseBInvert;
			float _NormNoiseBScale;
			float _NormVorBAngle;
			float _NormVorBTileX;
			float _NormVorBTileY;
			float _NormVorBSpeedX;
			float _NormVorATileX;
			float _NormNoiseTypeBMult;
			float _NormVorAAngle;
			float _NormNoiseAInvert;
			float _ShoreCTileX;
			float _ShoreCTileY;
			float _ShoreCSpeedX;
			float _ShoreCSpeedY;
			float _ShoreCAnchorX;
			float _ShoreCAnchorY;
			float _ShoreCRotSpeed;
			float _ShoreCBTileX;
			float _ShoreCBTileY;
			float _ShoreCBSpeedX;
			float _ShoreCBSpeedY;
			float _ShoreCBAnchorX;
			float _ShoreCBAnchorY;
			float _ShoreCBRotSpeed;
			float _NormNoiseContrast;
			float _NormNoiseAScale;
			float _NormVorBSpeedY;
			float _NormTypeBAnchorX;
			float _NormTypeBAnchorY;
			float _VorASpeedX;
			float _VorASpeedY;
			float _VorBScale;
			float _VorBAngleSpeed;
			float _VorBSmooth;
			float _VorBTileX;
			float _VorBTileY;
			float _VorBSpeedX;
			float _VorBSpeedY;
			float _PerATileX;
			float _PerATileY;
			float _PerASpeedX;
			float _PerASpeedY;
			float _PerAScale;
			float _PerBTileX;
			float _VorATileY;
			float _VorATileX;
			float _VorASmooth;
			float _VorAAngleSpeed;
			float _NormTypeBRotSpeed;
			float _NormNoiseTypeBExponential;
			float _NormNoiseFinalScale;
			float _NormNoiseFinalOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseGradeOffset;
			float _NormMiddleWaveIntensity;
			float _Specular;
			float _NormalStrenggth;
			float _DepthDistance;
			float _DepthExponential;
			float _GradeScale;
			float _GradeOffset;
			float _GradeExponential;
			float _InvertShoreTexture;
			float _VorAScale;
			float _DepthSize;
			float _Smoothnes;
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

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;
			sampler2D _NormNoiseAMap;
			sampler2D _NormNoiseBMap;
			sampler2D _BluricRefractionPattern;


			float2 voronoihash294( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi294( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash294( n + g );
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
			
			float2 voronoihash295( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash295( n + g );
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
			
			float3 mod3D289( float3 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 mod3D289( float4 x ) { return x - floor( x / 289.0 ) * 289.0; }
			float4 permute( float4 x ) { return mod3D289( ( x * 34.0 + 1.0 ) * x ); }
			float4 taylorInvSqrt( float4 r ) { return 1.79284291400159 - r * 0.85373472095314; }
			float snoise( float3 v )
			{
				const float2 C = float2( 1.0 / 6.0, 1.0 / 3.0 );
				float3 i = floor( v + dot( v, C.yyy ) );
				float3 x0 = v - i + dot( i, C.xxx );
				float3 g = step( x0.yzx, x0.xyz );
				float3 l = 1.0 - g;
				float3 i1 = min( g.xyz, l.zxy );
				float3 i2 = max( g.xyz, l.zxy );
				float3 x1 = x0 - i1 + C.xxx;
				float3 x2 = x0 - i2 + C.yyy;
				float3 x3 = x0 - 0.5;
				i = mod3D289( i);
				float4 p = permute( permute( permute( i.z + float4( 0.0, i1.z, i2.z, 1.0 ) ) + i.y + float4( 0.0, i1.y, i2.y, 1.0 ) ) + i.x + float4( 0.0, i1.x, i2.x, 1.0 ) );
				float4 j = p - 49.0 * floor( p / 49.0 );  // mod(p,7*7)
				float4 x_ = floor( j / 7.0 );
				float4 y_ = floor( j - 7.0 * x_ );  // mod(j,N)
				float4 x = ( x_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 y = ( y_ * 2.0 + 0.5 ) / 7.0 - 1.0;
				float4 h = 1.0 - abs( x ) - abs( y );
				float4 b0 = float4( x.xy, y.xy );
				float4 b1 = float4( x.zw, y.zw );
				float4 s0 = floor( b0 ) * 2.0 + 1.0;
				float4 s1 = floor( b1 ) * 2.0 + 1.0;
				float4 sh = -step( h, 0.0 );
				float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
				float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;
				float3 g0 = float3( a0.xy, h.x );
				float3 g1 = float3( a0.zw, h.y );
				float3 g2 = float3( a1.xy, h.z );
				float3 g3 = float3( a1.zw, h.w );
				float4 norm = taylorInvSqrt( float4( dot( g0, g0 ), dot( g1, g1 ), dot( g2, g2 ), dot( g3, g3 ) ) );
				g0 *= norm.x;
				g1 *= norm.y;
				g2 *= norm.z;
				g3 *= norm.w;
				float4 m = max( 0.6 - float4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
				m = m* m;
				m = m* m;
				float4 px = float4( dot( x0, g0 ), dot( x1, g1 ), dot( x2, g2 ), dot( x3, g3 ) );
				return 42.0 * dot( m, px);
			}
			
			float2 voronoihash867( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi867( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash867( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash868( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi868( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash868( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
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
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float2 voronoihash1066( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1066( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1066( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.5 * dot( r, r );
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float2 voronoihash1064( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi1064( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash1064( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
				 		if( d<F1 ) {
				 			F2 = F1;
				 			F1 = d; mg = g; mr = r; id = o;
				 		} else if( d<F2 ) {
				 			F2 = d;
				
				 		}
				 	}
				}
				return (F2 + F1) * 0.5;
			}
			
			float3 PerturbNormal107_g156( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
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
				o.ase_texcoord = screenPos;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord6 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float4 screenPos = IN.ase_texcoord;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g2 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g2 = abs( ( screenDepth1_g2 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g2 = abs( distanceDepth1_g2 );
				float saferPower14_g2 = abs( saturate( (pow( saferPower3_g2 , max( _DepthExponential , 0.001 ) )*_GradeScale + _GradeOffset) ) );
				float temp_output_344_0 = ( ( ase_screenPosNorm.w + _DepthSize ) - ( saturate( pow( saferPower14_g2 , _GradeExponential ) ) * _ProjectionParams.x ) );
				float3 temp_cast_0 = (temp_output_344_0).xxx;
				float3 temp_cast_1 = (temp_output_344_0).xxx;
				float3 gammaToLinear336 = Gamma22ToLinear( temp_cast_1 );
				float3 temp_cast_2 = (temp_output_344_0).xxx;
				float3 temp_cast_3 = (temp_output_344_0).xxx;
				float3 temp_cast_4 = (temp_output_344_0).xxx;
				float3 linearToGamma337 = LinearToGamma22( temp_cast_4 );
				float3 temp_cast_5 = (temp_output_344_0).xxx;
				#if defined( _DEPTHGRADETYPE2_LINEAR )
				float3 staticSwitch338 = gammaToLinear336;
				#elif defined( _DEPTHGRADETYPE2_NORMAL )
				float3 staticSwitch338 = temp_cast_2;
				#elif defined( _DEPTHGRADETYPE2_GAMMA )
				float3 staticSwitch338 = linearToGamma337;
				#else
				float3 staticSwitch338 = gammaToLinear336;
				#endif
				float3 temp_output_156_0 = ( 1.0 - staticSwitch338 );
				float3 SaturateDepthRef450 = saturate( temp_output_156_0 );
				float mulTime166 = _TimeParameters.x * _VorAAngleSpeed;
				float time294 = mulTime166;
				float2 voronoiSmoothId294 = 0;
				float voronoiSmooth294 = _VorASmooth;
				float2 appendResult162 = (float2(_VorATileX , _VorATileY));
				float mulTime355 = _TimeParameters.x * _VorASpeedX;
				float mulTime402 = _TimeParameters.x * _VorASpeedY;
				float2 appendResult403 = (float2(mulTime355 , mulTime402));
				float2 texCoord293 = IN.ase_texcoord1.xy * appendResult162 + appendResult403;
				float2 coords294 = texCoord293 * _VorAScale;
				float2 id294 = 0;
				float2 uv294 = 0;
				float fade294 = 0.5;
				float voroi294 = 0;
				float rest294 = 0;
				for( int it294 = 0; it294 <2; it294++ ){
				voroi294 += fade294 * voronoi294( coords294, time294, id294, uv294, voronoiSmooth294,voronoiSmoothId294 );
				rest294 += fade294;
				coords294 *= 2;
				fade294 *= 0.5;
				}//Voronoi294
				voroi294 /= rest294;
				float mulTime423 = _TimeParameters.x * _VorBAngleSpeed;
				float time295 = mulTime423;
				float2 voronoiSmoothId295 = 0;
				float voronoiSmooth295 = _VorBSmooth;
				float2 appendResult312 = (float2(_VorBTileX , _VorBTileY));
				float mulTime358 = _TimeParameters.x * _VorBSpeedX;
				float mulTime399 = _TimeParameters.x * _VorBSpeedY;
				float2 appendResult400 = (float2(mulTime358 , mulTime399));
				float2 texCoord356 = IN.ase_texcoord1.xy * appendResult312 + appendResult400;
				float2 coords295 = texCoord356 * _VorBScale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <2; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, voronoiSmooth295,voronoiSmoothId295 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				float2 appendResult445 = (float2(_PerATileX , _PerATileY));
				float mulTime443 = _TimeParameters.x * _PerASpeedX;
				float mulTime444 = _TimeParameters.x * _PerASpeedY;
				float2 appendResult446 = (float2(mulTime443 , mulTime444));
				float2 texCoord430 = IN.ase_texcoord1.xy * appendResult445 + appendResult446;
				float simplePerlin3D305 = snoise( float3( texCoord430 ,  0.0 )*_PerAScale );
				simplePerlin3D305 = simplePerlin3D305*0.5 + 0.5;
				float2 appendResult438 = (float2(_PerBTileX , _PerBTileY));
				float mulTime435 = _TimeParameters.x * _PerBSpeedX;
				float mulTime436 = _TimeParameters.x * _PerBSpeedY;
				float2 appendResult437 = (float2(mulTime435 , mulTime436));
				float2 texCoord429 = IN.ase_texcoord1.xy * appendResult438 + appendResult437;
				float simplePerlin3D292 = snoise( float3( texCoord429 ,  0.0 )*_PerBScale );
				simplePerlin3D292 = simplePerlin3D292*0.5 + 0.5;
				#if defined( _NOISETYPE_VORAVORB )
				float staticSwitch415 = ( voroi294 * voroi295 );
				#elif defined( _NOISETYPE_VORAPERA )
				float staticSwitch415 = ( voroi294 * simplePerlin3D305 );
				#elif defined( _NOISETYPE_VORAPERB )
				float staticSwitch415 = ( voroi294 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_PERAPERB )
				float staticSwitch415 = ( simplePerlin3D305 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERA )
				float staticSwitch415 = ( voroi295 * simplePerlin3D292 );
				#elif defined( _NOISETYPE_VORBPERB )
				float staticSwitch415 = ( voroi295 * simplePerlin3D305 );
				#else
				float staticSwitch415 = ( voroi294 * voroi295 );
				#endif
				float NoiseTypeRef447 = staticSwitch415;
				float temp_output_325_0 = (NoiseTypeRef447*_NoiseGradeScale + _NoiseGradeOffset);
				float2 appendResult315 = (float2(_ShoreTileX , _ShoreTileY));
				float3 saferPower927 = abs( saturate( ( 1.0 - temp_output_156_0 ) ) );
				float3 temp_cast_9 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_9 );
				float mulTime329 = _TimeParameters.x * _WaveSpeedX;
				float mulTime378 = _TimeParameters.x * _WaveSpeedY;
				float2 appendResult377 = (float2(mulTime329 , mulTime378));
				float2 texCoord179 = IN.ase_texcoord1.xy * ( temp_output_325_0 * appendResult315 ) + ( DepthRef451 + float3( appendResult377 ,  0.0 ) ).xy;
				float4 temp_output_383_0 = saturate( tex2D( _ShoreTexture, texCoord179 ) );
				float2 appendResult388 = (float2(_FoamTileX , _FoamTileY));
				float mulTime386 = _TimeParameters.x * _FoamSpeedX;
				float mulTime392 = _TimeParameters.x * _FoamSpeedY;
				float2 appendResult393 = (float2(mulTime386 , mulTime392));
				float2 texCoord384 = IN.ase_texcoord1.xy * ( float3( (( _AffectFoamDeformation )?( ( temp_output_325_0 + appendResult388 ) ):( ( temp_output_325_0 * appendResult388 ) )) ,  0.0 ) - ( 1.0 - DepthRef451 ) ).xy + appendResult393;
				float4 temp_output_409_0 = saturate( tex2D( _FoamTexture, texCoord384 ) );
				float4 DepthTextureRef455 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_383_0 ) ):( temp_output_383_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * ((( _InvertFoamTexture )?( ( 1.0 - temp_output_409_0 ) ):( temp_output_409_0 ))*_FoamGradeScale + _FoamGradeOffset) );
				float3 gammaToLinear373 = Gamma22ToLinear( DepthTextureRef455.rgb );
				float3 linearToGamma374 = LinearToGamma22( DepthTextureRef455.rgb );
				#if defined( _TEXTUREGRADETYPE_LINEAR )
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#elif defined( _TEXTUREGRADETYPE_NORMAL )
				float4 staticSwitch375 = DepthTextureRef455;
				#elif defined( _TEXTUREGRADETYPE_GAMMA )
				float4 staticSwitch375 = float4( linearToGamma374 , 0.0 );
				#else
				float4 staticSwitch375 = float4( gammaToLinear373 , 0.0 );
				#endif
				float Gray913 = 0.5;
				float4 temp_cast_22 = (Gray913).xxxx;
				float mulTime857 = _TimeParameters.x * _DefVorAAngle;
				float time867 = mulTime857;
				float2 voronoiSmoothId867 = 0;
				float2 appendResult834 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime830 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAMult );
				float mulTime831 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAMult );
				float2 appendResult836 = (float2(mulTime830 , mulTime831));
				float2 texCoord844 = IN.ase_texcoord1.xy * appendResult834 + appendResult836;
				float2 appendResult850 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime849 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos855 = cos( mulTime849 );
				float sin855 = sin( mulTime849 );
				float2 rotator855 = mul( texCoord844 - appendResult850 , float2x2( cos855 , -sin855 , sin855 , cos855 )) + appendResult850;
				float2 coords867 = rotator855 * _DefNoiseAScale;
				float2 id867 = 0;
				float2 uv867 = 0;
				float fade867 = 0.5;
				float voroi867 = 0;
				float rest867 = 0;
				for( int it867 = 0; it867 <3; it867++ ){
				voroi867 += fade867 * voronoi867( coords867, time867, id867, uv867, 0,voronoiSmoothId867 );
				rest867 += fade867;
				coords867 *= 2;
				fade867 *= 0.5;
				}//Voronoi867
				voroi867 /= rest867;
				float4 temp_cast_23 = (voroi867).xxxx;
				float simplePerlin3D865 = snoise( float3( rotator855 ,  0.0 )*( _DefNoiseAScale * _DefPerlinScale ) );
				simplePerlin3D865 = simplePerlin3D865*0.5 + 0.5;
				float4 temp_cast_25 = (simplePerlin3D865).xxxx;
				float4 temp_cast_26 = (Gray913).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch869 = temp_cast_26;
				#elif defined( _NOISETYPEA_VORONOI )
				float4 staticSwitch869 = temp_cast_23;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch869 = temp_cast_25;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch869 = tex2D( _DefNoiseAMap, rotator855 );
				#else
				float4 staticSwitch869 = temp_cast_26;
				#endif
				float3 linearToGamma874 = LinearToGamma22( saturate( staticSwitch869 ).rgb );
				float3 saferPower881 = abs( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma874 ) ):( linearToGamma874 )) );
				float3 temp_cast_30 = (_DefNoiseTypeAExponential).xxx;
				float3 temp_output_881_0 = pow( saferPower881 , temp_cast_30 );
				float4 temp_cast_31 = ((0)).xxxx;
				float mulTime860 = _TimeParameters.x * _DefVorBAngle;
				float time868 = mulTime860;
				float2 voronoiSmoothId868 = 0;
				float2 appendResult835 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime832 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBMult );
				float mulTime833 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBMult );
				float2 appendResult837 = (float2(mulTime832 , mulTime833));
				float2 texCoord845 = IN.ase_texcoord1.xy * appendResult835 + ( appendResult837 + 0.0 );
				float2 appendResult852 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime851 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos856 = cos( mulTime851 );
				float sin856 = sin( mulTime851 );
				float2 rotator856 = mul( texCoord845 - appendResult852 , float2x2( cos856 , -sin856 , sin856 , cos856 )) + appendResult852;
				float2 coords868 = rotator856 * _DefNoiseBScale;
				float2 id868 = 0;
				float2 uv868 = 0;
				float fade868 = 0.5;
				float voroi868 = 0;
				float rest868 = 0;
				for( int it868 = 0; it868 <3; it868++ ){
				voroi868 += fade868 * voronoi868( coords868, time868, id868, uv868, 0,voronoiSmoothId868 );
				rest868 += fade868;
				coords868 *= 2;
				fade868 *= 0.5;
				}//Voronoi868
				voroi868 /= rest868;
				float4 temp_cast_32 = (voroi868).xxxx;
				float simplePerlin3D866 = snoise( float3( rotator856 ,  0.0 )*( _DefNoiseBScale * _DefPerlinScale ) );
				simplePerlin3D866 = simplePerlin3D866*0.5 + 0.5;
				float4 temp_cast_34 = (simplePerlin3D866).xxxx;
				float4 temp_cast_35 = ((0)).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch870 = temp_cast_35;
				#elif defined( _NOISETYPEB_VORONOI )
				float4 staticSwitch870 = temp_cast_32;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch870 = temp_cast_34;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch870 = tex2D( _DefNoiseBMap, rotator856 );
				#else
				float4 staticSwitch870 = temp_cast_35;
				#endif
				float3 linearToGamma873 = LinearToGamma22( saturate( staticSwitch870 ).rgb );
				float3 saferPower882 = abs( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma873 ) ):( linearToGamma873 )) );
				float3 temp_cast_39 = (_DefNoiseTypeBExponential).xxx;
				float3 temp_output_882_0 = pow( saferPower882 , temp_cast_39 );
				float dotResult885 = dot( temp_output_881_0 , temp_output_882_0 );
				float3 temp_cast_40 = (dotResult885).xxx;
				#if defined( _DEFNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_ADD )
				float3 staticSwitch888 = ( temp_output_881_0 + temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch888 = ( temp_output_881_0 - temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch888 = ( temp_output_881_0 / temp_output_882_0 );
				#elif defined( _DEFNOISEMIXTYPE_DOT )
				float3 staticSwitch888 = temp_cast_40;
				#else
				float3 staticSwitch888 = ( temp_output_881_0 * temp_output_882_0 );
				#endif
				float3 gammaToLinear889 = Gamma22ToLinear( staticSwitch888 );
				float3 linearToGamma890 = LinearToGamma22( staticSwitch888 );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float3 staticSwitch891 = gammaToLinear889;
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float3 staticSwitch891 = staticSwitch888;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float3 staticSwitch891 = linearToGamma890;
				#else
				float3 staticSwitch891 = gammaToLinear889;
				#endif
				float4 CausticRef902 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 FinalCompRef461 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float One909 = 1.0;
				float Zero911 = 0.0;
				float3 ase_worldPos = IN.ase_texcoord2.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float fresnelNdotV980 = dot( half3(0,0,0), ase_worldViewDir );
				float fresnelNode980 = ( _FresnelBias + _FresnelScale * pow( 1.0 - fresnelNdotV980, _FresnelPower ) );
				float RefractFresnelResult985 = (( _Refraction1 )?( (( _RefractionInvert )?( ( 1.0 - fresnelNode980 ) ):( fresnelNode980 )) ):( Zero911 ));
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 temp_output_1_0_g157 = float2( 0,0 );
				float dotResult4_g157 = dot( temp_output_1_0_g157 , temp_output_1_0_g157 );
				float3 appendResult10_g157 = (float3((temp_output_1_0_g157).x , (temp_output_1_0_g157).y , sqrt( ( 1.0 - saturate( dotResult4_g157 ) ) )));
				float3 normalizeResult12_g157 = ASESafeNormalize( appendResult10_g157 );
				float3 temp_output_1007_0 = normalizeResult12_g157;
				float3 surf_pos107_g156 = ase_worldPos;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 surf_norm107_g156 = ase_worldNormal;
				float4 temp_cast_43 = (Gray913).xxxx;
				float mulTime1055 = _TimeParameters.x * _NormVorAAngle;
				float time1066 = mulTime1055;
				float2 voronoiSmoothId1066 = 0;
				float2 appendResult1032 = (float2(_NormVorATileX , _NormVorATileY));
				float mulTime1024 = _TimeParameters.x * ( _NormVorASpeedX * _NormNoiseTypeAMult );
				float mulTime1025 = _TimeParameters.x * ( _NormVorASpeedY * _NormNoiseTypeAMult );
				float2 appendResult1034 = (float2(mulTime1024 , mulTime1025));
				float2 texCoord1042 = IN.ase_texcoord1.xy * appendResult1032 + appendResult1034;
				float2 appendResult1045 = (float2(_NormTypeAAnchorX , _NormTypeAAnchorY));
				float mulTime1044 = _TimeParameters.x * _NormTypeARotSpeed;
				float cos1053 = cos( mulTime1044 );
				float sin1053 = sin( mulTime1044 );
				float2 rotator1053 = mul( texCoord1042 - appendResult1045 , float2x2( cos1053 , -sin1053 , sin1053 , cos1053 )) + appendResult1045;
				float2 coords1066 = rotator1053 * _NormNoiseAScale;
				float2 id1066 = 0;
				float2 uv1066 = 0;
				float fade1066 = 0.5;
				float voroi1066 = 0;
				float rest1066 = 0;
				for( int it1066 = 0; it1066 <3; it1066++ ){
				voroi1066 += fade1066 * voronoi1066( coords1066, time1066, id1066, uv1066, 0,voronoiSmoothId1066 );
				rest1066 += fade1066;
				coords1066 *= 2;
				fade1066 *= 0.5;
				}//Voronoi1066
				voroi1066 /= rest1066;
				float4 temp_cast_44 = (voroi1066).xxxx;
				float simplePerlin3D1060 = snoise( float3( rotator1053 ,  0.0 )*( _NormNoiseAScale * _NormPerlinScale ) );
				simplePerlin3D1060 = simplePerlin3D1060*0.5 + 0.5;
				float4 temp_cast_46 = (simplePerlin3D1060).xxxx;
				float4 temp_cast_47 = (Gray913).xxxx;
				#if defined( _NORMNOISETYPEA_NONE )
				float4 staticSwitch1068 = temp_cast_47;
				#elif defined( _NORMNOISETYPEA_VORONOI )
				float4 staticSwitch1068 = temp_cast_44;
				#elif defined( _NORMNOISETYPEA_PERLIN )
				float4 staticSwitch1068 = temp_cast_46;
				#elif defined( _NORMNOISETYPEA_TEXTURE )
				float4 staticSwitch1068 = tex2D( _NormNoiseAMap, rotator1053 );
				#else
				float4 staticSwitch1068 = temp_cast_47;
				#endif
				float3 linearToGamma1071 = LinearToGamma22( saturate( staticSwitch1068 ).rgb );
				float3 saferPower1079 = abs( (( _NormNoiseAInvert )?( ( 1.0 - linearToGamma1071 ) ):( linearToGamma1071 )) );
				float3 temp_cast_51 = (_NormNoiseTypeAExponential).xxx;
				float3 temp_output_1079_0 = pow( saferPower1079 , temp_cast_51 );
				float4 temp_cast_52 = ((0)).xxxx;
				float mulTime1058 = _TimeParameters.x * _NormVorBAngle;
				float time1064 = mulTime1058;
				float2 voronoiSmoothId1064 = 0;
				float2 appendResult1033 = (float2(_NormVorBTileX , _NormVorBTileY));
				float mulTime1022 = _TimeParameters.x * ( _NormVorBSpeedX * _NormNoiseTypeBMult );
				float mulTime1023 = _TimeParameters.x * ( _NormVorBSpeedY * _NormNoiseTypeBMult );
				float2 appendResult1030 = (float2(mulTime1022 , mulTime1023));
				float2 texCoord1043 = IN.ase_texcoord1.xy * appendResult1033 + ( appendResult1030 + 0.0 );
				float2 appendResult1047 = (float2(_NormTypeBAnchorX , _NormTypeBAnchorY));
				float mulTime1046 = _TimeParameters.x * _NormTypeBRotSpeed;
				float cos1054 = cos( mulTime1046 );
				float sin1054 = sin( mulTime1046 );
				float2 rotator1054 = mul( texCoord1043 - appendResult1047 , float2x2( cos1054 , -sin1054 , sin1054 , cos1054 )) + appendResult1047;
				float2 coords1064 = rotator1054 * _NormNoiseBScale;
				float2 id1064 = 0;
				float2 uv1064 = 0;
				float fade1064 = 0.5;
				float voroi1064 = 0;
				float rest1064 = 0;
				for( int it1064 = 0; it1064 <3; it1064++ ){
				voroi1064 += fade1064 * voronoi1064( coords1064, time1064, id1064, uv1064, 0,voronoiSmoothId1064 );
				rest1064 += fade1064;
				coords1064 *= 2;
				fade1064 *= 0.5;
				}//Voronoi1064
				voroi1064 /= rest1064;
				float4 temp_cast_53 = (voroi1064).xxxx;
				float simplePerlin3D1061 = snoise( float3( rotator1054 ,  0.0 )*( _NormNoiseBScale * _NormPerlinScale ) );
				simplePerlin3D1061 = simplePerlin3D1061*0.5 + 0.5;
				float4 temp_cast_55 = (simplePerlin3D1061).xxxx;
				float4 temp_cast_56 = ((0)).xxxx;
				#if defined( _NORMNOISETYPEB_NONE )
				float4 staticSwitch1067 = temp_cast_56;
				#elif defined( _NORMNOISETYPEB_VORONOI )
				float4 staticSwitch1067 = temp_cast_53;
				#elif defined( _NORMNOISETYPEB_PERLIN )
				float4 staticSwitch1067 = temp_cast_55;
				#elif defined( _NORMNOISETYPEB_TEXTURE )
				float4 staticSwitch1067 = tex2D( _NormNoiseBMap, rotator1054 );
				#else
				float4 staticSwitch1067 = temp_cast_56;
				#endif
				float3 linearToGamma1072 = LinearToGamma22( saturate( staticSwitch1067 ).rgb );
				float3 saferPower1080 = abs( (( _NormNoiseBInvert )?( ( 1.0 - linearToGamma1072 ) ):( linearToGamma1072 )) );
				float3 temp_cast_60 = (_NormNoiseTypeBExponential).xxx;
				float3 temp_output_1080_0 = pow( saferPower1080 , temp_cast_60 );
				float dotResult1083 = dot( temp_output_1079_0 , temp_output_1080_0 );
				float3 temp_cast_61 = (dotResult1083).xxx;
				#if defined( _NORMNOISEMIXTYPE_MULTIPLY )
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_ADD )
				float3 staticSwitch1086 = ( temp_output_1079_0 + temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_SUBTRACT )
				float3 staticSwitch1086 = ( temp_output_1079_0 - temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DIVIDE )
				float3 staticSwitch1086 = ( temp_output_1079_0 / temp_output_1080_0 );
				#elif defined( _NORMNOISEMIXTYPE_DOT )
				float3 staticSwitch1086 = temp_cast_61;
				#else
				float3 staticSwitch1086 = ( temp_output_1079_0 * temp_output_1080_0 );
				#endif
				float3 gammaToLinear1087 = Gamma22ToLinear( staticSwitch1086 );
				float3 linearToGamma1088 = LinearToGamma22( staticSwitch1086 );
				#if defined( _NORMNOISEGRADETYPE_LINEAR )
				float3 staticSwitch1091 = gammaToLinear1087;
				#elif defined( _NORMNOISEGRADETYPE_NORMAL )
				float3 staticSwitch1091 = staticSwitch1086;
				#elif defined( _NORMNOISEGRADETYPE_GAMMA )
				float3 staticSwitch1091 = linearToGamma1088;
				#else
				float3 staticSwitch1091 = gammaToLinear1087;
				#endif
				float height107_g156 = ( saturate( saturate( (saturate( CalculateContrast(_NormNoiseContrast,float4( (staticSwitch1091*_NormNoiseFinalScale + _NormNoiseFinalOffset) , 0.0 )) )*_NormNoiseGradeScale + _NormNoiseGradeOffset) ) ) * _NormMiddleWaveIntensity ).r;
				float scale107_g156 = _NormalStrenggth;
				float3 localPerturbNormal107_g156 = PerturbNormal107_g156( surf_pos107_g156 , surf_norm107_g156 , height107_g156 , scale107_g156 );
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g156 = mul( ase_worldToTangent, localPerturbNormal107_g156);
				float3 WaveNormalRef1103 = worldToTangentDir42_g156;
				float3 lerpResult1137 = lerp( temp_output_1007_0 , WaveNormalRef1103 , _NormalSize);
				float4 unityObjectToClipPos1130 = TransformWorldToHClip(TransformObjectToWorld(IN.ase_texcoord6.xyz));
				float4 computeScreenPos1128 = ComputeScreenPos( unityObjectToClipPos1130 );
				float2 appendResult1126 = (float2(_SSTileX , _SSTileY));
				float2 appendResult1125 = (float2(_SSOffX , _SSOffY));
				float2 texCoord1120 = IN.ase_texcoord1.xy * appendResult1126 + appendResult1125;
				float cos1118 = cos( radians( _PatternRotator ) );
				float sin1118 = sin( radians( _PatternRotator ) );
				float2 rotator1118 = mul( ( computeScreenPos1128 * _SSSize * float4( texCoord1120, 0.0 , 0.0 ) ).xy - float2( 0,0 ) , float2x2( cos1118 , -sin1118 , sin1118 , cos1118 )) + float2( 0,0 );
				float3 unpack1127 = UnpackNormalScale( tex2D( _BluricRefractionPattern, rotator1118 ), (-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0)) );
				unpack1127.z = lerp( 1, unpack1127.z, saturate((-1.0 + (_PatternHeight - -10.0) * (1.0 - -1.0) / (10.0 - -10.0))) );
				float3 BumpForSmooth1116 = unpack1127;
				float3 NewObjectNormal1002 = (( _SSBluricTransparent )?( BlendNormalRNM( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) , BumpForSmooth1116 ) ):( (( _Normal )?( lerpResult1137 ):( temp_output_1007_0 )) ));
				float4 fetchOpaqueVal948 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (( _RefrControl )?( (_NewMin + (RefractFresnelResult985 - _OldMin) * (_NewMax - _NewMin) / (_OldMax - _OldMin)) ):( One909 )) * ( saturate( ase_grabScreenPosNorm ) + float4( NewObjectNormal1002 , 0.0 ) ) ).xy ), 1.0 );
				float4 temp_output_953_0 = CalculateContrast((0.7 + (_ScreenContrast - -1.0) * (1.3 - 0.7) / (1.0 - -1.0)),fetchOpaqueVal948);
				float4 RefractionRef956 = (( _Refraction )?( ( saturate( ( _RefractColor + RefractFresnelResult985 ) ) * temp_output_953_0 * _TransparentIntensity ) ):( ( temp_output_953_0 * _TransparentIntensity ) ));
				float4 temp_output_1140_0 = ( FinalCompRef461 + RefractionRef956 );
				

				surfaceDescription.Alpha = temp_output_1140_0.r;
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
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;1011;-9440,4672;Inherit;False;6085.094;1622.537;Noise and Caustic Animation Settings;95;1103;1100;1096;1097;1091;1093;1090;1089;1086;1075;1076;1077;1078;1068;1067;1062;1040;1039;1038;1031;1014;1013;1012;1029;1028;1052;1051;1063;1037;1036;1035;1016;1019;1015;1050;1049;1026;1027;1048;1102;1101;1099;1098;1095;1094;1092;1088;1087;1085;1084;1083;1082;1081;1080;1079;1074;1073;1072;1071;1070;1069;1066;1065;1064;1061;1060;1059;1058;1057;1056;1055;1054;1053;1047;1046;1045;1044;1043;1042;1041;1034;1033;1032;1030;1025;1024;1023;1022;1021;1020;1018;1017;1107;1110;1111;Noise and Caustic Animation Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1012;-9184,5824;Inherit;False;Property;_NormVorBSpeedX;NormVorBSpeedX;157;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1013;-9152,5904;Inherit;False;Property;_NormNoiseTypeBMult;NormNoiseTypeBMult;147;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1014;-9184,5984;Inherit;False;Property;_NormVorBSpeedY;NormVorBSpeedY;159;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1017;-8912,5824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1018;-8912,5984;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1015;-9248,5120;Inherit;False;Property;_NormVorASpeedX;NormVorASpeedX;132;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1019;-9216,5200;Inherit;False;Property;_NormNoiseTypeAMult;NormNoiseTypeAMult;120;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-9248,5280;Inherit;False;Property;_NormVorASpeedY;NormVorASpeedY;133;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1020;-8960,5120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1021;-8960,5280;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1022;-8768,5824;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1023;-8768,5984;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1024;-8816,5120;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1025;-8816,5280;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1030;-8576,5904;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1027;-8768,4912;Inherit;False;Property;_NormVorATileX;NormVorATileX;127;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1026;-8768,4992;Inherit;False;Property;_NormVorATileY;NormVorATileY;129;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1028;-8768,5648;Inherit;False;Property;_NormVorBTileX;NormVorBTileX;154;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1029;-8768,5728;Inherit;False;Property;_NormVorBTileY;NormVorBTileY;156;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1031;-8576,5808;Inherit;False;Constant;_Float1;Float 1;105;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;914;-6688,1632;Inherit;False;515.2971;324.2447;Local Vars;6;911;910;909;908;913;912;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;1032;-8576,4944;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1033;-8560,5680;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1034;-8576,5184;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1041;-8432,5856;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1035;-8560,5296;Inherit;False;Property;_NormTypeAAnchorX;NormTypeAAnchorX;138;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1036;-8560,5376;Inherit;False;Property;_NormTypeAAnchorY;NormTypeAAnchorY;140;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1037;-8560,5456;Inherit;False;Property;_NormTypeARotSpeed;NormTypeARotSpeed;135;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1038;-8560,6016;Inherit;False;Property;_NormTypeBAnchorX;NormTypeBAnchorX;163;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1039;-8560,6096;Inherit;False;Property;_NormTypeBAnchorY;NormTypeBAnchorY;165;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;-8560,6176;Inherit;False;Property;_NormTypeBRotSpeed;NormTypeBRotSpeed;161;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;-6624,1840;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1042;-8352,4960;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;1043;-8352,5728;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;1044;-8320,5456;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1045;-8304,5328;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;1046;-8320,6176;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1047;-8304,6048;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1048;-8400,4832;Inherit;False;Property;_NormVorAAngle;NormVorAAngle;124;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1049;-8352,5120;Inherit;False;Property;_NormNoiseAScale;NormNoiseAScale;122;0;Create;True;0;0;0;False;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-8352,5200;Inherit;False;Property;_NormPerlinScale;NormPerlinScale;112;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1051;-8400,5552;Inherit;False;Property;_NormVorBAngle;NormVorBAngle;151;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1052;-8336,5648;Inherit;False;Property;_NormNoiseBScale;NormNoiseBScale;149;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;913;-6416,1840;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1053;-8112,5312;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1054;-8112,6016;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;1055;-8112,4832;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1056;-8080,5120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1057;-8096,5648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1058;-8112,5552;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1059;-7824,6208;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1060;-7872,5088;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1061;-7872,5792;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;1064;-7824,5520;Inherit;True;0;1;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;1065;-7824,4736;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;1066;-7824,4816;Inherit;True;0;0;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SamplerNode;1063;-7920,5312;Inherit;True;Property;_NormNoiseAMap;NormNoiseAMap;114;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1062;-7920,6016;Inherit;True;Property;_NormNoiseBMap;NormNoiseBMap;142;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;1067;-7504,5728;Inherit;False;Property;_NormNoiseTypeB;NormNoiseTypeB;94;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1068;-7504,5040;Inherit;False;Property;_NormNoiseTypeA;NormNoiseTypeA;89;0;Create;True;0;0;0;True;3;Space(50);Header(Noise);Space(5);False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1069;-7296,5056;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1070;-7280,5744;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;452;-9440,-912;Inherit;False;2222.72;727.0552;Depth Settings;23;451;927;930;926;924;450;404;156;338;337;336;344;343;340;342;341;339;428;92;91;89;90;93;Depth Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;815;-9440,2928;Inherit;False;5780.81;1630.3;Noise and Caustic Animation Settings;92;929;928;921;902;907;900;899;898;897;896;895;894;891;892;893;890;889;888;887;886;885;884;883;882;881;878;880;879;877;876;875;873;874;872;871;869;870;867;863;868;861;862;866;865;864;860;859;858;857;856;855;853;854;848;847;846;852;851;850;849;845;844;906;841;842;843;838;840;839;836;835;834;905;837;829;828;827;826;831;830;833;832;823;822;821;825;824;820;816;817;819;818;Noise and Caustic Animation Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.LinearToGammaNode;1071;-7120,5040;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1072;-7120,5712;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;449;-9442,-82;Inherit;False;2180;1650.667;Noise Settings;58;440;439;432;431;401;354;357;398;444;443;442;441;434;433;435;436;402;355;161;159;310;311;358;399;446;445;438;437;422;348;403;162;312;400;421;420;430;429;423;408;326;406;327;166;293;356;305;292;295;294;417;366;419;297;416;418;415;447;Noise Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;1073;-6880,5824;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1074;-6880,5120;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-9360,-864;Inherit;False;Property;_DepthDistance;Depth Distance;27;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-9360,-704;Inherit;False;Property;_GradeScale;Grade Scale;29;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-9392,-784;Inherit;False;Property;_DepthExponential;Depth Exponential;28;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-9360,-624;Inherit;False;Property;_GradeOffset;Grade Offset;30;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-9392,-544;Inherit;False;Property;_GradeExponential;Grade Exponential;31;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;818;-9184,4080;Inherit;False;Property;_DefVorBSpeedX;DefVorBSpeedX;158;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-9136,4160;Inherit;False;Property;_DefNoiseTypeBMult;DefNoiseTypeBMult;148;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;817;-9184,4240;Inherit;False;Property;_DefVorBSpeedY;DefVorBSpeedY;160;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1078;-6720,5152;Inherit;False;Property;_NormNoiseTypeAExponential;NormNoiseTypeAExponential;119;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1077;-6720,5856;Inherit;False;Property;_NormNoiseTypeBExponential;NormNoiseTypeBExponential;146;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1076;-6688,5744;Inherit;False;Property;_NormNoiseBInvert;NormNoiseBInvert;143;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1075;-6688,5040;Inherit;False;Property;_NormNoiseAInvert;NormNoiseAInvert;117;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;440;-9232,1088;Inherit;False;Property;_PerASpeedY;Per A Speed Y;59;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;439;-9232,1008;Inherit;False;Property;_PerASpeedX;Per A Speed X;58;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;354;-9392,160;Inherit;False;Property;_VorASpeedX;Vor A Speed X;42;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;401;-9392,240;Inherit;False;Property;_VorASpeedY;Vor A Speed Y;43;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;357;-9392,528;Inherit;False;Property;_VorBSpeedX;Vor B Speed X;49;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;398;-9392,624;Inherit;False;Property;_VorBSpeedY;Vor B Speed Y;50;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;432;-9232,1456;Inherit;False;Property;_PerBSpeedY;Per B Speed Y;67;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-9232,1360;Inherit;False;Property;_PerBSpeedX;Per B Speed X;66;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;428;-9152,-784;Inherit;False;BDepthFade;-1;;2;47987ecf53b4f2847a33a9193dc9d94e;0;5;18;FLOAT;1;False;19;FLOAT;1;False;20;FLOAT;1;False;21;FLOAT;0;False;22;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ProjectionParams;339;-9088,-608;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;341;-9088,-448;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;342;-9024,-272;Inherit;False;Property;_DepthSize;Depth Size;32;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;816;-9248,3376;Inherit;False;Property;_DefVorASpeedX;DefVorASpeedX;131;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;820;-9248,3536;Inherit;False;Property;_DefVorASpeedY;DefVorASpeedY;134;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;824;-8912,4080;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;825;-8912,4240;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-9184,3456;Inherit;False;Property;_DefNoiseTypeAMult;DefNoiseTypeAMult;121;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1079;-6448,5040;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;1080;-6448,5744;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;444;-9040,1088;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;443;-9040,1008;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;402;-9168,240;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;355;-9168,160;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;358;-9168,528;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;399;-9168,624;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-9168,0;Inherit;False;Property;_VorATileX;Vor A TileX;39;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;161;-9168,80;Inherit;False;Property;_VorATileY;Vor A TileY;40;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-9168,368;Inherit;False;Property;_VorBTileX;Vor B TileX;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-9168,448;Inherit;False;Property;_VorBTileY;Vor B TileY;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-9040,848;Inherit;False;Property;_PerATileX;Per A TileX;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;441;-9040,928;Inherit;False;Property;_PerATileY;Per A TileY;57;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;433;-9040,1184;Inherit;False;Property;_PerBTileX;Per B TileX;62;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;-9040,1264;Inherit;False;Property;_PerBTileY;Per B TileY;64;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;435;-9040,1360;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;436;-9040,1456;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;340;-8848,-736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;343;-8832,-448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-8960,3376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;823;-8960,3536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;832;-8768,4080;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;833;-8768,4240;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1081;-6176,5408;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1082;-6176,5648;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1083;-6176,5872;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1084;-6176,5184;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1085;-6176,4960;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;446;-8848,1024;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;445;-8848,864;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;403;-8976,176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;162;-8976,16;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;312;-8976,384;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;400;-8976,560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;422;-8752,544;Inherit;False;Property;_VorBAngleSpeed;Vor B Angle Speed;48;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;348;-8752,64;Inherit;False;Property;_VorAAngleSpeed;Vor A Angle Speed;41;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;438;-8848,1200;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;437;-8848,1392;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;344;-8672,-608;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;830;-8816,3376;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;831;-8816,3536;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-8768,3248;Inherit;False;Property;_DefVorATileY;DefVorATileY;130;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-8768,3168;Inherit;False;Property;_DefVorATileX;DefVorATileX;128;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;828;-8768,3904;Inherit;False;Property;_DefVorBTileX;DefVorBTileX;153;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;829;-8768,3984;Inherit;False;Property;_DefVorBTileY;DefVorBTileY;155;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;837;-8576,4160;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;905;-8576,4064;Inherit;False;Constant;_Float0;Float 0;105;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1086;-5920,5456;Inherit;False;Property;_NormNoiseMixType;NormNoiseMixType;98;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;421;-8464,1264;Inherit;False;Property;_PerBScale;PerBScale;60;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;420;-8464,1040;Inherit;False;Property;_PerAScale;PerAScale;53;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;430;-8688,976;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;429;-8688,1200;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;423;-8512,544;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;-8512,464;Inherit;False;Property;_VorBSmooth;Vor B Smooth;52;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-8480,384;Inherit;False;Property;_VorBScale;VorBScale;45;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;-8512,224;Inherit;False;Property;_VorASmooth;Vor A Smooth;44;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-8480,144;Inherit;False;Property;_VorAScale;VorAScale;38;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;166;-8512,64;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;293;-8784,144;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;356;-8784,384;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GammaToLinearNode;336;-8512,-656;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;337;-8512,-544;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;834;-8576,3200;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;835;-8560,3936;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;836;-8576,3440;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;839;-8528,3552;Inherit;False;Property;_DefTypeAAnchorX;DefTypeAAnchorX;137;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;840;-8528,3632;Inherit;False;Property;_DefTypeAAnchorY;DefTypeAAnchorY;139;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;838;-8528,3712;Inherit;False;Property;_DefTypeARotSpeed;DefTypeARotSpeed;136;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;843;-8528,4272;Inherit;False;Property;_DefTypeBAnchorX;DefTypeBAnchorX;164;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-8528,4352;Inherit;False;Property;_DefTypeBAnchorY;DefTypeBAnchorY;166;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;841;-8528,4432;Inherit;False;Property;_DefTypeBRotSpeed;DefTypeBRotSpeed;162;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;906;-8432,4112;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GammaToLinearNode;1087;-5664,5440;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1088;-5664,5552;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;305;-8272,976;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;1,1,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;292;-8272,1200;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;1,1,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;295;-8320,320;Inherit;True;0;0;1;0;2;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.VoronoiNode;294;-8320,48;Inherit;True;0;0;1;0;2;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.StaticSwitch;338;-8288,-624;Inherit;False;Property;_DepthGradeType2;DepthGradeType2;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;844;-8352,3216;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;845;-8352,3984;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;849;-8320,3712;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;850;-8304,3584;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;851;-8320,4432;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;852;-8304,4304;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;846;-8400,3088;Inherit;False;Property;_DefVorAAngle;DefVorAAngle;125;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;847;-8352,3376;Inherit;False;Property;_DefNoiseAScale;DefNoiseAScale;123;0;Create;True;0;0;0;False;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;848;-8352,3456;Inherit;False;Property;_DefPerlinScale;DefPerlinScale;113;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-8400,3808;Inherit;False;Property;_DefVorBAngle;DefVorBAngle;152;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-8336,3904;Inherit;False;Property;_DefNoiseBScale;DefNoiseBScale;150;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1089;-5472,5680;Inherit;False;Property;_NormNoiseFinalScale;NormNoiseFinalScale;109;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1090;-5472,5760;Inherit;False;Property;_NormNoiseFinalOffset;NormNoiseFinalOffset;110;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1091;-5440,5456;Inherit;True;Property;_NormNoiseGradeType;NormNoiseGradeType;101;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;417;-8016,1088;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;366;-8016,864;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;419;-8016,1312;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;297;-8016,-32;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;416;-8016,192;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;418;-8016,416;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;156;-8032,-624;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;855;-8112,3568;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;856;-8112,4272;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;857;-8112,3088;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;858;-8080,3376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;859;-8096,3904;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;860;-8112,3808;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1092;-5184,5456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1093;-5184,5600;Inherit;False;Property;_NormNoiseContrast;NormNoiseContrast;102;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;415;-7760,576;Inherit;False;Property;_NoiseType;Noise Type;34;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;6;VorAVorB;VorAPerA;VorAPerB;PerAPerB;VorBPerA;VorBPerB;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;924;-7872,-544;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;864;-7824,4464;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;865;-7872,3344;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;866;-7872,4048;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;862;-7920,4272;Inherit;True;Property;_DefNoiseBMap;DefNoiseBMap;141;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;861;-7920,3568;Inherit;True;Property;_DefNoiseAMap;DefNoiseAMap;115;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;868;-7824,3776;Inherit;True;0;1;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;863;-7824,2992;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;867;-7824,3072;Inherit;True;0;0;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.CommentaryNode;457;-9440,1632;Inherit;False;2708.8;1196.2;Depth Texture Settings;47;388;638;637;636;634;455;381;353;426;362;361;372;425;424;410;371;411;383;409;64;380;179;384;453;333;346;393;392;386;315;377;325;313;314;378;329;387;391;390;389;322;321;448;376;330;917;918;Depth Texture Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;1094;-4960,5456;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;447;-7504,576;Inherit;False;NoiseTypeRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;926;-7728,-544;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;930;-7872,-464;Inherit;False;Property;_MiddleWaveEdgeControl;Middle Wave Edge Control;170;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;870;-7504,3984;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;92;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;869;-7504,3296;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;91;0;Create;True;0;0;0;True;3;Space(50);Header(Noise);Space(5);False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1095;-4736,5456;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1097;-4816,5760;Inherit;False;Property;_NormNoiseGradeOffset;NormNoiseGradeOffset;106;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1096;-4816,5680;Inherit;False;Property;_NormNoiseGradeScale;NormNoiseGradeScale;105;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;448;-9280,2112;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-9280,2192;Inherit;False;Property;_NoiseGradeScale;Noise Grade Scale;36;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;322;-9280,2272;Inherit;False;Property;_NoiseGradeOffset;Noise Grade Offset;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-9216,2448;Inherit;False;Property;_FoamTileY;FoamTileY;19;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-9216,2368;Inherit;False;Property;_FoamTileX;FoamTileX;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;927;-7584,-544;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;871;-7296,3312;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;872;-7280,4000;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;1112;-2864,4576;Inherit;False;1913.232;676.3248;Screen Space Bump Map Settings;19;1131;1130;1129;1128;1127;1126;1125;1124;1123;1122;1121;1120;1119;1118;1117;1116;1115;1114;1113;Screen Space Bump Map Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1098;-4576,5472;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;330;-9424,1760;Inherit;False;Property;_WaveSpeedX;WaveSpeedX;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;376;-9424,1840;Inherit;False;Property;_WaveSpeedY;WaveSpeedY;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;325;-9056,2160;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;388;-8992,2416;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-7440,-544;Inherit;False;DepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;874;-7120,3296;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;873;-7120,3968;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1099;-4352,5472;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1121;-2496,4640;Inherit;False;Property;_SSTileX;SSTileX;90;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-2496,4704;Inherit;False;Property;_SSTileY;SSTileY;93;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1123;-2496,4768;Inherit;False;Property;_SSOffX;SSOffX;95;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1124;-2496,4832;Inherit;False;Property;_SSOffY;SSOffY;97;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1129;-2592,4912;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;391;-9248,2624;Inherit;False;Property;_FoamSpeedY;FoamSpeedY;25;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-9248,2544;Inherit;False;Property;_FoamSpeedX;FoamSpeedX;23;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;329;-9248,1760;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;378;-9248,1840;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;314;-9248,2016;Inherit;False;Property;_ShoreTileY;ShoreTileY;9;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-9248,1936;Inherit;False;Property;_ShoreTileX;ShoreTileX;8;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;638;-9024,2720;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;634;-8800,2416;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;917;-8832,2272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;875;-6880,4080;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;876;-6880,3376;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1101;-4192,5472;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1100;-4320,5552;Inherit;False;Property;_NormMiddleWaveIntensity;Norm Middle Wave Intensity;169;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-2336,4784;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1126;-2336,4672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;1130;-2400,4912;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;377;-8992,1792;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;315;-8992,1952;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;386;-9024,2544;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;392;-9024,2624;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;453;-9024,1680;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;637;-8832,2720;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;918;-8656,2272;Inherit;False;Property;_AffectFoamDeformation;AffectFoamDeformation;167;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;877;-6688,3296;Inherit;False;Property;_DefNoiseAInvert;DefNoiseAInvert;116;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;879;-6688,4000;Inherit;False;Property;_DefNoiseBInvert;DefNoiseBInvert;144;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;880;-6720,4112;Inherit;False;Property;_DefNoiseTypeBExponential;DefNoiseTypeBExponential;145;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;878;-6720,3408;Inherit;False;Property;_DefNoiseTypeAExponential;DefNoiseTypeAExponential;118;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1102;-4032,5472;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1110;-4368,5680;Inherit;False;Property;_NormalStrenggth;NormalStrenggth;174;0;Create;True;0;0;0;False;0;False;1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1114;-2416,5088;Inherit;False;Property;_PatternRotator;PatternRotator;70;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1120;-2176,4720;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;1128;-2176,4912;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1131;-2112,4992;Inherit;False;Property;_SSSize;SSSize;65;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;393;-8832,2560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;346;-8832,1968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;333;-8800,1760;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;636;-8656,2416;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;881;-6448,3296;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;882;-6448,4000;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;974;-4345.896,-239.4598;Inherit;False;1558.097;767.1519;Refraction Fresnel Settings;11;985;984;983;982;981;980;979;978;977;976;975;Refraction Fresnel Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;1107;-3888,5568;Inherit;True;Normal From Height;-1;;156;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;10;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.RadiansOpNode;1113;-2144,5088;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1115;-1968,5088;Inherit;False;Property;_PatternHeight;PatternHeight;68;0;Create;True;0;0;0;False;0;False;0.1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1119;-1920,4928;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;384;-8496,2416;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;179;-8496,1904;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;883;-6176,3664;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;884;-6176,3904;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;885;-6176,4128;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;886;-6176,3440;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;887;-6176,3216;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;989;-2848,3792;Inherit;False;1853.964;689.6451;Normals;13;1008;1007;1006;1005;1004;1003;1002;1001;1000;999;1132;1137;1138;Normals;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;975;-4233.896,-159.4598;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;976;-4249.896,48.54022;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;977;-4281.896,256.5402;Inherit;False;Property;_FresnelBias;Fresnel Bias;51;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;978;-4281.896,336.5402;Inherit;False;Property;_FresnelScale;Fresnel Scale;55;0;Create;True;0;0;0;False;0;False;1;2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;979;-4281.896,432.5402;Inherit;False;Property;_FresnelPower;Fresnel Power;56;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1103;-3600,5472;Inherit;False;WaveNormalRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;1117;-1696,5088;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1118;-1744,4928;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;64;-8272,1904;Inherit;True;Property;_ShoreTexture;Shore Texture;6;0;Create;True;0;0;0;True;0;False;-1;c662692ad44de0b45ba4f81297e97381;c662692ad44de0b45ba4f81297e97381;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;380;-8272,2400;Inherit;True;Property;_FoamTexture;Foam Texture;15;0;Create;True;0;0;0;True;0;False;-1;136144d880a69254ea8b2d639e2fe9c5;136144d880a69254ea8b2d639e2fe9c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;888;-5920,3712;Inherit;False;Property;_DefNoiseMixType;DefNoiseMixType;96;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;910;-6624,1760;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;980;-3961.897,48.54022;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1127;-1504,4928;Inherit;True;Property;_BluricRefractionPattern;Bluric Refraction Pattern;63;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1132;-2784,4112;Inherit;False;1103;WaveNormalRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1007;-2816,4208;Inherit;True;Normal Reconstruct Z;-1;;157;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1138;-2752,4432;Inherit;False;Property;_NormalSize;NormalSize;175;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;409;-7984,2400;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;383;-7984,1904;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;889;-5664,3696;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;890;-5664,3808;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;911;-6416,1760;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;984;-3689.897,144.5402;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1116;-1216,4928;Inherit;False;BumpForSmooth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1137;-2448,4208;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;411;-7824,2480;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;371;-7824,1984;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-5472,3936;Inherit;False;Property;_DefNoiseFinalScale;DefNoiseFinalScale;108;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-5472,4016;Inherit;False;Property;_DefNoiseFinalOffset;DefNoiseFinalOffset;111;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;891;-5440,3712;Inherit;True;Property;_DefNoiseGradeType;DefNoiseGradeType;100;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;981;-3497.897,48.54022;Inherit;False;Property;_RefractionInvert;RefractionInvert;61;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;983;-3481.897,-31.45978;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1000;-2224,4272;Inherit;True;1116;BumpForSmooth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1006;-2176,3872;Inherit;True;Property;_Normal;Normal;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;410;-7680,2400;Inherit;True;Property;_InvertFoamTexture;Invert Foam Texture;16;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;424;-7648,2624;Inherit;False;Property;_FoamGradeScale;Foam Grade Scale;21;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;425;-7648,2704;Inherit;False;Property;_FoamGradeOffset;Foam Grade Offset;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;372;-7680,1904;Inherit;True;Property;_InvertShoreTexture;Invert Shore Texture;7;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-7648,2128;Inherit;False;Property;_ShoreGradeScale;Shore Grade Scale;12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;362;-7648,2208;Inherit;False;Property;_ShoreGradeOffset;Shore Grade Offset;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;894;-5184,3712;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;895;-5184,3856;Inherit;False;Property;_DefNoiseContrast;DefNoiseContrast;103;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;982;-3273.897,48.54022;Inherit;False;Property;_Refraction1;Refraction;80;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;1005;-1936,4192;Inherit;False;1;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;426;-7408,2400;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;353;-7408,1904;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;896;-4960,3712;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;945;-4800,1024;Inherit;False;2339.747;792.5537;Refraction Settings;28;972;971;970;969;968;967;966;965;964;963;962;961;960;959;958;957;956;955;954;953;952;951;950;949;948;947;946;933;Refraction Settings;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;908;-6624,1680;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;985;-3049.897,48.54022;Inherit;False;RefractFresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1004;-1680,4112;Inherit;False;Property;_SSBluricTransparent;SS Bluric Transparent;99;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;381;-7168,1904;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;897;-4736,3712;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;898;-4784,3936;Inherit;False;Property;_DefNoiseGradeScale;DefNoiseGradeScale;104;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-4816,4016;Inherit;False;Property;_DefNoiseGradeOffset;DefNoiseGradeOffset;107;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;460;-7152,464;Inherit;False;1670.667;372.3334;Final Comp;13;920;904;925;461;916;454;903;345;413;375;374;373;456;Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;909;-6416,1680;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;961;-4608,1216;Inherit;False;Property;_OldMin;Old Min;18;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;962;-4608,1296;Inherit;False;Property;_OldMax;Old Max;20;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;963;-4608,1376;Inherit;False;Property;_NewMin;New Min;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;964;-4608,1456;Inherit;False;Property;_NewMax;New Max;26;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;972;-4704,1136;Inherit;False;985;RefractFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;967;-4560,1552;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1002;-1248,4112;Inherit;True;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;455;-6960,1904;Inherit;False;DepthTextureRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;900;-4576,3728;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;960;-4432,1232;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.9;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;968;-4320,1552;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;966;-4352,1456;Inherit;False;909;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;969;-4384,1728;Inherit;False;1002;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;456;-7120,624;Inherit;False;455;DepthTextureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;907;-4352,3728;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;965;-4144,1344;Inherit;False;Property;_RefrControl;RefrControl;126;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;970;-4144,1616;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SaturateNode;404;-7872,-624;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;373;-6848,576;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;374;-6848,688;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;928;-4320,3808;Inherit;False;Property;_MiddleWaveIntensity;Middle Wave Intensity;168;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;921;-4192,3728;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;955;-3888,1648;Inherit;False;Property;_ScreenContrast;ScreenContrast;35;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;947;-3888,1440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;952;-3904,1264;Inherit;False;985;RefractFresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;951;-3888,1088;Inherit;False;Property;_RefractColor;Refract Color;69;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;-7440,-624;Inherit;False;SaturateDepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;375;-6624,592;Inherit;True;Property;_TextureGradeType;TextureGradeType;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;929;-4032,3728;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;949;-3632,1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;954;-3616,1616;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.7;False;4;FLOAT;1.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;948;-3744,1440;Inherit;False;Global;_GrabScreen0;Grab Screen 0;11;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;413;-6336,592;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;454;-6400,512;Inherit;False;450;SaturateDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;902;-3872,3728;Inherit;False;CausticRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;950;-3520,1200;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;953;-3424,1440;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;959;-3408,1568;Inherit;False;Property;_TransparentIntensity;Transparent Intensity;13;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;345;-6176,528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;-6224,672;Inherit;False;902;CausticRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;920;-6224,752;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;957;-3104,1440;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;971;-3104,1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;903;-6000,528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;925;-6032,672;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;958;-2944,1200;Inherit;False;Property;_Refraction;Refraction;74;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;916;-5856,528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;956;-2704,1200;Inherit;False;RefractionRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;461;-5712,528;Inherit;False;FinalCompRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;593;-7168,-912;Inherit;False;2505.732;1290.468;Double Texture Map Control Settings;44;592;349;623;606;459;625;624;622;604;621;620;619;586;587;585;616;617;618;588;474;469;613;612;611;610;615;614;602;584;583;582;581;609;505;504;506;580;599;464;597;465;596;458;579;Double Texture Map Control Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;988;-976,3936;Inherit;False;816.4238;534.0689;Normal Light Direction;4;994;993;992;991;Normal Light Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;990;-128,3936;Inherit;False;816.4238;534.0689;Normal View Direction;4;998;997;996;995;Normal View Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;462;-1824,1440;Inherit;False;461;FinalCompRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;973;-1840,1536;Inherit;False;956;RefractionRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;579;-6304,-848;Inherit;True;Property;_ShoreColorMap;Shore Color Map;71;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;458;-6080,-640;Inherit;True;Property;_ShoreT;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;596;-6080,-128;Inherit;True;Property;_ShoreT1;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;465;-6272,-640;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;597;-6288,-128;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;464;-6560,-784;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;599;-6560,-128;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;580;-6736,-672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;506;-6736,-848;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-6928,-864;Inherit;False;Property;_ShoreCTileX;ShoreC Tile X;76;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-6928,-784;Inherit;False;Property;_ShoreCTileY;ShoreC Tile Y;77;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;609;-6912,-208;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;581;-7120,-688;Inherit;False;Property;_ShoreCSpeedX;ShoreC Speed X;78;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-7120,-608;Inherit;False;Property;_ShoreCSpeedY;ShoreC Speed Y;79;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;583;-6912,-688;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;584;-6912,-608;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;602;-6736,-48;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;614;-6944,-64;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;615;-6944,16;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;610;-7120,-224;Inherit;False;Property;_ShoreCBTileX;ShoreC B Tile X;84;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;611;-7120,-144;Inherit;False;Property;_ShoreCBTileY;ShoreC B Tile Y;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;612;-7152,-64;Inherit;False;Property;_ShoreCBSpeedX;ShoreC B Speed X;86;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;613;-7152,16;Inherit;False;Property;_ShoreCBSpeedY;ShoreC B Speed Y;87;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;-6896,-320;Inherit;False;Property;_ShoreCRotSpeed;ShoreC Rot Speed;72;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;474;-6688,-320;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;588;-6496,-320;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;618;-6496,96;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;617;-6672,96;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-6896,96;Inherit;False;Property;_ShoreCBRotSpeed;ShoreC B Rot Speed;81;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;585;-6496,-480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;587;-6720,-416;Inherit;False;Property;_ShoreCAnchorY;ShoreC Anchor Y;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;586;-6720,-496;Inherit;False;Property;_ShoreCAnchorX;ShoreC Anchor X;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;619;-6496,224;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;620;-6720,288;Inherit;False;Property;_ShoreCBAnchorY;ShoreC B Anchor Y;83;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;621;-6720,208;Inherit;False;Property;_ShoreCBAnchorX;ShoreC B Anchor X;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;-5728,-544;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;622;-5728,-432;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;624;-5728,-320;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;625;-5728,-208;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;459;-5040,-448;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;606;-5216,-448;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;623;-5536,-448;Inherit;False;Property;_ShoreTextureBlendingType;Shore Texture Blending Type;88;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;Additive;Subtractive;Multiplicative;Divide;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;349;-5280,-640;Inherit;False;Property;_ShoreColor;Shore Color;4;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-4880,-448;Inherit;False;ShoreRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;946;-4768,1216;Inherit;False;150;100;New Note;;1,1,1,1;New Min Kırılma indisi. Bunu remapla düzenle$;0;0
Node;AmplifyShaderEditor.ColorNode;1010;-1376,1104;Inherit;False;Property;_Color0;Color 0;171;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;991;-656,4096;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;992;-912,4224;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;993;-912,4000;Inherit;True;1003;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;994;-416,4096;Float;True;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;995;176,4096;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;996;-80,4000;Inherit;True;1003;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;997;-64,4256;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;998;416,4096;Float;True;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1001;-1504,3888;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1003;-1248,3888;Float;True;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;1111;-4096,5808;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-100;False;4;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1008;-2592,3872;Inherit;True;Property;_NormalMap;Normal Map;0;1;[Normal];Create;True;1;Normal Controls;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;999;-2880,3872;Float;True;Property;_NormalScale;Normal Scale;5;0;Create;True;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-2032,1728;Inherit;False;Property;_ClipThreshold;ClipThreshold;33;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1106;-1445.862,1354.706;Inherit;False;1103;WaveNormalRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;932;-1792,1216;Inherit;False;592;ShoreRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1108;-1488,1696;Inherit;False;Property;_Specular;Specular;172;0;Create;True;0;0;0;False;0;False;0.5;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1109;-1488,1792;Inherit;False;Property;_Smoothnes;Smoothnes;173;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1140;-1520,1456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;933;-2528,1216;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;935;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;936;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;937;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;938;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;939;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;940;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;2;5;False;;10;False;;0;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;941;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;942;-4896,1408;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;934;-1104,1344;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;BUDU Shaders/BWaterSurface;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;True;True;2;5;False;;10;False;;0;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638539990163673858;Workflow;0;0;Surface;1;638539990238331117;  Refraction Model;0;638539992186192956;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;638539992750273948;  Use Shadow Threshold;0;0;Receive Shadows;0;638539992757391956;Receive SSAO;1;638540006485563500;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;638539992919182396;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;638539993132622113;0;10;False;True;False;True;True;True;True;True;True;True;False;;False;0
WireConnection;1017;0;1012;0
WireConnection;1017;1;1013;0
WireConnection;1018;0;1014;0
WireConnection;1018;1;1013;0
WireConnection;1020;0;1015;0
WireConnection;1020;1;1019;0
WireConnection;1021;0;1016;0
WireConnection;1021;1;1019;0
WireConnection;1022;0;1017;0
WireConnection;1023;0;1018;0
WireConnection;1024;0;1020;0
WireConnection;1025;0;1021;0
WireConnection;1030;0;1022;0
WireConnection;1030;1;1023;0
WireConnection;1032;0;1027;0
WireConnection;1032;1;1026;0
WireConnection;1033;0;1028;0
WireConnection;1033;1;1029;0
WireConnection;1034;0;1024;0
WireConnection;1034;1;1025;0
WireConnection;1041;0;1030;0
WireConnection;1041;1;1031;0
WireConnection;1042;0;1032;0
WireConnection;1042;1;1034;0
WireConnection;1043;0;1033;0
WireConnection;1043;1;1041;0
WireConnection;1044;0;1037;0
WireConnection;1045;0;1035;0
WireConnection;1045;1;1036;0
WireConnection;1046;0;1040;0
WireConnection;1047;0;1038;0
WireConnection;1047;1;1039;0
WireConnection;913;0;912;0
WireConnection;1053;0;1042;0
WireConnection;1053;1;1045;0
WireConnection;1053;2;1044;0
WireConnection;1054;0;1043;0
WireConnection;1054;1;1047;0
WireConnection;1054;2;1046;0
WireConnection;1055;0;1048;0
WireConnection;1056;0;1049;0
WireConnection;1056;1;1050;0
WireConnection;1057;0;1052;0
WireConnection;1057;1;1050;0
WireConnection;1058;0;1051;0
WireConnection;1060;0;1053;0
WireConnection;1060;1;1056;0
WireConnection;1061;0;1054;0
WireConnection;1061;1;1057;0
WireConnection;1064;0;1054;0
WireConnection;1064;1;1058;0
WireConnection;1064;2;1052;0
WireConnection;1066;0;1053;0
WireConnection;1066;1;1055;0
WireConnection;1066;2;1049;0
WireConnection;1063;1;1053;0
WireConnection;1062;1;1054;0
WireConnection;1067;1;1059;0
WireConnection;1067;0;1064;0
WireConnection;1067;2;1061;0
WireConnection;1067;3;1062;0
WireConnection;1068;1;1065;0
WireConnection;1068;0;1066;0
WireConnection;1068;2;1060;0
WireConnection;1068;3;1063;0
WireConnection;1069;0;1068;0
WireConnection;1070;0;1067;0
WireConnection;1071;0;1069;0
WireConnection;1072;0;1070;0
WireConnection;1073;0;1072;0
WireConnection;1074;0;1071;0
WireConnection;1076;0;1072;0
WireConnection;1076;1;1073;0
WireConnection;1075;0;1071;0
WireConnection;1075;1;1074;0
WireConnection;428;18;93;0
WireConnection;428;19;89;0
WireConnection;428;20;90;0
WireConnection;428;21;91;0
WireConnection;428;22;92;0
WireConnection;824;0;818;0
WireConnection;824;1;819;0
WireConnection;825;0;817;0
WireConnection;825;1;819;0
WireConnection;1079;0;1075;0
WireConnection;1079;1;1078;0
WireConnection;1080;0;1076;0
WireConnection;1080;1;1077;0
WireConnection;444;0;440;0
WireConnection;443;0;439;0
WireConnection;402;0;401;0
WireConnection;355;0;354;0
WireConnection;358;0;357;0
WireConnection;399;0;398;0
WireConnection;435;0;431;0
WireConnection;436;0;432;0
WireConnection;340;0;428;0
WireConnection;340;1;339;1
WireConnection;343;0;341;4
WireConnection;343;1;342;0
WireConnection;822;0;816;0
WireConnection;822;1;821;0
WireConnection;823;0;820;0
WireConnection;823;1;821;0
WireConnection;832;0;824;0
WireConnection;833;0;825;0
WireConnection;1081;0;1079;0
WireConnection;1081;1;1080;0
WireConnection;1082;0;1079;0
WireConnection;1082;1;1080;0
WireConnection;1083;0;1079;0
WireConnection;1083;1;1080;0
WireConnection;1084;0;1079;0
WireConnection;1084;1;1080;0
WireConnection;1085;0;1079;0
WireConnection;1085;1;1080;0
WireConnection;446;0;443;0
WireConnection;446;1;444;0
WireConnection;445;0;442;0
WireConnection;445;1;441;0
WireConnection;403;0;355;0
WireConnection;403;1;402;0
WireConnection;162;0;159;0
WireConnection;162;1;161;0
WireConnection;312;0;310;0
WireConnection;312;1;311;0
WireConnection;400;0;358;0
WireConnection;400;1;399;0
WireConnection;438;0;433;0
WireConnection;438;1;434;0
WireConnection;437;0;435;0
WireConnection;437;1;436;0
WireConnection;344;0;343;0
WireConnection;344;1;340;0
WireConnection;830;0;822;0
WireConnection;831;0;823;0
WireConnection;837;0;832;0
WireConnection;837;1;833;0
WireConnection;1086;1;1085;0
WireConnection;1086;0;1084;0
WireConnection;1086;2;1081;0
WireConnection;1086;3;1082;0
WireConnection;1086;4;1083;0
WireConnection;430;0;445;0
WireConnection;430;1;446;0
WireConnection;429;0;438;0
WireConnection;429;1;437;0
WireConnection;423;0;422;0
WireConnection;166;0;348;0
WireConnection;293;0;162;0
WireConnection;293;1;403;0
WireConnection;356;0;312;0
WireConnection;356;1;400;0
WireConnection;336;0;344;0
WireConnection;337;0;344;0
WireConnection;834;0;827;0
WireConnection;834;1;826;0
WireConnection;835;0;828;0
WireConnection;835;1;829;0
WireConnection;836;0;830;0
WireConnection;836;1;831;0
WireConnection;906;0;837;0
WireConnection;906;1;905;0
WireConnection;1087;0;1086;0
WireConnection;1088;0;1086;0
WireConnection;305;0;430;0
WireConnection;305;1;420;0
WireConnection;292;0;429;0
WireConnection;292;1;421;0
WireConnection;295;0;356;0
WireConnection;295;1;423;0
WireConnection;295;2;326;0
WireConnection;295;3;408;0
WireConnection;294;0;293;0
WireConnection;294;1;166;0
WireConnection;294;2;327;0
WireConnection;294;3;406;0
WireConnection;338;1;336;0
WireConnection;338;0;344;0
WireConnection;338;2;337;0
WireConnection;844;0;834;0
WireConnection;844;1;836;0
WireConnection;845;0;835;0
WireConnection;845;1;906;0
WireConnection;849;0;838;0
WireConnection;850;0;839;0
WireConnection;850;1;840;0
WireConnection;851;0;841;0
WireConnection;852;0;843;0
WireConnection;852;1;842;0
WireConnection;1091;1;1087;0
WireConnection;1091;0;1086;0
WireConnection;1091;2;1088;0
WireConnection;417;0;295;0
WireConnection;417;1;292;0
WireConnection;366;0;305;0
WireConnection;366;1;292;0
WireConnection;419;0;295;0
WireConnection;419;1;305;0
WireConnection;297;0;294;0
WireConnection;297;1;295;0
WireConnection;416;0;294;0
WireConnection;416;1;305;0
WireConnection;418;0;294;0
WireConnection;418;1;292;0
WireConnection;156;0;338;0
WireConnection;855;0;844;0
WireConnection;855;1;850;0
WireConnection;855;2;849;0
WireConnection;856;0;845;0
WireConnection;856;1;852;0
WireConnection;856;2;851;0
WireConnection;857;0;846;0
WireConnection;858;0;847;0
WireConnection;858;1;848;0
WireConnection;859;0;853;0
WireConnection;859;1;848;0
WireConnection;860;0;854;0
WireConnection;1092;0;1091;0
WireConnection;1092;1;1089;0
WireConnection;1092;2;1090;0
WireConnection;415;1;297;0
WireConnection;415;0;416;0
WireConnection;415;2;418;0
WireConnection;415;3;366;0
WireConnection;415;4;417;0
WireConnection;415;5;419;0
WireConnection;924;0;156;0
WireConnection;865;0;855;0
WireConnection;865;1;858;0
WireConnection;866;0;856;0
WireConnection;866;1;859;0
WireConnection;862;1;856;0
WireConnection;861;1;855;0
WireConnection;868;0;856;0
WireConnection;868;1;860;0
WireConnection;868;2;853;0
WireConnection;867;0;855;0
WireConnection;867;1;857;0
WireConnection;867;2;847;0
WireConnection;1094;1;1092;0
WireConnection;1094;0;1093;0
WireConnection;447;0;415;0
WireConnection;926;0;924;0
WireConnection;870;1;864;0
WireConnection;870;0;868;0
WireConnection;870;2;866;0
WireConnection;870;3;862;0
WireConnection;869;1;863;0
WireConnection;869;0;867;0
WireConnection;869;2;865;0
WireConnection;869;3;861;0
WireConnection;1095;0;1094;0
WireConnection;927;0;926;0
WireConnection;927;1;930;0
WireConnection;871;0;869;0
WireConnection;872;0;870;0
WireConnection;1098;0;1095;0
WireConnection;1098;1;1096;0
WireConnection;1098;2;1097;0
WireConnection;325;0;448;0
WireConnection;325;1;321;0
WireConnection;325;2;322;0
WireConnection;388;0;390;0
WireConnection;388;1;389;0
WireConnection;451;0;927;0
WireConnection;874;0;871;0
WireConnection;873;0;872;0
WireConnection;1099;0;1098;0
WireConnection;329;0;330;0
WireConnection;378;0;376;0
WireConnection;634;0;325;0
WireConnection;634;1;388;0
WireConnection;917;0;325;0
WireConnection;917;1;388;0
WireConnection;875;0;873;0
WireConnection;876;0;874;0
WireConnection;1101;0;1099;0
WireConnection;1125;0;1123;0
WireConnection;1125;1;1124;0
WireConnection;1126;0;1121;0
WireConnection;1126;1;1122;0
WireConnection;1130;0;1129;0
WireConnection;377;0;329;0
WireConnection;377;1;378;0
WireConnection;315;0;313;0
WireConnection;315;1;314;0
WireConnection;386;0;387;0
WireConnection;392;0;391;0
WireConnection;637;0;638;0
WireConnection;918;0;917;0
WireConnection;918;1;634;0
WireConnection;877;0;874;0
WireConnection;877;1;876;0
WireConnection;879;0;873;0
WireConnection;879;1;875;0
WireConnection;1102;0;1101;0
WireConnection;1102;1;1100;0
WireConnection;1120;0;1126;0
WireConnection;1120;1;1125;0
WireConnection;1128;0;1130;0
WireConnection;393;0;386;0
WireConnection;393;1;392;0
WireConnection;346;0;325;0
WireConnection;346;1;315;0
WireConnection;333;0;453;0
WireConnection;333;1;377;0
WireConnection;636;0;918;0
WireConnection;636;1;637;0
WireConnection;881;0;877;0
WireConnection;881;1;878;0
WireConnection;882;0;879;0
WireConnection;882;1;880;0
WireConnection;1107;20;1102;0
WireConnection;1107;110;1110;0
WireConnection;1113;0;1114;0
WireConnection;1119;0;1128;0
WireConnection;1119;1;1131;0
WireConnection;1119;2;1120;0
WireConnection;384;0;636;0
WireConnection;384;1;393;0
WireConnection;179;0;346;0
WireConnection;179;1;333;0
WireConnection;883;0;881;0
WireConnection;883;1;882;0
WireConnection;884;0;881;0
WireConnection;884;1;882;0
WireConnection;885;0;881;0
WireConnection;885;1;882;0
WireConnection;886;0;881;0
WireConnection;886;1;882;0
WireConnection;887;0;881;0
WireConnection;887;1;882;0
WireConnection;1103;0;1107;40
WireConnection;1117;0;1115;0
WireConnection;1118;0;1119;0
WireConnection;1118;2;1113;0
WireConnection;64;1;179;0
WireConnection;380;1;384;0
WireConnection;888;1;887;0
WireConnection;888;0;886;0
WireConnection;888;2;883;0
WireConnection;888;3;884;0
WireConnection;888;4;885;0
WireConnection;980;0;975;0
WireConnection;980;4;976;0
WireConnection;980;1;977;0
WireConnection;980;2;978;0
WireConnection;980;3;979;0
WireConnection;1127;1;1118;0
WireConnection;1127;5;1117;0
WireConnection;409;0;380;0
WireConnection;383;0;64;0
WireConnection;889;0;888;0
WireConnection;890;0;888;0
WireConnection;911;0;910;0
WireConnection;984;0;980;0
WireConnection;1116;0;1127;0
WireConnection;1137;0;1007;0
WireConnection;1137;1;1132;0
WireConnection;1137;2;1138;0
WireConnection;411;0;409;0
WireConnection;371;0;383;0
WireConnection;891;1;889;0
WireConnection;891;0;888;0
WireConnection;891;2;890;0
WireConnection;981;0;980;0
WireConnection;981;1;984;0
WireConnection;1006;0;1007;0
WireConnection;1006;1;1137;0
WireConnection;410;0;409;0
WireConnection;410;1;411;0
WireConnection;372;0;383;0
WireConnection;372;1;371;0
WireConnection;894;0;891;0
WireConnection;894;1;893;0
WireConnection;894;2;892;0
WireConnection;982;0;983;0
WireConnection;982;1;981;0
WireConnection;1005;0;1006;0
WireConnection;1005;1;1000;0
WireConnection;426;0;410;0
WireConnection;426;1;424;0
WireConnection;426;2;425;0
WireConnection;353;0;372;0
WireConnection;353;1;361;0
WireConnection;353;2;362;0
WireConnection;896;1;894;0
WireConnection;896;0;895;0
WireConnection;985;0;982;0
WireConnection;1004;0;1006;0
WireConnection;1004;1;1005;0
WireConnection;381;0;353;0
WireConnection;381;1;426;0
WireConnection;897;0;896;0
WireConnection;909;0;908;0
WireConnection;1002;0;1004;0
WireConnection;455;0;381;0
WireConnection;900;0;897;0
WireConnection;900;1;898;0
WireConnection;900;2;899;0
WireConnection;960;0;972;0
WireConnection;960;1;961;0
WireConnection;960;2;962;0
WireConnection;960;3;963;0
WireConnection;960;4;964;0
WireConnection;968;0;967;0
WireConnection;907;0;900;0
WireConnection;965;0;966;0
WireConnection;965;1;960;0
WireConnection;970;0;968;0
WireConnection;970;1;969;0
WireConnection;404;0;156;0
WireConnection;373;0;456;0
WireConnection;374;0;456;0
WireConnection;921;0;907;0
WireConnection;947;0;965;0
WireConnection;947;1;970;0
WireConnection;450;0;404;0
WireConnection;375;1;373;0
WireConnection;375;0;456;0
WireConnection;375;2;374;0
WireConnection;929;0;921;0
WireConnection;929;1;928;0
WireConnection;949;0;951;0
WireConnection;949;1;952;0
WireConnection;954;0;955;0
WireConnection;948;0;947;0
WireConnection;413;0;375;0
WireConnection;902;0;929;0
WireConnection;950;0;949;0
WireConnection;953;1;948;0
WireConnection;953;0;954;0
WireConnection;345;0;454;0
WireConnection;345;1;413;0
WireConnection;957;0;950;0
WireConnection;957;1;953;0
WireConnection;957;2;959;0
WireConnection;971;0;953;0
WireConnection;971;1;959;0
WireConnection;903;0;345;0
WireConnection;925;0;904;0
WireConnection;925;1;920;0
WireConnection;958;0;971;0
WireConnection;958;1;957;0
WireConnection;916;0;903;0
WireConnection;916;1;925;0
WireConnection;956;0;958;0
WireConnection;461;0;916;0
WireConnection;458;0;579;0
WireConnection;458;1;465;0
WireConnection;596;0;579;0
WireConnection;596;1;597;0
WireConnection;465;0;464;0
WireConnection;465;1;585;0
WireConnection;465;2;588;0
WireConnection;597;0;599;0
WireConnection;597;1;619;0
WireConnection;597;2;618;0
WireConnection;464;0;506;0
WireConnection;464;1;580;0
WireConnection;599;0;609;0
WireConnection;599;1;602;0
WireConnection;580;0;583;0
WireConnection;580;1;584;0
WireConnection;506;0;504;0
WireConnection;506;1;505;0
WireConnection;609;0;610;0
WireConnection;609;1;611;0
WireConnection;583;0;581;0
WireConnection;584;0;582;0
WireConnection;602;0;614;0
WireConnection;602;1;615;0
WireConnection;614;0;612;0
WireConnection;615;0;613;0
WireConnection;474;0;469;0
WireConnection;588;0;474;0
WireConnection;618;0;617;0
WireConnection;617;0;616;0
WireConnection;585;0;586;0
WireConnection;585;1;587;0
WireConnection;619;0;621;0
WireConnection;619;1;620;0
WireConnection;604;0;458;0
WireConnection;604;1;596;0
WireConnection;622;0;458;0
WireConnection;622;1;596;0
WireConnection;624;0;458;0
WireConnection;624;1;596;0
WireConnection;625;0;458;0
WireConnection;625;1;596;0
WireConnection;459;0;349;0
WireConnection;459;1;606;0
WireConnection;606;0;623;0
WireConnection;623;1;604;0
WireConnection;623;0;622;0
WireConnection;623;2;624;0
WireConnection;623;3;625;0
WireConnection;592;0;459;0
WireConnection;991;0;993;0
WireConnection;991;1;992;0
WireConnection;994;0;991;0
WireConnection;995;0;996;0
WireConnection;995;1;997;0
WireConnection;998;0;995;0
WireConnection;1001;0;1004;0
WireConnection;1003;0;1001;0
WireConnection;1111;0;1110;0
WireConnection;1008;5;999;0
WireConnection;1140;0;462;0
WireConnection;1140;1;973;0
WireConnection;934;0;932;0
WireConnection;934;1;1106;0
WireConnection;934;2;1140;0
WireConnection;934;9;1108;0
WireConnection;934;4;1109;0
WireConnection;934;6;1140;0
ASEEND*/
//CHKSM=7D805CED795AB60E6375814BB25C853ED882C27F
// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BWaterToon"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[KeywordEnum(Linear,Normal,Gamma)] _DepthGradeType2("DepthGradeType2", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _TextureGradeType("TextureGradeType", Float) = 0
		[HDR]_ShoreColor("Shore Color", Color) = (1,1,1,1)
		_ShoreTexture("Shore Texture", 2D) = "white" {}
		[Toggle]_InvertShoreTexture("Invert Shore Texture", Float) = 0
		_ShoreTileX("ShoreTileX", Float) = 1
		_ShoreTileY("ShoreTileY", Float) = 1
		_WaveSpeedX("WaveSpeedX", Float) = 1
		_WaveSpeedY("WaveSpeedY", Float) = 1
		_ShoreGradeScale("Shore Grade Scale", Float) = 1
		_ShoreGradeOffset("Shore Grade Offset", Float) = 0
		_FoamTexture("Foam Texture", 2D) = "white" {}
		[Toggle]_InvertFoamTexture("Invert Foam Texture", Float) = 1
		_FoamTileX("FoamTileX", Float) = 1
		_FoamTileY("FoamTileY", Float) = 1
		_FoamGradeScale("Foam Grade Scale", Float) = 1
		_FoamGradeOffset("Foam Grade Offset", Float) = 0
		_FoamSpeedX("FoamSpeedX", Float) = 0.1
		_FoamSpeedY("FoamSpeedY", Float) = 0.1
		_DepthDistance("Depth Distance", Float) = 1
		_DepthExponential("Depth Exponential", Float) = 1
		_GradeScale("Grade Scale", Float) = 1
		_GradeOffset("Grade Offset", Float) = 0
		_GradeExponential("Grade Exponential", Float) = 1
		_DepthSize("Depth Size", Float) = 1
		_ClipThreshold("ClipThreshold", Range( 0 , 1)) = 0.5
		[KeywordEnum(VorAVorB,VorAPerA,VorAPerB,PerAPerB,VorBPerA,VorBPerB)] _NoiseType("Noise Type", Float) = 0
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
		_VorBSmooth("Vor B Smooth", Float) = 1
		_PerAScale("PerAScale", Float) = 4
		_PerATileX("Per A TileX", Float) = 1
		_PerATileY("Per A TileY", Float) = 1
		_PerASpeedX("Per A Speed X", Float) = 0.1
		_PerASpeedY("Per A Speed Y", Float) = 0.1
		_PerBScale("PerBScale", Float) = 4
		_PerBTileX("Per B TileX", Float) = 1
		_PerBTileY("Per B TileY", Float) = 1
		_PerBSpeedX("Per B Speed X", Float) = -0.1
		_PerBSpeedY("Per B Speed Y", Float) = -0.1
		_ShoreColorMap("Shore Color Map", 2D) = "white" {}
		_ShoreCRotSpeed("ShoreC Rot Speed", Float) = 1
		_ShoreCAnchorX("ShoreC Anchor X", Float) = 0
		_ShoreCAnchorY("ShoreC Anchor Y", Float) = 0
		_ShoreCTileX("ShoreC Tile X", Float) = 0
		_ShoreCTileY("ShoreC Tile Y", Float) = 0
		_ShoreCSpeedX("ShoreC Speed X", Float) = 0
		_ShoreCSpeedY("ShoreC Speed Y", Float) = 0
		_ShoreCBRotSpeed("ShoreC B Rot Speed", Float) = 1
		_ShoreCBAnchorX("ShoreC B Anchor X", Float) = 0
		_ShoreCBAnchorY("ShoreC B Anchor Y", Float) = 0
		_ShoreCBTileX("ShoreC B Tile X", Float) = 0
		_ShoreCBTileY("ShoreC B Tile Y", Float) = 0
		_ShoreCBSpeedX("ShoreC B Speed X", Float) = 0
		_ShoreCBSpeedY("ShoreC B Speed Y", Float) = 0
		[KeywordEnum(Additive,Subtractive,Multiplicative,Divide)] _ShoreTextureBlendingType("Shore Texture Blending Type", Float) = 0
		[Space(50)][Header(Noise)][Space(5)][KeywordEnum(None,Voronoi,Perlin,Texture)] _NoiseTypeA("NoiseTypeA", Float) = 0
		[KeywordEnum(None,Voronoi,Perlin,Texture)] _NoiseTypeB("NoiseTypeB", Float) = 0
		[KeywordEnum(Multiply,Add,Subtract,Divide,Dot)] _DefNoiseMixType("DefNoiseMixType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DefNoiseGradeType("DefNoiseGradeType", Float) = 0
		_DefNoiseContrast("DefNoiseContrast", Float) = 1
		_DefNoiseGradeScale("DefNoiseGradeScale", Float) = 1
		_DefNoiseGradeOffset("DefNoiseGradeOffset", Float) = 0.1
		_DefNoiseFinalScale("DefNoiseFinalScale", Range( 0 , 50)) = 1
		_DefNoiseFinalOffset("DefNoiseFinalOffset", Range( 0 , 1)) = 0
		_DefPerlinScale("DefPerlinScale", Float) = 1
		[Space(10)]_DefNoiseAMap("DefNoiseAMap", 2D) = "white" {}
		[Toggle]_DefNoiseAInvert("DefNoiseAInvert", Float) = 0
		_DefNoiseTypeAExponential("DefNoiseTypeAExponential", Float) = 1
		_DefNoiseTypeAMult("DefNoiseTypeAMult", Float) = 1
		_DefNoiseAScale("DefNoiseAScale", Float) = 8
		_DefVorAAngle("DefVorAAngle", Range( -8 , 8)) = 0.1
		_DefVorATileX("DefVorATileX", Float) = 1
		_DefVorATileY("DefVorATileY", Float) = 1
		_DefVorASpeedX("DefVorASpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorASpeedY("DefVorASpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeARotSpeed("DefTypeARotSpeed", Float) = 0
		_DefTypeAAnchorX("DefTypeAAnchorX", Float) = 0
		_DefTypeAAnchorY("DefTypeAAnchorY", Float) = 0
		[Space(10)]_DefNoiseBMap("DefNoiseBMap", 2D) = "white" {}
		[Toggle]_DefNoiseBInvert("DefNoiseBInvert", Float) = 0
		_DefNoiseTypeBExponential("DefNoiseTypeBExponential", Float) = 1
		_DefNoiseTypeBMult("DefNoiseTypeBMult", Float) = 1
		_DefNoiseBScale("DefNoiseBScale", Float) = 5
		_DefVorBAngle("DefVorBAngle", Range( -8 , 8)) = 0.1
		_DefVorBTileX("DefVorBTileX", Float) = 1
		_DefVorBTileY("DefVorBTileY", Float) = 1
		_DefVorBSpeedX("DefVorBSpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorBSpeedY("DefVorBSpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeBRotSpeed("DefTypeBRotSpeed", Float) = 0
		_DefTypeBAnchorX("DefTypeBAnchorX", Float) = 0
		_DefTypeBAnchorY("DefTypeBAnchorY", Float) = 0
		[Toggle]_AffectFoamDeformation("AffectFoamDeformation", Float) = 0
		_MiddleWaveIntensity("Middle Wave Intensity", Range( 0 , 1)) = 0.5
		_MiddleWaveEdgeControl("Middle Wave Edge Control", Float) = 1


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

		Cull Back
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

			

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _SHORETEXTUREBLENDINGTYPE_ADDITIVE _SHORETEXTUREBLENDINGTYPE_SUBTRACTIVE _SHORETEXTUREBLENDINGTYPE_MULTIPLICATIVE _SHORETEXTUREBLENDINGTYPE_DIVIDE
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorAAngle;
			float _DefNoiseAScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _FoamSpeedY;
			float _DefVorASpeedX;
			float _FoamSpeedX;
			float _FoamTileX;
			float _AffectFoamDeformation;
			float _InvertFoamTexture;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _WaveSpeedY;
			float _WaveSpeedX;
			float _MiddleWaveEdgeControl;
			float _ShoreTileY;
			float _FoamTileY;
			float _ShoreTileX;
			float _DefNoiseTypeAMult;
			float _DefTypeAAnchorX;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseTypeBExponential;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBSpeedY;
			float _DefVorASpeedY;
			float _DefNoiseTypeBMult;
			float _DefVorBTileY;
			float _DefVorBTileX;
			float _DefVorBAngle;
			float _DefNoiseBScale;
			float _DefNoiseBInvert;
			float _DefNoiseTypeAExponential;
			float _DefPerlinScale;
			float _DefTypeARotSpeed;
			float _DefTypeAAnchorY;
			float _DefVorBSpeedX;
			float _MiddleWaveIntensity;
			float _NoiseGradeOffset;
			float _PerBScale;
			float _GradeExponential;
			float _GradeOffset;
			float _GradeScale;
			float _DepthExponential;
			float _DepthDistance;
			float _DepthSize;
			float _ShoreCBRotSpeed;
			float _ShoreCBAnchorY;
			float _ShoreCBAnchorX;
			float _InvertShoreTexture;
			float _ShoreCBSpeedY;
			float _ShoreCBTileY;
			float _ShoreCBTileX;
			float _ShoreCRotSpeed;
			float _ShoreCAnchorY;
			float _ShoreCAnchorX;
			float _ShoreCSpeedY;
			float _ShoreCSpeedX;
			float _ShoreCTileY;
			float _ShoreCTileX;
			float _ShoreCBSpeedX;
			float _NoiseGradeScale;
			float _VorAScale;
			float _VorASmooth;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _PerBTileX;
			float _PerAScale;
			float _PerASpeedY;
			float _PerASpeedX;
			float _PerATileY;
			float _PerATileX;
			float _VorAAngleSpeed;
			float _VorBSpeedY;
			float _VorBTileY;
			float _VorBTileX;
			float _VorBSmooth;
			float _VorBAngleSpeed;
			float _VorBScale;
			float _VorASpeedY;
			float _VorASpeedX;
			float _VorATileY;
			float _VorATileX;
			float _VorBSpeedX;
			float _ClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ShoreColorMap;
			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;


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

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
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

				float2 appendResult506 = (float2(_ShoreCTileX , _ShoreCTileY));
				float mulTime583 = _TimeParameters.x * _ShoreCSpeedX;
				float mulTime584 = _TimeParameters.x * _ShoreCSpeedY;
				float2 appendResult580 = (float2(mulTime583 , mulTime584));
				float2 texCoord464 = IN.ase_texcoord3.xy * appendResult506 + appendResult580;
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
				float2 texCoord599 = IN.ase_texcoord3.xy * appendResult609 + appendResult602;
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
				
				float4 screenPos = IN.ase_texcoord4;
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
				float3 temp_cast_10 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_10 );
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
				float4 temp_cast_23 = (Gray913).xxxx;
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
				float4 temp_output_929_0 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 CausticRef902 = temp_output_929_0;
				float4 temp_output_916_0 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float4 FinalCompRef461 = temp_output_916_0;
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ShoreRef592.rgb;
				float Alpha = FinalCompRef461.r;
				float AlphaClipThreshold = _ClipThreshold;
				float AlphaClipThresholdShadow = 0.5;

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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorAAngle;
			float _DefNoiseAScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _FoamSpeedY;
			float _DefVorASpeedX;
			float _FoamSpeedX;
			float _FoamTileX;
			float _AffectFoamDeformation;
			float _InvertFoamTexture;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _WaveSpeedY;
			float _WaveSpeedX;
			float _MiddleWaveEdgeControl;
			float _ShoreTileY;
			float _FoamTileY;
			float _ShoreTileX;
			float _DefNoiseTypeAMult;
			float _DefTypeAAnchorX;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseTypeBExponential;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBSpeedY;
			float _DefVorASpeedY;
			float _DefNoiseTypeBMult;
			float _DefVorBTileY;
			float _DefVorBTileX;
			float _DefVorBAngle;
			float _DefNoiseBScale;
			float _DefNoiseBInvert;
			float _DefNoiseTypeAExponential;
			float _DefPerlinScale;
			float _DefTypeARotSpeed;
			float _DefTypeAAnchorY;
			float _DefVorBSpeedX;
			float _MiddleWaveIntensity;
			float _NoiseGradeOffset;
			float _PerBScale;
			float _GradeExponential;
			float _GradeOffset;
			float _GradeScale;
			float _DepthExponential;
			float _DepthDistance;
			float _DepthSize;
			float _ShoreCBRotSpeed;
			float _ShoreCBAnchorY;
			float _ShoreCBAnchorX;
			float _InvertShoreTexture;
			float _ShoreCBSpeedY;
			float _ShoreCBTileY;
			float _ShoreCBTileX;
			float _ShoreCRotSpeed;
			float _ShoreCAnchorY;
			float _ShoreCAnchorX;
			float _ShoreCSpeedY;
			float _ShoreCSpeedX;
			float _ShoreCTileY;
			float _ShoreCTileX;
			float _ShoreCBSpeedX;
			float _NoiseGradeScale;
			float _VorAScale;
			float _VorASmooth;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _PerBTileX;
			float _PerAScale;
			float _PerASpeedY;
			float _PerASpeedX;
			float _PerATileY;
			float _PerATileX;
			float _VorAAngleSpeed;
			float _VorBSpeedY;
			float _VorBTileY;
			float _VorBTileX;
			float _VorBSmooth;
			float _VorBAngleSpeed;
			float _VorBScale;
			float _VorASpeedY;
			float _VorASpeedX;
			float _VorATileY;
			float _VorATileX;
			float _VorBSpeedX;
			float _ClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;


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

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
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

				float4 screenPos = IN.ase_texcoord2;
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
				float4 temp_output_929_0 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 CausticRef902 = temp_output_929_0;
				float4 temp_output_916_0 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float4 FinalCompRef461 = temp_output_916_0;
				

				float Alpha = FinalCompRef461.r;
				float AlphaClipThreshold = _ClipThreshold;

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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorAAngle;
			float _DefNoiseAScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _FoamSpeedY;
			float _DefVorASpeedX;
			float _FoamSpeedX;
			float _FoamTileX;
			float _AffectFoamDeformation;
			float _InvertFoamTexture;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _WaveSpeedY;
			float _WaveSpeedX;
			float _MiddleWaveEdgeControl;
			float _ShoreTileY;
			float _FoamTileY;
			float _ShoreTileX;
			float _DefNoiseTypeAMult;
			float _DefTypeAAnchorX;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseTypeBExponential;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBSpeedY;
			float _DefVorASpeedY;
			float _DefNoiseTypeBMult;
			float _DefVorBTileY;
			float _DefVorBTileX;
			float _DefVorBAngle;
			float _DefNoiseBScale;
			float _DefNoiseBInvert;
			float _DefNoiseTypeAExponential;
			float _DefPerlinScale;
			float _DefTypeARotSpeed;
			float _DefTypeAAnchorY;
			float _DefVorBSpeedX;
			float _MiddleWaveIntensity;
			float _NoiseGradeOffset;
			float _PerBScale;
			float _GradeExponential;
			float _GradeOffset;
			float _GradeScale;
			float _DepthExponential;
			float _DepthDistance;
			float _DepthSize;
			float _ShoreCBRotSpeed;
			float _ShoreCBAnchorY;
			float _ShoreCBAnchorX;
			float _InvertShoreTexture;
			float _ShoreCBSpeedY;
			float _ShoreCBTileY;
			float _ShoreCBTileX;
			float _ShoreCRotSpeed;
			float _ShoreCAnchorY;
			float _ShoreCAnchorX;
			float _ShoreCSpeedY;
			float _ShoreCSpeedX;
			float _ShoreCTileY;
			float _ShoreCTileX;
			float _ShoreCBSpeedX;
			float _NoiseGradeScale;
			float _VorAScale;
			float _VorASmooth;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _PerBTileX;
			float _PerAScale;
			float _PerASpeedY;
			float _PerASpeedX;
			float _PerATileY;
			float _PerATileX;
			float _VorAAngleSpeed;
			float _VorBSpeedY;
			float _VorBTileY;
			float _VorBTileX;
			float _VorBSmooth;
			float _VorBAngleSpeed;
			float _VorBScale;
			float _VorASpeedY;
			float _VorASpeedX;
			float _VorATileY;
			float _VorATileX;
			float _VorBSpeedX;
			float _ClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;


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
				o.ase_texcoord = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
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
				float4 temp_output_929_0 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 CausticRef902 = temp_output_929_0;
				float4 temp_output_916_0 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float4 FinalCompRef461 = temp_output_916_0;
				

				surfaceDescription.Alpha = FinalCompRef461.r;
				surfaceDescription.AlphaClipThreshold = _ClipThreshold;

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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorAAngle;
			float _DefNoiseAScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _FoamSpeedY;
			float _DefVorASpeedX;
			float _FoamSpeedX;
			float _FoamTileX;
			float _AffectFoamDeformation;
			float _InvertFoamTexture;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _WaveSpeedY;
			float _WaveSpeedX;
			float _MiddleWaveEdgeControl;
			float _ShoreTileY;
			float _FoamTileY;
			float _ShoreTileX;
			float _DefNoiseTypeAMult;
			float _DefTypeAAnchorX;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseTypeBExponential;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBSpeedY;
			float _DefVorASpeedY;
			float _DefNoiseTypeBMult;
			float _DefVorBTileY;
			float _DefVorBTileX;
			float _DefVorBAngle;
			float _DefNoiseBScale;
			float _DefNoiseBInvert;
			float _DefNoiseTypeAExponential;
			float _DefPerlinScale;
			float _DefTypeARotSpeed;
			float _DefTypeAAnchorY;
			float _DefVorBSpeedX;
			float _MiddleWaveIntensity;
			float _NoiseGradeOffset;
			float _PerBScale;
			float _GradeExponential;
			float _GradeOffset;
			float _GradeScale;
			float _DepthExponential;
			float _DepthDistance;
			float _DepthSize;
			float _ShoreCBRotSpeed;
			float _ShoreCBAnchorY;
			float _ShoreCBAnchorX;
			float _InvertShoreTexture;
			float _ShoreCBSpeedY;
			float _ShoreCBTileY;
			float _ShoreCBTileX;
			float _ShoreCRotSpeed;
			float _ShoreCAnchorY;
			float _ShoreCAnchorX;
			float _ShoreCSpeedY;
			float _ShoreCSpeedX;
			float _ShoreCTileY;
			float _ShoreCTileX;
			float _ShoreCBSpeedX;
			float _NoiseGradeScale;
			float _VorAScale;
			float _VorASmooth;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _PerBTileX;
			float _PerAScale;
			float _PerASpeedY;
			float _PerASpeedX;
			float _PerATileY;
			float _PerATileX;
			float _VorAAngleSpeed;
			float _VorBSpeedY;
			float _VorBTileY;
			float _VorBTileX;
			float _VorBSmooth;
			float _VorBAngleSpeed;
			float _VorBScale;
			float _VorASpeedY;
			float _VorASpeedX;
			float _VorATileY;
			float _VorATileX;
			float _VorBSpeedX;
			float _ClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;


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
				o.ase_texcoord = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
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
				float4 temp_output_929_0 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 CausticRef902 = temp_output_929_0;
				float4 temp_output_916_0 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float4 FinalCompRef461 = temp_output_916_0;
				

				surfaceDescription.Alpha = FinalCompRef461.r;
				surfaceDescription.AlphaClipThreshold = _ClipThreshold;

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
			Tags { "LightMode"="DepthNormals" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

        	#pragma multi_compile_instancing
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define ASE_FOG 1
        	#define _SURFACE_TYPE_TRANSPARENT 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _DEPTHGRADETYPE2_LINEAR _DEPTHGRADETYPE2_NORMAL _DEPTHGRADETYPE2_GAMMA
			#pragma shader_feature_local _TEXTUREGRADETYPE_LINEAR _TEXTUREGRADETYPE_NORMAL _TEXTUREGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISETYPE_VORAVORB _NOISETYPE_VORAPERA _NOISETYPE_VORAPERB _NOISETYPE_PERAPERB _NOISETYPE_VORBPERA _NOISETYPE_VORBPERB
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOI _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOI _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE


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
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShoreColor;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorAAngle;
			float _DefNoiseAScale;
			float _DefNoiseAInvert;
			float _DefNoiseContrast;
			float _FoamGradeOffset;
			float _FoamGradeScale;
			float _FoamSpeedY;
			float _DefVorASpeedX;
			float _FoamSpeedX;
			float _FoamTileX;
			float _AffectFoamDeformation;
			float _InvertFoamTexture;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _WaveSpeedY;
			float _WaveSpeedX;
			float _MiddleWaveEdgeControl;
			float _ShoreTileY;
			float _FoamTileY;
			float _ShoreTileX;
			float _DefNoiseTypeAMult;
			float _DefTypeAAnchorX;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseTypeBExponential;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBSpeedY;
			float _DefVorASpeedY;
			float _DefNoiseTypeBMult;
			float _DefVorBTileY;
			float _DefVorBTileX;
			float _DefVorBAngle;
			float _DefNoiseBScale;
			float _DefNoiseBInvert;
			float _DefNoiseTypeAExponential;
			float _DefPerlinScale;
			float _DefTypeARotSpeed;
			float _DefTypeAAnchorY;
			float _DefVorBSpeedX;
			float _MiddleWaveIntensity;
			float _NoiseGradeOffset;
			float _PerBScale;
			float _GradeExponential;
			float _GradeOffset;
			float _GradeScale;
			float _DepthExponential;
			float _DepthDistance;
			float _DepthSize;
			float _ShoreCBRotSpeed;
			float _ShoreCBAnchorY;
			float _ShoreCBAnchorX;
			float _InvertShoreTexture;
			float _ShoreCBSpeedY;
			float _ShoreCBTileY;
			float _ShoreCBTileX;
			float _ShoreCRotSpeed;
			float _ShoreCAnchorY;
			float _ShoreCAnchorX;
			float _ShoreCSpeedY;
			float _ShoreCSpeedX;
			float _ShoreCTileY;
			float _ShoreCTileX;
			float _ShoreCBSpeedX;
			float _NoiseGradeScale;
			float _VorAScale;
			float _VorASmooth;
			float _PerBSpeedY;
			float _PerBSpeedX;
			float _PerBTileY;
			float _PerBTileX;
			float _PerAScale;
			float _PerASpeedY;
			float _PerASpeedX;
			float _PerATileY;
			float _PerATileX;
			float _VorAAngleSpeed;
			float _VorBSpeedY;
			float _VorBTileY;
			float _VorBTileX;
			float _VorBSmooth;
			float _VorBAngleSpeed;
			float _VorBScale;
			float _VorASpeedY;
			float _VorASpeedX;
			float _VorATileY;
			float _VorATileX;
			float _VorBSpeedX;
			float _ClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _ShoreTexture;
			sampler2D _FoamTexture;
			sampler2D _DefNoiseAMap;
			sampler2D _DefNoiseBMap;


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

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float4 screenPos = IN.ase_texcoord1;
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
				float3 temp_cast_9 = (_MiddleWaveEdgeControl).xxx;
				float3 DepthRef451 = pow( saferPower927 , temp_cast_9 );
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
				float4 temp_cast_22 = (Gray913).xxxx;
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
				float4 temp_output_929_0 = ( saturate( saturate( (saturate( CalculateContrast(_DefNoiseContrast,float4( (staticSwitch891*_DefNoiseFinalScale + _DefNoiseFinalOffset) , 0.0 )) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) ) * _MiddleWaveIntensity );
				float4 CausticRef902 = temp_output_929_0;
				float4 temp_output_916_0 = ( ( ( float4( SaturateDepthRef450 , 0.0 ) * saturate( staticSwitch375 ) ) + float4( 0,0,0,0 ) ) + ( CausticRef902 * float4( DepthRef451 , 0.0 ) ) );
				float4 FinalCompRef461 = temp_output_916_0;
				

				surfaceDescription.Alpha = FinalCompRef461.r;
				surfaceDescription.AlphaClipThreshold = _ClipThreshold;

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
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;452;-9440,-912;Inherit;False;2222.72;727.0552;Depth Settings;23;451;927;930;926;924;450;404;156;338;337;336;344;343;340;342;341;339;428;92;91;89;90;93;Depth Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;815;-9440,2928;Inherit;False;5780.81;1630.3;Noise and Caustic Animation Settings;92;929;928;921;902;907;900;899;898;897;896;895;894;891;892;893;890;889;888;887;886;885;884;883;882;881;878;880;879;877;876;875;873;874;872;871;869;870;867;863;868;861;862;866;865;864;860;859;858;857;856;855;853;854;848;847;846;852;851;850;849;845;844;906;841;842;843;838;840;839;836;835;834;905;837;829;828;827;826;831;830;833;832;823;822;821;825;824;820;816;817;819;818;Noise and Caustic Animation Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;449;-9442,-82;Inherit;False;2180;1650.667;Noise Settings;58;440;439;432;431;401;354;357;398;444;443;442;441;434;433;435;436;402;355;161;159;310;311;358;399;446;445;438;437;422;348;403;162;312;400;421;420;430;429;423;408;326;406;327;166;293;356;305;292;295;294;417;366;419;297;416;418;415;447;Noise Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-9360,-864;Inherit;False;Property;_DepthDistance;Depth Distance;19;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-9360,-704;Inherit;False;Property;_GradeScale;Grade Scale;21;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-9392,-784;Inherit;False;Property;_DepthExponential;Depth Exponential;20;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-9360,-624;Inherit;False;Property;_GradeOffset;Grade Offset;22;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-9392,-544;Inherit;False;Property;_GradeExponential;Grade Exponential;23;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;818;-9184,4080;Inherit;False;Property;_DefVorBSpeedX;DefVorBSpeedX;100;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-9136,4160;Inherit;False;Property;_DefNoiseTypeBMult;DefNoiseTypeBMult;95;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;817;-9184,4240;Inherit;False;Property;_DefVorBSpeedY;DefVorBSpeedY;101;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;440;-9232,1088;Inherit;False;Property;_PerASpeedY;Per A Speed Y;47;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;439;-9232,1008;Inherit;False;Property;_PerASpeedX;Per A Speed X;46;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;354;-9392,160;Inherit;False;Property;_VorASpeedX;Vor A Speed X;33;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;401;-9392,240;Inherit;False;Property;_VorASpeedY;Vor A Speed Y;34;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;357;-9392,528;Inherit;False;Property;_VorBSpeedX;Vor B Speed X;40;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;398;-9392,624;Inherit;False;Property;_VorBSpeedY;Vor B Speed Y;41;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;432;-9232,1456;Inherit;False;Property;_PerBSpeedY;Per B Speed Y;52;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-9232,1360;Inherit;False;Property;_PerBSpeedX;Per B Speed X;51;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;428;-9152,-784;Inherit;False;BDepthFade;-1;;2;47987ecf53b4f2847a33a9193dc9d94e;0;5;18;FLOAT;1;False;19;FLOAT;1;False;20;FLOAT;1;False;21;FLOAT;0;False;22;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ProjectionParams;339;-9088,-608;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;341;-9088,-448;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;342;-9024,-272;Inherit;False;Property;_DepthSize;Depth Size;24;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;816;-9248,3376;Inherit;False;Property;_DefVorASpeedX;DefVorASpeedX;87;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;820;-9248,3536;Inherit;False;Property;_DefVorASpeedY;DefVorASpeedY;88;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;824;-8912,4080;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;825;-8912,4240;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-9184,3456;Inherit;False;Property;_DefNoiseTypeAMult;DefNoiseTypeAMult;82;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;444;-9040,1088;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;443;-9040,1008;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;402;-9168,240;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;355;-9168,160;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;358;-9168,528;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;399;-9168,624;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-9168,0;Inherit;False;Property;_VorATileX;Vor A TileX;30;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;161;-9168,80;Inherit;False;Property;_VorATileY;Vor A TileY;31;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-9168,368;Inherit;False;Property;_VorBTileX;Vor B TileX;37;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-9168,448;Inherit;False;Property;_VorBTileY;Vor B TileY;38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-9040,848;Inherit;False;Property;_PerATileX;Per A TileX;44;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;441;-9040,928;Inherit;False;Property;_PerATileY;Per A TileY;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;433;-9040,1184;Inherit;False;Property;_PerBTileX;Per B TileX;49;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;-9040,1264;Inherit;False;Property;_PerBTileY;Per B TileY;50;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;435;-9040,1360;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;436;-9040,1456;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;340;-8848,-736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;343;-8832,-448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-8960,3376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;823;-8960,3536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;832;-8768,4080;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;833;-8768,4240;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;446;-8848,1024;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;445;-8848,864;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;403;-8976,176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;162;-8976,16;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;312;-8976,384;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;400;-8976,560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;422;-8752,544;Inherit;False;Property;_VorBAngleSpeed;Vor B Angle Speed;39;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;348;-8752,64;Inherit;False;Property;_VorAAngleSpeed;Vor A Angle Speed;32;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;438;-8848,1200;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;437;-8848,1392;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;344;-8672,-608;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;830;-8816,3376;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;831;-8816,3536;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-8768,3248;Inherit;False;Property;_DefVorATileY;DefVorATileY;86;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-8768,3168;Inherit;False;Property;_DefVorATileX;DefVorATileX;85;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;828;-8768,3904;Inherit;False;Property;_DefVorBTileX;DefVorBTileX;98;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;829;-8768,3984;Inherit;False;Property;_DefVorBTileY;DefVorBTileY;99;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;837;-8576,4160;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;905;-8576,4064;Inherit;False;Constant;_Float0;Float 0;105;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;421;-8464,1264;Inherit;False;Property;_PerBScale;PerBScale;48;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;420;-8464,1040;Inherit;False;Property;_PerAScale;PerAScale;43;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;430;-8688,976;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;429;-8688,1200;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;423;-8512,544;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;408;-8512,464;Inherit;False;Property;_VorBSmooth;Vor B Smooth;42;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-8480,384;Inherit;False;Property;_VorBScale;VorBScale;36;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;406;-8512,224;Inherit;False;Property;_VorASmooth;Vor A Smooth;35;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-8480,144;Inherit;False;Property;_VorAScale;VorAScale;29;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;166;-8512,64;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;293;-8784,144;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;356;-8784,384;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GammaToLinearNode;336;-8512,-656;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;337;-8512,-544;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;914;-6688,1632;Inherit;False;515.2971;324.2447;Local Vars;6;911;910;909;908;913;912;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;834;-8576,3200;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;835;-8560,3936;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;836;-8576,3440;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;839;-8528,3552;Inherit;False;Property;_DefTypeAAnchorX;DefTypeAAnchorX;90;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;840;-8528,3632;Inherit;False;Property;_DefTypeAAnchorY;DefTypeAAnchorY;91;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;838;-8528,3712;Inherit;False;Property;_DefTypeARotSpeed;DefTypeARotSpeed;89;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;843;-8528,4272;Inherit;False;Property;_DefTypeBAnchorX;DefTypeBAnchorX;103;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-8528,4352;Inherit;False;Property;_DefTypeBAnchorY;DefTypeBAnchorY;104;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;841;-8528,4432;Inherit;False;Property;_DefTypeBRotSpeed;DefTypeBRotSpeed;102;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;906;-8432,4112;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;305;-8272,976;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;1,1,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;292;-8272,1200;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;1,1,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;295;-8320,320;Inherit;True;0;0;1;0;2;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.VoronoiNode;294;-8320,48;Inherit;True;0;0;1;0;2;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.StaticSwitch;338;-8288,-624;Inherit;False;Property;_DepthGradeType2;DepthGradeType2;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;844;-8352,3216;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;845;-8352,3984;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;849;-8320,3712;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;850;-8304,3584;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;851;-8320,4432;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;852;-8304,4304;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;846;-8400,3088;Inherit;False;Property;_DefVorAAngle;DefVorAAngle;84;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;847;-8352,3376;Inherit;False;Property;_DefNoiseAScale;DefNoiseAScale;83;0;Create;True;0;0;0;False;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;848;-8352,3456;Inherit;False;Property;_DefPerlinScale;DefPerlinScale;78;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-8400,3808;Inherit;False;Property;_DefVorBAngle;DefVorBAngle;97;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-8336,3904;Inherit;False;Property;_DefNoiseBScale;DefNoiseBScale;96;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;-6624,1840;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
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
Node;AmplifyShaderEditor.RegisterLocalVarNode;913;-6416,1840;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;415;-7760,576;Inherit;False;Property;_NoiseType;Noise Type;26;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;6;VorAVorB;VorAPerA;VorAPerB;PerAPerB;VorBPerA;VorBPerB;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;924;-7872,-544;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;864;-7824,4464;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;865;-7872,3344;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;866;-7872,4048;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;862;-7920,4272;Inherit;True;Property;_DefNoiseBMap;DefNoiseBMap;92;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;861;-7920,3568;Inherit;True;Property;_DefNoiseAMap;DefNoiseAMap;79;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;868;-7824,3776;Inherit;True;0;1;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;863;-7824,2992;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;867;-7824,3072;Inherit;True;0;0;1;3;3;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.CommentaryNode;457;-9440,1632;Inherit;False;2708.8;1196.2;Depth Texture Settings;47;388;638;637;636;634;455;381;353;426;362;361;372;425;424;410;371;411;383;409;64;380;179;384;453;333;346;393;392;386;315;377;325;313;314;378;329;387;391;390;389;322;321;448;376;330;917;918;Depth Texture Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;447;-7504,576;Inherit;False;NoiseTypeRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;926;-7728,-544;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;930;-7872,-464;Inherit;False;Property;_MiddleWaveEdgeControl;Middle Wave Edge Control;107;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;870;-7504,3984;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;70;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;869;-7504,3296;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;69;0;Create;True;0;0;0;True;3;Space(50);Header(Noise);Space(5);False;0;0;0;True;;KeywordEnum;4;None;Voronoi;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;448;-9280,2112;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-9280,2192;Inherit;False;Property;_NoiseGradeScale;Noise Grade Scale;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;322;-9280,2272;Inherit;False;Property;_NoiseGradeOffset;Noise Grade Offset;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-9216,2448;Inherit;False;Property;_FoamTileY;FoamTileY;14;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-9216,2368;Inherit;False;Property;_FoamTileX;FoamTileX;13;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;927;-7584,-544;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;871;-7296,3312;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;872;-7280,4000;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;330;-9424,1760;Inherit;False;Property;_WaveSpeedX;WaveSpeedX;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;376;-9424,1840;Inherit;False;Property;_WaveSpeedY;WaveSpeedY;8;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;325;-9056,2160;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;388;-8992,2416;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-7440,-544;Inherit;False;DepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;874;-7120,3296;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;873;-7120,3968;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;391;-9248,2624;Inherit;False;Property;_FoamSpeedY;FoamSpeedY;18;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-9248,2544;Inherit;False;Property;_FoamSpeedX;FoamSpeedX;17;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;329;-9248,1760;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;378;-9248,1840;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;314;-9248,2016;Inherit;False;Property;_ShoreTileY;ShoreTileY;6;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-9248,1936;Inherit;False;Property;_ShoreTileX;ShoreTileX;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;638;-9024,2720;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;634;-8800,2416;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;917;-8832,2272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;875;-6880,4080;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;876;-6880,3376;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;377;-8992,1792;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;315;-8992,1952;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;386;-9024,2544;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;392;-9024,2624;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;453;-9024,1680;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;637;-8832,2720;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;918;-8656,2272;Inherit;False;Property;_AffectFoamDeformation;AffectFoamDeformation;105;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;877;-6688,3296;Inherit;False;Property;_DefNoiseAInvert;DefNoiseAInvert;80;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;879;-6688,4000;Inherit;False;Property;_DefNoiseBInvert;DefNoiseBInvert;93;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;880;-6720,4112;Inherit;False;Property;_DefNoiseTypeBExponential;DefNoiseTypeBExponential;94;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;878;-6720,3408;Inherit;False;Property;_DefNoiseTypeAExponential;DefNoiseTypeAExponential;81;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;393;-8832,2560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;346;-8832,1968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;333;-8800,1760;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;636;-8656,2416;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;881;-6448,3296;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;882;-6448,4000;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;384;-8496,2416;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;179;-8496,1904;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;883;-6176,3664;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;884;-6176,3904;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;885;-6176,4128;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;886;-6176,3440;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;887;-6176,3216;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;64;-8272,1904;Inherit;True;Property;_ShoreTexture;Shore Texture;3;0;Create;True;0;0;0;True;0;False;-1;c662692ad44de0b45ba4f81297e97381;c662692ad44de0b45ba4f81297e97381;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;380;-8272,2400;Inherit;True;Property;_FoamTexture;Foam Texture;11;0;Create;True;0;0;0;True;0;False;-1;136144d880a69254ea8b2d639e2fe9c5;136144d880a69254ea8b2d639e2fe9c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;888;-5920,3712;Inherit;False;Property;_DefNoiseMixType;DefNoiseMixType;71;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;409;-7984,2400;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;383;-7984,1904;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;889;-5664,3696;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;890;-5664,3808;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;411;-7824,2480;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;371;-7824,1984;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-5472,3936;Inherit;False;Property;_DefNoiseFinalScale;DefNoiseFinalScale;76;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-5472,4016;Inherit;False;Property;_DefNoiseFinalOffset;DefNoiseFinalOffset;77;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;891;-5440,3712;Inherit;True;Property;_DefNoiseGradeType;DefNoiseGradeType;72;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;410;-7680,2400;Inherit;True;Property;_InvertFoamTexture;Invert Foam Texture;12;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;424;-7648,2624;Inherit;False;Property;_FoamGradeScale;Foam Grade Scale;15;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;425;-7648,2704;Inherit;False;Property;_FoamGradeOffset;Foam Grade Offset;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;372;-7680,1904;Inherit;True;Property;_InvertShoreTexture;Invert Shore Texture;4;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-7648,2128;Inherit;False;Property;_ShoreGradeScale;Shore Grade Scale;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;362;-7648,2208;Inherit;False;Property;_ShoreGradeOffset;Shore Grade Offset;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;894;-5184,3712;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;895;-5184,3856;Inherit;False;Property;_DefNoiseContrast;DefNoiseContrast;73;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;426;-7408,2400;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;353;-7408,1904;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;896;-4960,3712;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;381;-7168,1904;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;897;-4736,3712;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;898;-4784,3936;Inherit;False;Property;_DefNoiseGradeScale;DefNoiseGradeScale;74;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-4816,4016;Inherit;False;Property;_DefNoiseGradeOffset;DefNoiseGradeOffset;75;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;460;-7152,464;Inherit;False;1670.667;372.3334;Final Comp;13;920;904;925;461;916;454;903;345;413;375;374;373;456;Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;455;-6960,1904;Inherit;False;DepthTextureRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;900;-4576,3728;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;456;-7120,624;Inherit;False;455;DepthTextureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;907;-4352,3728;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;404;-7872,-624;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;373;-6848,576;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;374;-6848,688;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;928;-4320,3808;Inherit;False;Property;_MiddleWaveIntensity;Middle Wave Intensity;106;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;921;-4192,3728;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;-7440,-624;Inherit;False;SaturateDepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;375;-6624,592;Inherit;True;Property;_TextureGradeType;TextureGradeType;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;929;-4032,3728;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;413;-6336,592;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;454;-6400,512;Inherit;False;450;SaturateDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;902;-3872,3728;Inherit;False;CausticRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;345;-6176,528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;-6224,672;Inherit;False;902;CausticRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;920;-6224,752;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;903;-6000,528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;925;-6032,672;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;916;-5856,528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;593;-7168,-912;Inherit;False;2505.732;1290.468;Double Texture Map Control Settings;44;592;349;623;606;459;625;624;622;604;621;620;619;586;587;585;616;617;618;588;474;469;613;612;611;610;615;614;602;584;583;582;581;609;505;504;506;580;599;464;597;465;596;458;579;Double Texture Map Control Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;461;-5712,528;Inherit;False;FinalCompRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;579;-6304,-848;Inherit;True;Property;_ShoreColorMap;Shore Color Map;53;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;458;-6080,-640;Inherit;True;Property;_ShoreT;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;596;-6080,-128;Inherit;True;Property;_ShoreT1;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;465;-6272,-640;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;597;-6288,-128;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;464;-6560,-784;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;599;-6560,-128;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;580;-6736,-672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;506;-6736,-848;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-6928,-864;Inherit;False;Property;_ShoreCTileX;ShoreC Tile X;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-6928,-784;Inherit;False;Property;_ShoreCTileY;ShoreC Tile Y;58;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;609;-6912,-208;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;581;-7120,-688;Inherit;False;Property;_ShoreCSpeedX;ShoreC Speed X;59;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-7120,-608;Inherit;False;Property;_ShoreCSpeedY;ShoreC Speed Y;60;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;583;-6912,-688;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;584;-6912,-608;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;602;-6736,-48;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;614;-6944,-64;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;615;-6944,16;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;610;-7120,-224;Inherit;False;Property;_ShoreCBTileX;ShoreC B Tile X;64;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;611;-7120,-144;Inherit;False;Property;_ShoreCBTileY;ShoreC B Tile Y;65;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;612;-7152,-64;Inherit;False;Property;_ShoreCBSpeedX;ShoreC B Speed X;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;613;-7152,16;Inherit;False;Property;_ShoreCBSpeedY;ShoreC B Speed Y;67;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;-6896,-320;Inherit;False;Property;_ShoreCRotSpeed;ShoreC Rot Speed;54;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;474;-6688,-320;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;588;-6496,-320;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;618;-6496,96;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;617;-6672,96;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-6896,96;Inherit;False;Property;_ShoreCBRotSpeed;ShoreC B Rot Speed;61;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;585;-6496,-480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;587;-6720,-416;Inherit;False;Property;_ShoreCAnchorY;ShoreC Anchor Y;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;586;-6720,-496;Inherit;False;Property;_ShoreCAnchorX;ShoreC Anchor X;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;619;-6496,224;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;620;-6720,288;Inherit;False;Property;_ShoreCBAnchorY;ShoreC B Anchor Y;63;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;621;-6720,208;Inherit;False;Property;_ShoreCBAnchorX;ShoreC B Anchor X;62;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;-5728,-544;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;622;-5728,-432;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;624;-5728,-320;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;625;-5728,-208;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;908;-6624,1680;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;909;-6416,1680;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;910;-6624,1760;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;911;-6416,1760;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;459;-5040,-448;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;606;-5216,-448;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;623;-5536,-448;Inherit;False;Property;_ShoreTextureBlendingType;Shore Texture Blending Type;68;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;Additive;Subtractive;Multiplicative;Divide;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;349;-5280,-640;Inherit;False;Property;_ShoreColor;Shore Color;2;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-4880,-448;Inherit;False;ShoreRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;462;-5184,1440;Inherit;False;461;FinalCompRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;932;-5152,1360;Inherit;False;592;ShoreRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-5248,1520;Inherit;False;Property;_ClipThreshold;ClipThreshold;25;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;106;-3776,96;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;108;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;109;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;111;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;112;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;113;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;114;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;115;256,-208;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;107;-4896,1408;Float;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;BUDU Shaders/BWaterToon;7489fd76ebdb00b448e337e26be4b0c3;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;True;True;2;5;False;_SrcBlend;10;False;_DstBlend;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;22;Surface;1;638538768550876936;  Blend;0;0;Two Sided;1;0;Forward Only;0;638538770090881013;Cast Shadows;0;638538862162951048;  Use Shadow Threshold;0;0;Receive Shadows;0;638538862192517802;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;638538768500232120;0;10;False;True;False;True;False;False;True;True;True;False;False;;False;0
WireConnection;428;18;93;0
WireConnection;428;19;89;0
WireConnection;428;20;90;0
WireConnection;428;21;91;0
WireConnection;428;22;92;0
WireConnection;824;0;818;0
WireConnection;824;1;819;0
WireConnection;825;0;817;0
WireConnection;825;1;819;0
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
WireConnection;913;0;912;0
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
WireConnection;927;0;926;0
WireConnection;927;1;930;0
WireConnection;871;0;869;0
WireConnection;872;0;870;0
WireConnection;325;0;448;0
WireConnection;325;1;321;0
WireConnection;325;2;322;0
WireConnection;388;0;390;0
WireConnection;388;1;389;0
WireConnection;451;0;927;0
WireConnection;874;0;871;0
WireConnection;873;0;872;0
WireConnection;329;0;330;0
WireConnection;378;0;376;0
WireConnection;634;0;325;0
WireConnection;634;1;388;0
WireConnection;917;0;325;0
WireConnection;917;1;388;0
WireConnection;875;0;873;0
WireConnection;876;0;874;0
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
WireConnection;64;1;179;0
WireConnection;380;1;384;0
WireConnection;888;1;887;0
WireConnection;888;0;886;0
WireConnection;888;2;883;0
WireConnection;888;3;884;0
WireConnection;888;4;885;0
WireConnection;409;0;380;0
WireConnection;383;0;64;0
WireConnection;889;0;888;0
WireConnection;890;0;888;0
WireConnection;411;0;409;0
WireConnection;371;0;383;0
WireConnection;891;1;889;0
WireConnection;891;0;888;0
WireConnection;891;2;890;0
WireConnection;410;0;409;0
WireConnection;410;1;411;0
WireConnection;372;0;383;0
WireConnection;372;1;371;0
WireConnection;894;0;891;0
WireConnection;894;1;893;0
WireConnection;894;2;892;0
WireConnection;426;0;410;0
WireConnection;426;1;424;0
WireConnection;426;2;425;0
WireConnection;353;0;372;0
WireConnection;353;1;361;0
WireConnection;353;2;362;0
WireConnection;896;1;894;0
WireConnection;896;0;895;0
WireConnection;381;0;353;0
WireConnection;381;1;426;0
WireConnection;897;0;896;0
WireConnection;455;0;381;0
WireConnection;900;0;897;0
WireConnection;900;1;898;0
WireConnection;900;2;899;0
WireConnection;907;0;900;0
WireConnection;404;0;156;0
WireConnection;373;0;456;0
WireConnection;374;0;456;0
WireConnection;921;0;907;0
WireConnection;450;0;404;0
WireConnection;375;1;373;0
WireConnection;375;0;456;0
WireConnection;375;2;374;0
WireConnection;929;0;921;0
WireConnection;929;1;928;0
WireConnection;413;0;375;0
WireConnection;902;0;929;0
WireConnection;345;0;454;0
WireConnection;345;1;413;0
WireConnection;903;0;345;0
WireConnection;925;0;904;0
WireConnection;925;1;920;0
WireConnection;916;0;903;0
WireConnection;916;1;925;0
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
WireConnection;909;0;908;0
WireConnection;911;0;910;0
WireConnection;459;0;349;0
WireConnection;459;1;606;0
WireConnection;606;0;623;0
WireConnection;623;1;604;0
WireConnection;623;0;622;0
WireConnection;623;2;624;0
WireConnection;623;3;625;0
WireConnection;592;0;459;0
WireConnection;107;2;932;0
WireConnection;107;3;462;0
WireConnection;107;4;351;0
ASEEND*/
//CHKSM=EB8694D9B5000920DF3FDC3FE1AF76777A4F4145
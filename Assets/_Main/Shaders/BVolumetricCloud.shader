// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BVolumetricCloud"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[NoScaleOffset]_VolumetricTexture("Volumetric Texture", 3D) = "white" {}
		[HDR]_BaseColor("Base Color", Color) = (1,1,1)
		[HDR]_ShadeColor("ShadeColor", Color) = (0.3804041,0.5108245,0.7421383)
		[IntRange]_NumberOfSteps("Number Of Steps", Range( 0 , 256)) = 2
		_StepSize("Step Size", Range( 0 , 1)) = 0.1
		_DensityScale("Density Scale", Range( 0.0001 , 10)) = 1
		[IntRange]_NumberOfLightSteps("Number Of Light Steps", Range( 0 , 20)) = 2
		_LightStepSize("Light Step Size", Range( 0 , 0.2)) = 0.05
		_LightAbsorb("Light Absorb", Range( -1 , 10)) = 1.2
		_DarknessThreshold("Darkness Threshold", Range( -1 , 1)) = 0
		_Transmittance("Transmittance", Range( 0 , 1)) = 1
		[IntRange]_Coverage("Coverage", Range( 0 , 1)) = 0
		_AlphaClipThreshold("Alpha Clip Threshold", Range( 0 , 1.1)) = 0.3
		_ShadowClipThreshold("Shadow Clip Threshold", Range( 0.01 , 1)) = 0.01
		_DeformRotateSpeed("DeformRotateSpeed", Float) = 0
		_WindRotateSpeed("WindRotateSpeed", Float) = 0
		_WindRotate("WindRotate", Range( 0 , 360)) = 0
		_DeformRotate("DeformRotate", Range( 0 , 360)) = 0
		_DeformOverallSpeed("DeformOverallSpeed", Float) = 0
		_WindOverallSpeed("WindOverallSpeed", Float) = 0
		_DeformSpeedY("DeformSpeedY", Float) = 0
		_WindSpeedY("WindSpeedY", Float) = 0
		_DeformSpeedX("DeformSpeedX", Float) = 0
		_WindSpeedX("WindSpeedX", Float) = 0
		_DeformOffsetY("DeformOffsetY", Float) = 0
		_WindOffsetY("WindOffsetY", Float) = 0
		_DeformOffsetX("DeformOffsetX", Float) = 0
		_WindOffsetX("WindOffsetX", Float) = 0
		_WindPivotY("WindPivotY", Float) = 0
		_DeformPivotY("DeformPivotY", Float) = 0
		_WindTileX("WindTileX", Float) = 1
		_DeformTileX("DeformTileX", Float) = 1
		_DeformPivotX("DeformPivotX", Float) = 0
		_WindPivotX("WindPivotX", Float) = 0
		[Toggle]_AffectLightColor("Affect Light Color", Float) = 0
		_DeformTileY("DeformTileY", Float) = 1
		_WindTileY("WindTileY", Float) = 1
		_AffectWind("Affect Wind", Range( -1 , 1)) = 0.5
		_Angle("Angle", Float) = 1
		_DeformVorAngle("Deform Vor Angle", Float) = 1
		[Toggle]_InvertNoise("Invert Noise", Float) = 0
		[Toggle]_InvertDeform("Invert Deform", Float) = 0
		_SmoothVor("SmoothVor", Range( 0 , 1)) = 0
		_DeformVorSmooth("Deform Vor Smooth", Range( 0 , 1)) = 0
		[KeywordEnum(Voronoi,Perlin,Texture)] _NoiseType("NoiseType", Float) = 0
		[KeywordEnum(Voronoi,Perlin,Texture)] _DeformNoiseType("Deform Noise Type", Float) = 0
		_DeformNoiseScale("Deform Noise Scale", Float) = 1
		_NoiseScale("NoiseScale", Float) = 10
		[NoScaleOffset]_DeformNoiseTexture("Deform Noise Texture", 2D) = "white" {}
		[NoScaleOffset]_WindNoiseTexture("Wind Noise Texture", 2D) = "white" {}
		_NoiseIntensity("Noise Intensity", Range( 0 , 1)) = 1
		_DeformIntensity("Deform Intensity", Range( -1 , 1)) = 1
		[Toggle]_AffectAmbientColor("Affect Ambient Color", Float) = 0
		_LightAreaOffset("Light Area Offset", Float) = 0
		_LightAreaIntensity("Light Area Intensity", Float) = 1
		[KeywordEnum(Linear,Normal,Gamma)] _GradeType("GradeType", Float) = 0
		_Exponential("Exponential", Float) = 1
		[Toggle]_Deform("Deform", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 0.5
		[Toggle]_AlphaClip("Alpha Clip", Float) = 0
		[Toggle]_ShadowClip("Shadow Clip", Float) = 1
		[HideInInspector][IntRange]_cameraRayFold("cameraRayFold", Float) = 0
		[HideInInspector][IntRange]_lightRayFold("lightRayFold", Float) = 0
		[Toggle]_WindToggle("WindToggle", Float) = 0
		[HideInInspector][IntRange]_CheckDef("CheckDef", Float) = 0
		[KeywordEnum(Normal,Bliss,Biased,Multi,MultiNeg)] _NoiseBlendType("NoiseBlendType", Float) = 0
		[HideInInspector][IntRange]_checkCloud("checkCloud", Float) = 0
		_TextureBTileX("TextureBTileX", Float) = 1
		_TextureATileX("TextureATileX", Float) = 1
		_TextureBTileY("TextureBTileY", Float) = 1
		_TextureATileY("TextureATileY", Float) = 1
		[HideInInspector][IntRange]_checkWind("checkWind", Float) = 0
		_SurfaceTextureIntensity("Surface Texture Intensity", Range( -1 , 1)) = 1
		_AmbientTextureIntensity("Ambient Texture Intensity", Range( -1 , 1)) = 0.9439711
		_Bias("Bias", Float) = 0
		_Contrast("Contrast", Float) = 1
		_TextureASpeedX("TextureASpeedX", Float) = 0
		_TextureBSpeedX("TextureBSpeedX", Float) = 0
		_TextureASpeedY("TextureASpeedY", Float) = 0
		_TextureBSpeedY("TextureBSpeedY", Float) = 0
		_TextureBSpeedZ("TextureBSpeedZ", Float) = 0
		_TextureASpeedZ("TextureASpeedZ", Float) = 0
		[HDR]_DetailColor("Detail Color", Color) = (1,1,1,0)
		[Toggle]_AmbientDetails("AmbientDetails", Float) = 0
		[NoScaleOffset]_DetailTextureA("DetailTextureA", 2D) = "white" {}
		[Toggle]_LightAreaDetails("LightAreaDetails", Float) = 0
		[NoScaleOffset]_DetailTextureB("DetailTextureB", 2D) = "white" {}
		_TextureBRotateSpeed("TextureBRotateSpeed", Float) = 0
		_TextureBOverallSpeed("TextureBOverallSpeed", Float) = 0
		_TextureBRotate("TextureBRotate", Range( 0 , 360)) = 0
		[HideInInspector][IntRange]_checkLight("checkLight", Float) = 0
		_TextureARotateSpeed("TextureARotateSpeed", Float) = 0
		_TextureARotate("TextureARotate", Range( 0 , 360)) = 0
		_TextureAOverallSpeed("TextureAOverallSpeed", Float) = 0
		[HideInInspector][IntRange]_checkDetail("checkDetail", Float) = 0
		[HideInInspector][IntRange]_BaseSettings("BaseSettings", Float) = 0
		_TextureAPivotX("TextureAPivotX", Float) = 0
		_TextureBPivotX("TextureBPivotX", Float) = 0
		_TextureAPivotY("TextureAPivotY", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DetTXTGradeType("DetTXTGradeType", Float) = 1
		[KeywordEnum(TriSphere,TriCylinder,UV)] _TypeA("TypeA", Float) = 0
		[KeywordEnum(TriSphere,TriCylinder,UV)] _TypeB("TypeB", Float) = 0
		_Saturation("Saturation", Range( 0 , 4)) = 0.5
		_TextureBPivotY("TextureBPivotY", Float) = 0
		_TAFalloff("TAFalloff", Range( 0 , 1)) = 0.1
		[KeywordEnum(Multi,Add,Distance,Alpha)] _DetailBlendMethod("DetailBlendMethod", Float) = 0
		_SmoothMax("SmoothMax", Float) = 1
		_SmoothMin("SmoothMin", Float) = 0
		_LerpCoef("LerpCoef", Range( -2 , 3)) = 0
		_BackExponent("BackExponent", Float) = 1
		_BackContrast("BackContrast", Float) = 1
		_TBFalloff("TBFalloff", Range( 0 , 1)) = 0.1


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
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Back
		AlphaToMask [_Coverage]

		

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

			Blend SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010


			

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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma shader_feature_local _DETTXTGRADETYPE_LINEAR _DETTXTGRADETYPE_NORMAL _DETTXTGRADETYPE_GAMMA
			#pragma shader_feature_local _DETAILBLENDMETHOD_MULTI _DETAILBLENDMETHOD_ADD _DETAILBLENDMETHOD_DISTANCE _DETAILBLENDMETHOD_ALPHA
			#pragma shader_feature_local _TYPEA_TRISPHERE _TYPEA_TRICYLINDER _TYPEA_UV
			#pragma shader_feature_local _TYPEB_TRISPHERE _TYPEB_TRICYLINDER _TYPEB_UV
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD3;
				#endif
				float4 lightmapUVOrVertexSH : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DetailTextureA;
			sampler2D _DetailTextureB;
			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			inline float4 TriplanarSampling668( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
			
			inline float4 TriplanarSampling443( sampler2D topTexMap, sampler2D midTexMap, sampler2D botTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				float negProjNormalY = max( 0, projNormal.y * -nsign.y );
				projNormal.y = max( 0, projNormal.y * nsign.y );
				half4 xNorm; half4 yNorm; half4 yNormN; half4 zNorm;
				xNorm  = tex2D( midTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm  = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				yNormN = tex2D( botTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm  = tex2D( midTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + yNormN * negProjNormalY + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling671( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
			
			inline float4 TriplanarSampling479( sampler2D topTexMap, sampler2D midTexMap, sampler2D botTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				float negProjNormalY = max( 0, projNormal.y * -nsign.y );
				projNormal.y = max( 0, projNormal.y * nsign.y );
				half4 xNorm; half4 yNorm; half4 yNormN; half4 zNorm;
				xNorm  = tex2D( midTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm  = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				yNormN = tex2D( botTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm  = tex2D( midTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + yNormN * negProjNormalY + zNorm * projNormal.z;
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord6 = v.positionOS;
				o.ase_normal = v.normalOS;
				o.ase_texcoord7.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord7.zw = 0;

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

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
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
				float4 texcoord1 : TEXCOORD1;
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
				o.texcoord1 = v.texcoord1;
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
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
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

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 bakedGI123 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, ase_worldNormal);
				Light ase_mainLight = GetMainLight( ShadowCoords );
				MixRealtimeAndBakedGI(ase_mainLight, ase_worldNormal, bakedGI123, half4(0,0,0,0));
				float4 temp_cast_1 = (_SmoothMin).xxxx;
				float4 temp_cast_2 = (_SmoothMax).xxxx;
				float2 appendResult39_g15 = (float2(_TextureATileX , _TextureATileY));
				float2 temp_output_632_58 = appendResult39_g15;
				float temp_output_674_0 = (0.001 + (_TAFalloff - 0.0) * (1.0 - 0.001) / (1.0 - 0.0));
				float temp_output_53_0_g15 = _TextureAOverallSpeed;
				float mulTime27_g15 = _TimeParameters.x * ( _TextureASpeedX * temp_output_53_0_g15 );
				float mulTime28_g15 = _TimeParameters.x * ( _TextureASpeedY * temp_output_53_0_g15 );
				float2 appendResult34_g15 = (float2(( 0.0 + mulTime27_g15 ) , ( mulTime28_g15 + 0.0 )));
				float mulTime475 = _TimeParameters.x * ( _TextureAOverallSpeed * _TextureASpeedZ );
				float3 appendResult477 = (float3(appendResult34_g15 , mulTime475));
				float3 temp_output_471_0 = ( IN.ase_texcoord6.xyz + appendResult477 );
				float4 triplanar668 = TriplanarSampling668( _DetailTextureA, temp_output_471_0, IN.ase_normal, temp_output_674_0, temp_output_632_58, 1.0, 0 );
				float4 triplanar443 = TriplanarSampling443( _DetailTextureA, _DetailTextureA, _DetailTextureA, temp_output_471_0, ase_worldNormal, temp_output_674_0, temp_output_632_58, float3( 1,1,1 ), float3(0,0,0) );
				float2 texCoord37_g15 = IN.ase_texcoord7.xy * appendResult39_g15 + appendResult34_g15;
				float2 appendResult36_g15 = (float2(_TextureAPivotX , _TextureAPivotY));
				float mulTime29_g15 = _TimeParameters.x * _TextureARotateSpeed;
				float cos38_g15 = cos( ( radians( mulTime29_g15 ) + radians( _TextureARotate ) ) );
				float sin38_g15 = sin( ( radians( mulTime29_g15 ) + radians( _TextureARotate ) ) );
				float2 rotator38_g15 = mul( texCoord37_g15 - appendResult36_g15 , float2x2( cos38_g15 , -sin38_g15 , sin38_g15 , cos38_g15 )) + appendResult36_g15;
				#if defined( _TYPEA_TRISPHERE )
				float4 staticSwitch667 = triplanar668;
				#elif defined( _TYPEA_TRICYLINDER )
				float4 staticSwitch667 = triplanar443;
				#elif defined( _TYPEA_UV )
				float4 staticSwitch667 = tex2D( _DetailTextureA, rotator38_g15 );
				#else
				float4 staticSwitch667 = triplanar668;
				#endif
				float2 appendResult39_g14 = (float2(_TextureBTileX , _TextureBTileY));
				float2 temp_output_652_58 = appendResult39_g14;
				float temp_output_676_0 = (0.001 + (_TBFalloff - 0.0) * (1.0 - 0.001) / (1.0 - 0.0));
				float temp_output_53_0_g14 = _TextureBOverallSpeed;
				float mulTime27_g14 = _TimeParameters.x * ( _TextureBSpeedX * temp_output_53_0_g14 );
				float mulTime28_g14 = _TimeParameters.x * ( _TextureBSpeedY * temp_output_53_0_g14 );
				float2 appendResult34_g14 = (float2(( 0.5 + mulTime27_g14 ) , ( mulTime28_g14 + 0.5 )));
				float mulTime653 = _TimeParameters.x * ( _TextureBSpeedZ * _TextureBOverallSpeed );
				float3 appendResult654 = (float3(appendResult34_g14 , mulTime653));
				float3 temp_output_483_0 = ( IN.ase_texcoord6.xyz + appendResult654 );
				float4 triplanar671 = TriplanarSampling671( _DetailTextureB, temp_output_483_0, IN.ase_normal, temp_output_676_0, temp_output_652_58, 1.0, 0 );
				float4 triplanar479 = TriplanarSampling479( _DetailTextureB, _DetailTextureB, _DetailTextureB, temp_output_483_0, ase_worldNormal, temp_output_676_0, temp_output_652_58, float3( 1,1,1 ), float3(0,0,0) );
				float2 texCoord37_g14 = IN.ase_texcoord7.xy * appendResult39_g14 + appendResult34_g14;
				float2 appendResult36_g14 = (float2(_TextureBPivotX , _TextureBPivotY));
				float mulTime29_g14 = _TimeParameters.x * _TextureBRotateSpeed;
				float cos38_g14 = cos( ( radians( mulTime29_g14 ) + radians( _TextureBRotate ) ) );
				float sin38_g14 = sin( ( radians( mulTime29_g14 ) + radians( _TextureBRotate ) ) );
				float2 rotator38_g14 = mul( texCoord37_g14 - appendResult36_g14 , float2x2( cos38_g14 , -sin38_g14 , sin38_g14 , cos38_g14 )) + appendResult36_g14;
				#if defined( _TYPEB_TRISPHERE )
				float4 staticSwitch672 = triplanar671;
				#elif defined( _TYPEB_TRICYLINDER )
				float4 staticSwitch672 = triplanar479;
				#elif defined( _TYPEB_UV )
				float4 staticSwitch672 = tex2D( _DetailTextureB, rotator38_g14 );
				#else
				float4 staticSwitch672 = triplanar671;
				#endif
				float4 temp_cast_5 = (_BackExponent).xxxx;
				float4 smoothstepResult692 = smoothstep( temp_cast_1 , temp_cast_2 , pow( (( staticSwitch667 * staticSwitch672 )*_BackContrast + 0.0) , temp_cast_5 ));
				float4 temp_cast_6 = (_SmoothMin).xxxx;
				float4 temp_cast_7 = (_SmoothMax).xxxx;
				float4 temp_cast_8 = (_BackExponent).xxxx;
				float4 smoothstepResult693 = smoothstep( temp_cast_6 , temp_cast_7 , pow( (( ( staticSwitch667 + staticSwitch672 ) / 2.0 )*_BackContrast + 0.0) , temp_cast_8 ));
				float smoothstepResult689 = smoothstep( _SmoothMin , _SmoothMax , pow( (distance( staticSwitch667 , staticSwitch672 )*_BackContrast + 0.0) , _BackExponent ));
				float4 temp_cast_9 = (smoothstepResult689).xxxx;
				float4 temp_cast_10 = (_SmoothMin).xxxx;
				float4 temp_cast_11 = (_SmoothMax).xxxx;
				float4 lerpResult706 = lerp( staticSwitch667 , staticSwitch672 , _LerpCoef);
				float4 saferPower702 = abs( (lerpResult706*_BackContrast + 0.0) );
				float4 temp_cast_12 = (_BackExponent).xxxx;
				float4 smoothstepResult694 = smoothstep( temp_cast_10 , temp_cast_11 , pow( saferPower702 , temp_cast_12 ));
				#if defined( _DETAILBLENDMETHOD_MULTI )
				float4 staticSwitch677 = smoothstepResult692;
				#elif defined( _DETAILBLENDMETHOD_ADD )
				float4 staticSwitch677 = smoothstepResult693;
				#elif defined( _DETAILBLENDMETHOD_DISTANCE )
				float4 staticSwitch677 = temp_cast_9;
				#elif defined( _DETAILBLENDMETHOD_ALPHA )
				float4 staticSwitch677 = smoothstepResult694;
				#else
				float4 staticSwitch677 = smoothstepResult692;
				#endif
				float3 gammaToLinear655 = FastSRGBToLinear( staticSwitch677.xyz );
				float3 linearToGamma656 = FastLinearToSRGB( staticSwitch677.xyz );
				#if defined( _DETTXTGRADETYPE_LINEAR )
				float4 staticSwitch657 = float4( gammaToLinear655 , 0.0 );
				#elif defined( _DETTXTGRADETYPE_NORMAL )
				float4 staticSwitch657 = staticSwitch677;
				#elif defined( _DETTXTGRADETYPE_GAMMA )
				float4 staticSwitch657 = float4( linearToGamma656 , 0.0 );
				#else
				float4 staticSwitch657 = staticSwitch677;
				#endif
				float4 RF_SurfaceTexture457 = (staticSwitch657*_Contrast + _Bias);
				float RF_AmbientTXTInt612 = _AmbientTextureIntensity;
				float RF_Zero336 = 0.0;
				float3 hsvTorgb4_g11 = RGBToHSV( float4( _DetailColor.rgb , 0.0 ).rgb );
				float3 hsvTorgb8_g11 = HSVToRGB( float3(( hsvTorgb4_g11.x + 0.5 ),( hsvTorgb4_g11.y + 0.0 ),( hsvTorgb4_g11.z + 0.0 )) );
				float3 temp_output_562_0 = saturate( hsvTorgb8_g11 );
				float3 ifLocalVar609 = 0;
				if( RF_AmbientTXTInt612 >= RF_Zero336 )
				ifLocalVar609 = _DetailColor.rgb;
				else
				ifLocalVar609 = temp_output_562_0;
				float3 RF_AbientDetColor618 = ifLocalVar609;
				float3 temp_output_12_0_g12 = ( float4( (( _AffectAmbientColor )?( ( _ShadeColor * bakedGI123 ) ):( _ShadeColor )) , 0.0 ) + ( RF_SurfaceTexture457 * (-0.4 + (RF_AmbientTXTInt612 - -1.0) * (0.4 - -0.4) / (1.0 - -1.0)) * float4( RF_AbientDetColor618 , 0.0 ) ) ).xyz;
				float dotResult28_g12 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g12 );
				float3 temp_cast_23 = (dotResult28_g12).xxx;
				float3 lerpResult31_g12 = lerp( temp_cast_23 , temp_output_12_0_g12 , _Saturation);
				float3 RF_ShadeColor181 = (( _AmbientDetails )?( lerpResult31_g12 ):( (( _AffectAmbientColor )?( ( _ShadeColor * bakedGI123 ) ):( _ShadeColor )) ));
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float RF_LightTXTInt611 = _SurfaceTextureIntensity;
				float3 ifLocalVar606 = 0;
				if( RF_LightTXTInt611 >= RF_Zero336 )
				ifLocalVar606 = _DetailColor.rgb;
				else
				ifLocalVar606 = temp_output_562_0;
				float3 RF_LightDetColor617 = ifLocalVar606;
				float3 temp_output_12_0_g13 = ( float4( (( _AffectLightColor )?( ( _BaseColor * ase_lightColor.rgb * ase_lightColor.a ) ):( _BaseColor )) , 0.0 ) + ( RF_SurfaceTexture457 * (-0.7 + (RF_LightTXTInt611 - -1.0) * (0.7 - -0.7) / (1.0 - -1.0)) * float4( RF_LightDetColor617 , 0.0 ) ) ).xyz;
				float dotResult28_g13 = dot( float3(0.2126729,0.7151522,0.072175) , temp_output_12_0_g13 );
				float3 temp_cast_27 = (dotResult28_g13).xxx;
				float3 lerpResult31_g13 = lerp( temp_cast_27 , temp_output_12_0_g13 , _Saturation);
				float3 RF_BaseColor183 = (( _LightAreaDetails )?( lerpResult31_g13 ):( (( _AffectLightColor )?( ( _BaseColor * ase_lightColor.rgb * ase_lightColor.a ) ):( _BaseColor )) ));
				float3 temp_cast_28 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord7.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord7.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_31 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_33 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_34 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_34;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_33;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_34;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_36 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_39 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_43 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_43;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_39;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_43;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_44 = (dotResult396).xxx;
				float3 temp_cast_45 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_44;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_45;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_28 ));
				float3 temp_output_203_0 = mul( float4( WorldPosition , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float saferPower94 = abs( saturate( (saturate( break15.x )*_LightAreaIntensity + _LightAreaOffset) ) );
				float3 lerpResult16 = lerp( RF_ShadeColor181 , RF_BaseColor183 , saturate( pow( saferPower94 , _Exponential ) ));
				float3 RF_FinalColor349 = lerpResult16;
				
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = RF_FinalColor349;
				float Alpha = RF_FinalAlpha350;
				float AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));
				float AlphaClipThresholdShadow = (( _ShadowClip )?( _ShadowClipThreshold ):( 0.0 ));

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010


			

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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


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
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
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

				float RF_Zero336 = 0.0;
				float3 temp_cast_0 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord2.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord2.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_3 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_5 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_6 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_6;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_5;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_6;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_8 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_11 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_15 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_15;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_11;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_15;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_16 = (dotResult396).xxx;
				float3 temp_cast_17 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_16;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_17;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_0 ));
				float3 temp_output_203_0 = mul( float4( WorldPosition , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				

				float Alpha = RF_FinalAlpha350;
				float AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));
				float AlphaClipThresholdShadow = (( _ShadowClip )?( _ShadowClipThreshold ):( 0.0 ));

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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010


			

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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


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
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
			}
			

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

			half4 frag(VertexOutput IN  ) : SV_TARGET
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

				float RF_Zero336 = 0.0;
				float3 temp_cast_0 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord3.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord3.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_3 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_5 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_6 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_6;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_5;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_6;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_8 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_11 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_15 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_15;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_11;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_15;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_16 = (dotResult396).xxx;
				float3 temp_cast_17 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_16;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_17;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_0 ));
				float3 temp_output_203_0 = mul( float4( WorldPosition , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				

				float Alpha = RF_FinalAlpha350;
				float AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));

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

			

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010


			

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
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


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
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
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

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

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

				float RF_Zero336 = 0.0;
				float3 temp_cast_0 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_3 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_5 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_6 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_6;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_5;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_6;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_8 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_11 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_15 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_15;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_11;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_15;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_16 = (dotResult396).xxx;
				float3 temp_cast_17 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_16;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_17;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_0 ));
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_203_0 = mul( float4( ase_worldPos , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				

				surfaceDescription.Alpha = RF_FinalAlpha350;
				surfaceDescription.AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));

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

			

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140010


			

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
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


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
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
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

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

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

				float RF_Zero336 = 0.0;
				float3 temp_cast_0 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_3 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_5 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_6 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_6;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_5;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_6;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_8 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_11 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_15 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_15;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_11;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_15;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_16 = (dotResult396).xxx;
				float3 temp_cast_17 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_16;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_17;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_0 ));
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 temp_output_203_0 = mul( float4( ase_worldPos , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				

				surfaceDescription.Alpha = RF_FinalAlpha350;
				surfaceDescription.AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));

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
        	#define _SURFACE_TYPE_TRANSPARENT 1
        	#define _ALPHATEST_SHADOW_ON 1
        	#define _ALPHATEST_ON 1
        	#define ASE_SRP_VERSION 140010


			

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
			#pragma shader_feature_local _GRADETYPE_LINEAR _GRADETYPE_NORMAL _GRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEBLENDTYPE_NORMAL _NOISEBLENDTYPE_BLISS _NOISEBLENDTYPE_BIASED _NOISEBLENDTYPE_MULTI _NOISEBLENDTYPE_MULTINEG
			#pragma shader_feature_local _NOISETYPE_VORONOI _NOISETYPE_PERLIN _NOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMNOISETYPE_VORONOI _DEFORMNOISETYPE_PERLIN _DEFORMNOISETYPE_TEXTURE


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
				float4 clipPosV : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _DetailColor;
			float3 _BaseColor;
			float3 _ShadeColor;
			float _Coverage;
			float _DeformOffsetX;
			float _DeformTileY;
			float _DeformTileX;
			float _DeformVorSmooth;
			float _DeformVorAngle;
			float _DeformNoiseScale;
			float _InvertDeform;
			float _WindRotate;
			float _WindRotateSpeed;
			float _WindPivotX;
			float _DeformSpeedX;
			float _WindOffsetY;
			float _WindSpeedY;
			float _WindOverallSpeed;
			float _WindSpeedX;
			float _WindOffsetX;
			float _WindTileY;
			float _WindTileX;
			float _Deform;
			float _WindPivotY;
			float _DeformOverallSpeed;
			float _DeformSpeedY;
			float _DeformOffsetY;
			float _AlphaClipThreshold;
			float _AlphaClip;
			float _Opacity;
			float _Exponential;
			float _LightAreaOffset;
			float _LightAreaIntensity;
			float _Transmittance;
			float _DarknessThreshold;
			float _LightAbsorb;
			float _LightStepSize;
			float _NumberOfLightSteps;
			float _DensityScale;
			float _StepSize;
			float _NumberOfSteps;
			float _AffectWind;
			float _NoiseIntensity;
			float _DeformIntensity;
			float _DeformRotate;
			float _DeformRotateSpeed;
			float _DeformPivotY;
			float _DeformPivotX;
			float _SmoothVor;
			float _Angle;
			float _InvertNoise;
			float _ShadowClip;
			float _TextureAPivotX;
			float _TextureASpeedZ;
			float _TextureASpeedY;
			float _TextureAOverallSpeed;
			float _TextureASpeedX;
			float _TAFalloff;
			float _TextureATileY;
			float _TextureATileX;
			float _SmoothMax;
			float _TextureAPivotY;
			float _SmoothMin;
			float _AmbientDetails;
			float _checkDetail;
			float _checkLight;
			float _checkWind;
			float _checkCloud;
			float _BaseSettings;
			float _lightRayFold;
			float _cameraRayFold;
			float _CheckDef;
			float _AffectAmbientColor;
			float _TextureARotateSpeed;
			float _TextureARotate;
			float _TextureBTileX;
			float _WindToggle;
			float _SurfaceTextureIntensity;
			float _AffectLightColor;
			float _LightAreaDetails;
			float _Saturation;
			float _AmbientTextureIntensity;
			float _Bias;
			float _Contrast;
			float _LerpCoef;
			float _BackExponent;
			float _BackContrast;
			float _TextureBRotate;
			float _TextureBRotateSpeed;
			float _TextureBPivotY;
			float _TextureBPivotX;
			float _TextureBSpeedZ;
			float _TextureBSpeedY;
			float _TextureBOverallSpeed;
			float _TextureBSpeedX;
			float _TBFalloff;
			float _TextureBTileY;
			float _NoiseScale;
			float _ShadowClipThreshold;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _DeformNoiseTexture;
			sampler2D _WindNoiseTexture;
			sampler3D _VolumetricTexture;
			SAMPLER(sampler_VolumetricTexture);
			
			#ifdef UNITY_DOTS_INSTANCING_ENABLED
			UNITY_DOTS_INSTANCING_START(MaterialPropertyMetadata)
				UNITY_DOTS_INSTANCED_PROP(float, _LightAbsorb)
			UNITY_DOTS_INSTANCING_END(MaterialPropertyMetadata)
			#define _LightAbsorb UNITY_ACCESS_DOTS_INSTANCED_PROP_WITH_DEFAULT(float , _LightAbsorb)
			#endif


			float2 voronoihash264( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi264( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash264( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float2 voronoihash317( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi317( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash317( n + g );
						o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
						float d = 0.707 * sqrt(dot( r, r ));
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
			
			float4x4 Inverse4x4(float4x4 input)
			{
				#define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
				float4x4 cofactors = float4x4(
				minor( _22_23_24, _32_33_34, _42_43_44 ),
				-minor( _21_23_24, _31_33_34, _41_43_44 ),
				minor( _21_22_24, _31_32_34, _41_42_44 ),
				-minor( _21_22_23, _31_32_33, _41_42_43 ),
			
				-minor( _12_13_14, _32_33_34, _42_43_44 ),
				minor( _11_13_14, _31_33_34, _41_43_44 ),
				-minor( _11_12_14, _31_32_34, _41_42_44 ),
				minor( _11_12_13, _31_32_33, _41_42_43 ),
			
				minor( _12_13_14, _22_23_24, _42_43_44 ),
				-minor( _11_13_14, _21_23_24, _41_43_44 ),
				minor( _11_12_14, _21_22_24, _41_42_44 ),
				-minor( _11_12_13, _21_22_23, _41_42_43 ),
			
				-minor( _12_13_14, _22_23_24, _32_33_34 ),
				minor( _11_13_14, _21_23_24, _31_33_34 ),
				-minor( _11_12_14, _21_22_24, _31_32_34 ),
				minor( _11_12_13, _21_22_23, _31_32_33 ));
				#undef minor
				return transpose( cofactors ) / determinant( input );
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float3 RayMarch98( float3 rayOrigin, float3 rayDirection, int numSteps, float stepSize, float densityScale, sampler3D Volume, SamplerState volumeSampler, float3 offset, int numLightSteps, float lightStepSize, float3 lightDir, float lightAbsorb, float darknessThreshold, float transmittance )
			{
				float density = 0;
				float transmission = 0;
				float lightAccumulation = 0;
				float finalLight = 0;
				for(int i =0; i< numSteps; i++){
					rayOrigin += (rayDirection*stepSize);
					
					float3 samplePos = rayOrigin+offset;
					float sampledDensity = tex3D(Volume, samplePos).r;
					density += sampledDensity*densityScale;
					//light loop
					float3 lightRayOrigin = samplePos;
					for(int j = 0; j < numLightSteps; j++){
						lightRayOrigin += lightDir*lightStepSize;
						float lightDensity = tex3D(Volume, lightRayOrigin).r;
						lightAccumulation += lightDensity;
					}
					float lightTransmission = exp(-lightAccumulation);
					float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold);
					finalLight += density*transmittance*shadow;
					transmittance *= exp(-density*lightAbsorb);
					
				}
				transmission = exp(-density);
				return float3(finalLight, transmission, transmittance);
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

				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
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

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				o.normalWS = TransformObjectToWorldNormal( v.normalOS );
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
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float RF_Zero336 = 0.0;
				float3 temp_cast_0 = (RF_Zero336).xxx;
				float mulTime266 = _TimeParameters.x * _Angle;
				float time264 = mulTime266;
				float2 voronoiSmoothId264 = 0;
				float voronoiSmooth264 = _SmoothVor;
				float2 appendResult39_g3 = (float2(_WindTileX , _WindTileY));
				float temp_output_53_0_g3 = _WindOverallSpeed;
				float mulTime27_g3 = _TimeParameters.x * ( _WindSpeedX * temp_output_53_0_g3 );
				float mulTime28_g3 = _TimeParameters.x * ( _WindSpeedY * temp_output_53_0_g3 );
				float2 appendResult34_g3 = (float2(( _WindOffsetX + mulTime27_g3 ) , ( mulTime28_g3 + _WindOffsetY )));
				float2 texCoord37_g3 = IN.ase_texcoord2.xy * appendResult39_g3 + appendResult34_g3;
				float2 appendResult36_g3 = (float2(_WindPivotX , _WindPivotY));
				float mulTime29_g3 = _TimeParameters.x * _WindRotateSpeed;
				float cos38_g3 = cos( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float sin38_g3 = sin( ( radians( mulTime29_g3 ) + radians( _WindRotate ) ) );
				float2 rotator38_g3 = mul( texCoord37_g3 - appendResult36_g3 , float2x2( cos38_g3 , -sin38_g3 , sin38_g3 , cos38_g3 )) + appendResult36_g3;
				float2 RF_WindUV251 = rotator38_g3;
				float mulTime305 = _TimeParameters.x * _DeformVorAngle;
				float time317 = mulTime305;
				float2 voronoiSmoothId317 = 0;
				float voronoiSmooth317 = _DeformVorSmooth;
				float2 appendResult39_g2 = (float2(_DeformTileX , _DeformTileY));
				float temp_output_53_0_g2 = _DeformOverallSpeed;
				float mulTime27_g2 = _TimeParameters.x * ( _DeformSpeedX * temp_output_53_0_g2 );
				float mulTime28_g2 = _TimeParameters.x * ( _DeformSpeedY * temp_output_53_0_g2 );
				float2 appendResult34_g2 = (float2(( _DeformOffsetX + mulTime27_g2 ) , ( mulTime28_g2 + _DeformOffsetY )));
				float2 texCoord37_g2 = IN.ase_texcoord2.xy * appendResult39_g2 + appendResult34_g2;
				float2 appendResult36_g2 = (float2(_DeformPivotX , _DeformPivotY));
				float mulTime29_g2 = _TimeParameters.x * _DeformRotateSpeed;
				float cos38_g2 = cos( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float sin38_g2 = sin( ( radians( mulTime29_g2 ) + radians( _DeformRotate ) ) );
				float2 rotator38_g2 = mul( texCoord37_g2 - appendResult36_g2 , float2x2( cos38_g2 , -sin38_g2 , sin38_g2 , cos38_g2 )) + appendResult36_g2;
				float2 RF_DeformUV299 = rotator38_g2;
				float2 coords317 = RF_DeformUV299 * _DeformNoiseScale;
				float2 id317 = 0;
				float2 uv317 = 0;
				float fade317 = 0.5;
				float voroi317 = 0;
				float rest317 = 0;
				for( int it317 = 0; it317 <3; it317++ ){
				voroi317 += fade317 * voronoi317( coords317, time317, id317, uv317, voronoiSmooth317,voronoiSmoothId317 );
				rest317 += fade317;
				coords317 *= 2;
				fade317 *= 0.5;
				}//Voronoi317
				voroi317 /= rest317;
				float3 temp_cast_3 = (( voroi317 * _DeformIntensity )).xxx;
				float simplePerlin3D310 = snoise( float3( RF_DeformUV299 ,  0.0 )*_DeformNoiseScale );
				simplePerlin3D310 = simplePerlin3D310*0.5 + 0.5;
				float3 temp_cast_5 = (( simplePerlin3D310 * _DeformIntensity )).xxx;
				float3 temp_cast_6 = (( voroi317 * _DeformIntensity )).xxx;
				#if defined( _DEFORMNOISETYPE_VORONOI )
				float3 staticSwitch314 = temp_cast_6;
				#elif defined( _DEFORMNOISETYPE_PERLIN )
				float3 staticSwitch314 = temp_cast_5;
				#elif defined( _DEFORMNOISETYPE_TEXTURE )
				float3 staticSwitch314 = ( tex2D( _DeformNoiseTexture, RF_DeformUV299 ).rgb * _DeformIntensity );
				#else
				float3 staticSwitch314 = temp_cast_6;
				#endif
				float3 temp_output_433_0 = (float3( -1,-1,-1 ) + (staticSwitch314 - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_DeformNoise319 = (( _InvertDeform )?( ( 1.0 - temp_output_433_0 ) ):( temp_output_433_0 ));
				float2 coords264 = (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy * _NoiseScale;
				float2 id264 = 0;
				float2 uv264 = 0;
				float fade264 = 0.5;
				float voroi264 = 0;
				float rest264 = 0;
				for( int it264 = 0; it264 <3; it264++ ){
				voroi264 += fade264 * voronoi264( coords264, time264, id264, uv264, voronoiSmooth264,voronoiSmoothId264 );
				rest264 += fade264;
				coords264 *= 2;
				fade264 *= 0.5;
				}//Voronoi264
				voroi264 /= rest264;
				float3 temp_cast_8 = (( voroi264 * _NoiseIntensity )).xxx;
				float simplePerlin3D258 = snoise( (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) ))*_NoiseScale );
				simplePerlin3D258 = simplePerlin3D258*0.5 + 0.5;
				float3 temp_cast_11 = (( simplePerlin3D258 * _NoiseIntensity )).xxx;
				float3 temp_cast_15 = (( voroi264 * _NoiseIntensity )).xxx;
				#if defined( _NOISETYPE_VORONOI )
				float3 staticSwitch274 = temp_cast_15;
				#elif defined( _NOISETYPE_PERLIN )
				float3 staticSwitch274 = temp_cast_11;
				#elif defined( _NOISETYPE_TEXTURE )
				float3 staticSwitch274 = ( tex2D( _WindNoiseTexture, (( _Deform )?( ( float3( RF_WindUV251 ,  0.0 ) + RF_DeformNoise319 ) ):( float3( RF_WindUV251 ,  0.0 ) )).xy ).rgb * _NoiseIntensity );
				#else
				float3 staticSwitch274 = temp_cast_15;
				#endif
				float dotResult396 = dot( staticSwitch274 , staticSwitch274 );
				float3 temp_cast_16 = (dotResult396).xxx;
				float3 temp_cast_17 = (length( staticSwitch274 )).xxx;
				#if defined( _NOISEBLENDTYPE_NORMAL )
				float3 staticSwitch406 = staticSwitch274;
				#elif defined( _NOISEBLENDTYPE_BLISS )
				float3 staticSwitch406 = temp_cast_16;
				#elif defined( _NOISEBLENDTYPE_BIASED )
				float3 staticSwitch406 = temp_cast_17;
				#elif defined( _NOISEBLENDTYPE_MULTI )
				float3 staticSwitch406 = ( staticSwitch274 * staticSwitch274 );
				#elif defined( _NOISEBLENDTYPE_MULTINEG )
				float3 staticSwitch406 = ( staticSwitch274 * ( 1.0 - staticSwitch274 ) );
				#else
				float3 staticSwitch406 = staticSwitch274;
				#endif
				float3 temp_output_394_0 = (float3( 1,1,1 ) + (staticSwitch406 - float3( 0,0,0 )) * (float3( -1,-1,-1 ) - float3( 1,1,1 )) / (float3( 1,1,1 ) - float3( 0,0,0 )));
				float3 RF_Wind272 = (( _WindToggle )?( ( (float3( -1,-1,-1 ) + (saturate( (( _InvertNoise )?( ( 1.0 - temp_output_394_0 ) ):( temp_output_394_0 )) ) - float3( 0,0,0 )) * (float3( 1,1,1 ) - float3( -1,-1,-1 )) / (float3( 1,1,1 ) - float3( 0,0,0 ))) * (0.1 + (_AffectWind - -1.0) * (-0.1 - 0.1) / (1.0 - -1.0)) ) ):( temp_cast_0 ));
				float3 ase_worldPos = IN.ase_texcoord3.xyz;
				float3 temp_output_203_0 = mul( float4( ase_worldPos , 0.0 ), GetWorldToObjectMatrix() ).xyz;
				float3 RF_RayOrigin188 = ( RF_Wind272 + temp_output_203_0 );
				float3 rayOrigin98 = RF_RayOrigin188;
				float3 normalizeResult207 = normalize( ( temp_output_203_0 - mul( float4( _WorldSpaceCameraPos , 0.0 ), GetWorldToObjectMatrix() ).xyz ) );
				float3 RF_RayDirection189 = normalizeResult207;
				float3 rayDirection98 = RF_RayDirection189;
				int numSteps98 = (int)_NumberOfSteps;
				float stepSize98 = _StepSize;
				float densityScale98 = _DensityScale;
				sampler3D Volume98 = _VolumetricTexture;
				SamplerState volumeSampler98 = sampler_VolumetricTexture;
				float3 ase_objectPosition = GetAbsolutePositionWS( UNITY_MATRIX_M._m03_m13_m23 );
				float4x4 invertVal213 = Inverse4x4( GetObjectToWorldMatrix() );
				float4 RF_Offset218 = ( float4(0.5,0.5,0.5,0.5) - float4( mul( float4( ase_objectPosition , 0.0 ), invertVal213 ).xyz , 0.0 ) );
				float3 offset98 = RF_Offset218.xyz;
				int numLightSteps98 = (int)_NumberOfLightSteps;
				float lightStepSize98 = _LightStepSize;
				float3 normalizeResult133 = ASESafeNormalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 RF_LightDirection343 = normalizeResult133;
				float3 lightDir98 = RF_LightDirection343;
				float lightAbsorb98 = _LightAbsorb;
				float darknessThreshold98 = ( _DarknessThreshold * 0.001 );
				float transmittance98 = _Transmittance;
				float3 localRayMarch98 = RayMarch98( rayOrigin98 , rayDirection98 , numSteps98 , stepSize98 , densityScale98 , Volume98 , volumeSampler98 , offset98 , numLightSteps98 , lightStepSize98 , lightDir98 , lightAbsorb98 , darknessThreshold98 , transmittance98 );
				float3 gammaToLinear330 = Gamma22ToLinear( localRayMarch98 );
				float3 linearToGamma329 = LinearToGamma22( localRayMarch98 );
				#if defined( _GRADETYPE_LINEAR )
				float3 staticSwitch331 = gammaToLinear330;
				#elif defined( _GRADETYPE_NORMAL )
				float3 staticSwitch331 = localRayMarch98;
				#elif defined( _GRADETYPE_GAMMA )
				float3 staticSwitch331 = linearToGamma329;
				#else
				float3 staticSwitch331 = gammaToLinear330;
				#endif
				float3 RF_RayMarch346 = staticSwitch331;
				float3 break15 = RF_RayMarch346;
				float RF_FinalAlpha350 = ( ( 1.0 - break15.y ) * _Opacity );
				

				float Alpha = RF_FinalAlpha350;
				float AlphaClipThreshold = (( _AlphaClip )?( _AlphaClipThreshold ):( 0.0 ));

				#if _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
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
	
	CustomEditor "BVolumetricCloudEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;286;-5120,-3104;Inherit;False;978.667;899.3334;Deform UV Settings;12;299;287;289;288;297;294;296;295;293;292;291;290;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-4992,-2896;Inherit;False;Property;_DeformOffsetX;DeformOffsetX;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;291;-4992,-2832;Inherit;False;Property;_DeformOffsetY;DeformOffsetY;30;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;292;-4992,-2752;Inherit;False;Property;_DeformSpeedX;DeformSpeedX;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-4992,-2688;Inherit;False;Property;_DeformSpeedY;DeformSpeedY;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;-5024,-2608;Inherit;False;Property;_DeformOverallSpeed;DeformOverallSpeed;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;296;-5088,-2528;Inherit;False;Property;_DeformRotate;DeformRotate;23;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-5024,-2448;Inherit;False;Property;_DeformRotateSpeed;DeformRotateSpeed;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;297;-4992,-2368;Inherit;False;Property;_DeformPivotX;DeformPivotX;38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;288;-4992,-2304;Inherit;False;Property;_DeformPivotY;DeformPivotY;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;289;-4992,-3040;Inherit;False;Property;_DeformTileX;DeformTileX;37;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;287;-4992,-2976;Inherit;False;Property;_DeformTileY;DeformTileY;41;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;325;-4095.079,-3104;Inherit;False;1957.07;890.5723;Deform Noise Settings;17;319;316;315;433;314;311;312;313;308;309;310;317;306;304;305;303;302;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;630;-4704,-2832;Inherit;False;BUDU UVTileOffsetAnimate;0;;2;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;3;FLOAT2;58;FLOAT2;59;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;299;-4384,-2832;Inherit;False;RF_DeformUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;302;-4064,-3040;Inherit;False;Property;_DeformVorAngle;Deform Vor Angle;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;303;-4000,-2736;Inherit;False;299;RF_DeformUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;305;-3840,-3040;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;304;-3872,-2960;Inherit;False;Property;_DeformNoiseScale;Deform Noise Scale;52;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;306;-3936,-2880;Inherit;False;Property;_DeformVorSmooth;Deform Vor Smooth;49;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;317;-3584,-3040;Inherit;True;0;1;1;0;3;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.NoiseGeneratorNode;310;-3536,-2768;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-3584,-2336;Inherit;False;Property;_DeformIntensity;Deform Intensity;57;0;Create;True;0;0;0;False;0;False;1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;308;-3584,-2544;Inherit;True;Property;_DeformNoiseTexture;Deform Noise Texture;54;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;313;-3232,-3040;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;312;-3232,-2768;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;311;-3232,-2528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;314;-3072,-2864;Inherit;False;Property;_DeformNoiseType;Deform Noise Type;51;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Voronoi;Perlin;Texture;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;252;-5120,-2176;Inherit;False;980.6665;898.6667;Wind UV Settings;12;245;244;246;243;242;241;240;238;251;248;247;239;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;433;-2880,-3040;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;-1,-1,-1;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;239;-4960,-2048;Inherit;False;Property;_WindTileY;WindTileY;42;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;248;-4992,-1376;Inherit;False;Property;_WindPivotY;WindPivotY;34;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;238;-4960,-2112;Inherit;False;Property;_WindTileX;WindTileX;36;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;240;-4992,-1968;Inherit;False;Property;_WindOffsetX;WindOffsetX;33;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;241;-4992,-1904;Inherit;False;Property;_WindOffsetY;WindOffsetY;31;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;242;-4992,-1824;Inherit;False;Property;_WindSpeedX;WindSpeedX;29;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-4992,-1760;Inherit;False;Property;_WindSpeedY;WindSpeedY;27;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;246;-5024,-1520;Inherit;False;Property;_WindRotateSpeed;WindRotateSpeed;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;244;-5024,-1680;Inherit;False;Property;_WindOverallSpeed;WindOverallSpeed;25;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;245;-5088,-1600;Inherit;False;Property;_WindRotate;WindRotate;22;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-4992,-1440;Inherit;False;Property;_WindPivotX;WindPivotX;39;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;315;-2784,-2784;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;316;-2592,-2864;Inherit;False;Property;_InvertDeform;Invert Deform;47;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;631;-4688,-1904;Inherit;False;BUDU UVTileOffsetAnimate;0;;3;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;3;FLOAT2;58;FLOAT2;59;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;281;-4096.667,-2176;Inherit;False;3218.762;897.0545;Wind Noise Settings;33;272;360;257;361;282;255;259;270;268;267;394;406;432;407;384;396;429;274;276;279;280;258;277;264;275;301;271;266;256;323;265;320;253;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;251;-4384,-1904;Inherit;False;RF_WindUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;319;-2368,-2864;Inherit;False;RF_DeformNoise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;320;-4080,-1664;Inherit;False;319;RF_DeformNoise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;-4064,-1808;Inherit;False;251;RF_WindUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;265;-4064,-2112;Inherit;False;Property;_Angle;Angle;44;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;323;-3840,-1728;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;256;-3904,-2032;Inherit;False;Property;_NoiseScale;NoiseScale;53;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;266;-3904,-2112;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-4000,-1952;Inherit;False;Property;_SmoothVor;SmoothVor;48;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;301;-3728,-1808;Inherit;False;Property;_Deform;Deform;63;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;275;-3520,-1600;Inherit;True;Property;_WindNoiseTexture;Wind Noise Texture;55;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.VoronoiNode;264;-3520,-2112;Inherit;True;0;1;1;0;3;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.RangedFloatNode;277;-3520,-1392;Inherit;False;Property;_NoiseIntensity;Noise Intensity;56;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;258;-3472,-1824;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;280;-3232,-2112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;279;-3232,-1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;276;-3216,-1600;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;274;-3088,-1952;Inherit;False;Property;_NoiseType;NoiseType;50;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Voronoi;Perlin;Texture;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;429;-2992,-1728;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;396;-2816,-2112;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LengthOpNode;384;-2848,-2000;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;-2832,-1872;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;432;-2832,-1760;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;406;-2672,-1952;Inherit;False;Property;_NoiseBlendType;NoiseBlendType;71;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Normal;Bliss;Biased;Multi;MultiNeg;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;394;-2400,-1952;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;1,1,1;False;4;FLOAT3;-1,-1,-1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;267;-2208,-1888;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;332;-800,-2112;Inherit;False;1130.841;958.8423;Local Vars;17;232;342;341;340;339;338;337;336;335;334;333;356;357;359;362;437;626;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;268;-2048,-1952;Inherit;False;Property;_InvertNoise;Invert Noise;46;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-768,-1968;Inherit;False;Constant;_Zero2;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;270;-1840,-1952;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;259;-2000,-1680;Inherit;False;Property;_AffectWind;Affect Wind;43;0;Create;True;0;0;0;False;0;False;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;336;-608,-1968;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;255;-1680,-1952;Inherit;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;3;FLOAT3;-1,-1,-1;False;4;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;282;-1696,-1680;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.1;False;4;FLOAT;-0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;220;-2320,-1232;Inherit;False;964;509.9999;Offset Settings;7;218;136;212;208;213;211;134;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;187;-3648,-1248;Inherit;False;1306.49;734.5852;Ray Settings;13;188;189;207;236;175;273;173;203;172;171;170;193;438;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;361;-1504,-1952;Inherit;False;336;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;257;-1472,-1856;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;211;-2288,-816;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;171;-3616,-832;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;360;-1312,-1920;Inherit;False;Property;_WindToggle;WindToggle;69;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;172;-3552,-1152;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToObjectMatrix;170;-3584,-992;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.CommentaryNode;345;-2320,-688;Inherit;False;674.0002;228.3333;Light Direction Settings;3;343;133;132;;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.InverseOpNode;213;-2064,-816;Inherit;False;1;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.ObjectPositionNode;208;-2128,-976;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;-3264,-1072;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;-3264,-832;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;272;-1088,-1920;Inherit;False;RF_Wind;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;132;-2288,-624;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;134;-2160,-1168;Inherit;False;Constant;_Offset;Offset;4;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,0.5;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;212;-1920,-960;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;175;-3008,-832;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;-3296,-1184;Inherit;False;272;RF_Wind;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;348;-2048,-3200;Inherit;False;1698.148;931.7406;RayMarcher Settings;19;346;331;329;330;98;344;178;37;39;35;34;219;30;29;108;192;191;38;32;;1,0,0,1;0;0
Node;AmplifyShaderEditor.NormalizeNode;133;-2032,-624;Inherit;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;136;-1744,-1040;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;236;-2976,-1136;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;207;-2752,-832;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;218;-1584,-1040;Inherit;False;RF_Offset;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;189;-2560,-832;Inherit;False;RF_RayDirection;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;188;-2560,-1136;Inherit;False;RF_RayOrigin;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-1792,-2432;Inherit;False;Property;_DarknessThreshold;Darkness Threshold;15;0;Create;True;0;0;0;True;0;False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;343;-1872,-624;Inherit;False;RF_LightDirection;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;32;-2016,-2784;Inherit;True;Property;_VolumetricTexture;Volumetric Texture;6;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;LockedToTexture3D;Texture3D;-1;0;2;SAMPLER3D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;191;-1728,-3136;Inherit;False;188;RF_RayOrigin;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;192;-1728,-3072;Inherit;False;189;RF_RayDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-1792,-3008;Inherit;False;Property;_NumberOfSteps;Number Of Steps;9;1;[IntRange];Create;True;0;0;0;False;0;False;2;0;0;256;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1792,-2944;Inherit;False;Property;_StepSize;Step Size;10;0;Create;True;0;0;0;True;0;False;0.1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;219;-1696,-2752;Inherit;False;218;RF_Offset;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1792,-2688;Inherit;False;Property;_NumberOfLightSteps;Number Of Light Steps;12;1;[IntRange];Create;True;0;0;0;True;0;False;2;1;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1792,-2624;Inherit;False;Property;_LightStepSize;Light Step Size;13;0;Create;True;0;0;0;True;0;False;0.05;1;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-1792,-2368;Inherit;False;Property;_Transmittance;Transmittance;16;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-1792,-2496;Inherit;False;Property;_LightAbsorb;Light Absorb;14;0;Create;True;0;0;0;True;0;True;1.2;1;-1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;-1504,-2432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.001;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;344;-1728,-2560;Inherit;False;343;RF_LightDirection;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1792,-2880;Inherit;False;Property;_DensityScale;Density Scale;11;0;Create;True;0;0;0;True;0;False;1;1;0.0001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;98;-1344,-2896;Inherit;False;float density = 0@$float transmission = 0@$float lightAccumulation = 0@$float finalLight = 0@$$$for(int i =0@ i< numSteps@ i++){$	rayOrigin += (rayDirection*stepSize)@$	$	float3 samplePos = rayOrigin+offset@$$	float sampledDensity = tex3D(Volume, samplePos).r@$	density += sampledDensity*densityScale@$$	//light loop$	float3 lightRayOrigin = samplePos@$	for(int j = 0@ j < numLightSteps@ j++){$		lightRayOrigin += lightDir*lightStepSize@$		float lightDensity = tex3D(Volume, lightRayOrigin).r@$		lightAccumulation += lightDensity@$	}$$	float lightTransmission = exp(-lightAccumulation)@$	float shadow = darknessThreshold + lightTransmission * (1.0 -darknessThreshold)@$	finalLight += density*transmittance*shadow@$	transmittance *= exp(-density*lightAbsorb)@$	$}$$transmission = exp(-density)@$$return float3(finalLight, transmission, transmittance)@$;3;Create;14;False;rayOrigin;FLOAT3;0,0,0;In;;Inherit;False;False;rayDirection;FLOAT3;0,0,0;In;;Inherit;False;False;numSteps;INT;0;In;;Inherit;False;False;stepSize;FLOAT;0;In;;Inherit;False;False;densityScale;FLOAT;0;In;;Inherit;False;False;Volume;SAMPLER3D;;In;;Inherit;False;False;volumeSampler;SAMPLERSTATE;;In;;Inherit;False;False;offset;FLOAT3;0,0,0;In;;Inherit;False;False;numLightSteps;INT;0;In;;Inherit;False;False;lightStepSize;FLOAT;0;In;;Inherit;False;False;lightDir;FLOAT3;0,0,0;In;;Inherit;False;False;lightAbsorb;FLOAT;0;In;;Inherit;False;False;darknessThreshold;FLOAT;0;In;;Inherit;False;False;transmittance;FLOAT;0;In;;Inherit;False;RayMarch;True;False;0;47a371af80793e44b922b31e46d24222;False;14;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;INT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;SAMPLER3D;;False;6;SAMPLERSTATE;;False;7;FLOAT3;0,0,0;False;8;INT;0;False;9;FLOAT;0;False;10;FLOAT3;0,0,0;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;330;-1040,-2928;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;329;-1040,-2800;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;331;-800,-2880;Inherit;False;Property;_GradeType;GradeType;61;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;355;-624,-688;Inherit;False;1956;642.6666;Final Comp;29;347;15;68;91;327;326;92;93;94;328;184;182;95;16;349;17;230;231;350;351;458;77;76;75;74;73;72;71;70;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;346;-576,-2880;Inherit;False;RF_RayMarch;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;347;-576,-256;Inherit;False;346;RF_RayMarch;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;15;-352,-256;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;17;640,-256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;230;512,-160;Inherit;False;Property;_Opacity;Opacity;64;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;896,-256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;625;-5248,-160;Inherit;False;3987.375;1549.095;Detail Texture Settings;80;529;457;662;582;581;661;660;659;653;475;658;651;650;640;639;446;445;642;641;657;465;466;656;655;652;649;647;648;646;645;644;643;654;488;477;632;638;635;636;476;473;472;633;444;528;553;468;483;471;479;554;443;667;668;669;670;671;672;673;674;676;677;684;689;690;691;692;693;694;702;706;709;710;705;711;712;713;714;715;716;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;621;-6288,-1248;Inherit;False;993.249;673.4642;Detail Color Settings;13;478;562;614;610;613;609;618;606;617;611;612;590;451;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;185;-5248,-1248;Inherit;False;1566.626;1057.185;Color Settings;26;118;114;113;13;619;620;179;597;181;598;183;616;615;595;596;580;579;592;591;459;180;14;123;664;665;666;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;350;1088,-256;Inherit;False;RF_FinalAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;416,-1376;Inherit;False;Property;_AlphaClipThreshold;Alpha Clip Threshold;18;0;Create;True;0;0;0;False;0;False;0.3;0.3;0;1.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;458;640,-352;Inherit;False;457;RF_SurfaceTexture;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;438;-3584,-912;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.StickyNoteNode;193;-3360,-640;Inherit;False;385.4993;102.2712;ONEMLİ !!!!;ONEMLI !!!!!!;1,0,0,1;Rotasyon yanlis calisiyor dusun bul bunun cozumunu$$rotasyon ters isliyor;0;0
Node;AmplifyShaderEditor.RangedFloatNode;333;-768,-2048;Inherit;False;Constant;_One2;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;334;-608,-2048;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;337;-768,-1888;Inherit;False;Constant;_Gray1;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;338;-608,-1888;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;339;-608,-1808;Inherit;False;RF_90;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;340;-768,-1808;Inherit;False;Constant;_Ninety;[Ninety];14;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;91;-128,-448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-192,-288;Inherit;False;Property;_LightAreaOffset;Light Area Offset;59;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-192,-368;Inherit;False;Property;_LightAreaIntensity;Light Area Intensity;60;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;92;64,-448;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;93;288,-448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;94;448,-448;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;328;256,-320;Inherit;False;Property;_Exponential;Exponential;62;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;184;576,-560;Inherit;False;183;RF_BaseColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;182;576,-640;Inherit;False;181;RF_ShadeColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;95;640,-448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;16;896,-576;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;349;1088,-576;Inherit;False;RF_FinalColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;351;1088,-160;Inherit;False;RF_Transmissive;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;232;-768,-1280;Inherit;False;Property;_Coverage;Coverage;17;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;341;-320,-2048;Inherit;False;Property;_CheckDef;CheckDef;70;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;342;-32,-2048;Inherit;False;Property;_cameraRayFold;cameraRayFold;67;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;359;-32,-1968;Inherit;False;Property;_lightRayFold;lightRayFold;68;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;356;-336,-1968;Inherit;False;Property;_BaseSettings;BaseSettings;101;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;357;-336,-1888;Inherit;False;Property;_checkCloud;checkCloud;72;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;362;-336,-1808;Inherit;False;Property;_checkWind;checkWind;77;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;451;-5840,-1184;Inherit;False;Property;_SurfaceTextureIntensity;Surface Texture Intensity;78;0;Create;True;0;0;0;False;0;False;1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;590;-5840,-1104;Inherit;False;Property;_AmbientTextureIntensity;Ambient Texture Intensity;79;0;Create;True;0;0;0;False;0;False;0.9439711;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;612;-5552,-1104;Inherit;False;RF_AmbientTXTInt;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;611;-5520,-1184;Inherit;False;RF_LightTXTInt;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;617;-5520,-1008;Inherit;False;RF_LightDetColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;606;-5744,-1008;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;618;-5552,-784;Inherit;False;RF_AbientDetColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ConditionalIfNode;609;-5744,-784;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;613;-6032,-832;Inherit;False;612;RF_AmbientTXTInt;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;610;-5968,-928;Inherit;False;336;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;614;-6000,-1008;Inherit;False;611;RF_LightTXTInt;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;562;-6032,-736;Inherit;False;HueShift;-1;;11;9f07e9ddd8ab81c47b3582f22189b65b;0;4;14;COLOR;0,0,0,0;False;15;FLOAT;0.5;False;16;FLOAT;0;False;17;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;478;-6256,-896;Inherit;False;Property;_DetailColor;Detail Color;88;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.IndirectDiffuseLighting;123;-5216,-1184;Inherit;False;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;14;-5184,-1088;Inherit;False;Property;_ShadeColor;ShadeColor;8;1;[HDR];Create;True;0;0;0;False;0;False;0.3804041,0.5108245,0.7421383,0;0.3804041,0.5108245,0.7421383,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;180;-4704,-1184;Inherit;False;Property;_AffectAmbientColor;Affect Ambient Color;58;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;459;-4960,-848;Inherit;False;457;RF_SurfaceTexture;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;591;-4528,-944;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;592;-4528,-752;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;579;-4384,-944;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;580;-4384,-752;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;615;-4960,-944;Inherit;False;612;RF_AmbientTXTInt;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;616;-4928,-752;Inherit;False;611;RF_LightTXTInt;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;183;-3904,-448;Inherit;False;RF_BaseColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;598;-4160,-448;Inherit;False;Property;_LightAreaDetails;LightAreaDetails;91;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;181;-3904,-1184;Inherit;False;RF_ShadeColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;597;-4160,-1184;Inherit;False;Property;_AmbientDetails;AmbientDetails;89;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;179;-4672,-448;Inherit;False;Property;_AffectLightColor;Affect Light Color;40;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;619;-4768,-1024;Inherit;False;618;RF_AbientDetColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;13;-5184,-352;Inherit;False;Property;_BaseColor;Base Color;7;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;113;-5152,-480;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;114;-4896,-448;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-4896,-1184;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;233;704,-1376;Inherit;False;Property;_AlphaClip;Alpha Clip;65;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;416,-1280;Inherit;False;Property;_ShadowClipThreshold;Shadow Clip Threshold;19;0;Create;True;0;0;0;False;0;False;0.01;0;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;234;704,-1280;Inherit;False;Property;_ShadowClip;Shadow Clip;66;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;354;704,-1456;Inherit;False;350;RF_FinalAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;352;704,-1536;Inherit;False;349;RF_FinalColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;437;-336,-1728;Inherit;False;Property;_checkLight;checkLight;96;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;626;-336,-1648;Inherit;False;Property;_checkDetail;checkDetail;100;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;471;-4304,400;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;483;-4304,560;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;468;-4560,464;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;553;-4080,656;Inherit;True;Property;_TextureSample0;Texture Sample 0;89;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;633;-5088,32;Inherit;False;Constant;_AOXY;AOXY;93;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;472;-5152,96;Inherit;False;Property;_TextureASpeedX;TextureASpeedX;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;473;-5152,160;Inherit;False;Property;_TextureASpeedY;TextureASpeedY;84;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;476;-5152,224;Inherit;False;Property;_TextureASpeedZ;TextureASpeedZ;87;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;636;-5216,352;Inherit;False;Property;_TextureARotate;TextureARotate;98;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;635;-5184,288;Inherit;False;Property;_TextureAOverallSpeed;TextureAOverallSpeed;99;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;638;-5184,416;Inherit;False;Property;_TextureARotateSpeed;TextureARotateSpeed;97;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;477;-4544,272;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;488;-4448,1136;Inherit;True;Property;_DetailTextureB;DetailTextureB;92;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DynamicAppendNode;654;-4544,1008;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;643;-5088,768;Inherit;False;Constant;_BOXY;BOXY;93;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;644;-5152,832;Inherit;False;Property;_TextureBSpeedX;TextureBSpeedX;83;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;645;-5152,896;Inherit;False;Property;_TextureBSpeedY;TextureBSpeedY;85;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;646;-5152,960;Inherit;False;Property;_TextureBSpeedZ;TextureBSpeedZ;86;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;648;-5184,1024;Inherit;False;Property;_TextureBOverallSpeed;TextureBOverallSpeed;94;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;647;-5216,1088;Inherit;False;Property;_TextureBRotate;TextureBRotate;95;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;649;-5184,1152;Inherit;False;Property;_TextureBRotateSpeed;TextureBRotateSpeed;93;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-5120,640;Inherit;False;Property;_TextureBTileX;TextureBTileX;73;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;642;-5120,704;Inherit;False;Property;_TextureBTileY;TextureBTileY;75;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;445;-5120,-96;Inherit;False;Property;_TextureATileX;TextureATileX;74;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;446;-5120,-32;Inherit;False;Property;_TextureATileY;TextureATileY;76;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;639;-5120,480;Inherit;False;Property;_TextureAPivotX;TextureAPivotX;102;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;640;-5120,544;Inherit;False;Property;_TextureAPivotY;TextureAPivotY;104;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;650;-5120,1216;Inherit;False;Property;_TextureBPivotX;TextureBPivotX;103;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;651;-5120,1280;Inherit;False;Property;_TextureBPivotY;TextureBPivotY;109;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;658;-4880,416;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;475;-4736,416;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;653;-4736,1152;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;659;-4880,1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;596;-4704,-752;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-0.7;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;620;-4736,-576;Inherit;False;617;RF_LightDetColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;595;-4704,-944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-0.4;False;4;FLOAT;0.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;665;-4304,-1056;Inherit;False;Saturation;-1;;12;4f383aa3b2a7ef640be83276d286e709;0;2;12;FLOAT3;0,0,0;False;21;FLOAT;0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;664;-4352,-624;Inherit;False;Saturation;-1;;13;4f383aa3b2a7ef640be83276d286e709;0;2;12;FLOAT3;0,0,0;False;21;FLOAT;0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;666;-4224,-848;Inherit;False;Property;_Saturation;Saturation;108;0;Create;True;0;0;0;False;0;False;0.5;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;457;-1520,480;Inherit;False;RF_SurfaceTexture;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;529;-1744,480;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TriplanarNode;443;-4160,96;Inherit;True;Cylindrical;World;False;Top Texture 0;_TopTexture0;white;-1;None;Mid Texture 0;_MidTexture0;white;2;None;Bot Texture 0;_BotTexture0;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT3;1,1,1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;554;-4080,304;Inherit;True;Property;_TextureSample1;Texture Sample 1;89;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TriplanarNode;479;-4160,848;Inherit;True;Cylindrical;World;False;Top Texture 1;_TopTexture1;white;-1;None;Mid Texture 1;_MidTexture1;white;3;None;Bot Texture 1;_BotTexture1;white;0;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT3;1,1,1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;669;-4864,0;Inherit;False;Property;_TAFalloff;TAFalloff;110;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;444;-4384,-96;Inherit;True;Property;_DetailTextureA;DetailTextureA;90;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TFHCRemapNode;674;-4592,0;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;676;-4560,720;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;671;-4160,1056;Inherit;True;Spherical;Object;False;Top Texture 3;_TopTexture3;white;-1;None;Mid Texture 3;_MidTexture3;white;3;None;Bot Texture 3;_BotTexture3;white;0;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;668;-4160,-96;Inherit;True;Spherical;Object;False;Top Texture 2;_TopTexture2;white;-1;None;Mid Texture 2;_MidTexture2;white;2;None;Bot Texture 2;_BotTexture2;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GammaToLinearNode;655;-2224,448;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;656;-2224,576;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;466;-1872,608;Inherit;False;Property;_Contrast;Contrast;81;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;465;-1872,688;Inherit;False;Property;_Bias;Bias;80;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;657;-2000,480;Inherit;False;Property;_DetTXTGradeType;DetTXTGradeType;105;0;Create;True;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RelayNode;661;-2352,496;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;710;-3696,672;Inherit;False;Property;_BackContrast;BackContrast;116;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-3696,512;Inherit;False;Property;_SmoothMin;SmoothMin;113;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;693;-2848,432;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SmoothstepOpNode;692;-2848,176;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SmoothstepOpNode;689;-2848,576;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;713;-3696,752;Inherit;False;Property;_BackExponent;BackExponent;115;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;662;-3008,176;Inherit;False;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0.1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-3712,432;Inherit;False;Constant;_TotalTexture;TotalTexture;90;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;673;-3680,352;Inherit;False;Constant;_MultCoef;MultCoef;110;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;711;-3232,176;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;660;-3392,176;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;581;-3392,432;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;4;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;528;-3520,432;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DistanceOpNode;684;-3392,640;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;712;-3232,432;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;715;-3232,640;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;714;-3008,432;Inherit;False;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0.1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;716;-3008,640;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;706;-3392,832;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;709;-3232,832;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;702;-3008,832;Inherit;False;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0.3;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SmoothstepOpNode;694;-2848,832;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;690;-3696,592;Inherit;False;Property;_SmoothMax;SmoothMax;112;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;705;-3744,832;Inherit;False;Property;_LerpCoef;LerpCoef;114;0;Create;True;0;0;0;False;0;False;0;0.5;-2;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;667;-3728,80;Inherit;False;Property;_TypeA;TypeA;106;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;TriSphere;TriCylinder;UV;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;672;-3744,944;Inherit;False;Property;_TypeB;TypeB;107;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;TriSphere;TriCylinder;UV;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;670;-4848,720;Inherit;False;Property;_TBFalloff;TBFalloff;117;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;652;-4864,816;Inherit;False;BUDU UVTileOffsetAnimate;0;;14;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;3;FLOAT2;58;FLOAT2;59;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;632;-4864,96;Inherit;False;BUDU UVTileOffsetAnimate;0;;15;e5427372b55a27e4eba87524fde481ad;1,55,1;12;56;FLOAT2;1,0;False;21;FLOAT;1;False;14;FLOAT;1;False;16;FLOAT;0;False;17;FLOAT;0;False;51;FLOAT;0;False;52;FLOAT;0;False;53;FLOAT;0;False;20;FLOAT;0;False;54;FLOAT;0;False;18;FLOAT;0;False;19;FLOAT;0;False;3;FLOAT2;58;FLOAT2;59;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;677;-2640,496;Inherit;False;Property;_DetailBlendMethod;DetailBlendMethod;111;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;Multi;Add;Distance;Alpha;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;70;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;71;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;72;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;73;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;74;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;75;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;76;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;77;224,-80;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;68;592,-256;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;69;1024,-1456;Float;False;True;-1;2;BVolumetricCloudEditor;0;13;BUDU Shaders/BVolumetricCloud;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_Coverage;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;True;True;2;5;False;;10;False;;0;5;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;22;Surface;1;638594559110809734;  Blend;0;0;Two Sided;1;638595380101363453;Forward Only;0;638596689434820215;Cast Shadows;1;0;  Use Shadow Threshold;1;638595217448320083;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;0;638594606353173580;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;True;True;False;False;True;True;True;False;False;;False;0
WireConnection;630;21;289;0
WireConnection;630;14;287;0
WireConnection;630;16;290;0
WireConnection;630;17;291;0
WireConnection;630;51;292;0
WireConnection;630;52;293;0
WireConnection;630;53;295;0
WireConnection;630;20;296;0
WireConnection;630;54;294;0
WireConnection;630;18;297;0
WireConnection;630;19;288;0
WireConnection;299;0;630;0
WireConnection;305;0;302;0
WireConnection;317;0;303;0
WireConnection;317;1;305;0
WireConnection;317;2;304;0
WireConnection;317;3;306;0
WireConnection;310;0;303;0
WireConnection;310;1;304;0
WireConnection;308;1;303;0
WireConnection;313;0;317;0
WireConnection;313;1;309;0
WireConnection;312;0;310;0
WireConnection;312;1;309;0
WireConnection;311;0;308;5
WireConnection;311;1;309;0
WireConnection;314;1;313;0
WireConnection;314;0;312;0
WireConnection;314;2;311;0
WireConnection;433;0;314;0
WireConnection;315;0;433;0
WireConnection;316;0;433;0
WireConnection;316;1;315;0
WireConnection;631;21;238;0
WireConnection;631;14;239;0
WireConnection;631;16;240;0
WireConnection;631;17;241;0
WireConnection;631;51;242;0
WireConnection;631;52;243;0
WireConnection;631;53;244;0
WireConnection;631;20;245;0
WireConnection;631;54;246;0
WireConnection;631;18;247;0
WireConnection;631;19;248;0
WireConnection;251;0;631;0
WireConnection;319;0;316;0
WireConnection;323;0;253;0
WireConnection;323;1;320;0
WireConnection;266;0;265;0
WireConnection;301;0;253;0
WireConnection;301;1;323;0
WireConnection;275;1;301;0
WireConnection;264;0;301;0
WireConnection;264;1;266;0
WireConnection;264;2;256;0
WireConnection;264;3;271;0
WireConnection;258;0;301;0
WireConnection;258;1;256;0
WireConnection;280;0;264;0
WireConnection;280;1;277;0
WireConnection;279;0;258;0
WireConnection;279;1;277;0
WireConnection;276;0;275;5
WireConnection;276;1;277;0
WireConnection;274;1;280;0
WireConnection;274;0;279;0
WireConnection;274;2;276;0
WireConnection;429;0;274;0
WireConnection;396;0;274;0
WireConnection;396;1;274;0
WireConnection;384;0;274;0
WireConnection;407;0;274;0
WireConnection;407;1;274;0
WireConnection;432;0;274;0
WireConnection;432;1;429;0
WireConnection;406;1;274;0
WireConnection;406;0;396;0
WireConnection;406;2;384;0
WireConnection;406;3;407;0
WireConnection;406;4;432;0
WireConnection;394;0;406;0
WireConnection;267;0;394;0
WireConnection;268;0;394;0
WireConnection;268;1;267;0
WireConnection;270;0;268;0
WireConnection;336;0;335;0
WireConnection;255;0;270;0
WireConnection;282;0;259;0
WireConnection;257;0;255;0
WireConnection;257;1;282;0
WireConnection;360;0;361;0
WireConnection;360;1;257;0
WireConnection;213;0;211;0
WireConnection;203;0;172;0
WireConnection;203;1;170;0
WireConnection;173;0;171;0
WireConnection;173;1;170;0
WireConnection;272;0;360;0
WireConnection;212;0;208;0
WireConnection;212;1;213;0
WireConnection;175;0;203;0
WireConnection;175;1;173;0
WireConnection;133;0;132;0
WireConnection;136;0;134;0
WireConnection;136;1;212;0
WireConnection;236;0;273;0
WireConnection;236;1;203;0
WireConnection;207;0;175;0
WireConnection;218;0;136;0
WireConnection;189;0;207;0
WireConnection;188;0;236;0
WireConnection;343;0;133;0
WireConnection;178;0;38;0
WireConnection;98;0;191;0
WireConnection;98;1;192;0
WireConnection;98;2;108;0
WireConnection;98;3;29;0
WireConnection;98;4;30;0
WireConnection;98;5;32;0
WireConnection;98;6;32;1
WireConnection;98;7;219;0
WireConnection;98;8;34;0
WireConnection;98;9;35;0
WireConnection;98;10;344;0
WireConnection;98;11;37;0
WireConnection;98;12;178;0
WireConnection;98;13;39;0
WireConnection;330;0;98;0
WireConnection;329;0;98;0
WireConnection;331;1;330;0
WireConnection;331;0;98;0
WireConnection;331;2;329;0
WireConnection;346;0;331;0
WireConnection;15;0;347;0
WireConnection;17;0;15;1
WireConnection;231;0;17;0
WireConnection;231;1;230;0
WireConnection;350;0;231;0
WireConnection;334;0;333;0
WireConnection;338;0;337;0
WireConnection;339;0;340;0
WireConnection;91;0;15;0
WireConnection;92;0;91;0
WireConnection;92;1;326;0
WireConnection;92;2;327;0
WireConnection;93;0;92;0
WireConnection;94;0;93;0
WireConnection;94;1;328;0
WireConnection;95;0;94;0
WireConnection;16;0;182;0
WireConnection;16;1;184;0
WireConnection;16;2;95;0
WireConnection;349;0;16;0
WireConnection;351;0;15;2
WireConnection;612;0;590;0
WireConnection;611;0;451;0
WireConnection;617;0;606;0
WireConnection;606;0;614;0
WireConnection;606;1;610;0
WireConnection;606;2;478;5
WireConnection;606;3;478;5
WireConnection;606;4;562;0
WireConnection;618;0;609;0
WireConnection;609;0;613;0
WireConnection;609;1;610;0
WireConnection;609;2;478;5
WireConnection;609;3;478;5
WireConnection;609;4;562;0
WireConnection;562;14;478;5
WireConnection;180;0;14;0
WireConnection;180;1;118;0
WireConnection;591;0;459;0
WireConnection;591;1;595;0
WireConnection;591;2;619;0
WireConnection;592;0;459;0
WireConnection;592;1;596;0
WireConnection;592;2;620;0
WireConnection;579;0;180;0
WireConnection;579;1;591;0
WireConnection;580;0;179;0
WireConnection;580;1;592;0
WireConnection;183;0;598;0
WireConnection;598;0;179;0
WireConnection;598;1;664;0
WireConnection;181;0;597;0
WireConnection;597;0;180;0
WireConnection;597;1;665;0
WireConnection;179;0;13;0
WireConnection;179;1;114;0
WireConnection;114;0;13;0
WireConnection;114;1;113;1
WireConnection;114;2;113;2
WireConnection;118;0;14;0
WireConnection;118;1;123;0
WireConnection;233;1;84;0
WireConnection;234;1;128;0
WireConnection;471;0;468;0
WireConnection;471;1;477;0
WireConnection;483;0;468;0
WireConnection;483;1;654;0
WireConnection;553;0;488;0
WireConnection;553;1;652;0
WireConnection;477;0;632;59
WireConnection;477;2;475;0
WireConnection;654;0;652;59
WireConnection;654;2;653;0
WireConnection;658;0;635;0
WireConnection;658;1;476;0
WireConnection;475;0;658;0
WireConnection;653;0;659;0
WireConnection;659;0;646;0
WireConnection;659;1;648;0
WireConnection;596;0;616;0
WireConnection;595;0;615;0
WireConnection;665;12;579;0
WireConnection;665;21;666;0
WireConnection;664;12;580;0
WireConnection;664;21;666;0
WireConnection;457;0;529;0
WireConnection;529;0;657;0
WireConnection;529;1;466;0
WireConnection;529;2;465;0
WireConnection;443;0;444;0
WireConnection;443;1;444;0
WireConnection;443;2;444;0
WireConnection;443;9;471;0
WireConnection;443;3;632;58
WireConnection;443;4;674;0
WireConnection;554;0;444;0
WireConnection;554;1;632;0
WireConnection;479;0;488;0
WireConnection;479;1;488;0
WireConnection;479;2;488;0
WireConnection;479;9;483;0
WireConnection;479;3;652;58
WireConnection;479;4;676;0
WireConnection;674;0;669;0
WireConnection;676;0;670;0
WireConnection;671;0;488;0
WireConnection;671;9;483;0
WireConnection;671;3;652;58
WireConnection;671;4;676;0
WireConnection;668;0;444;0
WireConnection;668;9;471;0
WireConnection;668;3;632;58
WireConnection;668;4;674;0
WireConnection;655;0;661;0
WireConnection;656;0;661;0
WireConnection;657;1;655;0
WireConnection;657;0;661;0
WireConnection;657;2;656;0
WireConnection;661;0;677;0
WireConnection;693;0;714;0
WireConnection;693;1;691;0
WireConnection;693;2;690;0
WireConnection;692;0;662;0
WireConnection;692;1;691;0
WireConnection;692;2;690;0
WireConnection;689;0;716;0
WireConnection;689;1;691;0
WireConnection;689;2;690;0
WireConnection;662;0;711;0
WireConnection;662;1;713;0
WireConnection;711;0;660;0
WireConnection;711;1;710;0
WireConnection;660;0;667;0
WireConnection;660;1;672;0
WireConnection;581;0;528;0
WireConnection;581;1;582;0
WireConnection;528;0;667;0
WireConnection;528;1;672;0
WireConnection;684;0;667;0
WireConnection;684;1;672;0
WireConnection;712;0;581;0
WireConnection;712;1;710;0
WireConnection;715;0;684;0
WireConnection;715;1;710;0
WireConnection;714;0;712;0
WireConnection;714;1;713;0
WireConnection;716;0;715;0
WireConnection;716;1;713;0
WireConnection;706;0;667;0
WireConnection;706;1;672;0
WireConnection;706;2;705;0
WireConnection;709;0;706;0
WireConnection;709;1;710;0
WireConnection;702;0;709;0
WireConnection;702;1;713;0
WireConnection;694;0;702;0
WireConnection;694;1;691;0
WireConnection;694;2;690;0
WireConnection;667;1;668;0
WireConnection;667;0;443;0
WireConnection;667;2;554;0
WireConnection;672;1;671;0
WireConnection;672;0;479;0
WireConnection;672;2;553;0
WireConnection;652;21;641;0
WireConnection;652;14;642;0
WireConnection;652;16;643;0
WireConnection;652;17;643;0
WireConnection;652;51;644;0
WireConnection;652;52;645;0
WireConnection;652;53;648;0
WireConnection;652;20;647;0
WireConnection;652;54;649;0
WireConnection;652;18;650;0
WireConnection;652;19;651;0
WireConnection;632;21;445;0
WireConnection;632;14;446;0
WireConnection;632;16;633;0
WireConnection;632;17;633;0
WireConnection;632;51;472;0
WireConnection;632;52;473;0
WireConnection;632;53;635;0
WireConnection;632;20;636;0
WireConnection;632;54;638;0
WireConnection;632;18;639;0
WireConnection;632;19;640;0
WireConnection;677;1;692;0
WireConnection;677;0;693;0
WireConnection;677;2;689;0
WireConnection;677;3;694;0
WireConnection;69;2;352;0
WireConnection;69;3;354;0
WireConnection;69;4;233;0
WireConnection;69;7;234;0
ASEEND*/
//CHKSM=AC242EEE6D2E39CF3CF3ABDF2485676CA3D5E429
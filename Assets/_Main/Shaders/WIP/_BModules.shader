// Made with Amplify Shader Editor v1.9.4.4
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/Modules/BModules"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Enum(Rim On,1,Rim Off,0)]_RimSwitch("RimSwitch", Int) = 0
		_Scattering("Scattering", Range( 1 , 50)) = 2
		_TranslucencyStrength("Translucency Strength", Range( 0 , 50)) = 1
		_Direct1("Direct", Range( 0 , 1)) = 0.9
		_Direct("Direct", Range( 0 , 1)) = 0.9
		_NormalDistortion("Normal Distortion", Range( 0 , 1)) = 0.5
		_SatinContrast("Satin Contrast", Range( -2 , 2)) = 1
		_SatinIntensity("Satin Intensity", Range( 0 , 1)) = 0.5
		_SatinSmoothing("Satin Smoothing", Range( 0 , 1)) = 0.5
		_SatinLightShade("Satin Light Shade", Range( 0 , 1)) = 0
		[HideInInspector]_GradCLength("GradCLength", Int) = 0
		[HideInInspector]_GradALength("GradALength", Int) = 0
		[HideInInspector]_AKey7("AKey7", Float) = 0
		[HideInInspector]_AKey6("AKey6", Float) = 0
		[HideInInspector]_AKey5("AKey5", Float) = 0
		[HideInInspector]_AKey4("AKey4", Float) = 0
		[HideInInspector]_AKey3("AKey3", Float) = 0
		[HideInInspector]_AKey2("AKey2", Float) = 0
		[HideInInspector]_AKey1("AKey1", Float) = 0
		[HideInInspector]_AKey0("AKey0", Float) = 0
		[HideInInspector]_CKey0("CKey0", Color) = (0,0,0,1)
		[HideInInspector]_CKey1("CKey1", Color) = (0,0,0,1)
		[HideInInspector]_CKey2("CKey2", Color) = (0,0,0,1)
		[HideInInspector]_CKey3("CKey3", Color) = (0,0,0,1)
		[HideInInspector]_CKey4("CKey4", Color) = (0,0,0,1)
		_SatinColor("Satin Color", Color) = (1,1,1,1)
		[HideInInspector]_CKey5("CKey5", Color) = (0,0,0,1)
		[HideInInspector]_CKey6("CKey6", Color) = (0,0,0,1)
		[HideInInspector]_CKey7("CKey7", Color) = (0,0,0,1)
		[HideInInspector]_CTime6("CTime6", Float) = 0
		[HideInInspector]_CTime5("CTime5", Float) = 0
		[HideInInspector]_CTime4("CTime4", Float) = 0
		[HideInInspector]_CTime0("CTime0", Float) = 0
		[Enum(Rim On,1,Rim Off,0)]_FSwitch("FSwitch", Int) = 0
		[HideInInspector]_CTime2("CTime2", Float) = 0
		[HideInInspector]_CTime1("CTime1", Float) = 0
		[HideInInspector]_CTime7("CTime7", Float) = 0
		[HideInInspector]_CTime3("CTime3", Float) = 0
		[HideInInspector]_ATime0("ATime0", Float) = 0
		[HideInInspector]_ATime1("ATime1", Float) = 0
		[HideInInspector]_ATime2("ATime2", Float) = 0
		[HideInInspector]_ATime3("ATime3", Float) = 0
		[HideInInspector]_ATime4("ATime4", Float) = 0
		[HideInInspector]_ATime5("ATime5", Float) = 0
		[HideInInspector]_ATime6("ATime6", Float) = 0
		[HideInInspector]_ATime7("ATime7", Float) = 0
		[Header(Normal Controls)][Normal]_NormalMap1("Normal Map", 2D) = "bump" {}
		[HideInInspector][Enum(Blend Classic,0,Fixed,1,Blend Perceptual,2)]_GradMode("GradMode", Int) = 0
		[HideInInspector]_CustomRamp("CustomRamp", Int) = 0
		[Toggle]_Normal("Normal", Float) = 0
		_NormalScale1("Normal Scale", Range( -1 , 1)) = 0.3
		[HideInInspector]_ToonSpec("ToonSpec", Int) = 0
		[HideInInspector]_ColoredAmbient("ColoredAmbient", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
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

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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

			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			sampler2D _NormalMap1;


			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
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

				float4 color2017 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float temp_output_1007_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = SafeNormalize( ase_tanViewDir );
				float2 temp_output_1_0_g155 = float2( 0,0 );
				float dotResult4_g155 = dot( temp_output_1_0_g155 , temp_output_1_0_g155 );
				float3 appendResult10_g155 = (float3((temp_output_1_0_g155).x , (temp_output_1_0_g155).y , sqrt( ( 1.0 - saturate( dotResult4_g155 ) ) )));
				float3 normalizeResult12_g155 = ASESafeNormalize( appendResult10_g155 );
				float2 uv_NormalMap1 = IN.ase_texcoord8.xy * _NormalMap1_ST.xy + _NormalMap1_ST.zw;
				float3 unpack540 = UnpackNormalScale( tex2D( _NormalMap1, uv_NormalMap1 ), _NormalScale1 );
				unpack540.z = lerp( 1, unpack540.z, saturate(_NormalScale1) );
				float3 tanNormal541 = (( _Normal )?( unpack540 ):( normalizeResult12_g155 ));
				float3 worldNormal541 = normalize( float3(dot(tanToWorld0,tanNormal541), dot(tanToWorld1,tanNormal541), dot(tanToWorld2,tanNormal541)) );
				float3 NewNormals542 = worldNormal541;
				float dotResult1002 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , NewNormals542 );
				float saferPower1005 = abs( dotResult1002 );
				float smoothstepResult1009 = smoothstep( temp_output_1007_0 , -temp_output_1007_0 , pow( saferPower1005 , (0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0)) ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 Satin1020 = ( _SatinColor * ( smoothstepResult1009 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) );
				
				float3 temp_cast_2 = (0.0).xxx;
				

				float3 BaseColor = color2017.rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = Satin1020.rgb;
				float3 Specular = temp_cast_2;
				float Metallic = 0;
				float Smoothness = 0.5;
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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
			}
			

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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
			}
			

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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			sampler2D _NormalMap1;


			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
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
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord7.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
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

				float4 color2017 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float temp_output_1007_0 = (0.0 + (_SatinContrast - 0.0) * (1.0 - 0.0) / (1.0 - 0.0));
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
				float2 temp_output_1_0_g155 = float2( 0,0 );
				float dotResult4_g155 = dot( temp_output_1_0_g155 , temp_output_1_0_g155 );
				float3 appendResult10_g155 = (float3((temp_output_1_0_g155).x , (temp_output_1_0_g155).y , sqrt( ( 1.0 - saturate( dotResult4_g155 ) ) )));
				float3 normalizeResult12_g155 = ASESafeNormalize( appendResult10_g155 );
				float2 uv_NormalMap1 = IN.ase_texcoord7.xy * _NormalMap1_ST.xy + _NormalMap1_ST.zw;
				float3 unpack540 = UnpackNormalScale( tex2D( _NormalMap1, uv_NormalMap1 ), _NormalScale1 );
				unpack540.z = lerp( 1, unpack540.z, saturate(_NormalScale1) );
				float3 tanNormal541 = (( _Normal )?( unpack540 ):( normalizeResult12_g155 ));
				float3 worldNormal541 = normalize( float3(dot(tanToWorld0,tanNormal541), dot(tanToWorld1,tanNormal541), dot(tanToWorld2,tanNormal541)) );
				float3 NewNormals542 = worldNormal541;
				float dotResult1002 = dot( ( ase_tanViewDir + _MainLightPosition.xyz ) , NewNormals542 );
				float saferPower1005 = abs( dotResult1002 );
				float smoothstepResult1009 = smoothstep( temp_output_1007_0 , -temp_output_1007_0 , pow( saferPower1005 , (0.3 + (_SatinSmoothing - 0.0) * (0.7 - 0.3) / (1.0 - 0.0)) ));
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 Satin1020 = ( _SatinColor * ( smoothstepResult1009 * _SatinIntensity * saturate( ( ( 1.0 - _SatinLightShade ) + ase_lightAtten ) ) ) );
				

				float3 BaseColor = color2017.rgb;
				float3 Emission = Satin1020.rgb;
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

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
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

				float4 color2017 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				

				float3 BaseColor = color2017.rgb;
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

			

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
			}
			

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

				

				float3 Normal = float3(0, 0, 1);
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

			

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSLUCENCY 1
			#define _EMISSION
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
			float4 _CKey1;
			float4 _CKey0;
			float4 _SatinColor;
			float4 _NormalMap1_ST;
			float4 _CKey7;
			float4 _CKey4;
			float4 _CKey5;
			float4 _CKey2;
			float4 _CKey3;
			float4 _CKey6;
			float _SatinSmoothing;
			float _CTime0;
			float _ATime0;
			int _CustomRamp;
			int _GradMode;
			float _AKey0;
			int _RimSwitch;
			int _FSwitch;
			float _NormalDistortion;
			float _TranslucencyStrength;
			float _Direct;
			int _GradCLength;
			int _ToonSpec;
			int _ColoredAmbient;
			float _SatinContrast;
			float _Normal;
			float _NormalScale1;
			float _Scattering;
			float _Direct1;
			float _ATime6;
			float _SatinIntensity;
			int _GradALength;
			float _AKey1;
			float _AKey2;
			float _AKey3;
			float _AKey4;
			float _AKey5;
			float _AKey6;
			float _AKey7;
			float _CTime1;
			float _ATime7;
			float _CTime2;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _CTime3;
			float _SatinLightShade;
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

			

			float3 modulo3( float3 divident, float3 divisor )
			{
				float3 positiveDivident = divident % divisor + divisor;
				return positiveDivident % divisor;
			}
			
			float rand3dTo1d( float3 value, float3 dotDir )
			{
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float rand1dTo1d( float value, float mutator )
			{
				float random = frac(sin(value + mutator) * 143758.5453);
					return random;
			}
			
			float rand3dTo1d1Param( float3 value )
			{
				float3 dotDir = float3(12.9898, 78.233, 37.719); 
				//make value smaller to avoid artefacts
					float3 smallValue = cos(value);
					//get scalar value from 3d vector
					float random = dot(smallValue, dotDir);
					//make value more random by making it bigger and then taking the factional part
					random = frac(sin(random) * 143758.5453);
					return random;
			}
			
			float3 rand3dTo3d( float3 value )
			{
				return float3(
						rand3dTo1d(value, float3(12.989, 78.233, 37.719)),
						rand3dTo1d(value, float3(39.346, 11.135, 83.155)),
						rand3dTo1d(value, float3(73.156, 52.235, 09.151))
					);
			}
			
			float3 rand1dTo3d( float value )
			{
				return float3(
						rand1dTo1d(value, 3.9812),
						rand1dTo1d(value, 7.1536),
						rand1dTo1d(value, 5.7241)
					);
			}
			
			float3 voronoiNoise( float3 value, float3 period, float3 angleOffset )
			{
				float3 baseCell = floor(value);
								//first pass to find the closest cell
								float minDistToCell = 10;
								float3 toClosestCell;
								float3 closestCell;
								[unroll]
								for(int x1=-1; x1<=1; x1++){
									[unroll]
									for(int y1=-1; y1<=1; y1++){
										[unroll]
										for(int z1=-1; z1<=1; z1++){
											float3 cell = baseCell + float3(x1, y1, z1);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell)*angleOffset;
											float3 toCell = cellPosition - value;
											float distToCell = length(toCell);
											if(distToCell < minDistToCell){
												minDistToCell = distToCell;
												closestCell = cell;
												toClosestCell = toCell;
											}
										}
									}
								}
								//second pass to find the distance to the closest edge
								float minEdgeDistance = 10;
								[unroll]
								for(int x2=-1; x2<=1; x2++){
									[unroll]
									for(int y2=-1; y2<=1; y2++){
										[unroll]
										for(int z2=-1; z2<=1; z2++){
											float3 cell = baseCell + float3(x2, y2, z2);
											float3 tiledCell = modulo3(cell, period);
											float3 cellPosition = cell + rand3dTo3d(tiledCell);
											float3 toCell = cellPosition - value;
											float3 diffToClosestCell = abs(closestCell - cell);
											bool isClosestCell = diffToClosestCell.x + diffToClosestCell.y + diffToClosestCell.z < 0.1;
											if(!isClosestCell){
												float3 toCenter = (toClosestCell + toCell) * 0.5;
												float3 cellDifference = normalize(toCell - toClosestCell);
												float edgeDistance = dot(toCenter, cellDifference);
												minEdgeDistance = min(minEdgeDistance, edgeDistance);
											}
										}
									}
								}
								float random = rand3dTo1d1Param(closestCell);
								return float3(minDistToCell, random, minEdgeDistance);
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
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19404
Node;AmplifyShaderEditor.CommentaryNode;2234;-18448,2992;Inherit;False;6225.821;2578.026;Noise and Caustic Animation Settings Default;36;2334;2269;2268;2267;2266;2265;2264;2263;2262;2261;2260;2259;2258;2257;2256;2255;2254;2253;2252;2251;2250;2249;2248;2247;2246;2245;2244;2243;2242;2241;2240;2239;2238;2237;2236;2235;Noise and Caustic Animation Settings Default;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2142;-16384,-3200;Inherit;False;1108;517;Blue Noise Normal Settings;5;1239;1240;1241;1242;1237;Blue Noise Normal Settings;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2045;-17824,144;Inherit;False;1620;977.3335;Animate 2 UV's Settings;24;2023;2019;2022;2024;2028;2026;2025;2029;2027;2031;2030;2021;2034;2035;2036;2032;2033;2039;2038;2040;2041;2037;2043;2044;Animate 2 UV's Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1146;-9360,-2560;Inherit;False;519.5637;734.9113;Local Vars;13;1190;1189;1186;1185;1184;1183;1148;1147;1930;1931;1932;1933;1934;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;610;-11328,-2016;Inherit;False;958.2924;669.2954;Fresnel Set;7;602;600;607;604;605;603;601;Fresnel Set;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;364;-7152,-192;Inherit;False;851.0864;474.1567;Main Texture;4;371;36;90;2;Main Texture;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;474;-16880,2192;Inherit;False;1505.372;638.2638;Warning Settings;10;480;479;477;484;483;478;475;476;485;486;Warning Settings;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;342;-4336,2576;Inherit;False;823.0073;548.579;Simple Outline Built In;4;72;70;71;266;Simple Outline Built In;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;220;-13712,-2864;Inherit;False;2177.829;914.1276;Rim Light Old;18;242;234;222;260;258;261;255;253;259;257;254;252;249;245;233;241;251;343;Rim Light Old;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;368;-7168,-1360;Inherit;False;2867.641;598.0518;Specular Blinn Setup;18;376;375;369;365;148;336;149;294;108;147;140;107;117;109;106;110;115;143;Specular Blinn Setup;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;520;-14912,-176;Inherit;False;1400.133;731.5126;Sinus Time Settings;10;496;497;499;490;494;503;493;517;498;519;Sinus Time Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;502;-17872,2528;Inherit;False;964.9624;308.4;Sin Time;5;501;487;488;491;500;Sin Time;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;175;-5584,-10384;Inherit;False;3600.169;1102.785;Comment;22;189;182;179;177;186;187;197;191;196;193;192;194;202;184;183;185;176;181;190;180;339;344;Nedir Bu ?;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;207;-17728,-2560;Inherit;False;816.4238;534.0689;Normal Light Direction;4;210;212;209;211;Normal Light Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;166;-4400,3408;Inherit;False;1019.472;923.8978;Custom Outline;8;174;172;173;171;169;170;168;167;Custom Outline;1,0.8605404,0.6556604,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;353;-8528,-544;Inherit;False;1000.904;505.2888;Thickness Set;5;323;321;320;165;319;Thickness Set;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;394;-14944,1360;Inherit;False;2244.913;491.2922;Wipe Module;16;410;409;408;407;401;395;397;398;400;405;406;404;402;403;396;399;Wipe Module;0.8800807,0.3459119,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;219;-2928,2560;Inherit;False;1409.389;612.5826;Dielectric Specular Range;6;341;263;262;265;264;278;Dielectric Specular Range;0.9610584,0.681,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;468;-14944,1952;Inherit;False;2285.433;924.9577;Alive Texture Settings;32;432;440;443;441;442;433;434;431;437;438;446;444;436;435;447;445;448;430;439;449;428;450;465;464;422;423;466;467;424;425;427;451;Alive Texture Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;352;-8528,32;Inherit;False;999.647;514.6042;Curvature Set;5;161;150;322;160;163;Curvature Set;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;354;-8528,624;Inherit;False;1008.243;489.3774;AO Set;5;121;327;326;325;324;AO Set;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;518;-14928,656;Inherit;False;1453.789;599.4001;Panner Texture Settings;14;489;506;505;507;510;511;514;512;513;492;515;504;495;516;Panner Texture Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;188;-7153.294,2300.906;Inherit;False;1303.241;778.777;Lambert;8;282;201;281;199;284;198;283;200;Lambert;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;538;-17728,-3200;Inherit;False;1317.03;536.3784;Normals;7;539;545;540;544;543;542;541;Normals;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;546;-8736,2064;Inherit;False;1237.794;528.4418;Dissolve Settings;6;552;551;550;549;548;547;Dissolve Settings;0.8666667,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;576;-7168,688;Inherit;False;2953.854;1284.691;Base Color;22;598;597;596;595;594;593;592;591;590;589;588;587;586;585;584;583;582;581;580;579;578;577;Base Color;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;760;-7168,-3232;Inherit;False;836;242.6667;Alpha Cut Off;4;764;763;762;761;Alpha Cut Off;1,0.9,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;793;-11504,-2864;Inherit;False;1452.494;762.3175;Fresnel Settings;12;805;804;803;802;801;800;799;798;797;796;795;794;Fresnel Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;806;-17728,-1920;Inherit;False;816.4238;534.0689;Normal View Direction;4;807;809;810;811;Normal View Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;880;-13712,-1856;Inherit;False;2356.779;510.4863;Toon Rim;22;902;901;900;899;898;897;896;895;894;893;892;891;890;889;888;887;886;885;884;883;882;881;Toon Rim;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;962;-7168,-2112;Inherit;False;1675.796;646.9077;Specular;16;978;977;976;975;974;973;972;971;970;969;968;967;966;965;964;963;Specular;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;998;-10208,-6144;Inherit;False;2259.557;617.105;Satin;22;1010;1008;1007;1006;1004;1003;1017;1002;1001;1000;999;1020;1019;1018;1016;1015;1014;1013;1012;1011;1009;1005;Satin;1,0.5447499,0.2924527,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1044;-16176,144;Inherit;False;1233.883;500.6666;Flip Book;9;1053;1050;1045;1047;1052;1051;1046;1049;1048;Flip Book;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1054;-17840,1216;Inherit;False;2866.321;909.6188;Making Ripple;22;1061;1074;1073;1072;1071;1070;1069;1068;1067;1066;1065;1064;1063;1062;1060;1059;1058;1057;1056;1055;1075;1076;Making Ripple;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1077;-3568,672;Inherit;False;1132;354.3333;Indirect Light Setting;7;1084;1083;1082;1081;1080;1079;1078;Indirect Light Setting;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1090;-3568,16;Inherit;False;1197.796;524.5961;Light Affect;8;1098;1097;1096;1095;1094;1093;1092;1091;Light Affect;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1108;-5328,2576;Inherit;False;942.5828;567.4904;Outline URP;8;1117;1115;1114;1113;1112;1111;1110;1109;Outline URP;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1124;-16880,-2560;Inherit;False;1628.143;518.2473;Normals with Blue Noise;9;1133;1132;1131;1130;1129;1128;1127;1126;1125;Normals with Blue Noise;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1145;-8816,-2752;Inherit;False;947.6775;925.4706;Ramp Vars;36;1188;1187;1182;1181;1180;1179;1178;1177;1176;1175;1174;1173;1172;1171;1170;1169;1168;1167;1166;1165;1164;1163;1162;1161;1160;1159;1158;1157;1156;1155;1154;1153;1152;1151;1150;1149;Ramp Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1191;-10208,-5440;Inherit;False;1384.937;455.9801;Ramp Setting;8;1199;1198;1197;1195;1194;1193;1192;1196;Ramp Setting;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1200;-7168,-2880;Inherit;False;2206.935;651.8003;Toon Specular;20;1220;1219;1218;1217;1216;1215;1214;1213;1212;1211;1210;1209;1208;1207;1206;1205;1204;1203;1202;1201;Toon Specular;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1221;-3568,1136;Inherit;False;1764.406;786.1082;Colored Ambient;14;1235;1234;1233;1232;1231;1230;1229;1228;1227;1226;1225;1224;1223;1222;Colored Ambient;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1820;-6048,-6096;Inherit;False;2286.079;783.3081;Foilage Wind;26;1857;1854;1851;1850;1849;1847;1846;1845;1842;1841;1840;1839;1838;1837;1836;1835;1834;1833;1832;1831;1830;1829;1828;1827;1826;1825;Foilage Wind;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1821;-6048,-6768;Inherit;False;2976.046;606.0136;Foilage;27;1878;1876;1875;1874;1873;1872;1871;1870;1869;1868;1867;1866;1865;1864;1863;1862;1861;1860;1859;1858;1856;1855;1853;1852;1848;1844;1843;Foilage;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1822;-2624,-7728;Inherit;False;1060;463.6665;Leaf Base Settings;5;1914;1913;1912;1911;1910;Leaf Base Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1823;-6048,-7712;Inherit;False;1636;802.6665;Leaves Rim Settings;18;1900;1899;1898;1897;1896;1895;1894;1893;1892;1891;1890;1889;1888;1887;1886;1885;1884;1883;Leaves Rim Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1824;-2624,-8176;Inherit;False;1012;354.6665;Leaves Specular Settings;5;1909;1908;1907;1906;1905;Leaves Specular Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1915;-13712,-3552;Inherit;False;1340.866;597.2322;Rim Light;13;1928;1927;1926;1925;1924;1923;1922;1921;1920;1919;1918;1917;1916;Rim Light;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1936;-13664,-6224;Inherit;False;2141.228;831.29;Refraction Settings;24;1959;1958;1957;1956;1955;1954;1953;1952;1951;1950;1949;1948;1947;1946;1945;1944;1943;1942;1941;1940;1939;1938;1937;1960;Refraction Settings;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1961;-13680,-5296;Inherit;False;2192.343;842.5844;Reflection Map;26;1977;1979;1981;1983;1984;1985;1988;1972;1975;1980;1987;1982;1978;1976;1974;1973;1971;1970;1969;1968;1967;1966;1965;1964;1963;1962;Reflection Map;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1989;-7904,3920;Inherit;False;1502.392;365.8438;Smoothness Settings;10;1999;1998;1997;1996;1995;1994;1993;1992;1991;1990;Smoothness Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2000;-7904,4368;Inherit;False;1198.667;343.2668;Metallic Settings;6;2006;2005;2004;2003;2002;2001;Metallic Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2007;-7904,4784;Inherit;False;945.1326;426.7336;AO Settings;9;2016;2015;2014;2013;2012;2011;2010;2009;2008;AO Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2143;-10208,-4896;Inherit;False;1300;450.6667;Radial Gradient Settings;11;2154;2153;2152;2151;2150;2149;2148;2147;2146;2145;2144;Radial Gradient Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2155;-10208,-6944;Inherit;False;1364;681.6666;Tiled Voronoi Settings;12;2168;2167;2166;2165;2164;2163;2162;2161;2160;2159;2158;2157;Tiled Voronoi Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2169;-10192,-7776;Inherit;False;1668;706.6666;Texture Map Contro Settings;19;2188;2187;2186;2185;2184;2183;2182;2181;2180;2179;2178;2177;2176;2175;2174;2173;2172;2171;2170;Texture Map Contro Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2189;-10192,-9232;Inherit;False;2445.75;1299.281;Double Texture Map Control Settings;43;2229;2228;2227;2223;2224;2218;2211;2212;2210;2209;2213;2220;2221;2203;2202;2200;2199;2232;2190;2231;2230;2226;2225;2222;2219;2217;2216;2215;2214;2208;2207;2206;2205;2204;2201;2198;2197;2196;2195;2194;2193;2192;2191;Double Texture Map Control Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2235;-18272,4352;Inherit;False;2244;1138.667;Comment;34;2335;2302;2301;2300;2299;2298;2297;2296;2295;2294;2293;2292;2291;2290;2289;2288;2287;2286;2285;2284;2283;2282;2281;2280;2279;2278;2277;2276;2275;2274;2273;2272;2271;2270;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2236;-18288,3104;Inherit;False;2276;1138.667;Comment;32;2336;2333;2332;2331;2330;2329;2328;2327;2326;2325;2324;2323;2322;2321;2320;2319;2318;2317;2316;2315;2314;2313;2312;2311;2310;2309;2308;2307;2306;2305;2304;2303;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;121;-8480,672;Inherit;True;Property;_AmbientOcclusionTexture;Ambient Occlusion Texture;290;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;72;-4288,2880;Inherit;True;Property;_OutlineSize;Outline Size;333;0;Create;True;0;0;0;False;0;False;0;0.03;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;324;-8464,880;Inherit;True;Property;_AOTextureIntensity;AO Texture Intensity;299;0;Create;True;0;0;0;False;0;False;1;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;325;-8144,784;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;326;-7904,784;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;71;-4272,2640;Inherit;False;Property;_OutlineColor;Outline Color;341;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.1006289,0.2430282,0.6037736,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;266;-3728,2720;Inherit;True;Outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;161;-8480,288;Inherit;True;Property;_CurvatureTextureIntensity;Curvature Texture Intensity;306;0;Create;True;0;0;0;False;0;False;1;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;163;-7920,208;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;327;-7728,784;Inherit;True;AO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;150;-8496,80;Inherit;True;Property;_CurvatureTexture;Curvature Texture;325;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;284;-6893.157,2576.791;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;321;-7904,-368;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;199;-6854.401,2829.44;Float;True;Property;_Float11;Float 11;272;0;Create;True;0;0;0;False;0;False;0.2588235;0.4159777;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;160;-8160,208;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;320;-8144,-368;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;323;-7728,-368;Inherit;True;Thickness;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;322;-7744,208;Inherit;True;Curvature;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-17824,2592;Inherit;False;Property;_TimeScale;TimeScale;328;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;487;-17664,2592;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;550;-8416,2112;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-8688,2112;Inherit;False;Property;_DissolveAmtount2;DissolveAmtount;275;0;Create;False;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;552;-7744,2224;Inherit;True;DissolveMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;547;-8224,2112;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.55;False;4;FLOAT;0.55;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;549;-8336,2352;Inherit;True;Property;_DissolveTexture;DissolveTexture;277;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;548;-7984,2224;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;283;-7108.235,2361.374;Inherit;False;Property;_LambertColor;Lambert Color;295;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;200;-6696.689,2346.115;Float;True;Constant;_Float7;Float 7;20;0;Create;True;0;0;0;False;0;False;0.3700322;0;-0.01;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;341;-1744,2784;Inherit;True;DielectricCommon;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;761;-7008,-3184;Inherit;False;Constant;_AlphaCutOff;AlphaCutOff;4;0;Create;True;0;0;0;False;0;False;-1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;762;-6800,-3168;Inherit;False;Property;_AlphaCutOff1;Alpha Cut Off;109;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;763;-7104,-3104;Inherit;False;Property;_AlphaThreshold;Alpha Threshold;83;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;764;-6560,-3168;Inherit;False;AlphaCutOff;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;201;-6402.499,2583.605;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;282;-6076.584,2579.397;Inherit;True;LambertSpecular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;-7117.294,2599.741;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;281;-6653.038,2585.919;Inherit;True;Lambert Light;11;;65;9be9b95d80559e74dac059ac0a4060cf;0;2;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.SamplerNode;165;-8480,-480;Inherit;True;Property;_ThicknessTexture;Thickness Texture;327;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;319;-8480,-288;Inherit;True;Property;_ThicknessTextureIntensity;Thickness Texture Intensity;300;0;Create;True;0;0;0;False;0;False;1;2;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;241;-13392,-2688;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;259;-12304,-2800;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;-12800,-2800;Inherit;True;212;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;242;-13440,-2448;Float;True;Property;_RimOffset;Rim Offset;289;0;Create;True;0;0;0;False;0;False;0.3666016;0.552;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;254;-12576,-2800;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;233;-13680,-2464;Float;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;881;-12880,-1792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;882;-13040,-1792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;883;-13168,-1792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;884;-12704,-1792;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;885;-12640,-1536;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;886;-12912,-1536;Inherit;False;516;WaveTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LightAttenuation;887;-12896,-1440;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;888;-11728,-1792;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;889;-11584,-1792;Inherit;False;Toon Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;890;-11584,-1696;Inherit;False;Toon Rim Alpha;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;891;-11728,-1696;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;892;-11952,-1792;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;893;-12464,-1712;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;894;-12240,-1792;Inherit;False;Property;_ToonRimLightAttenuation;Toon Rim Light Attenuation;163;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;895;-12144,-1680;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;896;-11952,-1648;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;897;-12176,-1552;Inherit;False;Property;_ToonRimColor;Toon Rim Color;156;1;[Gamma];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;898;-12912,-1712;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-13200,-1616;Inherit;False;Property;_ToonRimScale;Toon Rim Scale;154;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;900;-13456,-1616;Inherit;False;809;NormalViewDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;901;-13392,-1792;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;902;-13680,-1792;Inherit;False;Property;_ToonRimOffset;Toon Rim Offset;151;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1048;-16000,192;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1049;-16144,192;Inherit;False;Property;_Tiling;Tiling;194;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1046;-15968,320;Inherit;False;Property;_StartFrameID;Start Frame ID;220;0;Create;True;0;0;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1051;-15936,400;Inherit;False;Property;_Columns;Columns #;200;0;Create;True;0;0;0;False;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1052;-15936,480;Inherit;False;Property;_Rows;Rows #;216;0;Create;True;0;0;0;False;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1047;-15968,560;Inherit;False;Property;_FlipbookSpeed;Flipbook Speed;191;0;Create;True;0;0;0;False;0;False;30;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1045;-15760,272;Inherit;False;Flipbook;-1;;130;53c2488c220f6564ca6c90721ee16673;3,68,0,217,0,244,0;11;51;SAMPLER2D;_Sampler51691;False;167;SAMPLERSTATE;0;False;13;FLOAT2;0,0;False;24;FLOAT;0;False;210;FLOAT;4;False;4;FLOAT;2;False;5;FLOAT;2;False;130;FLOAT;30;False;2;FLOAT;0;False;55;FLOAT;0;False;70;FLOAT;0;False;5;COLOR;53;FLOAT2;0;FLOAT;47;FLOAT;48;INT;218
Node;AmplifyShaderEditor.SamplerNode;1050;-15440,272;Inherit;True;Property;_FlipbookTexture;Flipbook Texture;226;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1053;-15152,272;Inherit;False;Flipbook;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1078;-3552,800;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;1079;-3344,800;Inherit;True;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1080;-3376,720;Inherit;False;Constant;_IndirectLightIntensity;Indirect Light Intensity;19;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1081;-3088,800;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1083;-2880,800;Inherit;False;Property;_ToggleSwitch0;Toggle Switch0;174;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1084;-2672,800;Inherit;False;Indirect Light;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1082;-3072,720;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1091;-3520,256;Inherit;True;516;WaveTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1092;-3552,448;Inherit;False;Property;_LightAffectIntensity;Light Affect Intensity;181;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1093;-3248,160;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1094;-3040,160;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;1095;-3536,64;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1096;-3056,80;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1097;-2864,160;Inherit;False;Property;_LightAffectToggle;Light Affect Toggle;179;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1098;-2624,160;Float;True;LightColor_LightDir;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;168;-4112,3680;Inherit;True;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;170;-4144,3888;Float;True;Property;_OutlineWidth;Outline Width;292;0;Create;True;0;0;0;False;0;False;0.02;0.389;0.02;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;169;-4080,4112;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;171;-4080,3488;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;-3840,3664;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.3382353,0.3382353,0.3382353;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;172;-3840,3872;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OutlineNode;174;-3600,3792;Inherit;False;0;True;None;0;0;Front;True;True;True;True;0;False;;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;167;-4368,3680;Float;False;Property;_OutlineTint;Outline Tint;291;0;Create;True;0;0;0;False;0;False;0.5294118,0.5294118,0.5294118,0;0,0.3679245,0.1281453,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OutlineNode;70;-3968,2720;Inherit;False;0;False;None;1;6;Front;True;True;True;True;0;False;;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1109;-5296,2864;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;1110;-5120,2864;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1111;-5184,2784;Inherit;False;Property;_OutlineWidth1;Outline Width;41;0;Create;True;0;0;0;False;0;False;0;0.005;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;1112;-5088,2624;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1113;-5184,3040;Inherit;False;Property;_DistanceCutoff;Distance Cutoff;120;0;Create;True;0;0;0;False;0;False;0;20;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;1114;-4880,2960;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1115;-4752,2784;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1117;-4608,2784;Inherit;False;Outline URP;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1149;-8768,-2368;Inherit;False;Property;_CKey1;CKey1;209;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1150;-8768,-2192;Inherit;False;Property;_CKey2;CKey2;212;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1151;-8768,-2016;Inherit;False;Property;_CKey3;CKey3;214;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1152;-8560,-2368;Inherit;False;Property;_CKey5;CKey5;218;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1153;-8560,-2192;Inherit;False;Property;_CKey6;CKey6;219;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1154;-8560,-2016;Inherit;False;Property;_CKey7;CKey7;222;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;1155;-8752,-2624;Inherit;False;Property;_GradALength;GradALength;185;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1156;-8352,-2464;Inherit;False;Property;_AKey1;AKey1;202;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1157;-8352,-2384;Inherit;False;Property;_AKey2;AKey2;198;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1158;-8352,-2304;Inherit;False;Property;_AKey3;AKey3;196;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1159;-8352,-2224;Inherit;False;Property;_AKey4;AKey4;193;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1160;-8352,-2144;Inherit;False;Property;_AKey5;AKey5;190;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;-8352,-2064;Inherit;False;Property;_AKey6;AKey6;189;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1162;-8352,-1984;Inherit;False;Property;_AKey7;AKey7;188;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1163;-8192,-2464;Inherit;False;Property;_CTime1;CTime1;237;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1164;-8192,-2384;Inherit;False;Property;_CTime2;CTime2;235;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1165;-8192,-2304;Inherit;False;Property;_CTime3;CTime3;240;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1166;-8192,-2224;Inherit;False;Property;_CTime4;CTime4;231;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1167;-8192,-2144;Inherit;False;Property;_CTime5;CTime5;229;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1168;-8192,-2064;Inherit;False;Property;_CTime6;CTime6;227;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1169;-8192,-1984;Inherit;False;Property;_CTime7;CTime7;238;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1170;-8032,-2464;Inherit;False;Property;_ATime1;ATime1;244;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1171;-8032,-2384;Inherit;False;Property;_ATime2;ATime2;246;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1172;-8032,-2304;Inherit;False;Property;_ATime3;ATime3;247;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1173;-8032,-2224;Inherit;False;Property;_ATime4;ATime4;252;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1174;-8032,-2144;Inherit;False;Property;_ATime5;ATime5;253;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1175;-8032,-2064;Inherit;False;Property;_ATime6;ATime6;254;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1176;-8032,-1984;Inherit;False;Property;_ATime7;ATime7;256;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1177;-8560,-2544;Inherit;False;Property;_CKey4;CKey4;215;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;1178;-8752,-2704;Inherit;False;Property;_GradCLength;GradCLength;184;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1180;-8192,-2544;Inherit;False;Property;_CTime0;CTime0;233;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1181;-8032,-2544;Inherit;False;Property;_ATime0;ATime0;242;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1182;-8768,-2544;Inherit;False;Property;_CKey0;CKey0;207;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;1188;-8544,-2624;Inherit;False;Property;_CustomRamp;CustomRamp;259;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1201;-7136,-2752;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;1202;-7104,-2640;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1203;-6864,-2720;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1204;-6784,-2416;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0.5;False;4;FLOAT;200;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1205;-6752,-2720;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1206;-6592,-2720;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1207;-6048,-2720;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;1208;-5968,-2816;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1209;-5760,-2816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1210;-5760,-2560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1211;-5600,-2720;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1212;-6288,-2640;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.2;False;4;FLOAT;0.495;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1213;-6288,-2464;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.505;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1214;-6032,-2464;Inherit;False;Property;_ToonSpecIntensity;Toon Spec Intensity;139;0;Create;True;0;0;0;False;0;False;1;0.458;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1215;-6592,-2544;Inherit;False;Property;_ToonSpecMin;Toon Spec Min;142;0;Create;True;0;0;0;False;0;False;0;0.368;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1216;-6592,-2464;Inherit;False;Property;_ToonSpecMax;Toon Spec Max;146;0;Create;True;0;0;0;False;0;False;1;0.447;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1217;-7056,-2416;Inherit;False;Property;_ToonSpecArea;Toon Spec Area;148;0;Create;True;0;0;0;False;0;False;3;1.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1218;-5200,-2720;Inherit;False;Spec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1219;-5440,-2720;Inherit;False;Property;_ToggleSwitch1;Toggle Switch0;223;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1220;-5632,-2432;Inherit;False;1184;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1222;-3552,1184;Inherit;True;516;WaveTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1223;-3312,1184;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1224;-3424,1488;Inherit;False;Property;_AmbientClampMax;Ambient Clamp Max;224;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1225;-3424,1408;Inherit;False;Property;_AmbientClampMin;Ambient Clamp Min;225;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1226;-3120,1184;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1227;-2848,1184;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1228;-2032,1184;Inherit;True;Toon Ambient;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1229;-2304,1184;Inherit;False;Property;_ColoredAmbientToggle;ColoredAmbientToggle;221;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1230;-2480,1312;Inherit;False;1184;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1231;-2688,1184;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1232;-2896,1616;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1233;-3264,1728;Inherit;True;-1;;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;1234;-3056,1728;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.2;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1235;-3152,1552;Inherit;False;Property;_AmbientColor;Ambient Color;54;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.3215685,0.2135645,0.1568627,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;265;-2080,2784;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;262;-2912,2816;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-2464,2608;Float;True;Constant;_Constant_1;Constant_1;20;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;264;-2464,2896;Float;True;Property;_IndirectDiffuseContribution;Indirect Diffuse Contribution;264;0;Create;True;0;0;0;False;0;False;1.28;0.692;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;278;-2688,2816;Inherit;True;Dielectric Specular;249;;138;cf90616a2350c5c4cba1069366c98fa1;1,1,0;2;2;FLOAT;0;False;9;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;182;-5264,-9808;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;190;-4640,-9824;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;184;-5264,-10016;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;177;-4976,-10160;Inherit;True;Property;_TextureSample4;Texture Sample 4;342;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;179;-5520,-10016;Inherit;True;Blinn-Phong Half Vector;-1;;139;91a149ac9d615be429126c95e20753ce;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;185;-4928,-9952;Float;True;Property;_StaticHighLights;Static HighLights;278;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;176;-4896,-10352;Float;False;Property;_Color2;Color 2;268;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,0.6760468,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-4640,-10256;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;186;-4016,-9632;Float;True;Property;_Float9;Float 9;271;0;Create;True;0;0;0;False;0;False;0.4619471;0.163;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-3712,-9760;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;187;-3920,-9856;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;193;-3504,-9760;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-4944,-9728;Float;True;Property;_Float12;Float 12;270;0;Create;True;0;0;0;False;0;False;-0.5;-0.625;-1;-0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;-5488,-9808;Inherit;True;212;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;196;-3280,-9776;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;194;-3568,-10336;Float;True;HighlightColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;339;-3360,-10080;Inherit;True;282;LambertSpecular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;191;-3856,-10320;Inherit;True;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;344;-2704,-10224;Inherit;True;nedir;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;-3008,-10208;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;202;-3856,-10112;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;2.14;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;183;-4384,-10192;Inherit;True;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;475;-16784,2432;Inherit;True;Property;_WarningSpeed;Warning Speed;303;1;[Header];Create;True;0;0;0;False;0;False;10;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;476;-16832,2240;Inherit;True;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;478;-16592,2320;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;483;-16480,2592;Inherit;False;Property;_WarningMin;Warning Min;304;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;477;-16368,2320;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;479;-16176,2320;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;486;-15872,2416;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;480;-15648,2320;Inherit;True;Warning;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1187;-8528,-2704;Inherit;False;Property;_GradMode;GradMode;258;2;[HideInInspector];[Enum];Create;True;0;3;Blend Classic;0;Fixed;1;Blend Perceptual;2;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1179;-8352,-2544;Inherit;False;Property;_AKey0;AKey0;205;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1905;-2576,-8128;Inherit;True;Property;_LeavesSpecTexture;Leaves Spec Texture;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1906;-2336,-7936;Inherit;False;Property;_LeavesSpecIntensity;Leaves Spec Intensity;28;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1907;-2272,-8128;Inherit;False;Property;_LeavesSpecColor;Leaves Spec Color;8;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1908;-2016,-8000;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1910;-2048,-7616;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.693,0.693,0.693,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1911;-2272,-7520;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1912;-2512,-7680;Inherit;False;Property;_LeavesColor;Leaves Color;6;0;Create;True;0;0;0;False;0;False;0.3193329,0.4654087,0.1653811,1;0.3193329,0.4654087,0.1653811,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1913;-2576,-7504;Inherit;True;Property;_LeavesTexture;Leaves Texture;62;0;Create;True;0;0;0;False;0;False;-1;None;607961a1ca5e345479b3fa76c399d67f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1883;-4800,-7520;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1885;-5920,-7488;Inherit;False;Property;_LeavesRimBias;Leaves Rim Bias;110;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1886;-5920,-7408;Inherit;False;Property;_LeavesRimScale;Leaves Rim Scale;121;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1887;-5920,-7328;Inherit;False;Property;_LeavesRimPower;Leaves Rim Power;113;0;Create;True;0;0;0;False;0;False;3;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;1888;-5616,-7472;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1889;-4992,-7472;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1890;-5216,-7472;Inherit;False;Property;_FresnelInvert1;Fresnel Invert;115;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1891;-5360,-7392;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;1892;-5728,-7248;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;1893;-5520,-7248;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TFHCRemapNode;1894;-5408,-7248;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1895;-5424,-7024;Inherit;False;Property;_LeavesRimYPosition;Leaves Rim Y Position;104;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;1896;-5904,-7248;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1897;-6000,-7104;Inherit;False;Property;_LeavesRimYContrast;Leaves Rim Y Contrast;132;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1898;-4992,-7248;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1899;-5136,-7248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1900;-5088,-7664;Inherit;False;Property;_LeavesRimColor;Leaves Rim Color;102;0;Create;True;0;0;0;False;0;False;0.3124955,0.4842767,0.2695502,1;0.3124955,0.4842767,0.2695502,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;257;-12592,-2592;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;245;-13152,-2608;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;255;-12560,-2368;Float;False;Property;_Color3;Color 3;285;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;222;-11984,-2672;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;249;-12928,-2608;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;260;-12320,-2160;Inherit;True;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;343;-11744,-2672;Inherit;True;RimLight_Old;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;258;-12304,-2368;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;261;-12304,-2576;Inherit;True;194;HighlightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;251;-12768,-2592;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;253;-12864,-2368;Float;True;Property;_Float10;Float 10;286;0;Create;True;0;0;0;False;0;False;1;0.555;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1877;-1120,-6928;Inherit;False;Property;_ClipThreshold;Clip Threshold;95;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1879;-832,-6928;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1825;-6016,-5520;Inherit;False;Property;_WindSpeed;Wind Speed;161;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1826;-5696,-5520;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1827;-5648,-5408;Inherit;False;Property;_WindNormalize;Wind Normalize;155;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1828;-5552,-5536;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;1829;-5552,-5712;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1830;-5344,-5648;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;1831;-5552,-5856;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1832;-5184,-6000;Inherit;False;Property;_WNoiseAX;WNoiseAX;158;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1833;-5184,-5920;Inherit;False;Property;_WNoiseAY;WNoiseAY;164;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1834;-5152,-5520;Inherit;False;Property;_WNoiseBX;WNoiseBX;168;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1835;-5152,-5440;Inherit;False;Property;_WNoiseBY;WNoiseBY;165;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1836;-5200,-5744;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1837;-5056,-5840;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1838;-5024,-5984;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1839;-5056,-5664;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1840;-4992,-5504;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;1841;-4832,-5840;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;1842;-4832,-5648;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1843;-6016,-6496;Inherit;False;Property;_CardRotate;CardRotate;134;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.BitangentVertexDataNode;1844;-5952,-6416;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;1845;-4656,-5856;Inherit;True;Property;_Noise;Noise;150;0;Create;True;0;0;0;False;0;False;-1;None;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1846;-4640,-5952;Inherit;False;Property;_WindIntensity;Wind Intensity;138;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1847;-4656,-5664;Inherit;True;Property;_Noise1;Noise;152;0;Create;True;0;0;0;False;0;False;-1;None;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1848;-5728,-6432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1849;-4640,-6032;Inherit;False;Property;_WindMultiplier;Wind Multiplier;145;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1850;-4320,-5952;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1851;-4352,-5776;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1852;-5808,-6704;Inherit;True;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;1853;-5584,-6512;Inherit;False;Property;_RandomRotate;RandomRotate;173;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1854;-4128,-6000;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1855;-5584,-6704;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;-1,-1;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1856;-5376,-6528;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;1858;-5232,-6704;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1859;-5056,-6704;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1860;-5152,-6544;Inherit;False;1857;FoilageWind;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1861;-4912,-6592;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewMatrixNode;1862;-4592,-6592;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1863;-4704,-6704;Inherit;False;Property;_WindToggle;WindToggle;143;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1864;-4480,-6704;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;1865;-4448,-6592;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1866;-4224,-6704;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1867;-4240,-6352;Inherit;False;Property;_Inflate;Inflate;133;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1868;-4080,-6704;Inherit;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1869;-4080,-6608;Inherit;False;Property;_CardSize;CardSize;129;1;[Gamma];Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1870;-4096,-6352;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;1871;-4096,-6496;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1872;-3920,-6704;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1873;-3904,-6496;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1874;-3728,-6704;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1875;-3824,-6368;Inherit;False;Property;_EffectBlend;EffectBlend;0;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1876;-3536,-6704;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1914;-1808,-7616;Inherit;False;LeavesAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1909;-1856,-8000;Inherit;False;LeavesSpecular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1857;-3984,-6000;Inherit;False;FoilageWind;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1878;-3296,-6704;Inherit;False;Foilage;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1884;-4656,-7520;Inherit;False;LeavesRim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1881;-800,-6672;Inherit;False;1878;Foilage;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1880;-1232,-7152;Inherit;True;Property;_Leaves03;Leaves-03;27;0;Create;True;0;0;0;False;0;False;-1;None;51e09588f629f7746b24e937dd9b1a40;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1917;-13680,-3040;Inherit;False;Property;_RimPower;Rim Power;21;0;Create;True;0;0;0;False;0;False;3;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1918;-13680,-3136;Inherit;False;Property;_RimScale;Rim Scale;9;0;Create;True;0;0;0;False;0;False;2;1.03;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1920;-13680,-3424;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;1921;-13376,-3456;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1922;-13296,-3232;Inherit;False;Property;_RimColor;Rim Color;5;1;[Header];Create;True;1;Rim Light Settings;0;0;False;0;False;0.5,0.5,0.5,0;0.5,0.3316326,0.225,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1923;-13072,-3456;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1924;-13040,-3216;Inherit;True;Property;_RimSwitch;RimSwitch;23;1;[Enum];Create;True;0;2;Rim On;1;Rim Off;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1925;-12832,-3456;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1926;-12624,-3456;Inherit;False;RimSetUp;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1927;-12624,-3216;Inherit;False;RimSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1928;-12624,-3328;Inherit;False;Fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1919;-13680,-3216;Inherit;False;Property;_RimBias;Rim Bias;7;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;963;-7136,-1984;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;964;-7104,-1872;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;967;-6592,-1952;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;968;-6592,-1776;Inherit;False;Property;_SpecSmoothMin;Spec Smooth Min;167;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;969;-6592,-1696;Inherit;False;Property;_SpecSmoothMax;Spec Smooth Max;206;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;970;-6752,-1952;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;971;-6304,-1952;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;972;-6224,-2048;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;973;-6016,-2048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;974;-6288,-1696;Inherit;False;Property;_SpecIntensity;Spec Intensity;170;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;975;-6016,-1792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;976;-5856,-1952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;977;-5712,-1952;Inherit;False;Spec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;978;-7056,-1648;Inherit;False;Property;_SpecSmoothing;Spec Smoothing;230;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;966;-6784,-1648;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0.5;False;4;FLOAT;200;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;147;-6272,-992;Inherit;False;Property;_SpecularOut;Specular Out;266;0;Create;True;0;0;0;False;0;False;1;0.1;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;106;-6864,-1232;Inherit;True;Blinn-Phong Light;123;;144;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.OneMinusNode;108;-6496,-1248;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosterizeNode;115;-5600,-1232;Inherit;True;52;2;1;COLOR;0,0,0,0;False;0;INT;52;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;376;-4544,-1120;Inherit;True;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-5392,-1008;Inherit;False;Property;_SpecularIntensity;Specular Intensity;296;0;Create;True;0;0;0;False;0;False;1;0.4472353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-5392,-896;Inherit;False;Property;_SpecularAmbient;Specular Ambient;297;0;Create;True;0;0;0;False;0;False;0;0.3364706;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;143;-5024,-1248;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.347,0.347,0.347,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;110;-5312,-1248;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;109;-5936,-1232;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.092,0.092,0.092,1;False;3;COLOR;0,0,0,0;False;4;COLOR;0.795,0.795,0.795,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-5904,-976;Inherit;False;Property;_SpecularPosterize;Specular Posterize;293;0;Create;True;0;0;0;False;0;False;1;1;1;250;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;375;-4752,-1120;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;336;-7120,-1312;Inherit;True;212;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;148;-6272,-880;Inherit;False;Property;_SpecularIn;Specular In;294;0;Create;True;0;0;0;False;0;False;1;2;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;365;-7120,-1104;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;369;-5008,-976;Inherit;False;Property;_SpecColor;Spec Color;301;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;117;-6576,-992;Inherit;False;Property;_Glossy;Glossy;288;0;Create;True;0;0;0;False;0;False;1;25;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;965;-6864,-1952;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;107;-6272,-1248;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;2.86;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;1937;-13616,-5920;Inherit;False;150;100;New Note;;1,1,1,1;New Min Kırılma indisi. Bunu remapla düzenle$;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1938;-11920,-5872;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GrabScreenPosition;1939;-13440,-5680;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;1940;-13200,-5680;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1941;-13024,-5616;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1942;-12880,-5808;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1944;-12816,-5584;Inherit;False;Property;_ScreenContrast;ScreenContrast;47;0;Create;True;0;0;0;False;0;False;1;0;1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;1945;-12480,-5776;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1946;-12512,-5648;Inherit;False;Property;_TransparentIntensity;Transparent Intensity;14;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1947;-13424,-5984;Inherit;False;Property;_OldMin;Old Min;17;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1948;-13424,-5776;Inherit;False;Property;_NewMax;New Max;26;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1949;-13424,-5840;Inherit;False;Property;_NewMin;New Min;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1950;-13424,-5920;Inherit;False;Property;_OldMax;Old Max;18;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1951;-13168,-6000;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.9;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1952;-13264,-5504;Inherit;False;543;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1953;-13424,-6096;Inherit;False;1928;Fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1954;-12880,-6160;Inherit;False;Property;_FresnelColor;Fresnel Color;137;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1955;-12816,-5984;Inherit;False;1928;Fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1956;-12624,-6048;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1957;-12512,-6048;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1958;-12576,-6176;Inherit;False;1148;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1959;-12368,-6128;Inherit;False;Property;_InteriorFresnel;InteriorFresnel;140;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1960;-11760,-5872;Inherit;False;RefractionRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;2008;-7600,4832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2009;-7744,4912;Inherit;True;Property;_AmbientOcclusionMap;Ambient Occlusion Map;90;0;Create;True;0;0;0;False;0;False;-1;ac405faab9f7cf14d80b3fe024979b8c;ac405faab9f7cf14d80b3fe024979b8c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;2010;-7424,4912;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2011;-7808,5120;Inherit;False;-1;;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.OneMinusNode;2012;-7616,5120;Inherit;False;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;2013;-7888,4832;Inherit;False;Property;_AOIntensity;AOIntensity;84;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2014;-7296,4912;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2015;-7168,4912;Inherit;False;AOResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2016;-7168,5040;Inherit;False;AbsoluteAO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2001;-7120,4416;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2002;-7424,4416;Inherit;False;Property;_Metallic1;Metallic;67;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2003;-7856,4496;Inherit;True;Property;_MetallicMap1;Metallic Map;87;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;2004;-7552,4560;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;2005;-7376,4496;Inherit;False;Property;_MetallicInvert1;Metallic Invert;100;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2006;-6944,4416;Inherit;False;MetallicResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1990;-7888,4032;Inherit;True;Property;_RougnessMap;Rougness Map;117;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;1991;-7600,4112;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1992;-7456,4048;Inherit;False;Property;_SmoothnessInvert;Smoothness Invert;106;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1993;-7216,4000;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1994;-6688,4032;Inherit;False;SmoothnessResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1995;-7056,4032;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1996;-6896,4032;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1997;-7664,3968;Inherit;False;Property;_Smoothness1;Smoothness;96;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1998;-7392,3968;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1999;-7280,4160;Inherit;False;-1;;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1902;-1024,-7200;Inherit;False;Property;_Smoothness;Smoothness;34;0;Create;True;0;0;0;False;0;False;0.5;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1904;-752,-7472;Inherit;False;1914;LeavesAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1901;-944,-7360;Inherit;False;1884;LeavesRim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1903;-976,-7280;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1882;-368,-7040;Inherit;False;1020;Satin;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2017;-384,-7296;Inherit;False;Constant;_Color4;Color 4;254;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2018;-352.996,-6924.013;Inherit;False;Constant;_Float15;Float 15;254;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;601;-10864,-1648;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;603;-11264,-1616;Inherit;False;Property;_FresnelBias;Fresnel Bias;343;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;605;-11264,-1440;Inherit;False;Property;_FresnelPower;Fresnel Power;345;0;Create;True;0;0;0;False;0;False;1;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;604;-11264,-1536;Inherit;False;Property;_FresnelScale;Fresnel Scale;344;0;Create;True;0;0;0;False;0;False;1;2;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;607;-11168,-1776;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;600;-10608,-1648;Inherit;True;Fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;602;-11216,-1968;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;2;-7024,-144;Inherit;False;Property;_BaseColor;Base Color;1;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;90;-7104,48;Inherit;True;Property;_BaseMap;Base Map;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-6784,-64;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;371;-6544,-64;Inherit;True;MainDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;579;-6752,784;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;580;-6480,784;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;581;-6448,1248;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;584;-6272,1248;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;585;-6256,784;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;586;-5984,784;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;587;-5776,1168;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;590;-5216,1184;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;-0.66;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;591;-5248,1424;Inherit;False;Property;_ToonShade1;Toon Shade;241;0;Create;True;0;0;0;False;0;False;1;1;1;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;592;-4960,1008;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.PosterizeNode;593;-4944,1248;Inherit;True;1;2;1;COLOR;0,0,0,0;False;0;INT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-4656,1136;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;597;-6320,1712;Inherit;False;Property;_ShadeColor;Shade Color;239;1;[Header];Create;True;1;Shade Settings;0;0;False;0;False;0.35,0.35,0.35,1;0.6313726,0.227451,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;598;-5616,1408;Inherit;False;Property;_ToonContrast;Toon Contrast;243;0;Create;True;0;0;0;False;0;False;1;1;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;595;-4432,1136;Float;True;BaseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;577;-7136,976;Float;True;Property;_BaseCellOffset;Base Cell Offset;248;0;Create;True;0;0;0;False;0;False;0;-0.151;-0.4;0.4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;588;-6032,1360;Inherit;True;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;589;-5520,1184;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;578;-6816,1024;Float;True;Property;_BaseCellSharpness;Base Cell Sharpness;245;0;Create;True;0;0;0;False;0;False;1;1;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;583;-6384,1488;Float;True;Property;_ShadingContribution;Shading Contribution;255;0;Create;True;0;0;0;False;0;False;0.7;1.29;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;596;-7072,768;Inherit;True;212;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;582;-6288,1008;Inherit;True;371;MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;1005;-9568,-5840;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1009;-8928,-5840;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;-0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1011;-8944,-6080;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1012;-8736,-6080;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1013;-8544,-5840;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;1014;-9184,-5904;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1015;-9408,-6080;Inherit;False;Property;_SatinLightShade;Satin Light Shade;183;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1016;-9120,-6080;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1018;-8560,-6016;Inherit;False;Property;_SatinColor;Satin Color;217;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1019;-8320,-5840;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;999;-9856,-6000;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1002;-9712,-5936;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1017;-10112,-6080;Inherit;False;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;1003;-9776,-5712;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1006;-9568,-5712;Inherit;False;Property;_SatinContrast;Satin Contrast;176;0;Create;True;0;0;0;False;0;False;1;2;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1007;-9296,-5712;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1008;-9104,-5712;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1010;-8864,-5712;Inherit;False;Property;_SatinIntensity;Satin Intensity;178;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;1000;-10176,-5920;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;1004;-10048,-5712;Inherit;False;Property;_SatinSmoothing;Satin Smoothing;182;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1020;-8160,-5840;Inherit;True;Satin;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1001;-10112,-5808;Inherit;False;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;2023;-17424,368;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;2019;-17488,192;Inherit;False;Property;_UV1TilingXYScaleZW;UV1 Tiling (XY) Scale (ZW);337;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;2022;-17680,368;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TimeNode;2024;-17712,528;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2028;-17408,688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2026;-17408,576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2025;-17408,464;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;2027;-17776,688;Inherit;False;Property;_AnimateUV1XYUV2ZW;Animate UV1 (XY) UV2 (ZW);340;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2031;-17232,752;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2030;-17232,512;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2034;-17008,512;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2035;-17008,752;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2039;-16640,512;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2038;-16832,512;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2040;-16832,752;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2041;-16640,752;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2043;-16448,512;Inherit;False;AnimUV1;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2044;-16448,752;Inherit;False;AnimUV2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2033;-17024,256;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2032;-16816,336;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;794;-11456,-2560;Inherit;True;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;796;-11456,-2352;Inherit;False;Property;_FBias;FBias;180;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;797;-11456,-2272;Inherit;False;Property;_FScale;FScale;228;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;798;-11456,-2192;Inherit;False;Property;_FPower;FPower;232;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;799;-11136,-2592;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;800;-10624,-2480;Inherit;True;Property;_FSwitch;FSwitch;234;1;[Enum];Create;True;0;2;Rim On;1;Rim Off;0;0;True;0;False;0;1;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;801;-10672,-2592;Inherit;False;Property;_FresnelInvert;Fresnel Invert;236;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;802;-10432,-2592;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;803;-10288,-2592;Inherit;True;FresnelResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;805;-10848,-2512;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;795;-11456,-2784;Inherit;True;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;804;-10288,-2368;Inherit;True;FresnelSwitch;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.StickyNoteNode;2046;-720,-4720;Inherit;False;852.0001;339.3336;Blending Ops;Blending Ops;1,1,1,1;			Src				Dst$Alpha Blend = 	Src Alpha			One Minus Src Alpha$Premultiplied =	One				One Minus Src Alpha$Additive =		One				One$Soft Additive =	One Minus Dst Color	One$Multiplicative =	Dst Color			Zero$2x Multiplicative =	Dst Color			Src Color$Particle Additive = 	Src Alpha			One$$$$;0;0
Node;AmplifyShaderEditor.FunctionNode;2138;-1891.734,-4834.52;Inherit;True;SRP Additional Light;-1;;153;6c86746ad131a0a408ca599df5f40861;8,212,0,6,2,9,0,23,0,24,0,142,0,168,0,154,0;6;2;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;15;FLOAT3;0,0,0;False;14;FLOAT3;1,1,1;False;18;FLOAT;0.5;False;32;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;2139;-2131.734,-5026.52;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;2140;-2115.734,-4834.52;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2141;-2083.734,-4674.52;Inherit;False;Constant;_Float16;Float 0;87;0;Create;True;0;0;0;False;0;False;50;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;437;-14560,2256;Inherit;False;Property;_ASpeedX;A Speed X;313;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;401;-14592,1712;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;435;-14736,2032;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;441;-14896,2544;Inherit;False;Property;_BTileY;B Tile Y;318;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;442;-14896,2464;Inherit;False;Property;_BTileX;B Tile X;317;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;444;-14736,2672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;438;-14544,2352;Inherit;False;Property;_ASpeedY;A Speed Y;314;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;440;-14896,2720;Inherit;False;Property;_BOffsetY;B Offset Y;320;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-14896,2000;Inherit;False;Property;_ATileX;A Tile X;309;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;407;-13600,1488;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;10;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;447;-14560,2768;Inherit;False;Property;_BSpeedY;B Speed Y;322;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;433;-14896,2208;Inherit;False;Property;_AOffsetX;A Offset X;311;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;434;-14896,2288;Inherit;False;Property;_AOffsetY;A Offset Y;312;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;445;-14736,2480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;432;-14896,2080;Inherit;False;Property;_ATileY;A Tile Y;310;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;439;-14400,2272;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;423;-14000,2464;Inherit;True;Property;_AliveTextureB;Alive Texture B;316;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;466;-13616,2160;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;425;-13296,2464;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;395;-14768,1712;Inherit;False;Constant;_Float3;Float 3;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;467;-13632,2560;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;464;-13920,2064;Inherit;False;Property;_AliveAColor;Alive A Color;307;1;[Header];Create;True;1;Alive A;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;427;-13120,2368;Inherit;False;Property;_Multiplied;Multiplied;323;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;465;-13904,2656;Inherit;False;Property;_AliveBColor;Alive B Color;315;1;[Header];Create;True;1;Alive B;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;410;-12912,1488;Inherit;True;Wipe;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;428;-14240,2112;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode;408;-13360,1488;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0.2,0.2,0.2,0;False;2;COLOR;0.8,0.8,0.8,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;436;-14736,2240;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;446;-14560,2688;Inherit;False;Property;_BSpeedX;B Speed X;321;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-12880,2368;Inherit;True;AliveTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;500;-17136,2592;Inherit;True;SinTime;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;424;-13296,2304;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;519;-13728,144;Inherit;True;Wavy;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;430;-14512,2112;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;422;-14000,2240;Inherit;True;Property;_AliveTextureA;Alive Texture A;308;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;448;-14400,2688;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;450;-14240,2528;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;443;-14896,2640;Inherit;False;Property;_BOffsetX;B Offset X;319;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;488;-17488,2592;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;496;-14272,80;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;497;-14352,336;Inherit;True;Property;_AffectGradient;Affect Gradient;281;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;499;-14736,-32;Inherit;False;Constant;_Divider;Divider;34;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;490;-14864,-112;Inherit;False;Property;_WaveIntensity;WaveIntensity;283;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;494;-14576,-80;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;503;-14864,112;Inherit;True;500;SinTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;493;-14624,112;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;517;-14656,320;Inherit;True;516;WaveTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;491;-17312,2592;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;498;-14000,144;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;507;-14880,704;Inherit;False;Property;_WaveTileX;Wave Tile X;330;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;449;-14512,2528;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;409;-13088,1504;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-14880,1424;Inherit;False;Property;_WipeMultiply;Wipe Multiply;280;1;[IntRange];Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;398;-14880,1616;Inherit;False;Property;_WipeReveal;WipeReveal;282;0;Create;True;0;0;0;False;0;False;0;0.331;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;400;-14576,1616;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;405;-13920,1488;Inherit;True;Property;_WipeGradient;Wipe Gradient;274;2;[Header];[NoScaleOffset];Create;True;1;Wipe;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;406;-13888,1696;Inherit;False;Property;_WipeContrast;Wipe Contrast;279;0;Create;True;0;0;0;False;0;False;10;15;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;404;-14160,1488;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;402;-14416,1600;Inherit;False;Property;_Horizontal;Horizontal;276;0;Create;True;0;0;0;False;1;hv;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;403;-14352,1488;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;396;-14752,1520;Inherit;False;Constant;_Float2;Float 2;20;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;399;-14544,1424;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;516;-13696,896;Inherit;True;WaveTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1055;-17568,1840;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;5,5;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1056;-17360,1840;Inherit;True;Property;_TextureSample0;Texture Sample 0;186;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;1057;-16208,1616;Inherit;False;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0.05,0.05;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1058;-16368,1552;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1062;-16944,2000;Inherit;False;Property;_Step;Step;210;0;Create;True;0;0;0;False;0;False;0.6;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1063;-17744,1856;Inherit;False;Property;_Float13;Float 0;187;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;1064;-17776,1968;Inherit;False;Property;_Vector0;Vector 0;213;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1065;-16864,1264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1066;-17152,1520;Inherit;False;Property;_RippleSpeed;Ripple Speed;197;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1067;-16912,1408;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1068;-16624,1328;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;1072;-17216,1616;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;1073;-16640,1616;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1061;-16368,1888;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1075;-15744,1952;Inherit;False;Property;_RippleStrength;Ripple Strength;336;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1076;-15440,1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-14592,1056;Inherit;False;Property;_WaveSpeedX;Wave Speed X;324;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;489;-14496,896;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;505;-14592,1136;Inherit;False;Property;_WaveSpeedY;Wave Speed Y;326;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;510;-14880,784;Inherit;False;Property;_WaveTileY;Wave Tile Y;331;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;511;-14688,720;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;514;-14672,912;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;512;-14880,880;Inherit;False;Property;_WaveOffsetX;Wave Offset X;329;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;513;-14864,976;Inherit;False;Property;_WaveOffsetY;Wave Offset Y;332;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;492;-14240,896;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,-3;False;1;FLOAT;0.2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;515;-14416,768;Inherit;False;Constant;_Float4;Float 4;89;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;506;-14416,1072;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;484;-16496,2688;Inherit;False;Property;_WarningMax;Warning Max;305;0;Create;True;0;0;0;False;0;False;1;1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;485;-16128,2560;Inherit;False;Property;_WarningColor;Warning Color;302;1;[Header];Create;True;1;Warning;0;0;False;0;False;1,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1069;-17136,1264;Inherit;False;Property;_RippleCycle;Ripple Cycle;204;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1070;-16352,1744;Inherit;False;Property;_Float14;Float 2;203;0;Create;True;0;0;0;False;0;False;1.687938;2;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1071;-15968,1536;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1074;-15264,1824;Inherit;False;Ripple;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1059;-15616,1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;1060;-16608,1888;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;495;-14032,896;Inherit;True;Property;_WaveTexture;Wave Texture;284;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2029;-17408,800;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;2021;-17488,912;Inherit;False;Property;_UV2TilingXYScaleZW;UV2 Tiling (XY) Scale (ZW);339;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2036;-17024,896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2037;-16832,960;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1196;-9056,-5216;Inherit;False;RampResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1193;-10176,-5376;Inherit;False;Property;_RampControl;Ramp Control;112;0;Create;True;0;0;0;False;0;False;1;0.381;0.0001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1194;-10176,-5296;Inherit;False;Property;_RampOffset;Ramp Offset;118;0;Create;True;0;0;0;False;0;False;0.5;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1195;-9856,-5216;Inherit;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1197;-9296,-5216;Inherit;False;Property;_Ramp;Ramp;160;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1198;-9616,-5216;Inherit;True;Property;_RampTexture;Ramp Texture;103;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1199;-9520,-5312;Inherit;False;1148;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1192;-10144,-5216;Inherit;True;516;WaveTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1930;-9120,-2080;Inherit;False;Property;_Scattering;Scattering;76;0;Create;True;0;0;0;True;0;False;2;2;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1931;-9120,-2160;Inherit;False;Property;_NormalDistortion;Normal Distortion;99;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1932;-9120,-2240;Inherit;False;Property;_TranslucencyStrength;Translucency Strength;88;0;Create;True;0;0;0;True;0;False;1;1;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1933;-9120,-2000;Inherit;False;Property;_Direct;Direct;98;0;Create;True;0;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1934;-9120,-1920;Inherit;False;Property;_Direct1;Direct;93;0;Create;True;0;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1189;-9296,-2240;Inherit;False;Property;_ToonSpec;ToonSpec;262;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1190;-9328,-2160;Inherit;False;Property;_ColoredAmbient;ColoredAmbient;263;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;1126;-16576,-2496;Inherit;True;Property;_NormalMap2;Normal Map;4;2;[Header];[Normal];Create;True;1;Normal Controls;0;0;False;0;False;-1;None;ce721e2d7b397144b890340a9decde3f;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;1127;-16256,-2496;Inherit;True;Property;_Normal1;Normal;29;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1128;-16528,-2304;Inherit;True;Normal Reconstruct Z;-1;;154;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1129;-15728,-2496;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1130;-15488,-2496;Float;True;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1131;-15488,-2272;Inherit;True;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1132;-16240,-2272;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;1133;-15984,-2496;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1125;-16864,-2496;Float;True;Property;_NormalScale2;Normal Scale;108;0;Create;True;0;0;0;False;0;False;0.3;0.252;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;542;-16640,-3120;Float;True;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;543;-16640,-2896;Inherit;True;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;540;-17408,-3120;Inherit;True;Property;_NormalMap1;Normal Map;257;2;[Header];[Normal];Create;True;1;Normal Controls;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;539;-17696,-3120;Float;True;Property;_NormalScale1;Normal Scale;261;0;Create;True;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;544;-17104,-3120;Inherit;True;Property;_Normal;Normal;260;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;545;-17360,-2896;Inherit;True;Normal Reconstruct Z;-1;;155;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;541;-16880,-3120;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;211;-17408,-2400;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;209;-17664,-2272;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;210;-17664,-2496;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;807;-17424,-1760;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;810;-17680,-1856;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;811;-17664,-1600;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1239;-15520,-2976;Inherit;True;BlueNoise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1240;-16032,-3152;Inherit;True;Normal Reconstruct Z;-1;;156;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1241;-16048,-2912;Inherit;True;Property;_BlueNoiseTexture;BlueNoiseTexture;172;1;[Normal];Create;True;0;0;0;False;0;False;-1;ce721e2d7b397144b890340a9decde3f;ce721e2d7b397144b890340a9decde3f;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;1242;-15744,-2976;Inherit;False;Property;_BlueNoise;BlueNoise;175;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1237;-16336,-2864;Inherit;False;Property;_BlueNoiseIntensity;BlueNoise Intensity;177;0;Create;True;0;0;0;False;0;False;0.5;0.213;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;212;-17168,-2400;Float;True;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;809;-17184,-1760;Float;True;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2144;-10160,-4656;Inherit;False;Property;_RadialGradientOffsetX;RadialGradientOffsetX;61;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2145;-10160,-4576;Inherit;False;Property;_RadialGradientOffsetY;RadialGradientOffsetY;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2146;-9904,-4640;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2147;-9904,-4784;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2148;-10128,-4832;Inherit;False;Property;_RadialGradientTileX;RadialGradientTileX;63;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2149;-10128,-4752;Inherit;False;Property;_RadialGradientTileY;RadialGradientTileY;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2150;-9712,-4768;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2151;-9712,-4624;Inherit;False;Property;_RadialGradientSize;Radial Gradient Size;58;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2152;-9776,-4544;Inherit;False;Property;_RadialGradientSharpness;Radial Gradient Sharpness;60;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2153;-9472,-4688;Inherit;False;RadialGradient;-1;;157;ec972f7745a8353409da2eb8d000a2e3;0;3;1;FLOAT2;0,0;False;6;FLOAT;0.42;False;7;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2154;-9152,-4688;Inherit;False;RadialGradientRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;481;-4416,-13408;Inherit;True;480;Warning;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;362;-4416,-13184;Inherit;True;67;Add;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;482;-4080,-13280;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;707;-4176,-12944;Inherit;True;Tangent;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;709;-3808,-12832;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;649;-3840,-12912;Inherit;False;Constant;_Float6;Float 6;102;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;708;-4512,-12880;Inherit;True;542;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;706;-4224,-12560;Inherit;False;Constant;_Color1;Color 1;103;0;Create;True;0;0;0;False;0;False;1,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;705;-3856,-12416;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;673;-4512,-12416;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;697;-3600,-11952;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;650;-3888,-12000;Inherit;False;Property;_Float8;Float 8;335;0;Create;True;0;0;0;False;0;False;-0.03529483;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;691;-4528,-11760;Inherit;True;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;692;-4176,-11856;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LightColorNode;695;-4560,-11968;Inherit;True;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;701;-3904,-11840;Inherit;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-4048,-11216;Inherit;True;595;BaseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;612;-3664,-11344;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;613;-4064,-11472;Inherit;False;Property;_Keyword0;Keyword 0;334;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FogAndAmbientColorsNode;611;-4432,-11408;Inherit;True;unity_AmbientSky;0;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;614;-4256,-11504;Inherit;False;Constant;_Float5;Float 5;101;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ReflectOpNode;719;-4464,-13984;Inherit;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FresnelNode;717;-4000,-13984;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;690;-4016,-13648;Inherit;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;-5,-5,-5,-5;False;2;FLOAT4;5,5,5,5;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CustomExpressionNode;683;-4368,-13712;Half;False;#if defined(SHADOWS_SHADOWMASK) && defined(LIGHTMAP_ON)$return SAMPLE_SHADOWMASK( LightmapUV.xy )@$#elif !defined (LIGHTMAP_ON)$return unity_ProbesOcclusion@$#else$return half4( 1, 1, 1, 1 )@$#endif;4;Create;1;True;LightmapUV;FLOAT2;0,0;InOut;;Inherit;False;Calculate Shadow Mask;True;False;0;;False;1;0;FLOAT2;0,0;False;2;FLOAT4;0;FLOAT2;1
Node;AmplifyShaderEditor.ColorNode;702;-3632,-13664;Inherit;False;Property;_Color0;Color 0;338;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;712;-3776,-13264;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;346;-2160,-12656;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;373;-2160,-12880;Inherit;True;371;MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;55;-1440,-12832;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-912,-12816;Inherit;True;Add;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;60;-1456,-12576;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-2416,-12144;Inherit;True;Property;_Float0;Float 0;273;0;Create;True;0;0;0;False;0;False;-2.72;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;61;-2160,-12416;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;367;-2432,-12400;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;64;-1952,-12416;Inherit;True;Property;_Mutl;Mutl;287;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;377;-1424,-12272;Inherit;True;376;Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;113;-1168,-12304;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;-1440,-13072;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;65;-2128,-12160;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;68;-928,-12576;Inherit;True;Lerp;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-912,-13056;Inherit;True;Multiply;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;350;-912,-12304;Inherit;True;Add2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;164;-1696,-13488;Inherit;True;ConstantBiasScale;-1;;158;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;359;-1344,-13600;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;363;-976,-13552;Inherit;False;ColoredAO;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;328;-1920,-13488;Inherit;True;327;AO;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;357;-1680,-13872;Inherit;False;Property;_AOColor;AO Color;298;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;360;-1648,-13648;Inherit;False;Constant;_Float1;Float 1;52;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosterizeNode;27;-1232,-11504;Inherit;True;1;2;1;COLOR;0,0,0,0;False;0;INT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;50;-944,-11584;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;20;-1872,-11536;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;366;-2480,-11488;Inherit;True;212;NormalLightDirection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;54;-1360,-11856;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0.5;False;4;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;56;-1504,-11632;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;-0.66;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-1664,-11856;Inherit;True;Property;_Darkness;Darkness;269;0;Create;True;0;0;0;False;0;False;0.3;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-1968,-11632;Inherit;False;Property;_Contrast;Contrast;265;0;Create;True;0;0;0;False;0;False;0;0.87;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-1648,-11376;Inherit;False;Property;_ToonShade;ToonShade;267;0;Create;True;0;0;0;False;0;False;1;1;1;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1935;-4544,-13712;Inherit;False;Lightmap UV;-1;;159;1940f027d0458684eb0ad486f669d7d5;1,1,1;0;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2157;-9744,-6720;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;2158;-9776,-6880;Inherit;False;Property;_VoronoiAngleOffset;Voronoi Angle Offset;65;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2159;-9712,-6592;Inherit;False;Property;_VoronoiHeight;Voronoi Height;78;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2160;-9744,-6512;Inherit;False;Property;_VoronoiCellCount;Voronoi Cell Count;80;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;2161;-9712,-6432;Inherit;False;Property;_Period;Period;81;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;2162;-9936,-6768;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2163;-9936,-6608;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2164;-10128,-6784;Inherit;False;Property;_VoronoiTileX;Voronoi Tile X;68;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2165;-10128,-6704;Inherit;False;Property;_VoronoiTileY;Voronoi Tile Y;70;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2166;-10160,-6624;Inherit;False;Property;_VoronoiOffsetX;Voronoi Offset X;72;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2167;-10160,-6544;Inherit;False;Property;_VoronoiOffsetY;Voronoi Offset Y;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2168;-9088,-6656;Inherit;False;TiledVoronoiRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2170;-9296,-7504;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2173;-9584,-7648;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2174;-9760,-7536;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2177;-9936,-7552;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2178;-9936,-7472;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2179;-9760,-7712;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2182;-9520,-7344;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2186;-9712,-7184;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;2187;-9520,-7184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;2172;-9328,-7712;Inherit;True;Property;_TextureMap;Texture Map;33;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;2180;-9952,-7728;Inherit;False;Property;_TextureTileX;Texture Tile X;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2181;-9952,-7648;Inherit;False;Property;_TextureTileY;Texture Tile Y;50;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2175;-10144,-7552;Inherit;False;Property;_TextureSpeedX;Texture Speed X;53;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2176;-10144,-7472;Inherit;False;Property;_TextureSpeedY;Texture Speed Y;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2184;-9744,-7360;Inherit;False;Property;_TextureAnchorX;Texture Anchor X;39;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2183;-9744,-7280;Inherit;False;Property;_TextureAnchorY;Texture Anchor Y;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2185;-9920,-7184;Inherit;False;Property;_TextureRotSpeed;Texture Rot Speed;36;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2188;-8800,-7504;Inherit;False;TextureMapControlRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2191;-9088,-8960;Inherit;True;Property;_ShoreT1;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2192;-9088,-8448;Inherit;True;Property;_ShoreT2;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;2193;-9280,-8960;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;2194;-9296,-8448;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2195;-9568,-9104;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;2196;-9568,-8448;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;2197;-9744,-8992;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2198;-9744,-9168;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2201;-9920,-8528;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2204;-9920,-9008;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2205;-9920,-8928;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2206;-9744,-8368;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;2207;-9952,-8384;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2208;-9952,-8304;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2214;-9696,-8640;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;2215;-9504,-8640;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;2216;-9504,-8224;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2217;-9680,-8224;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2219;-9504,-8800;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2222;-9504,-8096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2225;-8736,-8864;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2226;-8736,-8752;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2230;-8736,-8640;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2231;-8736,-8528;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;2190;-9312,-9168;Inherit;True;Property;_TextureAMap;Texture A Map;30;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;2232;-9328,-8304;Inherit;True;Property;_TextureBMap;Texture B Map;31;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;2199;-9936,-9184;Inherit;False;Property;_TextureATileX;Texture A Tile X;38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2200;-9936,-9104;Inherit;False;Property;_TextureATileY;Texture A Tile Y;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2202;-10128,-9008;Inherit;False;Property;_TextureASpeedX;Texture A Speed X;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2203;-10128,-8928;Inherit;False;Property;_TextureASpeedY;Texture A Speed Y;44;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2221;-9728,-8816;Inherit;False;Property;_TextureAAnchorX;Texture A Anchor X;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2220;-9728,-8736;Inherit;False;Property;_TextureAAnchorY;Texture A Anchor Y;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2213;-9904,-8640;Inherit;False;Property;_TextureARotSpeed;Texture A Rot Speed;32;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2209;-10128,-8544;Inherit;False;Property;_TextureBTileX;Texture B Tile X;51;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2210;-10128,-8464;Inherit;False;Property;_TextureBTileY;Texture B Tile Y;52;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2212;-10160,-8304;Inherit;False;Property;_TextureBSpeedY;Texture B Speed Y;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2211;-10160,-8384;Inherit;False;Property;_TextureBSpeedX;Texture B Speed X;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2218;-9904,-8224;Inherit;False;Property;_TextureBRotSpeed;Texture B Rot Speed;46;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2224;-9728,-8112;Inherit;False;Property;_TextureBAnchorX;Texture B Anchor X;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2223;-9728,-8032;Inherit;False;Property;_TextureBAnchorY;Texture B Anchor Y;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2227;-8576,-8784;Inherit;False;Property;_DoubleTextureBlendingType;Double Texture Blending Type;59;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;Additive;Subtractive;Multiplicative;Divide;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;2228;-8224,-8768;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2229;-8064,-8768;Inherit;False;DoubleTextureMapControlRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2171;-9104,-7504;Inherit;True;Property;_ShoreT;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1147;-9296,-2512;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1148;-9088,-2512;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1183;-9296,-2432;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1184;-9088,-2432;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1185;-9296,-2352;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1186;-9088,-2352;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2233;-9424,-6656;Inherit;False;VoronoiNoise3DTiled;-1;;160;73ed0a6f92eaf7a468d8a4b71f8f6990;0;5;19;FLOAT3;0,0,0;False;12;FLOAT2;0,0;False;13;FLOAT;0;False;18;FLOAT;0;False;17;FLOAT3;4,4,4;False;3;FLOAT;0;FLOAT;11;FLOAT;10
Node;AmplifyShaderEditor.GetLocalVarNode;234;-13664,-2688;Inherit;True;-1;;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1916;-13680,-3504;Inherit;False;1130;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScreenColorNode;1943;-12736,-5808;Inherit;False;Global;_GrabScreen0;Grab Screen 0;11;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;1962;-13344,-4992;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1963;-13168,-5104;Inherit;False;ComputeRotationY;-1;;161;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1964;-12912,-5104;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1967;-12400,-5104;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1968;-13616,-4992;Inherit;False;Property;_CubeMapRotate1;Cube Map Rotate;16;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1969;-12704,-5104;Inherit;True;Property;_ReflectMap;Reflect Map;19;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldReflectionVector;1974;-13424,-5232;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1976;-12064,-5104;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1978;-12128,-5184;Inherit;False;1184;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1982;-12192,-4944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1987;-12176,-4672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1980;-12480,-5184;Inherit;False;Property;_ReflectionStrength;Reflection Strength;22;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1975;-12640,-4912;Inherit;False;Property;_ReflectColor;Reflect Color;20;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1988;-12384,-4544;Inherit;False;1148;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1985;-12608,-4592;Inherit;False;804;FresnelSwitch;1;0;OBJECT;;False;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;1984;-12672,-4688;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;131;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1983;-12368,-4656;Inherit;False;2;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1981;-12400,-4864;Inherit;True;803;FresnelResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1979;-11920,-5136;Inherit;False;Property;_Reflect;Reflect;25;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1977;-11712,-5136;Inherit;True;Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1973;-13648,-5232;Inherit;True;543;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1971;-13488,-4912;Inherit;False;Property;_CMXPos;CM X Pos;13;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1972;-13488,-4752;Inherit;False;Property;_CMZPos;CM Z Pos;15;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1970;-13488,-4832;Inherit;False;Property;_CMYPos;CM Y Pos;10;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1966;-13216,-4832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1965;-13072,-4880;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2237;-15984,3472;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;2238;-15568,3536;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2239;-15408,3568;Inherit;False;Property;_DefNoiseTypeAExponential;DefNoiseTypeAExponential;97;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;2240;-15136,3456;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;2241;-15808,3472;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;2242;-15984,4896;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;2243;-15584,4976;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;2244;-15392,4896;Inherit;False;Property;_DefNoiseBInvert;DefNoiseBInvert;135;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2245;-15424,5008;Inherit;False;Property;_DefNoiseTypeBExponential;DefNoiseTypeBExponential;136;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;2246;-15152,4896;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;2247;-15824,4896;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;2248;-14832,4192;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;2249;-14832,4432;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;2250;-14832,4656;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2251;-14832,3968;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2252;-14832,3744;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;2253;-14576,4240;Inherit;False;Property;_DefNoiseMixType;DefNoiseMixType;69;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;2254;-14320,4224;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;2255;-14320,4336;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;2256;-14096,4240;Inherit;True;Property;_DefNoiseGradeType;DefNoiseGradeType;74;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2257;-14128,4464;Inherit;False;Property;_DefNoiseFinalScale;DefNoiseFinalScale;85;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2258;-14128,4544;Inherit;False;Property;_DefNoiseFinalOffset;DefNoiseFinalOffset;86;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;2259;-13840,4240;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2260;-13840,4384;Inherit;False;Property;_DefNoiseContrast;DefNoiseContrast;77;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;2261;-13616,4240;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;2262;-13392,4240;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2263;-13440,4464;Inherit;False;Property;_DefNoiseGradeScale;DefNoiseGradeScale;79;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2264;-13472,4544;Inherit;False;Property;_DefNoiseGradeOffset;DefNoiseGradeOffset;82;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2265;-12672,4240;Inherit;False;CausticAnimReferance;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2266;-13120,4384;Inherit;False;Property;_MiddleWaveIntensity;Middle Wave Intensity;171;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2267;-12832,4240;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;2268;-12992,4240;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;2269;-13216,4240;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2270;-18224,5024;Inherit;False;Property;_DefVorBSpeedX;DefVorBSpeedX;157;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2271;-18224,5184;Inherit;False;Property;_DefVorBSpeedY;DefVorBSpeedY;159;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2272;-17952,5024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2273;-17952,5184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2274;-17808,5024;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2275;-17808,5184;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2276;-17808,4848;Inherit;False;Property;_DefVorBTileX;DefVorBTileX;149;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2277;-17808,4928;Inherit;False;Property;_DefVorBTileY;DefVorBTileY;153;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2278;-17616,5104;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2279;-17616,5008;Inherit;False;Constant;_Float17;Float 0;105;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2280;-17600,4880;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2281;-17568,5216;Inherit;False;Property;_DefTypeBAnchorX;DefTypeBAnchorX;166;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2282;-17568,5296;Inherit;False;Property;_DefTypeBAnchorY;DefTypeBAnchorY;169;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2283;-17472,5056;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2284;-17568,5376;Inherit;False;Property;_DefTypeBRotSpeed;DefTypeBRotSpeed;162;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2285;-17392,4928;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;2286;-17360,5376;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2287;-17344,5248;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;2288;-17152,5216;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;2289;-16912,4992;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2290;-16960,5216;Inherit;True;Property;_DefNoiseBMap;DefNoiseBMap;130;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2291;-16896,4480;Inherit;False;BUDUVoronoiCell;-1;;162;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2292;-16928,4736;Inherit;False;BUDUVoronoi;-1;;163;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.SimpleTimeNode;2293;-17184,4480;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2294;-17408,4736;Inherit;False;Property;_DefNoiseBScale;DefNoiseBScale;144;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2295;-17168,4784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2296;-17408,4832;Inherit;False;Property;_DefPerlinBScale;DefPerlinBScale;89;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2297;-16544,4400;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2298;-16640,4480;Inherit;False;Property;_Def_VorCell_B_Type;Def_VorCell_B_Type;199;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2299;-16640,4736;Inherit;False;Property;_Def_VorCaustic_B_Type;Def_VorCaustic_B_Type;195;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2300;-16272,4896;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;66;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2301;-17472,4480;Inherit;False;Property;_DefVorBAngle;DefVorBAngle;147;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2302;-17472,4592;Inherit;False;Property;_DefVorBSmooth;DefVorBSmooth;211;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2303;-18240,3792;Inherit;False;Property;_DefVorASpeedX;DefVorASpeedX;116;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2304;-18240,3952;Inherit;False;Property;_DefVorASpeedY;DefVorASpeedY;119;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2305;-17952,3792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2306;-17952,3952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2307;-17808,3792;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2308;-17808,3952;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2309;-17760,3664;Inherit;False;Property;_DefVorATileY;DefVorATileY;114;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2310;-17760,3584;Inherit;False;Property;_DefVorATileX;DefVorATileX;111;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2311;-17568,3616;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;2312;-17568,3856;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2313;-17520,3968;Inherit;False;Property;_DefTypeAAnchorX;DefTypeAAnchorX;127;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2314;-17520,4048;Inherit;False;Property;_DefTypeAAnchorY;DefTypeAAnchorY;128;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2315;-17520,4128;Inherit;False;Property;_DefTypeARotSpeed;DefTypeARotSpeed;122;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2316;-17344,3632;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;2317;-17312,4128;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;2318;-17296,4000;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;2319;-17344,3792;Inherit;False;Property;_DefNoiseAScale;DefNoiseAScale;105;0;Create;True;0;0;0;False;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;2320;-17104,3984;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2321;-17072,3792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2322;-16912,3984;Inherit;True;Property;_DefNoiseAMap;DefNoiseAMap;92;0;Create;True;0;0;0;False;1;Space(10);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2323;-17456,3232;Inherit;False;Property;_DefVorAAngle;DefVorAAngle;107;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2324;-17168,3232;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;2325;-16864,3760;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2326;-17344,3872;Inherit;False;Property;_DefPerlinAScale;DefPerlinAScale;91;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2327;-16832,3232;Inherit;False;BUDUVoronoiCell;-1;;164;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2328;-16864,3488;Inherit;False;BUDUVoronoi;-1;;165;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.RangedFloatNode;2329;-17456,3328;Inherit;False;Property;_DefVorASmooth;DefVorASmooth;208;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2330;-16624,3488;Inherit;False;Property;_Def_VorCaustic_A_Type;Def_VorCaustic_A_Type;192;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2331;-16256,3472;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;64;0;Create;True;0;0;0;False;3;Space(50);Header(Noise);Space(5);False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2332;-16496,3152;Inherit;False;1186;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2333;-16592,3232;Inherit;False;Property;_Def_VorCell_A_Type;Def_VorCell_A_Type;201;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;2334;-15376,3456;Inherit;False;Property;_DefNoiseAInvert;DefNoiseAInvert;94;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2335;-18224,5104;Inherit;False;Property;_DefNoiseBOverScrSpeed;DefNoiseBOverScrSpeed;141;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2336;-18240,3872;Inherit;False;Property;_DefNoiseAOverScrSpeed;DefNoiseAOverScrSpeed;101;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1812;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1813;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1814;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1815;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;8;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1816;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1817;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1818;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1819;1776,-7200;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1810;-208,-7104;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1811;-96,-7200;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;BUDU Shaders/Modules/BModules;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;8;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638526599283298919;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;1;638527621130890575;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;638527621204836196;  Scattering;2,False,;638527621472449792;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;False;0
WireConnection;325;1;121;0
WireConnection;325;0;324;0
WireConnection;326;0;325;0
WireConnection;266;0;70;0
WireConnection;163;0;160;0
WireConnection;327;0;326;0
WireConnection;284;0;198;0
WireConnection;321;0;320;0
WireConnection;160;1;150;0
WireConnection;160;0;161;0
WireConnection;320;1;165;0
WireConnection;320;0;319;0
WireConnection;323;0;321;0
WireConnection;322;0;163;0
WireConnection;487;0;501;0
WireConnection;550;0;551;0
WireConnection;552;0;548;0
WireConnection;547;0;550;0
WireConnection;548;0;547;0
WireConnection;548;1;549;0
WireConnection;341;0;265;0
WireConnection;762;0;761;0
WireConnection;762;1;763;0
WireConnection;764;0;762;0
WireConnection;201;0;281;0
WireConnection;201;1;200;0
WireConnection;201;2;199;0
WireConnection;282;0;201;0
WireConnection;281;42;283;0
WireConnection;281;52;284;0
WireConnection;241;0;234;0
WireConnection;241;1;233;0
WireConnection;259;0;254;0
WireConnection;259;1;257;0
WireConnection;254;0;252;0
WireConnection;881;0;882;0
WireConnection;882;0;883;0
WireConnection;883;0;901;0
WireConnection;883;1;900;0
WireConnection;884;0;881;0
WireConnection;884;1;898;0
WireConnection;885;0;886;0
WireConnection;885;1;887;0
WireConnection;888;0;892;0
WireConnection;888;1;896;0
WireConnection;889;0;888;0
WireConnection;890;0;891;0
WireConnection;891;0;892;0
WireConnection;892;0;894;0
WireConnection;893;0;884;0
WireConnection;893;1;885;0
WireConnection;894;0;884;0
WireConnection;894;1;893;0
WireConnection;896;0;895;0
WireConnection;896;1;897;0
WireConnection;898;0;899;0
WireConnection;901;0;902;0
WireConnection;1048;0;1049;0
WireConnection;1045;13;1048;0
WireConnection;1045;24;1046;0
WireConnection;1045;4;1051;0
WireConnection;1045;5;1052;0
WireConnection;1045;130;1047;0
WireConnection;1050;1;1045;0
WireConnection;1053;0;1050;0
WireConnection;1079;0;1078;0
WireConnection;1081;0;1080;0
WireConnection;1081;1;1079;0
WireConnection;1083;0;1082;0
WireConnection;1083;1;1081;0
WireConnection;1084;0;1083;0
WireConnection;1093;0;1095;1
WireConnection;1093;1;1091;0
WireConnection;1093;2;1092;0
WireConnection;1094;0;1093;0
WireConnection;1097;0;1096;0
WireConnection;1097;1;1094;0
WireConnection;1098;0;1097;0
WireConnection;168;0;167;0
WireConnection;173;0;171;0
WireConnection;173;1;168;0
WireConnection;172;0;170;0
WireConnection;172;1;169;0
WireConnection;174;0;173;0
WireConnection;174;1;172;0
WireConnection;70;0;71;0
WireConnection;70;1;72;0
WireConnection;1110;0;1109;0
WireConnection;1114;0;1110;4
WireConnection;1114;1;1113;0
WireConnection;1115;0;1112;0
WireConnection;1115;1;1111;0
WireConnection;1115;2;1114;0
WireConnection;1117;0;1115;0
WireConnection;1203;0;1201;1
WireConnection;1203;1;1202;0
WireConnection;1204;0;1217;0
WireConnection;1205;0;1203;0
WireConnection;1206;0;1205;0
WireConnection;1206;1;1204;0
WireConnection;1207;0;1206;0
WireConnection;1207;1;1212;0
WireConnection;1207;2;1213;0
WireConnection;1209;0;1208;0
WireConnection;1210;0;1207;0
WireConnection;1210;1;1214;0
WireConnection;1211;0;1209;0
WireConnection;1211;1;1210;0
WireConnection;1212;0;1215;0
WireConnection;1213;0;1216;0
WireConnection;1218;0;1219;0
WireConnection;1219;0;1220;0
WireConnection;1219;1;1211;0
WireConnection;1223;0;1222;0
WireConnection;1226;0;1223;0
WireConnection;1226;2;1225;0
WireConnection;1226;4;1224;0
WireConnection;1227;0;1226;0
WireConnection;1228;0;1229;0
WireConnection;1229;0;1230;0
WireConnection;1229;1;1231;0
WireConnection;1231;0;1227;0
WireConnection;1231;1;1232;0
WireConnection;1232;0;1235;0
WireConnection;1232;1;1234;0
WireConnection;1234;0;1233;0
WireConnection;265;0;263;0
WireConnection;265;1;278;0
WireConnection;265;2;264;0
WireConnection;278;2;262;0
WireConnection;190;0;185;0
WireConnection;190;1;189;0
WireConnection;184;0;179;0
WireConnection;184;1;180;0
WireConnection;185;1;184;0
WireConnection;185;0;182;0
WireConnection;181;0;176;0
WireConnection;181;1;177;0
WireConnection;192;0;187;0
WireConnection;192;1;186;0
WireConnection;187;0;183;0
WireConnection;193;0;190;0
WireConnection;193;1;192;0
WireConnection;196;0;193;0
WireConnection;194;0;191;0
WireConnection;191;0;181;0
WireConnection;344;0;197;0
WireConnection;197;0;339;0
WireConnection;197;1;194;0
WireConnection;197;2;202;0
WireConnection;197;3;196;0
WireConnection;202;0;183;0
WireConnection;183;0;181;0
WireConnection;478;0;476;2
WireConnection;478;1;475;0
WireConnection;477;0;478;0
WireConnection;479;0;477;0
WireConnection;479;3;483;0
WireConnection;479;4;484;0
WireConnection;486;0;485;0
WireConnection;486;1;479;0
WireConnection;480;0;486;0
WireConnection;1908;0;1907;0
WireConnection;1908;1;1905;0
WireConnection;1908;2;1906;0
WireConnection;1910;0;1912;0
WireConnection;1910;1;1911;0
WireConnection;1911;0;1912;0
WireConnection;1911;1;1913;0
WireConnection;1883;0;1900;0
WireConnection;1883;1;1889;0
WireConnection;1883;2;1898;0
WireConnection;1888;1;1885;0
WireConnection;1888;2;1886;0
WireConnection;1888;3;1887;0
WireConnection;1889;0;1890;0
WireConnection;1890;0;1888;0
WireConnection;1890;1;1891;0
WireConnection;1891;0;1888;0
WireConnection;1892;1;1896;2
WireConnection;1892;0;1897;0
WireConnection;1893;0;1892;0
WireConnection;1894;0;1893;0
WireConnection;1898;0;1899;0
WireConnection;1899;0;1894;0
WireConnection;1899;1;1895;0
WireConnection;257;0;251;0
WireConnection;257;1;253;0
WireConnection;245;0;241;0
WireConnection;245;1;242;0
WireConnection;222;0;259;0
WireConnection;222;1;261;0
WireConnection;222;2;258;0
WireConnection;222;3;260;0
WireConnection;249;0;245;0
WireConnection;260;0;255;0
WireConnection;343;0;222;0
WireConnection;251;0;249;0
WireConnection;1879;0;1877;0
WireConnection;1826;0;1825;0
WireConnection;1828;0;1826;0
WireConnection;1830;0;1828;0
WireConnection;1830;1;1829;0
WireConnection;1830;2;1827;0
WireConnection;1836;0;1831;0
WireConnection;1836;1;1830;0
WireConnection;1837;1;1836;0
WireConnection;1838;0;1832;0
WireConnection;1838;1;1833;0
WireConnection;1839;1;1836;0
WireConnection;1840;0;1834;0
WireConnection;1840;1;1835;0
WireConnection;1841;0;1837;0
WireConnection;1841;2;1838;0
WireConnection;1841;1;1836;0
WireConnection;1842;0;1839;0
WireConnection;1842;2;1840;0
WireConnection;1842;1;1836;0
WireConnection;1845;1;1841;0
WireConnection;1847;1;1842;0
WireConnection;1848;0;1843;0
WireConnection;1848;1;1844;0
WireConnection;1850;0;1846;0
WireConnection;1851;0;1845;3
WireConnection;1851;1;1847;2
WireConnection;1853;0;1843;0
WireConnection;1853;1;1848;0
WireConnection;1854;0;1849;0
WireConnection;1854;1;1850;0
WireConnection;1854;2;1851;0
WireConnection;1855;0;1852;0
WireConnection;1856;0;1853;0
WireConnection;1858;0;1855;0
WireConnection;1858;2;1856;0
WireConnection;1859;0;1858;0
WireConnection;1861;0;1859;0
WireConnection;1861;1;1860;0
WireConnection;1863;0;1859;0
WireConnection;1863;1;1861;0
WireConnection;1864;0;1863;0
WireConnection;1864;1;1862;0
WireConnection;1866;0;1864;0
WireConnection;1866;1;1865;0
WireConnection;1868;0;1866;0
WireConnection;1870;0;1867;0
WireConnection;1872;0;1868;0
WireConnection;1872;1;1869;0
WireConnection;1873;0;1871;0
WireConnection;1873;1;1870;0
WireConnection;1874;0;1872;0
WireConnection;1874;1;1873;0
WireConnection;1876;1;1874;0
WireConnection;1876;2;1875;0
WireConnection;1914;0;1910;0
WireConnection;1909;0;1908;0
WireConnection;1857;0;1854;0
WireConnection;1878;0;1876;0
WireConnection;1884;0;1883;0
WireConnection;1921;0;1916;0
WireConnection;1921;4;1920;0
WireConnection;1921;1;1919;0
WireConnection;1921;2;1918;0
WireConnection;1921;3;1917;0
WireConnection;1923;0;1921;0
WireConnection;1923;1;1922;0
WireConnection;1925;0;1923;0
WireConnection;1925;1;1924;0
WireConnection;1926;0;1925;0
WireConnection;1927;0;1924;0
WireConnection;1928;0;1921;0
WireConnection;967;0;970;0
WireConnection;967;1;966;0
WireConnection;970;0;965;0
WireConnection;971;0;967;0
WireConnection;971;1;968;0
WireConnection;971;2;969;0
WireConnection;973;0;972;0
WireConnection;975;0;971;0
WireConnection;975;1;974;0
WireConnection;976;0;973;0
WireConnection;976;1;975;0
WireConnection;977;0;976;0
WireConnection;966;0;978;0
WireConnection;106;42;336;0
WireConnection;106;52;365;0
WireConnection;108;0;106;57
WireConnection;115;1;109;0
WireConnection;115;0;140;0
WireConnection;376;0;375;0
WireConnection;143;0;110;0
WireConnection;143;1;294;0
WireConnection;143;2;149;0
WireConnection;110;0;115;0
WireConnection;109;0;107;0
WireConnection;109;2;147;0
WireConnection;109;4;148;0
WireConnection;375;0;143;0
WireConnection;375;1;369;0
WireConnection;965;0;963;1
WireConnection;965;1;964;0
WireConnection;107;1;108;0
WireConnection;107;0;117;0
WireConnection;1938;0;1959;0
WireConnection;1938;1;1945;0
WireConnection;1938;2;1946;0
WireConnection;1940;0;1939;0
WireConnection;1941;0;1940;0
WireConnection;1941;1;1952;0
WireConnection;1942;0;1951;0
WireConnection;1942;1;1941;0
WireConnection;1945;1;1943;0
WireConnection;1945;0;1944;0
WireConnection;1951;0;1953;0
WireConnection;1951;1;1947;0
WireConnection;1951;2;1950;0
WireConnection;1951;3;1949;0
WireConnection;1951;4;1948;0
WireConnection;1956;0;1954;0
WireConnection;1956;1;1955;0
WireConnection;1957;0;1956;0
WireConnection;1959;0;1958;0
WireConnection;1959;1;1957;0
WireConnection;1960;0;1938;0
WireConnection;2008;0;2013;0
WireConnection;2010;0;2008;0
WireConnection;2010;1;2009;0
WireConnection;2012;0;2011;0
WireConnection;2014;0;2010;0
WireConnection;2014;1;2012;0
WireConnection;2015;0;2014;0
WireConnection;2016;0;2010;0
WireConnection;2001;0;2002;0
WireConnection;2001;1;2005;0
WireConnection;2004;0;2003;0
WireConnection;2005;0;2003;0
WireConnection;2005;1;2004;0
WireConnection;2006;0;2001;0
WireConnection;1991;0;1990;0
WireConnection;1992;0;1990;0
WireConnection;1992;1;1991;0
WireConnection;1993;0;1998;0
WireConnection;1993;1;1992;0
WireConnection;1994;0;1996;0
WireConnection;1995;0;1993;0
WireConnection;1995;1;1999;0
WireConnection;1996;0;1995;0
WireConnection;1998;0;1997;0
WireConnection;601;0;602;0
WireConnection;601;4;607;0
WireConnection;601;1;603;0
WireConnection;601;2;604;0
WireConnection;601;3;605;0
WireConnection;600;0;601;0
WireConnection;36;0;2;0
WireConnection;36;1;90;0
WireConnection;371;0;36;0
WireConnection;579;0;596;0
WireConnection;579;1;577;0
WireConnection;580;0;579;0
WireConnection;580;1;578;0
WireConnection;581;0;579;0
WireConnection;584;0;581;0
WireConnection;585;0;580;0
WireConnection;586;0;585;0
WireConnection;586;1;582;0
WireConnection;587;0;586;0
WireConnection;587;1;588;0
WireConnection;590;1;589;0
WireConnection;590;0;598;0
WireConnection;593;1;590;0
WireConnection;593;0;591;0
WireConnection;594;0;592;1
WireConnection;594;1;593;0
WireConnection;595;0;594;0
WireConnection;588;0;584;0
WireConnection;588;1;597;0
WireConnection;588;2;583;0
WireConnection;588;3;582;0
WireConnection;589;0;587;0
WireConnection;1005;0;1002;0
WireConnection;1005;1;1003;0
WireConnection;1009;0;1005;0
WireConnection;1009;1;1007;0
WireConnection;1009;2;1008;0
WireConnection;1011;0;1016;0
WireConnection;1011;1;1014;0
WireConnection;1012;0;1011;0
WireConnection;1013;0;1009;0
WireConnection;1013;1;1010;0
WireConnection;1013;2;1012;0
WireConnection;1016;0;1015;0
WireConnection;1019;0;1018;0
WireConnection;1019;1;1013;0
WireConnection;999;0;1017;0
WireConnection;999;1;1000;1
WireConnection;1002;0;999;0
WireConnection;1002;1;1001;0
WireConnection;1003;0;1004;0
WireConnection;1007;0;1006;0
WireConnection;1008;0;1007;0
WireConnection;1020;0;1019;0
WireConnection;2023;0;2022;0
WireConnection;2028;0;2024;1
WireConnection;2028;1;2027;3
WireConnection;2026;0;2024;1
WireConnection;2026;1;2027;2
WireConnection;2025;0;2024;1
WireConnection;2025;1;2027;1
WireConnection;2031;0;2028;0
WireConnection;2031;1;2029;0
WireConnection;2030;0;2025;0
WireConnection;2030;1;2026;0
WireConnection;2034;0;2023;0
WireConnection;2034;1;2030;0
WireConnection;2035;0;2023;0
WireConnection;2035;1;2031;0
WireConnection;2039;0;2038;0
WireConnection;2039;1;2032;0
WireConnection;2038;0;2034;0
WireConnection;2038;1;2033;0
WireConnection;2040;0;2035;0
WireConnection;2040;1;2036;0
WireConnection;2041;0;2040;0
WireConnection;2041;1;2037;0
WireConnection;2043;0;2039;0
WireConnection;2044;0;2041;0
WireConnection;2033;0;2019;1
WireConnection;2033;1;2019;2
WireConnection;2032;0;2019;3
WireConnection;2032;1;2019;4
WireConnection;799;0;795;0
WireConnection;799;4;794;0
WireConnection;799;1;796;0
WireConnection;799;2;797;0
WireConnection;799;3;798;0
WireConnection;801;0;805;0
WireConnection;801;1;799;0
WireConnection;802;0;801;0
WireConnection;802;1;800;0
WireConnection;803;0;802;0
WireConnection;805;0;799;0
WireConnection;804;0;800;0
WireConnection;2138;2;2139;0
WireConnection;2138;15;2140;0
WireConnection;2138;14;2141;0
WireConnection;401;0;398;0
WireConnection;401;1;395;0
WireConnection;435;0;431;0
WireConnection;435;1;432;0
WireConnection;444;0;443;0
WireConnection;444;1;440;0
WireConnection;407;1;405;0
WireConnection;407;0;406;0
WireConnection;445;0;442;0
WireConnection;445;1;441;0
WireConnection;439;0;437;0
WireConnection;439;1;438;0
WireConnection;423;1;450;0
WireConnection;466;0;464;0
WireConnection;466;1;422;0
WireConnection;425;0;466;0
WireConnection;425;1;467;0
WireConnection;467;0;465;0
WireConnection;467;1;423;0
WireConnection;427;0;425;0
WireConnection;427;1;424;0
WireConnection;410;0;409;0
WireConnection;428;0;430;0
WireConnection;428;2;439;0
WireConnection;408;0;407;0
WireConnection;436;0;433;0
WireConnection;436;1;434;0
WireConnection;451;0;427;0
WireConnection;500;0;491;0
WireConnection;424;0;466;0
WireConnection;424;1;467;0
WireConnection;519;0;498;0
WireConnection;430;0;435;0
WireConnection;430;1;436;0
WireConnection;422;1;428;0
WireConnection;448;0;446;0
WireConnection;448;1;447;0
WireConnection;450;0;449;0
WireConnection;450;2;448;0
WireConnection;488;0;487;0
WireConnection;496;0;494;0
WireConnection;496;1;493;0
WireConnection;496;2;517;0
WireConnection;494;0;490;0
WireConnection;494;1;499;0
WireConnection;493;0;503;0
WireConnection;491;0;488;0
WireConnection;498;0;496;0
WireConnection;498;1;497;0
WireConnection;449;0;445;0
WireConnection;449;1;444;0
WireConnection;409;0;408;0
WireConnection;400;0;395;0
WireConnection;400;1;398;0
WireConnection;405;1;404;0
WireConnection;404;0;403;0
WireConnection;404;1;402;0
WireConnection;402;0;400;0
WireConnection;402;1;401;0
WireConnection;403;0;399;0
WireConnection;403;1;396;0
WireConnection;399;0;396;0
WireConnection;399;1;397;0
WireConnection;516;0;495;0
WireConnection;1055;0;1063;0
WireConnection;1055;1;1064;0
WireConnection;1056;1;1055;0
WireConnection;1057;0;1058;0
WireConnection;1058;0;1068;0
WireConnection;1058;1;1073;0
WireConnection;1065;0;1069;0
WireConnection;1065;1;1056;1
WireConnection;1067;0;1066;0
WireConnection;1068;0;1065;0
WireConnection;1068;1;1067;0
WireConnection;1072;1;1056;1
WireConnection;1073;0;1072;0
WireConnection;1073;2;1066;0
WireConnection;1061;0;1060;0
WireConnection;1076;0;1059;0
WireConnection;1076;1;1075;0
WireConnection;489;0;511;0
WireConnection;489;1;514;0
WireConnection;511;0;507;0
WireConnection;511;1;510;0
WireConnection;514;0;512;0
WireConnection;514;1;513;0
WireConnection;492;0;489;0
WireConnection;492;2;506;0
WireConnection;492;1;515;0
WireConnection;506;0;504;0
WireConnection;506;1;505;0
WireConnection;1071;0;1068;0
WireConnection;1071;1;1070;0
WireConnection;1074;0;1076;0
WireConnection;1059;0;1071;0
WireConnection;1059;1;1061;0
WireConnection;1060;0;1056;1
WireConnection;1060;1;1062;0
WireConnection;495;1;492;0
WireConnection;2029;0;2024;1
WireConnection;2029;1;2027;4
WireConnection;2036;0;2021;1
WireConnection;2036;1;2021;2
WireConnection;2037;0;2021;3
WireConnection;2037;1;2021;4
WireConnection;1196;0;1197;0
WireConnection;1195;0;1192;0
WireConnection;1195;1;1193;0
WireConnection;1195;2;1194;0
WireConnection;1197;0;1199;0
WireConnection;1197;1;1198;0
WireConnection;1198;1;1195;0
WireConnection;1126;5;1125;0
WireConnection;1127;0;1128;0
WireConnection;1127;1;1126;0
WireConnection;1129;0;1133;0
WireConnection;1130;0;1129;0
WireConnection;1131;0;1133;0
WireConnection;1133;0;1127;0
WireConnection;1133;1;1132;0
WireConnection;542;0;541;0
WireConnection;543;0;544;0
WireConnection;540;5;539;0
WireConnection;544;0;545;0
WireConnection;544;1;540;0
WireConnection;541;0;544;0
WireConnection;211;0;210;0
WireConnection;211;1;209;0
WireConnection;807;0;810;0
WireConnection;807;1;811;0
WireConnection;1239;0;1242;0
WireConnection;1241;5;1237;0
WireConnection;1242;0;1240;0
WireConnection;1242;1;1241;0
WireConnection;212;0;211;0
WireConnection;809;0;807;0
WireConnection;2146;0;2144;0
WireConnection;2146;1;2145;0
WireConnection;2147;0;2148;0
WireConnection;2147;1;2149;0
WireConnection;2150;0;2147;0
WireConnection;2150;1;2146;0
WireConnection;2153;1;2150;0
WireConnection;2153;6;2151;0
WireConnection;2153;7;2152;0
WireConnection;2154;0;2153;0
WireConnection;482;0;481;0
WireConnection;482;1;362;0
WireConnection;707;0;708;0
WireConnection;709;0;649;0
WireConnection;709;1;707;0
WireConnection;705;0;673;0
WireConnection;705;1;706;0
WireConnection;697;0;650;0
WireConnection;697;1;701;0
WireConnection;692;0;695;1
WireConnection;692;1;691;0
WireConnection;701;0;692;0
WireConnection;612;0;613;0
WireConnection;612;1;599;0
WireConnection;613;1;614;0
WireConnection;613;0;611;0
WireConnection;690;0;683;0
WireConnection;683;0;1935;0
WireConnection;55;0;373;0
WireConnection;55;1;346;0
WireConnection;67;0;55;0
WireConnection;60;0;346;0
WireConnection;60;1;373;0
WireConnection;60;2;64;0
WireConnection;61;0;367;0
WireConnection;64;0;65;0
WireConnection;64;1;61;0
WireConnection;113;0;60;0
WireConnection;113;1;377;0
WireConnection;62;0;373;0
WireConnection;62;1;346;0
WireConnection;65;0;351;0
WireConnection;68;0;60;0
WireConnection;66;0;62;0
WireConnection;350;0;113;0
WireConnection;164;3;328;0
WireConnection;359;0;357;0
WireConnection;359;1;360;0
WireConnection;359;2;164;0
WireConnection;363;0;359;0
WireConnection;27;1;56;0
WireConnection;27;0;26;0
WireConnection;50;0;54;0
WireConnection;50;1;27;0
WireConnection;20;0;366;0
WireConnection;54;0;51;0
WireConnection;56;1;20;0
WireConnection;56;0;59;0
WireConnection;2157;0;2162;0
WireConnection;2157;1;2163;0
WireConnection;2162;0;2164;0
WireConnection;2162;1;2165;0
WireConnection;2163;0;2166;0
WireConnection;2163;1;2167;0
WireConnection;2168;0;2233;0
WireConnection;2170;0;2173;0
WireConnection;2170;1;2182;0
WireConnection;2170;2;2187;0
WireConnection;2173;0;2179;0
WireConnection;2173;1;2174;0
WireConnection;2174;0;2177;0
WireConnection;2174;1;2178;0
WireConnection;2177;0;2175;0
WireConnection;2178;0;2176;0
WireConnection;2179;0;2180;0
WireConnection;2179;1;2181;0
WireConnection;2182;0;2184;0
WireConnection;2182;1;2183;0
WireConnection;2186;0;2185;0
WireConnection;2187;0;2186;0
WireConnection;2188;0;2171;0
WireConnection;2191;0;2190;0
WireConnection;2191;1;2193;0
WireConnection;2192;0;2232;0
WireConnection;2192;1;2194;0
WireConnection;2193;0;2195;0
WireConnection;2193;1;2219;0
WireConnection;2193;2;2215;0
WireConnection;2194;0;2196;0
WireConnection;2194;1;2222;0
WireConnection;2194;2;2216;0
WireConnection;2195;0;2198;0
WireConnection;2195;1;2197;0
WireConnection;2196;0;2201;0
WireConnection;2196;1;2206;0
WireConnection;2197;0;2204;0
WireConnection;2197;1;2205;0
WireConnection;2198;0;2199;0
WireConnection;2198;1;2200;0
WireConnection;2201;0;2209;0
WireConnection;2201;1;2210;0
WireConnection;2204;0;2202;0
WireConnection;2205;0;2203;0
WireConnection;2206;0;2207;0
WireConnection;2206;1;2208;0
WireConnection;2207;0;2211;0
WireConnection;2208;0;2212;0
WireConnection;2214;0;2213;0
WireConnection;2215;0;2214;0
WireConnection;2216;0;2217;0
WireConnection;2217;0;2218;0
WireConnection;2219;0;2221;0
WireConnection;2219;1;2220;0
WireConnection;2222;0;2224;0
WireConnection;2222;1;2223;0
WireConnection;2225;0;2191;0
WireConnection;2225;1;2192;0
WireConnection;2226;0;2191;0
WireConnection;2226;1;2192;0
WireConnection;2230;0;2191;0
WireConnection;2230;1;2192;0
WireConnection;2231;0;2191;0
WireConnection;2231;1;2192;0
WireConnection;2227;1;2225;0
WireConnection;2227;0;2226;0
WireConnection;2227;2;2230;0
WireConnection;2227;3;2231;0
WireConnection;2228;0;2227;0
WireConnection;2229;0;2228;0
WireConnection;2171;0;2172;0
WireConnection;2171;1;2170;0
WireConnection;1148;0;1147;0
WireConnection;1184;0;1183;0
WireConnection;1186;0;1185;0
WireConnection;2233;19;2158;0
WireConnection;2233;12;2157;0
WireConnection;2233;13;2159;0
WireConnection;2233;18;2160;0
WireConnection;2233;17;2161;0
WireConnection;1943;0;1942;0
WireConnection;1962;0;1968;0
WireConnection;1963;4;1974;0
WireConnection;1963;2;1962;0
WireConnection;1964;0;1963;0
WireConnection;1964;1;1965;0
WireConnection;1967;0;1969;0
WireConnection;1967;1;1975;0
WireConnection;1969;1;1964;0
WireConnection;1974;0;1973;0
WireConnection;1976;0;1980;0
WireConnection;1976;1;1967;0
WireConnection;1976;2;1982;0
WireConnection;1976;3;1987;0
WireConnection;1982;0;1981;0
WireConnection;1987;0;1983;0
WireConnection;1987;1;1988;0
WireConnection;1983;0;1984;0
WireConnection;1983;1;1985;0
WireConnection;1979;0;1978;0
WireConnection;1979;1;1976;0
WireConnection;1977;0;1979;0
WireConnection;1966;0;1970;0
WireConnection;1965;0;1971;0
WireConnection;1965;1;1966;0
WireConnection;1965;2;1972;0
WireConnection;2237;0;2331;0
WireConnection;2238;0;2241;0
WireConnection;2240;0;2334;0
WireConnection;2240;1;2239;0
WireConnection;2241;0;2237;0
WireConnection;2242;0;2300;0
WireConnection;2243;0;2247;0
WireConnection;2244;0;2247;0
WireConnection;2244;1;2243;0
WireConnection;2246;0;2244;0
WireConnection;2246;1;2245;0
WireConnection;2247;0;2242;0
WireConnection;2248;0;2240;0
WireConnection;2248;1;2246;0
WireConnection;2249;0;2240;0
WireConnection;2249;1;2246;0
WireConnection;2250;0;2240;0
WireConnection;2250;1;2246;0
WireConnection;2251;0;2240;0
WireConnection;2251;1;2246;0
WireConnection;2252;0;2240;0
WireConnection;2252;1;2246;0
WireConnection;2253;1;2252;0
WireConnection;2253;0;2251;0
WireConnection;2253;2;2248;0
WireConnection;2253;3;2249;0
WireConnection;2253;4;2250;0
WireConnection;2254;0;2253;0
WireConnection;2255;0;2253;0
WireConnection;2256;1;2254;0
WireConnection;2256;0;2253;0
WireConnection;2256;2;2255;0
WireConnection;2259;0;2256;0
WireConnection;2259;1;2257;0
WireConnection;2259;2;2258;0
WireConnection;2261;1;2259;0
WireConnection;2261;0;2260;0
WireConnection;2262;0;2261;0
WireConnection;2265;0;2267;0
WireConnection;2267;0;2268;0
WireConnection;2267;1;2266;0
WireConnection;2268;0;2269;0
WireConnection;2269;0;2262;0
WireConnection;2269;1;2263;0
WireConnection;2269;2;2264;0
WireConnection;2272;0;2270;0
WireConnection;2272;1;2335;0
WireConnection;2273;0;2271;0
WireConnection;2273;1;2335;0
WireConnection;2274;0;2272;0
WireConnection;2275;0;2273;0
WireConnection;2278;0;2274;0
WireConnection;2278;1;2275;0
WireConnection;2280;0;2276;0
WireConnection;2280;1;2277;0
WireConnection;2283;0;2278;0
WireConnection;2283;1;2279;0
WireConnection;2285;0;2280;0
WireConnection;2285;1;2283;0
WireConnection;2286;0;2284;0
WireConnection;2287;0;2281;0
WireConnection;2287;1;2282;0
WireConnection;2288;0;2285;0
WireConnection;2288;1;2287;0
WireConnection;2288;2;2286;0
WireConnection;2289;0;2288;0
WireConnection;2289;1;2295;0
WireConnection;2290;1;2288;0
WireConnection;2291;3;2288;0
WireConnection;2291;4;2293;0
WireConnection;2291;5;2294;0
WireConnection;2291;28;2302;0
WireConnection;2292;3;2288;0
WireConnection;2292;4;2293;0
WireConnection;2292;5;2294;0
WireConnection;2293;0;2301;0
WireConnection;2295;0;2294;0
WireConnection;2295;1;2296;0
WireConnection;2298;1;2291;0
WireConnection;2298;0;2291;9
WireConnection;2298;2;2291;20
WireConnection;2298;3;2291;21
WireConnection;2298;4;2291;13
WireConnection;2298;5;2291;15
WireConnection;2298;6;2291;26
WireConnection;2298;7;2291;27
WireConnection;2299;1;2292;0
WireConnection;2299;0;2292;9
WireConnection;2299;2;2292;20
WireConnection;2299;3;2292;21
WireConnection;2299;4;2292;13
WireConnection;2299;5;2292;15
WireConnection;2299;6;2292;26
WireConnection;2299;7;2292;27
WireConnection;2300;1;2297;0
WireConnection;2300;0;2298;0
WireConnection;2300;2;2299;0
WireConnection;2300;3;2289;0
WireConnection;2300;4;2290;0
WireConnection;2305;0;2303;0
WireConnection;2305;1;2336;0
WireConnection;2306;0;2304;0
WireConnection;2306;1;2336;0
WireConnection;2307;0;2305;0
WireConnection;2308;0;2306;0
WireConnection;2311;0;2310;0
WireConnection;2311;1;2309;0
WireConnection;2312;0;2307;0
WireConnection;2312;1;2308;0
WireConnection;2316;0;2311;0
WireConnection;2316;1;2312;0
WireConnection;2317;0;2315;0
WireConnection;2318;0;2313;0
WireConnection;2318;1;2314;0
WireConnection;2320;0;2316;0
WireConnection;2320;1;2318;0
WireConnection;2320;2;2317;0
WireConnection;2321;0;2319;0
WireConnection;2321;1;2326;0
WireConnection;2322;1;2320;0
WireConnection;2324;0;2323;0
WireConnection;2325;0;2320;0
WireConnection;2325;1;2321;0
WireConnection;2327;3;2320;0
WireConnection;2327;4;2324;0
WireConnection;2327;5;2319;0
WireConnection;2327;28;2329;0
WireConnection;2328;3;2320;0
WireConnection;2328;4;2324;0
WireConnection;2328;5;2319;0
WireConnection;2330;1;2328;0
WireConnection;2330;0;2328;9
WireConnection;2330;2;2328;20
WireConnection;2330;3;2328;21
WireConnection;2330;4;2328;13
WireConnection;2330;5;2328;15
WireConnection;2330;6;2328;26
WireConnection;2330;7;2328;27
WireConnection;2331;1;2332;0
WireConnection;2331;0;2333;0
WireConnection;2331;2;2330;0
WireConnection;2331;3;2325;0
WireConnection;2331;4;2322;0
WireConnection;2333;1;2327;0
WireConnection;2333;0;2327;9
WireConnection;2333;2;2327;20
WireConnection;2333;3;2327;21
WireConnection;2333;4;2327;13
WireConnection;2333;5;2327;15
WireConnection;2333;6;2327;26
WireConnection;2333;7;2327;27
WireConnection;2334;0;2241;0
WireConnection;2334;1;2238;0
WireConnection;1811;0;2017;0
WireConnection;1811;2;1882;0
WireConnection;1811;9;2018;0
ASEEND*/
//CHKSM=141B8BB9320A5581E2355D2732B0068E2E1A1B3C
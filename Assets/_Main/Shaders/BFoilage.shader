// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BFoilage"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_EffectBlend("EffectBlend", Range( 0 , 1)) = 0
		[NoScaleOffset]_LeavesSpecTexture("Leaves Spec Texture", 2D) = "white" {}
		_LeavesSpecColor("Leaves Spec Color", Color) = (1,1,1)
		_LeavesColor("Leaves Color", Color) = (0.3193329,0.4654087,0.1653811)
		_LeavesSpecIntensity("Leaves Spec Intensity", Range( 0 , 1)) = 1
		[NoScaleOffset]_LeavesTexture("Leaves Texture", 2D) = "white" {}
		[NoScaleOffset][Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		[Toggle]_Normal("Normal", Float) = 0
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_LeavesRimColor("Leaves Rim Color", Color) = (0.3124955,0.4842767,0.2695502)
		_LeavesRimYPosition("Leaves Rim Y Position", Range( 0 , 2)) = 0.5
		_LeavesRimBias("Leaves Rim Bias", Range( 0 , 1)) = 0
		_LeavesRimPower("Leaves Rim Power", Range( 0 , 5)) = 3
		[Toggle]_FresnelInvert("Fresnel Invert", Float) = 0
		_LeavesRimScale("Leaves Rim Scale", Range( 0 , 5)) = 1
		_LeavesRimYContrast("Leaves Rim Y Contrast", Range( 0 , 5)) = 1
		[Toggle]_LeavesRim("Leaves Rim", Float) = 0
		[Toggle]_LeavesSpecular("Leaves Specular", Float) = 0
		_ClipThreshold("Clip Threshold", Range( 0 , 1)) = 0.2
		[Gamma]_CardSize("CardSize", Range( 0 , 3)) = 1
		_Inflate("Inflate", Range( -3 , 4)) = -3
		_CardRotate("CardRotate", Range( -360 , 360)) = -360
		_WindIntensity("Wind Intensity", Range( 0 , 1)) = 1
		[Toggle]_WindToggle("WindToggle", Float) = 0
		[NoScaleOffset]_NoiseTxtA("NoiseTxtA", 2D) = "white" {}
		[NoScaleOffset]_NoiseTxtB("NoiseTxtB", 2D) = "white" {}
		_SpeedTypeBX("Speed TypeBX", Float) = 1
		_SpeedTypeAX("Speed TypeAX", Float) = 1
		_TileTypeAX("Tile TypeAX", Float) = 4
		_WindSpeed("Wind Speed", Range( 0 , 10)) = 1
		_TileTypeAY("Tile TypeAY", Float) = 4
		_SpeedTypeAY("Speed TypeAY", Float) = 1
		_SpeedTypeBY("Speed TypeBY", Float) = 1
		_TileTypeBY("Tile TypeBY", Float) = 4
		_TileTypeBX("Tile TypeBX", Float) = 4
		[Toggle]_RandomRotate("RandomRotate", Float) = 0
		[HideInInspector][Enum(On,1,Off,0)]_AlphaAntiAliasing("AlphaAntiAliasing", Int) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.4
		[Toggle]_SurfaceFoilage("Surface Foilage", Float) = 0
		_SurfaceFoilageIntensity("Surface Foilage Intensity", Range( 0 , 1)) = 1
		_TextureRotate("Texture Rotate", Range( 0 , 360)) = 0
		[HideInInspector][Enum(Repeat,0,Clamp,1,Mirror,2,Mirror Once,3,Per Axis,4)]_TextureWrapMode("Texture Wrap Mode", Int) = 0
		_NoiseFreqB("NoiseFreqB", Float) = 1
		_NoiseFreqA("NoiseFreqA", Float) = 1
		[HideInInspector]_FoilageSetting("FoilageSetting", Int) = 0
		[Toggle]_CustomNoiseTypeA("CustomNoiseTypeA", Float) = 0
		_OverForce("OverForce", Range( 0 , 1)) = 0.5
		[Toggle]_CustomNoiseTypeB("CustomNoiseTypeB", Float) = 0
		[HideInInspector]_NoiseAFold("NoiseAFold", Int) = 0
		[HideInInspector]_NoiseBFold("NoiseBFold", Int) = 0
		_TypeAIntensity("TypeAIntensity", Range( 0 , 1)) = 1
		_TypeBIntensity("TypeBIntensity", Range( 0 , 1)) = 1
		[Toggle]_TypeANeg("TypeANeg", Float) = 0
		[Toggle]_TypeBNeg("TypeBNeg", Float) = 0
		_TRDirec("TRDirec", Range( 0 , 1)) = 0.9
		_TRScattering("TRScattering", Range( 1 , 50)) = 2
		_Translucency("Translucency", Range( 0 , 1)) = 0
		_TRNormDist("TRNormDist", Range( 0 , 1)) = 0.5
		_TRStrength("TRStrength", Range( 0 , 50)) = 1
		_TRAmbient("TRAmbient", Range( 0 , 1)) = 0.1
		_Transmission("Transmission", Range( 0 , 1)) = 0
		_TRShadow("TRShadow", Range( 0 , 1)) = 0.5
		[HideInInspector]_ShadowThreshold("ShadowThreshold", Range( 0 , 1)) = 0.5
		[HideInInspector]_TransmissionShadow("Transmission Shadow", Range( 0 , 1)) = 0.5
		[HideInInspector]_CheckDef("CheckDef", Int) = 0
		[HideInInspector]_CheckTranslucent("CheckTranslucent", Int) = 0
		[HideInInspector]_CheckBase("CheckBase", Int) = 0
		[Toggle]_NoiseTypeA("NoiseTypeA", Float) = 1
		[Toggle]_NoiseTypeB("NoiseTypeB", Float) = 1
		_TileSize("TileSize", Range( 1 , 4)) = 1
		_RandomSize("RandomSize", Float) = 5
		[KeywordEnum(Red,Green,Blue,Alpha,Luma)] _AlphaChannel("AlphaChannel", Float) = 4
		_TransmissionColor("Transmission Color", Color) = (1,1,1)
		_TranslucentColor("Translucent Color", Color) = (1,1,1)
		[Toggle]_TransmisTog("TransmisTog", Float) = 0
		[Toggle]_TranslucTog("TranslucTog", Float) = 0


		_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
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
		AlphaToMask [_AlphaAntiAliasing]

		

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

			Blend One Zero
			ZWrite On
			ZTest Less
			Offset 0,0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;
			sampler2D _NormalMap;
			sampler2D _LeavesSpecTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.tangentOS.xyz ) * v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord8.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float4 lerpResult18 = lerp( float4( _LeavesColor , 0.0 ) , ( float4( _LeavesColor , 0.0 ) * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 RF_LeavesAlbedo22 = lerpResult18;
				
				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, RF_LeafUV315 ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 RF_NewObjectNormal27 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				
				float RF_Zero59 = 0.0;
				float3 temp_cast_3 = (RF_Zero59).xxx;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal32 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				float3 worldNormal32 = normalize( float3(dot(tanToWorld0,tanNormal32), dot(tanToWorld1,tanNormal32), dot(tanToWorld2,tanNormal32)) );
				float3 RF_NewNormals26 = worldNormal32;
				float fresnelNdotV40 = dot( normalize( RF_NewNormals26 ), WorldViewDirection );
				float fresnelNode40 = ( _LeavesRimBias + _LeavesRimScale * pow( max( 1.0 - fresnelNdotV40 , 0.0001 ), _LeavesRimPower ) );
				float4 temp_cast_4 = (IN.ase_texcoord9.xyz.y).xxxx;
				float3 RF_LeavesRim36 = (( _LeavesRim )?( ( _LeavesRimColor * saturate( (( _FresnelInvert )?( ( 1.0 - fresnelNode40 ) ):( fresnelNode40 )) ) * saturate( ( (0.0 + (CalculateContrast(_LeavesRimYContrast,temp_cast_4).g - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _LeavesRimYPosition ) ) ) ):( temp_cast_3 ));
				
				float3 temp_cast_5 = (RF_Zero59).xxx;
				float3 RF_LeavesSpecular15 = (( _LeavesSpecular )?( ( _LeavesSpecColor * tex2D( _LeavesSpecTexture, RF_LeafUV315 ).rgb * _LeavesSpecIntensity ) ):( temp_cast_5 ));
				
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				
				float3 RF_Transmission579 = (( _TransmisTog )?( ( _TransmissionColor * _Transmission ) ):( float3( 0,0,0 ) ));
				
				float3 RF_Translucency580 = (( _TranslucTog )?( ( _TranslucentColor * _Translucency ) ):( float3( 0,0,0 ) ));
				

				float3 BaseColor = RF_LeavesAlbedo22.rgb;
				float3 Normal = RF_NewObjectNormal27;
				float3 Emission = RF_LeavesRim36;
				float3 Specular = RF_LeavesSpecular15;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = RF_Transmission579;
				float3 Translucency = RF_Translucency580;

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
					float shadow = _TRShadow;
					float normal = _TRNormDist;
					float scattering = _TRScattering;
					float direct = _TRDirec;
					float ambient = _TRAmbient;
					float strength = _TRStrength;

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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;
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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord3.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord3.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;

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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;
			sampler2D _NormalMap;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.texcoord0.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.texcoord0.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.texcoord0.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord5.xyz = ase_worldTangent;
				o.ase_texcoord6.xyz = ase_worldNormal;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_texcoord8 = v.positionOS;
				
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

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord4.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float4 lerpResult18 = lerp( float4( _LeavesColor , 0.0 ) , ( float4( _LeavesColor , 0.0 ) * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 RF_LeavesAlbedo22 = lerpResult18;
				
				float RF_Zero59 = 0.0;
				float3 temp_cast_3 = (RF_Zero59).xxx;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, RF_LeafUV315 ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal32 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				float3 worldNormal32 = normalize( float3(dot(tanToWorld0,tanNormal32), dot(tanToWorld1,tanNormal32), dot(tanToWorld2,tanNormal32)) );
				float3 RF_NewNormals26 = worldNormal32;
				float fresnelNdotV40 = dot( normalize( RF_NewNormals26 ), ase_worldViewDir );
				float fresnelNode40 = ( _LeavesRimBias + _LeavesRimScale * pow( max( 1.0 - fresnelNdotV40 , 0.0001 ), _LeavesRimPower ) );
				float4 temp_cast_4 = (IN.ase_texcoord8.xyz.y).xxxx;
				float3 RF_LeavesRim36 = (( _LeavesRim )?( ( _LeavesRimColor * saturate( (( _FresnelInvert )?( ( 1.0 - fresnelNode40 ) ):( fresnelNode40 )) ) * saturate( ( (0.0 + (CalculateContrast(_LeavesRimYContrast,temp_cast_4).g - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _LeavesRimYPosition ) ) ) ):( temp_cast_3 ));
				
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				float3 BaseColor = RF_LeavesAlbedo22.rgb;
				float3 Emission = RF_LeavesRim36;
				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;

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

			Blend One Zero
			ZWrite On
			ZTest Less
			Offset 0,0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord2.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float4 lerpResult18 = lerp( float4( _LeavesColor , 0.0 ) , ( float4( _LeavesColor , 0.0 ) * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 RF_LeavesAlbedo22 = lerpResult18;
				
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				float3 BaseColor = RF_LeavesAlbedo22.rgb;
				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;

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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _NormalMap;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.tangentOS.xyz ) * v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord5.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, RF_LeafUV315 ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 RF_NewObjectNormal27 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				float3 Normal = RF_NewObjectNormal27;
				float Alpha = RF_LeavesAlpha561;
				float AlphaClipThreshold = RF_ClipThr583;

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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				surfaceDescription.Alpha = RF_LeavesAlpha561;
				surfaceDescription.AlphaClipThreshold = RF_ClipThr583;

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
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _NORMAL_DROPOFF_TS 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _ALPHACHANNEL_RED _ALPHACHANNEL_GREEN _ALPHACHANNEL_BLUE _ALPHACHANNEL_ALPHA _ALPHACHANNEL_LUMA


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float3 _LeavesRimColor;
			float3 _LeavesColor;
			float3 _LeavesSpecColor;
			float3 _TranslucentColor;
			float3 _TransmissionColor;
			float _TransmisTog;
			float _CustomNoiseTypeB;
			float _SpeedTypeBX;
			float _SpeedTypeBY;
			float _TileTypeBX;
			float _TileTypeBY;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TranslucTog;
			float _TileSize;
			float _Normal;
			float _NormalScale;
			float _TypeBNeg;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _Transmission;
			float _LeavesSpecIntensity;
			float _Smoothness;
			float _ClipThreshold;
			float _LeavesRim;
			int _TextureWrapMode;
			float _TypeBIntensity;
			float _NoiseFreqA;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			int _CheckBase;
			int _CheckDef;
			float _TextureRotate;
			float _TRStrength;
			float _TRNormDist;
			float _TRScattering;
			float _TRDirec;
			float _TRAmbient;
			float _TRShadow;
			int _CheckTranslucent;
			float _WindToggle;
			float _SurfaceFoilage;
			float _TileTypeAY;
			float _TileTypeAX;
			float _SpeedTypeAY;
			float _SpeedTypeAX;
			float _WindSpeed;
			float _CustomNoiseTypeA;
			float _NoiseTypeB;
			float _TypeANeg;
			float _NoiseTypeA;
			float _WindIntensity;
			float _CardRotate;
			float _RandomRotate;
			float _SurfaceFoilageIntensity;
			float _RandomSize;
			float _TypeAIntensity;
			float _Translucency;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 appendResult469 = (float3(temp_output_102_0 , 0.0));
				float simplePerlin3D503 = snoise( float3( temp_output_102_0 ,  0.0 )*_RandomSize );
				simplePerlin3D503 = simplePerlin3D503*0.5 + 0.5;
				float3 temp_cast_1 = (simplePerlin3D503).xxx;
				float dotResult554 = dot( temp_cast_1 , v.normalOS );
				float3 temp_cast_2 = (dotResult554).xxx;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal539 = temp_cast_2;
				float3 worldNormal539 = normalize( float3(dot(tanToWorld0,tanNormal539), dot(tanToWorld1,tanNormal539), dot(tanToWorld2,tanNormal539)) );
				float3 lerpResult138 = lerp( appendResult469 , worldNormal539 , (-1.0 + (_SurfaceFoilageIntensity - 0.0) * (0.25 - -1.0) / (1.0 - 0.0)));
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float dotResult378 = dot( temp_cast_4 , ase_vertexBitangent );
				float cos105 = cos( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float sin105 = sin( (( _RandomRotate )?( dotResult378 ):( temp_output_103_0 )) );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( appendResult469 )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float RF_One57 = 1.0;
				float4 temp_cast_7 = (RF_One57).xxxx;
				float4 temp_cast_8 = (( 1.0 - _TypeAIntensity )).xxxx;
				float mulTime75 = _TimeParameters.x * ( _WindSpeed * 0.1 );
				float3 temp_cast_9 = (mulTime75).xxx;
				float2 appendResult216 = (float2(_SpeedTypeAX , _SpeedTypeAY));
				float2 appendResult85 = (float2(_TileTypeAX , _TileTypeAY));
				float3 temp_output_83_0 = ( v.positionOS.xyz + mulTime75 );
				float3 temp_output_202_0 = saturate( temp_output_83_0 );
				float2 texCoord84 = v.ase_texcoord.xy * appendResult85 + temp_output_202_0.xy;
				float2 panner88 = ( ( v.positionOS.xyz - temp_cast_9 ).x * appendResult216 + texCoord84);
				float simplePerlin2D163 = snoise( panner88*_NoiseFreqA );
				float4 temp_cast_12 = (simplePerlin2D163).xxxx;
				float4 temp_cast_13 = (simplePerlin2D163).xxxx;
				float4 temp_cast_14 = (RF_One57).xxxx;
				float4 temp_cast_15 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (simplePerlin2D166).xxxx;
				float4 temp_cast_20 = (0.0).xxxx;
				float4 temp_cast_21 = (1.0).xxxx;
				float4 temp_cast_22 = (0.1).xxxx;
				float4 temp_cast_23 = ((0.001 + (_OverForce - 0.0) * (0.2 - 0.001) / (1.0 - 0.0))).xxxx;
				float4 RF_FoilageWind104 = (temp_cast_22 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( saturate( (( _NoiseTypeA )?( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) ):( temp_cast_7 )) ) * saturate( (( _NoiseTypeB )?( ( temp_cast_15 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_19 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) )) * _TypeBIntensity ) ) ):( temp_cast_14 )) ) ) ) - temp_cast_20) * (temp_cast_23 - temp_cast_22) / (temp_cast_21 - temp_cast_20));
				float4 normalizeResult115 = normalize( mul( mul( (( _WindToggle )?( ( float4( rotator105, 0.0 , 0.0 ) + saturate( RF_FoilageWind104 ) ) ):( float4( rotator105, 0.0 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 RF_Foilage124 = lerpResult123;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = RF_Foilage124.rgb;

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

				float2 appendResult314 = (float2(_TileSize , _TileSize));
				float2 texCoord146 = IN.ase_texcoord.xy * appendResult314 + float2( 0,0 );
				float2 RF_LeafUV315 = texCoord146;
				float4 tex2DNode21 = tex2D( _LeavesTexture, RF_LeafUV315 );
				float luminance563 = Luminance(tex2DNode21.rgb);
				#if defined( _ALPHACHANNEL_RED )
				float staticSwitch562 = tex2DNode21.r;
				#elif defined( _ALPHACHANNEL_GREEN )
				float staticSwitch562 = tex2DNode21.g;
				#elif defined( _ALPHACHANNEL_BLUE )
				float staticSwitch562 = tex2DNode21.b;
				#elif defined( _ALPHACHANNEL_ALPHA )
				float staticSwitch562 = tex2DNode21.a;
				#elif defined( _ALPHACHANNEL_LUMA )
				float staticSwitch562 = luminance563;
				#else
				float staticSwitch562 = luminance563;
				#endif
				float RF_LeavesAlpha561 = staticSwitch562;
				
				float RF_ClipThr583 = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
				

				surfaceDescription.Alpha = RF_LeavesAlpha561;
				surfaceDescription.AlphaClipThreshold = RF_ClipThr583;

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
	
	CustomEditor "BFoilageEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19600
Node;AmplifyShaderEditor.CommentaryNode;70;-7808,-512;Inherit;False;4495.252;842.5948;Foilage Wind;62;104;183;185;187;186;184;101;98;97;253;250;93;252;251;248;245;242;263;262;243;261;260;168;167;226;225;166;163;165;164;92;94;89;88;86;84;212;219;216;220;202;85;87;218;221;217;82;81;80;83;79;78;75;73;72;287;288;290;291;306;369;370;;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-7760,0;Inherit;False;Property;_WindSpeed;Wind Speed;29;0;Create;True;0;0;0;True;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-7488,0;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;75;-7344,0;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;78;-7344,-160;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;83;-7088,-160;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;80;-7136,-288;Inherit;False;Property;_TileTypeAY;Tile TypeAY;30;0;Create;True;0;0;0;True;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-7136,-368;Inherit;False;Property;_TileTypeAX;Tile TypeAX;28;0;Create;True;0;0;0;True;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-7136,80;Inherit;False;Property;_TileTypeBX;Tile TypeBX;34;0;Create;True;0;0;0;True;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;82;-7136,160;Inherit;False;Property;_TileTypeBY;Tile TypeBY;33;0;Create;True;0;0;0;True;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;87;-6960,96;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;85;-6960,-336;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;202;-6960,-160;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-6784,-416;Inherit;False;Property;_SpeedTypeAX;Speed TypeAX;27;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;-6784,-336;Inherit;False;Property;_SpeedTypeAY;Speed TypeAY;31;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-6784,160;Inherit;False;Property;_SpeedTypeBX;Speed TypeBX;26;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-6784,240;Inherit;False;Property;_SpeedTypeBY;Speed TypeBY;32;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;216;-6608,-384;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;219;-6608,192;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;84;-6784,-208;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;-6784,-32;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;212;-7104,-48;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode;88;-6448,-208;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;89;-6448,-16;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-6448,-304;Inherit;False;Property;_NoiseFreqA;NoiseFreqA;43;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-6448,128;Inherit;False;Property;_NoiseFreqB;NoiseFreqB;42;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;94;-6016,-48;Inherit;True;Property;_NoiseTxtB;NoiseTxtB;25;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;c662692ad44de0b45ba4f81297e97381;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;92;-6016,-240;Inherit;True;Property;_NoiseTxtA;NoiseTxtA;24;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;7ec7052ce3ab6a945ad73485b22020ef;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.PowerNode;225;-5712,-240;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;226;-5712,-48;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;163;-6256,-384;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;166;-6256,64;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;167;-5536,-240;Inherit;False;Property;_CustomNoiseTypeA;CustomNoiseTypeA;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;168;-5536,-48;Inherit;False;Property;_CustomNoiseTypeB;CustomNoiseTypeB;47;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;55;-4128,-1104;Inherit;False;776.02;552.0175;Local Vars;14;222;223;127;161;56;58;60;156;61;59;57;279;280;591;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NegateNode;260;-5296,-160;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;261;-5296,32;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;262;-5152,-240;Inherit;False;Property;_TypeANeg;TypeANeg;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;263;-5136,-48;Inherit;False;Property;_TypeBNeg;TypeBNeg;53;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;242;-5200,-320;Inherit;False;Property;_TypeAIntensity;TypeAIntensity;50;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-5200,112;Inherit;False;Property;_TypeBIntensity;TypeBIntensity;51;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-4064,-1056;Inherit;False;Constant;_One1;[One];20;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;-4912,-48;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;248;-4896,-240;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;251;-4896,-320;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;252;-4912,64;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-3856,-1056;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;250;-4736,-320;Inherit;True;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;290;-4720,-416;Inherit;False;57;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;291;-4720,176;Inherit;False;57;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;253;-4736,-48;Inherit;True;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;71;-7808,-1264;Inherit;False;3666.037;727.1916;Foilage;37;99;513;102;555;469;503;554;539;138;139;556;124;123;122;121;119;120;115;116;118;117;483;114;113;110;131;109;108;105;304;136;100;107;378;103;91;90;;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;288;-4496,-80;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;68;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;287;-4496,-320;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;67;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;99;-7776,-1200;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;370;-4288,-128;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;369;-4288,-208;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-4432,-432;Inherit;False;Property;_WindIntensity;Wind Intensity;22;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;102;-7552,-1200;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;-1,-1;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;513;-7552,-1024;Inherit;False;Property;_RandomSize;RandomSize;70;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;97;-4128,-384;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-4144,-208;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-4240,256;Inherit;False;Property;_OverForce;OverForce;46;0;Create;True;0;0;0;True;0;False;0.5;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;503;-7360,-1088;Inherit;False;Simplex3D;True;False;2;0;FLOAT3;3,3,0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;555;-7328,-976;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;187;-4112,176;Inherit;False;Constant;_MinNew;MinNew;43;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;186;-4112,96;Inherit;False;Constant;_MaxOld;MaxOld;43;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;306;-3904,160;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.001;False;4;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-3888,-384;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;184;-4112,16;Inherit;False;Constant;_MinOld;MinOld;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-7024,-784;Inherit;False;Property;_CardRotate;CardRotate;21;0;Create;True;0;0;0;True;0;False;-360;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-7136,-880;Inherit;False;Property;_SurfaceFoilageIntensity;Surface Foilage Intensity;39;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;554;-7136,-1056;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;183;-3728,-384;Inherit;False;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;103;-6752,-784;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;556;-6832,-960;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;469;-7296,-1200;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BitangentVertexDataNode;91;-6816,-704;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;539;-7008,-1072;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;104;-3536,-384;Inherit;False;RF_FoilageWind;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;138;-6640,-1120;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;378;-6592,-720;Inherit;False;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;-6208,-1056;Inherit;False;104;RF_FoilageWind;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;100;-6464,-784;Inherit;False;Property;_RandomRotate;RandomRotate;35;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;136;-6400,-1200;Inherit;False;Property;_SurfaceFoilage;Surface Foilage;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;304;-6000,-1056;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;105;-6176,-1200;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;17;-7808,-1744;Inherit;False;2026.265;458.4531;Leaf Base Settings;17;315;314;312;20;22;18;19;65;21;143;146;145;144;317;561;562;563;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-7792,-1696;Inherit;False;Property;_TileSize;TileSize;69;0;Create;True;0;0;0;True;0;False;1;1;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-5840,-1136;Inherit;True;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;314;-7504,-1696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;110;-5600,-1200;Inherit;False;Property;_WindToggle;WindToggle;23;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewMatrixNode;109;-5504,-1088;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;146;-7312,-1696;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;-5376,-1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;131;-5600,-1008;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-5328,-848;Inherit;False;Property;_Inflate;Inflate;20;0;Create;True;0;0;0;True;0;False;-3;0;-3;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;315;-6896,-1664;Inherit;False;RF_LeafUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;483;-5184,-1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;117;-5040,-848;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;118;-5040,-1008;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;116;-5136,-1088;Inherit;False;Property;_CardSize;CardSize;19;1;[Gamma];Create;True;0;0;0;True;0;False;1;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;317;-6944,-1472;Inherit;False;315;RF_LeafUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NormalizeNode;115;-5008,-1200;Inherit;False;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-4832,-1008;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-4848,-1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;21;-6752,-1504;Inherit;True;Property;_LeavesTexture;Leaves Texture;5;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;607961a1ca5e345479b3fa76c399d67f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;121;-4672,-1200;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;122;-4832,-896;Inherit;False;Property;_EffectBlend;EffectBlend;0;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LuminanceNode;563;-6464,-1472;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-3680,960;Inherit;False;Property;_ClipThreshold;Clip Threshold;18;0;Create;True;0;0;0;True;0;False;0.2;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;123;-4528,-1200;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;562;-6272,-1440;Inherit;False;Property;_AlphaChannel;AlphaChannel;71;0;Create;True;0;0;0;False;0;False;0;4;4;True;;KeywordEnum;5;Red;Green;Blue;Alpha;Luma;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;68;-3392,960;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;594;-3312,-1296;Inherit;False;612;738.6667;Comment;9;566;567;572;573;570;571;574;268;585;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-5904,384;Inherit;False;1317.03;536.3784;Normals;8;32;31;30;29;28;27;26;319;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-5760,-1648;Inherit;False;1372.459;359.8992;Leaves Specular Settings;8;13;318;63;14;12;15;64;11;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;34;-7808,384;Inherit;False;1870.647;777.5897;Leaves Rim Settings;21;36;54;62;52;51;50;49;48;47;46;45;44;43;42;41;40;39;38;37;35;160;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;124;-4352,-1200;Inherit;False;RF_Foilage;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;561;-6016,-1408;Inherit;False;RF_LeavesAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;583;-3200,960;Inherit;False;RF_ClipThr;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-6016,-1504;Inherit;False;RF_LeavesTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;319;-5776,480;Inherit;False;315;RF_LeafUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-5872,560;Float;False;Property;_NormalScale;Normal Scale;8;0;Create;False;0;0;0;True;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;31;-5536,688;Inherit;False;Normal Reconstruct Z;-1;;142;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;28;-5584,464;Inherit;True;Property;_NormalMap;Normal Map;6;2;[NoScaleOffset];[Normal];Create;False;1;Normal Controls;0;0;True;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;30;-5280,464;Inherit;False;Property;_Normal;Normal;7;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;-4864,560;Inherit;False;RF_NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;41;-6752,624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;43;-7120,704;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;50;-6752,848;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;40;-7376,624;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-6336,-1616;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;267;-4128,-1408;Inherit;False;407.0667;288.8;Extra Notlar;Extra Notlar;1,0.901033,0,1;Receive Shadow Shader üzerinden çalışmıyor (Ayrı bir shader yapılabilir)$$Aynı shader'ın grass için düzenlenmişini yap$(üst vertex hareket ederken alt vertexler durur)$;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-5008,-1472;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-6912,848;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;46;-7104,848;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;45;-7232,848;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PosVertexDataNode;48;-7664,848;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-6528,576;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-6144,544;Inherit;False;RF_LeavesRim;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;59;-3856,-976;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-3856,-896;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-4624,-1520;Inherit;False;RF_LeavesSpecular;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;18;-6176,-1680;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.5,0.5,0.5,1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;63;-5024,-1568;Inherit;False;59;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;-5712,-1552;Inherit;False;315;RF_LeafUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;143;-7136,-1536;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;145;-7296,-1504;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-5296,-1376;Inherit;False;Property;_LeavesSpecIntensity;Leaves Spec Intensity;4;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;14;-5232,-1600;Inherit;False;Property;_LeavesSpecColor;Leaves Spec Color;2;0;Create;True;0;0;0;True;0;False;1,1,1,1;1,1,1,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;64;-4848,-1520;Inherit;False;Property;_LeavesSpecular;Leaves Specular;17;0;Create;False;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;13;-5520,-1568;Inherit;True;Property;_LeavesSpecTexture;Leaves Spec Texture;1;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;20;-6576,-1680;Inherit;False;Property;_LeavesColor;Leaves Color;3;0;Create;True;0;0;0;True;0;False;0.3193329,0.4654087,0.1653811,1;0.3193329,0.4654087,0.1653811,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;144;-7584,-1504;Inherit;False;Property;_TextureRotate;Texture Rotate;40;0;Create;True;0;0;0;True;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;52;-6816,464;Inherit;False;Property;_LeavesRimColor;Leaves Rim Color;9;0;Create;True;0;0;0;True;0;False;0.3124955,0.4842767,0.2695502,1;0.3124955,0.4842767,0.2695502,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;47;-7200,1072;Inherit;False;Property;_LeavesRimYPosition;Leaves Rim Y Position;10;0;Create;True;0;0;0;True;0;False;0.5;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-7680,608;Inherit;False;Property;_LeavesRimBias;Leaves Rim Bias;11;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-7680,688;Inherit;False;Property;_LeavesRimScale;Leaves Rim Scale;14;0;Create;True;0;0;0;True;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-7680,768;Inherit;False;Property;_LeavesRimPower;Leaves Rim Power;12;0;Create;True;0;0;0;True;0;False;3;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-7760,992;Inherit;False;Property;_LeavesRimYContrast;Leaves Rim Y Contrast;15;0;Create;True;0;0;0;True;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;54;-6368,544;Inherit;False;Property;_LeavesRim;Leaves Rim;16;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-4064,-976;Inherit;False;Constant;_Zero1;[Zero];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-4064,-896;Inherit;False;Constant;_Gray;[Gray];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;127;-4096,-800;Inherit;False;Property;_AlphaAntiAliasing;AlphaAntiAliasing;36;2;[HideInInspector];[Enum];Create;False;0;2;On;1;Off;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;161;-4080,-720;Inherit;False;Property;_FoilageSetting;FoilageSetting;44;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;156;-3856,-800;Inherit;False;Property;_TextureWrapMode;Texture Wrap Mode;41;2;[HideInInspector];[Enum];Create;True;0;5;Repeat;0;Clamp;1;Mirror;2;Mirror Once;3;Per Axis;4;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;222;-3840,-720;Inherit;False;Property;_NoiseAFold;NoiseAFold;48;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;223;-3840,-640;Inherit;False;Property;_NoiseBFold;NoiseBFold;49;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;42;-6976,624;Inherit;False;Property;_FresnelInvert;Fresnel Invert;13;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-6016,-1680;Inherit;False;RF_LeavesAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;62;-6560,480;Inherit;False;59;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;44;-7456,848;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;160;-7584,512;Inherit;False;26;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-4832,464;Float;False;RF_NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;32;-5056,432;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;16;-2464,-688;Inherit;False;15;RF_LeavesSpecular;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-2464,-848;Inherit;False;27;RF_NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;23;-2432,-928;Inherit;False;22;RF_LeavesAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-2496,-608;Inherit;False;Property;_Smoothness;Smoothness;37;0;Create;True;0;0;0;True;0;False;0.4;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-2432,-528;Inherit;False;561;RF_LeavesAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;53;-2432,-768;Inherit;False;36;RF_LeavesRim;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;582;-2432,-272;Inherit;False;579;RF_Transmission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;581;-2432,-192;Inherit;False;580;RF_Translucency;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;125;-2400,-112;Inherit;False;124;RF_Foilage;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;584;-2416,-448;Inherit;False;583;RF_ClipThr;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;586;-2464,-368;Inherit;False;585;RF_ClipShadowThr;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;279;-3584,-976;Inherit;False;Property;_CheckDef;CheckDef;64;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;280;-3600,-896;Inherit;False;Property;_CheckBase;CheckBase;66;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;591;-3616,-1056;Inherit;False;Property;_CheckTranslucent;CheckTranslucent;65;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;265;-3712,576;Inherit;False;Property;_Transmission;Transmission;60;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;575;-3648,416;Inherit;False;Property;_TransmissionColor;Transmission Color;72;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;569;-3712,832;Inherit;False;Property;_Translucency;Translucency;56;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;577;-3424,512;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;578;-3424,736;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;576;-3648,672;Inherit;False;Property;_TranslucentColor;Translucent Color;73;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;592;-3280,512;Inherit;False;Property;_TransmisTog;TransmisTog;74;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;593;-3280,736;Inherit;False;Property;_TranslucTog;TranslucTog;75;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;579;-2944,512;Inherit;False;RF_Transmission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;580;-2944,736;Inherit;False;RF_Translucency;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;566;-3264,-1072;Inherit;False;Property;_TRStrength;TRStrength;58;0;Create;True;0;0;0;True;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-3264,-992;Inherit;False;Property;_TRNormDist;TRNormDist;57;0;Create;True;0;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;572;-3264,-752;Inherit;False;Property;_TRAmbient;TRAmbient;59;0;Create;True;0;0;0;True;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;573;-3264,-672;Inherit;False;Property;_TRShadow;TRShadow;61;0;Create;True;0;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;570;-3264,-912;Inherit;False;Property;_TRScattering;TRScattering;55;0;Create;True;0;0;0;True;0;False;2;0;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;571;-3264,-832;Inherit;False;Property;_TRDirec;TRDirec;54;0;Create;True;0;0;0;True;0;False;0.9;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;574;-3264,-1152;Inherit;False;Property;_TransmissionShadow;Transmission Shadow;63;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-3264,-1248;Inherit;False;Property;_ShadowThreshold;ShadowThreshold;62;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;585;-2976,-1248;Inherit;False;RF_ClipShadowThr;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;271;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;272;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;273;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;274;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;1;False;;True;False;0.28;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;275;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;276;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;277;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;278;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;270;-2080,-608;Float;False;True;-1;2;BFoilageEditor;0;19;BUDU Shaders/BFoilage;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_AlphaAntiAliasing;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;True;True;1;1;False;_SrcBlend;0;False;_DstBlend;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;0;False;_ZWrite;True;1;False;;True;False;0.28;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638528376042018992;Workflow;0;0;Surface;0;638578026725724309;  Refraction Model;0;638578026077107225;  Blend;0;638578026228409553;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;638578041536106095;Forward Only;1;638578040868571822;Transmission;1;638577976305834003;  Transmission Shadow;1,True,_TransmissionShadow;638577987560251913;Translucency;1;638577982395342203;  Translucency Strength;1,True,_TRStrength;638577981606814326;  Normal Distortion;0.5,True,_TRNormDist;638577981689840098;  Scattering;2,True,_TRScattering;638577981934106633;  Direct;0.9,True,_TRDirec;638577982082727268;  Ambient;0.1,True,_TRAmbient;638577982160479952;  Shadow;0.5,True,_TRShadow;638577982229763843;Cast Shadows;1;638578016555153219;  Use Shadow Threshold;0;638578040635660930;Receive Shadows;1;638578040723582946;Receive SSAO;1;638578023917834202;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;1;638578025476917209;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;638578025415237502;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;638577906205185167;Debug Display;0;638578015297656221;Clear Coat;0;638578027369663984;0;10;False;True;True;True;True;True;True;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;269;-2048,-160;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
WireConnection;73;0;72;0
WireConnection;75;0;73;0
WireConnection;83;0;78;0
WireConnection;83;1;75;0
WireConnection;87;0;81;0
WireConnection;87;1;82;0
WireConnection;85;0;79;0
WireConnection;85;1;80;0
WireConnection;202;0;83;0
WireConnection;216;0;217;0
WireConnection;216;1;218;0
WireConnection;219;0;220;0
WireConnection;219;1;221;0
WireConnection;84;0;85;0
WireConnection;84;1;202;0
WireConnection;86;0;87;0
WireConnection;86;1;202;0
WireConnection;212;0;78;0
WireConnection;212;1;75;0
WireConnection;88;0;84;0
WireConnection;88;2;216;0
WireConnection;88;1;212;0
WireConnection;89;0;86;0
WireConnection;89;2;219;0
WireConnection;89;1;83;0
WireConnection;94;1;89;0
WireConnection;92;1;88;0
WireConnection;225;0;92;0
WireConnection;226;0;94;0
WireConnection;163;0;88;0
WireConnection;163;1;164;0
WireConnection;166;0;89;0
WireConnection;166;1;165;0
WireConnection;167;0;163;0
WireConnection;167;1;225;0
WireConnection;168;0;166;0
WireConnection;168;1;226;0
WireConnection;260;0;167;0
WireConnection;261;0;168;0
WireConnection;262;0;167;0
WireConnection;262;1;260;0
WireConnection;263;0;168;0
WireConnection;263;1;261;0
WireConnection;245;0;263;0
WireConnection;245;1;243;0
WireConnection;248;0;262;0
WireConnection;248;1;242;0
WireConnection;251;0;242;0
WireConnection;252;0;243;0
WireConnection;57;0;56;0
WireConnection;250;0;251;0
WireConnection;250;1;248;0
WireConnection;253;0;252;0
WireConnection;253;1;245;0
WireConnection;288;0;291;0
WireConnection;288;1;253;0
WireConnection;287;0;290;0
WireConnection;287;1;250;0
WireConnection;370;0;288;0
WireConnection;369;0;287;0
WireConnection;102;0;99;0
WireConnection;97;0;93;0
WireConnection;98;0;369;0
WireConnection;98;1;370;0
WireConnection;503;0;102;0
WireConnection;503;1;513;0
WireConnection;306;0;185;0
WireConnection;101;0;97;0
WireConnection;101;1;98;0
WireConnection;554;0;503;0
WireConnection;554;1;555;0
WireConnection;183;0;101;0
WireConnection;183;1;184;0
WireConnection;183;2;186;0
WireConnection;183;3;187;0
WireConnection;183;4;306;0
WireConnection;103;0;90;0
WireConnection;556;0;139;0
WireConnection;469;0;102;0
WireConnection;539;0;554;0
WireConnection;104;0;183;0
WireConnection;138;0;469;0
WireConnection;138;1;539;0
WireConnection;138;2;556;0
WireConnection;378;0;103;0
WireConnection;378;1;91;0
WireConnection;100;0;103;0
WireConnection;100;1;378;0
WireConnection;136;0;469;0
WireConnection;136;1;138;0
WireConnection;304;0;107;0
WireConnection;105;0;136;0
WireConnection;105;2;100;0
WireConnection;108;0;105;0
WireConnection;108;1;304;0
WireConnection;314;0;312;0
WireConnection;314;1;312;0
WireConnection;110;0;105;0
WireConnection;110;1;108;0
WireConnection;146;0;314;0
WireConnection;113;0;110;0
WireConnection;113;1;109;0
WireConnection;315;0;146;0
WireConnection;483;0;113;0
WireConnection;483;1;131;0
WireConnection;117;0;114;0
WireConnection;115;0;483;0
WireConnection;120;0;118;0
WireConnection;120;1;117;0
WireConnection;119;0;115;0
WireConnection;119;1;116;0
WireConnection;21;1;317;0
WireConnection;121;0;119;0
WireConnection;121;1;120;0
WireConnection;563;0;21;5
WireConnection;123;1;121;0
WireConnection;123;2;122;0
WireConnection;562;1;21;1
WireConnection;562;0;21;2
WireConnection;562;2;21;3
WireConnection;562;3;21;4
WireConnection;562;4;563;0
WireConnection;68;0;67;0
WireConnection;124;0;123;0
WireConnection;561;0;562;0
WireConnection;583;0;68;0
WireConnection;65;0;21;0
WireConnection;28;1;319;0
WireConnection;28;5;29;0
WireConnection;30;0;31;0
WireConnection;30;1;28;0
WireConnection;27;0;30;0
WireConnection;41;0;42;0
WireConnection;43;0;40;0
WireConnection;50;0;51;0
WireConnection;40;0;160;0
WireConnection;40;1;37;0
WireConnection;40;2;38;0
WireConnection;40;3;39;0
WireConnection;19;0;20;0
WireConnection;19;1;21;0
WireConnection;11;0;14;0
WireConnection;11;1;13;5
WireConnection;11;2;12;0
WireConnection;51;0;46;0
WireConnection;51;1;47;0
WireConnection;46;0;45;1
WireConnection;45;0;44;0
WireConnection;35;0;52;0
WireConnection;35;1;41;0
WireConnection;35;2;50;0
WireConnection;36;0;54;0
WireConnection;59;0;58;0
WireConnection;61;0;60;0
WireConnection;15;0;64;0
WireConnection;18;0;20;0
WireConnection;18;1;19;0
WireConnection;143;0;146;0
WireConnection;143;2;145;0
WireConnection;145;0;144;0
WireConnection;64;0;63;0
WireConnection;64;1;11;0
WireConnection;13;1;318;0
WireConnection;54;0;62;0
WireConnection;54;1;35;0
WireConnection;42;0;40;0
WireConnection;42;1;43;0
WireConnection;22;0;18;0
WireConnection;44;1;48;2
WireConnection;44;0;49;0
WireConnection;26;0;32;0
WireConnection;32;0;30;0
WireConnection;577;0;575;0
WireConnection;577;1;265;0
WireConnection;578;0;576;0
WireConnection;578;1;569;0
WireConnection;592;1;577;0
WireConnection;593;1;578;0
WireConnection;579;0;592;0
WireConnection;580;0;593;0
WireConnection;585;0;268;0
WireConnection;270;0;23;0
WireConnection;270;1;33;0
WireConnection;270;2;53;0
WireConnection;270;9;16;0
WireConnection;270;4;128;0
WireConnection;270;6;66;0
WireConnection;270;7;584;0
WireConnection;270;14;582;0
WireConnection;270;15;581;0
WireConnection;270;8;125;0
ASEEND*/
//CHKSM=1C910D4A98CA5F1C9D16CAD211B800EF5695751E
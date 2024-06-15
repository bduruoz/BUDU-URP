// Made with Amplify Shader Editor v1.9.4.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BFoilage"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_EffectBlend("EffectBlend", Range( 0 , 1)) = 0
		_LeavesSpecTexture("Leaves Spec Texture", 2D) = "white" {}
		_LeavesSpecColor("Leaves Spec Color", Color) = (1,1,1,1)
		_LeavesColor("Leaves Color", Color) = (0.3193329,0.4654087,0.1653811,1)
		_LeavesSpecIntensity("Leaves Spec Intensity", Range( 0 , 1)) = 1
		_LeavesTexture("Leaves Texture", 2D) = "white" {}
		[Header(Normal Controls)][Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		[Toggle]_Normal("Normal", Float) = 0
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_LeavesRimColor("Leaves Rim Color", Color) = (0.3124955,0.4842767,0.2695502,1)
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
		_Inflate("Inflate", Range( -3 , 4)) = 0
		_CardRotate("CardRotate", Range( -360 , 360)) = 0
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
		_SurfaceFoilageIntensity("Surface Foilage Intensity", Range( 0 , 1)) = 0
		_TextureRotate("Texture Rotate", Range( 0 , 360)) = 0
		[HideInInspector][Enum(Repeat,0,Clamp,1,Mirror,2,Mirror Once,3,Per Axis,4)]_TextureWrapMode("Texture Wrap Mode", Int) = 0
		_NoiseFreqB("NoiseFreqB", Float) = 1
		_NoiseFreqA("NoiseFreqA", Float) = 1
		[HideInInspector]_FoilageSetting("FoilageSetting", Int) = 0
		[Toggle]_CustomNoiseTypeA("CustomNoiseTypeA", Float) = 0
		_OverForce("OverForce", Range( 0 , 1)) = 0.25
		[Toggle]_CustomNoiseTypeB("CustomNoiseTypeB", Float) = 0
		[HideInInspector]_NoiseAFold("NoiseAFold", Int) = 0
		[HideInInspector]_NoiseBFold("NoiseBFold", Int) = 0
		_TypeAIntensity("TypeAIntensity", Range( 0 , 1)) = 1
		_TypeBIntensity("TypeBIntensity", Range( 0 , 1)) = 1
		[Toggle]_TypeANeg("TypeANeg", Float) = 0
		[Toggle]_TypeBNeg("TypeBNeg", Float) = 0
		[HideInInspector]_ShadowThreshold("ShadowThreshold", Range( 0 , 1)) = 0.5
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
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite [_ZWrite]
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

			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT


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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;
			sampler2D _NormalMap;
			sampler2D _LeavesSpecTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.tangentOS.xyz ) * v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 lerpResult18 = lerp( _LeavesColor , ( _LeavesColor * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 LeavesAlbedo22 = lerpResult18;
				
				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 NewObjectNormal27 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				
				float Zero59 = 0.0;
				float4 temp_cast_1 = (Zero59).xxxx;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal32 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				float3 worldNormal32 = normalize( float3(dot(tanToWorld0,tanNormal32), dot(tanToWorld1,tanNormal32), dot(tanToWorld2,tanNormal32)) );
				float3 NewNormals26 = worldNormal32;
				float fresnelNdotV40 = dot( normalize( NewNormals26 ), WorldViewDirection );
				float fresnelNode40 = ( _LeavesRimBias + _LeavesRimScale * pow( max( 1.0 - fresnelNdotV40 , 0.0001 ), _LeavesRimPower ) );
				float4 temp_cast_2 = (IN.ase_texcoord9.xyz.y).xxxx;
				float4 LeavesRimR36 = (( _LeavesRim )?( ( _LeavesRimColor * saturate( (( _FresnelInvert )?( ( 1.0 - fresnelNode40 ) ):( fresnelNode40 )) ) * saturate( ( (0.0 + (CalculateContrast(_LeavesRimYContrast,temp_cast_2).g - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _LeavesRimYPosition ) ) * _LeavesRimColor.a ) ):( temp_cast_1 ));
				
				float4 temp_cast_4 = (Zero59).xxxx;
				float2 uv_LeavesSpecTexture = IN.ase_texcoord8.xy * _LeavesSpecTexture_ST.xy + _LeavesSpecTexture_ST.zw;
				float4 LeavesSpecularR15 = (( _LeavesSpecular )?( ( _LeavesSpecColor * tex2D( _LeavesSpecTexture, uv_LeavesSpecTexture ) * _LeavesSpecIntensity ) ):( temp_cast_4 ));
				
				float4 LeavesTextureR65 = tex2DNode21;
				

				float3 BaseColor = LeavesAlbedo22.rgb;
				float3 Normal = NewObjectNormal27;
				float3 Emission = LeavesRimR36.rgb;
				float3 Specular = LeavesSpecularR15.rgb;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;
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

				float2 texCoord146 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 LeavesTextureR65 = tex2DNode21;
				

				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 LeavesTextureR65 = tex2DNode21;
				

				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;
			sampler2D _NormalMap;


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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.texcoord0.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.texcoord0.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
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

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 lerpResult18 = lerp( _LeavesColor , ( _LeavesColor * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 LeavesAlbedo22 = lerpResult18;
				
				float Zero59 = 0.0;
				float4 temp_cast_1 = (Zero59).xxxx;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float2 uv_NormalMap = IN.ase_texcoord4.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal32 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				float3 worldNormal32 = normalize( float3(dot(tanToWorld0,tanNormal32), dot(tanToWorld1,tanNormal32), dot(tanToWorld2,tanNormal32)) );
				float3 NewNormals26 = worldNormal32;
				float fresnelNdotV40 = dot( normalize( NewNormals26 ), ase_worldViewDir );
				float fresnelNode40 = ( _LeavesRimBias + _LeavesRimScale * pow( max( 1.0 - fresnelNdotV40 , 0.0001 ), _LeavesRimPower ) );
				float4 temp_cast_2 = (IN.ase_texcoord8.xyz.y).xxxx;
				float4 LeavesRimR36 = (( _LeavesRim )?( ( _LeavesRimColor * saturate( (( _FresnelInvert )?( ( 1.0 - fresnelNode40 ) ):( fresnelNode40 )) ) * saturate( ( (0.0 + (CalculateContrast(_LeavesRimYContrast,temp_cast_2).g - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _LeavesRimYPosition ) ) * _LeavesRimColor.a ) ):( temp_cast_1 ));
				
				float4 LeavesTextureR65 = tex2DNode21;
				

				float3 BaseColor = LeavesAlbedo22.rgb;
				float3 Emission = LeavesRimR36.rgb;
				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 lerpResult18 = lerp( _LeavesColor , ( _LeavesColor * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 LeavesAlbedo22 = lerpResult18;
				
				float4 LeavesTextureR65 = tex2DNode21;
				

				float3 BaseColor = LeavesAlbedo22.rgb;
				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
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

			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _NormalMap;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.ase_texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.tangentOS.xyz ) * v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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
				float2 uv_NormalMap = IN.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 NewObjectNormal27 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				
				float2 texCoord146 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 LeavesTextureR65 = tex2DNode21;
				

				float3 Normal = NewObjectNormal27;
				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
			ZWrite [_ZWrite]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
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

			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT


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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;
			sampler2D _NormalMap;
			sampler2D _LeavesSpecTexture;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

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
			
			float4 ASESafeNormalize(float4 inVec)
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

				float2 temp_output_102_0 = (float2( -1,-1 ) + (v.texcoord.xy - float2( 0,0 )) * (float2( 1,1 ) - float2( -1,-1 )) / (float2( 1,1 ) - float2( 0,0 )));
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.tangentOS.xyz ) * v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 lerpResult18 = lerp( _LeavesColor , ( _LeavesColor * tex2DNode21 ) , float4( 0.5,0.5,0.5,1 ));
				float4 LeavesAlbedo22 = lerpResult18;
				
				float2 temp_output_1_0_g142 = float2( 0,0 );
				float dotResult4_g142 = dot( temp_output_1_0_g142 , temp_output_1_0_g142 );
				float3 appendResult10_g142 = (float3((temp_output_1_0_g142).x , (temp_output_1_0_g142).y , sqrt( ( 1.0 - saturate( dotResult4_g142 ) ) )));
				float3 normalizeResult12_g142 = normalize( appendResult10_g142 );
				float2 uv_NormalMap = IN.ase_texcoord8.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack28 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack28.z = lerp( 1, unpack28.z, saturate(_NormalScale) );
				float3 NewObjectNormal27 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				
				float Zero59 = 0.0;
				float4 temp_cast_1 = (Zero59).xxxx;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal32 = (( _Normal )?( unpack28 ):( normalizeResult12_g142 ));
				float3 worldNormal32 = normalize( float3(dot(tanToWorld0,tanNormal32), dot(tanToWorld1,tanNormal32), dot(tanToWorld2,tanNormal32)) );
				float3 NewNormals26 = worldNormal32;
				float fresnelNdotV40 = dot( normalize( NewNormals26 ), WorldViewDirection );
				float fresnelNode40 = ( _LeavesRimBias + _LeavesRimScale * pow( max( 1.0 - fresnelNdotV40 , 0.0001 ), _LeavesRimPower ) );
				float4 temp_cast_2 = (IN.ase_texcoord9.xyz.y).xxxx;
				float4 LeavesRimR36 = (( _LeavesRim )?( ( _LeavesRimColor * saturate( (( _FresnelInvert )?( ( 1.0 - fresnelNode40 ) ):( fresnelNode40 )) ) * saturate( ( (0.0 + (CalculateContrast(_LeavesRimYContrast,temp_cast_2).g - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) * _LeavesRimYPosition ) ) * _LeavesRimColor.a ) ):( temp_cast_1 ));
				
				float4 temp_cast_4 = (Zero59).xxxx;
				float2 uv_LeavesSpecTexture = IN.ase_texcoord8.xy * _LeavesSpecTexture_ST.xy + _LeavesSpecTexture_ST.zw;
				float4 LeavesSpecularR15 = (( _LeavesSpecular )?( ( _LeavesSpecColor * tex2D( _LeavesSpecTexture, uv_LeavesSpecTexture ) * _LeavesSpecIntensity ) ):( temp_cast_4 ));
				
				float4 LeavesTextureR65 = tex2DNode21;
				

				float3 BaseColor = LeavesAlbedo22.rgb;
				float3 Normal = NewObjectNormal27;
				float3 Emission = LeavesRimR36.rgb;
				float3 Specular = LeavesSpecularR15.rgb;
				float Metallic = 0;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float Alpha = LeavesTextureR65.r;
				float AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));
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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 LeavesTextureR65 = tex2DNode21;
				

				surfaceDescription.Alpha = LeavesTextureR65.r;
				surfaceDescription.AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
			float4 _LeavesSpecTexture_ST;
			float4 _LeavesSpecColor;
			float4 _LeavesColor;
			float4 _LeavesRimColor;
			float4 _NormalMap_ST;
			int _TextureWrapMode;
			float _NoiseFreqB;
			float _OverForce;
			float _CardSize;
			float _Inflate;
			float _EffectBlend;
			float _TextureRotate;
			float _Normal;
			float _LeavesRim;
			float _TileTypeBY;
			float _FresnelInvert;
			float _LeavesRimBias;
			float _LeavesRimScale;
			float _LeavesRimPower;
			float _LeavesRimYContrast;
			float _LeavesRimYPosition;
			float _LeavesSpecular;
			float _LeavesSpecIntensity;
			float _NormalScale;
			float _TileTypeBX;
			float _SpeedTypeBY;
			float _SpeedTypeBX;
			int _FoilageSetting;
			int _AlphaAntiAliasing;
			int _NoiseBFold;
			int _NoiseAFold;
			float _ShadowThreshold;
			float _WindToggle;
			float _SurfaceFoilage;
			float _SurfaceFoilageIntensity;
			float _RandomRotate;
			float _CardRotate;
			float _WindIntensity;
			float _TypeAIntensity;
			float _TypeANeg;
			float _CustomNoiseTypeA;
			float _WindSpeed;
			float _SpeedTypeAX;
			float _SpeedTypeAY;
			float _TileTypeAX;
			float _TileTypeAY;
			float _NoiseFreqA;
			float _TypeBIntensity;
			float _TypeBNeg;
			float _CustomNoiseTypeB;
			float _Smoothness;
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

			sampler2D _NoiseTxtA;
			sampler2D _NoiseTxtB;
			sampler2D _LeavesTexture;


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
			
			float4 ASESafeNormalize(float4 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
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
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToViewDir133 = normalize( mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, float3( temp_output_102_0 ,  0.0 ) ), 0 ) ).xyz );
				float3 lerpResult138 = lerp( float3( temp_output_102_0 ,  0.0 ) , tangentToViewDir133 , _SurfaceFoilageIntensity);
				float temp_output_103_0 = radians( _CardRotate );
				float3 temp_cast_4 = (temp_output_103_0).xxx;
				float3 ase_vertexBitangent = cross( v.normalOS, v.ase_tangent.xyz ) * v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float cos105 = cos( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float sin105 = sin( (( _RandomRotate )?( ( temp_output_103_0 * ase_vertexBitangent ) ):( temp_cast_4 )).x );
				float2 rotator105 = mul( (( _SurfaceFoilage )?( lerpResult138 ):( float3( temp_output_102_0 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos105 , -sin105 , sin105 , cos105 )) + float2( 0,0 );
				float3 appendResult106 = (float3(rotator105 , 0.0));
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
				float4 temp_cast_14 = (( 1.0 - _TypeBIntensity )).xxxx;
				float2 appendResult219 = (float2(_SpeedTypeBX , _SpeedTypeBY));
				float2 appendResult87 = (float2(_TileTypeBX , _TileTypeBY));
				float2 texCoord86 = v.ase_texcoord.xy * appendResult87 + temp_output_202_0.xy;
				float2 panner89 = ( temp_output_83_0.x * appendResult219 + texCoord86);
				float simplePerlin2D166 = snoise( panner89*_NoiseFreqB );
				float4 temp_cast_17 = (simplePerlin2D166).xxxx;
				float4 temp_cast_18 = (simplePerlin2D166).xxxx;
				float4 temp_cast_19 = (0.0).xxxx;
				float4 temp_cast_20 = (1.0).xxxx;
				float4 temp_cast_21 = (0.1).xxxx;
				float4 temp_cast_22 = (_OverForce).xxxx;
				float4 FoilageWind104 = (temp_cast_21 + (( (0.0 + (_WindIntensity - 0.0) * (4.0 - 0.0) / (1.0 - 0.0)) * ( ( temp_cast_8 - ( (( _TypeANeg )?( -(( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_13 )) ):( (( _CustomNoiseTypeA )?( pow( tex2Dlod( _NoiseTxtA, float4( panner88, 0, 0.0) ) , 1.0 ) ):( temp_cast_12 )) )) * _TypeAIntensity ) ) * ( temp_cast_14 - ( (( _TypeBNeg )?( -(( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_18 )) ):( (( _CustomNoiseTypeB )?( pow( tex2Dlod( _NoiseTxtB, float4( panner89, 0, 0.0) ) , 1.0 ) ):( temp_cast_17 )) )) * _TypeBIntensity ) ) ) ) - temp_cast_19) * (temp_cast_22 - temp_cast_21) / (temp_cast_20 - temp_cast_19));
				float4 normalizeResult115 = ASESafeNormalize( mul( mul( (( _WindToggle )?( ( float4( appendResult106 , 0.0 ) + FoilageWind104 ) ):( float4( appendResult106 , 0.0 ) )), UNITY_MATRIX_V ), GetObjectToWorldMatrix() ) );
				float4 lerpResult123 = lerp( float4( 0,0,0,0 ) , ( ( normalizeResult115 * _CardSize ) + float4( ( v.normalOS * (0.0 + (_Inflate - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) , 0.0 ) ) , _EffectBlend);
				float4 Foilage124 = lerpResult123;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Foilage124.rgb;

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

				float2 texCoord146 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float cos143 = cos( radians( _TextureRotate ) );
				float sin143 = sin( radians( _TextureRotate ) );
				float2 rotator143 = mul( texCoord146 - float2( 0.5,0.5 ) , float2x2( cos143 , -sin143 , sin143 , cos143 )) + float2( 0.5,0.5 );
				float4 tex2DNode21 = tex2D( _LeavesTexture, rotator143 );
				float4 LeavesTextureR65 = tex2DNode21;
				

				surfaceDescription.Alpha = LeavesTextureR65.r;
				surfaceDescription.AlphaClipThreshold = (0.0001 + (_ClipThreshold - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0));

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
Version=19403
Node;AmplifyShaderEditor.CommentaryNode;70;-7834.026,-320;Inherit;False;4147.206;858.7293;Foilage Wind;55;104;183;185;187;186;184;101;98;97;253;250;93;252;251;248;245;243;242;263;262;261;260;168;167;166;225;163;226;165;164;92;94;89;88;86;84;212;219;216;220;202;85;87;218;221;217;82;81;80;83;79;75;78;73;72;Foilage Wind;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-7792,192;Inherit;False;Property;_WindSpeed;Wind Speed;29;0;Create;True;0;0;0;False;0;False;1;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-7520,192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;78;-7376,32;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;75;-7376,192;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-7168,-176;Inherit;False;Property;_TileTypeAX;Tile TypeAX;28;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;83;-7120,32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;80;-7168,-96;Inherit;False;Property;_TileTypeAY;Tile TypeAY;30;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-7168,272;Inherit;False;Property;_TileTypeBX;Tile TypeBX;34;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;82;-7168,352;Inherit;False;Property;_TileTypeBY;Tile TypeBY;33;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-6816,-224;Inherit;False;Property;_SpeedTypeAX;Speed TypeAX;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-6816,432;Inherit;False;Property;_SpeedTypeBY;Speed TypeBY;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;-6816,-144;Inherit;False;Property;_SpeedTypeAY;Speed TypeAY;31;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;87;-6992,288;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;85;-6992,-144;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;202;-6992,32;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-6816,352;Inherit;False;Property;_SpeedTypeBX;Speed TypeBX;26;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;216;-6640,-192;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;219;-6640,384;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;212;-7136,144;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;84;-6816,-16;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;-6816,160;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;88;-6480,-16;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;89;-6480,176;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;94;-6048,144;Inherit;True;Property;_NoiseTxtB;NoiseTxtB;25;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;c662692ad44de0b45ba4f81297e97381;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;92;-6048,-48;Inherit;True;Property;_NoiseTxtA;NoiseTxtA;24;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;7ec7052ce3ab6a945ad73485b22020ef;ba79def5542b6034a929cff9bd6bf12b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;164;-6480,-112;Inherit;False;Property;_NoiseFreqA;NoiseFreqA;43;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-6480,320;Inherit;False;Property;_NoiseFreqB;NoiseFreqB;42;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;226;-5744,144;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;163;-6288,-192;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;225;-5744,-48;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;166;-6288,256;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;167;-5568,-48;Inherit;False;Property;_CustomNoiseTypeA;CustomNoiseTypeA;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;168;-5568,144;Inherit;False;Property;_CustomNoiseTypeB;CustomNoiseTypeB;47;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;260;-5328,32;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;261;-5328,224;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;262;-5184,-48;Inherit;False;Property;_TypeANeg;TypeANeg;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;263;-5168,144;Inherit;False;Property;_TypeBNeg;TypeBNeg;53;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;242;-5232,-128;Inherit;False;Property;_TypeAIntensity;TypeAIntensity;50;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-5232,304;Inherit;False;Property;_TypeBIntensity;TypeBIntensity;51;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;71;-7824,-1168;Inherit;False;3229.488;706.864;Foilage;31;91;100;95;103;90;99;124;123;122;121;120;119;115;116;118;117;113;114;131;111;109;110;108;107;106;105;136;138;139;133;102;Foilage;0.6551657,1,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;-4944,144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;248;-4928,-48;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;251;-4928,-128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;252;-4944,256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;99;-7792,-1104;Inherit;True;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;93;-4800,-240;Inherit;False;Property;_WindIntensity;Wind Intensity;22;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;250;-4768,-128;Inherit;True;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;253;-4768,144;Inherit;True;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;102;-7536,-1104;Inherit;False;5;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;-1,-1;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-7680,-752;Inherit;False;Property;_CardRotate;CardRotate;21;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;133;-7344,-992;Inherit;False;Tangent;View;True;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;97;-4496,-192;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-4528,-16;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;103;-7376,-752;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BitangentVertexDataNode;91;-7440,-656;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;139;-7408,-832;Inherit;False;Property;_SurfaceFoilageIntensity;Surface Foilage Intensity;39;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;138;-7120,-1040;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4304,-192;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;184;-4480,208;Inherit;False;Constant;_MinOld;MinOld;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;186;-4480,272;Inherit;False;Constant;_MaxOld;MaxOld;43;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-4480,336;Inherit;False;Constant;_MinNew;MinNew;43;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-4544,400;Inherit;False;Property;_OverForce;OverForce;46;0;Create;True;0;0;0;False;0;False;0.25;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;-7184,-688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;183;-4160,-192;Inherit;True;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;3;COLOR;0,0,0,0;False;4;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;136;-6976,-1104;Inherit;False;Property;_SurfaceFoilage;Surface Foilage;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;100;-7008,-768;Inherit;False;Property;_RandomRotate;RandomRotate;35;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;104;-3904,-192;Inherit;False;FoilageWind;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;105;-6768,-1104;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;106;-6576,-1104;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;-6720,-896;Inherit;True;104;FoilageWind;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-6432,-1024;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;110;-6224,-1104;Inherit;False;Property;_WindToggle;WindToggle;23;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewMatrixNode;109;-6128,-992;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;111;-6000,-1104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;131;-6000,-992;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-5920,-752;Inherit;False;Property;_Inflate;Inflate;20;0;Create;True;0;0;0;False;0;False;0;0;-3;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;-5760,-1104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;17;-7808,-1744;Inherit;False;1626.875;454.1329;Leaf Base Settings;10;144;145;146;143;20;21;22;19;18;65;Leaf Base Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;117;-5616,-752;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;118;-5616,-896;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;116;-5712,-992;Inherit;False;Property;_CardSize;CardSize;19;1;[Gamma];Create;True;0;0;0;False;0;False;1;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;115;-5600,-1104;Inherit;False;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;144;-7792,-1408;Inherit;False;Property;_TextureRotate;Texture Rotate;40;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-5440,-1104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-5424,-896;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;146;-7568,-1536;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;145;-7504,-1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;121;-5280,-1104;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;122;-5344,-752;Inherit;False;Property;_EffectBlend;EffectBlend;0;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;143;-7344,-1504;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;123;-5056,-1104;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;21;-7168,-1504;Inherit;True;Property;_LeavesTexture;Leaves Texture;5;0;Create;True;0;0;0;False;0;False;-1;None;607961a1ca5e345479b3fa76c399d67f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;124;-4816,-1104;Inherit;False;Foilage;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;10;-6144,-1632;Inherit;False;1331.33;333.8991;Leaves Specular Settings;7;64;63;15;13;11;14;12;Leaves Specular Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-5936,656;Inherit;False;1317.03;536.3784;Normals;7;32;31;30;29;28;27;26;Normals;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;34;-7840,656;Inherit;False;1870.647;777.5897;Leaves Rim Settings;21;36;54;62;52;51;50;49;48;47;46;45;44;43;42;41;40;39;38;37;35;160;Leaves Rim Settings;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;55;-4528,-1024;Inherit;False;776.02;552.0175;Local Vars;13;265;222;223;127;161;56;58;60;156;61;59;57;268;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-6400,-1472;Inherit;False;LeavesTextureR;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-3456,-48;Inherit;False;Property;_ClipThreshold;Clip Threshold;18;0;Create;True;0;0;0;False;0;False;0.2;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-5744,-1392;Inherit;False;Property;_LeavesSpecIntensity;Leaves Spec Intensity;4;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-5424,-1456;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;30;-5312,736;Inherit;True;Property;_Normal;Normal;7;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;31;-5568,960;Inherit;True;Normal Reconstruct Z;-1;;142;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;32;-5088,736;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-6592,848;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-7712,880;Inherit;False;Property;_LeavesRimBias;Leaves Rim Bias;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;41;-6784,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;43;-7152,976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;44;-7520,1120;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-7216,1344;Inherit;False;Property;_LeavesRimYPosition;Leaves Rim Y Position;10;0;Create;True;0;0;0;False;0;False;0.5;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;50;-6784,1120;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-6928,1120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;52;-6880,704;Inherit;False;Property;_LeavesRimColor;Leaves Rim Color;9;0;Create;True;0;0;0;False;0;False;0.3124955,0.4842767,0.2695502,1;0.3124955,0.4842767,0.2695502,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;63;-5440,-1552;Inherit;False;59;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-7712,960;Inherit;False;Property;_LeavesRimScale;Leaves Rim Scale;14;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-7712,1040;Inherit;False;Property;_LeavesRimPower;Leaves Rim Power;12;0;Create;True;0;0;0;False;0;False;3;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;48;-7728,1120;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;46;-7200,1120;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;54;-6400,816;Inherit;False;Property;_LeavesRim;Leaves Rim;16;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-7792,1264;Inherit;False;Property;_LeavesRimYContrast;Leaves Rim Y Contrast;15;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;40;-7408,896;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;18;-6640,-1680;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0.5,0.5,0.5,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-6864,-1616;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-6400,-1680;Inherit;False;LeavesAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;62;-6592,752;Inherit;False;59;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-6176,816;Inherit;False;LeavesRimR;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;20;-7104,-1680;Inherit;False;Property;_LeavesColor;Leaves Color;3;0;Create;True;0;0;0;False;0;False;0.3193329,0.4654087,0.1653811,1;0.3193329,0.4654087,0.1653811,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-5984,-1584;Inherit;True;Property;_LeavesSpecTexture;Leaves Spec Texture;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;28;-5616,736;Inherit;True;Property;_NormalMap;Normal Map;6;2;[Header];[Normal];Create;False;1;Normal Controls;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-5904,736;Float;True;Property;_NormalScale;Normal Scale;8;0;Create;False;0;0;0;False;0;False;0.3;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;160;-7616,784;Inherit;False;26;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;42;-7008,896;Inherit;False;Property;_FresnelInvert;Fresnel Invert;13;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;45;-7312,1120;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.IntNode;156;-4256,-720;Inherit;False;Property;_TextureWrapMode;Texture Wrap Mode;41;2;[HideInInspector];[Enum];Create;True;0;5;Repeat;0;Clamp;1;Mirror;2;Mirror Once;3;Per Axis;4;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;161;-4480,-640;Inherit;False;Property;_FoilageSetting;FoilageSetting;44;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;127;-4496,-720;Inherit;False;Property;_AlphaAntiAliasing;AlphaAntiAliasing;36;2;[HideInInspector];[Enum];Create;False;0;2;On;1;Off;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;223;-4240,-560;Inherit;False;Property;_NoiseBFold;NoiseBFold;49;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;222;-4240,-640;Inherit;False;Property;_NoiseAFold;NoiseAFold;48;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;265;-4032,-976;Inherit;False;Property;_Transmission;Transmission;54;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;267;-4512,-1408;Inherit;False;407.0667;288.8;Extra Notlar;Extra Notlar;1,0.901033,0,1;Transmission buraya eklenebilir. Performans Testlerine bak veya On / Off şeklinde ekle buraya$$Shadow Threshold da eklenebilir Sonra$$Aynı shader'ın grass için düzenlenmişini yap$(üst vertex hareket ederken alt vertexler durur)$;0;0
Node;AmplifyShaderEditor.RangedFloatNode;268;-4032,-896;Inherit;False;Property;_ShadowThreshold;ShadowThreshold;55;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;26;-4848,736;Float;True;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;-4848,960;Inherit;True;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-5040,-1456;Inherit;False;LeavesSpecularR;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;64;-5264,-1456;Inherit;False;Property;_LeavesSpecular;Leaves Specular;17;0;Create;False;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;14;-5680,-1584;Inherit;False;Property;_LeavesSpecColor;Leaves Spec Color;2;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;23;-2928,-608;Inherit;False;22;LeavesAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-3152,-560;Inherit;False;27;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;16;-3216,-368;Inherit;False;15;LeavesSpecularR;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-3264,-288;Inherit;False;Property;_Smoothness;Smoothness;37;0;Create;True;0;0;0;False;0;False;0.4;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-3200,-160;Inherit;False;65;LeavesTextureR;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;125;-2960,32;Inherit;False;124;Foilage;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;68;-3168,-48;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;53;-3200,-464;Inherit;False;36;LeavesRimR;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-4256,-976;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;59;-4256,-896;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;-4256,-816;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-4464,-816;Inherit;False;Constant;_Gray;[Gray];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-4464,-896;Inherit;False;Constant;_Zero1;[Zero];19;1;[HideInInspector];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-4464,-976;Inherit;False;Constant;_One1;[One];20;1;[HideInInspector];Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;269;-2576,-384;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;271;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;272;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;273;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;274;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;275;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;276;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;277;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;278;-1088,-96;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;270;-2576,-384;Float;False;True;-1;2;BFoilageEditor;0;19;BUDU Shaders/BFoilage;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638528376042018992;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
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
WireConnection;212;0;78;0
WireConnection;212;1;75;0
WireConnection;84;0;85;0
WireConnection;84;1;202;0
WireConnection;86;0;87;0
WireConnection;86;1;202;0
WireConnection;88;0;84;0
WireConnection;88;2;216;0
WireConnection;88;1;212;0
WireConnection;89;0;86;0
WireConnection;89;2;219;0
WireConnection;89;1;83;0
WireConnection;94;1;89;0
WireConnection;92;1;88;0
WireConnection;226;0;94;0
WireConnection;163;0;88;0
WireConnection;163;1;164;0
WireConnection;225;0;92;0
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
WireConnection;250;0;251;0
WireConnection;250;1;248;0
WireConnection;253;0;252;0
WireConnection;253;1;245;0
WireConnection;102;0;99;0
WireConnection;133;0;102;0
WireConnection;97;0;93;0
WireConnection;98;0;250;0
WireConnection;98;1;253;0
WireConnection;103;0;90;0
WireConnection;138;0;102;0
WireConnection;138;1;133;0
WireConnection;138;2;139;0
WireConnection;101;0;97;0
WireConnection;101;1;98;0
WireConnection;95;0;103;0
WireConnection;95;1;91;0
WireConnection;183;0;101;0
WireConnection;183;1;184;0
WireConnection;183;2;186;0
WireConnection;183;3;187;0
WireConnection;183;4;185;0
WireConnection;136;0;102;0
WireConnection;136;1;138;0
WireConnection;100;0;103;0
WireConnection;100;1;95;0
WireConnection;104;0;183;0
WireConnection;105;0;136;0
WireConnection;105;2;100;0
WireConnection;106;0;105;0
WireConnection;108;0;106;0
WireConnection;108;1;107;0
WireConnection;110;0;106;0
WireConnection;110;1;108;0
WireConnection;111;0;110;0
WireConnection;111;1;109;0
WireConnection;113;0;111;0
WireConnection;113;1;131;0
WireConnection;117;0;114;0
WireConnection;115;0;113;0
WireConnection;119;0;115;0
WireConnection;119;1;116;0
WireConnection;120;0;118;0
WireConnection;120;1;117;0
WireConnection;145;0;144;0
WireConnection;121;0;119;0
WireConnection;121;1;120;0
WireConnection;143;0;146;0
WireConnection;143;2;145;0
WireConnection;123;1;121;0
WireConnection;123;2;122;0
WireConnection;21;1;143;0
WireConnection;124;0;123;0
WireConnection;65;0;21;0
WireConnection;11;0;14;0
WireConnection;11;1;13;0
WireConnection;11;2;12;0
WireConnection;30;0;31;0
WireConnection;30;1;28;0
WireConnection;32;0;30;0
WireConnection;35;0;52;0
WireConnection;35;1;41;0
WireConnection;35;2;50;0
WireConnection;35;3;52;4
WireConnection;41;0;42;0
WireConnection;43;0;40;0
WireConnection;44;1;48;2
WireConnection;44;0;49;0
WireConnection;50;0;51;0
WireConnection;51;0;46;0
WireConnection;51;1;47;0
WireConnection;46;0;45;1
WireConnection;54;0;62;0
WireConnection;54;1;35;0
WireConnection;40;0;160;0
WireConnection;40;1;37;0
WireConnection;40;2;38;0
WireConnection;40;3;39;0
WireConnection;18;0;20;0
WireConnection;18;1;19;0
WireConnection;19;0;20;0
WireConnection;19;1;21;0
WireConnection;22;0;18;0
WireConnection;36;0;54;0
WireConnection;28;5;29;0
WireConnection;42;0;40;0
WireConnection;42;1;43;0
WireConnection;45;0;44;0
WireConnection;26;0;32;0
WireConnection;27;0;30;0
WireConnection;15;0;64;0
WireConnection;64;0;63;0
WireConnection;64;1;11;0
WireConnection;68;0;67;0
WireConnection;57;0;56;0
WireConnection;59;0;58;0
WireConnection;61;0;60;0
WireConnection;270;0;23;0
WireConnection;270;1;33;0
WireConnection;270;2;53;0
WireConnection;270;9;16;0
WireConnection;270;4;128;0
WireConnection;270;6;66;0
WireConnection;270;7;68;0
WireConnection;270;8;125;0
ASEEND*/
//CHKSM=C417294AF1E9A4735F95696AFA94D128958FFCCC
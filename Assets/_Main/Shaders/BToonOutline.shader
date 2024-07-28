// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BToonOutline"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_BaseColor("Base Color", Color) = (0.5,0.5,0.5)
		_BaseMap("Base Map", 2D) = "white" {}
		[Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		[Toggle]_Normal("Normal", Float) = 0
		_OutlineWidth("Outline Width", Range( 0 , 0.1)) = 0.1
		_NormalScale("Normal Scale", Range( -1 , 1)) = 0.3
		_DistanceCutoff("Distance Cutoff", Range( 0 , 10)) = 0
		_AmbientColor("Ambient Color", Color) = (0.5,0.5,0.5)
		_RampTexture("Ramp Texture", 2D) = "white" {}
		_RampControl("Ramp Control", Range( 0.0001 , 1)) = 1
		_RampOffset("Ramp Offset", Range( 0 , 1)) = 0.5
		_ToonContourOffset("Toon Contour Offset", Range( 0 , 1)) = 0.2
		_ToonContourScale("Toon Contour Scale", Range( 0 , 1)) = 0.05
		[Gamma]_ToonContourColor("Toon Contour Color", Color) = (0,0,0)
		[Toggle]_ToonContourLightAttenuation("Toon Contour Light Attenuation", Float) = 0
		_ToonSpecIntensity("Toon Spec Intensity", Range( 0 , 1)) = 1
		_ToonSpecMin("Toon Spec Min", Range( 0 , 1)) = 0
		_ToonSpecMax("Toon Spec Max", Range( 0 , 1)) = 1
		_ToonSpecArea("Toon Spec Area", Range( 0 , 10)) = 3
		[Toggle]_Ramp("Ramp", Float) = 0
		[Toggle]_IndirectLightToggle("Indirect Light Toggle", Float) = 0
		[Toggle]_LightAffectToggle("Light Affect Toggle", Float) = 1
		_IndirectLightIntensity("Indirect Light Intensity", Range( 0 , 1)) = 0.2
		_LightAffectIntensity("Light Affect Intensity", Range( 0 , 1)) = 1
		[Toggle]_LightShade("Light Shade", Float) = 1
		[HDR]_OutlineColor("Outline Color", Color) = (0,0,0)
		[Toggle]_ToonContour("Toon Contour", Float) = 0
		[Normal]_BlueNoiseTexture("BlueNoiseTexture", 2D) = "bump" {}
		[Toggle]_BlueNoise("BlueNoise", Float) = 1
		_BlueNoiseIntensity("BlueNoise Intensity", Range( -1 , 1)) = 0.5
		[Toggle]_Outline("Outline", Float) = 0
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
		[HideInInspector]_CKey0("CKey0", Color) = (0,0,0)
		[HideInInspector]_CKey1("CKey1", Color) = (0,0,0)
		[HideInInspector]_CKey2("CKey2", Color) = (0,0,0)
		[HideInInspector]_CKey3("CKey3", Color) = (0,0,0)
		[HideInInspector]_CKey4("CKey4", Color) = (0,0,0)
		[HideInInspector]_CKey5("CKey5", Color) = (0,0,0)
		[HideInInspector]_CKey6("CKey6", Color) = (0,0,0)
		[HideInInspector]_CKey7("CKey7", Color) = (0,0,0)
		[HideInInspector]_CTime6("CTime6", Float) = 0
		[HideInInspector]_CTime5("CTime5", Float) = 0
		[HideInInspector]_CTime4("CTime4", Float) = 0
		[HideInInspector]_CTime0("CTime0", Float) = 0
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
		[HideInInspector]_CheckDef("CheckDef", Int) = 0
		[HideInInspector][Enum(Blend Classic,0,Fixed,1,Blend Perceptual,2)]_GradMode("GradMode", Int) = 0
		[HideInInspector]_CustomRamp("CustomRamp", Int) = 0
		[HideInInspector]_BaseSettings("BaseSettings", Int) = 0
		[HideInInspector]_ToonSpec("ToonSpec", Int) = 0
		[HideInInspector]_ColoredAmbient("ColoredAmbient", Int) = 0
		[Toggle]_ColoredAmbientToggle("ColoredAmbientToggle", Float) = 0
		[Toggle]_TSpec("TSpec", Float) = 0
		_AmbientClampMax("Ambient Clamp Max", Range( 0 , 1)) = 0.5
		_AmbientClampMin("Ambient Clamp Min", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Unlit" }

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
			Name "ExtraPrePass"
			

			Blend One Zero
			Cull Back
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define ASE_FOG 1
			#define ASE_SRP_VERSION 140010


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
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
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 lightmapUVOrVertexSH : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _NormalMap;
			sampler2D _BlueNoiseTexture;
			sampler2D _BaseMap;
			sampler2D _RampTexture;


			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float RF_Zero707 = 0.0;
				float3 temp_cast_0 = (RF_Zero707).xxx;
				float4 unityObjectToClipPos815 = TransformWorldToHClip(TransformObjectToWorld(v.positionOS.xyz));
				float3 RF_OutlineURP821 = ( v.normalOS * _OutlineWidth * min( unityObjectToClipPos815.z , _DistanceCutoff ) );
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
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

				float3 vertexValue = (( _Outline )?( RF_OutlineURP821 ):( temp_cast_0 ));

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
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;

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
				o.texcoord1 = v.texcoord1;
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
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
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

			half4 frag ( VertexOutput IN  ) : SV_Target
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

				float RF_Zero707 = 0.0;
				float4 temp_cast_0 = (RF_Zero707).xxxx;
				float2 temp_output_1_0_g65 = float2( 0,0 );
				float dotResult4_g65 = dot( temp_output_1_0_g65 , temp_output_1_0_g65 );
				float3 appendResult10_g65 = (float3((temp_output_1_0_g65).x , (temp_output_1_0_g65).y , sqrt( ( 1.0 - saturate( dotResult4_g65 ) ) )));
				float3 normalizeResult12_g65 = normalize( appendResult10_g65 );
				float2 uv_NormalMap = IN.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack519 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack519.z = lerp( 1, unpack519.z, saturate(_NormalScale) );
				float2 temp_output_1_0_g64 = float2( 0,0 );
				float dotResult4_g64 = dot( temp_output_1_0_g64 , temp_output_1_0_g64 );
				float3 appendResult10_g64 = (float3((temp_output_1_0_g64).x , (temp_output_1_0_g64).y , sqrt( ( 1.0 - saturate( dotResult4_g64 ) ) )));
				float3 normalizeResult12_g64 = normalize( appendResult10_g64 );
				float2 uv_BlueNoiseTexture = IN.ase_texcoord3.xy * _BlueNoiseTexture_ST.xy + _BlueNoiseTexture_ST.zw;
				float3 unpack825 = UnpackNormalScale( tex2D( _BlueNoiseTexture, uv_BlueNoiseTexture ), _BlueNoiseIntensity );
				unpack825.z = lerp( 1, unpack825.z, saturate(_BlueNoiseIntensity) );
				float3 RF_BlueNoise829 = (( _BlueNoise )?( unpack825 ):( normalizeResult12_g64 ));
				float3 temp_output_830_0 = BlendNormal( (( _Normal )?( unpack519 ):( normalizeResult12_g65 )) , RF_BlueNoise829 );
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal520 = temp_output_830_0;
				float3 worldNormal520 = normalize( float3(dot(tanToWorld0,tanNormal520), dot(tanToWorld1,tanNormal520), dot(tanToWorld2,tanNormal520)) );
				float3 RF_NewNormals522 = worldNormal520;
				float dotResult513 = dot( RF_NewNormals522 , SafeNormalize(_MainLightPosition.xyz) );
				float RF_NormalLightDir516 = dotResult513;
				float2 uv_BaseMap = IN.ase_texcoord3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode508 = tex2D( _BaseMap, uv_BaseMap );
				float4 BaseMap555 = tex2DNode508;
				float4 saferPower558 = abs( BaseMap555 );
				float4 RF_ToonAmbient541 = (( _ColoredAmbientToggle )?( ( saturate( (0.0 + (( 1.0 - RF_NormalLightDir516 ) - 0.0) * (_AmbientClampMax - 0.0) / (_AmbientClampMin - 0.0)) ) * ( float4( _AmbientColor , 0.0 ) * pow( saferPower558 , 0.2 ) ) ) ):( temp_cast_0 ));
				float RF_One706 = 1.0;
				float4 temp_cast_2 = (RF_One706).xxxx;
				float2 temp_cast_3 = ((RF_NormalLightDir516*_RampControl + _RampOffset)).xx;
				float4 RF_RampResult693 = (( _Ramp )?( tex2D( _RampTexture, temp_cast_3 ) ):( temp_cast_2 ));
				float4 MainDiffuse509 = ( float4( _BaseColor , 0.0 ) * tex2DNode508 );
				float3 temp_cast_5 = (RF_One706).xxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 RF_LightAffect530 = (( _LightAffectToggle )?( (( _LightShade )?( ( saturate( ( ase_lightColor.rgb * RF_NormalLightDir516 ) ) + _LightAffectIntensity ) ):( ( ase_lightColor.rgb + _LightAffectIntensity ) )) ):( temp_cast_5 ));
				float3 temp_cast_7 = (RF_Zero707).xxx;
				float3 bakedGI696 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, RF_NewNormals522);
				Light ase_mainLight = GetMainLight( ShadowCoords );
				MixRealtimeAndBakedGI(ase_mainLight, RF_NewNormals522, bakedGI696, half4(0,0,0,0));
				float3 RF_IndirectLight699 = (( _IndirectLightToggle )?( ( _IndirectLightIntensity * bakedGI696 ) ):( temp_cast_7 ));
				float ase_lightAtten = 0;
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float dotResult623 = dot( _MainLightPosition.xyz , RF_NewNormals522 );
				float saferPower624 = abs( saturate( dotResult623 ) );
				float smoothstepResult627 = smoothstep( (0.2 + (_ToonSpecMin - 0.0) * (0.495 - 0.2) / (1.0 - 0.0)) , (0.505 + (_ToonSpecMax - 0.0) * (0.7 - 0.505) / (1.0 - 0.0)) , pow( saferPower624 , (0.5 + (_ToonSpecArea - 0.0) * (200.0 - 0.5) / (10.0 - 0.0)) ));
				float RF_Spec632 = (( _TSpec )?( ( saturate( ase_lightAtten ) * ( smoothstepResult627 * _ToonSpecIntensity ) ) ):( RF_Zero707 ));
				float4 temp_output_726_0 = ( RF_ToonAmbient541 + ( RF_RampResult693 * MainDiffuse509 * float4( RF_LightAffect530 , 0.0 ) ) + float4( RF_IndirectLight699 , 0.0 ) + RF_Spec632 );
				

				float3 Color = ( temp_output_726_0 * float4( _OutlineColor , 0.0 ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite [_ZWrite]
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _FORWARD_PLUS


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
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
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 lightmapUVOrVertexSH : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _NormalMap;
			sampler2D _BlueNoiseTexture;
			sampler2D _BaseMap;
			sampler2D _RampTexture;


			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
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
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
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
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;

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
				o.texcoord1 = v.texcoord1;
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
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
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

				float RF_Zero707 = 0.0;
				float4 temp_cast_0 = (RF_Zero707).xxxx;
				float2 temp_output_1_0_g65 = float2( 0,0 );
				float dotResult4_g65 = dot( temp_output_1_0_g65 , temp_output_1_0_g65 );
				float3 appendResult10_g65 = (float3((temp_output_1_0_g65).x , (temp_output_1_0_g65).y , sqrt( ( 1.0 - saturate( dotResult4_g65 ) ) )));
				float3 normalizeResult12_g65 = normalize( appendResult10_g65 );
				float2 uv_NormalMap = IN.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack519 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalScale );
				unpack519.z = lerp( 1, unpack519.z, saturate(_NormalScale) );
				float2 temp_output_1_0_g64 = float2( 0,0 );
				float dotResult4_g64 = dot( temp_output_1_0_g64 , temp_output_1_0_g64 );
				float3 appendResult10_g64 = (float3((temp_output_1_0_g64).x , (temp_output_1_0_g64).y , sqrt( ( 1.0 - saturate( dotResult4_g64 ) ) )));
				float3 normalizeResult12_g64 = normalize( appendResult10_g64 );
				float2 uv_BlueNoiseTexture = IN.ase_texcoord3.xy * _BlueNoiseTexture_ST.xy + _BlueNoiseTexture_ST.zw;
				float3 unpack825 = UnpackNormalScale( tex2D( _BlueNoiseTexture, uv_BlueNoiseTexture ), _BlueNoiseIntensity );
				unpack825.z = lerp( 1, unpack825.z, saturate(_BlueNoiseIntensity) );
				float3 RF_BlueNoise829 = (( _BlueNoise )?( unpack825 ):( normalizeResult12_g64 ));
				float3 temp_output_830_0 = BlendNormal( (( _Normal )?( unpack519 ):( normalizeResult12_g65 )) , RF_BlueNoise829 );
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal520 = temp_output_830_0;
				float3 worldNormal520 = normalize( float3(dot(tanToWorld0,tanNormal520), dot(tanToWorld1,tanNormal520), dot(tanToWorld2,tanNormal520)) );
				float3 RF_NewNormals522 = worldNormal520;
				float dotResult513 = dot( RF_NewNormals522 , SafeNormalize(_MainLightPosition.xyz) );
				float RF_NormalLightDir516 = dotResult513;
				float2 uv_BaseMap = IN.ase_texcoord3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float4 tex2DNode508 = tex2D( _BaseMap, uv_BaseMap );
				float4 BaseMap555 = tex2DNode508;
				float4 saferPower558 = abs( BaseMap555 );
				float4 RF_ToonAmbient541 = (( _ColoredAmbientToggle )?( ( saturate( (0.0 + (( 1.0 - RF_NormalLightDir516 ) - 0.0) * (_AmbientClampMax - 0.0) / (_AmbientClampMin - 0.0)) ) * ( float4( _AmbientColor , 0.0 ) * pow( saferPower558 , 0.2 ) ) ) ):( temp_cast_0 ));
				float RF_One706 = 1.0;
				float4 temp_cast_2 = (RF_One706).xxxx;
				float2 temp_cast_3 = ((RF_NormalLightDir516*_RampControl + _RampOffset)).xx;
				float4 RF_RampResult693 = (( _Ramp )?( tex2D( _RampTexture, temp_cast_3 ) ):( temp_cast_2 ));
				float4 MainDiffuse509 = ( float4( _BaseColor , 0.0 ) * tex2DNode508 );
				float3 temp_cast_5 = (RF_One706).xxx;
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float3 RF_LightAffect530 = (( _LightAffectToggle )?( (( _LightShade )?( ( saturate( ( ase_lightColor.rgb * RF_NormalLightDir516 ) ) + _LightAffectIntensity ) ):( ( ase_lightColor.rgb + _LightAffectIntensity ) )) ):( temp_cast_5 ));
				float3 temp_cast_7 = (RF_Zero707).xxx;
				float3 bakedGI696 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, RF_NewNormals522);
				Light ase_mainLight = GetMainLight( ShadowCoords );
				MixRealtimeAndBakedGI(ase_mainLight, RF_NewNormals522, bakedGI696, half4(0,0,0,0));
				float3 RF_IndirectLight699 = (( _IndirectLightToggle )?( ( _IndirectLightIntensity * bakedGI696 ) ):( temp_cast_7 ));
				float ase_lightAtten = 0;
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float dotResult623 = dot( _MainLightPosition.xyz , RF_NewNormals522 );
				float saferPower624 = abs( saturate( dotResult623 ) );
				float smoothstepResult627 = smoothstep( (0.2 + (_ToonSpecMin - 0.0) * (0.495 - 0.2) / (1.0 - 0.0)) , (0.505 + (_ToonSpecMax - 0.0) * (0.7 - 0.505) / (1.0 - 0.0)) , pow( saferPower624 , (0.5 + (_ToonSpecArea - 0.0) * (200.0 - 0.5) / (10.0 - 0.0)) ));
				float RF_Spec632 = (( _TSpec )?( ( saturate( ase_lightAtten ) * ( smoothstepResult627 * _ToonSpecIntensity ) ) ):( RF_Zero707 ));
				float4 temp_output_726_0 = ( RF_ToonAmbient541 + ( RF_RampResult693 * MainDiffuse509 * float4( RF_LightAffect530 , 0.0 ) ) + float4( RF_IndirectLight699 , 0.0 ) + RF_Spec632 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult582 = dot( RF_NewNormals522 , ase_worldViewDir );
				float RF_NormalViewDir585 = dotResult582;
				float saferPower571 = abs( ( 1.0 - saturate( ( (0.5 + (_ToonContourOffset - 0.0) * (1.0 - 0.5) / (1.0 - 0.0)) + RF_NormalViewDir585 ) ) ) );
				float temp_output_571_0 = pow( saferPower571 , (0.0001 + (_ToonContourScale - 0.0) * (1.0 - 0.0001) / (1.0 - 0.0)) );
				float temp_output_613_0 = saturate( (( _ToonContourLightAttenuation )?( ( temp_output_571_0 * ( RF_NormalLightDir516 * ase_lightAtten ) ) ):( temp_output_571_0 )) );
				float4 RF_ToonRim572 = ( temp_output_613_0 * ( ase_lightColor * float4( _ToonContourColor , 0.0 ) ) );
				float TR_ToonRimAlp606 = ( 1.0 - temp_output_613_0 );
				float4 lerpResult599 = lerp( RF_ToonRim572 , temp_output_726_0 , TR_ToonRimAlp606);
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = (( _ToonContour )?( lerpResult599 ):( temp_output_726_0 )).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

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
			#define ASE_FOG 1
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
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
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
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
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
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

        	#pragma multi_compile_instancing
        	#pragma multi_compile _ LOD_FADE_CROSSFADE
        	#define ASE_FOG 1
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

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseMap_ST;
			float4 _BlueNoiseTexture_ST;
			float4 _NormalMap_ST;
			float3 _CKey1;
			float3 _OutlineColor;
			float3 _BaseColor;
			float3 _AmbientColor;
			float3 _CKey7;
			float3 _CKey3;
			float3 _CKey0;
			float3 _CKey4;
			float3 _ToonContourColor;
			float3 _CKey2;
			float3 _CKey6;
			float3 _CKey5;
			float _CTime1;
			float _AKey2;
			float _NormalScale;
			float _BlueNoise;
			float _AKey1;
			float _BlueNoiseIntensity;
			float _AmbientClampMin;
			float _AmbientClampMax;
			int _GradALength;
			float _Ramp;
			float _RampControl;
			float _RampOffset;
			float _LightAffectToggle;
			float _LightShade;
			float _LightAffectIntensity;
			float _IndirectLightToggle;
			float _IndirectLightIntensity;
			float _TSpec;
			float _ToonSpecMin;
			float _ToonSpecMax;
			float _ToonSpecArea;
			float _ToonSpecIntensity;
			float _ToonContour;
			float _ToonContourLightAttenuation;
			float _ToonContourOffset;
			float _Normal;
			float _ColoredAmbientToggle;
			float _DistanceCutoff;
			float _OutlineWidth;
			float _CTime2;
			float _CTime3;
			float _CTime4;
			float _CTime5;
			float _CTime6;
			float _CTime7;
			float _ATime1;
			float _ATime2;
			float _ATime3;
			float _ATime4;
			float _ATime5;
			float _ATime6;
			float _ATime7;
			float _AKey7;
			float _AKey6;
			float _AKey0;
			float _CTime0;
			float _ATime0;
			float _AKey5;
			int _GradMode;
			float _AKey4;
			float _AKey3;
			int _CustomRamp;
			float _ToonContourScale;
			int _ColoredAmbient;
			int _BaseSettings;
			int _CheckDef;
			float _Outline;
			int _GradCLength;
			int _ToonSpec;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			
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

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				 )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
	
	CustomEditor "BToonOutlineEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19600
Node;AmplifyShaderEditor.CommentaryNode;832;-4736,-1104;Inherit;False;1062.934;488.2573;Blue Noise Normals;5;826;828;825;829;827;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;517;-4736,-592;Inherit;False;1514.143;351.5806;Normals with Blue Noise;9;524;522;520;830;831;519;523;518;521;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;581;-4032,-224;Inherit;False;579.0908;320.7355;Normal View Direction;4;585;582;584;583;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;512;-4736,-224;Inherit;False;648.0134;321.92;Normal Light Direction;4;516;513;514;515;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;570;-4896,-2272;Inherit;False;2356.779;510.4863;Toon Contour;22;577;616;578;574;615;591;594;593;614;588;613;607;606;572;595;587;589;590;571;576;575;573;;0,0.9833336,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;617;-4736,-1712;Inherit;False;2139.602;592.4669;Toon Specular;20;914;632;915;631;635;630;629;628;627;633;670;623;626;625;674;673;624;669;620;619;;1,0.9153558,0.6823899,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;527;-4720,128;Inherit;False;1434.462;407.2627;Light Affect;11;712;530;711;729;714;738;739;553;528;531;529;;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;505;-3648,-1088;Inherit;False;706.3957;458.8234;Base Texture;5;555;509;508;506;507;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;740;-3200,-288;Inherit;False;1473.74;643.4415;Colored Ambient;14;541;912;913;540;556;558;537;557;919;920;918;922;538;536;;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;713;-1536,-2272;Inherit;False;497.9324;590.7027;Local Vars;10;929;910;909;908;707;706;907;702;701;930;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;695;-2928,-1088;Inherit;False;1436.267;515.6666;Ramp Setting;8;904;566;693;694;567;569;568;525;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;708;-3200,-544;Inherit;False;1143.234;238.3748;Indirect Light Setting;7;699;700;710;705;709;692;696;;0.9947262,1,0.6176471,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;838;-1152,-560;Inherit;False;1186;522.9999;Comp;12;741;599;608;579;716;717;719;721;726;720;727;728;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;813;-1536,-1664;Inherit;False;942.5828;558.157;Outline URP;8;814;820;821;819;816;817;818;815;;1,0.8605404,0.6556604,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;837;-640,-1008;Inherit;False;670.6667;427.3334;Outline Comp;5;928;800;801;835;822;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;906;-2512,-2272;Inherit;False;947.6775;925.4706;Ramp Vars;36;901;903;876;893;884;868;839;880;900;899;898;897;896;895;894;891;890;889;888;887;886;885;875;874;873;872;871;870;869;840;883;882;881;879;878;877;Ramp Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-4704,-848;Inherit;False;Property;_BlueNoiseIntensity;BlueNoise Intensity;29;0;Create;True;0;0;0;False;0;False;0.5;0.2;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;825;-4416,-896;Inherit;True;Property;_BlueNoiseTexture;BlueNoiseTexture;27;1;[Normal];Create;True;0;0;0;False;0;False;-1;ce721e2d7b397144b890340a9decde3f;ce721e2d7b397144b890340a9decde3f;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;828;-4384,-992;Inherit;False;Normal Reconstruct Z;-1;;64;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-4720,-528;Float;False;Property;_NormalScale;Normal Scale;5;0;Create;True;0;0;0;False;0;False;0.3;0.3;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;827;-4128,-960;Inherit;False;Property;_BlueNoise;BlueNoise;28;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;521;-4384,-336;Inherit;False;Normal Reconstruct Z;-1;;65;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;829;-3904,-960;Inherit;False;RF_BlueNoise;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;519;-4432,-528;Inherit;True;Property;_NormalMap;Normal Map;2;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;e2f374f43d66c9647a243c4972f11b11;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;523;-4112,-528;Inherit;False;Property;_Normal;Normal;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;831;-4112,-416;Inherit;False;829;RF_BlueNoise;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;830;-3888,-528;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;520;-3664,-528;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;522;-3472,-528;Float;False;RF_NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;583;-4000,-160;Inherit;False;522;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;584;-4000,-64;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;582;-3808,-128;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;515;-4640,-160;Inherit;False;522;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;514;-4704,-64;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;577;-4864,-2208;Inherit;False;Property;_ToonContourOffset;Toon Contour Offset;11;0;Create;True;0;0;0;False;0;False;0.2;0.353;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;513;-4448,-112;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;585;-3680,-128;Float;False;RF_NormalViewDir;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;578;-4640,-2032;Inherit;False;585;RF_NormalViewDir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;616;-4576,-2208;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightPos;619;-4704,-1584;Inherit;False;0;3;FLOAT4;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;620;-4672,-1472;Inherit;False;522;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;516;-4320,-112;Float;False;RF_NormalLightDir;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;576;-4352,-2208;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;508;-3616,-832;Inherit;True;Property;_BaseMap;Base Map;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;529;-4624,224;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;531;-4688,352;Inherit;False;516;RF_NormalLightDir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;623;-4448,-1552;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;633;-4640,-1376;Inherit;False;Property;_ToonSpecArea;Toon Spec Area;18;0;Create;True;0;0;0;False;0;False;3;1.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;575;-4224,-2208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;669;-4320,-1552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-4160,-1376;Inherit;False;Property;_ToonSpecMin;Toon Spec Min;16;0;Create;True;0;0;0;False;0;False;0;0.368;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;626;-4160,-1296;Inherit;False;Property;_ToonSpecMax;Toon Spec Max;17;0;Create;True;0;0;0;False;0;False;1;0.447;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;536;-3184,-240;Inherit;False;516;RF_NormalLightDir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;574;-4384,-2032;Inherit;False;Property;_ToonContourScale;Toon Contour Scale;12;0;Create;True;0;0;0;False;0;False;0.05;0.062;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;555;-3168,-832;Inherit;False;BaseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;528;-4432,320;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;670;-4352,-1376;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0.5;False;4;FLOAT;200;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;573;-4064,-2208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;589;-4096,-1952;Inherit;False;516;RF_NormalLightDir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;587;-4080,-1856;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;615;-4096,-2128;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.0001;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;701;-1472,-2224;Inherit;False;Constant;_One;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;568;-2880,-960;Inherit;False;Property;_RampControl;Ramp Control;9;0;Create;True;0;0;0;False;0;False;1;0.5;0.0001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;569;-2880,-880;Inherit;False;Property;_RampOffset;Ramp Offset;10;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;624;-4160,-1552;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;673;-3856,-1472;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.2;False;4;FLOAT;0.495;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;674;-3856,-1296;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.505;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;538;-2944,-240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;553;-4272,320;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;714;-4400,448;Inherit;False;Property;_LightAffectIntensity;Light Affect Intensity;23;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;922;-3072,-144;Inherit;False;Property;_AmbientClampMin;Ambient Clamp Min;74;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;918;-3072,-64;Inherit;False;Property;_AmbientClampMax;Ambient Clamp Max;73;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;556;-2944,240;Inherit;False;555;BaseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;525;-2848,-800;Inherit;False;516;RF_NormalLightDir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;702;-1472,-2144;Inherit;False;Constant;_Zero;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;571;-3888,-2208;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;590;-3824,-1952;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;567;-2560,-800;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;692;-3184,-416;Inherit;False;522;RF_NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;739;-4112,224;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;738;-4112,320;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;920;-2784,-240;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;558;-2752,240;Inherit;False;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0.2;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;627;-3664,-1552;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;628;-3664,-1424;Inherit;False;Property;_ToonSpecIntensity;Toon Spec Intensity;15;0;Create;True;0;0;0;False;0;False;1;0.458;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;630;-3600,-1632;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;706;-1264,-2224;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;707;-1264,-2144;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;588;-3648,-2128;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;566;-2320,-800;Inherit;True;Property;_RampTexture;Ramp Texture;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;904;-2224,-896;Inherit;False;706;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.IndirectDiffuseLighting;696;-2976,-416;Inherit;False;World;1;0;FLOAT3;0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;709;-3008,-496;Inherit;False;Property;_IndirectLightIntensity;Indirect Light Intensity;22;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;729;-3984,288;Inherit;False;Property;_LightShade;Light Shade;24;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;712;-3952,192;Inherit;False;706;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;919;-2592,-240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;557;-2592,32;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;629;-3392,-1504;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;635;-3392,-1632;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;593;-3328,-2096;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;694;-2000,-800;Inherit;False;Property;_Ramp;Ramp;19;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;614;-3440,-2208;Inherit;False;Property;_ToonContourLightAttenuation;Toon Contour Light Attenuation;14;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;506;-3328,-1040;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;711;-3760,288;Inherit;False;Property;_LightAffectToggle;Light Affect Toggle;21;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;705;-2720,-496;Inherit;False;707;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;710;-2688,-416;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;540;-2400,-240;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;913;-2432,-112;Inherit;False;707;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;631;-3200,-1584;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;914;-3232,-1472;Inherit;False;707;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;613;-3136,-2208;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;594;-3136,-2064;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;509;-3168,-1040;Inherit;False;MainDiffuse;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;700;-2528,-464;Inherit;False;Property;_IndirectLightToggle;Indirect Light Toggle;20;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;912;-2240,-240;Inherit;False;Property;_ColoredAmbientToggle;ColoredAmbientToggle;71;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;530;-3504,288;Float;False;RF_LightAffect;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;915;-3040,-1584;Inherit;False;Property;_TSpec;TSpec;72;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;693;-1760,-800;Inherit;False;RF_RampResult;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;595;-2912,-2208;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;607;-2912,-2112;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;728;-1104,-240;Inherit;False;530;RF_LightAffect;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;719;-1104,-352;Inherit;False;509;MainDiffuse;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;717;-1104,-448;Inherit;False;693;RF_RampResult;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;541;-1952,-240;Inherit;False;RF_ToonAmbient;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;699;-2272,-464;Inherit;False;RF_IndirectLight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;632;-2816,-1584;Inherit;False;RF_Spec;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;727;-880,-240;Inherit;False;699;RF_IndirectLight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;720;-848,-384;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;721;-848,-144;Inherit;False;632;RF_Spec;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;716;-896,-496;Inherit;False;541;RF_ToonAmbient;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;572;-2768,-2208;Inherit;False;RF_ToonRim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;606;-2768,-2112;Inherit;False;TR_ToonRimAlp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;726;-592,-384;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;579;-608,-224;Inherit;False;572;RF_ToonRim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;608;-640,-144;Inherit;False;606;TR_ToonRimAlp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;599;-400,-224;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;817;-1296,-1616;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;816;-1392,-1456;Inherit;False;Property;_OutlineWidth;Outline Width;4;0;Create;True;0;0;0;False;0;False;0.1;0.0122;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;819;-1104,-1280;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;820;-976,-1456;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;928;-384,-672;Inherit;False;707;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;822;-384,-752;Inherit;False;821;RF_OutlineURP;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;840;-2448,-2144;Inherit;False;Property;_GradALength;GradALength;32;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;869;-2048,-1984;Inherit;False;Property;_AKey1;AKey1;39;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;870;-2048,-1904;Inherit;False;Property;_AKey2;AKey2;38;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;871;-2048,-1824;Inherit;False;Property;_AKey3;AKey3;37;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;872;-2048,-1744;Inherit;False;Property;_AKey4;AKey4;36;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;873;-2048,-1664;Inherit;False;Property;_AKey5;AKey5;35;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;874;-2048,-1584;Inherit;False;Property;_AKey6;AKey6;34;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;875;-2048,-1504;Inherit;False;Property;_AKey7;AKey7;33;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;-1888,-1984;Inherit;False;Property;_CTime1;CTime1;54;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;886;-1888,-1904;Inherit;False;Property;_CTime2;CTime2;53;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;887;-1888,-1824;Inherit;False;Property;_CTime3;CTime3;56;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;888;-1888,-1744;Inherit;False;Property;_CTime4;CTime4;51;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;889;-1888,-1664;Inherit;False;Property;_CTime5;CTime5;50;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;890;-1888,-1584;Inherit;False;Property;_CTime6;CTime6;49;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;891;-1888,-1504;Inherit;False;Property;_CTime7;CTime7;55;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;-1728,-1984;Inherit;False;Property;_ATime1;ATime1;58;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;895;-1728,-1904;Inherit;False;Property;_ATime2;ATime2;59;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;-1728,-1824;Inherit;False;Property;_ATime3;ATime3;60;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;897;-1728,-1744;Inherit;False;Property;_ATime4;ATime4;61;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;-1728,-1664;Inherit;False;Property;_ATime5;ATime5;62;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-1728,-1584;Inherit;False;Property;_ATime6;ATime6;63;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;900;-1728,-1504;Inherit;False;Property;_ATime7;ATime7;64;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;839;-2448,-2224;Inherit;False;Property;_GradCLength;GradCLength;31;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;2;True;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;868;-2048,-2064;Inherit;False;Property;_AKey0;AKey0;40;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;884;-1888,-2064;Inherit;False;Property;_CTime0;CTime0;52;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-1728,-2064;Inherit;False;Property;_ATime0;ATime0;57;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;907;-1472,-2064;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;901;-2224,-2224;Inherit;False;Property;_GradMode;GradMode;66;2;[HideInInspector];[Enum];Create;True;0;3;Blend Classic;0;Fixed;1;Blend Perceptual;2;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;903;-2240,-2144;Inherit;False;Property;_CustomRamp;CustomRamp;67;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;835;-192,-752;Inherit;False;Property;_Outline;Outline;30;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;801;-368,-864;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;524;-3472,-448;Inherit;False;RF_NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;908;-1264,-2064;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;909;-1472,-1968;Inherit;False;Property;_ToonSpec;ToonSpec;69;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;910;-1504,-1872;Inherit;False;Property;_ColoredAmbient;ColoredAmbient;70;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;929;-1488,-1776;Inherit;False;Property;_BaseSettings;BaseSettings;68;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;741;-192,-384;Inherit;False;Property;_ToonContour;Toon Contour;26;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;821;-816,-1456;Inherit;False;RF_OutlineURP;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;818;-1392,-1200;Inherit;False;Property;_DistanceCutoff;Distance Cutoff;6;0;Create;True;0;0;0;False;0;False;0;4.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;815;-1328,-1376;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;814;-1520,-1376;Inherit;False;1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;537;-2816,32;Inherit;False;Property;_AmbientColor;Ambient Color;7;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.5,1;0.3215685,0.2135645,0.1568627,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;880;-2256,-2064;Inherit;False;Property;_CKey4;CKey4;45;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;881;-2256,-1888;Inherit;False;Property;_CKey5;CKey5;46;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;882;-2256,-1712;Inherit;False;Property;_CKey6;CKey6;47;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;883;-2256,-1536;Inherit;False;Property;_CKey7;CKey7;48;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;879;-2464,-1536;Inherit;False;Property;_CKey3;CKey3;44;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;878;-2464,-1712;Inherit;False;Property;_CKey2;CKey2;43;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;877;-2464,-1888;Inherit;False;Property;_CKey1;CKey1;42;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;876;-2464,-2064;Inherit;False;Property;_CKey0;CKey0;41;1;[HideInInspector];Create;True;0;0;0;True;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;591;-3360,-1968;Inherit;False;Property;_ToonContourColor;Toon Contour Color;13;1;[Gamma];Create;True;0;0;0;False;0;False;0,0,0,1;0.2309999,0.09989185,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;507;-3552,-1040;Inherit;False;Property;_BaseColor;Base Color;0;0;Create;True;0;0;0;True;0;False;0.5,0.5,0.5,1;0.6415094,0.5753859,0.5224872,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;800;-624,-960;Inherit;False;Property;_OutlineColor;Outline Color;25;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,1;0,0,0,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.IntNode;930;-1232,-1968;Inherit;False;Property;_CheckDef;CheckDef;65;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;497;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;498;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;499;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;500;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;501;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;502;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;503;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;504;-48,112;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;496;80,-384;Float;False;True;-1;2;BToonOutlineEditor;0;18;BUDU Shaders/BToonOutline;7489fd76ebdb00b448e337e26be4b0c3;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;True;True;False;0;False;;255;False;;255;False;;1;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;_SrcBlend;0;False;_DstBlend;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;True;_ZWrite;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;22;Surface;0;638573379598595822;  Blend;0;638573377400007209;Two Sided;1;638573377426528578;Forward Only;1;638573379470244868;Cast Shadows;1;0;  Use Shadow Threshold;0;638525090312585563;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;Meta Pass;0;638573377804228888;Extra Pre Pass;1;638573377687142519;Tessellation;0;638573377672012161;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;638573353479295507;0;10;True;True;True;True;False;False;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;495;80,-864;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;18;New Amplify Shader;7489fd76ebdb00b448e337e26be4b0c3;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;True;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;True;0;False;;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;False;;True;3;False;;True;True;0;False;_OutlineFactor;0;False;_OutlineOffset;True;0;False;False;0;;0;0;Standard;0;False;0
WireConnection;825;5;826;0
WireConnection;827;0;828;0
WireConnection;827;1;825;0
WireConnection;829;0;827;0
WireConnection;519;5;518;0
WireConnection;523;0;521;0
WireConnection;523;1;519;0
WireConnection;830;0;523;0
WireConnection;830;1;831;0
WireConnection;520;0;830;0
WireConnection;522;0;520;0
WireConnection;582;0;583;0
WireConnection;582;1;584;0
WireConnection;513;0;515;0
WireConnection;513;1;514;0
WireConnection;585;0;582;0
WireConnection;616;0;577;0
WireConnection;516;0;513;0
WireConnection;576;0;616;0
WireConnection;576;1;578;0
WireConnection;623;0;619;1
WireConnection;623;1;620;0
WireConnection;575;0;576;0
WireConnection;669;0;623;0
WireConnection;555;0;508;0
WireConnection;528;0;529;1
WireConnection;528;1;531;0
WireConnection;670;0;633;0
WireConnection;573;0;575;0
WireConnection;615;0;574;0
WireConnection;624;0;669;0
WireConnection;624;1;670;0
WireConnection;673;0;625;0
WireConnection;674;0;626;0
WireConnection;538;0;536;0
WireConnection;553;0;528;0
WireConnection;571;0;573;0
WireConnection;571;1;615;0
WireConnection;590;0;589;0
WireConnection;590;1;587;0
WireConnection;567;0;525;0
WireConnection;567;1;568;0
WireConnection;567;2;569;0
WireConnection;739;0;529;1
WireConnection;739;1;714;0
WireConnection;738;0;553;0
WireConnection;738;1;714;0
WireConnection;920;0;538;0
WireConnection;920;2;922;0
WireConnection;920;4;918;0
WireConnection;558;0;556;0
WireConnection;627;0;624;0
WireConnection;627;1;673;0
WireConnection;627;2;674;0
WireConnection;706;0;701;0
WireConnection;707;0;702;0
WireConnection;588;0;571;0
WireConnection;588;1;590;0
WireConnection;566;1;567;0
WireConnection;696;0;692;0
WireConnection;729;0;739;0
WireConnection;729;1;738;0
WireConnection;919;0;920;0
WireConnection;557;0;537;0
WireConnection;557;1;558;0
WireConnection;629;0;627;0
WireConnection;629;1;628;0
WireConnection;635;0;630;0
WireConnection;694;0;904;0
WireConnection;694;1;566;0
WireConnection;614;0;571;0
WireConnection;614;1;588;0
WireConnection;506;0;507;0
WireConnection;506;1;508;0
WireConnection;711;0;712;0
WireConnection;711;1;729;0
WireConnection;710;0;709;0
WireConnection;710;1;696;0
WireConnection;540;0;919;0
WireConnection;540;1;557;0
WireConnection;631;0;635;0
WireConnection;631;1;629;0
WireConnection;613;0;614;0
WireConnection;594;0;593;0
WireConnection;594;1;591;0
WireConnection;509;0;506;0
WireConnection;700;0;705;0
WireConnection;700;1;710;0
WireConnection;912;0;913;0
WireConnection;912;1;540;0
WireConnection;530;0;711;0
WireConnection;915;0;914;0
WireConnection;915;1;631;0
WireConnection;693;0;694;0
WireConnection;595;0;613;0
WireConnection;595;1;594;0
WireConnection;607;0;613;0
WireConnection;541;0;912;0
WireConnection;699;0;700;0
WireConnection;632;0;915;0
WireConnection;720;0;717;0
WireConnection;720;1;719;0
WireConnection;720;2;728;0
WireConnection;572;0;595;0
WireConnection;606;0;607;0
WireConnection;726;0;716;0
WireConnection;726;1;720;0
WireConnection;726;2;727;0
WireConnection;726;3;721;0
WireConnection;599;0;579;0
WireConnection;599;1;726;0
WireConnection;599;2;608;0
WireConnection;819;0;815;3
WireConnection;819;1;818;0
WireConnection;820;0;817;0
WireConnection;820;1;816;0
WireConnection;820;2;819;0
WireConnection;835;0;928;0
WireConnection;835;1;822;0
WireConnection;801;0;726;0
WireConnection;801;1;800;0
WireConnection;524;0;830;0
WireConnection;908;0;907;0
WireConnection;741;0;726;0
WireConnection;741;1;599;0
WireConnection;821;0;820;0
WireConnection;815;0;814;0
WireConnection;496;2;741;0
WireConnection;495;0;801;0
WireConnection;495;3;835;0
ASEEND*/
//CHKSM=521123DC93EF27534F23C44E3D1D0390197D9135
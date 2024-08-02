// Made with Amplify Shader Editor v1.9.6.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BWaterSurface"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[KeywordEnum(LayerA,LayerB,Multiply,Add,Subtract,Divide,Dot,FMod,FModInvert)] _SelectType("SelectType", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseBType("NoiseBType", Float) = 0
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _CausticB_OCT("CausticB_OCT", Float) = 0
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _CellB_OCT("CellB_OCT", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseAType("NoiseAType", Float) = 0
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _CausticA_OCT("CausticA_OCT", Float) = 0
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _CellA_OCT("CellA_OCT", Float) = 0
		[Toggle(_MASK_ON)] _Mask("Mask", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _MaskGradeType("MaskGradeType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _TxtGradeType("TxtGradeType", Float) = 0
		[KeywordEnum(Depth,FlowTexture)] _FlowMapType("FlowMapType", Float) = 1
		_NTypeAAnchorX("NType A Anchor X", Float) = 0
		_NTypeBAnchorX("NType B Anchor X", Float) = 0
		_NTypeBTileX("NType B Tile X", Float) = 1
		_NTypeATileX("NType A Tile X", Float) = 1
		_NTypeBTileY("NType B Tile Y", Float) = 1
		_NTypeATileY("NType A Tile Y", Float) = 1
		_NTypeBOffsetX("NType B Offset X", Float) = 0
		_NTypeAOffsetX("NType A Offset X", Float) = 0
		_ANoiseScale("A Noise Scale", Float) = 8
		_BNoiseScale("B Noise Scale", Float) = 8
		_NTypeBSpeedX("NType B Speed X", Float) = 0.1
		_NTypeASpeedX("NType A Speed X", Float) = 0.1
		_NTypeASpeedY("NType A Speed Y", Float) = 0.1
		_NTypeBSpeedY("NType B Speed Y", Float) = 0.1
		_NTypeBOverallSpeed("NType B OverallSpeed", Float) = 1
		_NTypeAOverallSpeed("NType A OverallSpeed", Float) = 1
		[NoScaleOffset]_DeformNoiseTypeB("Deform Noise Type B", 2D) = "white" {}
		[NoScaleOffset]_DeformNoiseTypeA("Deform Noise Type A", 2D) = "white" {}
		_NTypeARotate("NType A Rotate", Range( -360 , 360)) = 0
		_NTypeBRotate("NType B Rotate", Range( -360 , 360)) = 0
		[ToggleUI]_DfNoiseAInvert("DfNoiseAInvert", Float) = 0
		_FlowTextureExponential("FlowTextureExponential", Range( 0 , 4)) = 1
		_FlowTextureAmplitude("FlowTextureAmplitude", Range( 0 , 4)) = 1
		_DFAAmplitude("DFAAmplitude", Range( 0 , 4)) = 1
		_DFAExp("DFAExp", Range( 0 , 4)) = 1
		_DFBExp("DFBExp", Range( 0 , 4)) = 1
		[Toggle]_DfNoiseBInvert("DfNoiseBInvert", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DFAGradeType("DFAGradeType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DFBGradeType("DFBGradeType", Float) = 0
		_NoiseAContrast("Noise A Contrast", Range( 0 , 3)) = 1
		_DFBAmplitude("DFBAmplitude", Range( 0 , 4)) = 1
		_NA_Intensity("NA_Intensity", Range( 0 , 1)) = 1
		_NoiseBContrast("Noise B Contrast", Range( 0 , 3)) = 1
		_NB_Intensity("NB_Intensity", Range( 0 , 1)) = 1
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_NTypeBRotateSpeed("NType B Rotate Speed", Float) = 0
		_Float0("Float 0", Float) = 0.1
		_Float3("Float 3", Float) = 1
		_NTypeARotateSpeed("NType A Rotate Speed", Float) = 0
		_NTypeBOffsetY("NType B Offset Y", Float) = 0
		_NTypeAOffsetY("NType A Offset Y", Float) = 0
		_NTypeBAnchorY("NType B Anchor Y", Float) = 0
		_NTypeAAnchorY("NType A Anchor Y", Float) = 0
		_BVoronoiAngleSpeed("B Voronoi Angle Speed", Range( -8 , 8)) = 1
		_AVoronoiAngleSpeed("A Voronoi Angle Speed", Range( -8 , 8)) = 1
		_AVoronoiSmooth("A Voronoi Smooth", Range( 0 , 1)) = 0
		_BVoronoiSmooth("B Voronoi Smooth", Range( 0 , 1)) = 0
		[HideInInspector][IntRange]_CheckDef("CheckDef", Float) = 0
		[HideInInspector][IntRange]_dfNoiseBFold("dfNoiseBFold", Float) = 0
		[HideInInspector][IntRange]_dMaskFold("dMaskFold", Float) = 0
		[HideInInspector][IntRange]_dfNoiseAFold("dfNoiseAFold", Float) = 0
		[HideInInspector][IntRange]_DeformFold("DeformFold", Float) = 0
		[HideInInspector][IntRange]_fMaskFold("fMaskFold", Float) = 0
		[HideInInspector][IntRange]_fMapFold("fMapFold", Float) = 0
		[HideInInspector][IntRange]_CheckFlowMap("CheckFlowMap", Float) = 0
		[HideInInspector][IntRange]_fTxtFold("fTxtFold", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DepthGradeType("DepthGradeType", Float) = 1
		_DepthDistance("Depth Distance", Float) = 1
		_DepthExponential("Depth Exponential", Float) = 1
		_DepthSize("Depth Size", Range( 0 , 2)) = 1
		[NoScaleOffset]_FlowMap("Flow Map", 2D) = "white" {}
		[NoScaleOffset]_TextureMap("Texture Map", 2D) = "white" {}
		[NoScaleOffset]_MaskMap("Mask Map", 2D) = "white" {}
		_MaskGradePower("Mask Grade Power", Range( 1 , 20)) = 1
		_InfluenceFlow("InfluenceFlow", Range( -4 , 4)) = 2
		_OffsetB("Offset B", Range( -1 , 1)) = 0.5
		_FlowSpeed("Flow Speed", Float) = 0.25
		_FlowTextureContrast("Flow Texture Contrast", Range( -4 , 4)) = 1
		_MapExponential("Map Exponential", Range( -0.4 , 2)) = 0.3
		_MapChangeSpeed("Map Change Speed", Range( 0 , 20)) = 1
		_ATileY("ATileY", Float) = 1
		_ATileX("ATileX", Float) = 1
		[IntRange]_RotateA("Rotate A", Range( 0 , 4)) = 0
		_BTileX("BTileX", Float) = 1
		_BTileY("BTileY", Float) = 1
		[IntRange]_RotateB("Rotate B", Range( 0 , 4)) = 0


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
		ZWrite Off
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON
			#pragma shader_feature_local _DFAGRADETYPE_LINEAR _DFAGRADETYPE_NORMAL _DFAGRADETYPE_GAMMA
			#pragma shader_feature_local _DFBGRADETYPE_LINEAR _DFBGRADETYPE_NORMAL _DFBGRADETYPE_GAMMA


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);
			TEXTURE2D(_DeformNoiseTypeA);
			SAMPLER(sampler_DeformNoiseTypeA);
			TEXTURE2D(_DeformNoiseTypeB);
			SAMPLER(sampler_DeformNoiseTypeB);
			TEXTURE2D(_TextureSample0);
			SAMPLER(sampler_TextureSample0);


			float2 voronoihash2_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g488( n + g );
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
			
			float2 voronoihash8_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g488( n + g );
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
			
			float2 voronoihash18_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g488( n + g );
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
			
			float2 voronoihash17_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g488( n + g );
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
			
			float2 voronoihash10_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g488( n + g );
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
			
			float2 voronoihash12_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g488( n + g );
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
			
			float2 voronoihash24_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g488( n + g );
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
			
			float2 voronoihash23_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g488( n + g );
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
			
			float2 voronoihash2_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g487( n + g );
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
			
			float2 voronoihash8_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g487( n + g );
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
			
			float2 voronoihash18_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g487( n + g );
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
			
			float2 voronoihash17_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g487( n + g );
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
			
			float2 voronoihash10_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g487( n + g );
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
			
			float2 voronoihash12_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g487( n + g );
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
			
			float2 voronoihash24_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g487( n + g );
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
			
			float2 voronoihash23_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g487( n + g );
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
			
			float2 voronoihash2_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g484( n + g );
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
			
			float2 voronoihash8_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g484( n + g );
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
			
			float2 voronoihash18_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g484( n + g );
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
			
			float2 voronoihash17_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g484( n + g );
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
			
			float2 voronoihash10_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g484( n + g );
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
			
			float2 voronoihash12_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g484( n + g );
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
			
			float2 voronoihash24_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g484( n + g );
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
			
			float2 voronoihash23_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g484( n + g );
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
			
			float2 voronoihash2_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g483( n + g );
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
			
			float2 voronoihash8_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g483( n + g );
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
			
			float2 voronoihash18_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g483( n + g );
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
			
			float2 voronoihash17_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g483( n + g );
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
			
			float2 voronoihash10_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g483( n + g );
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
			
			float2 voronoihash12_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g483( n + g );
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
			
			float2 voronoihash24_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g483( n + g );
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
			
			float2 voronoihash23_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g483( n + g );
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = v.texcoord.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = v.texcoord.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				float4 temp_output_1033_0 = ( RF_DeformNoise974 * float4( 0,0,0,0 ) );
				
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
				v.tangentOS = temp_output_1033_0;

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

				float2 texCoord1147 = IN.ase_texcoord8.xy * float2( 6,6 ) + float2( 0,0 );
				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = IN.ase_texcoord8.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = IN.ase_texcoord8.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				#if ( SHADER_TARGET >= 50 )
				float recip1160 = rcp( _Float0 );
				#else
				float recip1160 = 1.0 / _Float0;
				#endif
				float2 temp_cast_23 = (_Float3).xx;
				

				float3 BaseColor = SAMPLE_TEXTURE2D( _TextureSample0, sampler_TextureSample0, ( texCoord1147 + abs( ( ( (RF_DeformNoise974).xy * recip1160 ) % temp_cast_23 ) ) ) ).rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = 0;
				float3 Specular = 0.5;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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

			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);


			
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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

			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);


			
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1

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
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON
			#pragma shader_feature_local _DFAGRADETYPE_LINEAR _DFAGRADETYPE_NORMAL _DFAGRADETYPE_GAMMA
			#pragma shader_feature_local _DFBGRADETYPE_LINEAR _DFBGRADETYPE_NORMAL _DFBGRADETYPE_GAMMA


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);
			TEXTURE2D(_TextureSample0);
			TEXTURE2D(_DeformNoiseTypeA);
			SAMPLER(sampler_DeformNoiseTypeA);
			TEXTURE2D(_DeformNoiseTypeB);
			SAMPLER(sampler_DeformNoiseTypeB);
			SAMPLER(sampler_TextureSample0);


			float2 voronoihash2_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g488( n + g );
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
			
			float2 voronoihash8_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g488( n + g );
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
			
			float2 voronoihash18_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g488( n + g );
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
			
			float2 voronoihash17_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g488( n + g );
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
			
			float2 voronoihash10_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g488( n + g );
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
			
			float2 voronoihash12_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g488( n + g );
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
			
			float2 voronoihash24_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g488( n + g );
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
			
			float2 voronoihash23_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g488( n + g );
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
			
			float2 voronoihash2_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g487( n + g );
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
			
			float2 voronoihash8_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g487( n + g );
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
			
			float2 voronoihash18_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g487( n + g );
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
			
			float2 voronoihash17_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g487( n + g );
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
			
			float2 voronoihash10_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g487( n + g );
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
			
			float2 voronoihash12_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g487( n + g );
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
			
			float2 voronoihash24_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g487( n + g );
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
			
			float2 voronoihash23_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g487( n + g );
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
			
			float2 voronoihash2_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g484( n + g );
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
			
			float2 voronoihash8_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g484( n + g );
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
			
			float2 voronoihash18_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g484( n + g );
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
			
			float2 voronoihash17_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g484( n + g );
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
			
			float2 voronoihash10_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g484( n + g );
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
			
			float2 voronoihash12_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g484( n + g );
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
			
			float2 voronoihash24_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g484( n + g );
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
			
			float2 voronoihash23_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g484( n + g );
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
			
			float2 voronoihash2_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g483( n + g );
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
			
			float2 voronoihash8_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g483( n + g );
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
			
			float2 voronoihash18_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g483( n + g );
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
			
			float2 voronoihash17_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g483( n + g );
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
			
			float2 voronoihash10_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g483( n + g );
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
			
			float2 voronoihash12_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g483( n + g );
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
			
			float2 voronoihash24_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g483( n + g );
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
			
			float2 voronoihash23_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g483( n + g );
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord4.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;

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

				float2 texCoord1147 = IN.ase_texcoord4.xy * float2( 6,6 ) + float2( 0,0 );
				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = IN.ase_texcoord4.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = IN.ase_texcoord4.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				#if ( SHADER_TARGET >= 50 )
				float recip1160 = rcp( _Float0 );
				#else
				float recip1160 = 1.0 / _Float0;
				#endif
				float2 temp_cast_23 = (_Float3).xx;
				

				float3 BaseColor = SAMPLE_TEXTURE2D( _TextureSample0, sampler_TextureSample0, ( texCoord1147 + abs( ( ( (RF_DeformNoise974).xy * recip1160 ) % temp_cast_23 ) ) ) ).rgb;
				float3 Emission = 0;
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
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


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
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON
			#pragma shader_feature_local _DFAGRADETYPE_LINEAR _DFAGRADETYPE_NORMAL _DFAGRADETYPE_GAMMA
			#pragma shader_feature_local _DFBGRADETYPE_LINEAR _DFBGRADETYPE_NORMAL _DFBGRADETYPE_GAMMA


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);
			TEXTURE2D(_TextureSample0);
			TEXTURE2D(_DeformNoiseTypeA);
			SAMPLER(sampler_DeformNoiseTypeA);
			TEXTURE2D(_DeformNoiseTypeB);
			SAMPLER(sampler_DeformNoiseTypeB);
			SAMPLER(sampler_TextureSample0);


			float2 voronoihash2_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g488( n + g );
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
			
			float2 voronoihash8_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g488( n + g );
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
			
			float2 voronoihash18_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g488( n + g );
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
			
			float2 voronoihash17_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g488( n + g );
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
			
			float2 voronoihash10_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g488( n + g );
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
			
			float2 voronoihash12_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g488( n + g );
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
			
			float2 voronoihash24_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g488( n + g );
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
			
			float2 voronoihash23_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g488( n + g );
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
			
			float2 voronoihash2_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g487( n + g );
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
			
			float2 voronoihash8_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g487( n + g );
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
			
			float2 voronoihash18_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g487( n + g );
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
			
			float2 voronoihash17_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g487( n + g );
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
			
			float2 voronoihash10_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g487( n + g );
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
			
			float2 voronoihash12_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g487( n + g );
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
			
			float2 voronoihash24_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g487( n + g );
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
			
			float2 voronoihash23_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g487( n + g );
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
			
			float2 voronoihash2_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g484( n + g );
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
			
			float2 voronoihash8_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g484( n + g );
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
			
			float2 voronoihash18_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g484( n + g );
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
			
			float2 voronoihash17_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g484( n + g );
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
			
			float2 voronoihash10_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g484( n + g );
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
			
			float2 voronoihash12_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g484( n + g );
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
			
			float2 voronoihash24_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g484( n + g );
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
			
			float2 voronoihash23_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g484( n + g );
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
			
			float2 voronoihash2_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g483( n + g );
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
			
			float2 voronoihash8_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g483( n + g );
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
			
			float2 voronoihash18_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g483( n + g );
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
			
			float2 voronoihash17_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g483( n + g );
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
			
			float2 voronoihash10_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g483( n + g );
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
			
			float2 voronoihash12_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g483( n + g );
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
			
			float2 voronoihash24_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g483( n + g );
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
			
			float2 voronoihash23_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g483( n + g );
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

				float2 texCoord1147 = IN.ase_texcoord2.xy * float2( 6,6 ) + float2( 0,0 );
				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = IN.ase_texcoord2.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = IN.ase_texcoord2.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				#if ( SHADER_TARGET >= 50 )
				float recip1160 = rcp( _Float0 );
				#else
				float recip1160 = 1.0 / _Float0;
				#endif
				float2 temp_cast_23 = (_Float3).xx;
				

				float3 BaseColor = SAMPLE_TEXTURE2D( _TextureSample0, sampler_TextureSample0, ( texCoord1147 + abs( ( ( (RF_DeformNoise974).xy * recip1160 ) % temp_cast_23 ) ) ) ).rgb;
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
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

			

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
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON
			#pragma shader_feature_local _DFAGRADETYPE_LINEAR _DFAGRADETYPE_NORMAL _DFAGRADETYPE_GAMMA
			#pragma shader_feature_local _DFBGRADETYPE_LINEAR _DFBGRADETYPE_NORMAL _DFBGRADETYPE_GAMMA


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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);
			TEXTURE2D(_DeformNoiseTypeA);
			SAMPLER(sampler_DeformNoiseTypeA);
			TEXTURE2D(_DeformNoiseTypeB);
			SAMPLER(sampler_DeformNoiseTypeB);


			float2 voronoihash2_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g488( n + g );
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
			
			float2 voronoihash8_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g488( n + g );
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
			
			float2 voronoihash18_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g488( n + g );
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
			
			float2 voronoihash17_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g488( n + g );
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
			
			float2 voronoihash10_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g488( n + g );
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
			
			float2 voronoihash12_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g488( n + g );
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
			
			float2 voronoihash24_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g488( n + g );
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
			
			float2 voronoihash23_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g488( n + g );
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
			
			float2 voronoihash2_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g487( n + g );
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
			
			float2 voronoihash8_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g487( n + g );
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
			
			float2 voronoihash18_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g487( n + g );
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
			
			float2 voronoihash17_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g487( n + g );
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
			
			float2 voronoihash10_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g487( n + g );
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
			
			float2 voronoihash12_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g487( n + g );
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
			
			float2 voronoihash24_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g487( n + g );
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
			
			float2 voronoihash23_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g487( n + g );
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
			
			float2 voronoihash2_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g484( n + g );
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
			
			float2 voronoihash8_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g484( n + g );
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
			
			float2 voronoihash18_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g484( n + g );
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
			
			float2 voronoihash17_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g484( n + g );
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
			
			float2 voronoihash10_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g484( n + g );
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
			
			float2 voronoihash12_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g484( n + g );
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
			
			float2 voronoihash24_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g484( n + g );
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
			
			float2 voronoihash23_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g484( n + g );
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
			
			float2 voronoihash2_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g483( n + g );
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
			
			float2 voronoihash8_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g483( n + g );
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
			
			float2 voronoihash18_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g483( n + g );
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
			
			float2 voronoihash17_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g483( n + g );
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
			
			float2 voronoihash10_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g483( n + g );
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
			
			float2 voronoihash12_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g483( n + g );
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
			
			float2 voronoihash24_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g483( n + g );
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
			
			float2 voronoihash23_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g483( n + g );
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = v.ase_texcoord.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = v.ase_texcoord.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				float4 temp_output_1033_0 = ( RF_DeformNoise974 * float4( 0,0,0,0 ) );
				
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
				v.tangentOS = temp_output_1033_0;

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
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
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
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON
			#pragma shader_feature_local _DFAGRADETYPE_LINEAR _DFAGRADETYPE_NORMAL _DFAGRADETYPE_GAMMA
			#pragma shader_feature_local _DFBGRADETYPE_LINEAR _DFBGRADETYPE_NORMAL _DFBGRADETYPE_GAMMA


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);
			TEXTURE2D(_DeformNoiseTypeA);
			SAMPLER(sampler_DeformNoiseTypeA);
			TEXTURE2D(_DeformNoiseTypeB);
			SAMPLER(sampler_DeformNoiseTypeB);
			TEXTURE2D(_TextureSample0);
			SAMPLER(sampler_TextureSample0);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float2 voronoihash2_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g488( n + g );
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
			
			float2 voronoihash8_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g488( n + g );
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
			
			float2 voronoihash18_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g488( n + g );
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
			
			float2 voronoihash17_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g488( n + g );
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
			
			float2 voronoihash10_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g488( n + g );
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
			
			float2 voronoihash12_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g488( n + g );
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
			
			float2 voronoihash24_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g488( n + g );
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
			
			float2 voronoihash23_g488( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g488( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g488( n + g );
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
			
			float2 voronoihash2_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g487( n + g );
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
			
			float2 voronoihash8_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g487( n + g );
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
			
			float2 voronoihash18_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g487( n + g );
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
			
			float2 voronoihash17_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g487( n + g );
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
			
			float2 voronoihash10_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g487( n + g );
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
			
			float2 voronoihash12_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g487( n + g );
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
			
			float2 voronoihash24_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g487( n + g );
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
			
			float2 voronoihash23_g487( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g487( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g487( n + g );
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
			
			float2 voronoihash2_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g484( n + g );
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
			
			float2 voronoihash8_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g484( n + g );
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
			
			float2 voronoihash18_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g484( n + g );
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
			
			float2 voronoihash17_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g484( n + g );
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
			
			float2 voronoihash10_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g484( n + g );
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
			
			float2 voronoihash12_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g484( n + g );
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
			
			float2 voronoihash24_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g484( n + g );
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
			
			float2 voronoihash23_g484( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g484( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g484( n + g );
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
			
			float2 voronoihash2_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g483( n + g );
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
			
			float2 voronoihash8_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g483( n + g );
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
			
			float2 voronoihash18_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g483( n + g );
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
			
			float2 voronoihash17_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g483( n + g );
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
			
			float2 voronoihash10_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g483( n + g );
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
			
			float2 voronoihash12_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g483( n + g );
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
			
			float2 voronoihash24_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g483( n + g );
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
			
			float2 voronoihash23_g483( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g483( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g483( n + g );
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = v.texcoord.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = v.texcoord.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D_LOD( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1, 0.0 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				float4 temp_output_1033_0 = ( RF_DeformNoise974 * float4( 0,0,0,0 ) );
				
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
				v.tangentOS = temp_output_1033_0;

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

				float2 texCoord1147 = IN.ase_texcoord8.xy * float2( 6,6 ) + float2( 0,0 );
				float RF_Zero56_g485 = 0.0;
				float3 temp_cast_1 = (RF_Zero56_g485).xxx;
				float temp_output_36_0_g485 = _ANoiseScale;
				float temp_output_5_0_g488 = temp_output_36_0_g485;
				float mulTime3_g485 = _TimeParameters.x * _AVoronoiAngleSpeed;
				float temp_output_4_0_g488 = mulTime3_g485;
				float time2_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId2_g488 = 0;
				float temp_output_28_0_g488 = _AVoronoiSmooth;
				float voronoiSmooth2_g488 = temp_output_28_0_g488;
				float2 appendResult39_g486 = (float2(_NTypeATileX , _NTypeATileY));
				float temp_output_53_0_g486 = _NTypeAOverallSpeed;
				float mulTime27_g486 = _TimeParameters.x * ( _NTypeASpeedX * temp_output_53_0_g486 );
				float mulTime28_g486 = _TimeParameters.x * ( _NTypeASpeedY * temp_output_53_0_g486 );
				float2 appendResult34_g486 = (float2(( _NTypeAOffsetX + mulTime27_g486 ) , ( mulTime28_g486 + _NTypeAOffsetY )));
				float2 texCoord37_g486 = IN.ase_texcoord8.xy * appendResult39_g486 + appendResult34_g486;
				float2 appendResult36_g486 = (float2(_NTypeAAnchorX , _NTypeAAnchorY));
				float mulTime29_g486 = _TimeParameters.x * _NTypeARotateSpeed;
				float cos38_g486 = cos( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float sin38_g486 = sin( ( radians( mulTime29_g486 ) + radians( _NTypeARotate ) ) );
				float2 rotator38_g486 = mul( texCoord37_g486 - appendResult36_g486 , float2x2( cos38_g486 , -sin38_g486 , sin38_g486 , cos38_g486 )) + appendResult36_g486;
				float2 UV20_g485 = rotator38_g486;
				float2 temp_output_3_0_g488 = UV20_g485;
				float2 coords2_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id2_g488 = 0;
				float2 uv2_g488 = 0;
				float voroi2_g488 = voronoi2_g488( coords2_g488, time2_g488, id2_g488, uv2_g488, voronoiSmooth2_g488, voronoiSmoothId2_g488 );
				float time8_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId8_g488 = 0;
				float voronoiSmooth8_g488 = temp_output_28_0_g488;
				float2 coords8_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id8_g488 = 0;
				float2 uv8_g488 = 0;
				float fade8_g488 = 0.5;
				float voroi8_g488 = 0;
				float rest8_g488 = 0;
				for( int it8_g488 = 0; it8_g488 <2; it8_g488++ ){
				voroi8_g488 += fade8_g488 * voronoi8_g488( coords8_g488, time8_g488, id8_g488, uv8_g488, voronoiSmooth8_g488,voronoiSmoothId8_g488 );
				rest8_g488 += fade8_g488;
				coords8_g488 *= 2;
				fade8_g488 *= 0.5;
				}//Voronoi8_g488
				voroi8_g488 /= rest8_g488;
				float time18_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId18_g488 = 0;
				float voronoiSmooth18_g488 = temp_output_28_0_g488;
				float2 coords18_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id18_g488 = 0;
				float2 uv18_g488 = 0;
				float fade18_g488 = 0.5;
				float voroi18_g488 = 0;
				float rest18_g488 = 0;
				for( int it18_g488 = 0; it18_g488 <3; it18_g488++ ){
				voroi18_g488 += fade18_g488 * voronoi18_g488( coords18_g488, time18_g488, id18_g488, uv18_g488, voronoiSmooth18_g488,voronoiSmoothId18_g488 );
				rest18_g488 += fade18_g488;
				coords18_g488 *= 2;
				fade18_g488 *= 0.5;
				}//Voronoi18_g488
				voroi18_g488 /= rest18_g488;
				float time17_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId17_g488 = 0;
				float voronoiSmooth17_g488 = temp_output_28_0_g488;
				float2 coords17_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id17_g488 = 0;
				float2 uv17_g488 = 0;
				float fade17_g488 = 0.5;
				float voroi17_g488 = 0;
				float rest17_g488 = 0;
				for( int it17_g488 = 0; it17_g488 <4; it17_g488++ ){
				voroi17_g488 += fade17_g488 * voronoi17_g488( coords17_g488, time17_g488, id17_g488, uv17_g488, voronoiSmooth17_g488,voronoiSmoothId17_g488 );
				rest17_g488 += fade17_g488;
				coords17_g488 *= 2;
				fade17_g488 *= 0.5;
				}//Voronoi17_g488
				voroi17_g488 /= rest17_g488;
				float time10_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId10_g488 = 0;
				float voronoiSmooth10_g488 = temp_output_28_0_g488;
				float2 coords10_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id10_g488 = 0;
				float2 uv10_g488 = 0;
				float fade10_g488 = 0.5;
				float voroi10_g488 = 0;
				float rest10_g488 = 0;
				for( int it10_g488 = 0; it10_g488 <5; it10_g488++ ){
				voroi10_g488 += fade10_g488 * voronoi10_g488( coords10_g488, time10_g488, id10_g488, uv10_g488, voronoiSmooth10_g488,voronoiSmoothId10_g488 );
				rest10_g488 += fade10_g488;
				coords10_g488 *= 2;
				fade10_g488 *= 0.5;
				}//Voronoi10_g488
				voroi10_g488 /= rest10_g488;
				float time12_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId12_g488 = 0;
				float voronoiSmooth12_g488 = temp_output_28_0_g488;
				float2 coords12_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id12_g488 = 0;
				float2 uv12_g488 = 0;
				float fade12_g488 = 0.5;
				float voroi12_g488 = 0;
				float rest12_g488 = 0;
				for( int it12_g488 = 0; it12_g488 <6; it12_g488++ ){
				voroi12_g488 += fade12_g488 * voronoi12_g488( coords12_g488, time12_g488, id12_g488, uv12_g488, voronoiSmooth12_g488,voronoiSmoothId12_g488 );
				rest12_g488 += fade12_g488;
				coords12_g488 *= 2;
				fade12_g488 *= 0.5;
				}//Voronoi12_g488
				voroi12_g488 /= rest12_g488;
				float time24_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId24_g488 = 0;
				float voronoiSmooth24_g488 = temp_output_28_0_g488;
				float2 coords24_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id24_g488 = 0;
				float2 uv24_g488 = 0;
				float fade24_g488 = 0.5;
				float voroi24_g488 = 0;
				float rest24_g488 = 0;
				for( int it24_g488 = 0; it24_g488 <7; it24_g488++ ){
				voroi24_g488 += fade24_g488 * voronoi24_g488( coords24_g488, time24_g488, id24_g488, uv24_g488, voronoiSmooth24_g488,voronoiSmoothId24_g488 );
				rest24_g488 += fade24_g488;
				coords24_g488 *= 2;
				fade24_g488 *= 0.5;
				}//Voronoi24_g488
				voroi24_g488 /= rest24_g488;
				float time23_g488 = temp_output_4_0_g488;
				float2 voronoiSmoothId23_g488 = 0;
				float voronoiSmooth23_g488 = temp_output_28_0_g488;
				float2 coords23_g488 = temp_output_3_0_g488 * temp_output_5_0_g488;
				float2 id23_g488 = 0;
				float2 uv23_g488 = 0;
				float fade23_g488 = 0.5;
				float voroi23_g488 = 0;
				float rest23_g488 = 0;
				for( int it23_g488 = 0; it23_g488 <8; it23_g488++ ){
				voroi23_g488 += fade23_g488 * voronoi23_g488( coords23_g488, time23_g488, id23_g488, uv23_g488, voronoiSmooth23_g488,voronoiSmoothId23_g488 );
				rest23_g488 += fade23_g488;
				coords23_g488 *= 2;
				fade23_g488 *= 0.5;
				}//Voronoi23_g488
				voroi23_g488 /= rest23_g488;
				#if defined( _CELLA_OCT_CELL1 )
				float staticSwitch40_g485 = voroi2_g488;
				#elif defined( _CELLA_OCT_CELL2 )
				float staticSwitch40_g485 = voroi8_g488;
				#elif defined( _CELLA_OCT_CELL3 )
				float staticSwitch40_g485 = voroi18_g488;
				#elif defined( _CELLA_OCT_CELL4 )
				float staticSwitch40_g485 = voroi17_g488;
				#elif defined( _CELLA_OCT_CELL5 )
				float staticSwitch40_g485 = voroi10_g488;
				#elif defined( _CELLA_OCT_CELL6 )
				float staticSwitch40_g485 = voroi12_g488;
				#elif defined( _CELLA_OCT_CELL7 )
				float staticSwitch40_g485 = voroi24_g488;
				#elif defined( _CELLA_OCT_CELL8 )
				float staticSwitch40_g485 = voroi23_g488;
				#else
				float staticSwitch40_g485 = voroi2_g488;
				#endif
				float3 temp_cast_2 = (staticSwitch40_g485).xxx;
				float temp_output_5_0_g487 = temp_output_36_0_g485;
				float temp_output_4_0_g487 = mulTime3_g485;
				float time2_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId2_g487 = 0;
				float voronoiSmooth2_g487 = 0.0;
				float2 temp_output_3_0_g487 = UV20_g485;
				float2 coords2_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id2_g487 = 0;
				float2 uv2_g487 = 0;
				float voroi2_g487 = voronoi2_g487( coords2_g487, time2_g487, id2_g487, uv2_g487, voronoiSmooth2_g487, voronoiSmoothId2_g487 );
				float time8_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId8_g487 = 0;
				float voronoiSmooth8_g487 = 0.0;
				float2 coords8_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id8_g487 = 0;
				float2 uv8_g487 = 0;
				float fade8_g487 = 0.5;
				float voroi8_g487 = 0;
				float rest8_g487 = 0;
				for( int it8_g487 = 0; it8_g487 <2; it8_g487++ ){
				voroi8_g487 += fade8_g487 * voronoi8_g487( coords8_g487, time8_g487, id8_g487, uv8_g487, voronoiSmooth8_g487,voronoiSmoothId8_g487 );
				rest8_g487 += fade8_g487;
				coords8_g487 *= 2;
				fade8_g487 *= 0.5;
				}//Voronoi8_g487
				voroi8_g487 /= rest8_g487;
				float time18_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId18_g487 = 0;
				float voronoiSmooth18_g487 = 0.0;
				float2 coords18_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id18_g487 = 0;
				float2 uv18_g487 = 0;
				float fade18_g487 = 0.5;
				float voroi18_g487 = 0;
				float rest18_g487 = 0;
				for( int it18_g487 = 0; it18_g487 <3; it18_g487++ ){
				voroi18_g487 += fade18_g487 * voronoi18_g487( coords18_g487, time18_g487, id18_g487, uv18_g487, voronoiSmooth18_g487,voronoiSmoothId18_g487 );
				rest18_g487 += fade18_g487;
				coords18_g487 *= 2;
				fade18_g487 *= 0.5;
				}//Voronoi18_g487
				voroi18_g487 /= rest18_g487;
				float time17_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId17_g487 = 0;
				float voronoiSmooth17_g487 = 0.0;
				float2 coords17_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id17_g487 = 0;
				float2 uv17_g487 = 0;
				float fade17_g487 = 0.5;
				float voroi17_g487 = 0;
				float rest17_g487 = 0;
				for( int it17_g487 = 0; it17_g487 <6; it17_g487++ ){
				voroi17_g487 += fade17_g487 * voronoi17_g487( coords17_g487, time17_g487, id17_g487, uv17_g487, voronoiSmooth17_g487,voronoiSmoothId17_g487 );
				rest17_g487 += fade17_g487;
				coords17_g487 *= 2;
				fade17_g487 *= 0.5;
				}//Voronoi17_g487
				voroi17_g487 /= rest17_g487;
				float time10_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId10_g487 = 0;
				float2 coords10_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id10_g487 = 0;
				float2 uv10_g487 = 0;
				float voroi10_g487 = voronoi10_g487( coords10_g487, time10_g487, id10_g487, uv10_g487, 0, voronoiSmoothId10_g487 );
				float time12_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId12_g487 = 0;
				float2 coords12_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id12_g487 = 0;
				float2 uv12_g487 = 0;
				float fade12_g487 = 0.5;
				float voroi12_g487 = 0;
				float rest12_g487 = 0;
				for( int it12_g487 = 0; it12_g487 <3; it12_g487++ ){
				voroi12_g487 += fade12_g487 * voronoi12_g487( coords12_g487, time12_g487, id12_g487, uv12_g487, 0,voronoiSmoothId12_g487 );
				rest12_g487 += fade12_g487;
				coords12_g487 *= 2;
				fade12_g487 *= 0.5;
				}//Voronoi12_g487
				voroi12_g487 /= rest12_g487;
				float time24_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId24_g487 = 0;
				float2 coords24_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id24_g487 = 0;
				float2 uv24_g487 = 0;
				float fade24_g487 = 0.5;
				float voroi24_g487 = 0;
				float rest24_g487 = 0;
				for( int it24_g487 = 0; it24_g487 <5; it24_g487++ ){
				voroi24_g487 += fade24_g487 * voronoi24_g487( coords24_g487, time24_g487, id24_g487, uv24_g487, 0,voronoiSmoothId24_g487 );
				rest24_g487 += fade24_g487;
				coords24_g487 *= 2;
				fade24_g487 *= 0.5;
				}//Voronoi24_g487
				voroi24_g487 /= rest24_g487;
				float time23_g487 = temp_output_4_0_g487;
				float2 voronoiSmoothId23_g487 = 0;
				float2 coords23_g487 = temp_output_3_0_g487 * temp_output_5_0_g487;
				float2 id23_g487 = 0;
				float2 uv23_g487 = 0;
				float fade23_g487 = 0.5;
				float voroi23_g487 = 0;
				float rest23_g487 = 0;
				for( int it23_g487 = 0; it23_g487 <6; it23_g487++ ){
				voroi23_g487 += fade23_g487 * voronoi23_g487( coords23_g487, time23_g487, id23_g487, uv23_g487, 0,voronoiSmoothId23_g487 );
				rest23_g487 += fade23_g487;
				coords23_g487 *= 2;
				fade23_g487 *= 0.5;
				}//Voronoi23_g487
				voroi23_g487 /= rest23_g487;
				#if defined( _CAUSTICA_OCT_CAUSTIC1 )
				float staticSwitch13_g485 = voroi2_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC2 )
				float staticSwitch13_g485 = voroi8_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC3 )
				float staticSwitch13_g485 = voroi18_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC4 )
				float staticSwitch13_g485 = voroi17_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC5 )
				float staticSwitch13_g485 = voroi10_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC6 )
				float staticSwitch13_g485 = voroi12_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC7 )
				float staticSwitch13_g485 = voroi24_g487;
				#elif defined( _CAUSTICA_OCT_CAUSTIC8 )
				float staticSwitch13_g485 = voroi23_g487;
				#else
				float staticSwitch13_g485 = voroi2_g487;
				#endif
				float3 temp_cast_3 = (staticSwitch13_g485).xxx;
				float simplePerlin2D12_g485 = snoise( UV20_g485*temp_output_36_0_g485 );
				simplePerlin2D12_g485 = simplePerlin2D12_g485*0.5 + 0.5;
				float3 temp_cast_4 = (simplePerlin2D12_g485).xxx;
				float3 temp_cast_5 = (RF_Zero56_g485).xxx;
				#if defined( _NOISEATYPE_NONE )
				float3 staticSwitch17_g485 = temp_cast_5;
				#elif defined( _NOISEATYPE_VORONOICELL )
				float3 staticSwitch17_g485 = temp_cast_2;
				#elif defined( _NOISEATYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g485 = temp_cast_3;
				#elif defined( _NOISEATYPE_PERLIN )
				float3 staticSwitch17_g485 = temp_cast_4;
				#elif defined( _NOISEATYPE_TEXTURE )
				float3 staticSwitch17_g485 = SAMPLE_TEXTURE2D( _DeformNoiseTypeA, sampler_DeformNoiseTypeA, UV20_g485 ).rgb;
				#else
				float3 staticSwitch17_g485 = temp_cast_5;
				#endif
				float3 DBG_RF_NoiseOUT_A674 = staticSwitch17_g485;
				float3 gammaToLinear829 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_A674 ) );
				float3 linearToGamma831 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_A674 ) );
				#if defined( _DFAGRADETYPE_LINEAR )
				float3 staticSwitch834 = gammaToLinear829;
				#elif defined( _DFAGRADETYPE_NORMAL )
				float3 staticSwitch834 = saturate( DBG_RF_NoiseOUT_A674 );
				#elif defined( _DFAGRADETYPE_GAMMA )
				float3 staticSwitch834 = linearToGamma831;
				#else
				float3 staticSwitch834 = gammaToLinear829;
				#endif
				float3 temp_cast_6 = (_DFAExp).xxx;
				float3 temp_output_855_0 = saturate( pow( (staticSwitch834*_DFAAmplitude + 0.0) , temp_cast_6 ) );
				float4 lerpResult5_g25 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_855_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g24 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseAInvert )?( saturate( lerpResult5_g25 ) ):( float4( temp_output_855_0 , 0.0 ) )) , _NoiseAContrast);
				float4 temp_output_17_0_g1 = ( _NA_Intensity * saturate( lerpResult5_g24 ) );
				float RF_Zero56_g1 = 0.0;
				float3 temp_cast_12 = (RF_Zero56_g1).xxx;
				float temp_output_36_0_g1 = _BNoiseScale;
				float temp_output_5_0_g484 = temp_output_36_0_g1;
				float mulTime3_g1 = _TimeParameters.x * _BVoronoiAngleSpeed;
				float temp_output_4_0_g484 = mulTime3_g1;
				float time2_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId2_g484 = 0;
				float temp_output_28_0_g484 = _BVoronoiSmooth;
				float voronoiSmooth2_g484 = temp_output_28_0_g484;
				float2 appendResult39_g485 = (float2(_NTypeBTileX , _NTypeBTileY));
				float temp_output_53_0_g485 = _NTypeBOverallSpeed;
				float mulTime27_g485 = _TimeParameters.x * ( _NTypeBSpeedX * temp_output_53_0_g485 );
				float mulTime28_g485 = _TimeParameters.x * ( _NTypeBSpeedY * temp_output_53_0_g485 );
				float2 appendResult34_g485 = (float2(( _NTypeBOffsetX + mulTime27_g485 ) , ( mulTime28_g485 + _NTypeBOffsetY )));
				float2 texCoord37_g485 = IN.ase_texcoord8.xy * appendResult39_g485 + appendResult34_g485;
				float2 appendResult36_g485 = (float2(_NTypeBAnchorX , _NTypeBAnchorY));
				float mulTime29_g485 = _TimeParameters.x * _NTypeBRotateSpeed;
				float cos38_g485 = cos( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float sin38_g485 = sin( ( radians( mulTime29_g485 ) + radians( _NTypeBRotate ) ) );
				float2 rotator38_g485 = mul( texCoord37_g485 - appendResult36_g485 , float2x2( cos38_g485 , -sin38_g485 , sin38_g485 , cos38_g485 )) + appendResult36_g485;
				float2 UV20_g1 = rotator38_g485;
				float2 temp_output_3_0_g484 = UV20_g1;
				float2 coords2_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id2_g484 = 0;
				float2 uv2_g484 = 0;
				float voroi2_g484 = voronoi2_g484( coords2_g484, time2_g484, id2_g484, uv2_g484, voronoiSmooth2_g484, voronoiSmoothId2_g484 );
				float time8_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId8_g484 = 0;
				float voronoiSmooth8_g484 = temp_output_28_0_g484;
				float2 coords8_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id8_g484 = 0;
				float2 uv8_g484 = 0;
				float fade8_g484 = 0.5;
				float voroi8_g484 = 0;
				float rest8_g484 = 0;
				for( int it8_g484 = 0; it8_g484 <2; it8_g484++ ){
				voroi8_g484 += fade8_g484 * voronoi8_g484( coords8_g484, time8_g484, id8_g484, uv8_g484, voronoiSmooth8_g484,voronoiSmoothId8_g484 );
				rest8_g484 += fade8_g484;
				coords8_g484 *= 2;
				fade8_g484 *= 0.5;
				}//Voronoi8_g484
				voroi8_g484 /= rest8_g484;
				float time18_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId18_g484 = 0;
				float voronoiSmooth18_g484 = temp_output_28_0_g484;
				float2 coords18_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id18_g484 = 0;
				float2 uv18_g484 = 0;
				float fade18_g484 = 0.5;
				float voroi18_g484 = 0;
				float rest18_g484 = 0;
				for( int it18_g484 = 0; it18_g484 <3; it18_g484++ ){
				voroi18_g484 += fade18_g484 * voronoi18_g484( coords18_g484, time18_g484, id18_g484, uv18_g484, voronoiSmooth18_g484,voronoiSmoothId18_g484 );
				rest18_g484 += fade18_g484;
				coords18_g484 *= 2;
				fade18_g484 *= 0.5;
				}//Voronoi18_g484
				voroi18_g484 /= rest18_g484;
				float time17_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId17_g484 = 0;
				float voronoiSmooth17_g484 = temp_output_28_0_g484;
				float2 coords17_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id17_g484 = 0;
				float2 uv17_g484 = 0;
				float fade17_g484 = 0.5;
				float voroi17_g484 = 0;
				float rest17_g484 = 0;
				for( int it17_g484 = 0; it17_g484 <4; it17_g484++ ){
				voroi17_g484 += fade17_g484 * voronoi17_g484( coords17_g484, time17_g484, id17_g484, uv17_g484, voronoiSmooth17_g484,voronoiSmoothId17_g484 );
				rest17_g484 += fade17_g484;
				coords17_g484 *= 2;
				fade17_g484 *= 0.5;
				}//Voronoi17_g484
				voroi17_g484 /= rest17_g484;
				float time10_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId10_g484 = 0;
				float voronoiSmooth10_g484 = temp_output_28_0_g484;
				float2 coords10_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id10_g484 = 0;
				float2 uv10_g484 = 0;
				float fade10_g484 = 0.5;
				float voroi10_g484 = 0;
				float rest10_g484 = 0;
				for( int it10_g484 = 0; it10_g484 <5; it10_g484++ ){
				voroi10_g484 += fade10_g484 * voronoi10_g484( coords10_g484, time10_g484, id10_g484, uv10_g484, voronoiSmooth10_g484,voronoiSmoothId10_g484 );
				rest10_g484 += fade10_g484;
				coords10_g484 *= 2;
				fade10_g484 *= 0.5;
				}//Voronoi10_g484
				voroi10_g484 /= rest10_g484;
				float time12_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId12_g484 = 0;
				float voronoiSmooth12_g484 = temp_output_28_0_g484;
				float2 coords12_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id12_g484 = 0;
				float2 uv12_g484 = 0;
				float fade12_g484 = 0.5;
				float voroi12_g484 = 0;
				float rest12_g484 = 0;
				for( int it12_g484 = 0; it12_g484 <6; it12_g484++ ){
				voroi12_g484 += fade12_g484 * voronoi12_g484( coords12_g484, time12_g484, id12_g484, uv12_g484, voronoiSmooth12_g484,voronoiSmoothId12_g484 );
				rest12_g484 += fade12_g484;
				coords12_g484 *= 2;
				fade12_g484 *= 0.5;
				}//Voronoi12_g484
				voroi12_g484 /= rest12_g484;
				float time24_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId24_g484 = 0;
				float voronoiSmooth24_g484 = temp_output_28_0_g484;
				float2 coords24_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id24_g484 = 0;
				float2 uv24_g484 = 0;
				float fade24_g484 = 0.5;
				float voroi24_g484 = 0;
				float rest24_g484 = 0;
				for( int it24_g484 = 0; it24_g484 <7; it24_g484++ ){
				voroi24_g484 += fade24_g484 * voronoi24_g484( coords24_g484, time24_g484, id24_g484, uv24_g484, voronoiSmooth24_g484,voronoiSmoothId24_g484 );
				rest24_g484 += fade24_g484;
				coords24_g484 *= 2;
				fade24_g484 *= 0.5;
				}//Voronoi24_g484
				voroi24_g484 /= rest24_g484;
				float time23_g484 = temp_output_4_0_g484;
				float2 voronoiSmoothId23_g484 = 0;
				float voronoiSmooth23_g484 = temp_output_28_0_g484;
				float2 coords23_g484 = temp_output_3_0_g484 * temp_output_5_0_g484;
				float2 id23_g484 = 0;
				float2 uv23_g484 = 0;
				float fade23_g484 = 0.5;
				float voroi23_g484 = 0;
				float rest23_g484 = 0;
				for( int it23_g484 = 0; it23_g484 <8; it23_g484++ ){
				voroi23_g484 += fade23_g484 * voronoi23_g484( coords23_g484, time23_g484, id23_g484, uv23_g484, voronoiSmooth23_g484,voronoiSmoothId23_g484 );
				rest23_g484 += fade23_g484;
				coords23_g484 *= 2;
				fade23_g484 *= 0.5;
				}//Voronoi23_g484
				voroi23_g484 /= rest23_g484;
				#if defined( _CELLB_OCT_CELL1 )
				float staticSwitch40_g1 = voroi2_g484;
				#elif defined( _CELLB_OCT_CELL2 )
				float staticSwitch40_g1 = voroi8_g484;
				#elif defined( _CELLB_OCT_CELL3 )
				float staticSwitch40_g1 = voroi18_g484;
				#elif defined( _CELLB_OCT_CELL4 )
				float staticSwitch40_g1 = voroi17_g484;
				#elif defined( _CELLB_OCT_CELL5 )
				float staticSwitch40_g1 = voroi10_g484;
				#elif defined( _CELLB_OCT_CELL6 )
				float staticSwitch40_g1 = voroi12_g484;
				#elif defined( _CELLB_OCT_CELL7 )
				float staticSwitch40_g1 = voroi24_g484;
				#elif defined( _CELLB_OCT_CELL8 )
				float staticSwitch40_g1 = voroi23_g484;
				#else
				float staticSwitch40_g1 = voroi2_g484;
				#endif
				float3 temp_cast_13 = (staticSwitch40_g1).xxx;
				float temp_output_5_0_g483 = temp_output_36_0_g1;
				float temp_output_4_0_g483 = mulTime3_g1;
				float time2_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId2_g483 = 0;
				float voronoiSmooth2_g483 = 0.0;
				float2 temp_output_3_0_g483 = UV20_g1;
				float2 coords2_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id2_g483 = 0;
				float2 uv2_g483 = 0;
				float voroi2_g483 = voronoi2_g483( coords2_g483, time2_g483, id2_g483, uv2_g483, voronoiSmooth2_g483, voronoiSmoothId2_g483 );
				float time8_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId8_g483 = 0;
				float voronoiSmooth8_g483 = 0.0;
				float2 coords8_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id8_g483 = 0;
				float2 uv8_g483 = 0;
				float fade8_g483 = 0.5;
				float voroi8_g483 = 0;
				float rest8_g483 = 0;
				for( int it8_g483 = 0; it8_g483 <2; it8_g483++ ){
				voroi8_g483 += fade8_g483 * voronoi8_g483( coords8_g483, time8_g483, id8_g483, uv8_g483, voronoiSmooth8_g483,voronoiSmoothId8_g483 );
				rest8_g483 += fade8_g483;
				coords8_g483 *= 2;
				fade8_g483 *= 0.5;
				}//Voronoi8_g483
				voroi8_g483 /= rest8_g483;
				float time18_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId18_g483 = 0;
				float voronoiSmooth18_g483 = 0.0;
				float2 coords18_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id18_g483 = 0;
				float2 uv18_g483 = 0;
				float fade18_g483 = 0.5;
				float voroi18_g483 = 0;
				float rest18_g483 = 0;
				for( int it18_g483 = 0; it18_g483 <3; it18_g483++ ){
				voroi18_g483 += fade18_g483 * voronoi18_g483( coords18_g483, time18_g483, id18_g483, uv18_g483, voronoiSmooth18_g483,voronoiSmoothId18_g483 );
				rest18_g483 += fade18_g483;
				coords18_g483 *= 2;
				fade18_g483 *= 0.5;
				}//Voronoi18_g483
				voroi18_g483 /= rest18_g483;
				float time17_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId17_g483 = 0;
				float voronoiSmooth17_g483 = 0.0;
				float2 coords17_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id17_g483 = 0;
				float2 uv17_g483 = 0;
				float fade17_g483 = 0.5;
				float voroi17_g483 = 0;
				float rest17_g483 = 0;
				for( int it17_g483 = 0; it17_g483 <6; it17_g483++ ){
				voroi17_g483 += fade17_g483 * voronoi17_g483( coords17_g483, time17_g483, id17_g483, uv17_g483, voronoiSmooth17_g483,voronoiSmoothId17_g483 );
				rest17_g483 += fade17_g483;
				coords17_g483 *= 2;
				fade17_g483 *= 0.5;
				}//Voronoi17_g483
				voroi17_g483 /= rest17_g483;
				float time10_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId10_g483 = 0;
				float2 coords10_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id10_g483 = 0;
				float2 uv10_g483 = 0;
				float voroi10_g483 = voronoi10_g483( coords10_g483, time10_g483, id10_g483, uv10_g483, 0, voronoiSmoothId10_g483 );
				float time12_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId12_g483 = 0;
				float2 coords12_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id12_g483 = 0;
				float2 uv12_g483 = 0;
				float fade12_g483 = 0.5;
				float voroi12_g483 = 0;
				float rest12_g483 = 0;
				for( int it12_g483 = 0; it12_g483 <3; it12_g483++ ){
				voroi12_g483 += fade12_g483 * voronoi12_g483( coords12_g483, time12_g483, id12_g483, uv12_g483, 0,voronoiSmoothId12_g483 );
				rest12_g483 += fade12_g483;
				coords12_g483 *= 2;
				fade12_g483 *= 0.5;
				}//Voronoi12_g483
				voroi12_g483 /= rest12_g483;
				float time24_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId24_g483 = 0;
				float2 coords24_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id24_g483 = 0;
				float2 uv24_g483 = 0;
				float fade24_g483 = 0.5;
				float voroi24_g483 = 0;
				float rest24_g483 = 0;
				for( int it24_g483 = 0; it24_g483 <5; it24_g483++ ){
				voroi24_g483 += fade24_g483 * voronoi24_g483( coords24_g483, time24_g483, id24_g483, uv24_g483, 0,voronoiSmoothId24_g483 );
				rest24_g483 += fade24_g483;
				coords24_g483 *= 2;
				fade24_g483 *= 0.5;
				}//Voronoi24_g483
				voroi24_g483 /= rest24_g483;
				float time23_g483 = temp_output_4_0_g483;
				float2 voronoiSmoothId23_g483 = 0;
				float2 coords23_g483 = temp_output_3_0_g483 * temp_output_5_0_g483;
				float2 id23_g483 = 0;
				float2 uv23_g483 = 0;
				float fade23_g483 = 0.5;
				float voroi23_g483 = 0;
				float rest23_g483 = 0;
				for( int it23_g483 = 0; it23_g483 <6; it23_g483++ ){
				voroi23_g483 += fade23_g483 * voronoi23_g483( coords23_g483, time23_g483, id23_g483, uv23_g483, 0,voronoiSmoothId23_g483 );
				rest23_g483 += fade23_g483;
				coords23_g483 *= 2;
				fade23_g483 *= 0.5;
				}//Voronoi23_g483
				voroi23_g483 /= rest23_g483;
				#if defined( _CAUSTICB_OCT_CAUSTIC1 )
				float staticSwitch13_g1 = voroi2_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC2 )
				float staticSwitch13_g1 = voroi8_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC3 )
				float staticSwitch13_g1 = voroi18_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC4 )
				float staticSwitch13_g1 = voroi17_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC5 )
				float staticSwitch13_g1 = voroi10_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC6 )
				float staticSwitch13_g1 = voroi12_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC7 )
				float staticSwitch13_g1 = voroi24_g483;
				#elif defined( _CAUSTICB_OCT_CAUSTIC8 )
				float staticSwitch13_g1 = voroi23_g483;
				#else
				float staticSwitch13_g1 = voroi2_g483;
				#endif
				float3 temp_cast_14 = (staticSwitch13_g1).xxx;
				float simplePerlin2D12_g1 = snoise( UV20_g1*temp_output_36_0_g1 );
				simplePerlin2D12_g1 = simplePerlin2D12_g1*0.5 + 0.5;
				float3 temp_cast_15 = (simplePerlin2D12_g1).xxx;
				float3 temp_cast_16 = (RF_Zero56_g1).xxx;
				#if defined( _NOISEBTYPE_NONE )
				float3 staticSwitch17_g1 = temp_cast_16;
				#elif defined( _NOISEBTYPE_VORONOICELL )
				float3 staticSwitch17_g1 = temp_cast_13;
				#elif defined( _NOISEBTYPE_VORONOICAUSTIC )
				float3 staticSwitch17_g1 = temp_cast_14;
				#elif defined( _NOISEBTYPE_PERLIN )
				float3 staticSwitch17_g1 = temp_cast_15;
				#elif defined( _NOISEBTYPE_TEXTURE )
				float3 staticSwitch17_g1 = SAMPLE_TEXTURE2D( _DeformNoiseTypeB, sampler_DeformNoiseTypeB, UV20_g1 ).rgb;
				#else
				float3 staticSwitch17_g1 = temp_cast_16;
				#endif
				float3 DBG_RF_NoiseOUT_B701 = staticSwitch17_g1;
				float3 gammaToLinear830 = Gamma22ToLinear( saturate( DBG_RF_NoiseOUT_B701 ) );
				float3 linearToGamma832 = LinearToGamma22( saturate( DBG_RF_NoiseOUT_B701 ) );
				#if defined( _DFBGRADETYPE_LINEAR )
				float3 staticSwitch835 = gammaToLinear830;
				#elif defined( _DFBGRADETYPE_NORMAL )
				float3 staticSwitch835 = saturate( DBG_RF_NoiseOUT_B701 );
				#elif defined( _DFBGRADETYPE_GAMMA )
				float3 staticSwitch835 = linearToGamma832;
				#else
				float3 staticSwitch835 = gammaToLinear830;
				#endif
				float3 temp_cast_17 = (_DFBExp).xxx;
				float3 temp_output_822_0 = saturate( pow( (staticSwitch835*_DFBAmplitude + 0.0) , temp_cast_17 ) );
				float4 lerpResult5_g22 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( temp_output_822_0 , 0.0 ) , -1.0);
				float4 lerpResult5_g23 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DfNoiseBInvert )?( saturate( lerpResult5_g22 ) ):( float4( temp_output_822_0 , 0.0 ) )) , _NoiseBContrast);
				float4 temp_output_18_0_g1 = ( _NB_Intensity * saturate( lerpResult5_g23 ) );
				float dotResult7_g1 = dot( temp_output_17_0_g1 , temp_output_18_0_g1 );
				float4 temp_cast_22 = (dotResult7_g1).xxxx;
				#if defined( _SELECTTYPE_LAYERA )
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#elif defined( _SELECTTYPE_LAYERB )
				float4 staticSwitch9_g1 = temp_output_18_0_g1;
				#elif defined( _SELECTTYPE_MULTIPLY )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 * temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_ADD )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 + temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_SUBTRACT )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 - temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DIVIDE )
				float4 staticSwitch9_g1 = ( temp_output_17_0_g1 / temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_DOT )
				float4 staticSwitch9_g1 = temp_cast_22;
				#elif defined( _SELECTTYPE_FMOD )
				float4 staticSwitch9_g1 = fmod( temp_output_17_0_g1 , temp_output_18_0_g1 );
				#elif defined( _SELECTTYPE_FMODINVERT )
				float4 staticSwitch9_g1 = fmod( temp_output_18_0_g1 , temp_output_17_0_g1 );
				#else
				float4 staticSwitch9_g1 = temp_output_17_0_g1;
				#endif
				float4 RF_DeformNoise974 = saturate( staticSwitch9_g1 );
				#if ( SHADER_TARGET >= 50 )
				float recip1160 = rcp( _Float0 );
				#else
				float recip1160 = 1.0 / _Float0;
				#endif
				float2 temp_cast_23 = (_Float3).xx;
				

				float3 BaseColor = SAMPLE_TEXTURE2D( _TextureSample0, sampler_TextureSample0, ( texCoord1147 + abs( ( ( (RF_DeformNoise974).xy * recip1160 ) % temp_cast_23 ) ) ) ).rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = 0;
				float3 Specular = 0.5;
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
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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

			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);


			
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 140010
			#define ASE_USING_SAMPLING_MACROS 1


			

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

			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _SELECTTYPE_LAYERA _SELECTTYPE_LAYERB _SELECTTYPE_MULTIPLY _SELECTTYPE_ADD _SELECTTYPE_SUBTRACT _SELECTTYPE_DIVIDE _SELECTTYPE_DOT _SELECTTYPE_FMOD _SELECTTYPE_FMODINVERT
			#pragma shader_feature_local _CELLA_OCT_CELL1 _CELLA_OCT_CELL2 _CELLA_OCT_CELL3 _CELLA_OCT_CELL4 _CELLA_OCT_CELL5 _CELLA_OCT_CELL6 _CELLA_OCT_CELL7 _CELLA_OCT_CELL8
			#pragma shader_feature_local _NOISEATYPE_NONE _NOISEATYPE_VORONOICELL _NOISEATYPE_VORONOICAUSTIC _NOISEATYPE_PERLIN _NOISEATYPE_TEXTURE
			#pragma shader_feature_local _CAUSTICA_OCT_CAUSTIC1 _CAUSTICA_OCT_CAUSTIC2 _CAUSTICA_OCT_CAUSTIC3 _CAUSTICA_OCT_CAUSTIC4 _CAUSTICA_OCT_CAUSTIC5 _CAUSTICA_OCT_CAUSTIC6 _CAUSTICA_OCT_CAUSTIC7 _CAUSTICA_OCT_CAUSTIC8
			#pragma shader_feature_local _CAUSTICB_OCT_CAUSTIC1 _CAUSTICB_OCT_CAUSTIC2 _CAUSTICB_OCT_CAUSTIC3 _CAUSTICB_OCT_CAUSTIC4 _CAUSTICB_OCT_CAUSTIC5 _CAUSTICB_OCT_CAUSTIC6 _CAUSTICB_OCT_CAUSTIC7 _CAUSTICB_OCT_CAUSTIC8
			#pragma shader_feature_local _NOISEBTYPE_NONE _NOISEBTYPE_VORONOICELL _NOISEBTYPE_VORONOICAUSTIC _NOISEBTYPE_PERLIN _NOISEBTYPE_TEXTURE
			#pragma shader_feature_local _CELLB_OCT_CELL1 _CELLB_OCT_CELL2 _CELLB_OCT_CELL3 _CELLB_OCT_CELL4 _CELLB_OCT_CELL5 _CELLB_OCT_CELL6 _CELLB_OCT_CELL7 _CELLB_OCT_CELL8
			#pragma shader_feature_local _FLOWMAPTYPE_DEPTH _FLOWMAPTYPE_FLOWTEXTURE
			#pragma shader_feature_local _MASKGRADETYPE_LINEAR _MASKGRADETYPE_NORMAL _MASKGRADETYPE_GAMMA
			#pragma shader_feature_local _TXTGRADETYPE_LINEAR _TXTGRADETYPE_NORMAL _TXTGRADETYPE_GAMMA
			#pragma shader_feature_local _MASK_ON


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
			float _DepthDistance;
			float _NTypeASpeedX;
			float _NTypeAOverallSpeed;
			float _NTypeASpeedY;
			float _NTypeAOffsetY;
			float _NTypeAAnchorX;
			float _NTypeAAnchorY;
			float _NTypeARotateSpeed;
			float _NTypeARotate;
			float _DFAAmplitude;
			float _DFAExp;
			float _NoiseAContrast;
			float _NB_Intensity;
			float _DfNoiseBInvert;
			float _BNoiseScale;
			float _NTypeAOffsetX;
			float _BVoronoiAngleSpeed;
			float _NTypeBTileX;
			float _NTypeBTileY;
			float _NTypeBOffsetX;
			float _NTypeBSpeedX;
			float _NTypeBOverallSpeed;
			float _NTypeBSpeedY;
			float _NTypeBOffsetY;
			float _NTypeBAnchorX;
			float _NTypeBAnchorY;
			float _NTypeBRotateSpeed;
			float _NTypeBRotate;
			float _DFBAmplitude;
			float _DFBExp;
			float _NoiseBContrast;
			float _BVoronoiSmooth;
			float _Float0;
			float _NTypeATileY;
			float _AVoronoiSmooth;
			float _DepthExponential;
			float _FlowTextureContrast;
			float _MaskGradePower;
			float _MapExponential;
			float _InfluenceFlow;
			float _FlowSpeed;
			float _OffsetB;
			float _MapChangeSpeed;
			float _ATileX;
			float _ATileY;
			float _RotateA;
			float _BTileX;
			float _BTileY;
			float _RotateB;
			float _NTypeATileX;
			float _DepthSize;
			float _CheckDef;
			float _fMapFold;
			float _fTxtFold;
			float _fMaskFold;
			float _dMaskFold;
			float _dfNoiseAFold;
			float _dfNoiseBFold;
			float _DeformFold;
			float _FlowTextureAmplitude;
			float _FlowTextureExponential;
			float _NA_Intensity;
			float _DfNoiseAInvert;
			float _ANoiseScale;
			float _AVoronoiAngleSpeed;
			float _CheckFlowMap;
			float _Float3;
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

			TEXTURE2D(_TextureMap);
			SAMPLER(sampler_TextureMap);
			TEXTURE2D(_MaskMap);
			SAMPLER(sampler_MaskMap);
			TEXTURE2D(_FlowMap);
			SAMPLER(sampler_FlowMap);


			
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
	
	CustomEditor "BWaterSurfaceEditor"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19601
Node;AmplifyShaderEditor.CommentaryNode;1032;-3040,-1392;Inherit;False;2813.333;820.6666;Deform Noise;37;1040;1041;974;1035;976;1038;980;957;1037;1036;818;814;821;979;977;978;959;822;855;1044;1045;827;1043;1042;828;834;835;919;958;831;829;832;830;787;786;1047;1048;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;693;-4128,-2896;Inherit;False;1056.933;1149;NoiseType A;18;674;692;691;686;687;690;688;689;685;683;682;681;680;679;678;798;0;816;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;576;-3040,-2896;Inherit;False;1819.708;1361.475;Flow Map Settings;25;535;536;542;541;540;539;538;537;546;570;549;550;562;547;551;545;552;544;625;623;624;660;659;1119;1126;;1,0.5251572,0.5251572,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;318;192,-2976;Inherit;False;1420.101;967.5837;Local Vars;30;164;163;181;668;665;664;663;666;661;195;317;315;313;192;137;212;213;211;210;209;207;206;205;316;314;312;139;808;809;817;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;700;-4128,-1712;Inherit;False;1061.267;1141.2;NoiseType B;17;1;701;713;712;715;716;710;711;714;709;708;707;706;705;704;703;792;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;432,-2272;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;312;688,-2768;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;314;688,-2848;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;316;688,-2928;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;205;240,-2928;Inherit;False;Constant;_Red1;Red;24;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;206;240,-2784;Inherit;False;Constant;_Green1;Green;24;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;207;240,-2640;Inherit;False;Constant;_Blue;Blue;24;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;209;464,-2928;Inherit;False;RF_Red;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;210;464,-2784;Inherit;False;RF_Green;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;211;464,-2640;Inherit;False;RF_Blue;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;213;240,-2256;Inherit;False;210;RF_Green;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;212;240,-2144;Inherit;False;209;RF_Red;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;137;432,-2144;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;624;-2912,-2576;Inherit;False;Property;_DepthDistance;Depth Distance;114;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;623;-2944,-2480;Inherit;False;Property;_DepthExponential;Depth Exponential;115;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;547;-2272,-2592;Inherit;False;Property;_MaskGradePower;Mask Grade Power;121;0;Create;True;0;0;0;True;0;False;1;0;1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;549;-2176,-2272;Inherit;False;Property;_FlowSpeed;Flow Speed;124;0;Create;True;0;0;0;True;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;570;-2272,-2192;Inherit;False;Property;_OffsetB;Offset B;123;0;Create;True;0;0;0;True;0;False;0.5;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;546;-2272,-2112;Inherit;False;Property;_MapChangeSpeed;Map Change Speed;127;0;Create;True;0;0;0;True;0;False;1;2;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;537;-2144,-2032;Inherit;False;Property;_ATileX;ATileX;129;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;538;-2144,-1952;Inherit;False;Property;_ATileY;ATileY;128;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;539;-2272,-1872;Inherit;False;Property;_RotateA;Rotate A;130;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;540;-2144,-1792;Inherit;False;Property;_BTileX;BTileX;131;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;541;-2144,-1712;Inherit;False;Property;_BTileY;BTileY;132;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;625;-3008,-2384;Inherit;False;Property;_DepthSize;Depth Size;116;0;Create;True;0;0;0;True;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;660;-2736,-2384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;688,-2688;Inherit;False;Constant;_Ninety;Ninety;14;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;313;848,-2768;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;315;848,-2848;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;317;848,-2928;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;195;848,-2688;Inherit;False;RF_90;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;552;-2320,-2832;Inherit;True;Property;_TextureMap;Texture Map;119;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;544;-2096,-2832;Inherit;True;Property;_MaskMap;Mask Map;120;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;545;-2544,-2832;Inherit;True;Property;_FlowMap;Flow Map;118;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;661;1104,-2848;Inherit;False;Property;_CheckFlowMap;CheckFlowMap;106;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;666;1120,-2928;Inherit;False;Property;_CheckDef;CheckDef;99;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;663;1120,-2768;Inherit;False;Property;_fMapFold;fMapFold;105;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;664;1120,-2688;Inherit;False;Property;_fTxtFold;fTxtFold;107;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;665;1120,-2608;Inherit;False;Property;_fMaskFold;fMaskFold;104;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;181;272,-2416;Inherit;False;Property;_DebogOnOff;DebogOnOff;117;0;Create;True;0;0;0;False;1;HideInInspector;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;163;592,-2272;Inherit;False;Property;_Keyword1;Keyword 1;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;181;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;164;592,-2144;Inherit;False;Property;_Keyword2;Keyword 1;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;181;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;668;1120,-2528;Inherit;False;Property;_dMaskFold;dMaskFold;101;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;809;1104,-2368;Inherit;False;Property;_dfNoiseBFold;dfNoiseBFold;100;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;808;1104,-2448;Inherit;False;Property;_dfNoiseAFold;dfNoiseAFold;102;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;817;1312,-2928;Inherit;False;Property;_DeformFold;DeformFold;103;2;[HideInInspector];[IntRange];Create;True;0;0;0;True;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;674;-3328,-2512;Inherit;False;DBG_RF_NoiseOUT_A;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;703;-4096,-1488;Inherit;False;Property;_BVoronoiAngleSpeed;B Voronoi Angle Speed;95;0;Create;True;0;0;0;True;0;False;1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;705;-4000,-1360;Inherit;False;Property;_BNoiseScale;B Noise Scale;56;0;Create;True;0;0;0;True;0;False;8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;706;-4000,-1296;Inherit;False;Property;_NTypeBTileX;NType B Tile X;49;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;707;-4000,-1232;Inherit;False;Property;_NTypeBTileY;NType B Tile Y;51;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;708;-4032,-1168;Inherit;False;Property;_NTypeBOffsetX;NType B Offset X;53;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;709;-4032,-1104;Inherit;False;Property;_NTypeBOffsetY;NType B Offset Y;91;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;714;-4032,-1040;Inherit;False;Property;_NTypeBSpeedX;NType B Speed X;57;0;Create;True;0;0;0;True;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;713;-4032,-976;Inherit;False;Property;_NTypeBSpeedY;NType B Speed Y;60;0;Create;True;0;0;0;True;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;711;-4064,-912;Inherit;False;Property;_NTypeBOverallSpeed;NType B OverallSpeed;61;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;-4032,-720;Inherit;False;Property;_NTypeBAnchorX;NType B Anchor X;48;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;715;-4032,-656;Inherit;False;Property;_NTypeBAnchorY;NType B Anchor Y;93;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;704;-4096,-1424;Inherit;False;Property;_BVoronoiSmooth;B Voronoi Smooth;98;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;691;-4032,-1840;Inherit;False;Property;_NTypeAAnchorY;NType A Anchor Y;94;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;692;-4032,-1904;Inherit;False;Property;_NTypeAAnchorX;NType A Anchor X;47;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;690;-4064,-1968;Inherit;False;Property;_NTypeARotateSpeed;NType A Rotate Speed;90;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;688;-4064,-2096;Inherit;False;Property;_NTypeAOverallSpeed;NType A OverallSpeed;62;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;687;-4032,-2160;Inherit;False;Property;_NTypeASpeedY;NType A Speed Y;59;0;Create;True;0;0;0;True;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;686;-4032,-2224;Inherit;False;Property;_NTypeASpeedX;NType A Speed X;58;0;Create;True;0;0;0;True;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;685;-4032,-2288;Inherit;False;Property;_NTypeAOffsetY;NType A Offset Y;92;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;683;-4032,-2352;Inherit;False;Property;_NTypeAOffsetX;NType A Offset X;54;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;682;-4000,-2416;Inherit;False;Property;_NTypeATileY;NType A Tile Y;52;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;681;-4000,-2480;Inherit;False;Property;_NTypeATileX;NType A Tile X;50;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;680;-4000,-2544;Inherit;False;Property;_ANoiseScale;A Noise Scale;55;0;Create;True;0;0;0;True;0;False;8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;679;-4096,-2608;Inherit;False;Property;_AVoronoiSmooth;A Voronoi Smooth;97;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;798;-4064,-2848;Inherit;True;Property;_DeformNoiseTypeA;Deform Noise Type A;64;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;792;-4064,-1664;Inherit;True;Property;_DeformNoiseTypeB;Deform Noise Type B;63;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;816;-3680,-2512;Inherit;False;BUDUNoiseASelector;16;;485;07c1ef44ebfbb4f429f60b74c0d6514f;0;15;62;SAMPLER2D;;False;34;FLOAT;0;False;35;FLOAT;0;False;36;FLOAT;0;False;21;FLOAT;1;False;22;FLOAT;1;False;23;FLOAT;0;False;24;FLOAT;0;False;25;FLOAT;0;False;26;FLOAT;0;False;27;FLOAT;0;False;28;FLOAT;0;False;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;678;-4096,-2672;Inherit;False;Property;_AVoronoiAngleSpeed;A Voronoi Angle Speed;96;0;Create;True;0;0;0;True;0;False;1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;701;-3328,-1360;Inherit;False;DBG_RF_NoiseOUT_B;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;786;-3024,-1264;Inherit;False;674;DBG_RF_NoiseOUT_A;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;787;-3024,-880;Inherit;False;701;DBG_RF_NoiseOUT_B;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;830;-2656,-912;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;832;-2656,-816;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;829;-2656,-1296;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;831;-2656,-1200;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;958;-2176,-880;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;835;-2432,-880;Inherit;False;Property;_DFBGradeType;DFBGradeType;75;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;834;-2432,-1264;Inherit;False;Property;_DFAGradeType;DFAGradeType;74;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;828;-2464,-736;Inherit;False;Property;_DFBAmplitude;DFBAmplitude;77;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1042;-1952,-1264;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;1043;-1952,-880;Inherit;False;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1045;-2240,-656;Inherit;False;Property;_DFBExp;DFBExp;72;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;855;-1792,-1264;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;822;-1792,-880;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;959;-1504,-688;Inherit;False;Property;_NoiseBContrast;Noise B Contrast;79;0;Create;True;0;0;0;True;0;False;1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;978;-1024,-880;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;977;-1024,-1264;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;979;-1312,-1344;Inherit;False;Property;_NA_Intensity;NA_Intensity;78;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;821;-1440,-880;Inherit;False;Property;_DfNoiseBInvert;DfNoiseBInvert;73;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;814;-848,-1088;Inherit;False;BUDUBlendSelector;0;;1;2632734b11bbca645b6d5da61aac4d4e;0;2;17;FLOAT4;0,0,0,0;False;18;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;818;-1440,-1264;Inherit;False;Property;_DfNoiseAInvert;DfNoiseAInvert;67;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1036;-1216,-880;Inherit;False;BUDUContrast;-1;;23;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1037;-1216,-1264;Inherit;False;BUDUContrast;-1;;24;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;980;-1312,-976;Inherit;False;Property;_NB_Intensity;NB_Intensity;80;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1038;-1632,-1184;Inherit;False;BUDUContrast;-1;;25;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;-1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;976;-608,-1088;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;1035;-1632,-800;Inherit;False;BUDUContrast;-1;;22;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;-1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;974;-448,-1088;Inherit;False;RF_DeformNoise;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RelayNode;1041;-2784,-880;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;1040;-2784,-1264;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1046;-3680,-1360;Inherit;False;BUDUNoiseBSelector;2;;1;bd6f4d8408874c245806f989fa955dd9;0;15;62;SAMPLER2D;;False;34;FLOAT;0;False;35;FLOAT;0;False;36;FLOAT;0;False;21;FLOAT;1;False;22;FLOAT;1;False;23;FLOAT;0;False;24;FLOAT;0;False;25;FLOAT;0;False;26;FLOAT;0;False;27;FLOAT;0;False;28;FLOAT;0;False;29;FLOAT;0;False;30;FLOAT;0;False;31;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;542;-2272,-1632;Inherit;False;Property;_RotateB;Rotate B;133;1;[IntRange];Create;True;0;0;0;True;0;False;0;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;712;-4064,-784;Inherit;False;Property;_NTypeBRotateSpeed;NType B Rotate Speed;85;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;710;-4096,-848;Inherit;False;Property;_NTypeBRotate;NType B Rotate;66;0;Create;True;0;0;0;True;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;689;-4096,-2032;Inherit;False;Property;_NTypeARotate;NType A Rotate;65;0;Create;True;0;0;0;True;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1047;-2864,-1152;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1048;-2864,-768;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;535;-1456,-2256;Inherit;False;RF_FlowMask;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;536;-1456,-2496;Inherit;False;RF_FlowMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;659;-2560,-2512;Inherit;False;BUDUDepthFade;108;;761;47987ecf53b4f2847a33a9193dc9d94e;0;3;18;FLOAT;0;False;19;FLOAT;0;False;26;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1067;1664,-2032;Inherit;False;Property;_ToggleSwitch0;Toggle Switch0;81;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1061;-1440,-2400;Inherit;False;RF_FlowSmoothMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1063;-240,-2480;Inherit;False;1061;RF_FlowSmoothMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;550;-2272,-2352;Inherit;False;Property;_InfluenceFlow;InfluenceFlow;122;0;Create;False;0;0;0;True;0;False;2;0;-4;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;919;-2176,-1264;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-2464,-1120;Inherit;False;Property;_DFAAmplitude;DFAAmplitude;70;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1044;-2240,-1040;Inherit;False;Property;_DFAExp;DFAExp;71;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;957;-1504,-1088;Inherit;False;Property;_NoiseAContrast;Noise A Contrast;76;0;Create;True;0;0;0;True;0;False;1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;562;-2272,-2432;Inherit;False;Property;_MapExponential;Map Exponential;126;0;Create;True;0;0;0;True;0;False;0.3;1;-0.4;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1119;-2624,-2176;Inherit;False;Property;_FlowTextureAmplitude;FlowTextureAmplitude;69;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1126;-2624,-2256;Inherit;False;Property;_FlowTextureExponential;FlowTextureExponential;68;0;Create;True;0;0;0;True;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;551;-2624,-2096;Inherit;False;Property;_FlowTextureContrast;Flow Texture Contrast;125;0;Create;True;0;0;0;True;0;False;1;0;-4;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1128;-1792,-2432;Inherit;False;BUDUFlowMap;30;;1;b88bd16f4e10f7b44aa23edcbaad21c4;0;19;100;FLOAT3;0,0,0;False;70;SAMPLER2D;0;False;84;SAMPLER2D;0,0,0;False;72;SAMPLER2D;0;False;66;FLOAT;0;False;118;FLOAT;0;False;115;FLOAT;0;False;81;FLOAT;0;False;93;FLOAT;0;False;58;FLOAT;0;False;56;FLOAT;0;False;97;FLOAT;0;False;65;FLOAT;0;False;54;FLOAT;0;False;55;FLOAT;0;False;57;FLOAT;0;False;60;FLOAT;0;False;59;FLOAT;0;False;61;FLOAT;0;False;2;FLOAT3;0;FLOAT3;67
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1099;-928,-2288;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1103;1824,-2224;Inherit;False;1061;RF_FlowSmoothMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1084;-1184,-1856;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;64,64;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;1100;-736,-2288;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1031;-528,-2048;Inherit;False;536;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1132;-64,-1968;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1151;-240,-2112;Inherit;False;Property;_Float1;Float 1;88;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1092;-704,-1760;Inherit;False;Property;_Float2;Float 2;83;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1083;-528,-1840;Inherit;True;Property;_TextureSample1;Texture Sample 1;82;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;1152;-178.5392,-1875.192;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1143;112,-1792;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1033;1072,-1424;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1039;1392,-1280;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;975;368,-1632;Inherit;False;974;RF_DeformNoise;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;1138;608,-1632;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1139;256,-1904;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1147;768,-1936;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1154;928,-1696;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1153;336,-1776;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode;1156;576,-1200;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1141;1552,-1888;Inherit;True;Property;_TextureSample0;Texture Sample 0;84;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;1150;1376,-1856;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1155;448,-1808;Inherit;False;Property;_Float0;Float 0;86;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ReciprocalOpNode;1160;624,-1808;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;1163;608,-1984;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;1161;848,-1792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1158;960,-1584;Inherit;False;Property;_Float3;Float 3;87;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1164;1344,-1520;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SinhOpNode;1165;1456,-1536;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CoshOpNode;1166;1600,-1600;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ACosOpNode;1167;1200,-1536;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ASinOpNode;1168;1712,-1328;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleRemainderNode;1157;1120,-1680;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.AbsOpNode;1162;1280,-1744;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ReciprocalOpNode;1159;1040,-1952;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1066;1296,-1984;Inherit;False;536;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;48,-272;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;-3824,-688;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;1872,-1792;Float;False;True;-1;2;BWaterSurfaceEditor;0;19;BUDU Shaders/BWaterSurface;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;True;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;42;Lighting Model;1;638579274415500117;Workflow;0;0;Surface;1;638579274480563901;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,_TransmissionShadow;0;Translucency;0;0;  Translucency Strength;1,True,_TRStrength;0;  Normal Distortion;0.5,True,_TRNormDist;0;  Scattering;2,True,_TRScattering;0;  Direct;0.9,True,_TRDirec;0;  Ambient;0.1,True,_TRAmbient;0;  Shadow;0.5,True,_TRShadow;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;638581263789669977;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;638579408530974790;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;True;0
WireConnection;139;1;213;0
WireConnection;209;0;205;0
WireConnection;210;0;206;0
WireConnection;211;0;207;0
WireConnection;137;0;212;0
WireConnection;660;0;625;0
WireConnection;313;0;312;0
WireConnection;315;0;314;0
WireConnection;317;0;316;0
WireConnection;195;0;192;0
WireConnection;163;0;139;0
WireConnection;164;0;137;0
WireConnection;674;0;816;0
WireConnection;816;62;798;0
WireConnection;816;34;678;0
WireConnection;816;35;679;0
WireConnection;816;36;680;0
WireConnection;816;21;681;0
WireConnection;816;22;682;0
WireConnection;816;23;683;0
WireConnection;816;24;685;0
WireConnection;816;25;686;0
WireConnection;816;26;687;0
WireConnection;816;27;688;0
WireConnection;816;28;689;0
WireConnection;816;29;690;0
WireConnection;816;30;692;0
WireConnection;816;31;691;0
WireConnection;701;0;1046;0
WireConnection;830;0;1041;0
WireConnection;832;0;1041;0
WireConnection;829;0;1040;0
WireConnection;831;0;1040;0
WireConnection;958;0;835;0
WireConnection;958;1;828;0
WireConnection;835;1;830;0
WireConnection;835;0;1041;0
WireConnection;835;2;832;0
WireConnection;834;1;829;0
WireConnection;834;0;1040;0
WireConnection;834;2;831;0
WireConnection;1042;0;919;0
WireConnection;1042;1;1044;0
WireConnection;1043;0;958;0
WireConnection;1043;1;1045;0
WireConnection;855;0;1042;0
WireConnection;822;0;1043;0
WireConnection;978;0;980;0
WireConnection;978;1;1036;0
WireConnection;977;0;979;0
WireConnection;977;1;1037;0
WireConnection;821;0;822;0
WireConnection;821;1;1035;0
WireConnection;814;17;977;0
WireConnection;814;18;978;0
WireConnection;818;0;855;0
WireConnection;818;1;1038;0
WireConnection;1036;1;821;0
WireConnection;1036;3;959;0
WireConnection;1037;1;818;0
WireConnection;1037;3;957;0
WireConnection;1038;1;855;0
WireConnection;976;0;814;0
WireConnection;1035;1;822;0
WireConnection;974;0;976;0
WireConnection;1041;0;1048;0
WireConnection;1040;0;1047;0
WireConnection;1046;62;792;0
WireConnection;1046;34;703;0
WireConnection;1046;35;704;0
WireConnection;1046;36;705;0
WireConnection;1046;21;706;0
WireConnection;1046;22;707;0
WireConnection;1046;23;708;0
WireConnection;1046;24;709;0
WireConnection;1046;25;714;0
WireConnection;1046;26;713;0
WireConnection;1046;27;711;0
WireConnection;1046;28;710;0
WireConnection;1046;29;712;0
WireConnection;1046;30;716;0
WireConnection;1046;31;715;0
WireConnection;1047;0;786;0
WireConnection;1048;0;787;0
WireConnection;535;0;1128;67
WireConnection;536;0;1128;0
WireConnection;659;18;624;0
WireConnection;659;19;623;0
WireConnection;659;26;660;0
WireConnection;1067;0;1066;0
WireConnection;1067;1;1063;0
WireConnection;919;0;834;0
WireConnection;919;1;827;0
WireConnection;1128;100;659;0
WireConnection;1128;70;545;0
WireConnection;1128;84;552;0
WireConnection;1128;72;544;0
WireConnection;1128;66;547;0
WireConnection;1128;118;1126;0
WireConnection;1128;115;1119;0
WireConnection;1128;81;551;0
WireConnection;1128;93;562;0
WireConnection;1128;58;550;0
WireConnection;1128;56;549;0
WireConnection;1128;97;570;0
WireConnection;1128;65;546;0
WireConnection;1128;54;537;0
WireConnection;1128;55;538;0
WireConnection;1128;57;539;0
WireConnection;1128;60;540;0
WireConnection;1128;59;541;0
WireConnection;1128;61;542;0
WireConnection;1100;0;1099;0
WireConnection;1132;0;1031;0
WireConnection;1132;1;1152;0
WireConnection;1083;5;1092;0
WireConnection;1152;0;1031;0
WireConnection;1152;1;1083;0
WireConnection;1033;0;975;0
WireConnection;1039;1;1033;0
WireConnection;1138;0;975;0
WireConnection;1139;0;1132;0
WireConnection;1154;0;1138;0
WireConnection;1154;1;1160;0
WireConnection;1141;1;1150;0
WireConnection;1150;0;1147;0
WireConnection;1150;1;1162;0
WireConnection;1160;0;1155;0
WireConnection;1157;0;1154;0
WireConnection;1157;1;1158;0
WireConnection;1162;0;1157;0
WireConnection;2;0;1141;5
WireConnection;2;30;1033;0
ASEEND*/
//CHKSM=FA0885B11C9CA62B60E545BAAE92A7C05A9BF8F5
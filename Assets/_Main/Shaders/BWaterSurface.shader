// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BWaterSurface"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[KeywordEnum(Linear,Normal,Gamma)] _DepthGradeType("DepthGradeType", Float) = 1
		[KeywordEnum(Linear,Normal,Gamma)] _FogDepthGradeType("FogDepthGradeType", Float) = 0
		_DepthDistance("Depth Distance", Float) = 1
		_DepthExponential("Depth Exponential", Float) = 1
		_DepthSize("Depth Size", Range( 0 , 1)) = 1
		[NoScaleOffset]_FlowMap("FlowMap", 2D) = "white" {}
		[NoScaleOffset]_ShoreTexture("Shore Texture", 2D) = "white" {}
		[Toggle]_InvertShoreTexture("Invert Shore Texture", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _FlowMapGrade("FlowMapGrade", Float) = 2
		_FlowDepthContrast("FlowDepthContrast", Float) = 1
		_ShoreTileX("ShoreTileX", Float) = 1
		_ShoreTileY("ShoreTileY", Float) = 1
		[KeywordEnum(DepthMap,TextureMap)] _FlowType("FlowType", Float) = 0
		_ShoreSpeedX("ShoreSpeedX", Float) = 1
		_FlowMapExp("FlowMapExp", Range( 0 , 4)) = 1
		[HideInInspector]_FlowMapSettings("FlowMapSettings", Int) = 0
		_ShoreSpeedY("ShoreSpeedY", Float) = 1
		[KeywordEnum(None,OneNoise,Multiply,Add,Subtract,Divide,Dot,FMod,FModInvert)] _DeformMixType("DeformMixType", Float) = 0
		_ShoreGradeScale("Shore Grade Scale", Float) = 1
		_DeformBAngle("Deform B Angle", Float) = 4
		_DeformBSmooth("Deform B Smooth", Float) = 0
		_DeformAAngle("Deform A Angle", Float) = 4
		_ShoreGradeOffset("Shore Grade Offset", Float) = 0
		[NoScaleOffset]_FoamTexture("Foam Texture", 2D) = "white" {}
		_DeformASmooth("Deform A Smooth", Float) = 0
		[Toggle]_InvertFoamTexture("Invert Foam Texture", Float) = 1
		_DeformAScale("Deform A Scale", Float) = 4
		_DeformATileX("Deform A Tile X", Float) = 1
		_FoamTileX("FoamTileX", Float) = 1
		_FoamTileY("FoamTileY", Float) = 1
		_DeformBTileX("Deform B Tile X", Float) = 1
		_DeformBTileY("Deform B Tile Y", Float) = 1
		_DeformATileY("Deform A Tile Y", Float) = 1
		_FoamGradeScale("Foam Grade Scale", Float) = 1
		_FoamGradeOffset("Foam Grade Offset", Float) = 0
		_DeformAOverallSpeed("Deform A Overall Speed", Float) = 1
		_FoamSpeedX("FoamSpeedX", Float) = 0.1
		_DeformASpeedX("Deform A Speed X", Float) = 0
		_FoamSpeedY("FoamSpeedY", Float) = 0.1
		_DeformBOverallSpeed("Deform B Overall Speed", Float) = 1
		_DeformBSpeedX("Deform B Speed X", Float) = 0.1
		_DeformBSpeedY("Deform B Speed Y", Float) = 0.1
		_DeformASpeedY("Deform A Speed Y", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _DeformBNoiseType("DeformBNoiseType", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _DeformANoiseType("DeformANoiseType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DeformGradeType("DeformGradeType", Float) = 1
		_DeformFinalContrast("DeformFinalContrast", Range( 0 , 50)) = 1
		_DeformFinalBias("DeformFinalBias", Range( -1 , 1)) = -1
		[HideInInspector]_DeformSettings("DeformSettings", Int) = 0
		[NoScaleOffset]_DeformBMap("Deform B Map", 2D) = "white" {}
		[NoScaleOffset]_DeformAMap("Deform A Map", 2D) = "white" {}
		_DeformBAnchorX("Deform B AnchorX", Float) = 0
		_DeformAAnchorX("Deform A AnchorX", Float) = 0
		_FoamDeformScale("Foam Deform Scale", Float) = 1
		_ShoreDeformScale("Shore Deform Scale", Float) = 1
		_DeformAAnchorY("Deform A AnchorY", Float) = 0
		_DeformBAnchorY("Deform B AnchorY", Float) = 0
		_ShoreDeformOffset("Shore Deform Offset", Float) = 0
		_FoamDeformOffset("Foam Deform Offset", Float) = 0
		[Toggle]_DeformBInvert("DeformBInvert", Float) = 0
		[Toggle]_DeformAInvert("DeformAInvert", Float) = 0
		_DeformBIntensity("Deform B Intensity", Range( 0 , 1)) = 1
		_DeformAIntensity("Deform A Intensity", Range( 0 , 1)) = 1
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _Def_VorCaustic_B_Type("Def_VorCaustic_B_Type", Float) = 2
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _Def_VorCell_B_Type("Def_VorCell_B_Type", Float) = 2
		_DeformBOffsetX("Deform B Offset X", Float) = 0
		_DeformAOffsetX("Deform A Offset X", Float) = 0
		_DeformBOffsetY("Deform B Offset Y", Float) = 0
		_DeformAOffsetY("Deform A Offset Y", Float) = 0
		_DeformBRotateSpeed("Deform B Rotate Speed", Float) = 0
		_DeformARotateSpeed("Deform A Rotate Speed", Float) = 0
		_DeformBRotate("Deform B Rotate", Range( 0 , 360)) = 0
		_DeformARotate("Deform A Rotate", Range( 0 , 360)) = 0
		_DeformAContrast("Deform A Contrast", Float) = 1
		_DeformBContrast("Deform B Contrast", Float) = 1
		_DeformBScale("DeformBScale", Float) = 4
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseTypeA("NoiseTypeA", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseTypeB("NoiseTypeB", Float) = 0
		[KeywordEnum(None,OneNoise,Multiply,Add,Subtract,Divide,Dot,FMod,FModInvert)] _NoiseMixType("NoiseMixType", Float) = 0
		[KeywordEnum(None,OneNoise,Multiply,Add,Subtract,Divide,Dot,FMod,FModInvert)] _NormMixType("NormMixType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DefNoiseGradeType1("DefNoiseGradeType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DefNoiseGradeType("DefNoiseGradeType", Float) = 0
		_DefNoiseContrast("DefNoiseContrast", Float) = 1
		_NormNoiseContrast("NormNoiseContrast", Float) = 1
		_DefNoiseGradeScale("DefNoiseGradeScale", Float) = 1
		_NormNoiseGradeScale("NormNoiseGradeScale", Float) = 1
		_NormNoiseGradeOffset("NormNoiseGradeOffset", Float) = 0
		_DefNoiseGradeOffset("DefNoiseGradeOffset", Float) = 0
		[Toggle]_MiddleWave("MiddleWave", Float) = 1
		[NoScaleOffset]_NoiseAMap("NoiseAMap", 2D) = "white" {}
		[Toggle]_DefNoiseAInvert("DefNoiseAInvert", Float) = 0
		_DeformScale("DeformScale", Range( -2 , 2)) = 0
		[Toggle]_DeformToggle("DeformToggle", Float) = 0
		_DefNoiseTypeAOverallSpeed("DefNoiseTypeAOverallSpeed", Float) = 1
		_DefNoiseAScale("DefNoiseAScale", Float) = 8
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _Def_VorCaustic_A_Type("Def_VorCaustic_A_Type", Float) = 2
		_DefVorAAngle("DefVorAAngle", Range( -8 , 8)) = 0.1
		_DefVorATileX("DefVorATileX", Float) = 1
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _Def_VorCell_A_Type("Def_VorCell_A_Type", Float) = 2
		_DefVorATileY("DefVorATileY", Float) = 1
		_DefVorASpeedX("DefVorASpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorASpeedY("DefVorASpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeBRotSpeed("DefTypeBRotSpeed", Float) = 0
		_DefTypeARotSpeed("DefTypeARotSpeed", Float) = 0
		_DefTypeAAnchorX("DefTypeAAnchorX", Float) = 0
		_DefTypeAAnchorY("DefTypeAAnchorY", Float) = 0
		[NoScaleOffset]_NoiseBMap("NoiseBMap", 2D) = "white" {}
		[Toggle]_DefNoiseBInvert("DefNoiseBInvert", Float) = 0
		_NoiseB_Intensity("NoiseB_Intensity", Range( 0 , 1)) = 1
		_DefNoiseTypeBOverallSpeed("DefNoiseTypeBOverallSpeed", Float) = 1
		[HideInInspector]_ShoreFold("ShoreFold", Int) = 0
		_DefNoiseBScale("DefNoiseBScale", Float) = 5
		_DefVorBAngle("DefVorBAngle", Range( -8 , 8)) = 0.1
		_DefVorBTileX("DefVorBTileX", Float) = 1
		_DefVorBTileY("DefVorBTileY", Float) = 1
		_DefVorBSpeedX("DefVorBSpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorBSpeedY("DefVorBSpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeBAnchorX("DefTypeBAnchorX", Float) = 0
		[HideInInspector]_FoamFold("FoamFold", Int) = 0
		_DefTypeBAnchorY("DefTypeBAnchorY", Float) = 0
		_MiddleWaveIntensity("Middle Wave Intensity", Range( 0 , 1)) = 0.5
		_NormWaveIntensity("NormWaveIntensity", Range( 0 , 1)) = 0.5
		_DefVorASmooth("DefVorASmooth", Range( 0 , 1)) = 0
		_DefVorBSmooth("DefVorBSmooth", Range( 0 , 1)) = 0
		_DefTypeBRot("DefTypeBRot", Range( 0 , 360)) = 0
		_DefTypeARot("DefTypeARot", Range( 0 , 360)) = 0
		_DefVorAOffsetX("DefVorAOffsetX", Range( 0 , 1)) = 0
		_DefVorBOffsetX("DefVorBOffsetX", Range( 0 , 1)) = 0
		_DefVorBOffsetY("DefVorBOffsetY", Range( 0 , 1)) = 0
		_DefVorAOffsetY("DefVorAOffsetY", Range( 0 , 1)) = 0
		_NoiseA_Contrast("NoiseA_Contrast", Float) = 0
		_NoiseB_Contrast("NoiseB_Contrast", Float) = 0
		[HideInInspector]_DeformAFold("DeformAFold", Int) = 0
		[HideInInspector]_DeformBFold("DeformBFold", Int) = 0
		[HideInInspector]_MiddleNAFold("MiddleNAFold", Int) = 0
		[HideInInspector]_MiddleNBFold("MiddleNBFold", Int) = 0
		_NoiseA_Intensity("NoiseA_Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_NoiseFold("NoiseFold", Int) = 0
		_FogDepthDistance("Fog Depth Distance", Float) = 0
		_FogDepthExponential("Fog Depth Exponential", Float) = 0
		[Toggle]_FogToggle("FogToggle", Float) = 0
		[Toggle]_ShoreToggle("ShoreToggle", Float) = 0
		[KeywordEnum(None,Add,Multiply,Subtract,Divide,Dot,FMod,FModInvert)] _FoamBlendType("FoamBlendType", Float) = 0
		_ShoreOverallSpeed("ShoreOverallSpeed", Float) = 1
		_FoamOverallSpeed("FoamOverallSpeed", Float) = 1
		[Toggle]_AffectFoamDef("AffectFoamDef", Float) = 0
		_FoamOffsetY("FoamOffsetY", Range( 0 , 1)) = 0
		_FoamOffsetX("FoamOffsetX", Range( 0 , 1)) = 0
		_ShoreOffsetY("ShoreOffsetY", Range( 0 , 1)) = 0
		_ShoreOffsetX("ShoreOffsetX", Range( 0 , 1)) = 0
		_ShoreAnchorX("ShoreAnchorX", Float) = 0
		_ShoreAnchorY("ShoreAnchorY", Float) = 0
		_FoamAnchorX("FoamAnchorX", Float) = 0
		_FoamAnchorY("FoamAnchorY", Float) = 0
		_FoamRotateSpeed("FoamRotateSpeed", Float) = 0
		_ShoreRotate("ShoreRotate", Range( 0 , 360)) = 0
		_ShoreRotateSpeed("ShoreRotateSpeed", Float) = 0
		_FoamRotate("FoamRotate", Range( 0 , 360)) = 0
		_ShoreContrast("ShoreContrast", Float) = 1
		_FoamContrast("FoamContrast", Float) = 1
		[Toggle]_AffectShoreDef("AffectShoreDef", Float) = 0
		_ShoreIntensity("ShoreIntensity", Range( 0 , 1)) = 1
		_FoamIntensity("FoamIntensity", Range( 0 , 1)) = 1
		_FoamDeformStrength("FoamDeformStrength", Range( -2 , 2)) = 1
		_ShoreDeformStrength("ShoreDeformStrength", Range( -2 , 2)) = 1
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
			Tags { "LightMode"="UniversalForwardOnly" }

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
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ASE_LIGHTING_SIMPLE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


			

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
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _FOAMBLENDTYPE_NONE _FOAMBLENDTYPE_ADD _FOAMBLENDTYPE_MULTIPLY _FOAMBLENDTYPE_SUBTRACT _FOAMBLENDTYPE_DIVIDE _FOAMBLENDTYPE_DOT _FOAMBLENDTYPE_FMOD _FOAMBLENDTYPE_FMODINVERT
			#pragma shader_feature_local _FLOWTYPE_DEPTHMAP _FLOWTYPE_TEXTUREMAP
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _FLOWMAPGRADE_LINEAR _FLOWMAPGRADE_NORMAL _FLOWMAPGRADE_GAMMA
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_DOT _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _NOISEMIXTYPE_NONE _NOISEMIXTYPE_ONENOISE _NOISEMIXTYPE_MULTIPLY _NOISEMIXTYPE_ADD _NOISEMIXTYPE_SUBTRACT _NOISEMIXTYPE_DIVIDE _NOISEMIXTYPE_DOT _NOISEMIXTYPE_FMOD _NOISEMIXTYPE_FMODINVERT
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _FOGDEPTHGRADETYPE_LINEAR _FOGDEPTHGRADETYPE_NORMAL _FOGDEPTHGRADETYPE_GAMMA


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;
			sampler2D _ShoreTexture;
			sampler2D _FlowMap;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _FoamTexture;
			sampler2D _NoiseBMap;


			float2 voronoihash2_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g437( n + g );
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
			
			float2 voronoihash8_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g437( n + g );
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
			
			float2 voronoihash18_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g437( n + g );
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
			
			float2 voronoihash17_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g437( n + g );
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
			
			float2 voronoihash10_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g437( n + g );
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
			
			float2 voronoihash12_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g437( n + g );
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
			
			float2 voronoihash24_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g437( n + g );
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
			
			float2 voronoihash23_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g437( n + g );
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
			
			float2 voronoihash2_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g436( n + g );
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
			
			float2 voronoihash8_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g436( n + g );
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
			
			float2 voronoihash18_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g436( n + g );
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
			
			float2 voronoihash17_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g436( n + g );
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
			
			float2 voronoihash10_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g436( n + g );
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
			
			float2 voronoihash12_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g436( n + g );
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
			
			float2 voronoihash24_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g436( n + g );
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
			
			float2 voronoihash23_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g436( n + g );
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
			
			float2 voronoihash2_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g439( n + g );
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
			
			float2 voronoihash8_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g439( n + g );
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
			
			float2 voronoihash18_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g439( n + g );
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
			
			float2 voronoihash17_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g439( n + g );
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
			
			float2 voronoihash10_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g439( n + g );
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
			
			float2 voronoihash12_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g439( n + g );
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
			
			float2 voronoihash24_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g439( n + g );
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
			
			float2 voronoihash23_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g439( n + g );
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
			
			float2 voronoihash2_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g438( n + g );
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
			
			float2 voronoihash8_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g438( n + g );
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
			
			float2 voronoihash18_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g438( n + g );
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
			
			float2 voronoihash17_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g438( n + g );
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
			
			float2 voronoihash10_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g438( n + g );
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
			
			float2 voronoihash12_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g438( n + g );
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
			
			float2 voronoihash24_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g438( n + g );
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
			
			float2 voronoihash23_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g438( n + g );
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
			
			float2 voronoihash2_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g442( n + g );
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
			
			float2 voronoihash8_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g442( n + g );
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
			
			float2 voronoihash18_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g442( n + g );
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
			
			float2 voronoihash17_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g442( n + g );
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
			
			float2 voronoihash10_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g442( n + g );
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
			
			float2 voronoihash12_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g442( n + g );
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
			
			float2 voronoihash24_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g442( n + g );
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
			
			float2 voronoihash23_g442( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g442( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g442( n + g );
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
			
			float2 voronoihash2_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g446( n + g );
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
			
			float2 voronoihash8_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g446( n + g );
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
			
			float2 voronoihash18_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g446( n + g );
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
			
			float2 voronoihash17_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g446( n + g );
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
			
			float2 voronoihash10_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g446( n + g );
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
			
			float2 voronoihash12_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g446( n + g );
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
			
			float2 voronoihash24_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g446( n + g );
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
			
			float2 voronoihash23_g446( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g446( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g446( n + g );
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
			
			float2 voronoihash2_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g441( n + g );
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
			
			float2 voronoihash8_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g441( n + g );
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
			
			float2 voronoihash18_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g441( n + g );
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
			
			float2 voronoihash17_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g441( n + g );
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
			
			float2 voronoihash10_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g441( n + g );
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
			
			float2 voronoihash12_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g441( n + g );
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
			
			float2 voronoihash24_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g441( n + g );
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
			
			float2 voronoihash23_g441( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g441( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g441( n + g );
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
			
			float2 voronoihash2_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g440( n + g );
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
			
			float2 voronoihash8_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g440( n + g );
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
			
			float2 voronoihash18_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g440( n + g );
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
			
			float2 voronoihash17_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g440( n + g );
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
			
			float2 voronoihash10_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g440( n + g );
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
			
			float2 voronoihash12_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g440( n + g );
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
			
			float2 voronoihash24_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g440( n + g );
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
			
			float2 voronoihash23_g440( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g440( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g440( n + g );
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

				float RF_Zero69 = 0.0;
				float4 temp_cast_0 = (RF_Zero69).xxxx;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g421 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g421 = abs( ( screenDepth1_g421 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g421 = abs( distanceDepth1_g421 );
				float temp_output_24_0 = ( ( ase_screenPosNorm.w + (-1.0 + (_DepthSize - 1.0) * (0.0 - -1.0) / (0.0 - 1.0)) ) - ( saturate( pow( saferPower3_g421 , max( _DepthExponential , 0.001 ) ) ) * _ProjectionParams.x ) );
				float3 temp_cast_2 = (temp_output_24_0).xxx;
				float3 temp_cast_3 = (temp_output_24_0).xxx;
				float3 gammaToLinear25 = Gamma22ToLinear( temp_cast_3 );
				float3 temp_cast_4 = (temp_output_24_0).xxx;
				float3 temp_cast_5 = (temp_output_24_0).xxx;
				float3 temp_cast_6 = (temp_output_24_0).xxx;
				float3 linearToGamma26 = LinearToGamma22( temp_cast_6 );
				float3 temp_cast_7 = (temp_output_24_0).xxx;
				#if defined( _DEPTHGRADETYPE_LINEAR )
				float3 staticSwitch27 = gammaToLinear25;
				#elif defined( _DEPTHGRADETYPE_NORMAL )
				float3 staticSwitch27 = temp_cast_7;
				#elif defined( _DEPTHGRADETYPE_GAMMA )
				float3 staticSwitch27 = linearToGamma26;
				#else
				float3 staticSwitch27 = temp_cast_7;
				#endif
				float3 temp_output_28_0 = ( 1.0 - staticSwitch27 );
				float2 uv_FlowMap31 = IN.ase_texcoord8.xy;
				float4 tex2DNode31 = tex2D( _FlowMap, uv_FlowMap31 );
				float3 gammaToLinear35 = Gamma22ToLinear( tex2DNode31.rgb );
				float3 linearToGamma34 = LinearToGamma22( tex2DNode31.rgb );
				#if defined( _FLOWMAPGRADE_LINEAR )
				float3 staticSwitch37 = gammaToLinear35;
				#elif defined( _FLOWMAPGRADE_NORMAL )
				float3 staticSwitch37 = tex2DNode31.rgb;
				#elif defined( _FLOWMAPGRADE_GAMMA )
				float3 staticSwitch37 = linearToGamma34;
				#else
				float3 staticSwitch37 = linearToGamma34;
				#endif
				float3 saferPower63 = abs( staticSwitch37 );
				float3 temp_cast_8 = (_FlowMapExp).xxx;
				#if defined( _FLOWTYPE_DEPTHMAP )
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#elif defined( _FLOWTYPE_TEXTUREMAP )
				float3 staticSwitch43 = pow( saferPower63 , temp_cast_8 );
				#else
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#endif
				float3 RF_FlowMap39 = saturate( staticSwitch43 );
				float2 appendResult514 = (float2(_ShoreTileX , _ShoreTileY));
				float RF_Gray67 = 0.5;
				float4 temp_cast_10 = (RF_Gray67).xxxx;
				float4 temp_cast_12 = (RF_Gray67).xxxx;
				float DeformAScaleRef135 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScaleRef135;
				float DeformAAngleRef128 = _DeformAAngle;
				float mulTime143 = _TimeParameters.x * DeformAAngleRef128;
				float temp_output_4_0_g437 = mulTime143;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmoothRef136 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmoothRef136;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult107 = (float2(_DeformATileX , _DeformATileY));
				float mulTime92 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime93 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult106 = (float2(( _DeformAOffsetX + mulTime92 ) , ( mulTime93 + _DeformAOffsetY )));
				float2 texCoord118 = IN.ase_texcoord8.xy * appendResult107 + appendResult106;
				float2 appendResult119 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime96 = _TimeParameters.x * _DeformARotateSpeed;
				float cos126 = cos( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float sin126 = sin( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float2 rotator126 = mul( texCoord118 - appendResult119 , float2x2( cos126 , -sin126 , sin126 , cos126 )) + appendResult119;
				float2 DeformARef134 = rotator126;
				float2 temp_output_3_0_g437 = DeformARef134;
				float2 coords2_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id2_g437 = 0;
				float2 uv2_g437 = 0;
				float voroi2_g437 = voronoi2_g437( coords2_g437, time2_g437, id2_g437, uv2_g437, voronoiSmooth2_g437, voronoiSmoothId2_g437 );
				float time8_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId8_g437 = 0;
				float voronoiSmooth8_g437 = temp_output_28_0_g437;
				float2 coords8_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id8_g437 = 0;
				float2 uv8_g437 = 0;
				float fade8_g437 = 0.5;
				float voroi8_g437 = 0;
				float rest8_g437 = 0;
				for( int it8_g437 = 0; it8_g437 <2; it8_g437++ ){
				voroi8_g437 += fade8_g437 * voronoi8_g437( coords8_g437, time8_g437, id8_g437, uv8_g437, voronoiSmooth8_g437,voronoiSmoothId8_g437 );
				rest8_g437 += fade8_g437;
				coords8_g437 *= 2;
				fade8_g437 *= 0.5;
				}//Voronoi8_g437
				voroi8_g437 /= rest8_g437;
				float time18_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId18_g437 = 0;
				float voronoiSmooth18_g437 = temp_output_28_0_g437;
				float2 coords18_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id18_g437 = 0;
				float2 uv18_g437 = 0;
				float fade18_g437 = 0.5;
				float voroi18_g437 = 0;
				float rest18_g437 = 0;
				for( int it18_g437 = 0; it18_g437 <3; it18_g437++ ){
				voroi18_g437 += fade18_g437 * voronoi18_g437( coords18_g437, time18_g437, id18_g437, uv18_g437, voronoiSmooth18_g437,voronoiSmoothId18_g437 );
				rest18_g437 += fade18_g437;
				coords18_g437 *= 2;
				fade18_g437 *= 0.5;
				}//Voronoi18_g437
				voroi18_g437 /= rest18_g437;
				float time17_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId17_g437 = 0;
				float voronoiSmooth17_g437 = temp_output_28_0_g437;
				float2 coords17_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id17_g437 = 0;
				float2 uv17_g437 = 0;
				float fade17_g437 = 0.5;
				float voroi17_g437 = 0;
				float rest17_g437 = 0;
				for( int it17_g437 = 0; it17_g437 <4; it17_g437++ ){
				voroi17_g437 += fade17_g437 * voronoi17_g437( coords17_g437, time17_g437, id17_g437, uv17_g437, voronoiSmooth17_g437,voronoiSmoothId17_g437 );
				rest17_g437 += fade17_g437;
				coords17_g437 *= 2;
				fade17_g437 *= 0.5;
				}//Voronoi17_g437
				voroi17_g437 /= rest17_g437;
				float time10_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId10_g437 = 0;
				float voronoiSmooth10_g437 = temp_output_28_0_g437;
				float2 coords10_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id10_g437 = 0;
				float2 uv10_g437 = 0;
				float fade10_g437 = 0.5;
				float voroi10_g437 = 0;
				float rest10_g437 = 0;
				for( int it10_g437 = 0; it10_g437 <5; it10_g437++ ){
				voroi10_g437 += fade10_g437 * voronoi10_g437( coords10_g437, time10_g437, id10_g437, uv10_g437, voronoiSmooth10_g437,voronoiSmoothId10_g437 );
				rest10_g437 += fade10_g437;
				coords10_g437 *= 2;
				fade10_g437 *= 0.5;
				}//Voronoi10_g437
				voroi10_g437 /= rest10_g437;
				float time12_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId12_g437 = 0;
				float voronoiSmooth12_g437 = temp_output_28_0_g437;
				float2 coords12_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id12_g437 = 0;
				float2 uv12_g437 = 0;
				float fade12_g437 = 0.5;
				float voroi12_g437 = 0;
				float rest12_g437 = 0;
				for( int it12_g437 = 0; it12_g437 <6; it12_g437++ ){
				voroi12_g437 += fade12_g437 * voronoi12_g437( coords12_g437, time12_g437, id12_g437, uv12_g437, voronoiSmooth12_g437,voronoiSmoothId12_g437 );
				rest12_g437 += fade12_g437;
				coords12_g437 *= 2;
				fade12_g437 *= 0.5;
				}//Voronoi12_g437
				voroi12_g437 /= rest12_g437;
				float time24_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId24_g437 = 0;
				float voronoiSmooth24_g437 = temp_output_28_0_g437;
				float2 coords24_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id24_g437 = 0;
				float2 uv24_g437 = 0;
				float fade24_g437 = 0.5;
				float voroi24_g437 = 0;
				float rest24_g437 = 0;
				for( int it24_g437 = 0; it24_g437 <7; it24_g437++ ){
				voroi24_g437 += fade24_g437 * voronoi24_g437( coords24_g437, time24_g437, id24_g437, uv24_g437, voronoiSmooth24_g437,voronoiSmoothId24_g437 );
				rest24_g437 += fade24_g437;
				coords24_g437 *= 2;
				fade24_g437 *= 0.5;
				}//Voronoi24_g437
				voroi24_g437 /= rest24_g437;
				float time23_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId23_g437 = 0;
				float voronoiSmooth23_g437 = temp_output_28_0_g437;
				float2 coords23_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id23_g437 = 0;
				float2 uv23_g437 = 0;
				float fade23_g437 = 0.5;
				float voroi23_g437 = 0;
				float rest23_g437 = 0;
				for( int it23_g437 = 0; it23_g437 <8; it23_g437++ ){
				voroi23_g437 += fade23_g437 * voronoi23_g437( coords23_g437, time23_g437, id23_g437, uv23_g437, voronoiSmooth23_g437,voronoiSmoothId23_g437 );
				rest23_g437 += fade23_g437;
				coords23_g437 *= 2;
				fade23_g437 *= 0.5;
				}//Voronoi23_g437
				voroi23_g437 /= rest23_g437;
				#if defined( _DEF_VORCELL_A_TYPE_CELL1 )
				float staticSwitch154 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch154 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch154 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch154 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch154 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch154 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch154 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch154 = voroi23_g437;
				#else
				float staticSwitch154 = voroi18_g437;
				#endif
				float4 temp_cast_13 = (staticSwitch154).xxxx;
				float temp_output_5_0_g436 = DeformAScaleRef135;
				float temp_output_4_0_g436 = mulTime143;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef134;
				float2 coords2_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id2_g436 = 0;
				float2 uv2_g436 = 0;
				float voroi2_g436 = voronoi2_g436( coords2_g436, time2_g436, id2_g436, uv2_g436, voronoiSmooth2_g436, voronoiSmoothId2_g436 );
				float time8_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId8_g436 = 0;
				float voronoiSmooth8_g436 = 0.0;
				float2 coords8_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id8_g436 = 0;
				float2 uv8_g436 = 0;
				float fade8_g436 = 0.5;
				float voroi8_g436 = 0;
				float rest8_g436 = 0;
				for( int it8_g436 = 0; it8_g436 <2; it8_g436++ ){
				voroi8_g436 += fade8_g436 * voronoi8_g436( coords8_g436, time8_g436, id8_g436, uv8_g436, voronoiSmooth8_g436,voronoiSmoothId8_g436 );
				rest8_g436 += fade8_g436;
				coords8_g436 *= 2;
				fade8_g436 *= 0.5;
				}//Voronoi8_g436
				voroi8_g436 /= rest8_g436;
				float time18_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId18_g436 = 0;
				float voronoiSmooth18_g436 = 0.0;
				float2 coords18_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id18_g436 = 0;
				float2 uv18_g436 = 0;
				float fade18_g436 = 0.5;
				float voroi18_g436 = 0;
				float rest18_g436 = 0;
				for( int it18_g436 = 0; it18_g436 <3; it18_g436++ ){
				voroi18_g436 += fade18_g436 * voronoi18_g436( coords18_g436, time18_g436, id18_g436, uv18_g436, voronoiSmooth18_g436,voronoiSmoothId18_g436 );
				rest18_g436 += fade18_g436;
				coords18_g436 *= 2;
				fade18_g436 *= 0.5;
				}//Voronoi18_g436
				voroi18_g436 /= rest18_g436;
				float time17_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId17_g436 = 0;
				float voronoiSmooth17_g436 = 0.0;
				float2 coords17_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id17_g436 = 0;
				float2 uv17_g436 = 0;
				float fade17_g436 = 0.5;
				float voroi17_g436 = 0;
				float rest17_g436 = 0;
				for( int it17_g436 = 0; it17_g436 <6; it17_g436++ ){
				voroi17_g436 += fade17_g436 * voronoi17_g436( coords17_g436, time17_g436, id17_g436, uv17_g436, voronoiSmooth17_g436,voronoiSmoothId17_g436 );
				rest17_g436 += fade17_g436;
				coords17_g436 *= 2;
				fade17_g436 *= 0.5;
				}//Voronoi17_g436
				voroi17_g436 /= rest17_g436;
				float time10_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId10_g436 = 0;
				float2 coords10_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id10_g436 = 0;
				float2 uv10_g436 = 0;
				float voroi10_g436 = voronoi10_g436( coords10_g436, time10_g436, id10_g436, uv10_g436, 0, voronoiSmoothId10_g436 );
				float time12_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId12_g436 = 0;
				float2 coords12_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id12_g436 = 0;
				float2 uv12_g436 = 0;
				float fade12_g436 = 0.5;
				float voroi12_g436 = 0;
				float rest12_g436 = 0;
				for( int it12_g436 = 0; it12_g436 <3; it12_g436++ ){
				voroi12_g436 += fade12_g436 * voronoi12_g436( coords12_g436, time12_g436, id12_g436, uv12_g436, 0,voronoiSmoothId12_g436 );
				rest12_g436 += fade12_g436;
				coords12_g436 *= 2;
				fade12_g436 *= 0.5;
				}//Voronoi12_g436
				voroi12_g436 /= rest12_g436;
				float time24_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId24_g436 = 0;
				float2 coords24_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id24_g436 = 0;
				float2 uv24_g436 = 0;
				float fade24_g436 = 0.5;
				float voroi24_g436 = 0;
				float rest24_g436 = 0;
				for( int it24_g436 = 0; it24_g436 <5; it24_g436++ ){
				voroi24_g436 += fade24_g436 * voronoi24_g436( coords24_g436, time24_g436, id24_g436, uv24_g436, 0,voronoiSmoothId24_g436 );
				rest24_g436 += fade24_g436;
				coords24_g436 *= 2;
				fade24_g436 *= 0.5;
				}//Voronoi24_g436
				voroi24_g436 /= rest24_g436;
				float time23_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId23_g436 = 0;
				float2 coords23_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id23_g436 = 0;
				float2 uv23_g436 = 0;
				float fade23_g436 = 0.5;
				float voroi23_g436 = 0;
				float rest23_g436 = 0;
				for( int it23_g436 = 0; it23_g436 <6; it23_g436++ ){
				voroi23_g436 += fade23_g436 * voronoi23_g436( coords23_g436, time23_g436, id23_g436, uv23_g436, 0,voronoiSmoothId23_g436 );
				rest23_g436 += fade23_g436;
				coords23_g436 *= 2;
				fade23_g436 *= 0.5;
				}//Voronoi23_g436
				voroi23_g436 /= rest23_g436;
				#if defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 )
				float staticSwitch155 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch155 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch155 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch155 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch155 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch155 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch155 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch155 = voroi23_g436;
				#else
				float staticSwitch155 = voroi18_g436;
				#endif
				float4 temp_cast_14 = (staticSwitch155).xxxx;
				float simplePerlin3D151 = snoise( float3( DeformARef134 ,  0.0 )*DeformAScaleRef135 );
				simplePerlin3D151 = simplePerlin3D151*0.5 + 0.5;
				float4 temp_cast_16 = (simplePerlin3D151).xxxx;
				float4 temp_cast_17 = (RF_Gray67).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch158 = temp_cast_17;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch158 = temp_cast_13;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch158 = temp_cast_14;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch158 = temp_cast_16;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch158 = tex2D( _DeformAMap, DeformARef134 );
				#else
				float4 staticSwitch158 = temp_cast_17;
				#endif
				float4 lerpResult5_g423 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch158 ) ):( staticSwitch158 )) , _DeformAContrast);
				float4 temp_output_169_0 = ( saturate( lerpResult5_g423 ) * _DeformAIntensity );
				float4 temp_cast_19 = (RF_Gray67).xxxx;
				float DeformBScaleRef138 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScaleRef138;
				float DeformBAngleRef131 = _DeformBAngle;
				float mulTime142 = _TimeParameters.x * DeformBAngleRef131;
				float temp_output_4_0_g439 = mulTime142;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmoothRef139 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmoothRef139;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult113 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime89 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime87 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult112 = (float2(( _DeformBOffsetX + mulTime89 ) , ( mulTime87 + _DeformBOffsetY )));
				float2 texCoord122 = IN.ase_texcoord8.xy * appendResult113 + appendResult112;
				float2 appendResult123 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime99 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos130 = cos( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float sin130 = sin( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float2 rotator130 = mul( texCoord122 - appendResult123 , float2x2( cos130 , -sin130 , sin130 , cos130 )) + appendResult123;
				float2 DeformBRef137 = rotator130;
				float2 temp_output_3_0_g439 = DeformBRef137;
				float2 coords2_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id2_g439 = 0;
				float2 uv2_g439 = 0;
				float voroi2_g439 = voronoi2_g439( coords2_g439, time2_g439, id2_g439, uv2_g439, voronoiSmooth2_g439, voronoiSmoothId2_g439 );
				float time8_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId8_g439 = 0;
				float voronoiSmooth8_g439 = temp_output_28_0_g439;
				float2 coords8_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id8_g439 = 0;
				float2 uv8_g439 = 0;
				float fade8_g439 = 0.5;
				float voroi8_g439 = 0;
				float rest8_g439 = 0;
				for( int it8_g439 = 0; it8_g439 <2; it8_g439++ ){
				voroi8_g439 += fade8_g439 * voronoi8_g439( coords8_g439, time8_g439, id8_g439, uv8_g439, voronoiSmooth8_g439,voronoiSmoothId8_g439 );
				rest8_g439 += fade8_g439;
				coords8_g439 *= 2;
				fade8_g439 *= 0.5;
				}//Voronoi8_g439
				voroi8_g439 /= rest8_g439;
				float time18_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId18_g439 = 0;
				float voronoiSmooth18_g439 = temp_output_28_0_g439;
				float2 coords18_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id18_g439 = 0;
				float2 uv18_g439 = 0;
				float fade18_g439 = 0.5;
				float voroi18_g439 = 0;
				float rest18_g439 = 0;
				for( int it18_g439 = 0; it18_g439 <3; it18_g439++ ){
				voroi18_g439 += fade18_g439 * voronoi18_g439( coords18_g439, time18_g439, id18_g439, uv18_g439, voronoiSmooth18_g439,voronoiSmoothId18_g439 );
				rest18_g439 += fade18_g439;
				coords18_g439 *= 2;
				fade18_g439 *= 0.5;
				}//Voronoi18_g439
				voroi18_g439 /= rest18_g439;
				float time17_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId17_g439 = 0;
				float voronoiSmooth17_g439 = temp_output_28_0_g439;
				float2 coords17_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id17_g439 = 0;
				float2 uv17_g439 = 0;
				float fade17_g439 = 0.5;
				float voroi17_g439 = 0;
				float rest17_g439 = 0;
				for( int it17_g439 = 0; it17_g439 <4; it17_g439++ ){
				voroi17_g439 += fade17_g439 * voronoi17_g439( coords17_g439, time17_g439, id17_g439, uv17_g439, voronoiSmooth17_g439,voronoiSmoothId17_g439 );
				rest17_g439 += fade17_g439;
				coords17_g439 *= 2;
				fade17_g439 *= 0.5;
				}//Voronoi17_g439
				voroi17_g439 /= rest17_g439;
				float time10_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId10_g439 = 0;
				float voronoiSmooth10_g439 = temp_output_28_0_g439;
				float2 coords10_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id10_g439 = 0;
				float2 uv10_g439 = 0;
				float fade10_g439 = 0.5;
				float voroi10_g439 = 0;
				float rest10_g439 = 0;
				for( int it10_g439 = 0; it10_g439 <5; it10_g439++ ){
				voroi10_g439 += fade10_g439 * voronoi10_g439( coords10_g439, time10_g439, id10_g439, uv10_g439, voronoiSmooth10_g439,voronoiSmoothId10_g439 );
				rest10_g439 += fade10_g439;
				coords10_g439 *= 2;
				fade10_g439 *= 0.5;
				}//Voronoi10_g439
				voroi10_g439 /= rest10_g439;
				float time12_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId12_g439 = 0;
				float voronoiSmooth12_g439 = temp_output_28_0_g439;
				float2 coords12_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id12_g439 = 0;
				float2 uv12_g439 = 0;
				float fade12_g439 = 0.5;
				float voroi12_g439 = 0;
				float rest12_g439 = 0;
				for( int it12_g439 = 0; it12_g439 <6; it12_g439++ ){
				voroi12_g439 += fade12_g439 * voronoi12_g439( coords12_g439, time12_g439, id12_g439, uv12_g439, voronoiSmooth12_g439,voronoiSmoothId12_g439 );
				rest12_g439 += fade12_g439;
				coords12_g439 *= 2;
				fade12_g439 *= 0.5;
				}//Voronoi12_g439
				voroi12_g439 /= rest12_g439;
				float time24_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId24_g439 = 0;
				float voronoiSmooth24_g439 = temp_output_28_0_g439;
				float2 coords24_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id24_g439 = 0;
				float2 uv24_g439 = 0;
				float fade24_g439 = 0.5;
				float voroi24_g439 = 0;
				float rest24_g439 = 0;
				for( int it24_g439 = 0; it24_g439 <7; it24_g439++ ){
				voroi24_g439 += fade24_g439 * voronoi24_g439( coords24_g439, time24_g439, id24_g439, uv24_g439, voronoiSmooth24_g439,voronoiSmoothId24_g439 );
				rest24_g439 += fade24_g439;
				coords24_g439 *= 2;
				fade24_g439 *= 0.5;
				}//Voronoi24_g439
				voroi24_g439 /= rest24_g439;
				float time23_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId23_g439 = 0;
				float voronoiSmooth23_g439 = temp_output_28_0_g439;
				float2 coords23_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id23_g439 = 0;
				float2 uv23_g439 = 0;
				float fade23_g439 = 0.5;
				float voroi23_g439 = 0;
				float rest23_g439 = 0;
				for( int it23_g439 = 0; it23_g439 <8; it23_g439++ ){
				voroi23_g439 += fade23_g439 * voronoi23_g439( coords23_g439, time23_g439, id23_g439, uv23_g439, voronoiSmooth23_g439,voronoiSmoothId23_g439 );
				rest23_g439 += fade23_g439;
				coords23_g439 *= 2;
				fade23_g439 *= 0.5;
				}//Voronoi23_g439
				voroi23_g439 /= rest23_g439;
				#if defined( _DEF_VORCELL_B_TYPE_CELL1 )
				float staticSwitch149 = voroi2_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL2 )
				float staticSwitch149 = voroi8_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL3 )
				float staticSwitch149 = voroi18_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL4 )
				float staticSwitch149 = voroi17_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL5 )
				float staticSwitch149 = voroi10_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL6 )
				float staticSwitch149 = voroi12_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL7 )
				float staticSwitch149 = voroi24_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL8 )
				float staticSwitch149 = voroi23_g439;
				#else
				float staticSwitch149 = voroi18_g439;
				#endif
				float4 temp_cast_20 = (staticSwitch149).xxxx;
				float temp_output_5_0_g438 = DeformBScaleRef138;
				float temp_output_4_0_g438 = mulTime142;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef137;
				float2 coords2_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id2_g438 = 0;
				float2 uv2_g438 = 0;
				float voroi2_g438 = voronoi2_g438( coords2_g438, time2_g438, id2_g438, uv2_g438, voronoiSmooth2_g438, voronoiSmoothId2_g438 );
				float time8_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId8_g438 = 0;
				float voronoiSmooth8_g438 = 0.0;
				float2 coords8_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id8_g438 = 0;
				float2 uv8_g438 = 0;
				float fade8_g438 = 0.5;
				float voroi8_g438 = 0;
				float rest8_g438 = 0;
				for( int it8_g438 = 0; it8_g438 <2; it8_g438++ ){
				voroi8_g438 += fade8_g438 * voronoi8_g438( coords8_g438, time8_g438, id8_g438, uv8_g438, voronoiSmooth8_g438,voronoiSmoothId8_g438 );
				rest8_g438 += fade8_g438;
				coords8_g438 *= 2;
				fade8_g438 *= 0.5;
				}//Voronoi8_g438
				voroi8_g438 /= rest8_g438;
				float time18_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId18_g438 = 0;
				float voronoiSmooth18_g438 = 0.0;
				float2 coords18_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id18_g438 = 0;
				float2 uv18_g438 = 0;
				float fade18_g438 = 0.5;
				float voroi18_g438 = 0;
				float rest18_g438 = 0;
				for( int it18_g438 = 0; it18_g438 <3; it18_g438++ ){
				voroi18_g438 += fade18_g438 * voronoi18_g438( coords18_g438, time18_g438, id18_g438, uv18_g438, voronoiSmooth18_g438,voronoiSmoothId18_g438 );
				rest18_g438 += fade18_g438;
				coords18_g438 *= 2;
				fade18_g438 *= 0.5;
				}//Voronoi18_g438
				voroi18_g438 /= rest18_g438;
				float time17_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId17_g438 = 0;
				float voronoiSmooth17_g438 = 0.0;
				float2 coords17_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id17_g438 = 0;
				float2 uv17_g438 = 0;
				float fade17_g438 = 0.5;
				float voroi17_g438 = 0;
				float rest17_g438 = 0;
				for( int it17_g438 = 0; it17_g438 <6; it17_g438++ ){
				voroi17_g438 += fade17_g438 * voronoi17_g438( coords17_g438, time17_g438, id17_g438, uv17_g438, voronoiSmooth17_g438,voronoiSmoothId17_g438 );
				rest17_g438 += fade17_g438;
				coords17_g438 *= 2;
				fade17_g438 *= 0.5;
				}//Voronoi17_g438
				voroi17_g438 /= rest17_g438;
				float time10_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId10_g438 = 0;
				float2 coords10_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id10_g438 = 0;
				float2 uv10_g438 = 0;
				float voroi10_g438 = voronoi10_g438( coords10_g438, time10_g438, id10_g438, uv10_g438, 0, voronoiSmoothId10_g438 );
				float time12_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId12_g438 = 0;
				float2 coords12_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id12_g438 = 0;
				float2 uv12_g438 = 0;
				float fade12_g438 = 0.5;
				float voroi12_g438 = 0;
				float rest12_g438 = 0;
				for( int it12_g438 = 0; it12_g438 <3; it12_g438++ ){
				voroi12_g438 += fade12_g438 * voronoi12_g438( coords12_g438, time12_g438, id12_g438, uv12_g438, 0,voronoiSmoothId12_g438 );
				rest12_g438 += fade12_g438;
				coords12_g438 *= 2;
				fade12_g438 *= 0.5;
				}//Voronoi12_g438
				voroi12_g438 /= rest12_g438;
				float time24_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId24_g438 = 0;
				float2 coords24_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id24_g438 = 0;
				float2 uv24_g438 = 0;
				float fade24_g438 = 0.5;
				float voroi24_g438 = 0;
				float rest24_g438 = 0;
				for( int it24_g438 = 0; it24_g438 <5; it24_g438++ ){
				voroi24_g438 += fade24_g438 * voronoi24_g438( coords24_g438, time24_g438, id24_g438, uv24_g438, 0,voronoiSmoothId24_g438 );
				rest24_g438 += fade24_g438;
				coords24_g438 *= 2;
				fade24_g438 *= 0.5;
				}//Voronoi24_g438
				voroi24_g438 /= rest24_g438;
				float time23_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId23_g438 = 0;
				float2 coords23_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id23_g438 = 0;
				float2 uv23_g438 = 0;
				float fade23_g438 = 0.5;
				float voroi23_g438 = 0;
				float rest23_g438 = 0;
				for( int it23_g438 = 0; it23_g438 <6; it23_g438++ ){
				voroi23_g438 += fade23_g438 * voronoi23_g438( coords23_g438, time23_g438, id23_g438, uv23_g438, 0,voronoiSmoothId23_g438 );
				rest23_g438 += fade23_g438;
				coords23_g438 *= 2;
				fade23_g438 *= 0.5;
				}//Voronoi23_g438
				voroi23_g438 /= rest23_g438;
				#if defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 )
				float staticSwitch148 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 )
				float staticSwitch148 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 )
				float staticSwitch148 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 )
				float staticSwitch148 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 )
				float staticSwitch148 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 )
				float staticSwitch148 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 )
				float staticSwitch148 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8 )
				float staticSwitch148 = voroi23_g438;
				#else
				float staticSwitch148 = voroi18_g438;
				#endif
				float4 temp_cast_21 = (staticSwitch148).xxxx;
				float simplePerlin3D156 = snoise( float3( DeformBRef137 ,  0.0 )*DeformBScaleRef138 );
				simplePerlin3D156 = simplePerlin3D156*0.5 + 0.5;
				float4 temp_cast_23 = (simplePerlin3D156).xxxx;
				float4 temp_cast_24 = (RF_Gray67).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch157 = temp_cast_24;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch157 = temp_cast_20;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch157 = temp_cast_21;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch157 = temp_cast_23;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch157 = tex2D( _DeformBMap, DeformBRef137 );
				#else
				float4 staticSwitch157 = temp_cast_24;
				#endif
				float4 lerpResult5_g422 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch157 ) ):( staticSwitch157 )) , _DeformBContrast);
				float4 temp_output_170_0 = ( saturate( lerpResult5_g422 ) * _DeformBIntensity );
				float dotResult344 = dot( temp_output_169_0 , temp_output_170_0 );
				float4 temp_cast_25 = (dotResult344).xxxx;
				float4 temp_cast_26 = (RF_Gray67).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch178 = temp_cast_26;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch178 = temp_output_169_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch178 = ( temp_output_169_0 * temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch178 = ( temp_output_169_0 + temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch178 = ( temp_output_169_0 - temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch178 = ( temp_output_169_0 / temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DOT )
				float4 staticSwitch178 = temp_cast_25;
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch178 = fmod( temp_output_169_0 , temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch178 = fmod( temp_output_170_0 , temp_output_169_0 );
				#else
				float4 staticSwitch178 = temp_cast_26;
				#endif
				float3 gammaToLinear179 = Gamma22ToLinear( staticSwitch178.rgb );
				float3 linearToGamma180 = LinearToGamma22( staticSwitch178.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch183 = float4( gammaToLinear179 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch183 = staticSwitch178;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch183 = float4( linearToGamma180 , 0.0 );
				#else
				float4 staticSwitch183 = staticSwitch178;
				#endif
				float4 RF_DeformNoise185 = (staticSwitch183*_DeformFinalContrast + _DeformFinalBias);
				float4 RF_ShoreDeform595 = (RF_DeformNoise185*_ShoreDeformScale + _ShoreDeformOffset);
				float4 lerpResult5_g1 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_ShoreDeform595 , _ShoreDeformStrength);
				float mulTime521 = _TimeParameters.x * ( _ShoreSpeedX * _ShoreOverallSpeed );
				float mulTime522 = _TimeParameters.x * ( _ShoreOverallSpeed * _ShoreSpeedY );
				float2 appendResult549 = (float2(( _ShoreOffsetX + mulTime521 ) , ( mulTime522 + _ShoreOffsetY )));
				float2 texCoord550 = IN.ase_texcoord8.xy * ( RF_FlowMap39 + float3( (( _AffectShoreDef )?( ( (saturate( lerpResult5_g1 )).rg * appendResult514 ) ):( appendResult514 )) ,  0.0 ) ).xy + appendResult549;
				float2 appendResult554 = (float2(_ShoreAnchorX , _ShoreAnchorY));
				float mulTime532 = _TimeParameters.x * _ShoreRotateSpeed;
				float cos556 = cos( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float sin556 = sin( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float2 rotator556 = mul( texCoord550 - appendResult554 , float2x2( cos556 , -sin556 , sin556 , cos556 )) + appendResult554;
				float4 lerpResult5_g454 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _ShoreTexture, rotator556 ) , _ShoreContrast);
				float4 temp_output_560_0 = saturate( saturate( lerpResult5_g454 ) );
				float4 RF_Shore606 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_560_0 ) ):( temp_output_560_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * _ShoreIntensity );
				float2 appendResult515 = (float2(_FoamTileX , _FoamTileY));
				float4 RF_FoamDeform632 = (RF_DeformNoise185*_FoamDeformScale + _FoamDeformOffset);
				float4 lerpResult5_g2 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_FoamDeform632 , _FoamDeformStrength);
				float mulTime517 = _TimeParameters.x * ( _FoamSpeedX * _FoamOverallSpeed );
				float mulTime518 = _TimeParameters.x * ( _FoamOverallSpeed * _FoamSpeedY );
				float2 appendResult548 = (float2(( _FoamOffsetX + mulTime517 ) , ( mulTime518 + _FoamOffsetY )));
				float2 texCoord551 = IN.ase_texcoord8.xy * (( _AffectFoamDef )?( ( (saturate( lerpResult5_g2 )).rg * appendResult515 ) ):( appendResult515 )) + appendResult548;
				float2 appendResult552 = (float2(_FoamAnchorX , _FoamAnchorY));
				float mulTime527 = _TimeParameters.x * _FoamRotateSpeed;
				float cos557 = cos( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float sin557 = sin( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float2 rotator557 = mul( texCoord551 - appendResult552 , float2x2( cos557 , -sin557 , sin557 , cos557 )) + appendResult552;
				float4 lerpResult5_g455 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _FoamTexture, rotator557 ) , _FoamContrast);
				float4 temp_output_561_0 = saturate( saturate( lerpResult5_g455 ) );
				float4 RF_Foam607 = ( ((( _InvertFoamTexture )?( ( 1.0 - temp_output_561_0 ) ):( temp_output_561_0 ))*_FoamGradeScale + _FoamGradeOffset) * _FoamIntensity );
				float dotResult597 = dot( RF_Shore606 , RF_Foam607 );
				float4 temp_cast_37 = (saturate( dotResult597 )).xxxx;
				#if defined( _FOAMBLENDTYPE_NONE )
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#elif defined( _FOAMBLENDTYPE_ADD )
				float4 staticSwitch582 = saturate( ( RF_Shore606 + RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_MULTIPLY )
				float4 staticSwitch582 = saturate( ( RF_Shore606 * RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_SUBTRACT )
				float4 staticSwitch582 = saturate( ( RF_Shore606 - RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DIVIDE )
				float4 staticSwitch582 = saturate( ( RF_Shore606 / RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DOT )
				float4 staticSwitch582 = temp_cast_37;
				#elif defined( _FOAMBLENDTYPE_FMOD )
				float4 staticSwitch582 = saturate( fmod( RF_Shore606 , RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_FMODINVERT )
				float4 staticSwitch582 = saturate( fmod( RF_Foam607 , RF_Shore606 ) );
				#else
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#endif
				float4 RF_ShoreTexture584 = (( _ShoreToggle )?( ( staticSwitch582 * float4( RF_FlowMap39 , 0.0 ) ) ):( temp_cast_0 ));
				
				float4 temp_cast_42 = (RF_Zero69).xxxx;
				float4 temp_cast_44 = (RF_Zero69).xxxx;
				float4 temp_cast_46 = (RF_Zero69).xxxx;
				float temp_output_5_0_g442 = _DefNoiseAScale;
				float mulTime258 = _TimeParameters.x * _DefVorAAngle;
				float temp_output_4_0_g442 = mulTime258;
				float time2_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId2_g442 = 0;
				float temp_output_28_0_g442 = _DefVorASmooth;
				float voronoiSmooth2_g442 = temp_output_28_0_g442;
				float4 temp_cast_47 = (RF_Zero69).xxxx;
				float4 RF_DeformWave369 = (( _DeformToggle )?( (RF_DeformNoise185*_DeformScale + -0.5) ):( temp_cast_47 ));
				float2 appendResult222 = (float2(_DefVorATileX , _DefVorATileY));
				float mulTime225 = _TimeParameters.x * ( _DefVorASpeedX * _DefNoiseTypeAOverallSpeed );
				float mulTime226 = _TimeParameters.x * ( _DefVorASpeedY * _DefNoiseTypeAOverallSpeed );
				float2 appendResult221 = (float2(( _DefVorAOffsetX + mulTime225 ) , ( mulTime226 + _DefVorAOffsetY )));
				float2 texCoord252 = IN.ase_texcoord8.xy * appendResult222 + appendResult221;
				float2 appendResult253 = (float2(_DefTypeAAnchorX , _DefTypeAAnchorY));
				float mulTime229 = _TimeParameters.x * _DefTypeARotSpeed;
				float cos259 = cos( ( radians( mulTime229 ) + radians( _DefTypeARot ) ) );
				float sin259 = sin( ( radians( mulTime229 ) + radians( _DefTypeARot ) ) );
				float2 rotator259 = mul( texCoord252 - appendResult253 , float2x2( cos259 , -sin259 , sin259 , cos259 )) + appendResult253;
				float4 temp_output_257_0 = ( RF_DeformWave369 + float4( rotator259, 0.0 , 0.0 ) );
				float4 RF_UV_A378 = temp_output_257_0;
				float2 temp_output_3_0_g442 = RF_UV_A378.rg;
				float2 coords2_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id2_g442 = 0;
				float2 uv2_g442 = 0;
				float voroi2_g442 = voronoi2_g442( coords2_g442, time2_g442, id2_g442, uv2_g442, voronoiSmooth2_g442, voronoiSmoothId2_g442 );
				float time8_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId8_g442 = 0;
				float voronoiSmooth8_g442 = temp_output_28_0_g442;
				float2 coords8_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id8_g442 = 0;
				float2 uv8_g442 = 0;
				float fade8_g442 = 0.5;
				float voroi8_g442 = 0;
				float rest8_g442 = 0;
				for( int it8_g442 = 0; it8_g442 <2; it8_g442++ ){
				voroi8_g442 += fade8_g442 * voronoi8_g442( coords8_g442, time8_g442, id8_g442, uv8_g442, voronoiSmooth8_g442,voronoiSmoothId8_g442 );
				rest8_g442 += fade8_g442;
				coords8_g442 *= 2;
				fade8_g442 *= 0.5;
				}//Voronoi8_g442
				voroi8_g442 /= rest8_g442;
				float time18_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId18_g442 = 0;
				float voronoiSmooth18_g442 = temp_output_28_0_g442;
				float2 coords18_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id18_g442 = 0;
				float2 uv18_g442 = 0;
				float fade18_g442 = 0.5;
				float voroi18_g442 = 0;
				float rest18_g442 = 0;
				for( int it18_g442 = 0; it18_g442 <3; it18_g442++ ){
				voroi18_g442 += fade18_g442 * voronoi18_g442( coords18_g442, time18_g442, id18_g442, uv18_g442, voronoiSmooth18_g442,voronoiSmoothId18_g442 );
				rest18_g442 += fade18_g442;
				coords18_g442 *= 2;
				fade18_g442 *= 0.5;
				}//Voronoi18_g442
				voroi18_g442 /= rest18_g442;
				float time17_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId17_g442 = 0;
				float voronoiSmooth17_g442 = temp_output_28_0_g442;
				float2 coords17_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id17_g442 = 0;
				float2 uv17_g442 = 0;
				float fade17_g442 = 0.5;
				float voroi17_g442 = 0;
				float rest17_g442 = 0;
				for( int it17_g442 = 0; it17_g442 <4; it17_g442++ ){
				voroi17_g442 += fade17_g442 * voronoi17_g442( coords17_g442, time17_g442, id17_g442, uv17_g442, voronoiSmooth17_g442,voronoiSmoothId17_g442 );
				rest17_g442 += fade17_g442;
				coords17_g442 *= 2;
				fade17_g442 *= 0.5;
				}//Voronoi17_g442
				voroi17_g442 /= rest17_g442;
				float time10_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId10_g442 = 0;
				float voronoiSmooth10_g442 = temp_output_28_0_g442;
				float2 coords10_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id10_g442 = 0;
				float2 uv10_g442 = 0;
				float fade10_g442 = 0.5;
				float voroi10_g442 = 0;
				float rest10_g442 = 0;
				for( int it10_g442 = 0; it10_g442 <5; it10_g442++ ){
				voroi10_g442 += fade10_g442 * voronoi10_g442( coords10_g442, time10_g442, id10_g442, uv10_g442, voronoiSmooth10_g442,voronoiSmoothId10_g442 );
				rest10_g442 += fade10_g442;
				coords10_g442 *= 2;
				fade10_g442 *= 0.5;
				}//Voronoi10_g442
				voroi10_g442 /= rest10_g442;
				float time12_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId12_g442 = 0;
				float voronoiSmooth12_g442 = temp_output_28_0_g442;
				float2 coords12_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id12_g442 = 0;
				float2 uv12_g442 = 0;
				float fade12_g442 = 0.5;
				float voroi12_g442 = 0;
				float rest12_g442 = 0;
				for( int it12_g442 = 0; it12_g442 <6; it12_g442++ ){
				voroi12_g442 += fade12_g442 * voronoi12_g442( coords12_g442, time12_g442, id12_g442, uv12_g442, voronoiSmooth12_g442,voronoiSmoothId12_g442 );
				rest12_g442 += fade12_g442;
				coords12_g442 *= 2;
				fade12_g442 *= 0.5;
				}//Voronoi12_g442
				voroi12_g442 /= rest12_g442;
				float time24_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId24_g442 = 0;
				float voronoiSmooth24_g442 = temp_output_28_0_g442;
				float2 coords24_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id24_g442 = 0;
				float2 uv24_g442 = 0;
				float fade24_g442 = 0.5;
				float voroi24_g442 = 0;
				float rest24_g442 = 0;
				for( int it24_g442 = 0; it24_g442 <7; it24_g442++ ){
				voroi24_g442 += fade24_g442 * voronoi24_g442( coords24_g442, time24_g442, id24_g442, uv24_g442, voronoiSmooth24_g442,voronoiSmoothId24_g442 );
				rest24_g442 += fade24_g442;
				coords24_g442 *= 2;
				fade24_g442 *= 0.5;
				}//Voronoi24_g442
				voroi24_g442 /= rest24_g442;
				float time23_g442 = temp_output_4_0_g442;
				float2 voronoiSmoothId23_g442 = 0;
				float voronoiSmooth23_g442 = temp_output_28_0_g442;
				float2 coords23_g442 = temp_output_3_0_g442 * temp_output_5_0_g442;
				float2 id23_g442 = 0;
				float2 uv23_g442 = 0;
				float fade23_g442 = 0.5;
				float voroi23_g442 = 0;
				float rest23_g442 = 0;
				for( int it23_g442 = 0; it23_g442 <8; it23_g442++ ){
				voroi23_g442 += fade23_g442 * voronoi23_g442( coords23_g442, time23_g442, id23_g442, uv23_g442, voronoiSmooth23_g442,voronoiSmoothId23_g442 );
				rest23_g442 += fade23_g442;
				coords23_g442 *= 2;
				fade23_g442 *= 0.5;
				}//Voronoi23_g442
				voroi23_g442 /= rest23_g442;
				#if defined( _DEF_VORCELL_A_TYPE_CELL1 )
				float staticSwitch279 = voroi2_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch279 = voroi8_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch279 = voroi18_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch279 = voroi17_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch279 = voroi10_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch279 = voroi12_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch279 = voroi24_g442;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch279 = voroi23_g442;
				#else
				float staticSwitch279 = voroi18_g442;
				#endif
				float4 temp_cast_50 = (staticSwitch279).xxxx;
				float temp_output_5_0_g446 = _DefNoiseAScale;
				float temp_output_4_0_g446 = mulTime258;
				float time2_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId2_g446 = 0;
				float voronoiSmooth2_g446 = 0.0;
				float2 temp_output_3_0_g446 = RF_UV_A378.rg;
				float2 coords2_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id2_g446 = 0;
				float2 uv2_g446 = 0;
				float voroi2_g446 = voronoi2_g446( coords2_g446, time2_g446, id2_g446, uv2_g446, voronoiSmooth2_g446, voronoiSmoothId2_g446 );
				float time8_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId8_g446 = 0;
				float voronoiSmooth8_g446 = 0.0;
				float2 coords8_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id8_g446 = 0;
				float2 uv8_g446 = 0;
				float fade8_g446 = 0.5;
				float voroi8_g446 = 0;
				float rest8_g446 = 0;
				for( int it8_g446 = 0; it8_g446 <2; it8_g446++ ){
				voroi8_g446 += fade8_g446 * voronoi8_g446( coords8_g446, time8_g446, id8_g446, uv8_g446, voronoiSmooth8_g446,voronoiSmoothId8_g446 );
				rest8_g446 += fade8_g446;
				coords8_g446 *= 2;
				fade8_g446 *= 0.5;
				}//Voronoi8_g446
				voroi8_g446 /= rest8_g446;
				float time18_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId18_g446 = 0;
				float voronoiSmooth18_g446 = 0.0;
				float2 coords18_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id18_g446 = 0;
				float2 uv18_g446 = 0;
				float fade18_g446 = 0.5;
				float voroi18_g446 = 0;
				float rest18_g446 = 0;
				for( int it18_g446 = 0; it18_g446 <3; it18_g446++ ){
				voroi18_g446 += fade18_g446 * voronoi18_g446( coords18_g446, time18_g446, id18_g446, uv18_g446, voronoiSmooth18_g446,voronoiSmoothId18_g446 );
				rest18_g446 += fade18_g446;
				coords18_g446 *= 2;
				fade18_g446 *= 0.5;
				}//Voronoi18_g446
				voroi18_g446 /= rest18_g446;
				float time17_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId17_g446 = 0;
				float voronoiSmooth17_g446 = 0.0;
				float2 coords17_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id17_g446 = 0;
				float2 uv17_g446 = 0;
				float fade17_g446 = 0.5;
				float voroi17_g446 = 0;
				float rest17_g446 = 0;
				for( int it17_g446 = 0; it17_g446 <6; it17_g446++ ){
				voroi17_g446 += fade17_g446 * voronoi17_g446( coords17_g446, time17_g446, id17_g446, uv17_g446, voronoiSmooth17_g446,voronoiSmoothId17_g446 );
				rest17_g446 += fade17_g446;
				coords17_g446 *= 2;
				fade17_g446 *= 0.5;
				}//Voronoi17_g446
				voroi17_g446 /= rest17_g446;
				float time10_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId10_g446 = 0;
				float2 coords10_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id10_g446 = 0;
				float2 uv10_g446 = 0;
				float voroi10_g446 = voronoi10_g446( coords10_g446, time10_g446, id10_g446, uv10_g446, 0, voronoiSmoothId10_g446 );
				float time12_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId12_g446 = 0;
				float2 coords12_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id12_g446 = 0;
				float2 uv12_g446 = 0;
				float fade12_g446 = 0.5;
				float voroi12_g446 = 0;
				float rest12_g446 = 0;
				for( int it12_g446 = 0; it12_g446 <3; it12_g446++ ){
				voroi12_g446 += fade12_g446 * voronoi12_g446( coords12_g446, time12_g446, id12_g446, uv12_g446, 0,voronoiSmoothId12_g446 );
				rest12_g446 += fade12_g446;
				coords12_g446 *= 2;
				fade12_g446 *= 0.5;
				}//Voronoi12_g446
				voroi12_g446 /= rest12_g446;
				float time24_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId24_g446 = 0;
				float2 coords24_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id24_g446 = 0;
				float2 uv24_g446 = 0;
				float fade24_g446 = 0.5;
				float voroi24_g446 = 0;
				float rest24_g446 = 0;
				for( int it24_g446 = 0; it24_g446 <5; it24_g446++ ){
				voroi24_g446 += fade24_g446 * voronoi24_g446( coords24_g446, time24_g446, id24_g446, uv24_g446, 0,voronoiSmoothId24_g446 );
				rest24_g446 += fade24_g446;
				coords24_g446 *= 2;
				fade24_g446 *= 0.5;
				}//Voronoi24_g446
				voroi24_g446 /= rest24_g446;
				float time23_g446 = temp_output_4_0_g446;
				float2 voronoiSmoothId23_g446 = 0;
				float2 coords23_g446 = temp_output_3_0_g446 * temp_output_5_0_g446;
				float2 id23_g446 = 0;
				float2 uv23_g446 = 0;
				float fade23_g446 = 0.5;
				float voroi23_g446 = 0;
				float rest23_g446 = 0;
				for( int it23_g446 = 0; it23_g446 <6; it23_g446++ ){
				voroi23_g446 += fade23_g446 * voronoi23_g446( coords23_g446, time23_g446, id23_g446, uv23_g446, 0,voronoiSmoothId23_g446 );
				rest23_g446 += fade23_g446;
				coords23_g446 *= 2;
				fade23_g446 *= 0.5;
				}//Voronoi23_g446
				voroi23_g446 /= rest23_g446;
				#if defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 )
				float staticSwitch278 = voroi2_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch278 = voroi8_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch278 = voroi18_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch278 = voroi17_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch278 = voroi10_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch278 = voroi12_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch278 = voroi24_g446;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch278 = voroi23_g446;
				#else
				float staticSwitch278 = voroi18_g446;
				#endif
				float4 temp_cast_52 = (staticSwitch278).xxxx;
				float simplePerlin2D307 = snoise( RF_UV_A378.rg*_DefNoiseAScale );
				simplePerlin2D307 = simplePerlin2D307*0.5 + 0.5;
				float4 temp_cast_54 = (simplePerlin2D307).xxxx;
				float4 temp_cast_56 = (RF_Zero69).xxxx;
				#if defined( _NOISETYPEA_NONE )
				float4 staticSwitch280 = temp_cast_56;
				#elif defined( _NOISETYPEA_VORONOICELL )
				float4 staticSwitch280 = temp_cast_50;
				#elif defined( _NOISETYPEA_VORONOICAUSTIC )
				float4 staticSwitch280 = temp_cast_52;
				#elif defined( _NOISETYPEA_PERLIN )
				float4 staticSwitch280 = temp_cast_54;
				#elif defined( _NOISETYPEA_TEXTURE )
				float4 staticSwitch280 = tex2D( _NoiseAMap, RF_UV_A378.rg );
				#else
				float4 staticSwitch280 = temp_cast_56;
				#endif
				float4 RF_Noise_A384 = staticSwitch280;
				float3 linearToGamma282 = LinearToGamma22( saturate( RF_Noise_A384 ).rgb );
				float4 lerpResult5_g447 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( (( _DefNoiseAInvert )?( ( 1.0 - linearToGamma282 ) ):( linearToGamma282 )) , 0.0 ) , _NoiseA_Contrast);
				float4 RF_WaveA412 = ( saturate( lerpResult5_g447 ) * _NoiseA_Intensity );
				float4 temp_cast_62 = (RF_Zero69).xxxx;
				float temp_output_5_0_g441 = _DefNoiseBScale;
				float mulTime217 = _TimeParameters.x * _DefVorBAngle;
				float temp_output_4_0_g441 = mulTime217;
				float time2_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId2_g441 = 0;
				float temp_output_28_0_g441 = _DefVorBSmooth;
				float voronoiSmooth2_g441 = temp_output_28_0_g441;
				float2 appendResult214 = (float2(_DefVorBTileX , _DefVorBTileY));
				float mulTime212 = _TimeParameters.x * ( _DefVorBSpeedX * _DefNoiseTypeBOverallSpeed );
				float mulTime213 = _TimeParameters.x * ( _DefVorBSpeedY * _DefNoiseTypeBOverallSpeed );
				float2 appendResult209 = (float2(( _DefVorBOffsetX + mulTime212 ) , ( mulTime213 + _DefVorBOffsetY )));
				float2 texCoord202 = IN.ase_texcoord8.xy * appendResult214 + appendResult209;
				float2 appendResult203 = (float2(_DefTypeBAnchorX , _DefTypeBAnchorY));
				float mulTime208 = _TimeParameters.x * _DefTypeBRotSpeed;
				float cos204 = cos( ( radians( mulTime208 ) + radians( _DefTypeBRot ) ) );
				float sin204 = sin( ( radians( mulTime208 ) + radians( _DefTypeBRot ) ) );
				float2 rotator204 = mul( texCoord202 - appendResult203 , float2x2( cos204 , -sin204 , sin204 , cos204 )) + appendResult203;
				float4 temp_output_216_0 = ( RF_DeformWave369 + float4( rotator204, 0.0 , 0.0 ) );
				float4 RF_UV_B372 = temp_output_216_0;
				float2 temp_output_3_0_g441 = 0;
				float2 coords2_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id2_g441 = 0;
				float2 uv2_g441 = 0;
				float voroi2_g441 = voronoi2_g441( coords2_g441, time2_g441, id2_g441, uv2_g441, voronoiSmooth2_g441, voronoiSmoothId2_g441 );
				float time8_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId8_g441 = 0;
				float voronoiSmooth8_g441 = temp_output_28_0_g441;
				float2 coords8_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id8_g441 = 0;
				float2 uv8_g441 = 0;
				float fade8_g441 = 0.5;
				float voroi8_g441 = 0;
				float rest8_g441 = 0;
				for( int it8_g441 = 0; it8_g441 <2; it8_g441++ ){
				voroi8_g441 += fade8_g441 * voronoi8_g441( coords8_g441, time8_g441, id8_g441, uv8_g441, voronoiSmooth8_g441,voronoiSmoothId8_g441 );
				rest8_g441 += fade8_g441;
				coords8_g441 *= 2;
				fade8_g441 *= 0.5;
				}//Voronoi8_g441
				voroi8_g441 /= rest8_g441;
				float time18_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId18_g441 = 0;
				float voronoiSmooth18_g441 = temp_output_28_0_g441;
				float2 coords18_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id18_g441 = 0;
				float2 uv18_g441 = 0;
				float fade18_g441 = 0.5;
				float voroi18_g441 = 0;
				float rest18_g441 = 0;
				for( int it18_g441 = 0; it18_g441 <3; it18_g441++ ){
				voroi18_g441 += fade18_g441 * voronoi18_g441( coords18_g441, time18_g441, id18_g441, uv18_g441, voronoiSmooth18_g441,voronoiSmoothId18_g441 );
				rest18_g441 += fade18_g441;
				coords18_g441 *= 2;
				fade18_g441 *= 0.5;
				}//Voronoi18_g441
				voroi18_g441 /= rest18_g441;
				float time17_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId17_g441 = 0;
				float voronoiSmooth17_g441 = temp_output_28_0_g441;
				float2 coords17_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id17_g441 = 0;
				float2 uv17_g441 = 0;
				float fade17_g441 = 0.5;
				float voroi17_g441 = 0;
				float rest17_g441 = 0;
				for( int it17_g441 = 0; it17_g441 <4; it17_g441++ ){
				voroi17_g441 += fade17_g441 * voronoi17_g441( coords17_g441, time17_g441, id17_g441, uv17_g441, voronoiSmooth17_g441,voronoiSmoothId17_g441 );
				rest17_g441 += fade17_g441;
				coords17_g441 *= 2;
				fade17_g441 *= 0.5;
				}//Voronoi17_g441
				voroi17_g441 /= rest17_g441;
				float time10_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId10_g441 = 0;
				float voronoiSmooth10_g441 = temp_output_28_0_g441;
				float2 coords10_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id10_g441 = 0;
				float2 uv10_g441 = 0;
				float fade10_g441 = 0.5;
				float voroi10_g441 = 0;
				float rest10_g441 = 0;
				for( int it10_g441 = 0; it10_g441 <5; it10_g441++ ){
				voroi10_g441 += fade10_g441 * voronoi10_g441( coords10_g441, time10_g441, id10_g441, uv10_g441, voronoiSmooth10_g441,voronoiSmoothId10_g441 );
				rest10_g441 += fade10_g441;
				coords10_g441 *= 2;
				fade10_g441 *= 0.5;
				}//Voronoi10_g441
				voroi10_g441 /= rest10_g441;
				float time12_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId12_g441 = 0;
				float voronoiSmooth12_g441 = temp_output_28_0_g441;
				float2 coords12_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id12_g441 = 0;
				float2 uv12_g441 = 0;
				float fade12_g441 = 0.5;
				float voroi12_g441 = 0;
				float rest12_g441 = 0;
				for( int it12_g441 = 0; it12_g441 <6; it12_g441++ ){
				voroi12_g441 += fade12_g441 * voronoi12_g441( coords12_g441, time12_g441, id12_g441, uv12_g441, voronoiSmooth12_g441,voronoiSmoothId12_g441 );
				rest12_g441 += fade12_g441;
				coords12_g441 *= 2;
				fade12_g441 *= 0.5;
				}//Voronoi12_g441
				voroi12_g441 /= rest12_g441;
				float time24_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId24_g441 = 0;
				float voronoiSmooth24_g441 = temp_output_28_0_g441;
				float2 coords24_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id24_g441 = 0;
				float2 uv24_g441 = 0;
				float fade24_g441 = 0.5;
				float voroi24_g441 = 0;
				float rest24_g441 = 0;
				for( int it24_g441 = 0; it24_g441 <7; it24_g441++ ){
				voroi24_g441 += fade24_g441 * voronoi24_g441( coords24_g441, time24_g441, id24_g441, uv24_g441, voronoiSmooth24_g441,voronoiSmoothId24_g441 );
				rest24_g441 += fade24_g441;
				coords24_g441 *= 2;
				fade24_g441 *= 0.5;
				}//Voronoi24_g441
				voroi24_g441 /= rest24_g441;
				float time23_g441 = temp_output_4_0_g441;
				float2 voronoiSmoothId23_g441 = 0;
				float voronoiSmooth23_g441 = temp_output_28_0_g441;
				float2 coords23_g441 = temp_output_3_0_g441 * temp_output_5_0_g441;
				float2 id23_g441 = 0;
				float2 uv23_g441 = 0;
				float fade23_g441 = 0.5;
				float voroi23_g441 = 0;
				float rest23_g441 = 0;
				for( int it23_g441 = 0; it23_g441 <8; it23_g441++ ){
				voroi23_g441 += fade23_g441 * voronoi23_g441( coords23_g441, time23_g441, id23_g441, uv23_g441, voronoiSmooth23_g441,voronoiSmoothId23_g441 );
				rest23_g441 += fade23_g441;
				coords23_g441 *= 2;
				fade23_g441 *= 0.5;
				}//Voronoi23_g441
				voroi23_g441 /= rest23_g441;
				#if defined( _DEF_VORCELL_B_TYPE_CELL1 )
				float staticSwitch287 = voroi2_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL2 )
				float staticSwitch287 = voroi8_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL3 )
				float staticSwitch287 = voroi18_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL4 )
				float staticSwitch287 = voroi17_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL5 )
				float staticSwitch287 = voroi10_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL6 )
				float staticSwitch287 = voroi12_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL7 )
				float staticSwitch287 = voroi24_g441;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL8 )
				float staticSwitch287 = voroi23_g441;
				#else
				float staticSwitch287 = voroi18_g441;
				#endif
				float4 temp_cast_65 = (staticSwitch287).xxxx;
				float temp_output_5_0_g440 = _DefNoiseBScale;
				float temp_output_4_0_g440 = mulTime217;
				float time2_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId2_g440 = 0;
				float voronoiSmooth2_g440 = 0.0;
				float2 temp_output_3_0_g440 = RF_UV_B372.rg;
				float2 coords2_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id2_g440 = 0;
				float2 uv2_g440 = 0;
				float voroi2_g440 = voronoi2_g440( coords2_g440, time2_g440, id2_g440, uv2_g440, voronoiSmooth2_g440, voronoiSmoothId2_g440 );
				float time8_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId8_g440 = 0;
				float voronoiSmooth8_g440 = 0.0;
				float2 coords8_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id8_g440 = 0;
				float2 uv8_g440 = 0;
				float fade8_g440 = 0.5;
				float voroi8_g440 = 0;
				float rest8_g440 = 0;
				for( int it8_g440 = 0; it8_g440 <2; it8_g440++ ){
				voroi8_g440 += fade8_g440 * voronoi8_g440( coords8_g440, time8_g440, id8_g440, uv8_g440, voronoiSmooth8_g440,voronoiSmoothId8_g440 );
				rest8_g440 += fade8_g440;
				coords8_g440 *= 2;
				fade8_g440 *= 0.5;
				}//Voronoi8_g440
				voroi8_g440 /= rest8_g440;
				float time18_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId18_g440 = 0;
				float voronoiSmooth18_g440 = 0.0;
				float2 coords18_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id18_g440 = 0;
				float2 uv18_g440 = 0;
				float fade18_g440 = 0.5;
				float voroi18_g440 = 0;
				float rest18_g440 = 0;
				for( int it18_g440 = 0; it18_g440 <3; it18_g440++ ){
				voroi18_g440 += fade18_g440 * voronoi18_g440( coords18_g440, time18_g440, id18_g440, uv18_g440, voronoiSmooth18_g440,voronoiSmoothId18_g440 );
				rest18_g440 += fade18_g440;
				coords18_g440 *= 2;
				fade18_g440 *= 0.5;
				}//Voronoi18_g440
				voroi18_g440 /= rest18_g440;
				float time17_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId17_g440 = 0;
				float voronoiSmooth17_g440 = 0.0;
				float2 coords17_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id17_g440 = 0;
				float2 uv17_g440 = 0;
				float fade17_g440 = 0.5;
				float voroi17_g440 = 0;
				float rest17_g440 = 0;
				for( int it17_g440 = 0; it17_g440 <6; it17_g440++ ){
				voroi17_g440 += fade17_g440 * voronoi17_g440( coords17_g440, time17_g440, id17_g440, uv17_g440, voronoiSmooth17_g440,voronoiSmoothId17_g440 );
				rest17_g440 += fade17_g440;
				coords17_g440 *= 2;
				fade17_g440 *= 0.5;
				}//Voronoi17_g440
				voroi17_g440 /= rest17_g440;
				float time10_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId10_g440 = 0;
				float2 coords10_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id10_g440 = 0;
				float2 uv10_g440 = 0;
				float voroi10_g440 = voronoi10_g440( coords10_g440, time10_g440, id10_g440, uv10_g440, 0, voronoiSmoothId10_g440 );
				float time12_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId12_g440 = 0;
				float2 coords12_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id12_g440 = 0;
				float2 uv12_g440 = 0;
				float fade12_g440 = 0.5;
				float voroi12_g440 = 0;
				float rest12_g440 = 0;
				for( int it12_g440 = 0; it12_g440 <3; it12_g440++ ){
				voroi12_g440 += fade12_g440 * voronoi12_g440( coords12_g440, time12_g440, id12_g440, uv12_g440, 0,voronoiSmoothId12_g440 );
				rest12_g440 += fade12_g440;
				coords12_g440 *= 2;
				fade12_g440 *= 0.5;
				}//Voronoi12_g440
				voroi12_g440 /= rest12_g440;
				float time24_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId24_g440 = 0;
				float2 coords24_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id24_g440 = 0;
				float2 uv24_g440 = 0;
				float fade24_g440 = 0.5;
				float voroi24_g440 = 0;
				float rest24_g440 = 0;
				for( int it24_g440 = 0; it24_g440 <5; it24_g440++ ){
				voroi24_g440 += fade24_g440 * voronoi24_g440( coords24_g440, time24_g440, id24_g440, uv24_g440, 0,voronoiSmoothId24_g440 );
				rest24_g440 += fade24_g440;
				coords24_g440 *= 2;
				fade24_g440 *= 0.5;
				}//Voronoi24_g440
				voroi24_g440 /= rest24_g440;
				float time23_g440 = temp_output_4_0_g440;
				float2 voronoiSmoothId23_g440 = 0;
				float2 coords23_g440 = temp_output_3_0_g440 * temp_output_5_0_g440;
				float2 id23_g440 = 0;
				float2 uv23_g440 = 0;
				float fade23_g440 = 0.5;
				float voroi23_g440 = 0;
				float rest23_g440 = 0;
				for( int it23_g440 = 0; it23_g440 <6; it23_g440++ ){
				voroi23_g440 += fade23_g440 * voronoi23_g440( coords23_g440, time23_g440, id23_g440, uv23_g440, 0,voronoiSmoothId23_g440 );
				rest23_g440 += fade23_g440;
				coords23_g440 *= 2;
				fade23_g440 *= 0.5;
				}//Voronoi23_g440
				voroi23_g440 /= rest23_g440;
				#if defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 )
				float staticSwitch288 = voroi2_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 )
				float staticSwitch288 = voroi8_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 )
				float staticSwitch288 = voroi18_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 )
				float staticSwitch288 = voroi17_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 )
				float staticSwitch288 = voroi10_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 )
				float staticSwitch288 = voroi12_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 )
				float staticSwitch288 = voroi24_g440;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8 )
				float staticSwitch288 = voroi23_g440;
				#else
				float staticSwitch288 = voroi18_g440;
				#endif
				float4 temp_cast_67 = (staticSwitch288).xxxx;
				float simplePerlin2D304 = snoise( RF_UV_B372.rg*_DefNoiseBScale );
				simplePerlin2D304 = simplePerlin2D304*0.5 + 0.5;
				float4 temp_cast_69 = (simplePerlin2D304).xxxx;
				float4 temp_cast_71 = (RF_Zero69).xxxx;
				#if defined( _NOISETYPEB_NONE )
				float4 staticSwitch286 = temp_cast_71;
				#elif defined( _NOISETYPEB_VORONOICELL )
				float4 staticSwitch286 = temp_cast_65;
				#elif defined( _NOISETYPEB_VORONOICAUSTIC )
				float4 staticSwitch286 = temp_cast_67;
				#elif defined( _NOISETYPEB_PERLIN )
				float4 staticSwitch286 = temp_cast_69;
				#elif defined( _NOISETYPEB_TEXTURE )
				float4 staticSwitch286 = tex2D( _NoiseBMap, RF_UV_B372.rg );
				#else
				float4 staticSwitch286 = temp_cast_71;
				#endif
				float4 RF_Noise_B386 = staticSwitch286;
				float3 linearToGamma236 = LinearToGamma22( saturate( RF_Noise_B386 ).rgb );
				float4 lerpResult5_g448 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , float4( (( _DefNoiseBInvert )?( ( 1.0 - linearToGamma236 ) ):( linearToGamma236 )) , 0.0 ) , _NoiseB_Contrast);
				float4 RF_WaveB435 = ( saturate( lerpResult5_g448 ) * _NoiseB_Intensity );
				float dotResult244 = dot( RF_WaveA412 , RF_WaveB435 );
				float4 temp_cast_76 = (dotResult244).xxxx;
				float4 temp_cast_77 = (RF_Zero69).xxxx;
				#if defined( _NOISEMIXTYPE_NONE )
				float4 staticSwitch277 = temp_cast_77;
				#elif defined( _NOISEMIXTYPE_ONENOISE )
				float4 staticSwitch277 = RF_WaveA412;
				#elif defined( _NOISEMIXTYPE_MULTIPLY )
				float4 staticSwitch277 = ( RF_WaveA412 * RF_WaveB435 );
				#elif defined( _NOISEMIXTYPE_ADD )
				float4 staticSwitch277 = ( RF_WaveA412 + RF_WaveB435 );
				#elif defined( _NOISEMIXTYPE_SUBTRACT )
				float4 staticSwitch277 = ( RF_WaveA412 - RF_WaveB435 );
				#elif defined( _NOISEMIXTYPE_DIVIDE )
				float4 staticSwitch277 = ( RF_WaveA412 / RF_WaveB435 );
				#elif defined( _NOISEMIXTYPE_DOT )
				float4 staticSwitch277 = temp_cast_76;
				#elif defined( _NOISEMIXTYPE_FMOD )
				float4 staticSwitch277 = fmod( RF_WaveA412 , RF_WaveB435 );
				#elif defined( _NOISEMIXTYPE_FMODINVERT )
				float4 staticSwitch277 = fmod( RF_WaveB435 , RF_WaveA412 );
				#else
				float4 staticSwitch277 = temp_cast_77;
				#endif
				float3 gammaToLinear260 = Gamma22ToLinear( staticSwitch277.rgb );
				float3 linearToGamma261 = LinearToGamma22( staticSwitch277.rgb );
				#if defined( _DEFNOISEGRADETYPE_LINEAR )
				float4 staticSwitch276 = float4( gammaToLinear260 , 0.0 );
				#elif defined( _DEFNOISEGRADETYPE_NORMAL )
				float4 staticSwitch276 = staticSwitch277;
				#elif defined( _DEFNOISEGRADETYPE_GAMMA )
				float4 staticSwitch276 = float4( linearToGamma261 , 0.0 );
				#else
				float4 staticSwitch276 = float4( gammaToLinear260 , 0.0 );
				#endif
				float4 lerpResult5_g449 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , staticSwitch276 , _DefNoiseContrast);
				float4 RF_MiddleWave269 = (( _MiddleWave )?( ( saturate( (saturate( saturate( lerpResult5_g449 ) )*_DefNoiseGradeScale + _DefNoiseGradeOffset) ) * _MiddleWaveIntensity ) ):( temp_cast_42 ));
				float3 temp_cast_86 = (RF_Zero69).xxx;
				float screenDepth1_g450 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g450 = abs( ( screenDepth1_g450 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _FogDepthDistance ) );
				float saferPower3_g450 = abs( distanceDepth1_g450 );
				float temp_output_352_0 = saturate( pow( saferPower3_g450 , max( _FogDepthExponential , 0.001 ) ) );
				float3 temp_cast_87 = (temp_output_352_0).xxx;
				float3 temp_cast_88 = (temp_output_352_0).xxx;
				float3 gammaToLinear354 = Gamma22ToLinear( temp_cast_88 );
				float3 temp_cast_89 = (temp_output_352_0).xxx;
				float3 temp_cast_90 = (temp_output_352_0).xxx;
				float3 temp_cast_91 = (temp_output_352_0).xxx;
				float3 linearToGamma353 = LinearToGamma22( temp_cast_91 );
				float3 temp_cast_92 = (temp_output_352_0).xxx;
				#if defined( _FOGDEPTHGRADETYPE_LINEAR )
				float3 staticSwitch355 = gammaToLinear354;
				#elif defined( _FOGDEPTHGRADETYPE_NORMAL )
				float3 staticSwitch355 = temp_cast_89;
				#elif defined( _FOGDEPTHGRADETYPE_GAMMA )
				float3 staticSwitch355 = linearToGamma353;
				#else
				float3 staticSwitch355 = gammaToLinear354;
				#endif
				float3 RF_FogDepth360 = (( _FogToggle )?( saturate( ( 1.0 - staticSwitch355 ) ) ):( temp_cast_86 ));
				

				float3 BaseColor = RF_ShoreTexture584.rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = RF_ShoreTexture584.rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = ( ( float4( 0,0,0,0 ) * float4( RF_FlowMap39 , 0.0 ) * RF_DeformNoise185 * RF_MiddleWave269 * float4( RF_FogDepth360 , 0.0 ) ) + float4( 1,1,1,0 ) ).r;
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

			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;


			
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
			#define _EMISSION
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1

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
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _FOAMBLENDTYPE_NONE _FOAMBLENDTYPE_ADD _FOAMBLENDTYPE_MULTIPLY _FOAMBLENDTYPE_SUBTRACT _FOAMBLENDTYPE_DIVIDE _FOAMBLENDTYPE_DOT _FOAMBLENDTYPE_FMOD _FOAMBLENDTYPE_FMODINVERT
			#pragma shader_feature_local _FLOWTYPE_DEPTHMAP _FLOWTYPE_TEXTUREMAP
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _FLOWMAPGRADE_LINEAR _FLOWMAPGRADE_NORMAL _FLOWMAPGRADE_GAMMA
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_DOT _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;
			sampler2D _ShoreTexture;
			sampler2D _FlowMap;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _FoamTexture;


			float2 voronoihash2_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g437( n + g );
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
			
			float2 voronoihash8_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g437( n + g );
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
			
			float2 voronoihash18_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g437( n + g );
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
			
			float2 voronoihash17_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g437( n + g );
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
			
			float2 voronoihash10_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g437( n + g );
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
			
			float2 voronoihash12_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g437( n + g );
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
			
			float2 voronoihash24_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g437( n + g );
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
			
			float2 voronoihash23_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g437( n + g );
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
			
			float2 voronoihash2_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g436( n + g );
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
			
			float2 voronoihash8_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g436( n + g );
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
			
			float2 voronoihash18_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g436( n + g );
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
			
			float2 voronoihash17_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g436( n + g );
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
			
			float2 voronoihash10_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g436( n + g );
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
			
			float2 voronoihash12_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g436( n + g );
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
			
			float2 voronoihash24_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g436( n + g );
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
			
			float2 voronoihash23_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g436( n + g );
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
			
			float2 voronoihash2_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g439( n + g );
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
			
			float2 voronoihash8_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g439( n + g );
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
			
			float2 voronoihash18_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g439( n + g );
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
			
			float2 voronoihash17_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g439( n + g );
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
			
			float2 voronoihash10_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g439( n + g );
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
			
			float2 voronoihash12_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g439( n + g );
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
			
			float2 voronoihash24_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g439( n + g );
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
			
			float2 voronoihash23_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g439( n + g );
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
			
			float2 voronoihash2_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g438( n + g );
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
			
			float2 voronoihash8_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g438( n + g );
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
			
			float2 voronoihash18_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g438( n + g );
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
			
			float2 voronoihash17_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g438( n + g );
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
			
			float2 voronoihash10_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g438( n + g );
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
			
			float2 voronoihash12_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g438( n + g );
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
			
			float2 voronoihash24_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g438( n + g );
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
			
			float2 voronoihash23_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g438( n + g );
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

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
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

				float RF_Zero69 = 0.0;
				float4 temp_cast_0 = (RF_Zero69).xxxx;
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g421 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g421 = abs( ( screenDepth1_g421 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g421 = abs( distanceDepth1_g421 );
				float temp_output_24_0 = ( ( ase_screenPosNorm.w + (-1.0 + (_DepthSize - 1.0) * (0.0 - -1.0) / (0.0 - 1.0)) ) - ( saturate( pow( saferPower3_g421 , max( _DepthExponential , 0.001 ) ) ) * _ProjectionParams.x ) );
				float3 temp_cast_2 = (temp_output_24_0).xxx;
				float3 temp_cast_3 = (temp_output_24_0).xxx;
				float3 gammaToLinear25 = Gamma22ToLinear( temp_cast_3 );
				float3 temp_cast_4 = (temp_output_24_0).xxx;
				float3 temp_cast_5 = (temp_output_24_0).xxx;
				float3 temp_cast_6 = (temp_output_24_0).xxx;
				float3 linearToGamma26 = LinearToGamma22( temp_cast_6 );
				float3 temp_cast_7 = (temp_output_24_0).xxx;
				#if defined( _DEPTHGRADETYPE_LINEAR )
				float3 staticSwitch27 = gammaToLinear25;
				#elif defined( _DEPTHGRADETYPE_NORMAL )
				float3 staticSwitch27 = temp_cast_7;
				#elif defined( _DEPTHGRADETYPE_GAMMA )
				float3 staticSwitch27 = linearToGamma26;
				#else
				float3 staticSwitch27 = temp_cast_7;
				#endif
				float3 temp_output_28_0 = ( 1.0 - staticSwitch27 );
				float2 uv_FlowMap31 = IN.ase_texcoord4.xy;
				float4 tex2DNode31 = tex2D( _FlowMap, uv_FlowMap31 );
				float3 gammaToLinear35 = Gamma22ToLinear( tex2DNode31.rgb );
				float3 linearToGamma34 = LinearToGamma22( tex2DNode31.rgb );
				#if defined( _FLOWMAPGRADE_LINEAR )
				float3 staticSwitch37 = gammaToLinear35;
				#elif defined( _FLOWMAPGRADE_NORMAL )
				float3 staticSwitch37 = tex2DNode31.rgb;
				#elif defined( _FLOWMAPGRADE_GAMMA )
				float3 staticSwitch37 = linearToGamma34;
				#else
				float3 staticSwitch37 = linearToGamma34;
				#endif
				float3 saferPower63 = abs( staticSwitch37 );
				float3 temp_cast_8 = (_FlowMapExp).xxx;
				#if defined( _FLOWTYPE_DEPTHMAP )
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#elif defined( _FLOWTYPE_TEXTUREMAP )
				float3 staticSwitch43 = pow( saferPower63 , temp_cast_8 );
				#else
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#endif
				float3 RF_FlowMap39 = saturate( staticSwitch43 );
				float2 appendResult514 = (float2(_ShoreTileX , _ShoreTileY));
				float RF_Gray67 = 0.5;
				float4 temp_cast_10 = (RF_Gray67).xxxx;
				float4 temp_cast_12 = (RF_Gray67).xxxx;
				float DeformAScaleRef135 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScaleRef135;
				float DeformAAngleRef128 = _DeformAAngle;
				float mulTime143 = _TimeParameters.x * DeformAAngleRef128;
				float temp_output_4_0_g437 = mulTime143;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmoothRef136 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmoothRef136;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult107 = (float2(_DeformATileX , _DeformATileY));
				float mulTime92 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime93 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult106 = (float2(( _DeformAOffsetX + mulTime92 ) , ( mulTime93 + _DeformAOffsetY )));
				float2 texCoord118 = IN.ase_texcoord4.xy * appendResult107 + appendResult106;
				float2 appendResult119 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime96 = _TimeParameters.x * _DeformARotateSpeed;
				float cos126 = cos( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float sin126 = sin( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float2 rotator126 = mul( texCoord118 - appendResult119 , float2x2( cos126 , -sin126 , sin126 , cos126 )) + appendResult119;
				float2 DeformARef134 = rotator126;
				float2 temp_output_3_0_g437 = DeformARef134;
				float2 coords2_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id2_g437 = 0;
				float2 uv2_g437 = 0;
				float voroi2_g437 = voronoi2_g437( coords2_g437, time2_g437, id2_g437, uv2_g437, voronoiSmooth2_g437, voronoiSmoothId2_g437 );
				float time8_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId8_g437 = 0;
				float voronoiSmooth8_g437 = temp_output_28_0_g437;
				float2 coords8_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id8_g437 = 0;
				float2 uv8_g437 = 0;
				float fade8_g437 = 0.5;
				float voroi8_g437 = 0;
				float rest8_g437 = 0;
				for( int it8_g437 = 0; it8_g437 <2; it8_g437++ ){
				voroi8_g437 += fade8_g437 * voronoi8_g437( coords8_g437, time8_g437, id8_g437, uv8_g437, voronoiSmooth8_g437,voronoiSmoothId8_g437 );
				rest8_g437 += fade8_g437;
				coords8_g437 *= 2;
				fade8_g437 *= 0.5;
				}//Voronoi8_g437
				voroi8_g437 /= rest8_g437;
				float time18_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId18_g437 = 0;
				float voronoiSmooth18_g437 = temp_output_28_0_g437;
				float2 coords18_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id18_g437 = 0;
				float2 uv18_g437 = 0;
				float fade18_g437 = 0.5;
				float voroi18_g437 = 0;
				float rest18_g437 = 0;
				for( int it18_g437 = 0; it18_g437 <3; it18_g437++ ){
				voroi18_g437 += fade18_g437 * voronoi18_g437( coords18_g437, time18_g437, id18_g437, uv18_g437, voronoiSmooth18_g437,voronoiSmoothId18_g437 );
				rest18_g437 += fade18_g437;
				coords18_g437 *= 2;
				fade18_g437 *= 0.5;
				}//Voronoi18_g437
				voroi18_g437 /= rest18_g437;
				float time17_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId17_g437 = 0;
				float voronoiSmooth17_g437 = temp_output_28_0_g437;
				float2 coords17_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id17_g437 = 0;
				float2 uv17_g437 = 0;
				float fade17_g437 = 0.5;
				float voroi17_g437 = 0;
				float rest17_g437 = 0;
				for( int it17_g437 = 0; it17_g437 <4; it17_g437++ ){
				voroi17_g437 += fade17_g437 * voronoi17_g437( coords17_g437, time17_g437, id17_g437, uv17_g437, voronoiSmooth17_g437,voronoiSmoothId17_g437 );
				rest17_g437 += fade17_g437;
				coords17_g437 *= 2;
				fade17_g437 *= 0.5;
				}//Voronoi17_g437
				voroi17_g437 /= rest17_g437;
				float time10_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId10_g437 = 0;
				float voronoiSmooth10_g437 = temp_output_28_0_g437;
				float2 coords10_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id10_g437 = 0;
				float2 uv10_g437 = 0;
				float fade10_g437 = 0.5;
				float voroi10_g437 = 0;
				float rest10_g437 = 0;
				for( int it10_g437 = 0; it10_g437 <5; it10_g437++ ){
				voroi10_g437 += fade10_g437 * voronoi10_g437( coords10_g437, time10_g437, id10_g437, uv10_g437, voronoiSmooth10_g437,voronoiSmoothId10_g437 );
				rest10_g437 += fade10_g437;
				coords10_g437 *= 2;
				fade10_g437 *= 0.5;
				}//Voronoi10_g437
				voroi10_g437 /= rest10_g437;
				float time12_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId12_g437 = 0;
				float voronoiSmooth12_g437 = temp_output_28_0_g437;
				float2 coords12_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id12_g437 = 0;
				float2 uv12_g437 = 0;
				float fade12_g437 = 0.5;
				float voroi12_g437 = 0;
				float rest12_g437 = 0;
				for( int it12_g437 = 0; it12_g437 <6; it12_g437++ ){
				voroi12_g437 += fade12_g437 * voronoi12_g437( coords12_g437, time12_g437, id12_g437, uv12_g437, voronoiSmooth12_g437,voronoiSmoothId12_g437 );
				rest12_g437 += fade12_g437;
				coords12_g437 *= 2;
				fade12_g437 *= 0.5;
				}//Voronoi12_g437
				voroi12_g437 /= rest12_g437;
				float time24_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId24_g437 = 0;
				float voronoiSmooth24_g437 = temp_output_28_0_g437;
				float2 coords24_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id24_g437 = 0;
				float2 uv24_g437 = 0;
				float fade24_g437 = 0.5;
				float voroi24_g437 = 0;
				float rest24_g437 = 0;
				for( int it24_g437 = 0; it24_g437 <7; it24_g437++ ){
				voroi24_g437 += fade24_g437 * voronoi24_g437( coords24_g437, time24_g437, id24_g437, uv24_g437, voronoiSmooth24_g437,voronoiSmoothId24_g437 );
				rest24_g437 += fade24_g437;
				coords24_g437 *= 2;
				fade24_g437 *= 0.5;
				}//Voronoi24_g437
				voroi24_g437 /= rest24_g437;
				float time23_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId23_g437 = 0;
				float voronoiSmooth23_g437 = temp_output_28_0_g437;
				float2 coords23_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id23_g437 = 0;
				float2 uv23_g437 = 0;
				float fade23_g437 = 0.5;
				float voroi23_g437 = 0;
				float rest23_g437 = 0;
				for( int it23_g437 = 0; it23_g437 <8; it23_g437++ ){
				voroi23_g437 += fade23_g437 * voronoi23_g437( coords23_g437, time23_g437, id23_g437, uv23_g437, voronoiSmooth23_g437,voronoiSmoothId23_g437 );
				rest23_g437 += fade23_g437;
				coords23_g437 *= 2;
				fade23_g437 *= 0.5;
				}//Voronoi23_g437
				voroi23_g437 /= rest23_g437;
				#if defined( _DEF_VORCELL_A_TYPE_CELL1 )
				float staticSwitch154 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch154 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch154 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch154 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch154 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch154 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch154 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch154 = voroi23_g437;
				#else
				float staticSwitch154 = voroi18_g437;
				#endif
				float4 temp_cast_13 = (staticSwitch154).xxxx;
				float temp_output_5_0_g436 = DeformAScaleRef135;
				float temp_output_4_0_g436 = mulTime143;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef134;
				float2 coords2_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id2_g436 = 0;
				float2 uv2_g436 = 0;
				float voroi2_g436 = voronoi2_g436( coords2_g436, time2_g436, id2_g436, uv2_g436, voronoiSmooth2_g436, voronoiSmoothId2_g436 );
				float time8_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId8_g436 = 0;
				float voronoiSmooth8_g436 = 0.0;
				float2 coords8_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id8_g436 = 0;
				float2 uv8_g436 = 0;
				float fade8_g436 = 0.5;
				float voroi8_g436 = 0;
				float rest8_g436 = 0;
				for( int it8_g436 = 0; it8_g436 <2; it8_g436++ ){
				voroi8_g436 += fade8_g436 * voronoi8_g436( coords8_g436, time8_g436, id8_g436, uv8_g436, voronoiSmooth8_g436,voronoiSmoothId8_g436 );
				rest8_g436 += fade8_g436;
				coords8_g436 *= 2;
				fade8_g436 *= 0.5;
				}//Voronoi8_g436
				voroi8_g436 /= rest8_g436;
				float time18_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId18_g436 = 0;
				float voronoiSmooth18_g436 = 0.0;
				float2 coords18_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id18_g436 = 0;
				float2 uv18_g436 = 0;
				float fade18_g436 = 0.5;
				float voroi18_g436 = 0;
				float rest18_g436 = 0;
				for( int it18_g436 = 0; it18_g436 <3; it18_g436++ ){
				voroi18_g436 += fade18_g436 * voronoi18_g436( coords18_g436, time18_g436, id18_g436, uv18_g436, voronoiSmooth18_g436,voronoiSmoothId18_g436 );
				rest18_g436 += fade18_g436;
				coords18_g436 *= 2;
				fade18_g436 *= 0.5;
				}//Voronoi18_g436
				voroi18_g436 /= rest18_g436;
				float time17_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId17_g436 = 0;
				float voronoiSmooth17_g436 = 0.0;
				float2 coords17_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id17_g436 = 0;
				float2 uv17_g436 = 0;
				float fade17_g436 = 0.5;
				float voroi17_g436 = 0;
				float rest17_g436 = 0;
				for( int it17_g436 = 0; it17_g436 <6; it17_g436++ ){
				voroi17_g436 += fade17_g436 * voronoi17_g436( coords17_g436, time17_g436, id17_g436, uv17_g436, voronoiSmooth17_g436,voronoiSmoothId17_g436 );
				rest17_g436 += fade17_g436;
				coords17_g436 *= 2;
				fade17_g436 *= 0.5;
				}//Voronoi17_g436
				voroi17_g436 /= rest17_g436;
				float time10_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId10_g436 = 0;
				float2 coords10_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id10_g436 = 0;
				float2 uv10_g436 = 0;
				float voroi10_g436 = voronoi10_g436( coords10_g436, time10_g436, id10_g436, uv10_g436, 0, voronoiSmoothId10_g436 );
				float time12_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId12_g436 = 0;
				float2 coords12_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id12_g436 = 0;
				float2 uv12_g436 = 0;
				float fade12_g436 = 0.5;
				float voroi12_g436 = 0;
				float rest12_g436 = 0;
				for( int it12_g436 = 0; it12_g436 <3; it12_g436++ ){
				voroi12_g436 += fade12_g436 * voronoi12_g436( coords12_g436, time12_g436, id12_g436, uv12_g436, 0,voronoiSmoothId12_g436 );
				rest12_g436 += fade12_g436;
				coords12_g436 *= 2;
				fade12_g436 *= 0.5;
				}//Voronoi12_g436
				voroi12_g436 /= rest12_g436;
				float time24_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId24_g436 = 0;
				float2 coords24_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id24_g436 = 0;
				float2 uv24_g436 = 0;
				float fade24_g436 = 0.5;
				float voroi24_g436 = 0;
				float rest24_g436 = 0;
				for( int it24_g436 = 0; it24_g436 <5; it24_g436++ ){
				voroi24_g436 += fade24_g436 * voronoi24_g436( coords24_g436, time24_g436, id24_g436, uv24_g436, 0,voronoiSmoothId24_g436 );
				rest24_g436 += fade24_g436;
				coords24_g436 *= 2;
				fade24_g436 *= 0.5;
				}//Voronoi24_g436
				voroi24_g436 /= rest24_g436;
				float time23_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId23_g436 = 0;
				float2 coords23_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id23_g436 = 0;
				float2 uv23_g436 = 0;
				float fade23_g436 = 0.5;
				float voroi23_g436 = 0;
				float rest23_g436 = 0;
				for( int it23_g436 = 0; it23_g436 <6; it23_g436++ ){
				voroi23_g436 += fade23_g436 * voronoi23_g436( coords23_g436, time23_g436, id23_g436, uv23_g436, 0,voronoiSmoothId23_g436 );
				rest23_g436 += fade23_g436;
				coords23_g436 *= 2;
				fade23_g436 *= 0.5;
				}//Voronoi23_g436
				voroi23_g436 /= rest23_g436;
				#if defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 )
				float staticSwitch155 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch155 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch155 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch155 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch155 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch155 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch155 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch155 = voroi23_g436;
				#else
				float staticSwitch155 = voroi18_g436;
				#endif
				float4 temp_cast_14 = (staticSwitch155).xxxx;
				float simplePerlin3D151 = snoise( float3( DeformARef134 ,  0.0 )*DeformAScaleRef135 );
				simplePerlin3D151 = simplePerlin3D151*0.5 + 0.5;
				float4 temp_cast_16 = (simplePerlin3D151).xxxx;
				float4 temp_cast_17 = (RF_Gray67).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch158 = temp_cast_17;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch158 = temp_cast_13;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch158 = temp_cast_14;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch158 = temp_cast_16;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch158 = tex2D( _DeformAMap, DeformARef134 );
				#else
				float4 staticSwitch158 = temp_cast_17;
				#endif
				float4 lerpResult5_g423 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch158 ) ):( staticSwitch158 )) , _DeformAContrast);
				float4 temp_output_169_0 = ( saturate( lerpResult5_g423 ) * _DeformAIntensity );
				float4 temp_cast_19 = (RF_Gray67).xxxx;
				float DeformBScaleRef138 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScaleRef138;
				float DeformBAngleRef131 = _DeformBAngle;
				float mulTime142 = _TimeParameters.x * DeformBAngleRef131;
				float temp_output_4_0_g439 = mulTime142;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmoothRef139 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmoothRef139;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult113 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime89 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime87 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult112 = (float2(( _DeformBOffsetX + mulTime89 ) , ( mulTime87 + _DeformBOffsetY )));
				float2 texCoord122 = IN.ase_texcoord4.xy * appendResult113 + appendResult112;
				float2 appendResult123 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime99 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos130 = cos( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float sin130 = sin( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float2 rotator130 = mul( texCoord122 - appendResult123 , float2x2( cos130 , -sin130 , sin130 , cos130 )) + appendResult123;
				float2 DeformBRef137 = rotator130;
				float2 temp_output_3_0_g439 = DeformBRef137;
				float2 coords2_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id2_g439 = 0;
				float2 uv2_g439 = 0;
				float voroi2_g439 = voronoi2_g439( coords2_g439, time2_g439, id2_g439, uv2_g439, voronoiSmooth2_g439, voronoiSmoothId2_g439 );
				float time8_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId8_g439 = 0;
				float voronoiSmooth8_g439 = temp_output_28_0_g439;
				float2 coords8_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id8_g439 = 0;
				float2 uv8_g439 = 0;
				float fade8_g439 = 0.5;
				float voroi8_g439 = 0;
				float rest8_g439 = 0;
				for( int it8_g439 = 0; it8_g439 <2; it8_g439++ ){
				voroi8_g439 += fade8_g439 * voronoi8_g439( coords8_g439, time8_g439, id8_g439, uv8_g439, voronoiSmooth8_g439,voronoiSmoothId8_g439 );
				rest8_g439 += fade8_g439;
				coords8_g439 *= 2;
				fade8_g439 *= 0.5;
				}//Voronoi8_g439
				voroi8_g439 /= rest8_g439;
				float time18_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId18_g439 = 0;
				float voronoiSmooth18_g439 = temp_output_28_0_g439;
				float2 coords18_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id18_g439 = 0;
				float2 uv18_g439 = 0;
				float fade18_g439 = 0.5;
				float voroi18_g439 = 0;
				float rest18_g439 = 0;
				for( int it18_g439 = 0; it18_g439 <3; it18_g439++ ){
				voroi18_g439 += fade18_g439 * voronoi18_g439( coords18_g439, time18_g439, id18_g439, uv18_g439, voronoiSmooth18_g439,voronoiSmoothId18_g439 );
				rest18_g439 += fade18_g439;
				coords18_g439 *= 2;
				fade18_g439 *= 0.5;
				}//Voronoi18_g439
				voroi18_g439 /= rest18_g439;
				float time17_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId17_g439 = 0;
				float voronoiSmooth17_g439 = temp_output_28_0_g439;
				float2 coords17_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id17_g439 = 0;
				float2 uv17_g439 = 0;
				float fade17_g439 = 0.5;
				float voroi17_g439 = 0;
				float rest17_g439 = 0;
				for( int it17_g439 = 0; it17_g439 <4; it17_g439++ ){
				voroi17_g439 += fade17_g439 * voronoi17_g439( coords17_g439, time17_g439, id17_g439, uv17_g439, voronoiSmooth17_g439,voronoiSmoothId17_g439 );
				rest17_g439 += fade17_g439;
				coords17_g439 *= 2;
				fade17_g439 *= 0.5;
				}//Voronoi17_g439
				voroi17_g439 /= rest17_g439;
				float time10_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId10_g439 = 0;
				float voronoiSmooth10_g439 = temp_output_28_0_g439;
				float2 coords10_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id10_g439 = 0;
				float2 uv10_g439 = 0;
				float fade10_g439 = 0.5;
				float voroi10_g439 = 0;
				float rest10_g439 = 0;
				for( int it10_g439 = 0; it10_g439 <5; it10_g439++ ){
				voroi10_g439 += fade10_g439 * voronoi10_g439( coords10_g439, time10_g439, id10_g439, uv10_g439, voronoiSmooth10_g439,voronoiSmoothId10_g439 );
				rest10_g439 += fade10_g439;
				coords10_g439 *= 2;
				fade10_g439 *= 0.5;
				}//Voronoi10_g439
				voroi10_g439 /= rest10_g439;
				float time12_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId12_g439 = 0;
				float voronoiSmooth12_g439 = temp_output_28_0_g439;
				float2 coords12_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id12_g439 = 0;
				float2 uv12_g439 = 0;
				float fade12_g439 = 0.5;
				float voroi12_g439 = 0;
				float rest12_g439 = 0;
				for( int it12_g439 = 0; it12_g439 <6; it12_g439++ ){
				voroi12_g439 += fade12_g439 * voronoi12_g439( coords12_g439, time12_g439, id12_g439, uv12_g439, voronoiSmooth12_g439,voronoiSmoothId12_g439 );
				rest12_g439 += fade12_g439;
				coords12_g439 *= 2;
				fade12_g439 *= 0.5;
				}//Voronoi12_g439
				voroi12_g439 /= rest12_g439;
				float time24_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId24_g439 = 0;
				float voronoiSmooth24_g439 = temp_output_28_0_g439;
				float2 coords24_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id24_g439 = 0;
				float2 uv24_g439 = 0;
				float fade24_g439 = 0.5;
				float voroi24_g439 = 0;
				float rest24_g439 = 0;
				for( int it24_g439 = 0; it24_g439 <7; it24_g439++ ){
				voroi24_g439 += fade24_g439 * voronoi24_g439( coords24_g439, time24_g439, id24_g439, uv24_g439, voronoiSmooth24_g439,voronoiSmoothId24_g439 );
				rest24_g439 += fade24_g439;
				coords24_g439 *= 2;
				fade24_g439 *= 0.5;
				}//Voronoi24_g439
				voroi24_g439 /= rest24_g439;
				float time23_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId23_g439 = 0;
				float voronoiSmooth23_g439 = temp_output_28_0_g439;
				float2 coords23_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id23_g439 = 0;
				float2 uv23_g439 = 0;
				float fade23_g439 = 0.5;
				float voroi23_g439 = 0;
				float rest23_g439 = 0;
				for( int it23_g439 = 0; it23_g439 <8; it23_g439++ ){
				voroi23_g439 += fade23_g439 * voronoi23_g439( coords23_g439, time23_g439, id23_g439, uv23_g439, voronoiSmooth23_g439,voronoiSmoothId23_g439 );
				rest23_g439 += fade23_g439;
				coords23_g439 *= 2;
				fade23_g439 *= 0.5;
				}//Voronoi23_g439
				voroi23_g439 /= rest23_g439;
				#if defined( _DEF_VORCELL_B_TYPE_CELL1 )
				float staticSwitch149 = voroi2_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL2 )
				float staticSwitch149 = voroi8_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL3 )
				float staticSwitch149 = voroi18_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL4 )
				float staticSwitch149 = voroi17_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL5 )
				float staticSwitch149 = voroi10_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL6 )
				float staticSwitch149 = voroi12_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL7 )
				float staticSwitch149 = voroi24_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL8 )
				float staticSwitch149 = voroi23_g439;
				#else
				float staticSwitch149 = voroi18_g439;
				#endif
				float4 temp_cast_20 = (staticSwitch149).xxxx;
				float temp_output_5_0_g438 = DeformBScaleRef138;
				float temp_output_4_0_g438 = mulTime142;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef137;
				float2 coords2_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id2_g438 = 0;
				float2 uv2_g438 = 0;
				float voroi2_g438 = voronoi2_g438( coords2_g438, time2_g438, id2_g438, uv2_g438, voronoiSmooth2_g438, voronoiSmoothId2_g438 );
				float time8_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId8_g438 = 0;
				float voronoiSmooth8_g438 = 0.0;
				float2 coords8_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id8_g438 = 0;
				float2 uv8_g438 = 0;
				float fade8_g438 = 0.5;
				float voroi8_g438 = 0;
				float rest8_g438 = 0;
				for( int it8_g438 = 0; it8_g438 <2; it8_g438++ ){
				voroi8_g438 += fade8_g438 * voronoi8_g438( coords8_g438, time8_g438, id8_g438, uv8_g438, voronoiSmooth8_g438,voronoiSmoothId8_g438 );
				rest8_g438 += fade8_g438;
				coords8_g438 *= 2;
				fade8_g438 *= 0.5;
				}//Voronoi8_g438
				voroi8_g438 /= rest8_g438;
				float time18_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId18_g438 = 0;
				float voronoiSmooth18_g438 = 0.0;
				float2 coords18_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id18_g438 = 0;
				float2 uv18_g438 = 0;
				float fade18_g438 = 0.5;
				float voroi18_g438 = 0;
				float rest18_g438 = 0;
				for( int it18_g438 = 0; it18_g438 <3; it18_g438++ ){
				voroi18_g438 += fade18_g438 * voronoi18_g438( coords18_g438, time18_g438, id18_g438, uv18_g438, voronoiSmooth18_g438,voronoiSmoothId18_g438 );
				rest18_g438 += fade18_g438;
				coords18_g438 *= 2;
				fade18_g438 *= 0.5;
				}//Voronoi18_g438
				voroi18_g438 /= rest18_g438;
				float time17_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId17_g438 = 0;
				float voronoiSmooth17_g438 = 0.0;
				float2 coords17_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id17_g438 = 0;
				float2 uv17_g438 = 0;
				float fade17_g438 = 0.5;
				float voroi17_g438 = 0;
				float rest17_g438 = 0;
				for( int it17_g438 = 0; it17_g438 <6; it17_g438++ ){
				voroi17_g438 += fade17_g438 * voronoi17_g438( coords17_g438, time17_g438, id17_g438, uv17_g438, voronoiSmooth17_g438,voronoiSmoothId17_g438 );
				rest17_g438 += fade17_g438;
				coords17_g438 *= 2;
				fade17_g438 *= 0.5;
				}//Voronoi17_g438
				voroi17_g438 /= rest17_g438;
				float time10_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId10_g438 = 0;
				float2 coords10_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id10_g438 = 0;
				float2 uv10_g438 = 0;
				float voroi10_g438 = voronoi10_g438( coords10_g438, time10_g438, id10_g438, uv10_g438, 0, voronoiSmoothId10_g438 );
				float time12_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId12_g438 = 0;
				float2 coords12_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id12_g438 = 0;
				float2 uv12_g438 = 0;
				float fade12_g438 = 0.5;
				float voroi12_g438 = 0;
				float rest12_g438 = 0;
				for( int it12_g438 = 0; it12_g438 <3; it12_g438++ ){
				voroi12_g438 += fade12_g438 * voronoi12_g438( coords12_g438, time12_g438, id12_g438, uv12_g438, 0,voronoiSmoothId12_g438 );
				rest12_g438 += fade12_g438;
				coords12_g438 *= 2;
				fade12_g438 *= 0.5;
				}//Voronoi12_g438
				voroi12_g438 /= rest12_g438;
				float time24_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId24_g438 = 0;
				float2 coords24_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id24_g438 = 0;
				float2 uv24_g438 = 0;
				float fade24_g438 = 0.5;
				float voroi24_g438 = 0;
				float rest24_g438 = 0;
				for( int it24_g438 = 0; it24_g438 <5; it24_g438++ ){
				voroi24_g438 += fade24_g438 * voronoi24_g438( coords24_g438, time24_g438, id24_g438, uv24_g438, 0,voronoiSmoothId24_g438 );
				rest24_g438 += fade24_g438;
				coords24_g438 *= 2;
				fade24_g438 *= 0.5;
				}//Voronoi24_g438
				voroi24_g438 /= rest24_g438;
				float time23_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId23_g438 = 0;
				float2 coords23_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id23_g438 = 0;
				float2 uv23_g438 = 0;
				float fade23_g438 = 0.5;
				float voroi23_g438 = 0;
				float rest23_g438 = 0;
				for( int it23_g438 = 0; it23_g438 <6; it23_g438++ ){
				voroi23_g438 += fade23_g438 * voronoi23_g438( coords23_g438, time23_g438, id23_g438, uv23_g438, 0,voronoiSmoothId23_g438 );
				rest23_g438 += fade23_g438;
				coords23_g438 *= 2;
				fade23_g438 *= 0.5;
				}//Voronoi23_g438
				voroi23_g438 /= rest23_g438;
				#if defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 )
				float staticSwitch148 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 )
				float staticSwitch148 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 )
				float staticSwitch148 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 )
				float staticSwitch148 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 )
				float staticSwitch148 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 )
				float staticSwitch148 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 )
				float staticSwitch148 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8 )
				float staticSwitch148 = voroi23_g438;
				#else
				float staticSwitch148 = voroi18_g438;
				#endif
				float4 temp_cast_21 = (staticSwitch148).xxxx;
				float simplePerlin3D156 = snoise( float3( DeformBRef137 ,  0.0 )*DeformBScaleRef138 );
				simplePerlin3D156 = simplePerlin3D156*0.5 + 0.5;
				float4 temp_cast_23 = (simplePerlin3D156).xxxx;
				float4 temp_cast_24 = (RF_Gray67).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch157 = temp_cast_24;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch157 = temp_cast_20;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch157 = temp_cast_21;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch157 = temp_cast_23;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch157 = tex2D( _DeformBMap, DeformBRef137 );
				#else
				float4 staticSwitch157 = temp_cast_24;
				#endif
				float4 lerpResult5_g422 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch157 ) ):( staticSwitch157 )) , _DeformBContrast);
				float4 temp_output_170_0 = ( saturate( lerpResult5_g422 ) * _DeformBIntensity );
				float dotResult344 = dot( temp_output_169_0 , temp_output_170_0 );
				float4 temp_cast_25 = (dotResult344).xxxx;
				float4 temp_cast_26 = (RF_Gray67).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch178 = temp_cast_26;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch178 = temp_output_169_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch178 = ( temp_output_169_0 * temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch178 = ( temp_output_169_0 + temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch178 = ( temp_output_169_0 - temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch178 = ( temp_output_169_0 / temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DOT )
				float4 staticSwitch178 = temp_cast_25;
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch178 = fmod( temp_output_169_0 , temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch178 = fmod( temp_output_170_0 , temp_output_169_0 );
				#else
				float4 staticSwitch178 = temp_cast_26;
				#endif
				float3 gammaToLinear179 = Gamma22ToLinear( staticSwitch178.rgb );
				float3 linearToGamma180 = LinearToGamma22( staticSwitch178.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch183 = float4( gammaToLinear179 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch183 = staticSwitch178;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch183 = float4( linearToGamma180 , 0.0 );
				#else
				float4 staticSwitch183 = staticSwitch178;
				#endif
				float4 RF_DeformNoise185 = (staticSwitch183*_DeformFinalContrast + _DeformFinalBias);
				float4 RF_ShoreDeform595 = (RF_DeformNoise185*_ShoreDeformScale + _ShoreDeformOffset);
				float4 lerpResult5_g1 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_ShoreDeform595 , _ShoreDeformStrength);
				float mulTime521 = _TimeParameters.x * ( _ShoreSpeedX * _ShoreOverallSpeed );
				float mulTime522 = _TimeParameters.x * ( _ShoreOverallSpeed * _ShoreSpeedY );
				float2 appendResult549 = (float2(( _ShoreOffsetX + mulTime521 ) , ( mulTime522 + _ShoreOffsetY )));
				float2 texCoord550 = IN.ase_texcoord4.xy * ( RF_FlowMap39 + float3( (( _AffectShoreDef )?( ( (saturate( lerpResult5_g1 )).rg * appendResult514 ) ):( appendResult514 )) ,  0.0 ) ).xy + appendResult549;
				float2 appendResult554 = (float2(_ShoreAnchorX , _ShoreAnchorY));
				float mulTime532 = _TimeParameters.x * _ShoreRotateSpeed;
				float cos556 = cos( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float sin556 = sin( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float2 rotator556 = mul( texCoord550 - appendResult554 , float2x2( cos556 , -sin556 , sin556 , cos556 )) + appendResult554;
				float4 lerpResult5_g454 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _ShoreTexture, rotator556 ) , _ShoreContrast);
				float4 temp_output_560_0 = saturate( saturate( lerpResult5_g454 ) );
				float4 RF_Shore606 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_560_0 ) ):( temp_output_560_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * _ShoreIntensity );
				float2 appendResult515 = (float2(_FoamTileX , _FoamTileY));
				float4 RF_FoamDeform632 = (RF_DeformNoise185*_FoamDeformScale + _FoamDeformOffset);
				float4 lerpResult5_g2 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_FoamDeform632 , _FoamDeformStrength);
				float mulTime517 = _TimeParameters.x * ( _FoamSpeedX * _FoamOverallSpeed );
				float mulTime518 = _TimeParameters.x * ( _FoamOverallSpeed * _FoamSpeedY );
				float2 appendResult548 = (float2(( _FoamOffsetX + mulTime517 ) , ( mulTime518 + _FoamOffsetY )));
				float2 texCoord551 = IN.ase_texcoord4.xy * (( _AffectFoamDef )?( ( (saturate( lerpResult5_g2 )).rg * appendResult515 ) ):( appendResult515 )) + appendResult548;
				float2 appendResult552 = (float2(_FoamAnchorX , _FoamAnchorY));
				float mulTime527 = _TimeParameters.x * _FoamRotateSpeed;
				float cos557 = cos( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float sin557 = sin( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float2 rotator557 = mul( texCoord551 - appendResult552 , float2x2( cos557 , -sin557 , sin557 , cos557 )) + appendResult552;
				float4 lerpResult5_g455 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _FoamTexture, rotator557 ) , _FoamContrast);
				float4 temp_output_561_0 = saturate( saturate( lerpResult5_g455 ) );
				float4 RF_Foam607 = ( ((( _InvertFoamTexture )?( ( 1.0 - temp_output_561_0 ) ):( temp_output_561_0 ))*_FoamGradeScale + _FoamGradeOffset) * _FoamIntensity );
				float dotResult597 = dot( RF_Shore606 , RF_Foam607 );
				float4 temp_cast_37 = (saturate( dotResult597 )).xxxx;
				#if defined( _FOAMBLENDTYPE_NONE )
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#elif defined( _FOAMBLENDTYPE_ADD )
				float4 staticSwitch582 = saturate( ( RF_Shore606 + RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_MULTIPLY )
				float4 staticSwitch582 = saturate( ( RF_Shore606 * RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_SUBTRACT )
				float4 staticSwitch582 = saturate( ( RF_Shore606 - RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DIVIDE )
				float4 staticSwitch582 = saturate( ( RF_Shore606 / RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DOT )
				float4 staticSwitch582 = temp_cast_37;
				#elif defined( _FOAMBLENDTYPE_FMOD )
				float4 staticSwitch582 = saturate( fmod( RF_Shore606 , RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_FMODINVERT )
				float4 staticSwitch582 = saturate( fmod( RF_Foam607 , RF_Shore606 ) );
				#else
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#endif
				float4 RF_ShoreTexture584 = (( _ShoreToggle )?( ( staticSwitch582 * float4( RF_FlowMap39 , 0.0 ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = RF_ShoreTexture584.rgb;
				float3 Emission = RF_ShoreTexture584.rgb;
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
			#define _EMISSION
			#define ASE_SRP_VERSION 140010
			#define REQUIRE_DEPTH_TEXTURE 1


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
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _FOAMBLENDTYPE_NONE _FOAMBLENDTYPE_ADD _FOAMBLENDTYPE_MULTIPLY _FOAMBLENDTYPE_SUBTRACT _FOAMBLENDTYPE_DIVIDE _FOAMBLENDTYPE_DOT _FOAMBLENDTYPE_FMOD _FOAMBLENDTYPE_FMODINVERT
			#pragma shader_feature_local _FLOWTYPE_DEPTHMAP _FLOWTYPE_TEXTUREMAP
			#pragma shader_feature_local _DEPTHGRADETYPE_LINEAR _DEPTHGRADETYPE_NORMAL _DEPTHGRADETYPE_GAMMA
			#pragma shader_feature_local _FLOWMAPGRADE_LINEAR _FLOWMAPGRADE_NORMAL _FLOWMAPGRADE_GAMMA
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_DOT _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;
			sampler2D _ShoreTexture;
			sampler2D _FlowMap;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _FoamTexture;


			float2 voronoihash2_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g437( n + g );
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
			
			float2 voronoihash8_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g437( n + g );
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
			
			float2 voronoihash18_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g437( n + g );
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
			
			float2 voronoihash17_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g437( n + g );
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
			
			float2 voronoihash10_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g437( n + g );
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
			
			float2 voronoihash12_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g437( n + g );
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
			
			float2 voronoihash24_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g437( n + g );
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
			
			float2 voronoihash23_g437( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g437( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g437( n + g );
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
			
			float2 voronoihash2_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g436( n + g );
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
			
			float2 voronoihash8_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g436( n + g );
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
			
			float2 voronoihash18_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g436( n + g );
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
			
			float2 voronoihash17_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g436( n + g );
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
			
			float2 voronoihash10_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g436( n + g );
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
			
			float2 voronoihash12_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g436( n + g );
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
			
			float2 voronoihash24_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g436( n + g );
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
			
			float2 voronoihash23_g436( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g436( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g436( n + g );
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
			
			float2 voronoihash2_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g439( n + g );
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
			
			float2 voronoihash8_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g439( n + g );
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
			
			float2 voronoihash18_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g439( n + g );
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
			
			float2 voronoihash17_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g439( n + g );
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
			
			float2 voronoihash10_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g439( n + g );
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
			
			float2 voronoihash12_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g439( n + g );
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
			
			float2 voronoihash24_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g439( n + g );
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
			
			float2 voronoihash23_g439( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g439( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g439( n + g );
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
			
			float2 voronoihash2_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi2_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash2_g438( n + g );
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
			
			float2 voronoihash8_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi8_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash8_g438( n + g );
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
			
			float2 voronoihash18_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi18_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash18_g438( n + g );
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
			
			float2 voronoihash17_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi17_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash17_g438( n + g );
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
			
			float2 voronoihash10_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi10_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash10_g438( n + g );
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
			
			float2 voronoihash12_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi12_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash12_g438( n + g );
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
			
			float2 voronoihash24_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi24_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash24_g438( n + g );
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
			
			float2 voronoihash23_g438( float2 p )
			{
				
				p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
				return frac( sin( p ) *43758.5453);
			}
			
			float voronoi23_g438( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
				 		float2 o = voronoihash23_g438( n + g );
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

				float4 ase_clipPos = TransformObjectToHClip((v.positionOS).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
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

				float RF_Zero69 = 0.0;
				float4 temp_cast_0 = (RF_Zero69).xxxx;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth1_g421 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1_g421 = abs( ( screenDepth1_g421 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthDistance ) );
				float saferPower3_g421 = abs( distanceDepth1_g421 );
				float temp_output_24_0 = ( ( ase_screenPosNorm.w + (-1.0 + (_DepthSize - 1.0) * (0.0 - -1.0) / (0.0 - 1.0)) ) - ( saturate( pow( saferPower3_g421 , max( _DepthExponential , 0.001 ) ) ) * _ProjectionParams.x ) );
				float3 temp_cast_2 = (temp_output_24_0).xxx;
				float3 temp_cast_3 = (temp_output_24_0).xxx;
				float3 gammaToLinear25 = Gamma22ToLinear( temp_cast_3 );
				float3 temp_cast_4 = (temp_output_24_0).xxx;
				float3 temp_cast_5 = (temp_output_24_0).xxx;
				float3 temp_cast_6 = (temp_output_24_0).xxx;
				float3 linearToGamma26 = LinearToGamma22( temp_cast_6 );
				float3 temp_cast_7 = (temp_output_24_0).xxx;
				#if defined( _DEPTHGRADETYPE_LINEAR )
				float3 staticSwitch27 = gammaToLinear25;
				#elif defined( _DEPTHGRADETYPE_NORMAL )
				float3 staticSwitch27 = temp_cast_7;
				#elif defined( _DEPTHGRADETYPE_GAMMA )
				float3 staticSwitch27 = linearToGamma26;
				#else
				float3 staticSwitch27 = temp_cast_7;
				#endif
				float3 temp_output_28_0 = ( 1.0 - staticSwitch27 );
				float2 uv_FlowMap31 = IN.ase_texcoord2.xy;
				float4 tex2DNode31 = tex2D( _FlowMap, uv_FlowMap31 );
				float3 gammaToLinear35 = Gamma22ToLinear( tex2DNode31.rgb );
				float3 linearToGamma34 = LinearToGamma22( tex2DNode31.rgb );
				#if defined( _FLOWMAPGRADE_LINEAR )
				float3 staticSwitch37 = gammaToLinear35;
				#elif defined( _FLOWMAPGRADE_NORMAL )
				float3 staticSwitch37 = tex2DNode31.rgb;
				#elif defined( _FLOWMAPGRADE_GAMMA )
				float3 staticSwitch37 = linearToGamma34;
				#else
				float3 staticSwitch37 = linearToGamma34;
				#endif
				float3 saferPower63 = abs( staticSwitch37 );
				float3 temp_cast_8 = (_FlowMapExp).xxx;
				#if defined( _FLOWTYPE_DEPTHMAP )
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#elif defined( _FLOWTYPE_TEXTUREMAP )
				float3 staticSwitch43 = pow( saferPower63 , temp_cast_8 );
				#else
				float3 staticSwitch43 = (temp_output_28_0*_FlowDepthContrast + 0.0);
				#endif
				float3 RF_FlowMap39 = saturate( staticSwitch43 );
				float2 appendResult514 = (float2(_ShoreTileX , _ShoreTileY));
				float RF_Gray67 = 0.5;
				float4 temp_cast_10 = (RF_Gray67).xxxx;
				float4 temp_cast_12 = (RF_Gray67).xxxx;
				float DeformAScaleRef135 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScaleRef135;
				float DeformAAngleRef128 = _DeformAAngle;
				float mulTime143 = _TimeParameters.x * DeformAAngleRef128;
				float temp_output_4_0_g437 = mulTime143;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmoothRef136 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmoothRef136;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult107 = (float2(_DeformATileX , _DeformATileY));
				float mulTime92 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime93 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult106 = (float2(( _DeformAOffsetX + mulTime92 ) , ( mulTime93 + _DeformAOffsetY )));
				float2 texCoord118 = IN.ase_texcoord2.xy * appendResult107 + appendResult106;
				float2 appendResult119 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime96 = _TimeParameters.x * _DeformARotateSpeed;
				float cos126 = cos( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float sin126 = sin( ( radians( mulTime96 ) + radians( _DeformARotate ) ) );
				float2 rotator126 = mul( texCoord118 - appendResult119 , float2x2( cos126 , -sin126 , sin126 , cos126 )) + appendResult119;
				float2 DeformARef134 = rotator126;
				float2 temp_output_3_0_g437 = DeformARef134;
				float2 coords2_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id2_g437 = 0;
				float2 uv2_g437 = 0;
				float voroi2_g437 = voronoi2_g437( coords2_g437, time2_g437, id2_g437, uv2_g437, voronoiSmooth2_g437, voronoiSmoothId2_g437 );
				float time8_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId8_g437 = 0;
				float voronoiSmooth8_g437 = temp_output_28_0_g437;
				float2 coords8_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id8_g437 = 0;
				float2 uv8_g437 = 0;
				float fade8_g437 = 0.5;
				float voroi8_g437 = 0;
				float rest8_g437 = 0;
				for( int it8_g437 = 0; it8_g437 <2; it8_g437++ ){
				voroi8_g437 += fade8_g437 * voronoi8_g437( coords8_g437, time8_g437, id8_g437, uv8_g437, voronoiSmooth8_g437,voronoiSmoothId8_g437 );
				rest8_g437 += fade8_g437;
				coords8_g437 *= 2;
				fade8_g437 *= 0.5;
				}//Voronoi8_g437
				voroi8_g437 /= rest8_g437;
				float time18_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId18_g437 = 0;
				float voronoiSmooth18_g437 = temp_output_28_0_g437;
				float2 coords18_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id18_g437 = 0;
				float2 uv18_g437 = 0;
				float fade18_g437 = 0.5;
				float voroi18_g437 = 0;
				float rest18_g437 = 0;
				for( int it18_g437 = 0; it18_g437 <3; it18_g437++ ){
				voroi18_g437 += fade18_g437 * voronoi18_g437( coords18_g437, time18_g437, id18_g437, uv18_g437, voronoiSmooth18_g437,voronoiSmoothId18_g437 );
				rest18_g437 += fade18_g437;
				coords18_g437 *= 2;
				fade18_g437 *= 0.5;
				}//Voronoi18_g437
				voroi18_g437 /= rest18_g437;
				float time17_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId17_g437 = 0;
				float voronoiSmooth17_g437 = temp_output_28_0_g437;
				float2 coords17_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id17_g437 = 0;
				float2 uv17_g437 = 0;
				float fade17_g437 = 0.5;
				float voroi17_g437 = 0;
				float rest17_g437 = 0;
				for( int it17_g437 = 0; it17_g437 <4; it17_g437++ ){
				voroi17_g437 += fade17_g437 * voronoi17_g437( coords17_g437, time17_g437, id17_g437, uv17_g437, voronoiSmooth17_g437,voronoiSmoothId17_g437 );
				rest17_g437 += fade17_g437;
				coords17_g437 *= 2;
				fade17_g437 *= 0.5;
				}//Voronoi17_g437
				voroi17_g437 /= rest17_g437;
				float time10_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId10_g437 = 0;
				float voronoiSmooth10_g437 = temp_output_28_0_g437;
				float2 coords10_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id10_g437 = 0;
				float2 uv10_g437 = 0;
				float fade10_g437 = 0.5;
				float voroi10_g437 = 0;
				float rest10_g437 = 0;
				for( int it10_g437 = 0; it10_g437 <5; it10_g437++ ){
				voroi10_g437 += fade10_g437 * voronoi10_g437( coords10_g437, time10_g437, id10_g437, uv10_g437, voronoiSmooth10_g437,voronoiSmoothId10_g437 );
				rest10_g437 += fade10_g437;
				coords10_g437 *= 2;
				fade10_g437 *= 0.5;
				}//Voronoi10_g437
				voroi10_g437 /= rest10_g437;
				float time12_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId12_g437 = 0;
				float voronoiSmooth12_g437 = temp_output_28_0_g437;
				float2 coords12_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id12_g437 = 0;
				float2 uv12_g437 = 0;
				float fade12_g437 = 0.5;
				float voroi12_g437 = 0;
				float rest12_g437 = 0;
				for( int it12_g437 = 0; it12_g437 <6; it12_g437++ ){
				voroi12_g437 += fade12_g437 * voronoi12_g437( coords12_g437, time12_g437, id12_g437, uv12_g437, voronoiSmooth12_g437,voronoiSmoothId12_g437 );
				rest12_g437 += fade12_g437;
				coords12_g437 *= 2;
				fade12_g437 *= 0.5;
				}//Voronoi12_g437
				voroi12_g437 /= rest12_g437;
				float time24_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId24_g437 = 0;
				float voronoiSmooth24_g437 = temp_output_28_0_g437;
				float2 coords24_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id24_g437 = 0;
				float2 uv24_g437 = 0;
				float fade24_g437 = 0.5;
				float voroi24_g437 = 0;
				float rest24_g437 = 0;
				for( int it24_g437 = 0; it24_g437 <7; it24_g437++ ){
				voroi24_g437 += fade24_g437 * voronoi24_g437( coords24_g437, time24_g437, id24_g437, uv24_g437, voronoiSmooth24_g437,voronoiSmoothId24_g437 );
				rest24_g437 += fade24_g437;
				coords24_g437 *= 2;
				fade24_g437 *= 0.5;
				}//Voronoi24_g437
				voroi24_g437 /= rest24_g437;
				float time23_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId23_g437 = 0;
				float voronoiSmooth23_g437 = temp_output_28_0_g437;
				float2 coords23_g437 = temp_output_3_0_g437 * temp_output_5_0_g437;
				float2 id23_g437 = 0;
				float2 uv23_g437 = 0;
				float fade23_g437 = 0.5;
				float voroi23_g437 = 0;
				float rest23_g437 = 0;
				for( int it23_g437 = 0; it23_g437 <8; it23_g437++ ){
				voroi23_g437 += fade23_g437 * voronoi23_g437( coords23_g437, time23_g437, id23_g437, uv23_g437, voronoiSmooth23_g437,voronoiSmoothId23_g437 );
				rest23_g437 += fade23_g437;
				coords23_g437 *= 2;
				fade23_g437 *= 0.5;
				}//Voronoi23_g437
				voroi23_g437 /= rest23_g437;
				#if defined( _DEF_VORCELL_A_TYPE_CELL1 )
				float staticSwitch154 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch154 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch154 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch154 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch154 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch154 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch154 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch154 = voroi23_g437;
				#else
				float staticSwitch154 = voroi18_g437;
				#endif
				float4 temp_cast_13 = (staticSwitch154).xxxx;
				float temp_output_5_0_g436 = DeformAScaleRef135;
				float temp_output_4_0_g436 = mulTime143;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef134;
				float2 coords2_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id2_g436 = 0;
				float2 uv2_g436 = 0;
				float voroi2_g436 = voronoi2_g436( coords2_g436, time2_g436, id2_g436, uv2_g436, voronoiSmooth2_g436, voronoiSmoothId2_g436 );
				float time8_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId8_g436 = 0;
				float voronoiSmooth8_g436 = 0.0;
				float2 coords8_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id8_g436 = 0;
				float2 uv8_g436 = 0;
				float fade8_g436 = 0.5;
				float voroi8_g436 = 0;
				float rest8_g436 = 0;
				for( int it8_g436 = 0; it8_g436 <2; it8_g436++ ){
				voroi8_g436 += fade8_g436 * voronoi8_g436( coords8_g436, time8_g436, id8_g436, uv8_g436, voronoiSmooth8_g436,voronoiSmoothId8_g436 );
				rest8_g436 += fade8_g436;
				coords8_g436 *= 2;
				fade8_g436 *= 0.5;
				}//Voronoi8_g436
				voroi8_g436 /= rest8_g436;
				float time18_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId18_g436 = 0;
				float voronoiSmooth18_g436 = 0.0;
				float2 coords18_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id18_g436 = 0;
				float2 uv18_g436 = 0;
				float fade18_g436 = 0.5;
				float voroi18_g436 = 0;
				float rest18_g436 = 0;
				for( int it18_g436 = 0; it18_g436 <3; it18_g436++ ){
				voroi18_g436 += fade18_g436 * voronoi18_g436( coords18_g436, time18_g436, id18_g436, uv18_g436, voronoiSmooth18_g436,voronoiSmoothId18_g436 );
				rest18_g436 += fade18_g436;
				coords18_g436 *= 2;
				fade18_g436 *= 0.5;
				}//Voronoi18_g436
				voroi18_g436 /= rest18_g436;
				float time17_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId17_g436 = 0;
				float voronoiSmooth17_g436 = 0.0;
				float2 coords17_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id17_g436 = 0;
				float2 uv17_g436 = 0;
				float fade17_g436 = 0.5;
				float voroi17_g436 = 0;
				float rest17_g436 = 0;
				for( int it17_g436 = 0; it17_g436 <6; it17_g436++ ){
				voroi17_g436 += fade17_g436 * voronoi17_g436( coords17_g436, time17_g436, id17_g436, uv17_g436, voronoiSmooth17_g436,voronoiSmoothId17_g436 );
				rest17_g436 += fade17_g436;
				coords17_g436 *= 2;
				fade17_g436 *= 0.5;
				}//Voronoi17_g436
				voroi17_g436 /= rest17_g436;
				float time10_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId10_g436 = 0;
				float2 coords10_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id10_g436 = 0;
				float2 uv10_g436 = 0;
				float voroi10_g436 = voronoi10_g436( coords10_g436, time10_g436, id10_g436, uv10_g436, 0, voronoiSmoothId10_g436 );
				float time12_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId12_g436 = 0;
				float2 coords12_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id12_g436 = 0;
				float2 uv12_g436 = 0;
				float fade12_g436 = 0.5;
				float voroi12_g436 = 0;
				float rest12_g436 = 0;
				for( int it12_g436 = 0; it12_g436 <3; it12_g436++ ){
				voroi12_g436 += fade12_g436 * voronoi12_g436( coords12_g436, time12_g436, id12_g436, uv12_g436, 0,voronoiSmoothId12_g436 );
				rest12_g436 += fade12_g436;
				coords12_g436 *= 2;
				fade12_g436 *= 0.5;
				}//Voronoi12_g436
				voroi12_g436 /= rest12_g436;
				float time24_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId24_g436 = 0;
				float2 coords24_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id24_g436 = 0;
				float2 uv24_g436 = 0;
				float fade24_g436 = 0.5;
				float voroi24_g436 = 0;
				float rest24_g436 = 0;
				for( int it24_g436 = 0; it24_g436 <5; it24_g436++ ){
				voroi24_g436 += fade24_g436 * voronoi24_g436( coords24_g436, time24_g436, id24_g436, uv24_g436, 0,voronoiSmoothId24_g436 );
				rest24_g436 += fade24_g436;
				coords24_g436 *= 2;
				fade24_g436 *= 0.5;
				}//Voronoi24_g436
				voroi24_g436 /= rest24_g436;
				float time23_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId23_g436 = 0;
				float2 coords23_g436 = temp_output_3_0_g436 * temp_output_5_0_g436;
				float2 id23_g436 = 0;
				float2 uv23_g436 = 0;
				float fade23_g436 = 0.5;
				float voroi23_g436 = 0;
				float rest23_g436 = 0;
				for( int it23_g436 = 0; it23_g436 <6; it23_g436++ ){
				voroi23_g436 += fade23_g436 * voronoi23_g436( coords23_g436, time23_g436, id23_g436, uv23_g436, 0,voronoiSmoothId23_g436 );
				rest23_g436 += fade23_g436;
				coords23_g436 *= 2;
				fade23_g436 *= 0.5;
				}//Voronoi23_g436
				voroi23_g436 /= rest23_g436;
				#if defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 )
				float staticSwitch155 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch155 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch155 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch155 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch155 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch155 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch155 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch155 = voroi23_g436;
				#else
				float staticSwitch155 = voroi18_g436;
				#endif
				float4 temp_cast_14 = (staticSwitch155).xxxx;
				float simplePerlin3D151 = snoise( float3( DeformARef134 ,  0.0 )*DeformAScaleRef135 );
				simplePerlin3D151 = simplePerlin3D151*0.5 + 0.5;
				float4 temp_cast_16 = (simplePerlin3D151).xxxx;
				float4 temp_cast_17 = (RF_Gray67).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch158 = temp_cast_17;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch158 = temp_cast_13;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch158 = temp_cast_14;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch158 = temp_cast_16;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch158 = tex2D( _DeformAMap, DeformARef134 );
				#else
				float4 staticSwitch158 = temp_cast_17;
				#endif
				float4 lerpResult5_g423 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch158 ) ):( staticSwitch158 )) , _DeformAContrast);
				float4 temp_output_169_0 = ( saturate( lerpResult5_g423 ) * _DeformAIntensity );
				float4 temp_cast_19 = (RF_Gray67).xxxx;
				float DeformBScaleRef138 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScaleRef138;
				float DeformBAngleRef131 = _DeformBAngle;
				float mulTime142 = _TimeParameters.x * DeformBAngleRef131;
				float temp_output_4_0_g439 = mulTime142;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmoothRef139 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmoothRef139;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult113 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime89 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime87 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult112 = (float2(( _DeformBOffsetX + mulTime89 ) , ( mulTime87 + _DeformBOffsetY )));
				float2 texCoord122 = IN.ase_texcoord2.xy * appendResult113 + appendResult112;
				float2 appendResult123 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime99 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos130 = cos( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float sin130 = sin( ( radians( mulTime99 ) + radians( _DeformBRotate ) ) );
				float2 rotator130 = mul( texCoord122 - appendResult123 , float2x2( cos130 , -sin130 , sin130 , cos130 )) + appendResult123;
				float2 DeformBRef137 = rotator130;
				float2 temp_output_3_0_g439 = DeformBRef137;
				float2 coords2_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id2_g439 = 0;
				float2 uv2_g439 = 0;
				float voroi2_g439 = voronoi2_g439( coords2_g439, time2_g439, id2_g439, uv2_g439, voronoiSmooth2_g439, voronoiSmoothId2_g439 );
				float time8_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId8_g439 = 0;
				float voronoiSmooth8_g439 = temp_output_28_0_g439;
				float2 coords8_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id8_g439 = 0;
				float2 uv8_g439 = 0;
				float fade8_g439 = 0.5;
				float voroi8_g439 = 0;
				float rest8_g439 = 0;
				for( int it8_g439 = 0; it8_g439 <2; it8_g439++ ){
				voroi8_g439 += fade8_g439 * voronoi8_g439( coords8_g439, time8_g439, id8_g439, uv8_g439, voronoiSmooth8_g439,voronoiSmoothId8_g439 );
				rest8_g439 += fade8_g439;
				coords8_g439 *= 2;
				fade8_g439 *= 0.5;
				}//Voronoi8_g439
				voroi8_g439 /= rest8_g439;
				float time18_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId18_g439 = 0;
				float voronoiSmooth18_g439 = temp_output_28_0_g439;
				float2 coords18_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id18_g439 = 0;
				float2 uv18_g439 = 0;
				float fade18_g439 = 0.5;
				float voroi18_g439 = 0;
				float rest18_g439 = 0;
				for( int it18_g439 = 0; it18_g439 <3; it18_g439++ ){
				voroi18_g439 += fade18_g439 * voronoi18_g439( coords18_g439, time18_g439, id18_g439, uv18_g439, voronoiSmooth18_g439,voronoiSmoothId18_g439 );
				rest18_g439 += fade18_g439;
				coords18_g439 *= 2;
				fade18_g439 *= 0.5;
				}//Voronoi18_g439
				voroi18_g439 /= rest18_g439;
				float time17_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId17_g439 = 0;
				float voronoiSmooth17_g439 = temp_output_28_0_g439;
				float2 coords17_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id17_g439 = 0;
				float2 uv17_g439 = 0;
				float fade17_g439 = 0.5;
				float voroi17_g439 = 0;
				float rest17_g439 = 0;
				for( int it17_g439 = 0; it17_g439 <4; it17_g439++ ){
				voroi17_g439 += fade17_g439 * voronoi17_g439( coords17_g439, time17_g439, id17_g439, uv17_g439, voronoiSmooth17_g439,voronoiSmoothId17_g439 );
				rest17_g439 += fade17_g439;
				coords17_g439 *= 2;
				fade17_g439 *= 0.5;
				}//Voronoi17_g439
				voroi17_g439 /= rest17_g439;
				float time10_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId10_g439 = 0;
				float voronoiSmooth10_g439 = temp_output_28_0_g439;
				float2 coords10_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id10_g439 = 0;
				float2 uv10_g439 = 0;
				float fade10_g439 = 0.5;
				float voroi10_g439 = 0;
				float rest10_g439 = 0;
				for( int it10_g439 = 0; it10_g439 <5; it10_g439++ ){
				voroi10_g439 += fade10_g439 * voronoi10_g439( coords10_g439, time10_g439, id10_g439, uv10_g439, voronoiSmooth10_g439,voronoiSmoothId10_g439 );
				rest10_g439 += fade10_g439;
				coords10_g439 *= 2;
				fade10_g439 *= 0.5;
				}//Voronoi10_g439
				voroi10_g439 /= rest10_g439;
				float time12_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId12_g439 = 0;
				float voronoiSmooth12_g439 = temp_output_28_0_g439;
				float2 coords12_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id12_g439 = 0;
				float2 uv12_g439 = 0;
				float fade12_g439 = 0.5;
				float voroi12_g439 = 0;
				float rest12_g439 = 0;
				for( int it12_g439 = 0; it12_g439 <6; it12_g439++ ){
				voroi12_g439 += fade12_g439 * voronoi12_g439( coords12_g439, time12_g439, id12_g439, uv12_g439, voronoiSmooth12_g439,voronoiSmoothId12_g439 );
				rest12_g439 += fade12_g439;
				coords12_g439 *= 2;
				fade12_g439 *= 0.5;
				}//Voronoi12_g439
				voroi12_g439 /= rest12_g439;
				float time24_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId24_g439 = 0;
				float voronoiSmooth24_g439 = temp_output_28_0_g439;
				float2 coords24_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id24_g439 = 0;
				float2 uv24_g439 = 0;
				float fade24_g439 = 0.5;
				float voroi24_g439 = 0;
				float rest24_g439 = 0;
				for( int it24_g439 = 0; it24_g439 <7; it24_g439++ ){
				voroi24_g439 += fade24_g439 * voronoi24_g439( coords24_g439, time24_g439, id24_g439, uv24_g439, voronoiSmooth24_g439,voronoiSmoothId24_g439 );
				rest24_g439 += fade24_g439;
				coords24_g439 *= 2;
				fade24_g439 *= 0.5;
				}//Voronoi24_g439
				voroi24_g439 /= rest24_g439;
				float time23_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId23_g439 = 0;
				float voronoiSmooth23_g439 = temp_output_28_0_g439;
				float2 coords23_g439 = temp_output_3_0_g439 * temp_output_5_0_g439;
				float2 id23_g439 = 0;
				float2 uv23_g439 = 0;
				float fade23_g439 = 0.5;
				float voroi23_g439 = 0;
				float rest23_g439 = 0;
				for( int it23_g439 = 0; it23_g439 <8; it23_g439++ ){
				voroi23_g439 += fade23_g439 * voronoi23_g439( coords23_g439, time23_g439, id23_g439, uv23_g439, voronoiSmooth23_g439,voronoiSmoothId23_g439 );
				rest23_g439 += fade23_g439;
				coords23_g439 *= 2;
				fade23_g439 *= 0.5;
				}//Voronoi23_g439
				voroi23_g439 /= rest23_g439;
				#if defined( _DEF_VORCELL_B_TYPE_CELL1 )
				float staticSwitch149 = voroi2_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL2 )
				float staticSwitch149 = voroi8_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL3 )
				float staticSwitch149 = voroi18_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL4 )
				float staticSwitch149 = voroi17_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL5 )
				float staticSwitch149 = voroi10_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL6 )
				float staticSwitch149 = voroi12_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL7 )
				float staticSwitch149 = voroi24_g439;
				#elif defined( _DEF_VORCELL_B_TYPE_CELL8 )
				float staticSwitch149 = voroi23_g439;
				#else
				float staticSwitch149 = voroi18_g439;
				#endif
				float4 temp_cast_20 = (staticSwitch149).xxxx;
				float temp_output_5_0_g438 = DeformBScaleRef138;
				float temp_output_4_0_g438 = mulTime142;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef137;
				float2 coords2_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id2_g438 = 0;
				float2 uv2_g438 = 0;
				float voroi2_g438 = voronoi2_g438( coords2_g438, time2_g438, id2_g438, uv2_g438, voronoiSmooth2_g438, voronoiSmoothId2_g438 );
				float time8_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId8_g438 = 0;
				float voronoiSmooth8_g438 = 0.0;
				float2 coords8_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id8_g438 = 0;
				float2 uv8_g438 = 0;
				float fade8_g438 = 0.5;
				float voroi8_g438 = 0;
				float rest8_g438 = 0;
				for( int it8_g438 = 0; it8_g438 <2; it8_g438++ ){
				voroi8_g438 += fade8_g438 * voronoi8_g438( coords8_g438, time8_g438, id8_g438, uv8_g438, voronoiSmooth8_g438,voronoiSmoothId8_g438 );
				rest8_g438 += fade8_g438;
				coords8_g438 *= 2;
				fade8_g438 *= 0.5;
				}//Voronoi8_g438
				voroi8_g438 /= rest8_g438;
				float time18_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId18_g438 = 0;
				float voronoiSmooth18_g438 = 0.0;
				float2 coords18_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id18_g438 = 0;
				float2 uv18_g438 = 0;
				float fade18_g438 = 0.5;
				float voroi18_g438 = 0;
				float rest18_g438 = 0;
				for( int it18_g438 = 0; it18_g438 <3; it18_g438++ ){
				voroi18_g438 += fade18_g438 * voronoi18_g438( coords18_g438, time18_g438, id18_g438, uv18_g438, voronoiSmooth18_g438,voronoiSmoothId18_g438 );
				rest18_g438 += fade18_g438;
				coords18_g438 *= 2;
				fade18_g438 *= 0.5;
				}//Voronoi18_g438
				voroi18_g438 /= rest18_g438;
				float time17_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId17_g438 = 0;
				float voronoiSmooth17_g438 = 0.0;
				float2 coords17_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id17_g438 = 0;
				float2 uv17_g438 = 0;
				float fade17_g438 = 0.5;
				float voroi17_g438 = 0;
				float rest17_g438 = 0;
				for( int it17_g438 = 0; it17_g438 <6; it17_g438++ ){
				voroi17_g438 += fade17_g438 * voronoi17_g438( coords17_g438, time17_g438, id17_g438, uv17_g438, voronoiSmooth17_g438,voronoiSmoothId17_g438 );
				rest17_g438 += fade17_g438;
				coords17_g438 *= 2;
				fade17_g438 *= 0.5;
				}//Voronoi17_g438
				voroi17_g438 /= rest17_g438;
				float time10_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId10_g438 = 0;
				float2 coords10_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id10_g438 = 0;
				float2 uv10_g438 = 0;
				float voroi10_g438 = voronoi10_g438( coords10_g438, time10_g438, id10_g438, uv10_g438, 0, voronoiSmoothId10_g438 );
				float time12_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId12_g438 = 0;
				float2 coords12_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id12_g438 = 0;
				float2 uv12_g438 = 0;
				float fade12_g438 = 0.5;
				float voroi12_g438 = 0;
				float rest12_g438 = 0;
				for( int it12_g438 = 0; it12_g438 <3; it12_g438++ ){
				voroi12_g438 += fade12_g438 * voronoi12_g438( coords12_g438, time12_g438, id12_g438, uv12_g438, 0,voronoiSmoothId12_g438 );
				rest12_g438 += fade12_g438;
				coords12_g438 *= 2;
				fade12_g438 *= 0.5;
				}//Voronoi12_g438
				voroi12_g438 /= rest12_g438;
				float time24_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId24_g438 = 0;
				float2 coords24_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id24_g438 = 0;
				float2 uv24_g438 = 0;
				float fade24_g438 = 0.5;
				float voroi24_g438 = 0;
				float rest24_g438 = 0;
				for( int it24_g438 = 0; it24_g438 <5; it24_g438++ ){
				voroi24_g438 += fade24_g438 * voronoi24_g438( coords24_g438, time24_g438, id24_g438, uv24_g438, 0,voronoiSmoothId24_g438 );
				rest24_g438 += fade24_g438;
				coords24_g438 *= 2;
				fade24_g438 *= 0.5;
				}//Voronoi24_g438
				voroi24_g438 /= rest24_g438;
				float time23_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId23_g438 = 0;
				float2 coords23_g438 = temp_output_3_0_g438 * temp_output_5_0_g438;
				float2 id23_g438 = 0;
				float2 uv23_g438 = 0;
				float fade23_g438 = 0.5;
				float voroi23_g438 = 0;
				float rest23_g438 = 0;
				for( int it23_g438 = 0; it23_g438 <6; it23_g438++ ){
				voroi23_g438 += fade23_g438 * voronoi23_g438( coords23_g438, time23_g438, id23_g438, uv23_g438, 0,voronoiSmoothId23_g438 );
				rest23_g438 += fade23_g438;
				coords23_g438 *= 2;
				fade23_g438 *= 0.5;
				}//Voronoi23_g438
				voroi23_g438 /= rest23_g438;
				#if defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 )
				float staticSwitch148 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 )
				float staticSwitch148 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 )
				float staticSwitch148 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 )
				float staticSwitch148 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 )
				float staticSwitch148 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 )
				float staticSwitch148 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 )
				float staticSwitch148 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8 )
				float staticSwitch148 = voroi23_g438;
				#else
				float staticSwitch148 = voroi18_g438;
				#endif
				float4 temp_cast_21 = (staticSwitch148).xxxx;
				float simplePerlin3D156 = snoise( float3( DeformBRef137 ,  0.0 )*DeformBScaleRef138 );
				simplePerlin3D156 = simplePerlin3D156*0.5 + 0.5;
				float4 temp_cast_23 = (simplePerlin3D156).xxxx;
				float4 temp_cast_24 = (RF_Gray67).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch157 = temp_cast_24;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch157 = temp_cast_20;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch157 = temp_cast_21;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch157 = temp_cast_23;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch157 = tex2D( _DeformBMap, DeformBRef137 );
				#else
				float4 staticSwitch157 = temp_cast_24;
				#endif
				float4 lerpResult5_g422 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch157 ) ):( staticSwitch157 )) , _DeformBContrast);
				float4 temp_output_170_0 = ( saturate( lerpResult5_g422 ) * _DeformBIntensity );
				float dotResult344 = dot( temp_output_169_0 , temp_output_170_0 );
				float4 temp_cast_25 = (dotResult344).xxxx;
				float4 temp_cast_26 = (RF_Gray67).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch178 = temp_cast_26;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch178 = temp_output_169_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch178 = ( temp_output_169_0 * temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch178 = ( temp_output_169_0 + temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch178 = ( temp_output_169_0 - temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch178 = ( temp_output_169_0 / temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_DOT )
				float4 staticSwitch178 = temp_cast_25;
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch178 = fmod( temp_output_169_0 , temp_output_170_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch178 = fmod( temp_output_170_0 , temp_output_169_0 );
				#else
				float4 staticSwitch178 = temp_cast_26;
				#endif
				float3 gammaToLinear179 = Gamma22ToLinear( staticSwitch178.rgb );
				float3 linearToGamma180 = LinearToGamma22( staticSwitch178.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch183 = float4( gammaToLinear179 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch183 = staticSwitch178;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch183 = float4( linearToGamma180 , 0.0 );
				#else
				float4 staticSwitch183 = staticSwitch178;
				#endif
				float4 RF_DeformNoise185 = (staticSwitch183*_DeformFinalContrast + _DeformFinalBias);
				float4 RF_ShoreDeform595 = (RF_DeformNoise185*_ShoreDeformScale + _ShoreDeformOffset);
				float4 lerpResult5_g1 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_ShoreDeform595 , _ShoreDeformStrength);
				float mulTime521 = _TimeParameters.x * ( _ShoreSpeedX * _ShoreOverallSpeed );
				float mulTime522 = _TimeParameters.x * ( _ShoreOverallSpeed * _ShoreSpeedY );
				float2 appendResult549 = (float2(( _ShoreOffsetX + mulTime521 ) , ( mulTime522 + _ShoreOffsetY )));
				float2 texCoord550 = IN.ase_texcoord2.xy * ( RF_FlowMap39 + float3( (( _AffectShoreDef )?( ( (saturate( lerpResult5_g1 )).rg * appendResult514 ) ):( appendResult514 )) ,  0.0 ) ).xy + appendResult549;
				float2 appendResult554 = (float2(_ShoreAnchorX , _ShoreAnchorY));
				float mulTime532 = _TimeParameters.x * _ShoreRotateSpeed;
				float cos556 = cos( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float sin556 = sin( ( radians( _ShoreRotate ) + radians( mulTime532 ) ) );
				float2 rotator556 = mul( texCoord550 - appendResult554 , float2x2( cos556 , -sin556 , sin556 , cos556 )) + appendResult554;
				float4 lerpResult5_g454 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _ShoreTexture, rotator556 ) , _ShoreContrast);
				float4 temp_output_560_0 = saturate( saturate( lerpResult5_g454 ) );
				float4 RF_Shore606 = ( ((( _InvertShoreTexture )?( ( 1.0 - temp_output_560_0 ) ):( temp_output_560_0 ))*_ShoreGradeScale + _ShoreGradeOffset) * _ShoreIntensity );
				float2 appendResult515 = (float2(_FoamTileX , _FoamTileY));
				float4 RF_FoamDeform632 = (RF_DeformNoise185*_FoamDeformScale + _FoamDeformOffset);
				float4 lerpResult5_g2 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , RF_FoamDeform632 , _FoamDeformStrength);
				float mulTime517 = _TimeParameters.x * ( _FoamSpeedX * _FoamOverallSpeed );
				float mulTime518 = _TimeParameters.x * ( _FoamOverallSpeed * _FoamSpeedY );
				float2 appendResult548 = (float2(( _FoamOffsetX + mulTime517 ) , ( mulTime518 + _FoamOffsetY )));
				float2 texCoord551 = IN.ase_texcoord2.xy * (( _AffectFoamDef )?( ( (saturate( lerpResult5_g2 )).rg * appendResult515 ) ):( appendResult515 )) + appendResult548;
				float2 appendResult552 = (float2(_FoamAnchorX , _FoamAnchorY));
				float mulTime527 = _TimeParameters.x * _FoamRotateSpeed;
				float cos557 = cos( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float sin557 = sin( ( radians( _FoamRotate ) + radians( mulTime527 ) ) );
				float2 rotator557 = mul( texCoord551 - appendResult552 , float2x2( cos557 , -sin557 , sin557 , cos557 )) + appendResult552;
				float4 lerpResult5_g455 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , tex2D( _FoamTexture, rotator557 ) , _FoamContrast);
				float4 temp_output_561_0 = saturate( saturate( lerpResult5_g455 ) );
				float4 RF_Foam607 = ( ((( _InvertFoamTexture )?( ( 1.0 - temp_output_561_0 ) ):( temp_output_561_0 ))*_FoamGradeScale + _FoamGradeOffset) * _FoamIntensity );
				float dotResult597 = dot( RF_Shore606 , RF_Foam607 );
				float4 temp_cast_37 = (saturate( dotResult597 )).xxxx;
				#if defined( _FOAMBLENDTYPE_NONE )
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#elif defined( _FOAMBLENDTYPE_ADD )
				float4 staticSwitch582 = saturate( ( RF_Shore606 + RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_MULTIPLY )
				float4 staticSwitch582 = saturate( ( RF_Shore606 * RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_SUBTRACT )
				float4 staticSwitch582 = saturate( ( RF_Shore606 - RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DIVIDE )
				float4 staticSwitch582 = saturate( ( RF_Shore606 / RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_DOT )
				float4 staticSwitch582 = temp_cast_37;
				#elif defined( _FOAMBLENDTYPE_FMOD )
				float4 staticSwitch582 = saturate( fmod( RF_Shore606 , RF_Foam607 ) );
				#elif defined( _FOAMBLENDTYPE_FMODINVERT )
				float4 staticSwitch582 = saturate( fmod( RF_Foam607 , RF_Shore606 ) );
				#else
				float4 staticSwitch582 = saturate( RF_Shore606 );
				#endif
				float4 RF_ShoreTexture584 = (( _ShoreToggle )?( ( staticSwitch582 * float4( RF_FlowMap39 , 0.0 ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = RF_ShoreTexture584.rgb;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
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

			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;


			
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
			#define _SURFACE_TYPE_TRANSPARENT 1
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

			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;


			
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

			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _DEFNOISEGRADETYPE1_LINEAR _DEFNOISEGRADETYPE1_NORMAL _DEFNOISEGRADETYPE1_GAMMA
			#pragma shader_feature_local _NORMMIXTYPE_NONE _NORMMIXTYPE_ONENOISE _NORMMIXTYPE_MULTIPLY _NORMMIXTYPE_ADD _NORMMIXTYPE_SUBTRACT _NORMMIXTYPE_DIVIDE _NORMMIXTYPE_DOT _NORMMIXTYPE_FMOD _NORMMIXTYPE_FMODINVERT


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
			int _FlowMapSettings;
			float _FoamOffsetY;
			float _FoamSpeedY;
			float _FoamOverallSpeed;
			float _FoamSpeedX;
			float _FoamOffsetX;
			float _FoamDeformStrength;
			float _FoamDeformOffset;
			float _FoamDeformScale;
			float _FoamTileY;
			float _FoamTileX;
			float _AffectFoamDef;
			float _InvertFoamTexture;
			float _ShoreIntensity;
			float _ShoreGradeOffset;
			float _ShoreGradeScale;
			float _ShoreContrast;
			float _ShoreRotateSpeed;
			float _DeformBIntensity;
			float _DeformFinalContrast;
			float _DeformFinalBias;
			float _ShoreDeformScale;
			float _ShoreDeformOffset;
			float _ShoreDeformStrength;
			float _FoamAnchorX;
			float _ShoreOffsetX;
			float _ShoreOverallSpeed;
			float _ShoreSpeedY;
			float _ShoreOffsetY;
			float _ShoreAnchorX;
			float _ShoreAnchorY;
			float _ShoreRotate;
			float _ShoreSpeedX;
			float _DeformBContrast;
			float _FoamAnchorY;
			float _FoamRotateSpeed;
			float _FogToggle;
			float _MiddleWaveIntensity;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _DefNoiseContrast;
			float _NoiseB_Intensity;
			float _NoiseB_Contrast;
			float _DefTypeBRot;
			float _DefTypeBRotSpeed;
			float _DefTypeBAnchorY;
			float _DefTypeBAnchorX;
			float _DefVorBOffsetY;
			float _DefVorBSpeedY;
			float _DefNoiseTypeBOverallSpeed;
			float _DefVorBSpeedX;
			float _DefVorBOffsetX;
			float _DefVorBTileY;
			float _FoamContrast;
			float _FoamGradeScale;
			float _FoamGradeOffset;
			float _FoamIntensity;
			float _MiddleWave;
			float _DefNoiseAInvert;
			float _FoamRotate;
			float _DeformToggle;
			float _NoiseA_Intensity;
			float _DefNoiseBInvert;
			float _DefNoiseBScale;
			float _DefVorBAngle;
			float _DefVorBSmooth;
			float _DefVorBTileX;
			float _NoiseA_Contrast;
			float _FogDepthDistance;
			float _DeformBRotate;
			float _DeformBAnchorY;
			float _DepthDistance;
			float _DepthSize;
			float _InvertShoreTexture;
			float _ShoreToggle;
			int _FoamFold;
			int _ShoreFold;
			float _NormWaveIntensity;
			float _NormNoiseGradeOffset;
			float _NormNoiseGradeScale;
			float _NormNoiseContrast;
			int _NoiseFold;
			int _MiddleNAFold;
			int _MiddleNBFold;
			int _DeformBFold;
			int _DeformAFold;
			float _DeformScale;
			float _DefTypeARot;
			int _DeformSettings;
			float _DefVorAAngle;
			float _DefVorASmooth;
			float _DefVorATileX;
			float _DefVorATileY;
			float _DefNoiseAScale;
			float _DepthExponential;
			float _DefVorAOffsetX;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedY;
			float _DefTypeAAnchorX;
			float _DefTypeAAnchorY;
			float _DefVorAOffsetY;
			float _DefTypeARotSpeed;
			float _DefVorASpeedX;
			float _DeformBRotateSpeed;
			float _FlowDepthContrast;
			float _AffectShoreDef;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _DeformBSpeedY;
			float _DeformBOverallSpeed;
			float _DeformBSpeedX;
			float _DeformBOffsetX;
			float _DeformBTileY;
			float _DeformBTileX;
			float _DeformBSmooth;
			float _DeformBAngle;
			float _DeformBScale;
			float _DeformBInvert;
			float _DeformAIntensity;
			float _DeformAContrast;
			float _DeformARotate;
			float _DeformARotateSpeed;
			float _DeformAAnchorY;
			float _ShoreTileX;
			float _ShoreTileY;
			float _DeformAInvert;
			float _DeformAScale;
			float _DeformAAngle;
			float _DeformASmooth;
			float _FlowMapExp;
			float _DeformATileX;
			float _DeformAOffsetX;
			float _DeformASpeedX;
			float _DeformAOverallSpeed;
			float _DeformASpeedY;
			float _DeformAOffsetY;
			float _DeformAAnchorX;
			float _DeformATileY;
			float _FogDepthExponential;
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

			sampler2D _NoiseAMap;


			
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
Version=19501
Node;AmplifyShaderEditor.CommentaryNode;611;-15760,-4256;Inherit;False;3293.395;841.5051;Shore Settings;46;614;606;613;563;556;585;559;587;560;568;567;569;571;506;505;514;525;612;529;504;502;503;524;523;549;537;536;522;521;512;511;542;516;533;545;544;555;554;550;547;546;532;620;622;627;589;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;610;-15760,-3392;Inherit;False;3288.974;793.6399;Foam Settings;44;607;616;615;526;515;508;507;530;543;528;527;513;541;540;553;552;539;538;551;557;586;558;588;562;561;566;565;564;570;548;535;534;520;519;518;517;510;509;501;500;499;617;623;634;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;497;-11440,-3744;Inherit;False;1554.228;809.8666;Shore Texture Settings;23;609;608;584;582;581;600;583;601;604;605;575;602;576;603;577;574;580;573;579;597;598;578;572;;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;441;-8416,1328;Inherit;False;1570.667;332.6667;WaveB;10;435;342;284;267;285;327;234;236;233;388;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;440;-8416,960;Inherit;False;1565.333;338;WaveA;10;412;340;341;283;326;281;238;387;282;237;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;383;-11840,960;Inherit;False;1734.219;817.2777;UV_A;29;318;317;316;223;224;321;226;225;315;312;311;222;252;257;378;259;320;319;253;227;228;221;256;323;322;255;230;229;370;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;377;-11840,2144;Inherit;False;1732;818.6667;UV_B;29;202;203;205;206;207;208;209;210;211;212;213;214;219;220;294;295;296;297;298;299;300;301;302;303;204;293;216;371;372;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;368;-11840,1824;Inherit;False;1072.118;279.2213;Deform for Wave;6;369;328;263;324;232;231;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;199;-8416,1696;Inherit;False;2655.141;919.8263;Wave Settings;26;277;240;439;438;343;336;335;269;249;270;272;271;262;250;248;247;246;273;268;276;261;260;244;243;242;241;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;362;608,-1440;Inherit;False;388;233.6667;ZERO;10;197;196;3;4;5;6;7;8;9;10;ZERO;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-4128,-2448;Inherit;False;2403.927;807.3774;Flow Map Settings;31;57;17;16;1;43;39;41;38;40;32;60;59;61;63;64;34;35;37;31;29;28;47;20;21;22;18;26;25;27;24;23;;1,0.5251572,0.5251572,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;65;-1600,-2448;Inherit;False;517.7007;1101.188;Local Vars;15;72;71;70;69;68;67;66;193;330;331;332;333;345;624;625;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;-13776,-2224;Inherit;False;5286.223;2213.814;Deform Settings;120;185;163;178;344;173;172;177;176;175;174;171;191;192;190;140;143;145;146;144;141;142;139;131;138;137;136;128;135;134;147;156;150;161;157;148;149;154;155;183;162;158;189;188;187;186;184;182;181;180;179;170;169;168;167;166;165;164;160;159;153;152;151;133;132;130;129;127;126;125;124;123;122;121;120;119;118;117;116;115;114;113;112;111;110;109;108;107;106;105;104;103;102;101;100;99;98;97;96;95;94;93;92;91;90;89;88;87;86;85;84;83;82;81;80;79;78;77;76;75;74;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-10085.84,2144;Inherit;False;1633.155;1064.793;Wave Type B;17;386;373;289;290;217;374;291;265;264;375;286;218;287;376;305;304;288;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;201;-10080,960;Inherit;False;1628.805;1057.825;Wave Type A;17;384;313;380;310;309;379;258;266;308;382;381;251;280;306;279;278;307;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;346;-3584,-1600;Inherit;False;1864.737;296.2673;Fog Settings;11;352;360;359;358;357;356;355;354;353;351;350;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;363;-2480,-1264;Inherit;False;756;383.6666;Specular Settings;4;367;366;365;364;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;389;-10368,3248;Inherit;False;1918.316;866.8376;Normal Map Settings;24;411;407;391;392;410;404;396;394;393;408;409;390;405;403;406;397;395;402;401;400;399;398;481;483;;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;442;-8416,2640;Inherit;False;4029.141;940.7365;Wave Settings;37;459;452;470;471;474;473;469;455;475;451;458;457;453;456;454;450;449;447;448;461;468;467;466;465;464;463;446;445;444;443;477;478;480;482;484;485;496;;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;498;-16464,-3712;Inherit;False;681.6455;294.8509;Comment;5;595;596;593;592;594;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;628;-16464,-3392;Inherit;False;681.6455;294.8509;Comment;5;633;632;631;630;629;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;-3536,-2064;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;24;-3376,-2224;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;25;-3216,-2272;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;26;-3216,-2160;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ProjectionParams;18;-3792,-2224;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-3552,-2352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;21;-3936,-2064;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;47;-3712,-1936;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;-1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;28;-2736,-2240;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;29;-3504,-1904;Inherit;True;Property;_FlowMap;FlowMap;5;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;1d41051305d87384b8bdc4eb5a92e448;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;31;-3264,-1904;Inherit;True;Property;_TextureSample0;Texture Sample 0;250;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GammaToLinearNode;35;-2976,-1904;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;34;-2976,-1808;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;63;-2512,-1872;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;61;-2576,-2048;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;60;-2112,-2048;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;32;-2112,-2240;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;40;-2112,-2144;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;57;-3856,-2352;Inherit;False;BUDUDepthFade;-1;;421;47987ecf53b4f2847a33a9193dc9d94e;0;2;18;FLOAT;1;False;19;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-1536,-2240;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-1536,-2320;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;71;-1536,-2400;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;72;-1568,-2144;Inherit;False;Property;_FlowMapSettings;FlowMapSettings;15;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-2800,-2016;Inherit;False;Property;_FlowDepthContrast;FlowDepthContrast;9;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-2784,-1744;Inherit;False;Property;_FlowMapExp;FlowMapExp;14;0;Create;True;0;0;0;False;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-13680,-1904;Inherit;False;Property;_DeformASpeedX;Deform A Speed X;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;75;-13680,-1744;Inherit;False;Property;_DeformASpeedY;Deform A Speed Y;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-13712,-1824;Inherit;False;Property;_DeformAOverallSpeed;Deform A Overall Speed;35;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-13680,-672;Inherit;False;Property;_DeformBSpeedY;Deform B Speed Y;41;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-13680,-832;Inherit;False;Property;_DeformBSpeedX;Deform B Speed X;40;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-13712,-752;Inherit;False;Property;_DeformBOverallSpeed;Deform B Overall Speed;39;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-13456,-1904;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-13456,-1776;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;-13456,-832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-13456,-704;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;-13296,-1552;Inherit;False;Property;_DeformARotateSpeed;Deform A Rotate Speed;72;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-13296,-1952;Inherit;False;Property;_DeformAOffsetX;Deform A Offset X;68;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-13296,-1712;Inherit;False;Property;_DeformAOffsetY;Deform A Offset Y;70;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;87;-13264,-720;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-13296,-640;Inherit;False;Property;_DeformBOffsetY;Deform B Offset Y;69;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;89;-13264,-800;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-13296,-880;Inherit;False;Property;_DeformBOffsetX;Deform B Offset X;67;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-13296,-480;Inherit;False;Property;_DeformBRotateSpeed;Deform B Rotate Speed;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;92;-13264,-1872;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;93;-13264,-1792;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;94;-13072,-1792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-13072,-1904;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;96;-13040,-1552;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;97;-13072,-720;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;98;-13072,-832;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;99;-13040,-480;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-13136,-1040;Inherit;False;Property;_DeformBTileX;Deform B Tile X;30;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-13136,-960;Inherit;False;Property;_DeformBTileY;Deform B Tile Y;31;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-13136,-2112;Inherit;False;Property;_DeformATileX;Deform A Tile X;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-13136,-2032;Inherit;False;Property;_DeformATileY;Deform A Tile Y;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-13072,-400;Inherit;False;Property;_DeformBRotate;Deform B Rotate;73;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-13072,-1472;Inherit;False;Property;_DeformARotate;Deform A Rotate;74;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;106;-12944,-1856;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;107;-12944,-2096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;108;-12848,-1552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;109;-12848,-1472;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-12944,-1712;Inherit;False;Property;_DeformAAnchorX;Deform A AnchorX;52;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-12944,-1632;Inherit;False;Property;_DeformAAnchorY;Deform A AnchorY;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;112;-12944,-784;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;113;-12944,-1024;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;114;-12848,-480;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;115;-12848,-400;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-12944,-640;Inherit;False;Property;_DeformBAnchorX;Deform B AnchorX;51;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-12944,-560;Inherit;False;Property;_DeformBAnchorY;Deform B AnchorY;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;118;-12784,-1904;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;119;-12720,-1696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;120;-12688,-1552;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-12544,-1520;Inherit;False;Property;_DeformAAngle;Deform A Angle;21;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;122;-12784,-832;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;123;-12720,-624;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;124;-12688,-480;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-12544,-448;Inherit;False;Property;_DeformBAngle;Deform B Angle;19;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;126;-12544,-1728;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-12544,-1600;Inherit;False;Property;_DeformAScale;Deform A Scale;26;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-12592,-1440;Inherit;False;Property;_DeformASmooth;Deform A Smooth;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;130;-12544,-656;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-12576,-368;Inherit;False;Property;_DeformBSmooth;Deform B Smooth;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-12544,-528;Inherit;False;Property;_DeformBScale;DeformBScale;77;0;Create;True;0;0;0;False;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;151;-11648,-1552;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;152;-11696,-1328;Inherit;True;Property;_DeformAMap;Deform A Map;50;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;159;-10784,-1776;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;160;-10784,-704;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-10624,-656;Inherit;False;Property;_DeformBContrast;Deform B Contrast;76;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-10464,-1648;Inherit;False;Property;_DeformAIntensity;Deform A Intensity;62;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;-10448,-576;Inherit;False;Property;_DeformBIntensity;Deform B Intensity;61;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;167;-10384,-768;Inherit;False;BUDUContrast;-1;;422;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;168;-10384,-1840;Inherit;False;BUDUContrast;-1;;423;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;169;-10176,-1840;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;170;-10176,-768;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;179;-9488,-1424;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;180;-9488,-1312;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;181;-9264,-1184;Inherit;False;Property;_DeformFinalContrast;DeformFinalContrast;46;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;-9264,-1104;Inherit;False;Property;_DeformFinalBias;DeformFinalBias;47;0;Create;True;0;0;0;False;0;False;-1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;184;-8976,-1408;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;186;-11632,-1824;Inherit;False;BUDUVoronoi;-1;;436;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;187;-11632,-2080;Inherit;False;BUDUVoronoiCell;-1;;437;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;188;-11616,-736;Inherit;False;BUDUVoronoi;-1;;438;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;189;-11616,-1008;Inherit;False;BUDUVoronoiCell;-1;;439;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.IntNode;193;-1552,-2064;Inherit;False;Property;_DeformSettings;DeformSettings;48;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.StaticSwitch;158;-11088,-1840;Inherit;False;Property;_DeformANoiseType;DeformANoiseType;44;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;162;-10624,-1840;Inherit;False;Property;_DeformAInvert;DeformAInvert;60;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;27;-2992,-2240;Inherit;False;Property;_DepthGradeType;DepthGradeType;0;0;Create;True;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;37;-2752,-1872;Inherit;False;Property;_FlowMapGrade;FlowMapGrade;8;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;43;-2352,-2048;Inherit;False;Property;_FlowType;FlowType;12;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;2;DepthMap;TextureMap;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;183;-9264,-1408;Inherit;True;Property;_DeformGradeType;DeformGradeType;45;0;Create;True;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;155;-11408,-1824;Inherit;False;Property;_Def_VorCaustic_A_Type;Def_VorCaustic_A_Type;63;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;154;-11376,-2080;Inherit;False;Property;_Def_VorCell_A_Type;Def_VorCell_A_Type;65;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;149;-11360,-1008;Inherit;False;Property;_Def_VorCell_B_Type;Def_VorCell_B_Type;66;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;148;-11392,-752;Inherit;False;Property;_Def_VorCaustic_B_Type;Def_VorCaustic_B_Type;64;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;157;-11072,-768;Inherit;False;Property;_DeformBNoiseType;DeformBNoiseType;43;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;161;-10624,-768;Inherit;False;Property;_DeformBInvert;DeformBInvert;59;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;150;-11280,-2160;Inherit;False;67;RF_Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;156;-11632,-480;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;147;-11264,-1088;Inherit;False;67;RF_Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;134;-12352,-1728;Inherit;False;DeformARef;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;135;-12352,-1600;Inherit;False;DeformAScaleRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;128;-12352,-1520;Inherit;False;DeformAAngleRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;136;-12352,-1440;Inherit;False;DeformASmoothRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;-12352,-656;Inherit;False;DeformBRef;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;138;-12352,-528;Inherit;False;DeformBScaleRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;131;-12352,-448;Inherit;False;DeformBAngleRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;139;-12352,-368;Inherit;False;DeformBSmoothRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;142;-11872,-656;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;141;-12096,-656;Inherit;False;131;DeformBAngleRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;144;-12096,-576;Inherit;False;138;DeformBScaleRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;146;-12064,-368;Inherit;False;137;DeformBRef;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;145;-12128,-496;Inherit;False;139;DeformBSmoothRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;143;-11872,-1728;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;-12096,-1728;Inherit;False;128;DeformAAngleRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;190;-12096,-1648;Inherit;False;135;DeformAScaleRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;192;-12064,-1440;Inherit;False;134;DeformARef;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;191;-12128,-1568;Inherit;False;136;DeformASmoothRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;330;-1312,-2144;Inherit;False;Property;_DeformAFold;DeformAFold;133;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;331;-1312,-2064;Inherit;False;Property;_DeformBFold;DeformBFold;134;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;333;-1312,-1904;Inherit;False;Property;_MiddleNBFold;MiddleNBFold;136;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;332;-1312,-1984;Inherit;False;Property;_MiddleNAFold;MiddleNAFold;135;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;171;-9936,-1344;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;174;-9904,-1440;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;175;-9936,-1536;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;176;-9936,-1248;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;-9968,-1616;Inherit;False;67;RF_Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FmodOpNode;172;-9904,-1024;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;173;-9904,-928;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;344;-9904,-1136;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;178;-9744,-1392;Inherit;False;Property;_DeformMixType;DeformMixType;17;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;9;None;OneNoise;Multiply;Add;Subtract;Divide;Dot;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;163;-10624,-1728;Inherit;False;Property;_DeformAContrast;Deform A Contrast;75;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;345;-1296,-1824;Inherit;False;Property;_NoiseFold;NoiseFold;138;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;350;-3568,-1440;Inherit;False;Property;_FogDepthExponential;Fog Depth Exponential;140;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-3536,-1520;Inherit;False;Property;_FogDepthDistance;Fog Depth Distance;139;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;353;-3008,-1392;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;354;-3008,-1504;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;355;-2784,-1472;Inherit;False;Property;_FogDepthGradeType;FogDepthGradeType;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;356;-2512,-1472;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;357;-2352,-1472;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;358;-2384,-1552;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;359;-2192,-1504;Inherit;False;Property;_FogToggle;FogToggle;141;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;360;-1952,-1472;Inherit;False;RF_FogDepth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;185;-8752,-1408;Inherit;False;RF_DeformNoise;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;41;-1952,-2144;Inherit;False;RF_SaturateDepth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;38;-1952,-2240;Inherit;False;RF_Depth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;-1328,-2400;Inherit;False;RF_One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;69;-1328,-2320;Inherit;False;RF_Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-1328,-2240;Inherit;False;RF_Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;352;-3296,-1472;Inherit;False;BUDUDepthFade;-1;;450;47987ecf53b4f2847a33a9193dc9d94e;0;2;18;FLOAT;1;False;19;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;366;-2432,-1120;Inherit;True;Property;_Specular;Specular;142;0;Create;True;0;0;0;False;0;False;0.5;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;365;-2128,-1200;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;336,-1392;Inherit;False;39;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;304,-1312;Inherit;False;185;RF_DeformNoise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;329;304,-1232;Inherit;False;269;RF_MiddleWave;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;848,-1376;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;656,-1392;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;361;304,-1152;Inherit;False;360;RF_FogDepth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;364;-1968,-1200;Inherit;False;RF_Specular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;231;-11504,1968;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;-0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;232;-11472,1888;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;324;-11792,2000;Inherit;False;Property;_DeformScale;DeformScale;94;0;Create;False;0;0;0;True;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;328;-11280,1920;Inherit;False;Property;_DeformToggle;DeformToggle;95;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;369;-11040,1920;Inherit;False;RF_DeformWave;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;202;-10880,2352;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;203;-10832,2672;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;205;-10960,2880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;206;-10960,2800;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;207;-10800,2800;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;208;-11152,2800;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;209;-11040,2480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-11504,2464;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;-11504,2576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;212;-11360,2480;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;213;-11360,2576;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;219;-11168,2464;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;220;-11168,2560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;-11456,2384;Inherit;False;Property;_DefVorBOffsetX;DefVorBOffsetX;128;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;296;-11776,2448;Inherit;False;Property;_DefVorBSpeedX;DefVorBSpeedX;116;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;297;-11776,2528;Inherit;False;Property;_DefNoiseTypeBOverallSpeed;DefNoiseTypeBOverallSpeed;110;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;298;-11776,2608;Inherit;False;Property;_DefVorBSpeedY;DefVorBSpeedY;117;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-11456,2688;Inherit;False;Property;_DefVorBOffsetY;DefVorBOffsetY;129;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;300;-11056,2640;Inherit;False;Property;_DefTypeBAnchorX;DefTypeBAnchorX;118;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-11056,2720;Inherit;False;Property;_DefTypeBAnchorY;DefTypeBAnchorY;120;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;302;-11360,2800;Inherit;False;Property;_DefTypeBRotSpeed;DefTypeBRotSpeed;103;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;303;-11248,2880;Inherit;False;Property;_DefTypeBRot;DefTypeBRot;125;0;Create;True;0;0;0;True;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;204;-10656,2640;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;216;-10464,2640;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;371;-10688,2544;Inherit;False;369;RF_DeformWave;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;372;-10336,2640;Inherit;False;RF_UV_B;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;370;-10688,1312;Inherit;False;369;RF_DeformWave;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;307;-9248,1584;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;278;-9328,1344;Inherit;False;Property;_Def_VorCaustic_A_Type;Def_VorCaustic_A_Type;98;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;279;-9296,1088;Inherit;False;Property;_Def_VorCell_A_Type;Def_VorCell_A_Type;100;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;280;-8944,1344;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;78;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;251;-9200,1008;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;381;-9440,1584;Inherit;False;378;RF_UV_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;382;-9504,1824;Inherit;False;378;RF_UV_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;229;-11152,1600;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;230;-10960,1680;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;255;-10960,1600;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;322;-11360,1600;Inherit;False;Property;_DefTypeARotSpeed;DefTypeARotSpeed;104;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;323;-11248,1680;Inherit;False;Property;_DefTypeARot;DefTypeARot;126;0;Create;True;0;0;0;True;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;256;-10784,1600;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;221;-11040,1280;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;228;-11168,1264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;227;-11168,1360;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;253;-10832,1456;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;319;-11056,1424;Inherit;False;Property;_DefTypeAAnchorX;DefTypeAAnchorX;105;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;320;-11056,1504;Inherit;False;Property;_DefTypeAAnchorY;DefTypeAAnchorY;106;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;259;-10656,1424;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;378;-10336,1408;Inherit;False;RF_UV_A;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;257;-10464,1408;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;252;-10880,1136;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;214;-11040,2256;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-11248,2304;Inherit;False;Property;_DefVorBTileY;DefVorBTileY;115;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-11248,2224;Inherit;False;Property;_DefVorBTileX;DefVorBTileX;114;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;222;-11040,1056;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-11248,1024;Inherit;False;Property;_DefVorATileX;DefVorATileX;99;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;312;-11248,1104;Inherit;False;Property;_DefVorATileY;DefVorATileY;100;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;315;-11456,1184;Inherit;False;Property;_DefVorAOffsetX;DefVorAOffsetX;127;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;225;-11360,1264;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;226;-11360,1424;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-11456,1520;Inherit;False;Property;_DefVorAOffsetY;DefVorAOffsetY;130;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;224;-11504,1424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;223;-11504,1264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;316;-11776,1264;Inherit;False;Property;_DefVorASpeedX;DefVorASpeedX;101;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;317;-11776,1344;Inherit;False;Property;_DefNoiseTypeAOverallSpeed;DefNoiseTypeAOverallSpeed;96;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;318;-11776,1424;Inherit;False;Property;_DefVorASpeedY;DefVorASpeedY;102;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;308;-9536,1344;Inherit;False;BUDUVoronoi;-1;;446;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;266;-9536,1088;Inherit;False;BUDUVoronoiCell;-1;;442;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.SimpleTimeNode;258;-9744,1216;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;379;-9744,1136;Inherit;False;378;RF_UV_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-10032,1216;Inherit;False;Property;_DefVorAAngle;DefVorAAngle;98;0;Create;True;0;0;0;True;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;-10032,1296;Inherit;False;Property;_DefVorASmooth;DefVorASmooth;123;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;380;-9824,1392;Inherit;False;378;RF_UV_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-9856,1472;Inherit;False;Property;_DefNoiseAScale;DefNoiseAScale;97;0;Create;True;0;0;0;True;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;288;-9328,2528;Inherit;False;Property;_Def_VorCaustic_B_Type;Def_VorCaustic_B_Type;99;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;304;-9248,2784;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;376;-9488,3024;Inherit;False;372;RF_UV_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;287;-9296,2272;Inherit;False;Property;_Def_VorCell_B_Type;Def_VorCell_B_Type;101;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;218;-9200,2192;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;286;-8944,2480;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;79;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;375;-9456,2784;Inherit;False;372;RF_UV_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;264;-9536,2528;Inherit;False;BUDUVoronoi;-1;;440;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;265;-9536,2272;Inherit;False;BUDUVoronoiCell;-1;;441;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.RangedFloatNode;291;-9856,2656;Inherit;False;Property;_DefNoiseBScale;DefNoiseBScale;112;0;Create;True;0;0;0;True;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;374;-9824,2576;Inherit;False;372;RF_UV_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;217;-9744,2384;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-10032,2464;Inherit;False;Property;_DefVorBSmooth;DefVorBSmooth;124;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;289;-10032,2384;Inherit;False;Property;_DefVorBAngle;DefVorBAngle;113;0;Create;True;0;0;0;True;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;373;-9744,2304;Inherit;False;372;RF_UV_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;384;-8688,1344;Inherit;False;RF_Noise_A;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;386;-8688,2480;Inherit;False;RF_Noise_B;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;398;-9664,3456;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;399;-9568,3552;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;400;-9600,3648;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;401;-9600,3744;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;402;-9600,3840;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;395;-9824,3760;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;397;-9440,3552;Inherit;False;Property;_NormalMix;NormalMix;147;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;6;First;Blend;Add;Subtract;Multiply;Divide;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;403;-9216,3552;Inherit;False;Object;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;405;-10128,3712;Inherit;True;Property;_NormalBMap;NormalBMap;144;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;302951faffe230848aa0d3df7bb70faa;302951faffe230848aa0d3df7bb70faa;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;390;-10336,3744;Inherit;False;372;RF_UV_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;409;-8960,3552;Inherit;False;Normal Reconstruct Z;-1;;422;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;408;-10080,3920;Inherit;False;Normal Reconstruct Z;-1;;421;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;393;-9952,4016;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;394;-10240,4016;Inherit;False;Property;_NrmBInt;NrmBInt;146;0;Create;True;0;0;0;False;0;False;0.3;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;396;-9824,3456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;410;-10336,3328;Inherit;False;384;RF_Noise_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;392;-9968,3600;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;391;-10256,3600;Inherit;False;Property;_NrmAInt;NrmAInt;145;0;Create;True;0;0;0;False;0;False;0.3;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;407;-10096,3504;Inherit;False;Normal Reconstruct Z;-1;;420;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;411;-8704,3552;Inherit;False;RF_NormalMapWave;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;404;-10128,3296;Inherit;True;Property;_NormalAMap;NormalAMap;143;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;9a4a55d8d2e54394d97426434477cdcf;9a4a55d8d2e54394d97426434477cdcf;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;237;-8192,1008;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;282;-8032,1008;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;387;-8384,1008;Inherit;False;384;RF_Noise_A;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;238;-7808,1072;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;281;-7648,1120;Inherit;False;Property;_NoiseA_Contrast;NoiseA_Contrast;131;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;326;-7648,1008;Inherit;False;Property;_DefNoiseAInvert;DefNoiseAInvert;93;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;283;-7424,1008;Inherit;False;BUDUContrast;-1;;447;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;341;-7520,1216;Inherit;False;Property;_NoiseA_Intensity;NoiseA_Intensity;137;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;340;-7232,1008;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;412;-7072,1008;Inherit;False;RF_WaveA;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;388;-8384,1376;Inherit;False;386;RF_Noise_B;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;233;-8192,1376;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;236;-8032,1376;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;234;-7808,1440;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;327;-7648,1376;Inherit;False;Property;_DefNoiseBInvert;DefNoiseBInvert;108;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;285;-7648,1504;Inherit;False;Property;_NoiseB_Contrast;NoiseB_Contrast;132;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;267;-7424,1376;Inherit;False;BUDUContrast;-1;;448;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;284;-7520,1584;Inherit;False;Property;_NoiseB_Intensity;NoiseB_Intensity;109;0;Create;True;0;0;0;True;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;342;-7232,1376;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;435;-7072,1376;Inherit;False;RF_WaveB;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;241;-8032,1952;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;242;-8064,2064;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;243;-8064,2176;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;244;-8032,2288;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;261;-7632,2128;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FmodOpNode;335;-8032,2400;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;336;-8032,2512;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;343;-8096,1744;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;438;-8400,1984;Inherit;False;412;RF_WaveA;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;439;-8400,2288;Inherit;False;435;RF_WaveB;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;240;-8064,1840;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;443;-8032,2896;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;444;-8064,3008;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;445;-8064,3120;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;446;-8032,3232;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FmodOpNode;463;-8032,3344;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;464;-8032,3456;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;465;-8096,2688;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;466;-8400,2928;Inherit;False;412;RF_WaveA;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;467;-8400,3232;Inherit;False;435;RF_WaveB;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;468;-8064,2784;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;461;-7888,2992;Inherit;False;Property;_NormMixType;NormMixType;81;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;9;None;OneNoise;Multiply;Add;Subtract;Divide;Dot;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;448;-7632,3072;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;447;-7632,2960;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;449;-7408,2992;Inherit;False;Property;_DefNoiseGradeType1;DefNoiseGradeType;82;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;450;-7120,2992;Inherit;False;BUDUContrast;-1;;449;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;454;-6752,2992;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;456;-6928,2992;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;453;-6528,2992;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;269;-5984,2032;Inherit;False;RF_MiddleWave;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;250;-6208,2032;Inherit;False;Property;_MiddleWave;MiddleWave;90;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;246;-6368,2032;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;249;-6400,1952;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;247;-6528,2032;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;270;-6656,2176;Inherit;False;Property;_MiddleWaveIntensity;Middle Wave Intensity;121;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;248;-6752,2032;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;262;-6928,2032;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-6976,2272;Inherit;False;Property;_DefNoiseGradeScale;DefNoiseGradeScale;86;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;272;-7008,2368;Inherit;False;Property;_DefNoiseGradeOffset;DefNoiseGradeOffset;89;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;268;-7120,2032;Inherit;False;BUDUContrast;-1;;449;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;276;-7408,2032;Inherit;False;Property;_DefNoiseGradeType;DefNoiseGradeType;83;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;273;-7344,2176;Inherit;False;Property;_DefNoiseContrast;DefNoiseContrast;84;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;260;-7632,2016;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;277;-7888,2032;Inherit;False;Property;_NoiseMixType;NoiseMixType;80;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;9;None;OneNoise;Multiply;Add;Subtract;Divide;Dot;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;457;-7008,3232;Inherit;False;Property;_NormNoiseGradeScale;NormNoiseGradeScale;87;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;458;-7008,3328;Inherit;False;Property;_NormNoiseGradeOffset;NormNoiseGradeOffset;88;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;451;-7344,3136;Inherit;False;Property;_NormNoiseContrast;NormNoiseContrast;85;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;475;-5888,2832;Inherit;False;182.0669;140.7334;Lerp için;;1,1,1,1;mid wave$shore$flow;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;455;-4816,2992;Inherit;False;Property;_NormalTxt;NormalTxt;91;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;469;-4592,2992;Inherit;False;RF_NormWave;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;473;-5312,2864;Inherit;True;Normal From Height;-1;;450;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;10;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;474;-5312,3120;Inherit;True;Normal From Height;-1;;451;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;10;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;471;-5024,3200;Inherit;False;0;3;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;470;-5280,3376;Inherit;False;411;RF_NormalMapWave;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;478;-5872,3344;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-50;False;4;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;406;-9376,3440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;477;-6416,3344;Inherit;False;Property;_NormalStrength;NormalStrength;148;0;Create;True;0;0;0;False;0;False;1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;480;-6112,3344;Inherit;False;RF_NormStrength;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;483;-9648,3376;Inherit;False;482;RF_MiddleWaveStrength;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;481;-9584,3296;Inherit;False;480;RF_NormStrength;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;482;-6432,3104;Inherit;False;RF_MiddleWaveStrength;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;459;-6720,3184;Inherit;False;Property;_NormWaveIntensity;NormWaveIntensity;122;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;452;-6144,2992;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;485;-6160,3200;Inherit;False;39;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;484;-5888,2992;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;496;-4592,2752;Inherit;False;RF_WaveBG;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;263;-11728,1920;Inherit;False;185;RF_DeformNoise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;153;-11680,-256;Inherit;True;Property;_DeformBMap;Deform B Map;49;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;306;-9296,1808;Inherit;True;Property;_NoiseAMap;NoiseAMap;92;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;305;-9296,3008;Inherit;True;Property;_NoiseBMap;NoiseBMap;107;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;599;1051.554,-1662.92;Inherit;False;584;RF_ShoreTexture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;367;-2336,-1200;Inherit;False;70;RF_One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;572;-11072,-3328;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;578;-10912,-3328;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;598;-10912,-3232;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;597;-11040,-3232;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;579;-10912,-3136;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;573;-11040,-3136;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;580;-10912,-3040;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;574;-11040,-3040;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;577;-11072,-3424;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;603;-10912,-3424;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;576;-11040,-3520;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;602;-10912,-3520;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;575;-11072,-3616;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;605;-10912,-3616;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;604;-10912,-3696;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;601;-10672,-3200;Inherit;False;39;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;583;-10320,-3456;Inherit;False;Property;_ShoreToggle;ShoreToggle;149;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;600;-10480,-3456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;582;-10736,-3456;Inherit;False;Property;_FoamBlendType;FoamBlendType;150;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;None;Add;Multiply;Subtract;Divide;Dot;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;584;-10096,-3456;Inherit;False;RF_ShoreTexture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;608;-11408,-3616;Inherit;False;606;RF_Shore;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;609;-11408,-3232;Inherit;False;607;RF_Foam;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;532;-14832,-3504;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;546;-14640,-3584;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;547;-14640,-3504;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;550;-14544,-3872;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;554;-14480,-3712;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;555;-14448,-3568;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;544;-14672,-3744;Inherit;False;Property;_ShoreAnchorX;ShoreAnchorX;158;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;545;-14672,-3664;Inherit;False;Property;_ShoreAnchorY;ShoreAnchorY;159;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;533;-14928,-3584;Inherit;False;Property;_ShoreRotate;ShoreRotate;163;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;516;-15040,-3504;Inherit;False;Property;_ShoreRotateSpeed;ShoreRotateSpeed;164;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;511;-15488,-3840;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;512;-15488,-3744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;521;-15344,-3824;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;522;-15344,-3744;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;536;-15168,-3856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;537;-15168,-3744;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;549;-15056,-3808;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;523;-15440,-3936;Inherit;False;Property;_ShoreOffsetX;ShoreOffsetX;157;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;524;-15440,-3616;Inherit;False;Property;_ShoreOffsetY;ShoreOffsetY;156;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;503;-15680,-3856;Inherit;False;Property;_ShoreSpeedX;ShoreSpeedX;13;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;502;-15712,-3776;Inherit;False;Property;_ShoreOverallSpeed;ShoreOverallSpeed;151;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-15680,-3696;Inherit;False;Property;_ShoreSpeedY;ShoreSpeedY;16;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;499;-15712,-2928;Inherit;False;Property;_FoamOverallSpeed;FoamOverallSpeed;152;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;500;-15680,-2832;Inherit;False;Property;_FoamSpeedY;FoamSpeedY;38;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;501;-15680,-3008;Inherit;False;Property;_FoamSpeedX;FoamSpeedX;36;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;509;-15488,-2896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;510;-15488,-2992;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;517;-15328,-2976;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;518;-15328,-2896;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;519;-15424,-3072;Inherit;False;Property;_FoamOffsetX;FoamOffsetX;155;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;520;-15424,-2784;Inherit;False;Property;_FoamOffsetY;FoamOffsetY;154;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;534;-15136,-3008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;535;-15136,-2896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;548;-15024,-2960;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;570;-13072,-2992;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;564;-13328,-2992;Inherit;True;Property;_InvertFoamTexture;Invert Foam Texture;25;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;565;-13296,-2768;Inherit;False;Property;_FoamGradeScale;Foam Grade Scale;33;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;566;-13296,-2688;Inherit;False;Property;_FoamGradeOffset;Foam Grade Offset;34;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;561;-13648,-2992;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;562;-13488,-2928;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;588;-13840,-2992;Inherit;False;BUDUContrast;-1;;455;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;558;-14128,-2992;Inherit;True;Property;_FoamTexture;Foam Texture;23;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;136144d880a69254ea8b2d639e2fe9c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RotatorNode;557;-14320,-2992;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;551;-14544,-3120;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;538;-14688,-2928;Inherit;False;Property;_FoamAnchorX;FoamAnchorX;160;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;539;-14688,-2848;Inherit;False;Property;_FoamAnchorY;FoamAnchorY;161;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;552;-14496,-2896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;553;-14464,-2752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;540;-14656,-2768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;541;-14656,-2688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;513;-15056,-2688;Inherit;False;Property;_FoamRotateSpeed;FoamRotateSpeed;162;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;527;-14848,-2688;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;528;-14944,-2768;Inherit;False;Property;_FoamRotate;FoamRotate;165;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;530;-14944,-3312;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;515;-15104,-3184;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;581;-10512,-3536;Inherit;False;69;RF_Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;615;-13136,-3072;Inherit;False;Property;_FoamIntensity;FoamIntensity;170;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;616;-12848,-2992;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;607;-12688,-2992;Inherit;False;RF_Foam;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;571;-13072,-3808;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;569;-13328,-3808;Inherit;True;Property;_InvertShoreTexture;Invert Shore Texture;7;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-13296,-3584;Inherit;False;Property;_ShoreGradeScale;Shore Grade Scale;18;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;568;-13296,-3504;Inherit;False;Property;_ShoreGradeOffset;Shore Grade Offset;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;560;-13648,-3808;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;559;-14128,-3808;Inherit;True;Property;_ShoreTexture;Shore Texture;6;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;c662692ad44de0b45ba4f81297e97381;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RotatorNode;556;-14320,-3808;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;563;-13488,-3744;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;613;-12848,-3808;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;606;-12688,-3808;Inherit;False;RF_Shore;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;614;-13136,-3888;Inherit;False;Property;_ShoreIntensity;ShoreIntensity;169;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;587;-13840,-3808;Inherit;False;BUDUContrast;-1;;454;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;585;-14032,-3616;Inherit;False;Property;_ShoreContrast;ShoreContrast;166;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;543;-14784,-3248;Inherit;False;Property;_AffectFoamDef;AffectFoamDef;153;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;586;-14032,-2800;Inherit;False;Property;_FoamContrast;FoamContrast;167;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;508;-15264,-3216;Inherit;False;Property;_FoamTileX;FoamTileX;28;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;507;-15264,-3152;Inherit;False;Property;_FoamTileY;FoamTileY;29;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-15408,-4224;Inherit;False;Property;_ShoreTileX;ShoreTileX;10;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;506;-15408,-4160;Inherit;False;Property;_ShoreTileY;ShoreTileY;11;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;514;-15216,-4208;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;529;-15056,-4096;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.IntNode;624;-1280,-1744;Inherit;False;Property;_ShoreFold;ShoreFold;111;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;625;-1296,-1664;Inherit;False;Property;_FoamFold;FoamFold;119;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-1952,-2048;Inherit;False;RF_FlowMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-4096,-2304;Inherit;False;Property;_DepthExponential;Depth Exponential;3;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-4064,-2384;Inherit;False;Property;_DepthDistance;Depth Distance;2;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;542;-14672,-4144;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;612;-14896,-4128;Inherit;False;Property;_AffectShoreDef;AffectShoreDef;168;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;622;-15440,-4080;Inherit;False;BUDUContrast;-1;;1;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;620;-15728,-4016;Inherit;False;Property;_ShoreDeformStrength;ShoreDeformStrength;172;0;Create;True;0;0;0;True;0;False;1;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;589;-14880,-4208;Inherit;False;39;RF_FlowMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;627;-15264,-4080;Inherit;False;FLOAT2;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;594;-16208,-3616;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;592;-16432,-3584;Inherit;False;Property;_ShoreDeformScale;Shore Deform Scale;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;593;-16432,-3504;Inherit;False;Property;_ShoreDeformOffset;Shore Deform Offset;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;595;-16000,-3616;Inherit;False;RF_ShoreDeform;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;632;-16000,-3296;Inherit;False;RF_FoamDeform;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;630;-16432,-3264;Inherit;False;Property;_FoamDeformScale;Foam Deform Scale;53;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;631;-16432,-3184;Inherit;False;Property;_FoamDeformOffset;Foam Deform Offset;58;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;629;-16208,-3296;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-4016,-1888;Inherit;False;Property;_DepthSize;Depth Size;4;0;Create;True;0;0;0;True;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;633;-16432,-3344;Inherit;False;185;RF_DeformNoise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;596;-16432,-3664;Inherit;False;185;RF_DeformNoise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;634;-15104,-3312;Inherit;False;FLOAT2;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;623;-15296,-3312;Inherit;False;BUDUContrast;-1;;2;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;526;-15520,-3344;Inherit;False;632;RF_FoamDeform;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;617;-15584,-3264;Inherit;False;Property;_FoamDeformStrength;FoamDeformStrength;171;0;Create;True;0;0;0;True;0;False;1;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;525;-15664,-4096;Inherit;False;595;RF_ShoreDeform;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;-2288,-2144;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;1440,-1664;Float;False;True;-1;2;BWaterSurfaceEditor;0;19;BUDU Shaders/BWaterSurface;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638566279095381177;Workflow;0;0;Surface;1;638566279159191885;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638566279081046123;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;638566279237665981;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;638566374787420144;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;False;True;True;True;True;False;True;True;False;;False;0
WireConnection;23;0;21;4
WireConnection;23;1;47;0
WireConnection;24;0;23;0
WireConnection;24;1;22;0
WireConnection;25;0;24;0
WireConnection;26;0;24;0
WireConnection;22;0;57;0
WireConnection;22;1;18;1
WireConnection;47;0;20;0
WireConnection;28;0;27;0
WireConnection;31;0;29;0
WireConnection;35;0;31;5
WireConnection;34;0;31;5
WireConnection;63;0;37;0
WireConnection;63;1;64;0
WireConnection;61;0;28;0
WireConnection;61;1;59;0
WireConnection;60;0;43;0
WireConnection;32;0;27;0
WireConnection;40;0;28;0
WireConnection;57;18;17;0
WireConnection;57;19;16;0
WireConnection;80;0;74;0
WireConnection;80;1;76;0
WireConnection;81;0;76;0
WireConnection;81;1;75;0
WireConnection;82;0;78;0
WireConnection;82;1;79;0
WireConnection;83;0;79;0
WireConnection;83;1;77;0
WireConnection;87;0;83;0
WireConnection;89;0;82;0
WireConnection;92;0;80;0
WireConnection;93;0;81;0
WireConnection;94;0;93;0
WireConnection;94;1;86;0
WireConnection;95;0;85;0
WireConnection;95;1;92;0
WireConnection;96;0;84;0
WireConnection;97;0;87;0
WireConnection;97;1;88;0
WireConnection;98;0;90;0
WireConnection;98;1;89;0
WireConnection;99;0;91;0
WireConnection;106;0;95;0
WireConnection;106;1;94;0
WireConnection;107;0;102;0
WireConnection;107;1;103;0
WireConnection;108;0;96;0
WireConnection;109;0;105;0
WireConnection;112;0;98;0
WireConnection;112;1;97;0
WireConnection;113;0;100;0
WireConnection;113;1;101;0
WireConnection;114;0;99;0
WireConnection;115;0;104;0
WireConnection;118;0;107;0
WireConnection;118;1;106;0
WireConnection;119;0;110;0
WireConnection;119;1;111;0
WireConnection;120;0;108;0
WireConnection;120;1;109;0
WireConnection;122;0;113;0
WireConnection;122;1;112;0
WireConnection;123;0;116;0
WireConnection;123;1;117;0
WireConnection;124;0;114;0
WireConnection;124;1;115;0
WireConnection;126;0;118;0
WireConnection;126;1;119;0
WireConnection;126;2;120;0
WireConnection;130;0;122;0
WireConnection;130;1;123;0
WireConnection;130;2;124;0
WireConnection;151;0;192;0
WireConnection;151;1;190;0
WireConnection;152;1;192;0
WireConnection;159;0;158;0
WireConnection;160;0;157;0
WireConnection;167;1;161;0
WireConnection;167;3;164;0
WireConnection;168;1;162;0
WireConnection;168;3;163;0
WireConnection;169;0;168;0
WireConnection;169;1;165;0
WireConnection;170;0;167;0
WireConnection;170;1;166;0
WireConnection;179;0;178;0
WireConnection;180;0;178;0
WireConnection;184;0;183;0
WireConnection;184;1;181;0
WireConnection;184;2;182;0
WireConnection;186;3;192;0
WireConnection;186;4;143;0
WireConnection;186;5;190;0
WireConnection;187;3;192;0
WireConnection;187;4;143;0
WireConnection;187;5;190;0
WireConnection;187;28;191;0
WireConnection;188;3;146;0
WireConnection;188;4;142;0
WireConnection;188;5;144;0
WireConnection;189;3;146;0
WireConnection;189;4;142;0
WireConnection;189;5;144;0
WireConnection;189;28;145;0
WireConnection;158;1;150;0
WireConnection;158;0;154;0
WireConnection;158;2;155;0
WireConnection;158;3;151;0
WireConnection;158;4;152;0
WireConnection;162;0;158;0
WireConnection;162;1;159;0
WireConnection;27;1;25;0
WireConnection;27;0;24;0
WireConnection;27;2;26;0
WireConnection;37;1;35;0
WireConnection;37;0;31;5
WireConnection;37;2;34;0
WireConnection;43;1;61;0
WireConnection;43;0;63;0
WireConnection;183;1;179;0
WireConnection;183;0;178;0
WireConnection;183;2;180;0
WireConnection;155;1;186;0
WireConnection;155;0;186;9
WireConnection;155;2;186;20
WireConnection;155;3;186;21
WireConnection;155;4;186;13
WireConnection;155;5;186;15
WireConnection;155;6;186;26
WireConnection;155;7;186;27
WireConnection;154;1;187;0
WireConnection;154;0;187;9
WireConnection;154;2;187;20
WireConnection;154;3;187;21
WireConnection;154;4;187;13
WireConnection;154;5;187;15
WireConnection;154;6;187;26
WireConnection;154;7;187;27
WireConnection;149;1;189;0
WireConnection;149;0;189;9
WireConnection;149;2;189;20
WireConnection;149;3;189;21
WireConnection;149;4;189;13
WireConnection;149;5;189;15
WireConnection;149;6;189;26
WireConnection;149;7;189;27
WireConnection;148;1;188;0
WireConnection;148;0;188;9
WireConnection;148;2;188;20
WireConnection;148;3;188;21
WireConnection;148;4;188;13
WireConnection;148;5;188;15
WireConnection;148;6;188;26
WireConnection;148;7;188;27
WireConnection;157;1;147;0
WireConnection;157;0;149;0
WireConnection;157;2;148;0
WireConnection;157;3;156;0
WireConnection;157;4;153;0
WireConnection;161;0;157;0
WireConnection;161;1;160;0
WireConnection;156;0;146;0
WireConnection;156;1;144;0
WireConnection;134;0;126;0
WireConnection;135;0;127;0
WireConnection;128;0;121;0
WireConnection;136;0;129;0
WireConnection;137;0;130;0
WireConnection;138;0;133;0
WireConnection;131;0;125;0
WireConnection;139;0;132;0
WireConnection;142;0;141;0
WireConnection;143;0;140;0
WireConnection;171;0;169;0
WireConnection;171;1;170;0
WireConnection;174;0;169;0
WireConnection;174;1;170;0
WireConnection;175;0;169;0
WireConnection;175;1;170;0
WireConnection;176;0;169;0
WireConnection;176;1;170;0
WireConnection;172;0;169;0
WireConnection;172;1;170;0
WireConnection;173;0;170;0
WireConnection;173;1;169;0
WireConnection;344;0;169;0
WireConnection;344;1;170;0
WireConnection;178;1;177;0
WireConnection;178;0;169;0
WireConnection;178;2;175;0
WireConnection;178;3;174;0
WireConnection;178;4;171;0
WireConnection;178;5;176;0
WireConnection;178;6;344;0
WireConnection;178;7;172;0
WireConnection;178;8;173;0
WireConnection;353;0;352;0
WireConnection;354;0;352;0
WireConnection;355;1;354;0
WireConnection;355;0;352;0
WireConnection;355;2;353;0
WireConnection;356;0;355;0
WireConnection;357;0;356;0
WireConnection;359;0;358;0
WireConnection;359;1;357;0
WireConnection;360;0;359;0
WireConnection;185;0;184;0
WireConnection;41;0;40;0
WireConnection;38;0;32;0
WireConnection;70;0;71;0
WireConnection;69;0;68;0
WireConnection;67;0;66;0
WireConnection;352;18;351;0
WireConnection;352;19;350;0
WireConnection;365;0;367;0
WireConnection;365;1;366;0
WireConnection;197;0;196;0
WireConnection;196;1;44;0
WireConnection;196;2;198;0
WireConnection;196;3;329;0
WireConnection;196;4;361;0
WireConnection;364;0;365;0
WireConnection;231;0;263;0
WireConnection;231;1;324;0
WireConnection;328;0;232;0
WireConnection;328;1;231;0
WireConnection;369;0;328;0
WireConnection;202;0;214;0
WireConnection;202;1;209;0
WireConnection;203;0;300;0
WireConnection;203;1;301;0
WireConnection;205;0;303;0
WireConnection;206;0;208;0
WireConnection;207;0;206;0
WireConnection;207;1;205;0
WireConnection;208;0;302;0
WireConnection;209;0;219;0
WireConnection;209;1;220;0
WireConnection;210;0;296;0
WireConnection;210;1;297;0
WireConnection;211;0;298;0
WireConnection;211;1;297;0
WireConnection;212;0;210;0
WireConnection;213;0;211;0
WireConnection;219;0;295;0
WireConnection;219;1;212;0
WireConnection;220;0;213;0
WireConnection;220;1;299;0
WireConnection;204;0;202;0
WireConnection;204;1;203;0
WireConnection;204;2;207;0
WireConnection;216;0;371;0
WireConnection;216;1;204;0
WireConnection;371;0;328;0
WireConnection;372;0;216;0
WireConnection;307;0;381;0
WireConnection;307;1;313;0
WireConnection;278;1;308;0
WireConnection;278;0;308;9
WireConnection;278;2;308;20
WireConnection;278;3;308;21
WireConnection;278;4;308;13
WireConnection;278;5;308;15
WireConnection;278;6;308;26
WireConnection;278;7;308;27
WireConnection;279;1;266;0
WireConnection;279;0;266;9
WireConnection;279;2;266;20
WireConnection;279;3;266;21
WireConnection;279;4;266;13
WireConnection;279;5;266;15
WireConnection;279;6;266;26
WireConnection;279;7;266;27
WireConnection;280;1;251;0
WireConnection;280;0;279;0
WireConnection;280;2;278;0
WireConnection;280;3;307;0
WireConnection;280;4;306;0
WireConnection;229;0;322;0
WireConnection;230;0;323;0
WireConnection;255;0;229;0
WireConnection;256;0;255;0
WireConnection;256;1;230;0
WireConnection;221;0;228;0
WireConnection;221;1;227;0
WireConnection;228;0;315;0
WireConnection;228;1;225;0
WireConnection;227;0;226;0
WireConnection;227;1;321;0
WireConnection;253;0;319;0
WireConnection;253;1;320;0
WireConnection;259;0;252;0
WireConnection;259;1;253;0
WireConnection;259;2;256;0
WireConnection;378;0;257;0
WireConnection;257;0;370;0
WireConnection;257;1;259;0
WireConnection;252;0;222;0
WireConnection;252;1;221;0
WireConnection;214;0;293;0
WireConnection;214;1;294;0
WireConnection;222;0;311;0
WireConnection;222;1;312;0
WireConnection;225;0;223;0
WireConnection;226;0;224;0
WireConnection;224;0;318;0
WireConnection;224;1;317;0
WireConnection;223;0;316;0
WireConnection;223;1;317;0
WireConnection;308;3;380;0
WireConnection;308;4;258;0
WireConnection;308;5;313;0
WireConnection;266;3;379;0
WireConnection;266;4;258;0
WireConnection;266;5;313;0
WireConnection;266;28;310;0
WireConnection;258;0;309;0
WireConnection;288;1;264;0
WireConnection;288;0;264;9
WireConnection;288;2;264;20
WireConnection;288;3;264;21
WireConnection;288;4;264;13
WireConnection;288;5;264;15
WireConnection;288;6;264;26
WireConnection;288;7;264;27
WireConnection;304;0;375;0
WireConnection;304;1;291;0
WireConnection;287;1;265;0
WireConnection;287;0;265;9
WireConnection;287;2;265;20
WireConnection;287;3;265;21
WireConnection;287;4;265;13
WireConnection;287;5;265;15
WireConnection;287;6;265;26
WireConnection;287;7;265;27
WireConnection;286;1;218;0
WireConnection;286;0;287;0
WireConnection;286;2;288;0
WireConnection;286;3;304;0
WireConnection;286;4;305;0
WireConnection;264;3;374;0
WireConnection;264;4;217;0
WireConnection;264;5;291;0
WireConnection;265;3;373;0
WireConnection;265;4;217;0
WireConnection;265;5;291;0
WireConnection;265;28;290;0
WireConnection;217;0;289;0
WireConnection;384;0;280;0
WireConnection;386;0;286;0
WireConnection;398;0;396;0
WireConnection;398;1;395;0
WireConnection;399;0;396;0
WireConnection;399;1;395;0
WireConnection;400;0;396;0
WireConnection;400;1;395;0
WireConnection;401;0;396;0
WireConnection;401;1;395;0
WireConnection;402;0;396;0
WireConnection;402;1;395;0
WireConnection;395;0;405;0
WireConnection;395;1;408;0
WireConnection;395;2;393;0
WireConnection;397;1;396;0
WireConnection;397;0;398;0
WireConnection;397;2;399;0
WireConnection;397;3;400;0
WireConnection;397;4;401;0
WireConnection;397;5;400;0
WireConnection;403;0;397;0
WireConnection;403;1;406;0
WireConnection;405;1;390;0
WireConnection;409;1;403;0
WireConnection;393;0;394;0
WireConnection;396;0;404;0
WireConnection;396;1;407;0
WireConnection;396;2;392;0
WireConnection;392;0;391;0
WireConnection;411;0;409;0
WireConnection;404;1;410;0
WireConnection;237;0;387;0
WireConnection;282;0;237;0
WireConnection;238;0;282;0
WireConnection;326;0;282;0
WireConnection;326;1;238;0
WireConnection;283;1;326;0
WireConnection;283;3;281;0
WireConnection;340;0;283;0
WireConnection;340;1;341;0
WireConnection;412;0;340;0
WireConnection;233;0;388;0
WireConnection;236;0;233;0
WireConnection;234;0;236;0
WireConnection;327;0;236;0
WireConnection;327;1;234;0
WireConnection;267;1;327;0
WireConnection;267;3;285;0
WireConnection;342;0;267;0
WireConnection;342;1;284;0
WireConnection;435;0;342;0
WireConnection;241;0;438;0
WireConnection;241;1;439;0
WireConnection;242;0;438;0
WireConnection;242;1;439;0
WireConnection;243;0;438;0
WireConnection;243;1;439;0
WireConnection;244;0;438;0
WireConnection;244;1;439;0
WireConnection;261;0;277;0
WireConnection;335;0;438;0
WireConnection;335;1;439;0
WireConnection;336;0;439;0
WireConnection;336;1;438;0
WireConnection;240;0;438;0
WireConnection;240;1;439;0
WireConnection;443;0;466;0
WireConnection;443;1;467;0
WireConnection;444;0;466;0
WireConnection;444;1;467;0
WireConnection;445;0;466;0
WireConnection;445;1;467;0
WireConnection;446;0;466;0
WireConnection;446;1;467;0
WireConnection;463;0;466;0
WireConnection;463;1;467;0
WireConnection;464;0;467;0
WireConnection;464;1;466;0
WireConnection;468;0;466;0
WireConnection;468;1;467;0
WireConnection;461;1;465;0
WireConnection;461;0;466;0
WireConnection;461;2;468;0
WireConnection;461;3;443;0
WireConnection;461;4;444;0
WireConnection;461;5;445;0
WireConnection;461;6;446;0
WireConnection;461;7;463;0
WireConnection;461;8;464;0
WireConnection;448;0;461;0
WireConnection;447;0;461;0
WireConnection;449;1;447;0
WireConnection;449;0;461;0
WireConnection;449;2;448;0
WireConnection;450;1;449;0
WireConnection;450;3;451;0
WireConnection;454;0;456;0
WireConnection;454;1;457;0
WireConnection;454;2;458;0
WireConnection;456;0;450;0
WireConnection;453;0;454;0
WireConnection;269;0;250;0
WireConnection;250;0;249;0
WireConnection;250;1;246;0
WireConnection;246;0;247;0
WireConnection;246;1;270;0
WireConnection;247;0;248;0
WireConnection;248;0;262;0
WireConnection;248;1;271;0
WireConnection;248;2;272;0
WireConnection;262;0;268;0
WireConnection;268;1;276;0
WireConnection;268;3;273;0
WireConnection;276;1;260;0
WireConnection;276;0;277;0
WireConnection;276;2;261;0
WireConnection;260;0;277;0
WireConnection;277;1;343;0
WireConnection;277;0;438;0
WireConnection;277;2;240;0
WireConnection;277;3;241;0
WireConnection;277;4;242;0
WireConnection;277;5;243;0
WireConnection;277;6;244;0
WireConnection;277;7;335;0
WireConnection;277;8;336;0
WireConnection;455;0;473;40
WireConnection;455;1;471;0
WireConnection;469;0;455;0
WireConnection;473;20;484;0
WireConnection;473;110;478;0
WireConnection;474;20;484;0
WireConnection;474;110;478;0
WireConnection;471;0;474;40
WireConnection;471;1;470;0
WireConnection;478;0;480;0
WireConnection;406;0;481;0
WireConnection;406;1;483;0
WireConnection;480;0;477;0
WireConnection;482;0;459;0
WireConnection;452;0;453;0
WireConnection;452;1;482;0
WireConnection;484;0;452;0
WireConnection;484;2;485;0
WireConnection;153;1;146;0
WireConnection;306;1;382;0
WireConnection;305;1;376;0
WireConnection;572;0;608;0
WireConnection;572;1;609;0
WireConnection;578;0;572;0
WireConnection;598;0;597;0
WireConnection;597;0;608;0
WireConnection;597;1;609;0
WireConnection;579;0;573;0
WireConnection;573;0;608;0
WireConnection;573;1;609;0
WireConnection;580;0;574;0
WireConnection;574;0;609;0
WireConnection;574;1;608;0
WireConnection;577;0;608;0
WireConnection;577;1;609;0
WireConnection;603;0;577;0
WireConnection;576;0;608;0
WireConnection;576;1;609;0
WireConnection;602;0;576;0
WireConnection;575;0;608;0
WireConnection;575;1;609;0
WireConnection;605;0;575;0
WireConnection;604;0;608;0
WireConnection;583;0;581;0
WireConnection;583;1;600;0
WireConnection;600;0;582;0
WireConnection;600;1;601;0
WireConnection;582;1;604;0
WireConnection;582;0;602;0
WireConnection;582;2;605;0
WireConnection;582;3;603;0
WireConnection;582;4;578;0
WireConnection;582;5;598;0
WireConnection;582;6;579;0
WireConnection;582;7;580;0
WireConnection;584;0;583;0
WireConnection;532;0;516;0
WireConnection;546;0;533;0
WireConnection;547;0;532;0
WireConnection;550;0;542;0
WireConnection;550;1;549;0
WireConnection;554;0;544;0
WireConnection;554;1;545;0
WireConnection;555;0;546;0
WireConnection;555;1;547;0
WireConnection;511;0;503;0
WireConnection;511;1;502;0
WireConnection;512;0;502;0
WireConnection;512;1;504;0
WireConnection;521;0;511;0
WireConnection;522;0;512;0
WireConnection;536;0;523;0
WireConnection;536;1;521;0
WireConnection;537;0;522;0
WireConnection;537;1;524;0
WireConnection;549;0;536;0
WireConnection;549;1;537;0
WireConnection;509;0;499;0
WireConnection;509;1;500;0
WireConnection;510;0;501;0
WireConnection;510;1;499;0
WireConnection;517;0;510;0
WireConnection;518;0;509;0
WireConnection;534;0;519;0
WireConnection;534;1;517;0
WireConnection;535;0;518;0
WireConnection;535;1;520;0
WireConnection;548;0;534;0
WireConnection;548;1;535;0
WireConnection;570;0;564;0
WireConnection;570;1;565;0
WireConnection;570;2;566;0
WireConnection;564;0;561;0
WireConnection;564;1;562;0
WireConnection;561;0;588;0
WireConnection;562;0;561;0
WireConnection;588;1;558;0
WireConnection;588;3;586;0
WireConnection;558;1;557;0
WireConnection;557;0;551;0
WireConnection;557;1;552;0
WireConnection;557;2;553;0
WireConnection;551;0;543;0
WireConnection;551;1;548;0
WireConnection;552;0;538;0
WireConnection;552;1;539;0
WireConnection;553;0;540;0
WireConnection;553;1;541;0
WireConnection;540;0;528;0
WireConnection;541;0;527;0
WireConnection;527;0;513;0
WireConnection;530;0;634;0
WireConnection;530;1;515;0
WireConnection;515;0;508;0
WireConnection;515;1;507;0
WireConnection;616;0;570;0
WireConnection;616;1;615;0
WireConnection;607;0;616;0
WireConnection;571;0;569;0
WireConnection;571;1;567;0
WireConnection;571;2;568;0
WireConnection;569;0;560;0
WireConnection;569;1;563;0
WireConnection;560;0;587;0
WireConnection;559;1;556;0
WireConnection;556;0;550;0
WireConnection;556;1;554;0
WireConnection;556;2;555;0
WireConnection;563;0;560;0
WireConnection;613;0;571;0
WireConnection;613;1;614;0
WireConnection;606;0;613;0
WireConnection;587;1;559;0
WireConnection;587;3;585;0
WireConnection;543;0;515;0
WireConnection;543;1;530;0
WireConnection;514;0;505;0
WireConnection;514;1;506;0
WireConnection;529;0;627;0
WireConnection;529;1;514;0
WireConnection;39;0;60;0
WireConnection;542;0;589;0
WireConnection;542;1;612;0
WireConnection;612;0;514;0
WireConnection;612;1;529;0
WireConnection;622;1;525;0
WireConnection;622;3;620;0
WireConnection;627;0;622;0
WireConnection;594;0;596;0
WireConnection;594;1;592;0
WireConnection;594;2;593;0
WireConnection;595;0;594;0
WireConnection;632;0;629;0
WireConnection;629;0;633;0
WireConnection;629;1;630;0
WireConnection;629;2;631;0
WireConnection;634;0;623;0
WireConnection;623;1;526;0
WireConnection;623;3;617;0
WireConnection;2;0;599;0
WireConnection;2;2;599;0
WireConnection;2;5;197;0
ASEEND*/
//CHKSM=22A3CE7D868817DAD58EC97BB7DF2C45BFA07A50
// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BUDU Shaders/BWaterSurfaceEski"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HDR]_SurfaceColor("Surface Color", Color) = (1,1,1,1)
		_ShoreTileX("ShoreTileX", Float) = 1
		_ShoreTileY("ShoreTileY", Float) = 1
		_WaveSpeedX("WaveSpeedX", Float) = 1
		_WaveSpeedY("WaveSpeedY", Float) = 1
		[KeywordEnum(None,OneNoise,Multiply,Add,Subtract,Divide,FMod,FModInvert)] _DeformMixType("DeformMixType", Float) = 0
		_SurfaceDeformScale("Surface Deform Scale", Range( -10 , 10)) = 0.3
		_DeformBAngle("Deform B Angle", Float) = 4
		_DeformBSmooth("Deform B Smooth", Float) = 0
		_DeformAAngle("Deform A Angle", Float) = 4
		_DeformASmooth("Deform A Smooth", Float) = 0
		_DeformAScale("Deform A Scale", Float) = 4
		_DeformATileX("Deform A Tile X", Float) = 1
		_DeformBTileX("Deform B Tile X", Float) = 1
		_DeformBTileY("Deform B Tile Y", Float) = 1
		_DeformATileY("Deform A Tile Y", Float) = 1
		_DeformAOverallSpeed("Deform A Overall Speed", Float) = 1
		_DeformASpeedX("Deform A Speed X", Float) = 0
		_DeformBOverallSpeed("Deform B Overall Speed", Float) = 1
		_DeformBSpeedX("Deform B Speed X", Float) = 0.1
		_DeformBSpeedY("Deform B Speed Y", Float) = 0.1
		_DeformASpeedY("Deform A Speed Y", Float) = 0
		[KeywordEnum(NoTexture,OneLayer,Multiply,Additive,Subtract,Divide,FMod,FModInvert)] _SurfaceTextureBlendingType("Surface Texture Blending Type", Float) = 0
		[NoScaleOffset]_SurfaceColorMapA("Surface Color Map A", 2D) = "white" {}
		[NoScaleOffset]_SurfaceColorMapB("Surface Color Map B", 2D) = "white" {}
		_SurfaceCARotSpeed("SurfaceC A Rot Speed", Float) = 1
		_SurfaceCAAnchorX("SurfaceC A Anchor X", Float) = 0
		_SurfaceCAAnchorY("SurfaceC A Anchor Y", Float) = 0
		_SurfaceCATileX("SurfaceC A Tile X", Float) = 1
		_SurfaceCATileY("SurfaceC A Tile Y", Float) = 1
		_SurfaceCBOffsetX("SurfaceC B Offset X", Float) = 0
		_SurfaceCAOffsetX("SurfaceC A Offset X", Float) = 0
		_SurfaceCASpeedX("SurfaceC A Speed X", Float) = 0
		_SurfaceCBOffsetY("SurfaceC B Offset Y", Float) = 0
		_SurfaceCAOffsetY("SurfaceC A Offset Y", Float) = 0
		_SurfaceCASpeedY("SurfaceC A Speed Y", Float) = 0
		_SurfaceCBRotSpeed("SurfaceC B Rot Speed", Float) = 1
		_SurfaceCBAnchorX("SurfaceC B Anchor X", Float) = 0
		_SurfaceCBAnchorY("SurfaceC B Anchor Y", Float) = 0
		_SurfaceCBTileX("SurfaceC B Tile X", Float) = 0
		_SurfaceCBTileY("SurfaceC B Tile Y", Float) = 0
		_SurfaceCBSpeedX("SurfaceC B Speed X", Float) = 0
		_SurfaceCBSpeedY("SurfaceC B Speed Y", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _DeformBNoiseType("DeformBNoiseType", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _DeformANoiseType("DeformANoiseType", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseTypeA("NoiseTypeA", Float) = 0
		[KeywordEnum(None,VoronoiCell,VoronoiCaustic,Perlin,Texture)] _NoiseTypeB("NoiseTypeB", Float) = 0
		[KeywordEnum(Multiply,Add,Subtract,Divide,Dot)] _DefNoiseMixType("DefNoiseMixType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DefNoiseGradeType("DefNoiseGradeType", Float) = 0
		[KeywordEnum(Linear,Normal,Gamma)] _DeformGradeType("DeformGradeType", Float) = 1
		_DefNoiseContrast("DefNoiseContrast", Float) = 1
		_DefNoiseGradeScale("DefNoiseGradeScale", Float) = 1
		_DefNoiseGradeOffset("DefNoiseGradeOffset", Float) = 0.1
		_DefNoiseFinalScale("DefNoiseFinalScale", Range( 0 , 50)) = 1
		[HideInInspector]_DepthSettings("DepthSettings", Int) = 0
		[HideInInspector]_SurfaceMapA("SurfaceMapA", Int) = 0
		[HideInInspector]_AShoreFold("AShoreFold", Int) = 0
		_DeformFinalContrast("DeformFinalContrast", Range( 0 , 50)) = 1
		_DeformFinalBias("DeformFinalBias", Range( -1 , 1)) = -1
		[HideInInspector]_SurfaceMapB("SurfaceMapB", Int) = 0
		[HideInInspector]_AFoamFold("AFoamFold", Int) = 0
		_DefNoiseFinalOffset("DefNoiseFinalOffset", Range( 0 , 1)) = 0
		[HideInInspector]_NormMapAFold("NormMapAFold", Int) = 0
		[HideInInspector]_NormMapBFold("NormMapBFold", Int) = 0
		[HideInInspector]_NormGenAFold("NormGenAFold", Int) = 0
		[HideInInspector]_DeformAFold("DeformAFold", Int) = 0
		[HideInInspector]_DeformBFold("DeformBFold", Int) = 0
		[HideInInspector]_DeformSettings("DeformSettings", Int) = 0
		[HideInInspector]_FlowMapSettings("FlowMapSettings", Int) = 0
		[HideInInspector]_NormGenBFold("NormGenBFold", Int) = 0
		[HideInInspector]_NoiseFold("NoiseFold", Int) = 0
		[HideInInspector]_MiddleNAFold("MiddleNAFold", Int) = 0
		_DefPerlinBScale("DefPerlinBScale", Float) = 1
		_DefPerlinAScale("DefPerlinAScale", Float) = 1
		[HideInInspector]_MiddleNBFold("MiddleNBFold", Int) = 0
		[NoScaleOffset]_DefNoiseAMap("DefNoiseAMap", 2D) = "white" {}
		[NoScaleOffset]_DeformBMap("Deform B Map", 2D) = "white" {}
		[NoScaleOffset]_DeformAMap("Deform A Map", 2D) = "white" {}
		_DefNoiseTypeAExponential("DefNoiseTypeAExponential", Float) = 1
		_DeformScale("DeformScale", Range( -2 , 2)) = 0
		[Toggle]_SurfaceWaves("SurfaceWaves", Float) = 1
		_DefNoiseTypeAOverallSpeed("DefNoiseTypeAOverallSpeed", Float) = 1
		_SurfCTypeAOverallSpeed("SurfCTypeAOverallSpeed", Float) = 1
		_SurfCTypeBOverallSpeed("SurfCTypeBOverallSpeed", Float) = 1
		_DefNoiseAScale("DefNoiseAScale", Float) = 8
		_DefVorAAngle("DefVorAAngle", Range( -8 , 8)) = 0.1
		_DefVorATileX("DefVorATileX", Float) = 1
		_DefVorATileY("DefVorATileY", Float) = 1
		_DefVorASpeedX("DefVorASpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorASpeedY("DefVorASpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeBRotSpeed("DefTypeBRotSpeed", Float) = 0
		_DefTypeARotSpeed("DefTypeARotSpeed", Float) = 0
		_DeformBAnchorX("Deform B AnchorX", Float) = 0
		_DeformAAnchorX("Deform A AnchorX", Float) = 0
		_DefTypeAAnchorX("DefTypeAAnchorX", Float) = 0
		_DefTypeAAnchorY("DefTypeAAnchorY", Float) = 0
		_DeformAAnchorY("Deform A AnchorY", Float) = 0
		_DeformBAnchorY("Deform B AnchorY", Float) = 0
		[NoScaleOffset]_DefNoiseBMap("DefNoiseBMap", 2D) = "white" {}
		[Toggle]_DeformBInvert("DeformBInvert", Float) = 0
		[Toggle]_DeformAInvert("DeformAInvert", Float) = 0
		_DefNoiseTypeBExponential("DefNoiseTypeBExponential", Float) = 1
		_DefNoiseTypeBOverallSpeed("DefNoiseTypeBOverallSpeed", Float) = 1
		_DefNoiseBScale("DefNoiseBScale", Float) = 5
		_DefVorBAngle("DefVorBAngle", Range( -8 , 8)) = 0.1
		_DefVorBTileX("DefVorBTileX", Float) = 1
		_DefVorBTileY("DefVorBTileY", Float) = 1
		_DefVorBSpeedX("DefVorBSpeedX", Range( -0.5 , 0.5)) = 0
		_DefVorBSpeedY("DefVorBSpeedY", Range( -0.5 , 0.5)) = 0
		_DefTypeBAnchorX("DefTypeBAnchorX", Float) = 0
		_DefTypeBAnchorY("DefTypeBAnchorY", Float) = 0
		_MiddleWaveIntensity("Middle Wave Intensity", Range( 0 , 1)) = 0.5
		_DeformBIntensity("Deform B Intensity", Range( 0 , 1)) = 1
		_DeformAIntensity("Deform A Intensity", Range( 0 , 1)) = 1
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _Def_VorCaustic_A_Type("Def_VorCaustic_A_Type", Float) = 2
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _Def_VorCaustic_A_Type2("Def_VorCaustic_A_Type", Float) = 2
		[KeywordEnum(Caustic1,Caustic2,Caustic3,Caustic4,Caustic5,Caustic6,Caustic7,Caustic8)] _Def_VorCaustic_B_Type("Def_VorCaustic_B_Type", Float) = 2
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _Def_VorCell_A_Type("Def_VorCell_A_Type", Float) = 2
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _Def_VorCell_B_Type("Def_VorCell_B_Type", Float) = 2
		[KeywordEnum(Cell1,Cell2,Cell3,Cell4,Cell5,Cell6,Cell7,Cell8)] _Def_VorCell_A_Type2("Def_VorCell_A_Type", Float) = 2
		_DefVorASmooth("DefVorASmooth", Range( 0 , 1)) = 0
		_DefVorBSmooth("DefVorBSmooth", Range( 0 , 1)) = 0
		[Toggle]_SurfaceDeformation("SurfaceDeformation", Float) = 0
		[Toggle]_SurfaceCMapBInv("SurfaceCMapBInv", Float) = 0
		[Toggle]_SurfaceCMapAInv("SurfaceCMapAInv", Float) = 0
		_SurfaceCMapAIntensity("SurfaceCMapAIntensity", Range( 0 , 1)) = 1
		_SurfaceCMapBIntensity("SurfaceCMapBIntensity", Range( 0 , 1)) = 1
		_SurfaceCBRot("SurfaceC B Rot", Range( 0 , 360)) = 0
		_DefTypeBRot("DefTypeBRot", Range( 0 , 360)) = 0
		_DefTypeARot("DefTypeARot", Range( 0 , 360)) = 0
		_SurfaceCARot("SurfaceC A Rot", Range( 0 , 360)) = 0
		_SurfaceCAScale("SurfaceCAScale", Float) = 1
		_SurfaceCBScale("SurfaceCBScale", Float) = 1
		_DefVorAOffsetX("DefVorAOffsetX", Range( 0 , 1)) = 0
		_DefVorBOffsetX("DefVorBOffsetX", Range( 0 , 1)) = 0
		_DefVorBOffsetY("DefVorBOffsetY", Range( 0 , 1)) = 0
		_DefVorAOffsetY("DefVorAOffsetY", Range( 0 , 1)) = 0
		_NoiseA_Contrast("NoiseA_Contrast", Float) = 0
		_NoiseB_Contrast("NoiseB_Contrast", Float) = 0
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
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
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
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8
			#pragma shader_feature_local _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE _SURFACETEXTUREBLENDINGTYPE_ONELAYER _SURFACETEXTUREBLENDINGTYPE_MULTIPLY _SURFACETEXTUREBLENDINGTYPE_ADDITIVE _SURFACETEXTUREBLENDINGTYPE_SUBTRACT _SURFACETEXTUREBLENDINGTYPE_DIVIDE _SURFACETEXTUREBLENDINGTYPE_FMOD _SURFACETEXTUREBLENDINGTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE2_CELL1 _DEF_VORCELL_A_TYPE2_CELL2 _DEF_VORCELL_A_TYPE2_CELL3 _DEF_VORCELL_A_TYPE2_CELL4 _DEF_VORCELL_A_TYPE2_CELL5 _DEF_VORCELL_A_TYPE2_CELL6 _DEF_VORCELL_A_TYPE2_CELL7 _DEF_VORCELL_A_TYPE2_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;
			sampler2D _SurfaceColorMapA;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _SurfaceColorMapB;


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

				float Zero911 = 0.0;
				float4 temp_cast_0 = (Zero911).xxxx;
				float One909 = 1.0;
				float4 temp_cast_1 = (One909).xxxx;
				float2 appendResult506 = (float2(_SurfaceCATileX , _SurfaceCATileY));
				float mulTime583 = _TimeParameters.x * ( _SurfaceCASpeedX * _SurfCTypeAOverallSpeed );
				float mulTime584 = _TimeParameters.x * ( _SurfaceCASpeedY * _SurfCTypeAOverallSpeed );
				float2 appendResult580 = (float2(( _SurfaceCAOffsetX + mulTime583 ) , ( mulTime584 + _SurfaceCAOffsetY )));
				float4 temp_cast_3 = (Zero911).xxxx;
				float Gray913 = 0.5;
				float4 temp_cast_4 = (Gray913).xxxx;
				float4 temp_cast_6 = (Gray913).xxxx;
				float DeformAScale1834 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScale1834;
				float DeformAAngle1843 = _DeformAAngle;
				float mulTime1785 = _TimeParameters.x * DeformAAngle1843;
				float temp_output_4_0_g437 = mulTime1785;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmooth1850 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmooth1850;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult162 = (float2(_DeformATileX , _DeformATileY));
				float mulTime355 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime402 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult403 = (float2(( _DeformAOffsetX + mulTime355 ) , ( mulTime402 + _DeformAOffsetY )));
				float2 texCoord293 = IN.ase_texcoord8.xy * appendResult162 + appendResult403;
				float2 appendResult1794 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime1803 = _TimeParameters.x * _DeformARotateSpeed;
				float cos1799 = cos( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float sin1799 = sin( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float2 rotator1799 = mul( texCoord293 - appendResult1794 , float2x2( cos1799 , -sin1799 , sin1799 , cos1799 )) + appendResult1794;
				float2 DeformARef1806 = rotator1799;
				float2 temp_output_3_0_g437 = DeformARef1806;
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
				float staticSwitch1770 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch1770 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch1770 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch1770 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch1770 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch1770 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch1770 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch1770 = voroi23_g437;
				#else
				float staticSwitch1770 = voroi18_g437;
				#endif
				float4 temp_cast_7 = (staticSwitch1770).xxxx;
				float temp_output_5_0_g436 = DeformAScale1834;
				float temp_output_4_0_g436 = mulTime1785;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef1806;
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
				float staticSwitch1769 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch1769 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch1769 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch1769 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch1769 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch1769 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch1769 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch1769 = voroi23_g436;
				#else
				float staticSwitch1769 = voroi18_g436;
				#endif
				float4 temp_cast_8 = (staticSwitch1769).xxxx;
				float simplePerlin3D1768 = snoise( float3( DeformARef1806 ,  0.0 )*DeformAScale1834 );
				simplePerlin3D1768 = simplePerlin3D1768*0.5 + 0.5;
				float4 temp_cast_10 = (simplePerlin3D1768).xxxx;
				float4 temp_cast_11 = (Gray913).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch1788 = temp_cast_11;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch1788 = temp_cast_7;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1788 = temp_cast_8;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch1788 = temp_cast_10;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch1788 = tex2D( _DeformAMap, DeformARef1806 );
				#else
				float4 staticSwitch1788 = temp_cast_11;
				#endif
				float4 lerpResult5_g409 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch1788 ) ):( staticSwitch1788 )) , _DeformAContrast);
				float4 temp_output_1893_0 = ( saturate( lerpResult5_g409 ) * _DeformAIntensity );
				float4 temp_cast_13 = (Gray913).xxxx;
				float DeformBScale1836 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScale1836;
				float DeformBAngle1844 = _DeformBAngle;
				float mulTime1863 = _TimeParameters.x * DeformBAngle1844;
				float temp_output_4_0_g439 = mulTime1863;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmooth1852 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmooth1852;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult1823 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime1811 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime1812 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult1822 = (float2(( _DeformBOffsetX + mulTime1811 ) , ( mulTime1812 + _DeformBOffsetY )));
				float2 texCoord1828 = IN.ase_texcoord8.xy * appendResult1823 + appendResult1822;
				float2 appendResult1829 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime1820 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos1831 = cos( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float sin1831 = sin( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float2 rotator1831 = mul( texCoord1828 - appendResult1829 , float2x2( cos1831 , -sin1831 , sin1831 , cos1831 )) + appendResult1829;
				float2 DeformBRef1832 = rotator1831;
				float2 temp_output_3_0_g439 = DeformBRef1832;
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
				#if defined( _DEF_VORCELL_A_TYPE2_CELL1 )
				float staticSwitch1858 = voroi2_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL2 )
				float staticSwitch1858 = voroi8_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL3 )
				float staticSwitch1858 = voroi18_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL4 )
				float staticSwitch1858 = voroi17_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL5 )
				float staticSwitch1858 = voroi10_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL6 )
				float staticSwitch1858 = voroi12_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL7 )
				float staticSwitch1858 = voroi24_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL8 )
				float staticSwitch1858 = voroi23_g439;
				#else
				float staticSwitch1858 = voroi18_g439;
				#endif
				float4 temp_cast_14 = (staticSwitch1858).xxxx;
				float temp_output_5_0_g438 = DeformBScale1836;
				float temp_output_4_0_g438 = mulTime1863;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef1832;
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
				#if defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 )
				float staticSwitch1857 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 )
				float staticSwitch1857 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 )
				float staticSwitch1857 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 )
				float staticSwitch1857 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 )
				float staticSwitch1857 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 )
				float staticSwitch1857 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 )
				float staticSwitch1857 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8 )
				float staticSwitch1857 = voroi23_g438;
				#else
				float staticSwitch1857 = voroi18_g438;
				#endif
				float4 temp_cast_15 = (staticSwitch1857).xxxx;
				float simplePerlin3D1856 = snoise( float3( DeformBRef1832 ,  0.0 )*DeformBScale1836 );
				simplePerlin3D1856 = simplePerlin3D1856*0.5 + 0.5;
				float4 temp_cast_17 = (simplePerlin3D1856).xxxx;
				float4 temp_cast_18 = (Gray913).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch1862 = temp_cast_18;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch1862 = temp_cast_14;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1862 = temp_cast_15;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch1862 = temp_cast_17;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch1862 = tex2D( _DeformBMap, DeformBRef1832 );
				#else
				float4 staticSwitch1862 = temp_cast_18;
				#endif
				float4 lerpResult5_g408 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch1862 ) ):( staticSwitch1862 )) , _DeformBContrast);
				float4 temp_output_1895_0 = ( saturate( lerpResult5_g408 ) * _DeformBIntensity );
				float4 temp_cast_19 = (Gray913).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch415 = temp_cast_19;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch415 = temp_output_1893_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch415 = ( temp_output_1893_0 * temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch415 = ( temp_output_1893_0 + temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch415 = ( temp_output_1893_0 - temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch415 = ( temp_output_1893_0 / temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch415 = fmod( temp_output_1893_0 , temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch415 = fmod( temp_output_1895_0 , temp_output_1893_0 );
				#else
				float4 staticSwitch415 = temp_cast_19;
				#endif
				float3 gammaToLinear1882 = Gamma22ToLinear( staticSwitch415.rgb );
				float3 linearToGamma1883 = LinearToGamma22( staticSwitch415.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch1884 = float4( gammaToLinear1882 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch1884 = staticSwitch415;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch1884 = float4( linearToGamma1883 , 0.0 );
				#else
				float4 staticSwitch1884 = staticSwitch415;
				#endif
				float4 NoiseTypeRef447 = (staticSwitch1884*_DeformFinalContrast + _DeformFinalBias);
				float4 SurfaceC_TA_Ref1763 = ( float4( appendResult580, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_3 )) );
				float2 texCoord464 = IN.ase_texcoord8.xy * appendResult506 + SurfaceC_TA_Ref1763.rg;
				float2 appendResult585 = (float2(_SurfaceCAAnchorX , _SurfaceCAAnchorY));
				float mulTime474 = _TimeParameters.x * _SurfaceCARotSpeed;
				float cos465 = cos( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float sin465 = sin( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 temp_output_1642_0 = (tex2D( _SurfaceColorMapA, rotator465 )*_SurfaceCAScale + 0.0);
				float4 temp_output_1484_0 = ( (( _SurfaceCMapAInv )?( ( 1.0 - temp_output_1642_0 ) ):( temp_output_1642_0 )) * _SurfaceCMapAIntensity );
				float2 appendResult609 = (float2(_SurfaceCBTileX , _SurfaceCBTileY));
				float mulTime614 = _TimeParameters.x * ( _SurfaceCBSpeedX * _SurfCTypeBOverallSpeed );
				float mulTime615 = _TimeParameters.x * ( _SurfaceCBSpeedY * _SurfCTypeBOverallSpeed );
				float2 appendResult602 = (float2(( _SurfaceCBOffsetX + mulTime614 ) , ( mulTime615 + _SurfaceCBOffsetY )));
				float4 temp_cast_28 = (Zero911).xxxx;
				float4 SurfaceC_TB_Ref1764 = ( float4( appendResult602, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_28 )) );
				float2 texCoord599 = IN.ase_texcoord8.xy * appendResult609 + SurfaceC_TB_Ref1764.rg;
				float2 appendResult619 = (float2(_SurfaceCBAnchorX , _SurfaceCBAnchorY));
				float mulTime617 = _TimeParameters.x * _SurfaceCBRotSpeed;
				float cos597 = cos( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float sin597 = sin( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 temp_output_1643_0 = (tex2D( _SurfaceColorMapB, rotator597 )*_SurfaceCBScale + 0.0);
				float4 temp_output_1485_0 = ( (( _SurfaceCMapBInv )?( ( 1.0 - temp_output_1643_0 ) ):( temp_output_1643_0 )) * _SurfaceCMapBIntensity );
				float4 temp_cast_30 = (One909).xxxx;
				#if defined( _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE )
				float4 staticSwitch1423 = temp_cast_30;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ONELAYER )
				float4 staticSwitch1423 = temp_output_1484_0;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_MULTIPLY )
				float4 staticSwitch1423 = ( temp_output_1484_0 * temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch1423 = ( temp_output_1484_0 + temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_SUBTRACT )
				float4 staticSwitch1423 = ( temp_output_1484_0 - temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch1423 = ( temp_output_1484_0 / temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMOD )
				float4 staticSwitch1423 = fmod( temp_output_1484_0 , temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMODINVERT )
				float4 staticSwitch1423 = fmod( temp_output_1485_0 , temp_output_1484_0 );
				#else
				float4 staticSwitch1423 = temp_cast_30;
				#endif
				float4 SurfaceRef592 = (( _SurfaceWaves )?( ( _SurfaceColor * saturate( staticSwitch1423 ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = SurfaceRef592.rgb;
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
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;


			
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
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8
			#pragma shader_feature_local _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE _SURFACETEXTUREBLENDINGTYPE_ONELAYER _SURFACETEXTUREBLENDINGTYPE_MULTIPLY _SURFACETEXTUREBLENDINGTYPE_ADDITIVE _SURFACETEXTUREBLENDINGTYPE_SUBTRACT _SURFACETEXTUREBLENDINGTYPE_DIVIDE _SURFACETEXTUREBLENDINGTYPE_FMOD _SURFACETEXTUREBLENDINGTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE2_CELL1 _DEF_VORCELL_A_TYPE2_CELL2 _DEF_VORCELL_A_TYPE2_CELL3 _DEF_VORCELL_A_TYPE2_CELL4 _DEF_VORCELL_A_TYPE2_CELL5 _DEF_VORCELL_A_TYPE2_CELL6 _DEF_VORCELL_A_TYPE2_CELL7 _DEF_VORCELL_A_TYPE2_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;
			sampler2D _SurfaceColorMapA;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _SurfaceColorMapB;


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

				float Zero911 = 0.0;
				float4 temp_cast_0 = (Zero911).xxxx;
				float One909 = 1.0;
				float4 temp_cast_1 = (One909).xxxx;
				float2 appendResult506 = (float2(_SurfaceCATileX , _SurfaceCATileY));
				float mulTime583 = _TimeParameters.x * ( _SurfaceCASpeedX * _SurfCTypeAOverallSpeed );
				float mulTime584 = _TimeParameters.x * ( _SurfaceCASpeedY * _SurfCTypeAOverallSpeed );
				float2 appendResult580 = (float2(( _SurfaceCAOffsetX + mulTime583 ) , ( mulTime584 + _SurfaceCAOffsetY )));
				float4 temp_cast_3 = (Zero911).xxxx;
				float Gray913 = 0.5;
				float4 temp_cast_4 = (Gray913).xxxx;
				float4 temp_cast_6 = (Gray913).xxxx;
				float DeformAScale1834 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScale1834;
				float DeformAAngle1843 = _DeformAAngle;
				float mulTime1785 = _TimeParameters.x * DeformAAngle1843;
				float temp_output_4_0_g437 = mulTime1785;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmooth1850 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmooth1850;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult162 = (float2(_DeformATileX , _DeformATileY));
				float mulTime355 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime402 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult403 = (float2(( _DeformAOffsetX + mulTime355 ) , ( mulTime402 + _DeformAOffsetY )));
				float2 texCoord293 = IN.ase_texcoord4.xy * appendResult162 + appendResult403;
				float2 appendResult1794 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime1803 = _TimeParameters.x * _DeformARotateSpeed;
				float cos1799 = cos( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float sin1799 = sin( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float2 rotator1799 = mul( texCoord293 - appendResult1794 , float2x2( cos1799 , -sin1799 , sin1799 , cos1799 )) + appendResult1794;
				float2 DeformARef1806 = rotator1799;
				float2 temp_output_3_0_g437 = DeformARef1806;
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
				float staticSwitch1770 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch1770 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch1770 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch1770 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch1770 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch1770 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch1770 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch1770 = voroi23_g437;
				#else
				float staticSwitch1770 = voroi18_g437;
				#endif
				float4 temp_cast_7 = (staticSwitch1770).xxxx;
				float temp_output_5_0_g436 = DeformAScale1834;
				float temp_output_4_0_g436 = mulTime1785;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef1806;
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
				float staticSwitch1769 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch1769 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch1769 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch1769 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch1769 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch1769 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch1769 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch1769 = voroi23_g436;
				#else
				float staticSwitch1769 = voroi18_g436;
				#endif
				float4 temp_cast_8 = (staticSwitch1769).xxxx;
				float simplePerlin3D1768 = snoise( float3( DeformARef1806 ,  0.0 )*DeformAScale1834 );
				simplePerlin3D1768 = simplePerlin3D1768*0.5 + 0.5;
				float4 temp_cast_10 = (simplePerlin3D1768).xxxx;
				float4 temp_cast_11 = (Gray913).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch1788 = temp_cast_11;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch1788 = temp_cast_7;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1788 = temp_cast_8;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch1788 = temp_cast_10;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch1788 = tex2D( _DeformAMap, DeformARef1806 );
				#else
				float4 staticSwitch1788 = temp_cast_11;
				#endif
				float4 lerpResult5_g409 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch1788 ) ):( staticSwitch1788 )) , _DeformAContrast);
				float4 temp_output_1893_0 = ( saturate( lerpResult5_g409 ) * _DeformAIntensity );
				float4 temp_cast_13 = (Gray913).xxxx;
				float DeformBScale1836 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScale1836;
				float DeformBAngle1844 = _DeformBAngle;
				float mulTime1863 = _TimeParameters.x * DeformBAngle1844;
				float temp_output_4_0_g439 = mulTime1863;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmooth1852 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmooth1852;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult1823 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime1811 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime1812 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult1822 = (float2(( _DeformBOffsetX + mulTime1811 ) , ( mulTime1812 + _DeformBOffsetY )));
				float2 texCoord1828 = IN.ase_texcoord4.xy * appendResult1823 + appendResult1822;
				float2 appendResult1829 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime1820 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos1831 = cos( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float sin1831 = sin( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float2 rotator1831 = mul( texCoord1828 - appendResult1829 , float2x2( cos1831 , -sin1831 , sin1831 , cos1831 )) + appendResult1829;
				float2 DeformBRef1832 = rotator1831;
				float2 temp_output_3_0_g439 = DeformBRef1832;
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
				#if defined( _DEF_VORCELL_A_TYPE2_CELL1 )
				float staticSwitch1858 = voroi2_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL2 )
				float staticSwitch1858 = voroi8_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL3 )
				float staticSwitch1858 = voroi18_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL4 )
				float staticSwitch1858 = voroi17_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL5 )
				float staticSwitch1858 = voroi10_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL6 )
				float staticSwitch1858 = voroi12_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL7 )
				float staticSwitch1858 = voroi24_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL8 )
				float staticSwitch1858 = voroi23_g439;
				#else
				float staticSwitch1858 = voroi18_g439;
				#endif
				float4 temp_cast_14 = (staticSwitch1858).xxxx;
				float temp_output_5_0_g438 = DeformBScale1836;
				float temp_output_4_0_g438 = mulTime1863;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef1832;
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
				#if defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 )
				float staticSwitch1857 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 )
				float staticSwitch1857 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 )
				float staticSwitch1857 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 )
				float staticSwitch1857 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 )
				float staticSwitch1857 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 )
				float staticSwitch1857 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 )
				float staticSwitch1857 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8 )
				float staticSwitch1857 = voroi23_g438;
				#else
				float staticSwitch1857 = voroi18_g438;
				#endif
				float4 temp_cast_15 = (staticSwitch1857).xxxx;
				float simplePerlin3D1856 = snoise( float3( DeformBRef1832 ,  0.0 )*DeformBScale1836 );
				simplePerlin3D1856 = simplePerlin3D1856*0.5 + 0.5;
				float4 temp_cast_17 = (simplePerlin3D1856).xxxx;
				float4 temp_cast_18 = (Gray913).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch1862 = temp_cast_18;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch1862 = temp_cast_14;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1862 = temp_cast_15;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch1862 = temp_cast_17;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch1862 = tex2D( _DeformBMap, DeformBRef1832 );
				#else
				float4 staticSwitch1862 = temp_cast_18;
				#endif
				float4 lerpResult5_g408 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch1862 ) ):( staticSwitch1862 )) , _DeformBContrast);
				float4 temp_output_1895_0 = ( saturate( lerpResult5_g408 ) * _DeformBIntensity );
				float4 temp_cast_19 = (Gray913).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch415 = temp_cast_19;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch415 = temp_output_1893_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch415 = ( temp_output_1893_0 * temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch415 = ( temp_output_1893_0 + temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch415 = ( temp_output_1893_0 - temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch415 = ( temp_output_1893_0 / temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch415 = fmod( temp_output_1893_0 , temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch415 = fmod( temp_output_1895_0 , temp_output_1893_0 );
				#else
				float4 staticSwitch415 = temp_cast_19;
				#endif
				float3 gammaToLinear1882 = Gamma22ToLinear( staticSwitch415.rgb );
				float3 linearToGamma1883 = LinearToGamma22( staticSwitch415.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch1884 = float4( gammaToLinear1882 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch1884 = staticSwitch415;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch1884 = float4( linearToGamma1883 , 0.0 );
				#else
				float4 staticSwitch1884 = staticSwitch415;
				#endif
				float4 NoiseTypeRef447 = (staticSwitch1884*_DeformFinalContrast + _DeformFinalBias);
				float4 SurfaceC_TA_Ref1763 = ( float4( appendResult580, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_3 )) );
				float2 texCoord464 = IN.ase_texcoord4.xy * appendResult506 + SurfaceC_TA_Ref1763.rg;
				float2 appendResult585 = (float2(_SurfaceCAAnchorX , _SurfaceCAAnchorY));
				float mulTime474 = _TimeParameters.x * _SurfaceCARotSpeed;
				float cos465 = cos( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float sin465 = sin( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 temp_output_1642_0 = (tex2D( _SurfaceColorMapA, rotator465 )*_SurfaceCAScale + 0.0);
				float4 temp_output_1484_0 = ( (( _SurfaceCMapAInv )?( ( 1.0 - temp_output_1642_0 ) ):( temp_output_1642_0 )) * _SurfaceCMapAIntensity );
				float2 appendResult609 = (float2(_SurfaceCBTileX , _SurfaceCBTileY));
				float mulTime614 = _TimeParameters.x * ( _SurfaceCBSpeedX * _SurfCTypeBOverallSpeed );
				float mulTime615 = _TimeParameters.x * ( _SurfaceCBSpeedY * _SurfCTypeBOverallSpeed );
				float2 appendResult602 = (float2(( _SurfaceCBOffsetX + mulTime614 ) , ( mulTime615 + _SurfaceCBOffsetY )));
				float4 temp_cast_28 = (Zero911).xxxx;
				float4 SurfaceC_TB_Ref1764 = ( float4( appendResult602, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_28 )) );
				float2 texCoord599 = IN.ase_texcoord4.xy * appendResult609 + SurfaceC_TB_Ref1764.rg;
				float2 appendResult619 = (float2(_SurfaceCBAnchorX , _SurfaceCBAnchorY));
				float mulTime617 = _TimeParameters.x * _SurfaceCBRotSpeed;
				float cos597 = cos( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float sin597 = sin( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 temp_output_1643_0 = (tex2D( _SurfaceColorMapB, rotator597 )*_SurfaceCBScale + 0.0);
				float4 temp_output_1485_0 = ( (( _SurfaceCMapBInv )?( ( 1.0 - temp_output_1643_0 ) ):( temp_output_1643_0 )) * _SurfaceCMapBIntensity );
				float4 temp_cast_30 = (One909).xxxx;
				#if defined( _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE )
				float4 staticSwitch1423 = temp_cast_30;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ONELAYER )
				float4 staticSwitch1423 = temp_output_1484_0;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_MULTIPLY )
				float4 staticSwitch1423 = ( temp_output_1484_0 * temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch1423 = ( temp_output_1484_0 + temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_SUBTRACT )
				float4 staticSwitch1423 = ( temp_output_1484_0 - temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch1423 = ( temp_output_1484_0 / temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMOD )
				float4 staticSwitch1423 = fmod( temp_output_1484_0 , temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMODINVERT )
				float4 staticSwitch1423 = fmod( temp_output_1485_0 , temp_output_1484_0 );
				#else
				float4 staticSwitch1423 = temp_cast_30;
				#endif
				float4 SurfaceRef592 = (( _SurfaceWaves )?( ( _SurfaceColor * saturate( staticSwitch1423 ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = SurfaceRef592.rgb;
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
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8
			#pragma shader_feature_local _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE _SURFACETEXTUREBLENDINGTYPE_ONELAYER _SURFACETEXTUREBLENDINGTYPE_MULTIPLY _SURFACETEXTUREBLENDINGTYPE_ADDITIVE _SURFACETEXTUREBLENDINGTYPE_SUBTRACT _SURFACETEXTUREBLENDINGTYPE_DIVIDE _SURFACETEXTUREBLENDINGTYPE_FMOD _SURFACETEXTUREBLENDINGTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMGRADETYPE_LINEAR _DEFORMGRADETYPE_NORMAL _DEFORMGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFORMMIXTYPE_NONE _DEFORMMIXTYPE_ONENOISE _DEFORMMIXTYPE_MULTIPLY _DEFORMMIXTYPE_ADD _DEFORMMIXTYPE_SUBTRACT _DEFORMMIXTYPE_DIVIDE _DEFORMMIXTYPE_FMOD _DEFORMMIXTYPE_FMODINVERT
			#pragma shader_feature_local _DEFORMANOISETYPE_NONE _DEFORMANOISETYPE_VORONOICELL _DEFORMANOISETYPE_VORONOICAUSTIC _DEFORMANOISETYPE_PERLIN _DEFORMANOISETYPE_TEXTURE
			#pragma shader_feature_local _DEFORMBNOISETYPE_NONE _DEFORMBNOISETYPE_VORONOICELL _DEFORMBNOISETYPE_VORONOICAUSTIC _DEFORMBNOISETYPE_PERLIN _DEFORMBNOISETYPE_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE2_CELL1 _DEF_VORCELL_A_TYPE2_CELL2 _DEF_VORCELL_A_TYPE2_CELL3 _DEF_VORCELL_A_TYPE2_CELL4 _DEF_VORCELL_A_TYPE2_CELL5 _DEF_VORCELL_A_TYPE2_CELL6 _DEF_VORCELL_A_TYPE2_CELL7 _DEF_VORCELL_A_TYPE2_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;
			sampler2D _SurfaceColorMapA;
			sampler2D _DeformAMap;
			sampler2D _DeformBMap;
			sampler2D _SurfaceColorMapB;


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

				float Zero911 = 0.0;
				float4 temp_cast_0 = (Zero911).xxxx;
				float One909 = 1.0;
				float4 temp_cast_1 = (One909).xxxx;
				float2 appendResult506 = (float2(_SurfaceCATileX , _SurfaceCATileY));
				float mulTime583 = _TimeParameters.x * ( _SurfaceCASpeedX * _SurfCTypeAOverallSpeed );
				float mulTime584 = _TimeParameters.x * ( _SurfaceCASpeedY * _SurfCTypeAOverallSpeed );
				float2 appendResult580 = (float2(( _SurfaceCAOffsetX + mulTime583 ) , ( mulTime584 + _SurfaceCAOffsetY )));
				float4 temp_cast_3 = (Zero911).xxxx;
				float Gray913 = 0.5;
				float4 temp_cast_4 = (Gray913).xxxx;
				float4 temp_cast_6 = (Gray913).xxxx;
				float DeformAScale1834 = _DeformAScale;
				float temp_output_5_0_g437 = DeformAScale1834;
				float DeformAAngle1843 = _DeformAAngle;
				float mulTime1785 = _TimeParameters.x * DeformAAngle1843;
				float temp_output_4_0_g437 = mulTime1785;
				float time2_g437 = temp_output_4_0_g437;
				float2 voronoiSmoothId2_g437 = 0;
				float DeformASmooth1850 = _DeformASmooth;
				float temp_output_28_0_g437 = DeformASmooth1850;
				float voronoiSmooth2_g437 = temp_output_28_0_g437;
				float2 appendResult162 = (float2(_DeformATileX , _DeformATileY));
				float mulTime355 = _TimeParameters.x * ( _DeformASpeedX * _DeformAOverallSpeed );
				float mulTime402 = _TimeParameters.x * ( _DeformAOverallSpeed * _DeformASpeedY );
				float2 appendResult403 = (float2(( _DeformAOffsetX + mulTime355 ) , ( mulTime402 + _DeformAOffsetY )));
				float2 texCoord293 = IN.ase_texcoord2.xy * appendResult162 + appendResult403;
				float2 appendResult1794 = (float2(_DeformAAnchorX , _DeformAAnchorY));
				float mulTime1803 = _TimeParameters.x * _DeformARotateSpeed;
				float cos1799 = cos( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float sin1799 = sin( ( radians( mulTime1803 ) + radians( _DeformARotate ) ) );
				float2 rotator1799 = mul( texCoord293 - appendResult1794 , float2x2( cos1799 , -sin1799 , sin1799 , cos1799 )) + appendResult1794;
				float2 DeformARef1806 = rotator1799;
				float2 temp_output_3_0_g437 = DeformARef1806;
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
				float staticSwitch1770 = voroi2_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL2 )
				float staticSwitch1770 = voroi8_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL3 )
				float staticSwitch1770 = voroi18_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL4 )
				float staticSwitch1770 = voroi17_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL5 )
				float staticSwitch1770 = voroi10_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL6 )
				float staticSwitch1770 = voroi12_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL7 )
				float staticSwitch1770 = voroi24_g437;
				#elif defined( _DEF_VORCELL_A_TYPE_CELL8 )
				float staticSwitch1770 = voroi23_g437;
				#else
				float staticSwitch1770 = voroi18_g437;
				#endif
				float4 temp_cast_7 = (staticSwitch1770).xxxx;
				float temp_output_5_0_g436 = DeformAScale1834;
				float temp_output_4_0_g436 = mulTime1785;
				float time2_g436 = temp_output_4_0_g436;
				float2 voronoiSmoothId2_g436 = 0;
				float voronoiSmooth2_g436 = 0.0;
				float2 temp_output_3_0_g436 = DeformARef1806;
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
				float staticSwitch1769 = voroi2_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 )
				float staticSwitch1769 = voroi8_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 )
				float staticSwitch1769 = voroi18_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 )
				float staticSwitch1769 = voroi17_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 )
				float staticSwitch1769 = voroi10_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 )
				float staticSwitch1769 = voroi12_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 )
				float staticSwitch1769 = voroi24_g436;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8 )
				float staticSwitch1769 = voroi23_g436;
				#else
				float staticSwitch1769 = voroi18_g436;
				#endif
				float4 temp_cast_8 = (staticSwitch1769).xxxx;
				float simplePerlin3D1768 = snoise( float3( DeformARef1806 ,  0.0 )*DeformAScale1834 );
				simplePerlin3D1768 = simplePerlin3D1768*0.5 + 0.5;
				float4 temp_cast_10 = (simplePerlin3D1768).xxxx;
				float4 temp_cast_11 = (Gray913).xxxx;
				#if defined( _DEFORMANOISETYPE_NONE )
				float4 staticSwitch1788 = temp_cast_11;
				#elif defined( _DEFORMANOISETYPE_VORONOICELL )
				float4 staticSwitch1788 = temp_cast_7;
				#elif defined( _DEFORMANOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1788 = temp_cast_8;
				#elif defined( _DEFORMANOISETYPE_PERLIN )
				float4 staticSwitch1788 = temp_cast_10;
				#elif defined( _DEFORMANOISETYPE_TEXTURE )
				float4 staticSwitch1788 = tex2D( _DeformAMap, DeformARef1806 );
				#else
				float4 staticSwitch1788 = temp_cast_11;
				#endif
				float4 lerpResult5_g409 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformAInvert )?( ( 1.0 - staticSwitch1788 ) ):( staticSwitch1788 )) , _DeformAContrast);
				float4 temp_output_1893_0 = ( saturate( lerpResult5_g409 ) * _DeformAIntensity );
				float4 temp_cast_13 = (Gray913).xxxx;
				float DeformBScale1836 = _DeformBScale;
				float temp_output_5_0_g439 = DeformBScale1836;
				float DeformBAngle1844 = _DeformBAngle;
				float mulTime1863 = _TimeParameters.x * DeformBAngle1844;
				float temp_output_4_0_g439 = mulTime1863;
				float time2_g439 = temp_output_4_0_g439;
				float2 voronoiSmoothId2_g439 = 0;
				float DeformBSmooth1852 = _DeformBSmooth;
				float temp_output_28_0_g439 = DeformBSmooth1852;
				float voronoiSmooth2_g439 = temp_output_28_0_g439;
				float2 appendResult1823 = (float2(_DeformBTileX , _DeformBTileY));
				float mulTime1811 = _TimeParameters.x * ( _DeformBSpeedX * _DeformBOverallSpeed );
				float mulTime1812 = _TimeParameters.x * ( _DeformBOverallSpeed * _DeformBSpeedY );
				float2 appendResult1822 = (float2(( _DeformBOffsetX + mulTime1811 ) , ( mulTime1812 + _DeformBOffsetY )));
				float2 texCoord1828 = IN.ase_texcoord2.xy * appendResult1823 + appendResult1822;
				float2 appendResult1829 = (float2(_DeformBAnchorX , _DeformBAnchorY));
				float mulTime1820 = _TimeParameters.x * _DeformBRotateSpeed;
				float cos1831 = cos( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float sin1831 = sin( ( radians( mulTime1820 ) + radians( _DeformBRotate ) ) );
				float2 rotator1831 = mul( texCoord1828 - appendResult1829 , float2x2( cos1831 , -sin1831 , sin1831 , cos1831 )) + appendResult1829;
				float2 DeformBRef1832 = rotator1831;
				float2 temp_output_3_0_g439 = DeformBRef1832;
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
				#if defined( _DEF_VORCELL_A_TYPE2_CELL1 )
				float staticSwitch1858 = voroi2_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL2 )
				float staticSwitch1858 = voroi8_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL3 )
				float staticSwitch1858 = voroi18_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL4 )
				float staticSwitch1858 = voroi17_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL5 )
				float staticSwitch1858 = voroi10_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL6 )
				float staticSwitch1858 = voroi12_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL7 )
				float staticSwitch1858 = voroi24_g439;
				#elif defined( _DEF_VORCELL_A_TYPE2_CELL8 )
				float staticSwitch1858 = voroi23_g439;
				#else
				float staticSwitch1858 = voroi18_g439;
				#endif
				float4 temp_cast_14 = (staticSwitch1858).xxxx;
				float temp_output_5_0_g438 = DeformBScale1836;
				float temp_output_4_0_g438 = mulTime1863;
				float time2_g438 = temp_output_4_0_g438;
				float2 voronoiSmoothId2_g438 = 0;
				float voronoiSmooth2_g438 = 0.0;
				float2 temp_output_3_0_g438 = DeformBRef1832;
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
				#if defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC1 )
				float staticSwitch1857 = voroi2_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC2 )
				float staticSwitch1857 = voroi8_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC3 )
				float staticSwitch1857 = voroi18_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC4 )
				float staticSwitch1857 = voroi17_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC5 )
				float staticSwitch1857 = voroi10_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC6 )
				float staticSwitch1857 = voroi12_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC7 )
				float staticSwitch1857 = voroi24_g438;
				#elif defined( _DEF_VORCAUSTIC_A_TYPE2_CAUSTIC8 )
				float staticSwitch1857 = voroi23_g438;
				#else
				float staticSwitch1857 = voroi18_g438;
				#endif
				float4 temp_cast_15 = (staticSwitch1857).xxxx;
				float simplePerlin3D1856 = snoise( float3( DeformBRef1832 ,  0.0 )*DeformBScale1836 );
				simplePerlin3D1856 = simplePerlin3D1856*0.5 + 0.5;
				float4 temp_cast_17 = (simplePerlin3D1856).xxxx;
				float4 temp_cast_18 = (Gray913).xxxx;
				#if defined( _DEFORMBNOISETYPE_NONE )
				float4 staticSwitch1862 = temp_cast_18;
				#elif defined( _DEFORMBNOISETYPE_VORONOICELL )
				float4 staticSwitch1862 = temp_cast_14;
				#elif defined( _DEFORMBNOISETYPE_VORONOICAUSTIC )
				float4 staticSwitch1862 = temp_cast_15;
				#elif defined( _DEFORMBNOISETYPE_PERLIN )
				float4 staticSwitch1862 = temp_cast_17;
				#elif defined( _DEFORMBNOISETYPE_TEXTURE )
				float4 staticSwitch1862 = tex2D( _DeformBMap, DeformBRef1832 );
				#else
				float4 staticSwitch1862 = temp_cast_18;
				#endif
				float4 lerpResult5_g408 = lerp( float4( float3(0.5,0.5,0.5) , 0.0 ) , (( _DeformBInvert )?( ( 1.0 - staticSwitch1862 ) ):( staticSwitch1862 )) , _DeformBContrast);
				float4 temp_output_1895_0 = ( saturate( lerpResult5_g408 ) * _DeformBIntensity );
				float4 temp_cast_19 = (Gray913).xxxx;
				#if defined( _DEFORMMIXTYPE_NONE )
				float4 staticSwitch415 = temp_cast_19;
				#elif defined( _DEFORMMIXTYPE_ONENOISE )
				float4 staticSwitch415 = temp_output_1893_0;
				#elif defined( _DEFORMMIXTYPE_MULTIPLY )
				float4 staticSwitch415 = ( temp_output_1893_0 * temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_ADD )
				float4 staticSwitch415 = ( temp_output_1893_0 + temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_SUBTRACT )
				float4 staticSwitch415 = ( temp_output_1893_0 - temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_DIVIDE )
				float4 staticSwitch415 = ( temp_output_1893_0 / temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMOD )
				float4 staticSwitch415 = fmod( temp_output_1893_0 , temp_output_1895_0 );
				#elif defined( _DEFORMMIXTYPE_FMODINVERT )
				float4 staticSwitch415 = fmod( temp_output_1895_0 , temp_output_1893_0 );
				#else
				float4 staticSwitch415 = temp_cast_19;
				#endif
				float3 gammaToLinear1882 = Gamma22ToLinear( staticSwitch415.rgb );
				float3 linearToGamma1883 = LinearToGamma22( staticSwitch415.rgb );
				#if defined( _DEFORMGRADETYPE_LINEAR )
				float4 staticSwitch1884 = float4( gammaToLinear1882 , 0.0 );
				#elif defined( _DEFORMGRADETYPE_NORMAL )
				float4 staticSwitch1884 = staticSwitch415;
				#elif defined( _DEFORMGRADETYPE_GAMMA )
				float4 staticSwitch1884 = float4( linearToGamma1883 , 0.0 );
				#else
				float4 staticSwitch1884 = staticSwitch415;
				#endif
				float4 NoiseTypeRef447 = (staticSwitch1884*_DeformFinalContrast + _DeformFinalBias);
				float4 SurfaceC_TA_Ref1763 = ( float4( appendResult580, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_3 )) );
				float2 texCoord464 = IN.ase_texcoord2.xy * appendResult506 + SurfaceC_TA_Ref1763.rg;
				float2 appendResult585 = (float2(_SurfaceCAAnchorX , _SurfaceCAAnchorY));
				float mulTime474 = _TimeParameters.x * _SurfaceCARotSpeed;
				float cos465 = cos( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float sin465 = sin( ( radians( _SurfaceCARot ) + radians( mulTime474 ) ) );
				float2 rotator465 = mul( texCoord464 - appendResult585 , float2x2( cos465 , -sin465 , sin465 , cos465 )) + appendResult585;
				float4 temp_output_1642_0 = (tex2D( _SurfaceColorMapA, rotator465 )*_SurfaceCAScale + 0.0);
				float4 temp_output_1484_0 = ( (( _SurfaceCMapAInv )?( ( 1.0 - temp_output_1642_0 ) ):( temp_output_1642_0 )) * _SurfaceCMapAIntensity );
				float2 appendResult609 = (float2(_SurfaceCBTileX , _SurfaceCBTileY));
				float mulTime614 = _TimeParameters.x * ( _SurfaceCBSpeedX * _SurfCTypeBOverallSpeed );
				float mulTime615 = _TimeParameters.x * ( _SurfaceCBSpeedY * _SurfCTypeBOverallSpeed );
				float2 appendResult602 = (float2(( _SurfaceCBOffsetX + mulTime614 ) , ( mulTime615 + _SurfaceCBOffsetY )));
				float4 temp_cast_28 = (Zero911).xxxx;
				float4 SurfaceC_TB_Ref1764 = ( float4( appendResult602, 0.0 , 0.0 ) + (( _SurfaceDeformation )?( ( NoiseTypeRef447 * _SurfaceDeformScale ) ):( temp_cast_28 )) );
				float2 texCoord599 = IN.ase_texcoord2.xy * appendResult609 + SurfaceC_TB_Ref1764.rg;
				float2 appendResult619 = (float2(_SurfaceCBAnchorX , _SurfaceCBAnchorY));
				float mulTime617 = _TimeParameters.x * _SurfaceCBRotSpeed;
				float cos597 = cos( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float sin597 = sin( ( radians( _SurfaceCBRot ) + radians( mulTime617 ) ) );
				float2 rotator597 = mul( texCoord599 - appendResult619 , float2x2( cos597 , -sin597 , sin597 , cos597 )) + appendResult619;
				float4 temp_output_1643_0 = (tex2D( _SurfaceColorMapB, rotator597 )*_SurfaceCBScale + 0.0);
				float4 temp_output_1485_0 = ( (( _SurfaceCMapBInv )?( ( 1.0 - temp_output_1643_0 ) ):( temp_output_1643_0 )) * _SurfaceCMapBIntensity );
				float4 temp_cast_30 = (One909).xxxx;
				#if defined( _SURFACETEXTUREBLENDINGTYPE_NOTEXTURE )
				float4 staticSwitch1423 = temp_cast_30;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ONELAYER )
				float4 staticSwitch1423 = temp_output_1484_0;
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_MULTIPLY )
				float4 staticSwitch1423 = ( temp_output_1484_0 * temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_ADDITIVE )
				float4 staticSwitch1423 = ( temp_output_1484_0 + temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_SUBTRACT )
				float4 staticSwitch1423 = ( temp_output_1484_0 - temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_DIVIDE )
				float4 staticSwitch1423 = ( temp_output_1484_0 / temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMOD )
				float4 staticSwitch1423 = fmod( temp_output_1484_0 , temp_output_1485_0 );
				#elif defined( _SURFACETEXTUREBLENDINGTYPE_FMODINVERT )
				float4 staticSwitch1423 = fmod( temp_output_1485_0 , temp_output_1484_0 );
				#else
				float4 staticSwitch1423 = temp_cast_30;
				#endif
				float4 SurfaceRef592 = (( _SurfaceWaves )?( ( _SurfaceColor * saturate( staticSwitch1423 ) ) ):( temp_cast_0 ));
				

				float3 BaseColor = SurfaceRef592.rgb;
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;


			
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
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;


			
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
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _ASE_LIGHTING_SIMPLE
			#define _NORMAL_DROPOFF_TS 1
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

			#pragma shader_feature_local _DEFNOISEGRADETYPE_LINEAR _DEFNOISEGRADETYPE_NORMAL _DEFNOISEGRADETYPE_GAMMA
			#pragma shader_feature_local _DEFNOISEMIXTYPE_MULTIPLY _DEFNOISEMIXTYPE_ADD _DEFNOISEMIXTYPE_SUBTRACT _DEFNOISEMIXTYPE_DIVIDE _DEFNOISEMIXTYPE_DOT
			#pragma shader_feature_local _DEF_VORCAUSTIC_A_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_A_TYPE_CAUSTIC8
			#pragma shader_feature_local _DEF_VORCELL_A_TYPE_CELL1 _DEF_VORCELL_A_TYPE_CELL2 _DEF_VORCELL_A_TYPE_CELL3 _DEF_VORCELL_A_TYPE_CELL4 _DEF_VORCELL_A_TYPE_CELL5 _DEF_VORCELL_A_TYPE_CELL6 _DEF_VORCELL_A_TYPE_CELL7 _DEF_VORCELL_A_TYPE_CELL8
			#pragma shader_feature_local _NOISETYPEA_NONE _NOISETYPEA_VORONOICELL _NOISETYPEA_VORONOICAUSTIC _NOISETYPEA_PERLIN _NOISETYPEA_TEXTURE
			#pragma shader_feature_local _NOISETYPEB_NONE _NOISETYPEB_VORONOICELL _NOISETYPEB_VORONOICAUSTIC _NOISETYPEB_PERLIN _NOISETYPEB_TEXTURE
			#pragma shader_feature_local _DEF_VORCELL_B_TYPE_CELL1 _DEF_VORCELL_B_TYPE_CELL2 _DEF_VORCELL_B_TYPE_CELL3 _DEF_VORCELL_B_TYPE_CELL4 _DEF_VORCELL_B_TYPE_CELL5 _DEF_VORCELL_B_TYPE_CELL6 _DEF_VORCELL_B_TYPE_CELL7 _DEF_VORCELL_B_TYPE_CELL8
			#pragma shader_feature_local _DEF_VORCAUSTIC_B_TYPE_CAUSTIC1 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC2 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC3 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC4 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC5 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC6 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC7 _DEF_VORCAUSTIC_B_TYPE_CAUSTIC8


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
			float4 _SurfaceColor;
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
			float _DeformAAnchorX;
			float _DeformAOffsetY;
			float _DeformASpeedY;
			float _DeformAOverallSpeed;
			float _DeformASpeedX;
			float _DeformAOffsetX;
			float _DeformATileY;
			float _DeformATileX;
			float _DeformASmooth;
			float _DeformAAngle;
			float _DeformAScale;
			float _DeformAInvert;
			float _SurfaceDeformation;
			float _SurfaceCAOffsetY;
			float _SurfaceCASpeedY;
			float _SurfCTypeAOverallSpeed;
			float _SurfaceCASpeedX;
			float _SurfaceCAOffsetX;
			float _DeformBOffsetX;
			float _WaveSpeedX;
			float _DeformBSpeedX;
			float _DeformBSpeedY;
			float _SurfaceCBRotSpeed;
			float _SurfaceCBRot;
			float _SurfaceCBAnchorY;
			float _SurfaceCBAnchorX;
			float _SurfaceCBOffsetY;
			float _SurfaceCBSpeedY;
			float _SurfCTypeBOverallSpeed;
			float _SurfaceCBSpeedX;
			float _SurfaceCBOffsetX;
			float _SurfaceCBTileY;
			float _SurfaceCBTileX;
			float _SurfaceCMapBInv;
			float _SurfaceCMapAIntensity;
			float _DeformBOverallSpeed;
			float _SurfaceCAScale;
			float _SurfaceCARot;
			float _SurfaceCAAnchorY;
			float _SurfaceCAAnchorX;
			float _SurfaceDeformScale;
			float _DeformFinalBias;
			float _DeformFinalContrast;
			float _DeformBIntensity;
			float _DeformBContrast;
			float _DeformBRotate;
			float _DeformBRotateSpeed;
			float _DeformBAnchorY;
			float _DeformBAnchorX;
			float _DeformBOffsetY;
			float _SurfaceCARotSpeed;
			float _SurfaceCATileY;
			float _SurfaceCATileX;
			float _SurfaceCMapAInv;
			float _NoiseB_Contrast;
			float _DefNoiseTypeBExponential;
			float _NoiseA_Contrast;
			float _DefNoiseFinalOffset;
			float _DefNoiseFinalScale;
			float _DefNoiseContrast;
			float _DefNoiseGradeOffset;
			float _DefNoiseGradeScale;
			float _MiddleWaveIntensity;
			int _FlowMapSettings;
			int _DeformBFold;
			int _DeformAFold;
			int _MiddleNBFold;
			float _DefVorBAngle;
			int _MiddleNAFold;
			int _NormGenAFold;
			int _NormGenBFold;
			int _DepthSettings;
			int _NormMapAFold;
			int _NormMapBFold;
			int _NoiseFold;
			int _AFoamFold;
			int _AShoreFold;
			int _SurfaceMapB;
			int _SurfaceMapA;
			float _ShoreTileY;
			float _ShoreTileX;
			float _WaveSpeedY;
			int _DeformSettings;
			float _DefVorBSmooth;
			float _DefNoiseBScale;
			float _DefPerlinBScale;
			float _SurfaceWaves;
			float _DefNoiseTypeAExponential;
			float _DeformScale;
			float _DefTypeARot;
			float _DefTypeARotSpeed;
			float _DefVorAOffsetY;
			float _DefTypeAAnchorY;
			float _DefTypeAAnchorX;
			float _DefVorASpeedY;
			float _DefNoiseTypeAOverallSpeed;
			float _DefVorASpeedX;
			float _DefVorAOffsetX;
			float _DefPerlinAScale;
			float _DefNoiseAScale;
			float _DefVorATileY;
			float _DefVorATileX;
			float _DefVorASmooth;
			float _DefVorAAngle;
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
			float _DefVorBTileX;
			float _SurfaceCBScale;
			float _SurfaceCMapBIntensity;
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

			sampler2D _DefNoiseBMap;
			sampler2D _DefNoiseAMap;


			
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
Version=19501
Node;AmplifyShaderEditor.CommentaryNode;1011;-10176,8528;Inherit;False;7547.328;2582.766;Noise and Caustic Animation Settings for Normals;62;1102;1510;1549;1107;1099;1110;1244;1241;1663;1496;1242;1100;1098;1662;1661;1096;1097;1095;1503;1093;1092;1090;1089;1091;1088;1087;1086;1083;1082;1081;1614;1085;1084;1078;1075;1079;1074;1071;1069;1742;1080;1076;1077;1073;1072;1070;1745;1545;1521;1103;1556;1247;1439;1438;1437;1435;1436;1385;1386;2024;2025;2028;Noise and Caustic Animation Settings for Normals;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;457;-15408,4832;Inherit;False;4533.45;1658.589;Shore Texture Settings;94;455;1434;1432;1433;1681;1679;1678;1429;1677;1428;1680;1676;1430;353;426;372;362;361;425;424;410;371;411;409;383;1752;1750;64;380;1715;1716;1724;1719;1732;1721;384;179;377;393;1728;1727;1718;1717;918;333;1734;1733;1722;1720;1702;1701;1707;1706;1723;1726;1704;634;917;346;1731;1730;1738;1737;1700;1699;378;329;1708;1705;392;386;1725;388;453;1655;315;1729;1711;1710;1713;1714;390;389;314;313;376;330;1709;387;391;1712;1740;2026;2027;Shore Texture Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1253;-7872,-1920;Inherit;False;3648.345;1013.868;Reflection Map;26;1262;1272;1273;1274;1275;1258;1259;1267;1269;1260;1276;1277;1266;1265;1279;1278;1264;1261;1257;1256;1254;1604;1609;1611;1613;2035;Reflection Map;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;815;-10144,4448;Inherit;False;6634.383;2739.77;Noise and Caustic Animation Settings Default;47;902;1468;928;1467;899;898;900;907;929;897;895;894;888;891;892;893;890;889;885;884;883;886;887;877;878;881;876;874;871;880;879;873;882;875;872;1749;1746;1441;1444;1443;1442;1440;1399;1400;2031;2032;2030;Noise and Caustic Animation Settings Default;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;449;-19600,-384;Inherit;False;5258.728;2202.104;Deform Settings;119;1912;1809;1810;1909;1911;1910;161;159;401;354;1908;1907;402;355;447;1885;1884;1887;1886;1883;1882;415;1877;1874;1875;1880;1879;1878;1876;1895;1893;1894;1892;1889;1871;1872;1891;1890;1888;1788;1862;1769;1770;1861;1856;1773;1768;1774;1858;1857;1855;1854;1853;1848;1785;1867;1866;1865;1863;1852;1836;1832;1850;1834;1806;1847;1864;1851;1844;1831;1849;1843;327;1799;1845;1830;1829;1828;1842;1796;1794;293;1825;1824;1827;1826;1823;1822;1798;1797;1804;1795;162;403;1821;1819;1818;1820;1817;1816;1801;1803;1791;1792;1815;1813;1811;1814;1812;1793;1790;1800;1913;2033;2023;2043;2042;2037;2036;Deform Settings;0.7926196,0.4496855,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;914;-11632,176;Inherit;False;517.7007;1101.188;Local Vars;22;1915;1914;1451;1450;1932;1916;1529;1528;1425;1526;1527;1457;1454;1453;1514;1513;908;909;911;910;913;912;Local Vars;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;452;-13984,2208;Inherit;False;2222.72;727.0552;Depth Settings;23;451;927;930;926;924;450;404;156;338;337;336;344;343;340;342;341;339;428;92;91;89;90;93;Depth Settings;1,0.5251572,0.5251572,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1386;-10144,9968;Inherit;False;2396.556;1098.134;Noise B;42;1523;1067;1062;1059;1326;1382;1061;1057;1446;1384;1052;1383;1058;1054;1051;1532;1047;1043;1033;1030;1533;1531;1039;1038;1029;1028;1684;1683;1530;1046;1685;1686;1023;1022;1040;1018;1017;1014;1012;1013;2044;2039;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1385;-10128,8592;Inherit;False;2376.603;1126.393;Noise A;42;1690;1689;1687;1688;1025;1024;1020;1021;1019;1016;1015;1032;1026;1027;1522;1068;1063;1325;1379;1060;1065;1056;1049;1445;1050;1380;1055;1053;1048;1537;1045;1042;1034;1536;1535;1036;1035;1534;1044;1037;2045;2038;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1928;-13968,1584;Inherit;False;1231.999;248.3334;Flow Map Settings;6;1929;1930;1931;1654;1651;1652;Flow Map Settings;1,0.5251572,0.5251572,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1740;-15328,5664;Inherit;False;715.2666;320.0667;Comment;5;1736;325;448;322;321;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1406;-10768,2320;Inherit;False;1877.737;479.1341;Fog Settings;14;1193;1192;1190;1189;1188;1187;1180;1186;1185;1184;1183;1181;1511;1512;Fog Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1410;-7408,2240;Inherit;False;1892;578.6667;Displacement Settings;16;1338;1336;1339;1331;1341;1335;1334;1340;1349;1333;1350;1343;1344;1404;1405;1354;Displacement Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;945;-7952,-2832;Inherit;False;1837.747;775.887;Refraction Settings;15;969;948;967;970;968;956;958;957;951;954;955;1143;959;1505;2029;Refraction Settings;0,0.4211543,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1604;-6160,-1488;Inherit;False;1163.688;537.7063;Water Reflect Ref;9;1605;1608;1610;1607;1595;1603;1600;1602;1675;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1556;-5184,10096;Inherit;False;1717.649;837.5044;Normal Map Settings;21;1517;1516;1566;1557;1552;1550;1553;1551;1520;1555;1540;1543;1544;1559;1558;1541;1524;1525;1952;1951;1950;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1408;-10768,1536;Inherit;False;756;383.6666;Specular Settings;4;1142;1353;932;1108;Specular Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;460;-5904,160;Inherit;False;2009.898;1161.447;Final Comp;27;1664;454;1660;1657;1659;920;1162;1280;1248;1246;973;1152;456;1498;1499;925;904;345;375;374;373;413;1155;461;1294;916;1936;Final Comp;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1112;-7664,3152;Inherit;False;1913.232;676.3248;Screen Space Bump Map Settings;19;1131;1130;1129;1128;1127;1126;1125;1124;1123;1122;1121;1120;1119;1118;1117;1116;1115;1114;1113;Screen Space Bump Map Settings;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;989;-10240,-304;Inherit;False;1826.63;599.0414;Normals;12;1002;1003;1001;1000;1004;1005;1006;1132;1137;1506;1138;1953;Normals;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;593;-17616,-4112;Inherit;False;4788.7;1247.661;Water Surface Settings;93;1755;1754;580;1634;582;581;1637;1636;1762;1756;583;584;602;1635;613;612;1638;1639;615;1759;1761;614;1758;1760;1478;1473;1919;1471;1479;1423;611;610;1477;1476;609;505;504;506;1763;1427;592;1426;459;1767;1650;1764;1766;587;586;585;464;1491;469;474;1493;1492;588;621;620;619;1765;599;616;1488;1490;1489;618;617;1642;1644;458;579;1494;596;1645;1643;597;465;1482;1487;1483;1486;1480;1481;1485;1484;1422;604;625;624;622;349;606;Water Surface Settings;1,0.5333334,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;988;-9392,-880;Inherit;False;816.4238;534.0689;Normal Light Direction;4;994;993;992;991;Normal Light Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;990;-10240,-880;Inherit;False;816.4238;534.0689;Normal View Direction;4;998;997;996;995;Normal View Direction;0.4402515,0.4635113,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1400;-10096,5936;Inherit;False;2362.425;1213.956;Comment;41;1694;1693;1692;1691;864;1394;854;860;1448;859;1391;829;828;835;818;833;832;825;824;819;817;1682;837;1616;862;1617;1620;1619;1618;870;842;843;853;1397;1398;866;856;852;845;2046;2040;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1399;-10112,4512;Inherit;False;2380.87;1196.451;Comment;41;855;821;869;1389;846;857;1447;838;1625;1624;1623;1622;1621;1695;1697;1696;1698;820;816;831;830;823;822;826;827;834;836;858;840;839;848;847;850;844;863;861;1395;1396;865;2041;2047;;0.6214285,0,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;354;-19504,-64;Inherit;False;Property;_DeformASpeedX;Deform A Speed X;51;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;401;-19504,96;Inherit;False;Property;_DeformASpeedY;Deform A Speed Y;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1909;-19536,16;Inherit;False;Property;_DeformAOverallSpeed;Deform A Overall Speed;50;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1810;-19504,1168;Inherit;False;Property;_DeformBSpeedY;Deform B Speed Y;54;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1809;-19504,1008;Inherit;False;Property;_DeformBSpeedX;Deform B Speed X;53;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1912;-19536,1088;Inherit;False;Property;_DeformBOverallSpeed;Deform B Overall Speed;52;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1907;-19280,-64;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1908;-19280,64;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1910;-19280,1008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1911;-19280,1136;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1800;-19120,288;Inherit;False;Property;_DeformARotateSpeed;Deform A Rotate Speed;299;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1790;-19120,-112;Inherit;False;Property;_DeformAOffsetX;Deform A Offset X;295;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1793;-19120,128;Inherit;False;Property;_DeformAOffsetY;Deform A Offset Y;297;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1812;-19088,1120;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1814;-19120,1200;Inherit;False;Property;_DeformBOffsetY;Deform B Offset Y;296;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1811;-19088,1040;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1813;-19120,960;Inherit;False;Property;_DeformBOffsetX;Deform B Offset X;294;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1815;-19120,1360;Inherit;False;Property;_DeformBRotateSpeed;Deform B Rotate Speed;298;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;355;-19088,-32;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;402;-19088,48;Inherit;False;1;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1792;-18896,48;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1791;-18896,-64;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1803;-18864,288;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1816;-18896,1120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1817;-18896,1008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1820;-18864,1360;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1818;-18960,800;Inherit;False;Property;_DeformBTileX;Deform B Tile X;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1819;-18960,880;Inherit;False;Property;_DeformBTileY;Deform B Tile Y;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-18960,-272;Inherit;False;Property;_DeformATileX;Deform A Tile X;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;161;-18960,-192;Inherit;False;Property;_DeformATileY;Deform A Tile Y;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1821;-18896,1440;Inherit;False;Property;_DeformBRotate;Deform B Rotate;300;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1801;-18896,368;Inherit;False;Property;_DeformARotate;Deform A Rotate;301;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;403;-18768,-16;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;162;-18768,-256;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1795;-18672,288;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1804;-18672,368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1797;-18768,128;Inherit;False;Property;_DeformAAnchorX;Deform A AnchorX;171;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1798;-18768,208;Inherit;False;Property;_DeformAAnchorY;Deform A AnchorY;175;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1822;-18768,1056;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1823;-18768,816;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1826;-18672,1360;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1827;-18672,1440;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1824;-18768,1200;Inherit;False;Property;_DeformBAnchorX;Deform B AnchorX;170;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1825;-18768,1280;Inherit;False;Property;_DeformBAnchorY;Deform B AnchorY;176;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;293;-18608,-64;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1794;-18544,144;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1796;-18512,288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1842;-18368,320;Inherit;False;Property;_DeformAAngle;Deform A Angle;42;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1828;-18608,1008;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1829;-18544,1216;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1830;-18512,1360;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1845;-18368,1392;Inherit;False;Property;_DeformBAngle;Deform B Angle;40;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1799;-18368,112;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-18368,240;Inherit;False;Property;_DeformAScale;Deform A Scale;44;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1843;-18176,320;Inherit;False;DeformAAngle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1849;-18416,400;Inherit;False;Property;_DeformASmooth;Deform A Smooth;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1831;-18368,1184;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1844;-18176,1392;Inherit;False;DeformBAngle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1851;-18400,1472;Inherit;False;Property;_DeformBSmooth;Deform B Smooth;41;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1913;-18368,1312;Inherit;False;Property;_DeformBScale;DeformBScale;304;0;Create;True;0;0;0;False;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1806;-18176,112;Inherit;False;DeformARef;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1834;-18176,240;Inherit;False;DeformAScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1850;-18176,400;Inherit;False;DeformASmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1832;-18176,1184;Inherit;False;DeformBRef;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1836;-18176,1312;Inherit;False;DeformBScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1852;-18176,1472;Inherit;False;DeformBSmooth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1847;-17920,-48;Inherit;False;1843;DeformAAngle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1864;-17904,1024;Inherit;False;1844;DeformBAngle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;912;-11568,384;Inherit;False;Constant;_Gray;[Gray];19;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1863;-17680,1024;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1785;-17696,-48;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1865;-17904,1104;Inherit;False;1836;DeformBScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1866;-17904,1184;Inherit;False;1852;DeformBSmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1867;-17872,1312;Inherit;False;1832;DeformBRef;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;913;-11360,384;Inherit;False;Gray;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1855;-17088,752;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1857;-17216,1088;Inherit;False;Property;_Def_VorCaustic_A_Type2;Def_VorCaustic_A_Type;225;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1858;-17184,832;Inherit;False;Property;_Def_VorCell_A_Type2;Def_VorCell_A_Type;231;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1774;-17104,-320;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1768;-17472,288;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1773;-17520,512;Inherit;True;Property;_DeformAMap;Deform A Map;138;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1861;-17504,1584;Inherit;True;Property;_DeformBMap;Deform B Map;137;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch;1770;-17200,-240;Inherit;False;Property;_Def_VorCell_A_Type;Def_VorCell_A_Type;229;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1769;-17232,16;Inherit;False;Property;_Def_VorCaustic_A_Type;Def_VorCaustic_A_Type;223;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1856;-17456,1360;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1862;-16896,1072;Inherit;False;Property;_DeformBNoiseType;DeformBNoiseType;86;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1788;-16912,0;Inherit;False;Property;_DeformANoiseType;DeformANoiseType;87;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1888;-16608,64;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1890;-16608,1136;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1891;-16448,1072;Inherit;False;Property;_DeformBInvert;DeformBInvert;182;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1889;-16448,0;Inherit;False;Property;_DeformAInvert;DeformAInvert;183;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1871;-16448,112;Inherit;False;Property;_DeformAContrast;Deform A Contrast;302;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1872;-16448,1184;Inherit;False;Property;_DeformBContrast;Deform B Contrast;303;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1892;-16288,192;Inherit;False;Property;_DeformAIntensity;Deform A Intensity;210;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1894;-16272,1264;Inherit;False;Property;_DeformBIntensity;Deform B Intensity;209;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2033;-16208,1072;Inherit;False;BUDUContrast;-1;;408;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2023;-16208,0;Inherit;False;BUDUContrast;-1;;409;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1893;-16000,0;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1895;-16000,1072;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-13936,2576;Inherit;False;Property;_GradeExponential;Grade Exponential;30;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-13904,2496;Inherit;False;Property;_GradeOffset;Grade Offset;29;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-13904,2416;Inherit;False;Property;_GradeScale;Grade Scale;28;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-13936,2336;Inherit;False;Property;_DepthExponential;Depth Exponential;26;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-13904,2256;Inherit;False;Property;_DepthDistance;Depth Distance;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1876;-15760,544;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1878;-15728,736;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1879;-15728,832;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1875;-15728,448;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1874;-15760,352;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1877;-15760,640;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1880;-15792,272;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ProjectionParams;339;-13632,2512;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;428;-13696,2336;Inherit;False;BUDUDepthFade;-1;;410;47987ecf53b4f2847a33a9193dc9d94e;0;5;18;FLOAT;1;False;19;FLOAT;1;False;20;FLOAT;1;False;21;FLOAT;0;False;22;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;342;-13568,2848;Inherit;False;Property;_DepthSize;Depth Size;31;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;341;-13632,2672;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;415;-15568,448;Inherit;False;Property;_DeformMixType;DeformMixType;34;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;None;OneNoise;Multiply;Add;Subtract;Divide;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;340;-13392,2384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;343;-13376,2672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1013;-10048,10528;Inherit;False;Property;_NormNoiseBOverScrSpeed;NormNoiseBOverScrSpeed;187;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1012;-10048,10448;Inherit;False;Property;_NormVorBSpeedX;NormVorBSpeedX;198;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1014;-10048,10608;Inherit;False;Property;_NormVorBSpeedY;NormVorBSpeedY;200;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1015;-10064,9120;Inherit;False;Property;_NormVorASpeedX;NormVorASpeedX;164;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1016;-10064,9280;Inherit;False;Property;_NormVorASpeedY;NormVorASpeedY;165;0;Create;True;0;0;0;False;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1019;-10064,9200;Inherit;False;Property;_NormNoiseAOverScrSpeed;NormNoiseAOverScrSpeed;149;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;1882;-15312,416;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1883;-15312,528;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;344;-13216,2512;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1017;-9760,10448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1018;-9760,10592;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1021;-9776,9264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1020;-9776,9120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1886;-15088,656;Inherit;False;Property;_DeformFinalContrast;DeformFinalContrast;110;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1887;-15088,736;Inherit;False;Property;_DeformFinalBias;DeformFinalBias;112;0;Create;True;0;0;0;False;0;False;-1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1884;-15088,432;Inherit;True;Property;_DeformGradeType;DeformGradeType;98;0;Create;True;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;336;-13056,2464;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;337;-13056,2576;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;-9616,10896;Inherit;False;Property;_NormTypeBRotSpeed;NormTypeBRotSpeed;202;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1037;-9600,9536;Inherit;False;Property;_NormTypeARotSpeed;NormTypeARotSpeed;168;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1022;-9600,10464;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1023;-9600,10592;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1686;-9696,10704;Inherit;False;Property;_NormVorBOffsetY;NormVorBOffsetY;274;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1685;-9696,10368;Inherit;False;Property;_NormVorBOffsetX;NormVorBOffsetX;272;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1688;-9696,9376;Inherit;False;Property;_NormVorAOffsetY;NormVorAOffsetY;273;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1687;-9696,9040;Inherit;False;Property;_NormVorAOffsetX;NormVorAOffsetX;268;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1024;-9600,9152;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1025;-9600,9232;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1885;-14800,432;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;338;-12832,2496;Inherit;False;Property;_DepthGradeType;DepthGradeType;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;1044;-9344,9536;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1534;-9440,9616;Inherit;False;Property;_NormARot;NormARot;248;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;910;-11568,304;Inherit;False;Constant;_Zero1;[Zero];19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1046;-9360,10896;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1530;-9456,10976;Inherit;False;Property;_NormBRot;NormBRot;249;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1683;-9408,10464;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1684;-9408,10560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1028;-9600,10208;Inherit;False;Property;_NormVorBTileX;NormVorBTileX;195;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1029;-9600,10288;Inherit;False;Property;_NormVorBTileY;NormVorBTileY;197;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1027;-9520,8880;Inherit;False;Property;_NormVorATileX;NormVorATileX;159;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1026;-9520,8960;Inherit;False;Property;_NormVorATileY;NormVorATileY;161;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1689;-9408,9136;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1690;-9408,9232;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;447;-14576,432;Inherit;False;NoiseTypeRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;156;-12576,2496;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;1651;-13952,1632;Inherit;True;Property;_FlowMap;FlowMap;266;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;1d41051305d87384b8bdc4eb5a92e448;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;1035;-9312,9376;Inherit;False;Property;_NormTypeAAnchorX;NormTypeAAnchorX;173;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1036;-9312,9456;Inherit;False;Property;_NormTypeAAnchorY;NormTypeAAnchorY;177;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1038;-9328,10736;Inherit;False;Property;_NormTypeBAnchorX;NormTypeBAnchorX;203;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1039;-9328,10816;Inherit;False;Property;_NormTypeBAnchorY;NormTypeBAnchorY;205;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1535;-9152,9616;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1536;-9152,9536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;911;-11360,304;Inherit;False;Zero;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1531;-9168,10976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1533;-9168,10896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1030;-9280,10480;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1033;-9408,10240;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1034;-9280,9136;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1032;-9312,8928;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1436;-9936,9856;Inherit;False;Property;_DeformNormScale;DeformNormScale;144;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1435;-9872,9776;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;924;-12416,2576;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1652;-13712,1632;Inherit;True;Property;_TextureSample0;Texture Sample 0;250;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode;1042;-9088,9040;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1045;-9024,9408;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1043;-9104,10352;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1047;-9040,10768;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1537;-8992,9536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1532;-9008,10896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1437;-9648,9824;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;-0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1438;-9616,9744;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;926;-12272,2576;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;930;-12416,2656;Inherit;False;Property;_EdgeControl;Edge Control;212;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;448;-15296,5712;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-15296,5792;Inherit;False;Property;_NoiseGradeScale;Noise Grade Scale;36;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;322;-15296,5872;Inherit;False;Property;_NoiseGradeOffset;Noise Grade Offset;39;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;1930;-13424,1728;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1929;-13424,1632;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1048;-9152,8768;Inherit;False;Property;_NormVorAAngle;NormVorAAngle;157;0;Create;True;0;0;0;False;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1051;-9168,10112;Inherit;False;Property;_NormVorBAngle;NormVorBAngle;191;0;Create;True;0;0;0;False;0;False;8;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1053;-8864,9392;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1054;-8864,10752;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1439;-9424,9776;Inherit;False;Property;_DeformNormToggle;DeformNormToggle;146;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;927;-12128,2576;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;10;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1712;-15120,6256;Inherit;False;Property;_FoamOverallSpeed;FoamOverallSpeed;152;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;391;-15088,6352;Inherit;False;Property;_FoamSpeedY;FoamSpeedY;23;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-15088,6176;Inherit;False;Property;_FoamSpeedX;FoamSpeedX;22;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1709;-15088,5360;Inherit;False;Property;_WaveOverallSpeed;WaveOverallSpeed;150;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;330;-15056,5280;Inherit;False;Property;_WaveSpeedX;WaveSpeedX;9;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;376;-15056,5440;Inherit;False;Property;_WaveSpeedY;WaveSpeedY;10;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;325;-15072,5760;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1931;-13200,1664;Inherit;False;Property;_FlowMapGrade;FlowMapGrade;305;0;Create;True;0;0;0;False;0;False;0;2;2;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;1058;-8864,10112;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1055;-8864,8768;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1380;-9152,8864;Inherit;False;Property;_NormVorASmooth;NormVorASmooth;237;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-9088,9264;Inherit;False;Property;_NormPerlinAScale;NormPerlinAScale;128;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1383;-9168,10208;Inherit;False;Property;_NormVorBSmooth;NormVorBSmooth;240;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1052;-9104,10544;Inherit;False;Property;_NormNoiseBScale;NormNoiseBScale;189;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1384;-9104,10624;Inherit;False;Property;_NormPerlinBScale;NormPerlinBScale;127;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1049;-9088,9184;Inherit;False;Property;_NormNoiseAScale;NormNoiseAScale;155;0;Create;True;0;0;0;False;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1446;-8736,10368;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1445;-8704,9104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-14496,5072;Inherit;False;Property;_ShoreTileX;ShoreTileX;7;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;314;-14496,5152;Inherit;False;Property;_ShoreTileY;ShoreTileY;8;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-14560,6016;Inherit;False;Property;_FoamTileY;FoamTileY;18;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-14560,5936;Inherit;False;Property;_FoamTileX;FoamTileX;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1714;-14896,6288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1713;-14896,6192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1710;-14864,5296;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1711;-14864,5392;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1736;-14864,5760;Inherit;False;NoiseDefSclOff_Ref;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;451;-11984,2576;Inherit;False;DepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1654;-12960,1664;Inherit;False;FlowMapRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1057;-8832,10592;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1056;-8848,9232;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2038;-8576,8992;Inherit;False;BUDUVoronoi;-1;;411;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2039;-8592,10352;Inherit;False;BUDUVoronoi;-1;;412;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2044;-8592,10096;Inherit;False;BUDUVoronoiCell;-1;;413;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2045;-8576,8736;Inherit;False;BUDUVoronoiCell;-1;;414;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.RangedFloatNode;1729;-14240,6272;Inherit;False;Property;_FoamRotateSpeed;FoamRotateSpeed;284;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;315;-14288,5088;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1655;-14400,4976;Inherit;False;1654;FlowMapRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;453;-14400,4896;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;388;-14400,5984;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1725;-14224,5712;Inherit;False;Property;_WaveRotateSpeed;WaveRotateSpeed;286;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;386;-14736,6208;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;392;-14736,6288;Inherit;False;1;0;FLOAT;0.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1705;-14832,6112;Inherit;False;Property;_FoamOffsetX;FoamOffsetX;276;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1708;-14832,6400;Inherit;False;Property;_FoamOffsetY;FoamOffsetY;275;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;329;-14720,5312;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;378;-14720,5392;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1699;-14816,5200;Inherit;False;Property;_WaveOffsetX;WaveOffsetX;278;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1700;-14816,5520;Inherit;False;Property;_WaveOffsetY;WaveOffsetY;277;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1737;-14384,5216;Inherit;False;1736;NoiseDefSclOff_Ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1738;-14480,5856;Inherit;False;1736;NoiseDefSclOff_Ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1065;-8240,8640;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1060;-8592,9248;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1061;-8608,10608;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1382;-8336,10096;Inherit;False;Property;_Norm_VorCell_B_Type;Norm_VorCell_B_Type;228;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1326;-8368,10352;Inherit;False;Property;_Norm_VorCausric_B_Type;Norm_VorCausric_B_Type;233;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1059;-8240,10016;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1379;-8336,8736;Inherit;False;Property;_Norm_VorCell_A_Type;Norm_VorCell_A_Type;232;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1325;-8352,8992;Inherit;False;Property;_Norm_VorCaustic_A_Type;Norm_VorCaustic_A_Type;227;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1062;-8672,10832;Inherit;True;Property;_NormNoiseBMap;NormNoiseBMap;180;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1063;-8640,9472;Inherit;True;Property;_NormNoiseAMap;NormNoiseAMap;134;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleTimeNode;1730;-14032,6272;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1731;-14128,6192;Inherit;False;Property;_FoamRotate;FoamRotate;287;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;346;-14112,5104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;917;-14208,5856;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;634;-14176,5968;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1704;-14208,4912;Inherit;False;Property;_WaveFlowType;WaveFlowType;279;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;DepthMap;FlowMap;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleTimeNode;1726;-14016,5712;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1723;-14112,5632;Inherit;False;Property;_WaveRotate;WaveRotate;285;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1706;-14544,6176;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1707;-14544,6288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1701;-14544,5280;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1702;-14544,5392;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1067;-8000,10368;Inherit;False;Property;_NormNoiseTypeB;NormNoiseTypeB;91;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1745;-7728,10448;Inherit;False;Property;_NormB_Contrast;NormB_Contrast;291;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1720;-13872,6016;Inherit;False;Property;_FoamAnchorX;FoamAnchorX;282;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1722;-13872,6096;Inherit;False;Property;_FoamAnchorY;FoamAnchorY;283;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1733;-13840,6192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1734;-13840,6272;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;333;-13904,5072;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;918;-14048,5872;Inherit;False;Property;_AffectFoamDeformation;AffectFoamDeformation;207;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1717;-13856,5472;Inherit;False;Property;_WaveAnchorX;WaveAnchorX;280;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1718;-13856,5552;Inherit;False;Property;_WaveAnchorY;WaveAnchorY;281;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1727;-13824,5632;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1728;-13824,5712;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;393;-14432,6224;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;377;-14432,5328;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;2025;-7504,10368;Inherit;False;BUDUContrast;-1;;416;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;179;-13728,5344;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;384;-13744,5872;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1721;-13680,6048;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1732;-13648,6208;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1719;-13664,5504;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1724;-13632,5648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1070;-7296,10368;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;1716;-13472,5424;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1715;-13472,5872;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LinearToGammaNode;1072;-7136,10368;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;380;-13280,5872;Inherit;True;Property;_FoamTexture;Foam Texture;15;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;136144d880a69254ea8b2d639e2fe9c5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;64;-13280,5424;Inherit;True;Property;_ShoreTexture;Shore Texture;5;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;c662692ad44de0b45ba4f81297e97381;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;1073;-6896,10448;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;383;-12768,5424;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;409;-12768,5872;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1077;-6736,10480;Inherit;False;Property;_NormNoiseTypeBExponential;NormNoiseTypeBExponential;186;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1076;-6704,10368;Inherit;False;Property;_NormNoiseBInvert;NormNoiseBInvert;181;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;411;-12608,5904;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;371;-12608,5472;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;1080;-6464,10368;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;410;-12448,5824;Inherit;True;Property;_InvertFoamTexture;Invert Foam Texture;16;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;424;-12416,6048;Inherit;False;Property;_FoamGradeScale;Foam Grade Scale;20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;425;-12416,6128;Inherit;False;Property;_FoamGradeOffset;Foam Grade Offset;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-12416,5616;Inherit;False;Property;_ShoreGradeScale;Shore Grade Scale;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;362;-12416,5696;Inherit;False;Property;_ShoreGradeOffset;Shore Grade Offset;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;372;-12448,5392;Inherit;True;Property;_InvertShoreTexture;Invert Shore Texture;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1186;-10720,2720;Inherit;False;Property;_FogGradeExponential;FogGradeExponential;218;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1185;-10688,2640;Inherit;False;Property;_FogDepthOffset;Fog Depth Offset;222;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1184;-10688,2560;Inherit;False;Property;_FogDepthScale;Fog Depth Scale;221;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1183;-10720,2480;Inherit;False;Property;_FogDepthExponential;Fog Depth Exponential;220;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1181;-10688,2400;Inherit;False;Property;_FogDepthDistance;Fog Depth Distance;219;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1084;-6096,9600;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1085;-6128,9488;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1081;-6128,9728;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1082;-6128,9840;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;1083;-6096,9968;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1614;-6160,9392;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;426;-12192,5824;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;353;-12192,5392;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;10;False;2;FLOAT;-1.49;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1180;-10448,2448;Inherit;False;BUDUDepthFade;-1;;417;47987ecf53b4f2847a33a9193dc9d94e;0;5;18;FLOAT;1;False;19;FLOAT;1;False;20;FLOAT;1;False;21;FLOAT;0;False;22;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1086;-5968,9600;Inherit;False;Property;_NormNoiseMixType;NormNoiseMixType;95;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;7;None;OneNoise;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1430;-11904,5696;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1676;-11872,5808;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1680;-11872,5920;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;1188;-10160,2528;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1187;-10160,2416;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;1087;-5680,9584;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;1088;-5680,9696;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;404;-12416,2496;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1428;-11904,5360;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1677;-11872,5472;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1429;-11904,5584;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1678;-11744,5712;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1679;-11744,5824;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1681;-11744,5936;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1189;-9936,2448;Inherit;False;Property;_FogDepthGradeType;FogDepthGradeType;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1091;-5456,9600;Inherit;True;Property;_NormNoiseGradeType;NormNoiseGradeType;99;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1089;-5456,9824;Inherit;False;Property;_NormNoiseFinalScale;NormNoiseFinalScale;111;0;Create;True;0;0;0;False;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1090;-5456,9904;Inherit;False;Property;_NormNoiseFinalOffset;NormNoiseFinalOffset;113;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1433;-11504,5504;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1432;-11568,5584;Inherit;False;Property;_FoamBlendType;FoamBlendType;141;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;7;None;Add;Multiply;Subtract;Divide;FMod;FModOpposite;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;-11984,2496;Inherit;False;SaturateDepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1190;-9664,2448;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1092;-5168,9600;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1093;-5168,9744;Inherit;False;Property;_NormNoiseContrast;NormNoiseContrast;100;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1503;-5200,9424;Inherit;False;450;SaturateDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1434;-11312,5584;Inherit;False;Property;_ShoreToggle;ShoreToggle;129;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1192;-9504,2448;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1512;-9536,2368;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2028;-4928,9600;Inherit;False;BUDUContrast;-1;;418;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1095;-4720,9600;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1097;-4800,9904;Inherit;False;Property;_NormNoiseGradeOffset;NormNoiseGradeOffset;104;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1096;-4800,9824;Inherit;False;Property;_NormNoiseGradeScale;NormNoiseGradeScale;103;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1661;-5008,9344;Inherit;False;1654;FlowMapRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1662;-4992,9456;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;455;-11088,5584;Inherit;False;ShoreTextureRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1511;-9344,2416;Inherit;False;Property;_FogToggle;FogToggle;254;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1098;-4528,9600;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1242;-4784,9264;Inherit;False;Property;_ShoreBumpIntensity;Shore Bump Intensity;224;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1496;-4720,9344;Inherit;False;455;ShoreTextureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1663;-4752,9424;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1193;-9104,2448;Inherit;False;FogDepthRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1100;-4528,9744;Inherit;False;Property;_MiddleBumpIntensity;Middle Bump Intensity;211;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1334;-7360,2528;Inherit;False;1193;FogDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1241;-4464,9312;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;1,0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1102;-4256,9600;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1335;-7152,2528;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1340;-7248,2624;Inherit;False;Property;_EdgeWaveExponential;EdgeWaveExponential;236;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1244;-4080,9552;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;1338;-6992,2528;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1336;-7056,2704;Inherit;False;Property;_EdgeWaveMultiplier;EdgeWaveMultiplier;235;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1099;-3920,9456;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1341;-6832,2528;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1247;-2864,9456;Inherit;False;WaveGradRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1339;-6608,2448;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1331;-6672,2368;Inherit;False;1247;WaveGradRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1349;-6448,2368;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1333;-6480,2528;Inherit;False;Property;_WaveLength;WaveLength;234;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1350;-6288,2368;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;1343;-6320,2608;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1344;-6128,2368;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1404;-6160,2288;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1405;-5984,2320;Inherit;False;Property;_Displacement;Displacement;241;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;959;-7072,-2304;Inherit;False;Property;_TransparentIntensity;Transparent Intensity;13;0;Create;True;0;0;0;False;0;False;1;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1354;-5760,2320;Inherit;False;Vertex Offset;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1143;-6656,-2368;Inherit;False;TransIntensityRef;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1750;-13184,5632;Inherit;False;Property;_WaveContrast;WaveContrast;292;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1752;-13184,6080;Inherit;False;Property;_FoamContrast;FoamContrast;293;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;909;-11360,224;Inherit;False;One;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;954;-7280,-2352;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.7;False;4;FLOAT;1.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;956;-6368,-2768;Inherit;False;RefractionRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;968;-7648,-2576;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;970;-7440,-2544;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;1129;-7392,3488;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;1125;-7136,3360;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1126;-7136,3248;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;1130;-7200,3488;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;1120;-6976,3296;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;1113;-6944,3664;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1119;-6720,3504;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;1117;-6496,3664;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-10;False;2;FLOAT;10;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1118;-6544,3504;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1116;-6016,3504;Inherit;False;BumpForSmooth;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;991;-9072,-720;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;992;-9328,-592;Inherit;True;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;996;-10192,-816;Inherit;True;1003;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;997;-10176,-560;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;951;-7104,-2720;Inherit;False;Property;_RefractColor;Refract Color;61;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;955;-7552,-2320;Inherit;False;Property;_ScreenContrast;ScreenContrast;35;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;967;-7904,-2576;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1121;-7296,3216;Inherit;False;Property;_SSTileX;SSTileX;85;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-7296,3280;Inherit;False;Property;_SSTileY;SSTileY;90;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1123;-7296,3344;Inherit;False;Property;_SSOffX;SSOffX;92;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1124;-7296,3408;Inherit;False;Property;_SSOffY;SSOffY;94;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1131;-6912,3568;Inherit;False;Property;_SSSize;SSSize;58;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1114;-7216,3664;Inherit;False;Property;_PatternRotator;PatternRotator;62;0;Create;True;0;0;0;False;0;False;0;0;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1115;-6768,3664;Inherit;False;Property;_PatternHeight;PatternHeight;60;0;Create;True;0;0;0;False;0;False;0.1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;-11568,224;Inherit;False;Constant;_One1;[One];20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;606;-13648,-3648;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;969;-7872,-2368;Inherit;False;1002;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;957;-6784,-2528;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1505;-6800,-2768;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;958;-6608,-2768;Inherit;False;Property;_RefractionToggle;RefractionToggle;67;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;1254;-7488,-1536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1256;-7056,-1648;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1257;-6544,-1648;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1264;-6320,-1216;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1278;-7360,-1376;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1279;-7216,-1424;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1265;-6624,-1728;Inherit;False;Property;_ReflectionStrength;Reflection Strength;49;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1266;-6784,-1456;Inherit;False;Property;_ReflectColor;Reflect Color;38;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1277;-7632,-1376;Inherit;False;Property;_CMYPos;CM Y Pos;12;0;Create;True;0;0;0;False;0;False;0;0;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1276;-7632,-1296;Inherit;False;Property;_CMZPos;CM Z Pos;24;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector;1260;-7568,-1776;Inherit;True;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1269;-6624,-1216;Inherit;False;Property;_ReflectionMultiplier;Reflection Multiplier;192;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1267;-6528,-1136;Inherit;False;909;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1258;-7760,-1536;Inherit;False;Property;_CubeMapRotate;Cube Map Rotate;27;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1275;-7632,-1456;Inherit;False;Property;_CMXPos;CM X Pos;19;0;Create;True;0;0;0;False;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;998;-9696,-720;Float;True;NormalViewDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;994;-8832,-720;Float;True;NormalLightDirection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1522;-8048,9360;Inherit;False;Noise_A_UV;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1523;-8064,10752;Inherit;False;Noise_B_UV;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenColorNode;948;-7312,-2544;Inherit;False;Global;_GrabScreen0;Grab Screen 0;11;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StickyNoteNode;1601;-3712,528;Inherit;False;506.6663;236.6666;DEVAM;DEVAM;1,0,0,1;* Flow Map ayarlarini yap (lineer / gamma / exponential)$* Middle Wave Flow Map inversini ayarla$* Shore Settingsde Tile taraflarinda Global Speed yap$* Flow Map'i secimli yap (Depth | Flow Map)$* Flow Map secildiginde gerekli depth kisimlari kapansin onun yerine flow map in maske ayarlari gelsin$* OK - Specular tamamlandi$* OK - Flow Map tamamlandi$* Vertex Ofset uzerinden Displacement kisimlarini duzenle$;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1602;-6112,-1056;Inherit;False;1002;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;1600;-6112,-1248;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;1603;-5856,-1248;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1607;-5712,-1040;Inherit;False;Property;_MirrorRefIntensity;MirrorRefIntensity;260;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1608;-5376,-1168;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1273;-4464,-1760;Inherit;False;Reflect;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1272;-4704,-1760;Inherit;False;Property;_Reflect;Reflect;56;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1262;-4912,-1824;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1609;-4864,-1728;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1613;-5488,-1584;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1611;-5248,-1728;Inherit;False;Property;_CMReflect;CMReflect;263;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1411;-3024,1712;Inherit;False;1354;Vertex Offset;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;1513;-11584,464;Inherit;False;Property;_SurfaceMapA;SurfaceMapA;108;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1514;-11584,544;Inherit;False;Property;_SurfaceMapB;SurfaceMapB;114;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1453;-11584,624;Inherit;False;Property;_AShoreFold;AShoreFold;109;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1454;-11584,704;Inherit;False;Property;_AFoamFold;AFoamFold;115;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1457;-11568,784;Inherit;False;Property;_NoiseFold;NoiseFold;125;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1527;-11584,944;Inherit;False;Property;_NormMapBFold;NormMapBFold;118;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1526;-11584,864;Inherit;False;Property;_NormMapAFold;NormMapAFold;117;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ColorNode;349;-13712,-3840;Inherit;False;Property;_SurfaceColor;Surface Color;4;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1484;-14368,-3744;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1485;-14368,-3360;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1481;-14768,-3728;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;1480;-14768,-3232;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1486;-14672,-3648;Inherit;False;Property;_SurfaceCMapAIntensity;SurfaceCMapAIntensity;245;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1483;-14608,-3808;Inherit;False;Property;_SurfaceCMapAInv;SurfaceCMapAInv;244;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1487;-14672,-3392;Inherit;False;Property;_SurfaceCMapBIntensity;SurfaceCMapBIntensity;246;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1482;-14608,-3296;Inherit;False;Property;_SurfaceCMapBInv;SurfaceCMapBInv;243;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;465;-15616,-3808;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;597;-15632,-3296;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1643;-15104,-3296;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1645;-15360,-3088;Inherit;False;Property;_SurfaceCBScale;SurfaceCBScale;265;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;596;-15424,-3296;Inherit;True;Property;_ShoreT1;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1127;-6304,3504;Inherit;True;Property;_BluricRefractionPattern;Bluric Refraction Pattern;57;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode;1494;-15648,-3488;Inherit;True;Property;_SurfaceColorMapB;Surface Color Map B;64;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;579;-15648,-4016;Inherit;True;Property;_SurfaceColorMapA;Surface Color Map A;63;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ToggleSwitchNode;1605;-5232,-1248;Inherit;False;Property;_MirrorReflect;MirrorReflect;259;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StickyNoteNode;1675;-5744,-1424;Inherit;False;190.6665;148;New Note;;1,1,1,1;Reflection Map $Gloal olmak zorunda! Yoksa mirror buraya map atayamiyor.$$;0;0
Node;AmplifyShaderEditor.ColorNode;1610;-5520,-1440;Inherit;False;Property;_MirrorRefColor;MirrorRefColor;262;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1109;-3088,1392;Inherit;False;Property;_Smoothness;Smoothness;214;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-3088,1632;Inherit;False;Property;_ClipThreshold;ClipThreshold;32;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;845;-9136,6512;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;852;-9088,6832;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;856;-8896,6800;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;1618;-9216,7040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1619;-9216,6960;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1620;-9056,6960;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1616;-9408,6960;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;837;-9296,6640;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;824;-9760,6624;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;825;-9760,6736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;832;-9616,6640;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;833;-9616,6736;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;835;-9344,6416;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;859;-8912,6352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1448;-8880,6496;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;860;-8944,6064;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;864;-8288,5984;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1693;-9424,6624;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1694;-9424,6720;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;836;-9280,5248;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;834;-9280,5008;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;822;-9760,5184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;823;-9760,5344;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;830;-9616,5184;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;831;-9616,5344;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1698;-9424,5328;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1697;-9424,5184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1621;-9376,5536;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1622;-9184,5616;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1442;-9344,5808;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;-0.5;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1443;-9312,5728;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;458;-15424,-3808;Inherit;True;Property;_ShoreT;ShoreT;53;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1644;-15360,-3600;Inherit;False;Property;_SurfaceCAScale;SurfaceCAScale;264;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1642;-15104,-3808;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1103;-2864,9552;Inherit;False;WaveNormalRef;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1521;-3104,9552;Inherit;False;Property;_NormalTxt;NormalTxt;255;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;1545;-3376,9824;Inherit;True;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1525;-5152,10576;Inherit;False;1523;Noise_B_UV;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1541;-5024,10144;Inherit;False;Property;_NrmAInt;NrmAInt;256;0;Create;True;0;0;0;False;0;False;0.3;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1558;-4736,10144;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1559;-4720,10752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1544;-4992,10752;Inherit;False;Property;_NrmBInt;NrmBInt;257;0;Create;True;0;0;0;False;0;False;0.3;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1543;-4592,10544;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1540;-4592,10240;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1555;-4208,10320;Inherit;False;Property;_NormalMix;NormalMix;258;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;6;First;Blend;Add;Subtract;Multiply;Divide;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;1520;-4432,10352;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1551;-4336,10448;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1553;-4368,10544;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1550;-4368,10640;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1552;-4368,10736;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;1566;-3984,10304;Inherit;False;Object;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;1516;-4896,10336;Inherit;True;Property;_NormalAMap;NormalAMap;135;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;9a4a55d8d2e54394d97426434477cdcf;9a4a55d8d2e54394d97426434477cdcf;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1517;-4896,10544;Inherit;True;Property;_NormalBMap;NormalBMap;179;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;302951faffe230848aa0d3df7bb70faa;302951faffe230848aa0d3df7bb70faa;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1557;-4144,10208;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1549;-3920,9824;Inherit;True;Normal From Height;-1;;419;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;10;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;1510;-4144,9824;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-50;False;4;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;872;-7264,6480;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;875;-6864,6560;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;882;-6432,6480;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;873;-7104,6480;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;871;-7248,4880;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;876;-6832,4944;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;881;-6400,4880;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;887;-6080,5472;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;886;-6048,5584;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;883;-6080,5696;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;884;-6080,5808;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;885;-6048,5920;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;894;-5136,5664;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;929;-4112,5664;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;907;-4272,5664;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;900;-4496,5664;Inherit;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1467;-4144,5568;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1468;-3952,5664;Inherit;False;Property;_MiddleWave;MiddleWave;126;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;617;-16112,-2960;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;618;-15936,-2960;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1489;-15936,-3040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1490;-15776,-3008;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1488;-16208,-3040;Inherit;False;Property;_SurfaceCBRot;SurfaceC B Rot;247;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-16368,-2960;Inherit;False;Property;_SurfaceCBRotSpeed;SurfaceC B Rot Speed;77;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;599;-15872,-3344;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;619;-15808,-3184;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;620;-16048,-3120;Inherit;False;Property;_SurfaceCBAnchorY;SurfaceC B Anchor Y;79;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;621;-16048,-3200;Inherit;False;Property;_SurfaceCBAnchorX;SurfaceC B Anchor X;78;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;588;-15920,-3648;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1492;-15920,-3568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1493;-15776,-3648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;474;-16096,-3648;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;-16336,-3648;Inherit;False;Property;_SurfaceCARotSpeed;SurfaceC A Rot Speed;65;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1491;-16192,-3568;Inherit;False;Property;_SurfaceCARot;SurfaceC A Rot;252;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;464;-15872,-3952;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;4,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;585;-15808,-3792;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;586;-16048,-3808;Inherit;False;Property;_SurfaceCAAnchorX;SurfaceC A Anchor X;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;587;-16048,-3728;Inherit;False;Property;_SurfaceCAAnchorY;SurfaceC A Anchor Y;68;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1764;-16560,-3504;Inherit;False;SurfaceC_TB_Ref;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;459;-13472,-3744;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-13056,-3744;Inherit;False;SurfaceRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;863;-8208,4560;Inherit;False;913;Gray;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;844;-9104,5024;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;850;-9056,5392;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;858;-8880,5184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;1623;-9184,5536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1624;-9024,5536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1447;-8720,5104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleTimeNode;857;-8816,4640;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;855;-8880,5376;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GammaToLinearNode;889;-5648,5648;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;890;-5648,5760;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;1425;-11344,464;Inherit;False;Property;_DepthSettings;DepthSettings;107;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1763;-16560,-3616;Inherit;False;SurfaceC_TA_Ref;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;506;-16032,-4032;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;504;-16256,-4048;Inherit;False;Property;_SurfaceCATileX;SurfaceC A Tile X;69;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;-16256,-3968;Inherit;False;Property;_SurfaceCATileY;SurfaceC A Tile Y;70;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;609;-16032,-3408;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1476;-16688,-3616;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1477;-16688,-3504;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;610;-16256,-3440;Inherit;False;Property;_SurfaceCBTileX;SurfaceC B Tile X;80;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;611;-16256,-3360;Inherit;False;Property;_SurfaceCBTileY;SurfaceC B Tile Y;81;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1479;-17168,-3600;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1471;-17424,-3440;Inherit;False;Property;_SurfaceDeformScale;Surface Deform Scale;37;0;Create;True;0;0;0;False;0;False;0.3;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1919;-17136,-3504;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1478;-16976,-3552;Inherit;False;Property;_SurfaceDeformation;SurfaceDeformation;242;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1760;-16992,-3104;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1758;-16992,-3296;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;614;-17184,-3264;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1761;-17216,-3008;Inherit;False;Property;_SurfaceCBOffsetY;SurfaceC B Offset Y;74;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1759;-17216,-3328;Inherit;False;Property;_SurfaceCBOffsetX;SurfaceC B Offset X;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;615;-17184,-3104;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1639;-17328,-3104;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1638;-17328,-3264;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;612;-17552,-3264;Inherit;False;Property;_SurfaceCBSpeedX;SurfaceC B Speed X;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;613;-17552,-3104;Inherit;False;Property;_SurfaceCBSpeedY;SurfaceC B Speed Y;83;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1635;-17584,-3168;Inherit;False;Property;_SurfCTypeBOverallSpeed;SurfCTypeBOverallSpeed;154;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;602;-16880,-3200;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;584;-17184,-3808;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;583;-17184,-3968;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1756;-17216,-4048;Inherit;False;Property;_SurfaceCAOffsetX;SurfaceC A Offset X;72;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1762;-17216,-3712;Inherit;False;Property;_SurfaceCAOffsetY;SurfaceC A Offset Y;75;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1636;-17328,-3968;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1637;-17328,-3808;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;581;-17552,-3968;Inherit;False;Property;_SurfaceCASpeedX;SurfaceC A Speed X;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;-17552,-3808;Inherit;False;Property;_SurfaceCASpeedY;SurfaceC A Speed Y;76;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1634;-17584,-3888;Inherit;False;Property;_SurfCTypeAOverallSpeed;SurfCTypeAOverallSpeed;153;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;580;-16880,-3904;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1754;-16992,-3984;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1755;-16992,-3808;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;622;-14176,-3728;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;624;-14176,-3616;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;625;-14176,-3504;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;-14160,-3840;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1650;-14160,-3392;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FmodOpNode;1767;-14160,-3280;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1353;-10256,1600;Inherit;False;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1142;-10416,1600;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1108;-10720,1664;Inherit;True;Property;_Specular;Specular;213;0;Create;True;0;0;0;False;0;False;0.5;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;1528;-11584,1104;Inherit;False;Property;_NormGenBFold;NormGenBFold;124;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1529;-11584,1024;Inherit;False;Property;_NormGenAFold;NormGenAFold;119;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1916;-11344,544;Inherit;False;Property;_DeformSettings;DeformSettings;122;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1450;-11344,944;Inherit;False;Property;_MiddleNAFold;MiddleNAFold;130;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1451;-11344,1024;Inherit;False;Property;_MiddleNBFold;MiddleNBFold;133;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1914;-11344,1104;Inherit;False;Property;_DeformAFold;DeformAFold;120;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1915;-11344,1184;Inherit;False;Property;_DeformBFold;DeformBFold;121;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;1932;-11360,624;Inherit;False;Property;_FlowMapSettings;FlowMapSettings;123;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;916;-4416,528;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1294;-4256,752;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1155;-4608,1056;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;413;-5056,592;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;373;-5568,576;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LinearToGammaNode;374;-5568,688;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;345;-4608,528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;925;-4592,768;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1499;-4784,592;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;456;-5856,624;Inherit;False;455;ShoreTextureRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1152;-4864,928;Inherit;False;Property;_FogColor;Fog Color;217;0;Create;True;0;0;0;False;0;False;0,0.5249081,0.6792453,1;0,0.5249081,0.6792453,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;973;-5008,1120;Inherit;False;956;RefractionRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1246;-4800,1120;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1248;-4864,1200;Inherit;False;1193;FogDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1280;-4640,1216;Inherit;False;1273;Reflect;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1162;-4432,1056;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1660;-5024,896;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1426;-13488,-3840;Inherit;False;911;Zero;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1422;-14208,-3920;Inherit;False;909;One;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;993;-9328,-816;Inherit;True;1003;NewNormals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;1128;-6976,3488;Inherit;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1138;-10208,96;Inherit;False;Property;_RefractSize;RefractSize;216;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1506;-9920,96;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-0.05;False;4;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1137;-9728,-144;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1006;-9568,-208;Inherit;False;Property;_Normal;Normal;3;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;1005;-9328,-128;Inherit;False;1;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1004;-9104,-208;Inherit;False;Property;_SSBluricTransparent;SS Bluric Transparent;96;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;1001;-8832,-208;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;1003;-8640,-208;Float;False;NewNormals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1002;-8640,-64;Inherit;False;NewObjectNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1110;-4448,9824;Inherit;False;Property;_NormalStrength;NormalStrength;215;0;Create;True;0;0;0;False;0;False;1;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;995;-9936,-720;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1936;-4944,352;Inherit;False;Property;_FlowMapToggle;FlowMapToggle;306;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;932;-10624,1584;Inherit;False;592;SurfaceRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1409;-2992,1312;Inherit;False;1353;Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;897;-4672,5664;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1440;-9568,5760;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1937;-3632,1472;Inherit;False;902;CausticAnimRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1144;-3024,1552;Inherit;False;1143;TransIntensityRef;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1950;-4864,10240;Inherit;False;Normal Reconstruct Z;-1;;420;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1951;-4848,10848;Inherit;False;Normal Reconstruct Z;-1;;421;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1952;-3728,10304;Inherit;False;Normal Reconstruct Z;-1;;422;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1953;-10032,-208;Inherit;False;Normal Reconstruct Z;-1;;423;63ba85b764ae0c84ab3d698b86364ae9;0;1;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1274;-7840,-1776;Inherit;True;1002;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1261;-6096,-1728;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1664;-5152,416;Inherit;False;1654;FlowMapRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;375;-5344,592;Inherit;True;Property;_TextureGradeType;TextureGradeType;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1498;-5056,672;Inherit;False;Property;_ShoreIntensity;ShoreIntensity;253;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1657;-5296,832;Inherit;False;1654;FlowMapRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;904;-4816,768;Inherit;False;902;CausticAnimRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;920;-5472,960;Inherit;False;451;DepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1659;-5280,976;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1195;-3024,1152;Inherit;False;1002;NewObjectNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1000;-9568,-96;Inherit;False;1116;BumpForSmooth;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1132;-9984,0;Inherit;False;1103;WaveNormalRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1107;-3920,9552;Inherit;True;Normal From Height;-1;;424;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;10;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1524;-5152,10368;Inherit;False;1522;Noise_A_UV;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2035;-7312,-1648;Inherit;False;BUDUComputeRotationY;-1;;425;735e1ea1387616c47955e6ec5703988c;0;2;4;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2040;-8640,6320;Inherit;False;BUDUVoronoi;-1;;426;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2046;-8640,6064;Inherit;False;BUDUVoronoiCell;-1;;428;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2047;-8576,4640;Inherit;False;BUDUVoronoiCell;-1;;429;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.GetLocalVarNode;1407;-3024,1232;Inherit;False;461;FinalCompRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;454;-5184,336;Inherit;False;450;SaturateDepthRef;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2026;-12992,5536;Inherit;False;BUDUContrast;-1;;430;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2027;-12976,6016;Inherit;False;BUDUContrast;-1;;431;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2029;-7072,-2512;Inherit;False;BUDUContrast;-1;;432;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2030;-7472,6480;Inherit;False;BUDUContrast;-1;;434;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2031;-4896,5664;Inherit;False;BUDUContrast;-1;;435;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1259;-6848,-1648;Inherit;True;Property;_ReflectMap;Reflect Map;33;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1595;-5728,-1248;Inherit;True;Global;_ReflectionMap;_ReflectionMap;261;0;Create;True;0;0;0;False;0;False;1595;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;1427;-13280,-3744;Inherit;False;Property;_SurfaceWaves;SurfaceWaves;145;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1423;-13984,-3648;Inherit;True;Property;_SurfaceTextureBlendingType;Surface Texture Blending Type;59;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;8;NoTexture;OneLayer;Multiply;Additive;Subtract;Divide;FMod;FModInvert;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2037;-17456,16;Inherit;False;BUDUVoronoi;-1;;436;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2043;-17456,-240;Inherit;False;BUDUVoronoiCell;-1;;437;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2036;-17440,1104;Inherit;False;BUDUVoronoi;-1;;438;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.FunctionNode;2042;-17440,832;Inherit;False;BUDUVoronoiCell;-1;;439;a1c0663be4dbfb34abb9199ce167171e;0;4;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;28;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.GetLocalVarNode;1848;-17920,32;Inherit;False;1834;DeformAScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1853;-17920,112;Inherit;False;1850;DeformASmooth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1854;-17888,240;Inherit;False;1806;DeformARef;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1766;-16096,-3888;Inherit;False;1763;SurfaceC_TA_Ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1765;-16096,-3280;Inherit;False;1764;SurfaceC_TB_Ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1473;-17360,-3520;Inherit;False;447;NoiseTypeRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;902;-3728,5664;Inherit;False;CausticAnimRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;461;-4128,752;Inherit;False;FinalCompRef;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1403;-3008,848;Inherit;False;592;SurfaceRef;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;928;-4400,5808;Inherit;False;Property;_MiddleWaveIntensity;Middle Wave Intensity;208;0;Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;898;-4720,5888;Inherit;False;Property;_DefNoiseGradeScale;DefNoiseGradeScale;102;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-4752,5968;Inherit;False;Property;_DefNoiseGradeOffset;DefNoiseGradeOffset;105;0;Create;True;0;0;0;True;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;895;-5136,5808;Inherit;False;Property;_DefNoiseContrast;DefNoiseContrast;101;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-5456,5888;Inherit;False;Property;_DefNoiseFinalScale;DefNoiseFinalScale;106;0;Create;True;0;0;0;True;0;False;1;0;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-5456,5968;Inherit;False;Property;_DefNoiseFinalOffset;DefNoiseFinalOffset;116;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;891;-5424,5664;Inherit;True;Property;_DefNoiseGradeType;DefNoiseGradeType;97;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;3;Linear;Normal;Gamma;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;888;-5904,5664;Inherit;False;Property;_DefNoiseMixType;DefNoiseMixType;93;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;5;Multiply;Add;Subtract;Divide;Dot;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;1396;-8336,4896;Inherit;False;Property;_Def_VorCaustic_A_Type;Def_VorCaustic_A_Type;223;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1395;-8304,4640;Inherit;False;Property;_Def_VorCell_A_Type;Def_VorCell_A_Type;229;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;869;-7984,4880;Inherit;False;Property;_NoiseTypeA;NoiseTypeA;88;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1746;-7696,4960;Inherit;False;Property;_NoiseA_Contrast;NoiseA_Contrast;289;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;874;-7072,4880;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2032;-7488,4880;Inherit;False;BUDUContrast;-1;;440;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;880;-6704,6592;Inherit;False;Property;_DefNoiseTypeBExponential;DefNoiseTypeBExponential;185;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1749;-7696,6608;Inherit;False;Property;_NoiseB_Contrast;NoiseB_Contrast;290;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;870;-8016,6480;Inherit;False;Property;_NoiseTypeB;NoiseTypeB;89;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1397;-8384,6064;Inherit;False;Property;_Def_VorCell_B_Type;Def_VorCell_B_Type;230;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Cell1;Cell2;Cell3;Cell4;Cell5;Cell6;Cell7;Cell8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;1398;-8384,6320;Inherit;False;Property;_Def_VorCaustic_B_Type;Def_VorCaustic_B_Type;226;0;Create;True;0;0;0;True;0;False;0;2;2;True;;KeywordEnum;8;Caustic1;Caustic2;Caustic3;Caustic4;Caustic5;Caustic6;Caustic7;Caustic8;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;854;-9232,6064;Inherit;False;Property;_DefVorBAngle;DefVorBAngle;193;0;Create;True;0;0;0;True;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1394;-9232,6144;Inherit;False;Property;_DefVorBSmooth;DefVorBSmooth;239;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-9152,6320;Inherit;False;Property;_DefNoiseBScale;DefNoiseBScale;190;0;Create;True;0;0;0;True;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1391;-9152,6400;Inherit;False;Property;_DefPerlinBScale;DefPerlinBScale;131;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;828;-9552,6384;Inherit;False;Property;_DefVorBTileX;DefVorBTileX;194;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;829;-9552,6464;Inherit;False;Property;_DefVorBTileY;DefVorBTileY;196;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1691;-9712,6544;Inherit;False;Property;_DefVorBOffsetX;DefVorBOffsetX;269;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;818;-10032,6608;Inherit;False;Property;_DefVorBSpeedX;DefVorBSpeedX;199;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;819;-10032,6688;Inherit;False;Property;_DefNoiseTypeBOverallSpeed;DefNoiseTypeBOverallSpeed;188;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;817;-10032,6768;Inherit;False;Property;_DefVorBSpeedY;DefVorBSpeedY;201;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1692;-9712,6848;Inherit;False;Property;_DefVorBOffsetY;DefVorBOffsetY;270;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;843;-9312,6800;Inherit;False;Property;_DefTypeBAnchorX;DefTypeBAnchorX;204;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;842;-9312,6880;Inherit;False;Property;_DefTypeBAnchorY;DefTypeBAnchorY;206;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1682;-9616,6960;Inherit;False;Property;_DefTypeBRotSpeed;DefTypeBRotSpeed;167;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1617;-9504,7040;Inherit;False;Property;_DefTypeBRot;DefTypeBRot;250;0;Create;True;0;0;0;True;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;866;-8656,6576;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;862;-8704,6800;Inherit;True;Property;_DefNoiseBMap;DefNoiseBMap;178;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;861;-8624,5392;Inherit;True;Property;_DefNoiseAMap;DefNoiseAMap;136;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.NoiseGeneratorNode;865;-8576,5168;Inherit;True;Simplex3D;True;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2041;-8576,4896;Inherit;False;BUDUVoronoi;-1;;441;d36ede1ac9cbc874591daaa4f0f301b2;0;3;3;FLOAT2;0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;8;FLOAT;0;FLOAT;9;FLOAT;20;FLOAT;21;FLOAT;13;FLOAT;15;FLOAT;26;FLOAT;27
Node;AmplifyShaderEditor.RangedFloatNode;846;-9104,4640;Inherit;False;Property;_DefVorAAngle;DefVorAAngle;158;0;Create;True;0;0;0;True;0;False;0.1;0;-8;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1389;-9104,4720;Inherit;False;Property;_DefVorASmooth;DefVorASmooth;238;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;827;-9472,4976;Inherit;False;Property;_DefVorATileX;DefVorATileX;160;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-9472,5056;Inherit;False;Property;_DefVorATileY;DefVorATileY;162;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;847;-9104,5184;Inherit;False;Property;_DefNoiseAScale;DefNoiseAScale;156;0;Create;True;0;0;0;True;0;False;8;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;848;-9104,5264;Inherit;False;Property;_DefPerlinAScale;DefPerlinAScale;132;0;Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1695;-9712,5104;Inherit;False;Property;_DefVorAOffsetX;DefVorAOffsetX;267;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;816;-10048,5184;Inherit;False;Property;_DefVorASpeedX;DefVorASpeedX;163;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;821;-10048,5264;Inherit;False;Property;_DefNoiseTypeAOverallSpeed;DefNoiseTypeAOverallSpeed;151;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;820;-10048,5344;Inherit;False;Property;_DefVorASpeedY;DefVorASpeedY;166;0;Create;True;0;0;0;True;0;False;0;0;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;839;-9280,5360;Inherit;False;Property;_DefTypeAAnchorX;DefTypeAAnchorX;172;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;840;-9280,5440;Inherit;False;Property;_DefTypeAAnchorY;DefTypeAAnchorY;174;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1696;-9712,5456;Inherit;False;Property;_DefVorAOffsetY;DefVorAOffsetY;271;0;Create;True;0;0;0;True;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;838;-9584,5536;Inherit;False;Property;_DefTypeARotSpeed;DefTypeARotSpeed;169;0;Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1625;-9472,5616;Inherit;False;Property;_DefTypeARot;DefTypeARot;251;0;Create;True;0;0;0;True;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1441;-9632,5840;Inherit;False;Property;_DeformScale;DeformScale;143;0;Create;False;0;0;0;True;0;False;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;878;-6672,4992;Inherit;False;Property;_DefNoiseTypeAExponential;DefNoiseTypeAExponential;142;0;Create;True;0;0;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;877;-6640,4880;Inherit;False;Property;_DefNoiseAInvert;DefNoiseAInvert;139;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;879;-6672,6480;Inherit;False;Property;_DefNoiseBInvert;DefNoiseBInvert;184;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1444;-9120,5760;Inherit;False;Property;_DeformToggle;DeformToggle;147;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1068;-7984,9056;Inherit;False;Property;_NormNoiseTypeA;NormNoiseTypeA;84;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;VoronoiCell;VoronoiCaustic;Perlin;Texture;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1742;-7728,9136;Inherit;False;Property;_NormA_Contrast;NormA_Contrast;288;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2024;-7504,9056;Inherit;False;BUDUContrast;-1;;415;bbef371528583124ab5d8e8ec0c6a0f1;0;2;1;COLOR;0,0,0,0;False;3;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;1069;-7296,9056;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LinearToGammaNode;1071;-7136,9056;Inherit;False;3;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;1074;-6896,9120;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1075;-6704,9040;Inherit;False;Property;_NormNoiseAInvert;NormNoiseAInvert;140;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1078;-6736,9152;Inherit;False;Property;_NormNoiseTypeAExponential;NormNoiseTypeAExponential;148;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1079;-6464,9040;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1964;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1966;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1967;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1968;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1969;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1970;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1971;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1972;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1973;-2400,1248;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;New Amplify Shader;dcf3e680117c48a4cb69c2c58c49ec28;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1965;-2528,1120;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;19;BUDU Shaders/BWaterSurfaceEski;dcf3e680117c48a4cb69c2c58c49ec28;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=SimpleLit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;42;Lighting Model;1;638562811704710514;Workflow;0;0;Surface;1;638562810384336113;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;638563143681855284;Forward Only;1;638563143706380662;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;638562810458433399;  Use Shadow Threshold;0;0;Receive Shadows;1;638566203809555625;Receive SSAO;0;638563143823993041;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;638566279396307887;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;False;True;True;True;True;False;True;True;False;;False;0
WireConnection;1907;0;354;0
WireConnection;1907;1;1909;0
WireConnection;1908;0;1909;0
WireConnection;1908;1;401;0
WireConnection;1910;0;1809;0
WireConnection;1910;1;1912;0
WireConnection;1911;0;1912;0
WireConnection;1911;1;1810;0
WireConnection;1812;0;1911;0
WireConnection;1811;0;1910;0
WireConnection;355;0;1907;0
WireConnection;402;0;1908;0
WireConnection;1792;0;402;0
WireConnection;1792;1;1793;0
WireConnection;1791;0;1790;0
WireConnection;1791;1;355;0
WireConnection;1803;0;1800;0
WireConnection;1816;0;1812;0
WireConnection;1816;1;1814;0
WireConnection;1817;0;1813;0
WireConnection;1817;1;1811;0
WireConnection;1820;0;1815;0
WireConnection;403;0;1791;0
WireConnection;403;1;1792;0
WireConnection;162;0;159;0
WireConnection;162;1;161;0
WireConnection;1795;0;1803;0
WireConnection;1804;0;1801;0
WireConnection;1822;0;1817;0
WireConnection;1822;1;1816;0
WireConnection;1823;0;1818;0
WireConnection;1823;1;1819;0
WireConnection;1826;0;1820;0
WireConnection;1827;0;1821;0
WireConnection;293;0;162;0
WireConnection;293;1;403;0
WireConnection;1794;0;1797;0
WireConnection;1794;1;1798;0
WireConnection;1796;0;1795;0
WireConnection;1796;1;1804;0
WireConnection;1828;0;1823;0
WireConnection;1828;1;1822;0
WireConnection;1829;0;1824;0
WireConnection;1829;1;1825;0
WireConnection;1830;0;1826;0
WireConnection;1830;1;1827;0
WireConnection;1799;0;293;0
WireConnection;1799;1;1794;0
WireConnection;1799;2;1796;0
WireConnection;1843;0;1842;0
WireConnection;1831;0;1828;0
WireConnection;1831;1;1829;0
WireConnection;1831;2;1830;0
WireConnection;1844;0;1845;0
WireConnection;1806;0;1799;0
WireConnection;1834;0;327;0
WireConnection;1850;0;1849;0
WireConnection;1832;0;1831;0
WireConnection;1836;0;1913;0
WireConnection;1852;0;1851;0
WireConnection;1863;0;1864;0
WireConnection;1785;0;1847;0
WireConnection;913;0;912;0
WireConnection;1857;1;2036;0
WireConnection;1857;0;2036;9
WireConnection;1857;2;2036;20
WireConnection;1857;3;2036;21
WireConnection;1857;4;2036;13
WireConnection;1857;5;2036;15
WireConnection;1857;6;2036;26
WireConnection;1857;7;2036;27
WireConnection;1858;1;2042;0
WireConnection;1858;0;2042;9
WireConnection;1858;2;2042;20
WireConnection;1858;3;2042;21
WireConnection;1858;4;2042;13
WireConnection;1858;5;2042;15
WireConnection;1858;6;2042;26
WireConnection;1858;7;2042;27
WireConnection;1768;0;1854;0
WireConnection;1768;1;1848;0
WireConnection;1773;1;1854;0
WireConnection;1861;1;1867;0
WireConnection;1770;1;2043;0
WireConnection;1770;0;2043;9
WireConnection;1770;2;2043;20
WireConnection;1770;3;2043;21
WireConnection;1770;4;2043;13
WireConnection;1770;5;2043;15
WireConnection;1770;6;2043;26
WireConnection;1770;7;2043;27
WireConnection;1769;1;2037;0
WireConnection;1769;0;2037;9
WireConnection;1769;2;2037;20
WireConnection;1769;3;2037;21
WireConnection;1769;4;2037;13
WireConnection;1769;5;2037;15
WireConnection;1769;6;2037;26
WireConnection;1769;7;2037;27
WireConnection;1856;0;1867;0
WireConnection;1856;1;1865;0
WireConnection;1862;1;1855;0
WireConnection;1862;0;1858;0
WireConnection;1862;2;1857;0
WireConnection;1862;3;1856;0
WireConnection;1862;4;1861;0
WireConnection;1788;1;1774;0
WireConnection;1788;0;1770;0
WireConnection;1788;2;1769;0
WireConnection;1788;3;1768;0
WireConnection;1788;4;1773;0
WireConnection;1888;0;1788;0
WireConnection;1890;0;1862;0
WireConnection;1891;0;1862;0
WireConnection;1891;1;1890;0
WireConnection;1889;0;1788;0
WireConnection;1889;1;1888;0
WireConnection;2033;1;1891;0
WireConnection;2033;3;1872;0
WireConnection;2023;1;1889;0
WireConnection;2023;3;1871;0
WireConnection;1893;0;2023;0
WireConnection;1893;1;1892;0
WireConnection;1895;0;2033;0
WireConnection;1895;1;1894;0
WireConnection;1876;0;1893;0
WireConnection;1876;1;1895;0
WireConnection;1878;0;1893;0
WireConnection;1878;1;1895;0
WireConnection;1879;0;1895;0
WireConnection;1879;1;1893;0
WireConnection;1875;0;1893;0
WireConnection;1875;1;1895;0
WireConnection;1874;0;1893;0
WireConnection;1874;1;1895;0
WireConnection;1877;0;1893;0
WireConnection;1877;1;1895;0
WireConnection;428;18;93;0
WireConnection;428;19;89;0
WireConnection;428;20;90;0
WireConnection;428;21;91;0
WireConnection;428;22;92;0
WireConnection;415;1;1880;0
WireConnection;415;0;1893;0
WireConnection;415;2;1874;0
WireConnection;415;3;1875;0
WireConnection;415;4;1876;0
WireConnection;415;5;1877;0
WireConnection;415;6;1878;0
WireConnection;415;7;1879;0
WireConnection;340;0;428;0
WireConnection;340;1;339;1
WireConnection;343;0;341;4
WireConnection;343;1;342;0
WireConnection;1882;0;415;0
WireConnection;1883;0;415;0
WireConnection;344;0;343;0
WireConnection;344;1;340;0
WireConnection;1017;0;1012;0
WireConnection;1017;1;1013;0
WireConnection;1018;0;1014;0
WireConnection;1018;1;1013;0
WireConnection;1021;0;1016;0
WireConnection;1021;1;1019;0
WireConnection;1020;0;1015;0
WireConnection;1020;1;1019;0
WireConnection;1884;1;1882;0
WireConnection;1884;0;415;0
WireConnection;1884;2;1883;0
WireConnection;336;0;344;0
WireConnection;337;0;344;0
WireConnection;1022;0;1017;0
WireConnection;1023;0;1018;0
WireConnection;1024;0;1020;0
WireConnection;1025;0;1021;0
WireConnection;1885;0;1884;0
WireConnection;1885;1;1886;0
WireConnection;1885;2;1887;0
WireConnection;338;1;336;0
WireConnection;338;0;344;0
WireConnection;338;2;337;0
WireConnection;1044;0;1037;0
WireConnection;1046;0;1040;0
WireConnection;1683;0;1685;0
WireConnection;1683;1;1022;0
WireConnection;1684;0;1023;0
WireConnection;1684;1;1686;0
WireConnection;1689;0;1687;0
WireConnection;1689;1;1024;0
WireConnection;1690;0;1025;0
WireConnection;1690;1;1688;0
WireConnection;447;0;1885;0
WireConnection;156;0;338;0
WireConnection;1535;0;1534;0
WireConnection;1536;0;1044;0
WireConnection;911;0;910;0
WireConnection;1531;0;1530;0
WireConnection;1533;0;1046;0
WireConnection;1030;0;1683;0
WireConnection;1030;1;1684;0
WireConnection;1033;0;1028;0
WireConnection;1033;1;1029;0
WireConnection;1034;0;1689;0
WireConnection;1034;1;1690;0
WireConnection;1032;0;1027;0
WireConnection;1032;1;1026;0
WireConnection;924;0;156;0
WireConnection;1652;0;1651;0
WireConnection;1042;0;1032;0
WireConnection;1042;1;1034;0
WireConnection;1045;0;1035;0
WireConnection;1045;1;1036;0
WireConnection;1043;0;1033;0
WireConnection;1043;1;1030;0
WireConnection;1047;0;1038;0
WireConnection;1047;1;1039;0
WireConnection;1537;0;1536;0
WireConnection;1537;1;1535;0
WireConnection;1532;0;1533;0
WireConnection;1532;1;1531;0
WireConnection;1437;0;1435;0
WireConnection;1437;1;1436;0
WireConnection;926;0;924;0
WireConnection;1930;0;1652;5
WireConnection;1929;0;1652;5
WireConnection;1053;0;1042;0
WireConnection;1053;1;1045;0
WireConnection;1053;2;1537;0
WireConnection;1054;0;1043;0
WireConnection;1054;1;1047;0
WireConnection;1054;2;1532;0
WireConnection;1439;0;1438;0
WireConnection;1439;1;1437;0
WireConnection;927;0;926;0
WireConnection;927;1;930;0
WireConnection;325;0;448;0
WireConnection;325;1;321;0
WireConnection;325;2;322;0
WireConnection;1931;1;1929;0
WireConnection;1931;0;1652;5
WireConnection;1931;2;1930;0
WireConnection;1058;0;1051;0
WireConnection;1055;0;1048;0
WireConnection;1446;0;1439;0
WireConnection;1446;1;1054;0
WireConnection;1445;0;1439;0
WireConnection;1445;1;1053;0
WireConnection;1714;0;1712;0
WireConnection;1714;1;391;0
WireConnection;1713;0;387;0
WireConnection;1713;1;1712;0
WireConnection;1710;0;330;0
WireConnection;1710;1;1709;0
WireConnection;1711;0;1709;0
WireConnection;1711;1;376;0
WireConnection;1736;0;325;0
WireConnection;451;0;927;0
WireConnection;1654;0;1931;0
WireConnection;1057;0;1052;0
WireConnection;1057;1;1384;0
WireConnection;1056;0;1049;0
WireConnection;1056;1;1050;0
WireConnection;2038;3;1445;0
WireConnection;2038;4;1055;0
WireConnection;2038;5;1049;0
WireConnection;2039;3;1446;0
WireConnection;2039;4;1058;0
WireConnection;2039;5;1052;0
WireConnection;2044;3;1446;0
WireConnection;2044;4;1058;0
WireConnection;2044;5;1052;0
WireConnection;2044;28;1383;0
WireConnection;2045;3;1445;0
WireConnection;2045;4;1055;0
WireConnection;2045;5;1049;0
WireConnection;2045;28;1380;0
WireConnection;315;0;313;0
WireConnection;315;1;314;0
WireConnection;388;0;390;0
WireConnection;388;1;389;0
WireConnection;386;0;1713;0
WireConnection;392;0;1714;0
WireConnection;329;0;1710;0
WireConnection;378;0;1711;0
WireConnection;1060;0;1053;0
WireConnection;1060;1;1056;0
WireConnection;1061;0;1054;0
WireConnection;1061;1;1057;0
WireConnection;1382;1;2044;0
WireConnection;1382;0;2044;9
WireConnection;1382;2;2044;20
WireConnection;1382;3;2044;21
WireConnection;1382;4;2044;13
WireConnection;1382;5;2044;15
WireConnection;1382;6;2044;26
WireConnection;1382;7;2044;27
WireConnection;1326;1;2039;0
WireConnection;1326;0;2039;9
WireConnection;1326;2;2039;20
WireConnection;1326;3;2039;21
WireConnection;1326;4;2039;13
WireConnection;1326;5;2039;15
WireConnection;1326;6;2039;26
WireConnection;1326;7;2039;27
WireConnection;1379;1;2045;0
WireConnection;1379;0;2045;9
WireConnection;1379;2;2045;20
WireConnection;1379;3;2045;21
WireConnection;1379;4;2045;13
WireConnection;1379;5;2045;15
WireConnection;1379;6;2045;26
WireConnection;1379;7;2045;27
WireConnection;1325;1;2038;0
WireConnection;1325;0;2038;9
WireConnection;1325;2;2038;20
WireConnection;1325;3;2038;21
WireConnection;1325;4;2038;13
WireConnection;1325;5;2038;15
WireConnection;1325;6;2038;26
WireConnection;1325;7;2038;27
WireConnection;1062;1;1446;0
WireConnection;1063;1;1445;0
WireConnection;1730;0;1729;0
WireConnection;346;0;1737;0
WireConnection;346;1;315;0
WireConnection;917;0;1738;0
WireConnection;917;1;388;0
WireConnection;634;0;1738;0
WireConnection;634;1;388;0
WireConnection;1704;1;453;0
WireConnection;1704;0;1655;0
WireConnection;1726;0;1725;0
WireConnection;1706;0;1705;0
WireConnection;1706;1;386;0
WireConnection;1707;0;392;0
WireConnection;1707;1;1708;0
WireConnection;1701;0;1699;0
WireConnection;1701;1;329;0
WireConnection;1702;0;378;0
WireConnection;1702;1;1700;0
WireConnection;1067;1;1059;0
WireConnection;1067;0;1382;0
WireConnection;1067;2;1326;0
WireConnection;1067;3;1061;0
WireConnection;1067;4;1062;0
WireConnection;1733;0;1731;0
WireConnection;1734;0;1730;0
WireConnection;333;0;1704;0
WireConnection;333;1;346;0
WireConnection;918;0;634;0
WireConnection;918;1;917;0
WireConnection;1727;0;1723;0
WireConnection;1728;0;1726;0
WireConnection;393;0;1706;0
WireConnection;393;1;1707;0
WireConnection;377;0;1701;0
WireConnection;377;1;1702;0
WireConnection;2025;1;1067;0
WireConnection;2025;3;1745;0
WireConnection;179;0;333;0
WireConnection;179;1;377;0
WireConnection;384;0;918;0
WireConnection;384;1;393;0
WireConnection;1721;0;1720;0
WireConnection;1721;1;1722;0
WireConnection;1732;0;1733;0
WireConnection;1732;1;1734;0
WireConnection;1719;0;1717;0
WireConnection;1719;1;1718;0
WireConnection;1724;0;1727;0
WireConnection;1724;1;1728;0
WireConnection;1070;0;2025;0
WireConnection;1716;0;179;0
WireConnection;1716;1;1719;0
WireConnection;1716;2;1724;0
WireConnection;1715;0;384;0
WireConnection;1715;1;1721;0
WireConnection;1715;2;1732;0
WireConnection;1072;0;1070;0
WireConnection;380;1;1715;0
WireConnection;64;1;1716;0
WireConnection;1073;0;1072;0
WireConnection;383;0;64;0
WireConnection;409;0;380;0
WireConnection;1076;0;1072;0
WireConnection;1076;1;1073;0
WireConnection;411;0;409;0
WireConnection;371;0;383;0
WireConnection;1080;0;1076;0
WireConnection;1080;1;1077;0
WireConnection;410;0;409;0
WireConnection;410;1;411;0
WireConnection;372;0;383;0
WireConnection;372;1;371;0
WireConnection;1084;0;1079;0
WireConnection;1084;1;1080;0
WireConnection;1085;0;1079;0
WireConnection;1085;1;1080;0
WireConnection;1081;0;1079;0
WireConnection;1081;1;1080;0
WireConnection;1082;0;1079;0
WireConnection;1082;1;1080;0
WireConnection;1083;0;1079;0
WireConnection;1083;1;1080;0
WireConnection;426;0;410;0
WireConnection;426;1;424;0
WireConnection;426;2;425;0
WireConnection;353;0;372;0
WireConnection;353;1;361;0
WireConnection;353;2;362;0
WireConnection;1180;18;1181;0
WireConnection;1180;19;1183;0
WireConnection;1180;20;1184;0
WireConnection;1180;21;1185;0
WireConnection;1180;22;1186;0
WireConnection;1086;1;1614;0
WireConnection;1086;0;1079;0
WireConnection;1086;2;1085;0
WireConnection;1086;3;1084;0
WireConnection;1086;4;1081;0
WireConnection;1086;5;1082;0
WireConnection;1086;6;1083;0
WireConnection;1430;0;353;0
WireConnection;1430;1;426;0
WireConnection;1676;0;426;0
WireConnection;1676;1;353;0
WireConnection;1680;0;353;0
WireConnection;1680;1;426;0
WireConnection;1188;0;1180;0
WireConnection;1187;0;1180;0
WireConnection;1087;0;1086;0
WireConnection;1088;0;1086;0
WireConnection;404;0;156;0
WireConnection;1428;0;353;0
WireConnection;1428;1;426;0
WireConnection;1677;0;353;0
WireConnection;1677;1;426;0
WireConnection;1429;0;353;0
WireConnection;1429;1;426;0
WireConnection;1678;0;1430;0
WireConnection;1679;0;1676;0
WireConnection;1681;0;1680;0
WireConnection;1189;1;1187;0
WireConnection;1189;0;1180;0
WireConnection;1189;2;1188;0
WireConnection;1091;1;1087;0
WireConnection;1091;0;1086;0
WireConnection;1091;2;1088;0
WireConnection;1432;1;353;0
WireConnection;1432;0;1677;0
WireConnection;1432;2;1428;0
WireConnection;1432;3;1429;0
WireConnection;1432;4;1678;0
WireConnection;1432;5;1679;0
WireConnection;1432;6;1681;0
WireConnection;450;0;404;0
WireConnection;1190;0;1189;0
WireConnection;1092;0;1091;0
WireConnection;1092;1;1089;0
WireConnection;1092;2;1090;0
WireConnection;1434;0;1433;0
WireConnection;1434;1;1432;0
WireConnection;1192;0;1190;0
WireConnection;2028;1;1092;0
WireConnection;2028;3;1093;0
WireConnection;1095;0;2028;0
WireConnection;1662;0;1503;0
WireConnection;455;0;1434;0
WireConnection;1511;0;1512;0
WireConnection;1511;1;1192;0
WireConnection;1098;0;1095;0
WireConnection;1098;1;1096;0
WireConnection;1098;2;1097;0
WireConnection;1663;0;1661;0
WireConnection;1663;1;1662;0
WireConnection;1193;0;1511;0
WireConnection;1241;0;1242;0
WireConnection;1241;1;1496;0
WireConnection;1241;2;1663;0
WireConnection;1102;0;1098;0
WireConnection;1102;1;1100;0
WireConnection;1335;0;1334;0
WireConnection;1244;0;1241;0
WireConnection;1244;1;1102;0
WireConnection;1338;0;1335;0
WireConnection;1338;1;1340;0
WireConnection;1099;0;1244;0
WireConnection;1341;0;1338;0
WireConnection;1341;1;1336;0
WireConnection;1247;0;1099;0
WireConnection;1339;0;1341;0
WireConnection;1349;0;1331;0
WireConnection;1349;1;1339;0
WireConnection;1350;0;1349;0
WireConnection;1350;1;1333;0
WireConnection;1344;0;1350;0
WireConnection;1344;1;1343;0
WireConnection;1405;0;1404;0
WireConnection;1405;1;1344;0
WireConnection;1354;0;1405;0
WireConnection;1143;0;959;0
WireConnection;909;0;908;0
WireConnection;954;0;955;0
WireConnection;956;0;958;0
WireConnection;968;0;967;0
WireConnection;970;0;968;0
WireConnection;970;1;969;0
WireConnection;1125;0;1123;0
WireConnection;1125;1;1124;0
WireConnection;1126;0;1121;0
WireConnection;1126;1;1122;0
WireConnection;1130;0;1129;0
WireConnection;1120;0;1126;0
WireConnection;1120;1;1125;0
WireConnection;1113;0;1114;0
WireConnection;1119;0;1128;0
WireConnection;1119;1;1131;0
WireConnection;1119;2;1120;0
WireConnection;1117;0;1115;0
WireConnection;1118;0;1119;0
WireConnection;1118;2;1113;0
WireConnection;1116;0;1127;0
WireConnection;991;0;993;0
WireConnection;991;1;992;0
WireConnection;606;0;1423;0
WireConnection;957;0;951;0
WireConnection;957;1;2029;0
WireConnection;957;2;959;0
WireConnection;958;0;1505;0
WireConnection;958;1;957;0
WireConnection;1254;0;1258;0
WireConnection;1256;0;2035;0
WireConnection;1256;1;1279;0
WireConnection;1257;0;1259;0
WireConnection;1257;1;1266;0
WireConnection;1264;0;1269;0
WireConnection;1264;1;1267;0
WireConnection;1278;0;1277;0
WireConnection;1279;0;1275;0
WireConnection;1279;1;1278;0
WireConnection;1279;2;1276;0
WireConnection;1260;0;1274;0
WireConnection;998;0;995;0
WireConnection;994;0;991;0
WireConnection;1522;0;1445;0
WireConnection;1523;0;1446;0
WireConnection;948;0;970;0
WireConnection;1603;0;1600;0
WireConnection;1603;1;1602;0
WireConnection;1608;0;1595;0
WireConnection;1608;1;1607;0
WireConnection;1608;2;1610;0
WireConnection;1273;0;1272;0
WireConnection;1272;0;1262;0
WireConnection;1272;1;1609;0
WireConnection;1609;0;1611;0
WireConnection;1609;1;1605;0
WireConnection;1611;0;1613;0
WireConnection;1611;1;1261;0
WireConnection;1484;0;1483;0
WireConnection;1484;1;1486;0
WireConnection;1485;0;1482;0
WireConnection;1485;1;1487;0
WireConnection;1481;0;1642;0
WireConnection;1480;0;1643;0
WireConnection;1483;0;1642;0
WireConnection;1483;1;1481;0
WireConnection;1482;0;1643;0
WireConnection;1482;1;1480;0
WireConnection;465;0;464;0
WireConnection;465;1;585;0
WireConnection;465;2;1493;0
WireConnection;597;0;599;0
WireConnection;597;1;619;0
WireConnection;597;2;1490;0
WireConnection;1643;0;596;0
WireConnection;1643;1;1645;0
WireConnection;596;0;1494;0
WireConnection;596;1;597;0
WireConnection;1127;1;1118;0
WireConnection;1127;5;1117;0
WireConnection;1605;0;1613;0
WireConnection;1605;1;1608;0
WireConnection;845;0;835;0
WireConnection;845;1;837;0
WireConnection;852;0;843;0
WireConnection;852;1;842;0
WireConnection;856;0;845;0
WireConnection;856;1;852;0
WireConnection;856;2;1620;0
WireConnection;1618;0;1617;0
WireConnection;1619;0;1616;0
WireConnection;1620;0;1619;0
WireConnection;1620;1;1618;0
WireConnection;1616;0;1682;0
WireConnection;837;0;1693;0
WireConnection;837;1;1694;0
WireConnection;824;0;818;0
WireConnection;824;1;819;0
WireConnection;825;0;817;0
WireConnection;825;1;819;0
WireConnection;832;0;824;0
WireConnection;833;0;825;0
WireConnection;835;0;828;0
WireConnection;835;1;829;0
WireConnection;859;0;853;0
WireConnection;859;1;1391;0
WireConnection;1448;0;1444;0
WireConnection;1448;1;845;0
WireConnection;860;0;854;0
WireConnection;1693;0;1691;0
WireConnection;1693;1;832;0
WireConnection;1694;0;833;0
WireConnection;1694;1;1692;0
WireConnection;836;0;1697;0
WireConnection;836;1;1698;0
WireConnection;834;0;827;0
WireConnection;834;1;826;0
WireConnection;822;0;816;0
WireConnection;822;1;821;0
WireConnection;823;0;820;0
WireConnection;823;1;821;0
WireConnection;830;0;822;0
WireConnection;831;0;823;0
WireConnection;1698;0;831;0
WireConnection;1698;1;1696;0
WireConnection;1697;0;1695;0
WireConnection;1697;1;830;0
WireConnection;1621;0;838;0
WireConnection;1622;0;1625;0
WireConnection;1442;0;1440;0
WireConnection;1442;1;1441;0
WireConnection;458;0;579;0
WireConnection;458;1;465;0
WireConnection;1642;0;458;0
WireConnection;1642;1;1644;0
WireConnection;1103;0;1521;0
WireConnection;1521;0;1107;40
WireConnection;1521;1;1545;0
WireConnection;1545;0;1952;0
WireConnection;1545;1;1549;40
WireConnection;1558;0;1541;0
WireConnection;1559;0;1544;0
WireConnection;1543;0;1517;0
WireConnection;1543;1;1951;0
WireConnection;1543;2;1559;0
WireConnection;1540;0;1516;0
WireConnection;1540;1;1950;0
WireConnection;1540;2;1558;0
WireConnection;1555;1;1540;0
WireConnection;1555;0;1520;0
WireConnection;1555;2;1551;0
WireConnection;1555;3;1553;0
WireConnection;1555;4;1550;0
WireConnection;1555;5;1553;0
WireConnection;1520;0;1540;0
WireConnection;1520;1;1543;0
WireConnection;1551;0;1540;0
WireConnection;1551;1;1543;0
WireConnection;1553;0;1540;0
WireConnection;1553;1;1543;0
WireConnection;1550;0;1540;0
WireConnection;1550;1;1543;0
WireConnection;1552;0;1540;0
WireConnection;1552;1;1543;0
WireConnection;1566;0;1555;0
WireConnection;1566;1;1557;0
WireConnection;1516;1;1524;0
WireConnection;1517;1;1525;0
WireConnection;1557;0;1110;0
WireConnection;1557;1;1100;0
WireConnection;1549;20;1241;0
WireConnection;1549;110;1510;0
WireConnection;1510;0;1110;0
WireConnection;872;0;2030;0
WireConnection;875;0;873;0
WireConnection;882;0;879;0
WireConnection;882;1;880;0
WireConnection;873;0;872;0
WireConnection;871;0;2032;0
WireConnection;876;0;874;0
WireConnection;881;0;877;0
WireConnection;881;1;878;0
WireConnection;887;0;881;0
WireConnection;887;1;882;0
WireConnection;886;0;881;0
WireConnection;886;1;882;0
WireConnection;883;0;881;0
WireConnection;883;1;882;0
WireConnection;884;0;881;0
WireConnection;884;1;882;0
WireConnection;885;0;881;0
WireConnection;885;1;882;0
WireConnection;894;0;891;0
WireConnection;894;1;893;0
WireConnection;894;2;892;0
WireConnection;929;0;907;0
WireConnection;929;1;928;0
WireConnection;907;0;900;0
WireConnection;900;0;897;0
WireConnection;900;1;898;0
WireConnection;900;2;899;0
WireConnection;1468;0;1467;0
WireConnection;1468;1;929;0
WireConnection;617;0;616;0
WireConnection;618;0;617;0
WireConnection;1489;0;1488;0
WireConnection;1490;0;1489;0
WireConnection;1490;1;618;0
WireConnection;599;0;609;0
WireConnection;599;1;1765;0
WireConnection;619;0;621;0
WireConnection;619;1;620;0
WireConnection;588;0;474;0
WireConnection;1492;0;1491;0
WireConnection;1493;0;1492;0
WireConnection;1493;1;588;0
WireConnection;474;0;469;0
WireConnection;464;0;506;0
WireConnection;464;1;1766;0
WireConnection;585;0;586;0
WireConnection;585;1;587;0
WireConnection;1764;0;1477;0
WireConnection;459;0;349;0
WireConnection;459;1;606;0
WireConnection;592;0;1427;0
WireConnection;844;0;834;0
WireConnection;844;1;836;0
WireConnection;850;0;839;0
WireConnection;850;1;840;0
WireConnection;858;0;847;0
WireConnection;858;1;848;0
WireConnection;1623;0;1621;0
WireConnection;1624;0;1623;0
WireConnection;1624;1;1622;0
WireConnection;1447;0;1444;0
WireConnection;1447;1;855;0
WireConnection;857;0;846;0
WireConnection;855;0;844;0
WireConnection;855;1;850;0
WireConnection;855;2;1624;0
WireConnection;889;0;888;0
WireConnection;890;0;888;0
WireConnection;1763;0;1476;0
WireConnection;506;0;504;0
WireConnection;506;1;505;0
WireConnection;609;0;610;0
WireConnection;609;1;611;0
WireConnection;1476;0;580;0
WireConnection;1476;1;1478;0
WireConnection;1477;0;602;0
WireConnection;1477;1;1478;0
WireConnection;1919;0;1473;0
WireConnection;1919;1;1471;0
WireConnection;1478;0;1479;0
WireConnection;1478;1;1919;0
WireConnection;1760;0;615;0
WireConnection;1760;1;1761;0
WireConnection;1758;0;1759;0
WireConnection;1758;1;614;0
WireConnection;614;0;1638;0
WireConnection;615;0;1639;0
WireConnection;1639;0;613;0
WireConnection;1639;1;1635;0
WireConnection;1638;0;612;0
WireConnection;1638;1;1635;0
WireConnection;602;0;1758;0
WireConnection;602;1;1760;0
WireConnection;584;0;1637;0
WireConnection;583;0;1636;0
WireConnection;1636;0;581;0
WireConnection;1636;1;1634;0
WireConnection;1637;0;582;0
WireConnection;1637;1;1634;0
WireConnection;580;0;1754;0
WireConnection;580;1;1755;0
WireConnection;1754;0;1756;0
WireConnection;1754;1;583;0
WireConnection;1755;0;584;0
WireConnection;1755;1;1762;0
WireConnection;622;0;1484;0
WireConnection;622;1;1485;0
WireConnection;624;0;1484;0
WireConnection;624;1;1485;0
WireConnection;625;0;1484;0
WireConnection;625;1;1485;0
WireConnection;604;0;1484;0
WireConnection;604;1;1485;0
WireConnection;1650;0;1484;0
WireConnection;1650;1;1485;0
WireConnection;1767;0;1485;0
WireConnection;1767;1;1484;0
WireConnection;1353;0;1142;0
WireConnection;1142;0;932;0
WireConnection;1142;1;1108;0
WireConnection;916;0;345;0
WireConnection;916;1;925;0
WireConnection;1294;0;916;0
WireConnection;1294;1;1162;0
WireConnection;1155;0;1152;0
WireConnection;1155;1;1246;0
WireConnection;1155;2;1248;0
WireConnection;413;0;375;0
WireConnection;373;0;456;0
WireConnection;374;0;456;0
WireConnection;345;0;1936;0
WireConnection;345;1;1499;0
WireConnection;925;0;904;0
WireConnection;925;1;1660;0
WireConnection;1499;0;413;0
WireConnection;1499;1;1498;0
WireConnection;1246;0;973;0
WireConnection;1162;0;1155;0
WireConnection;1162;1;1280;0
WireConnection;1660;0;1657;0
WireConnection;1660;1;1659;0
WireConnection;1128;0;1130;0
WireConnection;1506;0;1138;0
WireConnection;1137;0;1953;0
WireConnection;1137;1;1132;0
WireConnection;1137;2;1506;0
WireConnection;1006;0;1953;0
WireConnection;1006;1;1137;0
WireConnection;1005;0;1006;0
WireConnection;1005;1;1000;0
WireConnection;1004;0;1006;0
WireConnection;1004;1;1005;0
WireConnection;1001;0;1004;0
WireConnection;1003;0;1001;0
WireConnection;1002;0;1004;0
WireConnection;995;0;996;0
WireConnection;995;1;997;0
WireConnection;1936;0;454;0
WireConnection;1936;1;1664;0
WireConnection;897;0;2031;0
WireConnection;1952;1;1566;0
WireConnection;1261;0;1265;0
WireConnection;1261;1;1257;0
WireConnection;1261;2;1264;0
WireConnection;375;1;373;0
WireConnection;375;0;456;0
WireConnection;375;2;374;0
WireConnection;1659;0;920;0
WireConnection;1107;20;1244;0
WireConnection;1107;110;1510;0
WireConnection;2035;4;1260;0
WireConnection;2035;2;1254;0
WireConnection;2040;3;1448;0
WireConnection;2040;4;860;0
WireConnection;2040;5;853;0
WireConnection;2046;3;1448;0
WireConnection;2046;4;860;0
WireConnection;2046;5;853;0
WireConnection;2046;28;1394;0
WireConnection;2047;3;1447;0
WireConnection;2047;4;857;0
WireConnection;2047;5;847;0
WireConnection;2047;28;1389;0
WireConnection;2026;1;64;0
WireConnection;2026;3;1750;0
WireConnection;2027;1;380;0
WireConnection;2027;3;1752;0
WireConnection;2029;1;948;0
WireConnection;2029;3;954;0
WireConnection;2030;1;870;0
WireConnection;2030;3;1749;0
WireConnection;2031;1;894;0
WireConnection;2031;3;895;0
WireConnection;1259;1;1256;0
WireConnection;1595;1;1603;0
WireConnection;1427;0;1426;0
WireConnection;1427;1;459;0
WireConnection;1423;1;1422;0
WireConnection;1423;0;1484;0
WireConnection;1423;2;624;0
WireConnection;1423;3;604;0
WireConnection;1423;4;622;0
WireConnection;1423;5;625;0
WireConnection;1423;6;1650;0
WireConnection;1423;7;1767;0
WireConnection;2037;3;1854;0
WireConnection;2037;4;1785;0
WireConnection;2037;5;1848;0
WireConnection;2043;3;1854;0
WireConnection;2043;4;1785;0
WireConnection;2043;5;1848;0
WireConnection;2043;28;1853;0
WireConnection;2036;3;1867;0
WireConnection;2036;4;1863;0
WireConnection;2036;5;1865;0
WireConnection;2042;3;1867;0
WireConnection;2042;4;1863;0
WireConnection;2042;5;1865;0
WireConnection;2042;28;1866;0
WireConnection;902;0;1468;0
WireConnection;461;0;1294;0
WireConnection;891;1;889;0
WireConnection;891;0;888;0
WireConnection;891;2;890;0
WireConnection;888;1;887;0
WireConnection;888;0;886;0
WireConnection;888;2;883;0
WireConnection;888;3;884;0
WireConnection;888;4;885;0
WireConnection;1396;1;2041;0
WireConnection;1396;0;2041;9
WireConnection;1396;2;2041;20
WireConnection;1396;3;2041;21
WireConnection;1396;4;2041;13
WireConnection;1396;5;2041;15
WireConnection;1396;6;2041;26
WireConnection;1396;7;2041;27
WireConnection;1395;1;2047;0
WireConnection;1395;0;2047;9
WireConnection;1395;2;2047;20
WireConnection;1395;3;2047;21
WireConnection;1395;4;2047;13
WireConnection;1395;5;2047;15
WireConnection;1395;6;2047;26
WireConnection;1395;7;2047;27
WireConnection;869;1;863;0
WireConnection;869;0;1395;0
WireConnection;869;2;1396;0
WireConnection;869;3;865;0
WireConnection;869;4;861;0
WireConnection;874;0;871;0
WireConnection;2032;1;869;0
WireConnection;2032;3;1746;0
WireConnection;870;1;864;0
WireConnection;870;0;1397;0
WireConnection;870;2;1398;0
WireConnection;870;3;866;0
WireConnection;870;4;862;0
WireConnection;1397;1;2046;0
WireConnection;1397;0;2046;9
WireConnection;1397;2;2046;20
WireConnection;1397;3;2046;21
WireConnection;1397;4;2046;13
WireConnection;1397;5;2046;15
WireConnection;1397;6;2046;26
WireConnection;1397;7;2046;27
WireConnection;1398;1;2040;0
WireConnection;1398;0;2040;9
WireConnection;1398;2;2040;20
WireConnection;1398;3;2040;21
WireConnection;1398;4;2040;13
WireConnection;1398;5;2040;15
WireConnection;1398;6;2040;26
WireConnection;1398;7;2040;27
WireConnection;866;0;856;0
WireConnection;866;1;859;0
WireConnection;862;1;1448;0
WireConnection;861;1;1447;0
WireConnection;865;0;855;0
WireConnection;865;1;858;0
WireConnection;2041;3;1447;0
WireConnection;2041;4;857;0
WireConnection;2041;5;847;0
WireConnection;877;0;874;0
WireConnection;877;1;876;0
WireConnection;879;0;873;0
WireConnection;879;1;875;0
WireConnection;1444;0;1443;0
WireConnection;1444;1;1442;0
WireConnection;1068;1;1065;0
WireConnection;1068;0;1379;0
WireConnection;1068;2;1325;0
WireConnection;1068;3;1060;0
WireConnection;1068;4;1063;0
WireConnection;2024;1;1068;0
WireConnection;2024;3;1742;0
WireConnection;1069;0;2024;0
WireConnection;1071;0;1069;0
WireConnection;1074;0;1071;0
WireConnection;1075;0;1071;0
WireConnection;1075;1;1074;0
WireConnection;1079;0;1075;0
WireConnection;1079;1;1078;0
WireConnection;1965;0;1403;0
ASEEND*/
//CHKSM=20EAC4D26B1586D1ADD3CA30FD6DC165B0994B6D
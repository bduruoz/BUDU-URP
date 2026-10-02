// Made with Amplify Shader Editor v1.9.9.9
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Amplify Creations/Real Fake Interior Unlit BiRP"
{
	Properties
	{
		[Header(Parallax Control)] _ParallaxSteps( "Parallax Steps", Float ) = 80
		_ParallaxOffset( "Parallax Offset", Float ) = 1
		_RefineSteps( "Refine Steps", Float ) = 3
		_RoomSize( "Room Size (W/D, H/D)", Vector ) = ( 1, 1, 0, 0 )
		[Header(Noise Control)] _BlueNoiseScale( "Blue Noise Scale", Float ) = 64
		_BlueNoiseStrength( "BlueNoiseStrength", Float ) = 0.45
		_StartPhaseStrength( "Start Phase Strength", Float ) = 0.5
		_ScreenSpaceBlueNoise( "Screen Space Blue Noise", Float ) = 1
		[HDR][Header(Room Control)] _CubemapExposure( "Cubemap Exposure", Float ) = 1
		_CubemapRotation( "Cubemap Rotation", Float ) = 0
		_PropBrightness( "Prop Brightness", Float ) = 1
		[Header(Master)] _RoomTint( "Room Tint", Color ) = ( 1, 1, 1, 0 )
		_RoomTiling( "Room Tiling", Float ) = 1
		[Header(Detail Layer)][Toggle] _WindowOverlay( "Window Overlay", Float ) = 0
		_WindowOverlayTint( "Window Overlay Tint", Color ) = ( 1, 1, 1, 0 )
		[NoScaleOffset][SingleLineTexture] _OverlayTexture( "OverlayTexture", 2D ) = "white" {}
		[Header(Textures)][NoScaleOffset][SingleLineTexture] _RoomCubemap( "Room Cubemap", CUBE ) = "white" {}
		[NoScaleOffset][SingleLineTexture] _InteriorColorTexture( "Interior Color Texture", 2D ) = "white" {}
		[NoScaleOffset][SingleLineTexture] _BlueNoise( "Blue Noise", 2D ) = "white" {}
		[NoScaleOffset][SingleLineTexture] _InteriorHeightmapTexture( "Interior Heightmap Texture", 2D ) = "white" {}

	}

	SubShader
	{
		

		

		Tags { "RenderType"="Opaque" }

	LOD 0

		

		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZClip True
		ZTest LEqual
		Offset 0 , 0
		

		CGINCLUDE
			#pragma target 3.5
			// ensure rendering platforms toggle list is visible

			float4 ComputeClipSpacePosition( float2 screenPosNorm, float deviceDepth )
			{
				float4 positionCS = float4( screenPosNorm * 2.0 - 1.0, deviceDepth, 1.0 );
			#if UNITY_UV_STARTS_AT_TOP
				positionCS.y = -positionCS.y;
			#endif
				return positionCS;
			}
		ENDCG

		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }

			CGPROGRAM
				#define ASE_VERSION 19909

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_instancing
				#include "UnityCG.cginc"

				#include "UnityStandardBRDF.cginc"
				#include "UnityShaderVariables.cginc"
				#define ASE_NEEDS_TEXTURE_COORDINATES0
				#define ASE_NEEDS_VERT_NORMAL
				#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED


				struct appdata
				{
					float4 vertex : POSITION;
					half3 normal : NORMAL;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_tangent : TANGENT;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					float4 pos : SV_POSITION;
					float4 ase_texcoord : TEXCOORD0;
					float4 ase_texcoord1 : TEXCOORD1;
					float4 ase_texcoord2 : TEXCOORD2;
					float4 ase_texcoord3 : TEXCOORD3;
					float4 ase_texcoord4 : TEXCOORD4;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				uniform float _RoomTiling;
				uniform sampler2D _InteriorHeightmapTexture;
				uniform sampler2D _InteriorColorTexture;
				uniform float _ParallaxSteps;
				uniform float _ParallaxOffset;
				uniform sampler2D _BlueNoise;
				uniform float _BlueNoiseScale;
				uniform float _BlueNoiseStrength;
				uniform float _ScreenSpaceBlueNoise;
				uniform float _StartPhaseStrength;
				uniform float _RefineSteps;
				float4 _InteriorHeightmapTexture_TexelSize;
				uniform float2 _RoomSize;
				uniform float _PropBrightness;
				uniform samplerCUBE _RoomCubemap;
				uniform float _CubemapRotation;
				uniform float _CubemapExposure;
				uniform float4 _RoomTint;
				uniform sampler2D _OverlayTexture;
				uniform float4 _WindowOverlayTint;
				uniform float _WindowOverlay;


				float4 ParallaxRaymarchBlueNoiseCoarsetoFine639( float2 BaseUV, float3 ViewDirectionTS, sampler2D HeightIntervalTex, sampler2D InteriorColorTex, float ParallaxSteps, float ParallaxHeight, float2 PixelPos, float FramePhase, float2 DDX_UV, float2 DDY_UV, sampler2D BlueNoiseTex, float BlueNoiseScale, float BlueNoiseStrength, float UseScreenSpaceBlueNoise, float2 ScreenUV, float StartPhaseStrength, float RefineSteps, float4 TexelSize, float2 RoomSize )
				{
					// ------------------------------------------------------------
					// Parallax Interior Raymarch (ASE Custom Expression)
					// Coarse-to-fine search + binary refine.
					// Screen-locked BLUE NOISE jitter (STATIC) per step.
					// + Per-pixel START PHASE (STATIC) to offset marching start,
					//   preventing repeated slab hits / vertical banding.
					// + Depth-aware bilinear color fetch at the hit, to avoid
					//   smearing color across surface boundaries in texel space.
					// + Anisotropic UV step rate (RoomSize) so non-cubic rooms
					//   (wider, taller, deeper, shallower) parallax correctly.
					// Output: float4(InteriorRGB, HitMask)
					// ------------------------------------------------------------
					// 0) Optional tiling
					float2 BaseUV_Tiled = frac(BaseUV);
					// 1) View direction TS (camera->pixel)
					float3 ViewDirTS_Norm = normalize(-ViewDirectionTS);
					// 2) UV parallax direction
					//    RoomSize = (W/D, H/D). Dividing here makes the ray step at
					//    world rate per axis instead of UV rate, so wider/taller/deeper
					//    rooms don't smear sideways during the march.
					float SafeZ = max(1e-4, abs(ViewDirTS_Norm.z));
					float2 SafeRoomSize = max(float2(1e-4, 1e-4), RoomSize);
					float2 ParallaxDirUV = (ViewDirTS_Norm.xy / SafeZ) * ParallaxHeight / SafeRoomSize;
					// 3) Steps
					float CoarseStepsF = max(1.0, ParallaxSteps);
					// 4) Raymarch state
					float2 RayUV = BaseUV_Tiled;
					float CurrentDepth = 1.0;
					float2 PrevUV = RayUV;
					float PrevDepth = CurrentDepth;
					float HitMask = 0.0;
					float3 HitColor = 0.0;
					// RefineSteps is now an INPUT property in ASE
					const int MAX_REFINE = 8;
					int RefineStepsLocal = (int)clamp(RefineSteps, 0.0, (float)MAX_REFINE);
					// Tolerance for "same surface" depth match. Matches the bake's value.
					const float SAME_SURFACE_EPS = 0.01;
					// ------------------------------------------------------------
					// Per-pixel START PHASE
					// Screen-locked, static blue-noise sample (no LayerIndex).
					// Interpreted as a fractional-step phase in [0..1).
					// ------------------------------------------------------------
					float2 startBnUV = frac(ScreenUV * BlueNoiseScale + float2(0.1234, 0.5678));
					float startBn = tex2D(BlueNoiseTex, startBnUV).r;          // 0..1
					float startPhase01 = startBn * StartPhaseStrength;         // 0..StartPhaseStrength
					[loop]
					for (int LayerIndex = 0; LayerIndex < (int)CoarseStepsF; LayerIndex++)
					{
					    PrevUV = RayUV;
					    PrevDepth = CurrentDepth;
					    // -------- per-step STATIC blue-noise jitter ----------
					    float2 layerOffset = float2((float)LayerIndex * 0.7548777, (float)LayerIndex * 0.5698403);
					    float2 bnUV = frac(ScreenUV * BlueNoiseScale + layerOffset);
					    float bn = tex2D(BlueNoiseTex, bnUV).r;                 // 0..1
					    float jitter = (bn - 0.5) * BlueNoiseStrength;          // fraction of a step
					    // Sample at layer center + start phase + jitter
					    float t = ((float)LayerIndex + 0.5 + startPhase01 + jitter) / CoarseStepsF;
					    // Avoid saturate() bunching at t=1; just stop if outside range
					    if (t < 0.0 || t > 1.0)
					        break;
					    RayUV = BaseUV_Tiled + ParallaxDirUV * t;
					    CurrentDepth = 1.0 - t;
					    if (RayUV.x < 0.0 || RayUV.x > 1.0 || RayUV.y < 0.0 || RayUV.y > 1.0)
					        break;
					    float2 depthRG = tex2D(HeightIntervalTex, RayUV).rg;
					    if (CurrentDepth < depthRG.r && CurrentDepth > depthRG.g)
					    {
					        // --- Binary refine between previous and current sample ---
					        float2 Auv = PrevUV;  float Adepth = PrevDepth;
					        float2 Buv = RayUV;   float Bdepth = CurrentDepth;
					        [unroll]
					        for (int r = 0; r < MAX_REFINE; r++)
					        {
					            if (r >= RefineStepsLocal)
					                break;
					            float2 Muv = (Auv + Buv) * 0.5;
					            float Mdepth = (Adepth + Bdepth) * 0.5;
					            float2 mRG = tex2D(HeightIntervalTex, Muv).rg;
					            if (Mdepth < mRG.r && Mdepth > mRG.g)
					            {
					                Buv = Muv;  Bdepth = Mdepth;
					            }
					            else
					            {
					                Auv = Muv;  Adepth = Mdepth;
					            }
					        }
					        // ------------------------------------------------------------
					        // Depth-aware bilinear color fetch.
					        // Standard bilinear blends 4 texels regardless of what they
					        // represent. At a surface boundary in the texture (e.g. mug
					        // texel next to table texel) that smears one surface's color
					        // into the other. Here we do the 4 taps manually and zero-
					        // weight any tap whose depth doesn't match the surface the
					        // raymarch actually hit, then renormalize the bilinear weights
					        // over the surviving taps.
					        //
					        // Requires color + depth textures to be imported as
					        // FilterMode.Point with mipmaps OFF, so each tex2D returns
					        // exactly one texel.
					        // ------------------------------------------------------------
					        // Reference depth = front face of the surface under Buv.
					        float hitFrontD = tex2D(HeightIntervalTex, Buv).r;
					        // Buv -> texel-space, find the 4 surrounding texel centers.
					        float2 texSize = TexelSize.zw;        // (width, height)
					        float2 invSize = TexelSize.xy;        // (1/width, 1/height)
					        float2 uvPx    = Buv * texSize - 0.5;
					        float2 uvF     = floor(uvPx);
					        float2 fr      = uvPx - uvF;
					        float2 uv00 = (uvF + 0.5) * invSize;
					        float2 uv10 = uv00 + float2(invSize.x, 0.0);
					        float2 uv01 = uv00 + float2(0.0, invSize.y);
					        float2 uv11 = uv00 + invSize;
					        // 4 color + 4 depth taps (point fetches).
					        float3 c00 = tex2D(InteriorColorTex,  uv00).rgb;
					        float3 c10 = tex2D(InteriorColorTex,  uv10).rgb;
					        float3 c01 = tex2D(InteriorColorTex,  uv01).rgb;
					        float3 c11 = tex2D(InteriorColorTex,  uv11).rgb;
					        float  d00 = tex2D(HeightIntervalTex, uv00).r;
					        float  d10 = tex2D(HeightIntervalTex, uv10).r;
					        float  d01 = tex2D(HeightIntervalTex, uv01).r;
					        float  d11 = tex2D(HeightIntervalTex, uv11).r;
					        // Standard bilinear weights.
					        float w00 = (1.0 - fr.x) * (1.0 - fr.y);
					        float w10 =        fr.x  * (1.0 - fr.y);
					        float w01 = (1.0 - fr.x) *        fr.y;
					        float w11 =        fr.x  *        fr.y;
					        // Surface-match mask: 1 if this tap belongs to the hit surface.
					        float m00 = step(abs(d00 - hitFrontD), SAME_SURFACE_EPS);
					        float m10 = step(abs(d10 - hitFrontD), SAME_SURFACE_EPS);
					        float m01 = step(abs(d01 - hitFrontD), SAME_SURFACE_EPS);
					        float m11 = step(abs(d11 - hitFrontD), SAME_SURFACE_EPS);
					        float W00 = w00 * m00;
					        float W10 = w10 * m10;
					        float W01 = w01 * m01;
					        float W11 = w11 * m11;
					        float wSum = W00 + W10 + W01 + W11;
					        if (wSum > 1e-5)
					        {
					            HitColor = (c00 * W00 + c10 * W10 + c01 * W01 + c11 * W11) / wSum;
					        }
					        else
					        {
					            // All 4 taps mismatch (degenerate corner). Fall back to point.
					            HitColor = tex2D(InteriorColorTex, Buv).rgb;
					        }
					        HitMask = 1.0;
					        break;
					    }
					}
					return float4(HitColor, HitMask);
				}
				
				float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
				{
					original -= center;
					float C = cos( angle );
					float S = sin( angle );
					float t = 1 - C;
					float m00 = t * u.x * u.x + C;
					float m01 = t * u.x * u.y - S * u.z;
					float m02 = t * u.x * u.z + S * u.y;
					float m10 = t * u.x * u.y + S * u.z;
					float m11 = t * u.y * u.y + C;
					float m12 = t * u.y * u.z - S * u.x;
					float m20 = t * u.x * u.z - S * u.y;
					float m21 = t * u.y * u.z + S * u.x;
					float m22 = t * u.z * u.z + C;
					float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
					return mul( finalMatrix, original ) + center;
				}
				

				v2f vert( appdata v  )
				{
					UNITY_SETUP_INSTANCE_ID(v);
					v2f o;
					UNITY_INITIALIZE_OUTPUT(v2f,o);
					UNITY_TRANSFER_INSTANCE_ID(v,o);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
					o.ase_texcoord1.xyz = ase_positionWS;
					float3 ase_tangentWS = UnityObjectToWorldDir( v.ase_tangent );
					o.ase_texcoord2.xyz = ase_tangentWS;
					float3 ase_normalWS = UnityObjectToWorldNormal( v.normal );
					o.ase_texcoord3.xyz = ase_normalWS;
					float ase_tangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
					float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
					o.ase_texcoord4.xyz = ase_bitangentWS;
					
					o.ase_texcoord.xyz = v.ase_texcoord.xyz;
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord.w = 0;
					o.ase_texcoord1.w = 0;
					o.ase_texcoord2.w = 0;
					o.ase_texcoord3.w = 0;
					o.ase_texcoord4.w = 0;

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;

					o.pos = UnityObjectToClipPos( v.vertex );

					#if defined( ASE_SHADOWS )
						UNITY_TRANSFER_SHADOW( o, v.texcoord );
					#endif
					return o;
				}

				half4 frag( v2f IN 
							#if defined( ASE_DEPTH_WRITE_ON )
								, out float outputDepth : SV_Depth
							#endif
				) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID( IN );
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

					float4 ScreenPosNorm = float4( IN.pos.xy * ( _ScreenParams.zw - 1.0 ), IN.pos.zw );
					float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, IN.pos.z ) * IN.pos.w;
					float4 ScreenPos = ComputeScreenPos( ClipPos );

					float2 texCoord621 = IN.ase_texcoord.xyz.xy * float2( 1,1 ) + float2( 0,0 );
					float Room_Tiling618 = _RoomTiling;
					float2 BaseUVs630 = frac( ( texCoord621 * Room_Tiling618 ) );
					float2 BaseUV639 = BaseUVs630;
					float3 ase_positionWS = IN.ase_texcoord1.xyz;
					float3 ase_tangentWS = IN.ase_texcoord2.xyz;
					float3 ase_normalWS = IN.ase_texcoord3.xyz;
					float3 ase_bitangentWS = IN.ase_texcoord4.xyz;
					float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
					float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
					float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
					float3 ase_viewVectorTS =  tanToWorld0 * ( ( unity_OrthoParams.w == 0 ) ? _WorldSpaceCameraPos - ase_positionWS : UNITY_MATRIX_V[ 2 ].xyz ).x + tanToWorld1 * ( ( unity_OrthoParams.w == 0 ) ? _WorldSpaceCameraPos - ase_positionWS : UNITY_MATRIX_V[ 2 ].xyz ).y  + tanToWorld2 * ( ( unity_OrthoParams.w == 0 ) ? _WorldSpaceCameraPos - ase_positionWS : UNITY_MATRIX_V[ 2 ].xyz ).z;
					float3 ase_viewDirSafeTS = Unity_SafeNormalize( ase_viewVectorTS );
					float3 ViewDirectionTS639 = ase_viewDirSafeTS;
					sampler2D HeightIntervalTex639 = _InteriorHeightmapTexture;
					sampler2D InteriorColorTex639 = _InteriorColorTexture;
					float ParallaxSteps639 = _ParallaxSteps;
					float ParallaxHeight639 = _ParallaxOffset;
					float2 appendResult624 = (float2(ScreenPosNorm.x , ScreenPosNorm.y));
					float2 appendResult629 = (float2(_ScreenParams.x , _ScreenParams.y));
					float2 PixelPos639 = ( appendResult624 * appendResult629 );
					float FramePhase639 = fmod( ( _Time.y * 60.0 ) , 8.0 );
					float2 DDX_UV639 = ddx( texCoord621 );
					float2 DDY_UV639 = ddy( texCoord621 );
					sampler2D BlueNoiseTex639 = _BlueNoise;
					float BlueNoiseScale639 = _BlueNoiseScale;
					float BlueNoiseStrength639 = _BlueNoiseStrength;
					float UseScreenSpaceBlueNoise639 = _ScreenSpaceBlueNoise;
					float2 appendResult596 = (float2(ScreenPosNorm.x , ScreenPosNorm.y));
					float2 ScreenUV639 = appendResult596;
					float StartPhaseStrength639 = _StartPhaseStrength;
					float RefineSteps639 = _RefineSteps;
					float4 TexelSize639 = _InteriorHeightmapTexture_TexelSize;
					float2 Room_Size648 = _RoomSize;
					float2 RoomSize639 = Room_Size648;
					float4 localParallaxRaymarchBlueNoiseCoarsetoFine639 = ParallaxRaymarchBlueNoiseCoarsetoFine639( BaseUV639 , ViewDirectionTS639 , HeightIntervalTex639 , InteriorColorTex639 , ParallaxSteps639 , ParallaxHeight639 , PixelPos639 , FramePhase639 , DDX_UV639 , DDY_UV639 , BlueNoiseTex639 , BlueNoiseScale639 , BlueNoiseStrength639 , UseScreenSpaceBlueNoise639 , ScreenUV639 , StartPhaseStrength639 , RefineSteps639 , TexelSize639 , RoomSize639 );
					float4 break574 = localParallaxRaymarchBlueNoiseCoarsetoFine639;
					float3 appendResult576 = (float3(break574.x , break574.y , break574.z));
					float3 ase_viewDirTS = normalize( ase_viewVectorTS );
					float3 viewDirA591 = -ase_viewDirTS;
					float3 temp_output_585_0 = ( float3( 1,1,1 ) / viewDirA591 );
					float2 break654 = Room_Size648;
					float3 appendResult655 = (float3(break654.x , break654.y , 1.0));
					float3 appendResult645 = (float3(( ( ( frac( BaseUVs630 ) * float2( 2,2 ) ) - float2( 1,1 ) ) * Room_Size648 ) , 1.0));
					float3 uv3644 = appendResult645;
					float3 break590 = ( ( abs( temp_output_585_0 ) * appendResult655 ) - ( uv3644 * temp_output_585_0 ) );
					float3 rotatedValue584 = RotateAroundAxis( float3( 0,0,0 ), ( ( ( viewDirA591 * min( min( break590.x, break590.y ), break590.z ) ) + uv3644 ) * float3( -1,1,1 ) ), float3( 0,1,0 ), ( _CubemapRotation * ( UNITY_PI / 180.0 ) ) );
					float3 lerpResult601 = lerp( ( appendResult576 * _PropBrightness ) , ( texCUBE( _RoomCubemap, rotatedValue584 ).rgb * _CubemapExposure ) , ( 1.0 - break574.w ));
					float4 tex2DNode606 = tex2D( _OverlayTexture, BaseUVs630 );
					float4 lerpResult603 = lerp( float4( ( lerpResult601 * _RoomTint.rgb ) , 0.0 ) , ( float4( tex2DNode606.rgb , 0.0 ) * _WindowOverlayTint ) , ( tex2DNode606.a * _WindowOverlay ));
					

					float4 Color = lerpResult603;
					float Alpha = 1;
					half AlphaClipThreshold = 0.5;
					half AlphaClipThresholdShadow = 0.5;

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = IN.pos.z;
					#endif

					#ifdef _ALPHATEST_ON
						clip( Alpha - AlphaClipThreshold );
					#endif

					return Color;
				}
			ENDCG
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			CGPROGRAM
				#define ASE_VERSION 19909

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_shadowcaster
				#ifndef UNITY_PASS_SHADOWCASTER
					#define UNITY_PASS_SHADOWCASTER
				#endif
				#include "HLSLSupport.cginc"
				#include "UnityShaderVariables.cginc"
				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "UnityPBSLighting.cginc"

				

				struct appdata
				{
					float4 vertex : POSITION;
					half3 normal : NORMAL;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					V2F_SHADOW_CASTER;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					sampler3D _DitherMaskLOD;
				#endif
				#ifdef ASE_TESSELLATION
					float _TessPhongStrength;
					float _TessValue;
					float _TessMin;
					float _TessMax;
					float _TessEdgeLength;
					float _TessMaxDisp;
				#endif

				

				
				v2f vert( appdata v  )
				{
					UNITY_SETUP_INSTANCE_ID( v );
					v2f o;
					UNITY_INITIALIZE_OUTPUT( v2f, o );
					UNITY_TRANSFER_INSTANCE_ID( v, o );
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

					

					#ifdef ASE_ABSOLUTE_VERTEX_POS
						float3 defaultVertexValue = v.vertex.xyz;
					#else
						float3 defaultVertexValue = float3(0, 0, 0);
					#endif
					float3 vertexValue = defaultVertexValue;
					#ifdef ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif
					v.vertex.w = 1;
					v.normal = v.normal;

					TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
					return o;
				}

				half4 frag( v2f IN 
							#if defined( ASE_DEPTH_WRITE_ON )
								, out float outputDepth : SV_Depth
							#endif
							) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(IN);

					#ifdef LOD_FADE_CROSSFADE
						UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
					#endif

					

					float Alpha = 1;
					half AlphaClipThreshold = 0.5;
					half AlphaClipThresholdShadow = 0.5;

					#if defined( ASE_DEPTH_WRITE_ON )
						outputDepth = IN.pos.z;
					#endif

					#ifdef _ALPHATEST_SHADOW_ON
						if (unity_LightShadowBias.z != 0.0)
							clip(Alpha - AlphaClipThresholdShadow);
						#ifdef _ALPHATEST_ON
						else
							clip(Alpha - AlphaClipThreshold);
						#endif
					#else
						#ifdef _ALPHATEST_ON
							clip(Alpha - AlphaClipThreshold);
						#endif
					#endif

					#ifdef UNITY_STANDARD_USE_DITHER_MASK
						half alphaRef = tex3D(_DitherMaskLOD, float3(IN.pos.xy*0.25,Alpha*0.9375)).a;
						clip(alphaRef - 0.01);
					#endif

					SHADOW_CASTER_FRAGMENT(IN)
				}
			ENDCG
		}
		
	}
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19909
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;568;143.2091,-2869.973;Inherit;False;2385.754;2392.951;Core Parallax Effect Properties;32;657;648;647;638;637;636;635;634;633;632;631;630;629;628;627;626;625;624;623;622;621;620;619;618;614;611;610;609;608;607;597;596;;1,0.2235294,0,0.3686275;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;569;-1937.95,-161.2535;Inherit;False;4397.722;958.9749;Room Cubemap;34;655;654;653;652;651;650;649;646;645;644;643;642;641;640;613;612;604;595;594;592;591;590;589;588;587;586;585;584;583;582;581;580;579;578;;0.3349057,0.6380208,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;570;3375.622,-1852.07;Inherit;False;1414.085;915.7696;Mixing;10;616;615;603;601;598;577;576;575;574;573;;1,0.4597463,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;571;2830.931,-2076.028;Inherit;False;420;571;;1;639;Core Parallax Effect;1,0.2215737,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;572;2923.414,-822.1557;Inherit;False;1071.011;667.5255;Blinds;4;656;606;605;599;;0.2783019,0.9880693,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;573;4390.511,-1299.926;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;574;3425.622,-1802.07;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;575;3988.051,-1700.92;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;576;3626.316,-1800.224;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;577;3618.779,-1665.616;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;578;2348.824,-46.68781;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;579;577.1727,10.01291;Inherit;False;591;viewDirA;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;580;833.1724,90.01312;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;581;1057.172,90.01312;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;582;1287.171,93.01312;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;-1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;583;1265.406,-71.0759;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotateAboutAxisNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;584;1542.589,-21.47089;Inherit;False;False;4;0;FLOAT3;0,1,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;585;-719.0844,471.8248;Inherit;False;2;0;FLOAT3;1,1,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;586;-1662.156,360.2701;Inherit;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;587;-206.1065,236.5076;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;588;114.5293,201.5152;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;589;-1435.452,401.9689;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;590;433.7778,148.1492;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;591;-1029.752,441.5744;Inherit;False;viewDirA;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;592;590.7766,148.1492;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;593;2989.509,-1301.25;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;594;1046.449,-29.5629;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;595;806.4495,-10.5629;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;596;2228.404,-1267.73;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;597;1988.403,-1299.73;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;598;3921.783,-1471.668;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;599;3620.217,-650.7044;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;600;2719.164,-286.9218;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;601;4165.01,-1628.752;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;602;4316.18,-694.0255;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;603;4633.339,-1132.35;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;604;2025.46,-111.2533;Inherit;True;Property;_RoomCubemap;Room Cubemap;16;3;[Header];[NoScaleOffset];[SingleLineTexture];Create;True;1;Textures;0;0;False;0;False;-1;None;820cfebf3ff1d304d88021eabd0ab763;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;False;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;605;3256.722,-750.9548;Inherit;False;Property;_WindowOverlayTint;Window Overlay Tint;14;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;606;3251.266,-521.3633;Inherit;True;Property;_OverlayTexture;OverlayTexture;15;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;607;2132.403,-1539.73;Inherit;False;Property;_BlueNoiseScale;Blue Noise Scale;4;1;[Header];Create;True;1;Noise Control;0;0;False;0;False;64;64;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;608;2116.403,-1459.731;Inherit;False;Property;_BlueNoiseStrength;BlueNoiseStrength;5;0;Create;True;0;0;0;False;0;False;0.45;0.51;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;609;2068.403,-1381.731;Inherit;False;Property;_ScreenSpaceBlueNoise;Screen Space Blue Noise;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;610;2148.403,-1107.73;Inherit;False;Property;_StartPhaseStrength;Start Phase Strength;6;0;Create;True;0;0;0;False;0;False;0.5;0.77;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;611;2180.403,-979.7302;Inherit;False;Property;_RefineSteps;Refine Steps;2;0;Create;True;0;0;0;False;0;False;3;6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;612;2071.627,146.3769;Inherit;False;Property;_CubemapExposure;Cubemap Exposure;8;2;[HDR];[Header];Create;True;1;Room Control;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;613;911.1009,-105.9302;Inherit;False;Property;_CubemapRotation;Cubemap Rotation;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexelSizeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;614;2134.973,-893.9937;Inherit;False;626;Create;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;615;3601.337,-1550.422;Inherit;False;Property;_PropBrightness;Prop Brightness;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;616;4104.867,-1238.327;Inherit;False;Property;_RoomTint;Room Tint;11;1;[Header];Create;True;1;Master;0;0;False;0;False;1,1,1,0;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;617;4091.39,-540.5196;Inherit;False;Property;_WindowOverlay;Window Overlay;13;2;[Header];[Toggle];Create;True;1;Detail Layer;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;618;390.553,-1507.037;Inherit;False;Room Tiling;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;619;187.881,-1301.873;Inherit;False;Property;_RoomTiling;Room Tiling;12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;620;781.8887,-2386.772;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;621;235.7715,-1741.315;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;622;658.9486,-1870.627;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;623;1109.959,-2338.974;Inherit;True;Property;_InteriorColorTexture;Interior Color Texture;17;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;None;e7b04df2893d4444591c915fa1b416bc;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;624;1285.959,-2098.975;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;625;1445.959,-2034.974;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;626;1093.959,-2546.973;Inherit;True;Property;_InteriorHeightmapTexture;Interior Heightmap Texture;19;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;None;f40174fa478e1c1429bd8579ee7d7a4a;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ScreenPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;627;1006.959,-2120.975;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenParams, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;628;1023.959,-1938.974;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;629;1261.959,-1970.974;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;630;1110.959,-2819.973;Inherit;False;BaseUVs;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;631;1124.959,-2719.973;Inherit;False;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FmodOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;632;1972.959,-1895.974;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;633;1433.959,-1895.974;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;634;1713.959,-1895.974;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;60;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;635;1781.959,-2195.975;Inherit;False;Property;_ParallaxSteps;Parallax Steps;0;1;[Header];Create;True;1;Parallax Control;0;0;False;0;False;80;80;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;636;1781.959,-2116.287;Inherit;False;Property;_ParallaxOffset;Parallax Offset;1;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DdyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;637;2282.329,-1737.378;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DdxOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;638;2280.156,-1815.795;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;639;2880.931,-2026.028;Inherit;False;// ------------------------------------------------------------$// Parallax Interior Raymarch (ASE Custom Expression)$// Coarse-to-fine search + binary refine.$// Screen-locked BLUE NOISE jitter (STATIC) per step.$// + Per-pixel START PHASE (STATIC) to offset marching start,$//   preventing repeated slab hits / vertical banding.$// + Depth-aware bilinear color fetch at the hit, to avoid$//   smearing color across surface boundaries in texel space.$// + Anisotropic UV step rate (RoomSize) so non-cubic rooms$//   (wider, taller, deeper, shallower) parallax correctly.$// Output: float4(InteriorRGB, HitMask)$// ------------------------------------------------------------$$// 0) Optional tiling$float2 BaseUV_Tiled = frac(BaseUV)@$$// 1) View direction TS (camera->pixel)$float3 ViewDirTS_Norm = normalize(-ViewDirectionTS)@$$// 2) UV parallax direction$//    RoomSize = (W/D, H/D). Dividing here makes the ray step at$//    world rate per axis instead of UV rate, so wider/taller/deeper$//    rooms don't smear sideways during the march.$float SafeZ = max(1e-4, abs(ViewDirTS_Norm.z))@$float2 SafeRoomSize = max(float2(1e-4, 1e-4), RoomSize)@$float2 ParallaxDirUV = (ViewDirTS_Norm.xy / SafeZ) * ParallaxHeight / SafeRoomSize@$$// 3) Steps$float CoarseStepsF = max(1.0, ParallaxSteps)@$$// 4) Raymarch state$float2 RayUV = BaseUV_Tiled@$float CurrentDepth = 1.0@$$float2 PrevUV = RayUV@$float PrevDepth = CurrentDepth@$$float HitMask = 0.0@$float3 HitColor = 0.0@$$// RefineSteps is now an INPUT property in ASE$const int MAX_REFINE = 8@$int RefineStepsLocal = (int)clamp(RefineSteps, 0.0, (float)MAX_REFINE)@$$// Tolerance for "same surface" depth match. Matches the bake's value.$const float SAME_SURFACE_EPS = 0.01@$$// ------------------------------------------------------------$// Per-pixel START PHASE$// Screen-locked, static blue-noise sample (no LayerIndex).$// Interpreted as a fractional-step phase in [0..1).$// ------------------------------------------------------------$float2 startBnUV = frac(ScreenUV * BlueNoiseScale + float2(0.1234, 0.5678))@$float startBn = tex2D(BlueNoiseTex, startBnUV).r@          // 0..1$float startPhase01 = startBn * StartPhaseStrength@         // 0..StartPhaseStrength$$[loop]$for (int LayerIndex = 0@ LayerIndex < (int)CoarseStepsF@ LayerIndex++)${$    PrevUV = RayUV@$    PrevDepth = CurrentDepth@$$    // -------- per-step STATIC blue-noise jitter ----------$    float2 layerOffset = float2((float)LayerIndex * 0.7548777, (float)LayerIndex * 0.5698403)@$$    float2 bnUV = frac(ScreenUV * BlueNoiseScale + layerOffset)@$    float bn = tex2D(BlueNoiseTex, bnUV).r@                 // 0..1$    float jitter = (bn - 0.5) * BlueNoiseStrength@          // fraction of a step$$    // Sample at layer center + start phase + jitter$    float t = ((float)LayerIndex + 0.5 + startPhase01 + jitter) / CoarseStepsF@$$    // Avoid saturate() bunching at t=1@ just stop if outside range$    if (t < 0.0 || t > 1.0)$        break@$$    RayUV = BaseUV_Tiled + ParallaxDirUV * t@$    CurrentDepth = 1.0 - t@$$    if (RayUV.x < 0.0 || RayUV.x > 1.0 || RayUV.y < 0.0 || RayUV.y > 1.0)$        break@$$    float2 depthRG = tex2D(HeightIntervalTex, RayUV).rg@$$    if (CurrentDepth < depthRG.r && CurrentDepth > depthRG.g)$    {$        // --- Binary refine between previous and current sample ---$        float2 Auv = PrevUV@  float Adepth = PrevDepth@$        float2 Buv = RayUV@   float Bdepth = CurrentDepth@$$        [unroll]$        for (int r = 0@ r < MAX_REFINE@ r++)$        {$            if (r >= RefineStepsLocal)$                break@$$            float2 Muv = (Auv + Buv) * 0.5@$            float Mdepth = (Adepth + Bdepth) * 0.5@$$            float2 mRG = tex2D(HeightIntervalTex, Muv).rg@$$            if (Mdepth < mRG.r && Mdepth > mRG.g)$            {$                Buv = Muv@  Bdepth = Mdepth@$            }$            else$            {$                Auv = Muv@  Adepth = Mdepth@$            }$        }$$        // ------------------------------------------------------------$        // Depth-aware bilinear color fetch.$        // Standard bilinear blends 4 texels regardless of what they$        // represent. At a surface boundary in the texture (e.g. mug$        // texel next to table texel) that smears one surface's color$        // into the other. Here we do the 4 taps manually and zero-$        // weight any tap whose depth doesn't match the surface the$        // raymarch actually hit, then renormalize the bilinear weights$        // over the surviving taps.$        //$        // Requires color + depth textures to be imported as$        // FilterMode.Point with mipmaps OFF, so each tex2D returns$        // exactly one texel.$        // ------------------------------------------------------------$$        // Reference depth = front face of the surface under Buv.$        float hitFrontD = tex2D(HeightIntervalTex, Buv).r@$$        // Buv -> texel-space, find the 4 surrounding texel centers.$        float2 texSize = TexelSize.zw@        // (width, height)$        float2 invSize = TexelSize.xy@        // (1/width, 1/height)$        float2 uvPx    = Buv * texSize - 0.5@$        float2 uvF     = floor(uvPx)@$        float2 fr      = uvPx - uvF@$$        float2 uv00 = (uvF + 0.5) * invSize@$        float2 uv10 = uv00 + float2(invSize.x, 0.0)@$        float2 uv01 = uv00 + float2(0.0, invSize.y)@$        float2 uv11 = uv00 + invSize@$$        // 4 color + 4 depth taps (point fetches).$        float3 c00 = tex2D(InteriorColorTex,  uv00).rgb@$        float3 c10 = tex2D(InteriorColorTex,  uv10).rgb@$        float3 c01 = tex2D(InteriorColorTex,  uv01).rgb@$        float3 c11 = tex2D(InteriorColorTex,  uv11).rgb@$$        float  d00 = tex2D(HeightIntervalTex, uv00).r@$        float  d10 = tex2D(HeightIntervalTex, uv10).r@$        float  d01 = tex2D(HeightIntervalTex, uv01).r@$        float  d11 = tex2D(HeightIntervalTex, uv11).r@$$        // Standard bilinear weights.$        float w00 = (1.0 - fr.x) * (1.0 - fr.y)@$        float w10 =        fr.x  * (1.0 - fr.y)@$        float w01 = (1.0 - fr.x) *        fr.y@$        float w11 =        fr.x  *        fr.y@$$        // Surface-match mask: 1 if this tap belongs to the hit surface.$        float m00 = step(abs(d00 - hitFrontD), SAME_SURFACE_EPS)@$        float m10 = step(abs(d10 - hitFrontD), SAME_SURFACE_EPS)@$        float m01 = step(abs(d01 - hitFrontD), SAME_SURFACE_EPS)@$        float m11 = step(abs(d11 - hitFrontD), SAME_SURFACE_EPS)@$$        float W00 = w00 * m00@$        float W10 = w10 * m10@$        float W01 = w01 * m01@$        float W11 = w11 * m11@$$        float wSum = W00 + W10 + W01 + W11@$$        if (wSum > 1e-5)$        {$            HitColor = (c00 * W00 + c10 * W10 + c01 * W01 + c11 * W11) / wSum@$        }$        else$        {$            // All 4 taps mismatch (degenerate corner). Fall back to point.$            HitColor = tex2D(InteriorColorTex, Buv).rgb@$        }$$        HitMask = 1.0@$        break@$    }$}$$return float4(HitColor, HitMask)@;4;Create;19;True;BaseUV;FLOAT2;0,0;In;;Inherit;False;True;ViewDirectionTS;FLOAT3;0,0,0;In;;Inherit;False;True;HeightIntervalTex;SAMPLER2D;;In;;Inherit;False;True;InteriorColorTex;SAMPLER2D;;In;;Inherit;False;True;ParallaxSteps;FLOAT;0;In;;Inherit;False;True;ParallaxHeight;FLOAT;0;In;;Inherit;False;True;PixelPos;FLOAT2;0,0;In;;Inherit;False;True;FramePhase;FLOAT;0;In;;Inherit;False;True;DDX_UV;FLOAT2;0,0;In;;Inherit;False;True;DDY_UV;FLOAT2;0,0;In;;Inherit;False;True;BlueNoiseTex;SAMPLER2D;_Sampler12151;In;;Inherit;False;True;BlueNoiseScale;FLOAT;0;In;;Inherit;False;True;BlueNoiseStrength;FLOAT;0;In;;Inherit;False;True;UseScreenSpaceBlueNoise;FLOAT;0;In;;Inherit;False;True;ScreenUV;FLOAT2;0,0;In;;Inherit;False;True;StartPhaseStrength;FLOAT;1;In;;Inherit;False;True;RefineSteps;FLOAT;6;In;;Inherit;False;True;TexelSize;FLOAT4;0,0,0,0;In;;Inherit;False;True;RoomSize;FLOAT2;1,1;In;;Inherit;False;Parallax Raymarch -Blue Noise, Coarse to Fine;True;False;0;;False;19;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;2;SAMPLER2D;;False;3;SAMPLER2D;;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT2;0,0;False;7;FLOAT;0;False;8;FLOAT2;0,0;False;9;FLOAT2;0,0;False;10;SAMPLER2D;_Sampler12151;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;14;FLOAT2;0,0;False;15;FLOAT;1;False;16;FLOAT;6;False;17;FLOAT4;0,0,0,0;False;18;FLOAT2;1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;640;-1907.892,34.45731;Inherit;False;630;BaseUVs;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;641;-1670.65,37.12759;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;642;-1439.648,29.12772;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;643;-1173.648,36.12759;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;644;-476.2783,157.9503;Inherit;False;uv3;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;645;-709.5986,127.6209;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;646;-890.285,111.5431;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;647;1834.369,-670.9926;Inherit;False;Property;_RoomSize;Room Size (W/D, H/D);3;0;Create;False;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;648;2238.359,-673.5181;Inherit;False;Room Size;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;649;817.1724,250.0134;Inherit;False;644;uv3;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;650;-1185.816,174.0109;Inherit;False;648;Room Size;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.AbsOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;651;-465.8057,469.4157;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;652;-96.93912,368.9053;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;653;-875.645,659.2588;Inherit;False;648;Room Size;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;654;-684.6453,631.2588;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;655;-470.6452,574.2582;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;656;2971.104,-325.3194;Inherit;False;630;BaseUVs;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;657;1872.692,-1651.254;Inherit;True;Property;_BlueNoise;Blue Noise;18;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;e218b7c6dfec4374b9f1763b318f92ae;e218b7c6dfec4374b9f1763b318f92ae;False;white;Auto;Texture2D;False;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;567;4932.134,-709.2418;Float;False;False;-1;3;AmplifyShaderEditor.MaterialInspector;0;1;New Amplify Shader;0770190933193b94aaa3065e307002fa;True;ShadowCaster;0;1;ShadowCaster;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;False;;True;1;RenderType=Opaque=RenderType;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;566;5044.134,-1142.242;Float;False;True;-1;3;AmplifyShaderEditor.MaterialInspector;0;7;Amplify Creations/Real Fake Interior Unlit BiRP;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;7;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;False;;True;1;RenderType=Opaque=RenderType;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;5;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Cast Shadows;1;0;Write Depth;0;0;Vertex Position;1;0;0;2;True;True;False;;False;0
WireConnection;573;0;601;0
WireConnection;573;1;616;5
WireConnection;574;0;639;0
WireConnection;575;0;576;0
WireConnection;575;1;615;0
WireConnection;576;0;574;0
WireConnection;576;1;574;1
WireConnection;576;2;574;2
WireConnection;577;0;574;3
WireConnection;578;0;604;5
WireConnection;578;1;612;0
WireConnection;580;0;579;0
WireConnection;580;1;592;0
WireConnection;581;0;580;0
WireConnection;581;1;649;0
WireConnection;582;0;581;0
WireConnection;583;0;613;0
WireConnection;583;1;594;0
WireConnection;584;1;583;0
WireConnection;584;3;582;0
WireConnection;585;1;591;0
WireConnection;587;0;644;0
WireConnection;587;1;585;0
WireConnection;588;0;652;0
WireConnection;588;1;587;0
WireConnection;589;0;586;0
WireConnection;590;0;588;0
WireConnection;591;0;589;0
WireConnection;592;0;590;0
WireConnection;592;1;590;1
WireConnection;592;2;590;2
WireConnection;593;0;600;0
WireConnection;594;0;595;0
WireConnection;596;0;597;1
WireConnection;596;1;597;2
WireConnection;598;0;593;0
WireConnection;599;0;606;5
WireConnection;599;1;605;0
WireConnection;600;0;578;0
WireConnection;601;0;575;0
WireConnection;601;1;598;0
WireConnection;601;2;577;0
WireConnection;602;0;606;4
WireConnection;602;1;617;0
WireConnection;603;0;573;0
WireConnection;603;1;599;0
WireConnection;603;2;602;0
WireConnection;604;1;584;0
WireConnection;606;1;656;0
WireConnection;618;0;619;0
WireConnection;620;0;622;0
WireConnection;622;0;621;0
WireConnection;622;1;618;0
WireConnection;624;0;627;1
WireConnection;624;1;627;2
WireConnection;625;0;624;0
WireConnection;625;1;629;0
WireConnection;629;0;628;1
WireConnection;629;1;628;2
WireConnection;630;0;620;0
WireConnection;632;0;634;0
WireConnection;634;0;633;2
WireConnection;637;0;621;0
WireConnection;638;0;621;0
WireConnection;639;0;630;0
WireConnection;639;1;631;0
WireConnection;639;2;626;0
WireConnection;639;3;623;0
WireConnection;639;4;635;0
WireConnection;639;5;636;0
WireConnection;639;6;625;0
WireConnection;639;7;632;0
WireConnection;639;8;638;0
WireConnection;639;9;637;0
WireConnection;639;10;657;0
WireConnection;639;11;607;0
WireConnection;639;12;608;0
WireConnection;639;13;609;0
WireConnection;639;14;596;0
WireConnection;639;15;610;0
WireConnection;639;16;611;0
WireConnection;639;17;614;0
WireConnection;639;18;648;0
WireConnection;641;0;640;0
WireConnection;642;0;641;0
WireConnection;643;0;642;0
WireConnection;644;0;645;0
WireConnection;645;0;646;0
WireConnection;646;0;643;0
WireConnection;646;1;650;0
WireConnection;648;0;647;0
WireConnection;651;0;585;0
WireConnection;652;0;651;0
WireConnection;652;1;655;0
WireConnection;654;0;653;0
WireConnection;655;0;654;0
WireConnection;655;1;654;1
WireConnection;566;0;603;0
ASEEND*/
//CHKSM=C68AEF363C9346745EAA11EE0D5B7F52BB025D40
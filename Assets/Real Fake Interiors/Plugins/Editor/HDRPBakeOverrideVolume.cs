// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;
using UnityEngine;

#if HDRP_EXISTS
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
#endif

namespace RealFakeInteriors
{
#if UNITY_EDITOR
	// =========================================================================
	// HDRP bake-time post-processing override
	// -------------------------------------------------------------------------
	// HDRP renders every Camera.Render() through its full frame loop, including
	// any active Volume overrides for Bloom, Ambient Occlusion, etc. Those
	// effects bake themselves into the captured color texture as cross-surface
	// color bleed (silhouette smear) that the parallax shader then reads at
	// runtime as "smearing."
	//
	// To make the bake deterministic regardless of the user's HDRP project
	// configuration, this helper drops a temporary Volume into the scene with
	// a high-priority profile that neutralizes all common screen-space post
	// effects. The Volume is destroyed after the bake.
	//
	// The HDRP body compiles only when the package is present (HDRP_EXISTS);
	// on BiRP / URP-only projects TryCreate returns null and this is a no-op.
	// =========================================================================

	internal sealed class HDRPBakeOverrideVolume : IDisposable
	{
	#if HDRP_EXISTS
		// Stored as their universal base types so the fields exist on any
		// pipeline; only assigned/used inside the HDRP_EXISTS body.
		private GameObject volumeGO;
		private VolumeProfile profile;
	#endif

		public static IDisposable TryCreate()
		{
		#if HDRP_EXISTS
			if ( !( GraphicsSettings.currentRenderPipeline is HDRenderPipelineAsset ) )
				return null;

			try { return new HDRPBakeOverrideVolume(); }
			catch ( Exception ex )
			{
				Debug.LogWarning( $"[RoomBaker] HDRP bake volume injection skipped: {ex.Message}" );
				return null;
			}
		#else
			return null;
		#endif
		}

	#if HDRP_EXISTS
		private HDRPBakeOverrideVolume()
		{
			// If anything below throws, roll back whatever was already created so
			// the scene is left exactly as it was before. TryCreate would
			// otherwise swallow the exception and never call Dispose.
			try
			{
				profile = ScriptableObject.CreateInstance<VolumeProfile>();
				profile.hideFlags = HideFlags.HideAndDontSave;
				profile.name = "FakeInteriorBakeProfile_Transient";

				AddNeutralOverrides( profile );

				volumeGO = new GameObject( "FakeInteriorBake_TempVolume" )
				{
					hideFlags = HideFlags.HideAndDontSave
				};

				var volume = volumeGO.AddComponent<Volume>();
				volume.isGlobal = true;
				volume.priority = 1000f;
				volume.weight = 1f;
				volume.sharedProfile = profile;
			}
			catch
			{
				Dispose();
				throw;
			}
		}

		// Every standard HDRP post effect set to its "no-op" configuration so
		// the captured texture is raw lit color with no display-side transform.
		// VolumeProfile.Add<T>(true) overrides all the component's parameters;
		// Override(value) sets both the value and its overrideState.
		private static void AddNeutralOverrides( VolumeProfile profile )
		{
			// ---- Smear-causing effects ----
			profile.Add<Bloom>( true ).intensity.Override( 0f );
			profile.Add<ScreenSpaceAmbientOcclusion>( true ).intensity.Override( 0f );
			profile.Add<ScreenSpaceReflection>( true ).enabled.Override( false );
			profile.Add<GlobalIllumination>( true ).enable.Override( false );

			// ---- Lens / framing ----
			profile.Add<Vignette>( true ).intensity.Override( 0f );
			profile.Add<ChromaticAberration>( true ).intensity.Override( 0f );
			profile.Add<LensDistortion>( true ).intensity.Override( 0f );
			profile.Add<MotionBlur>( true ).intensity.Override( 0f );
			profile.Add<FilmGrain>( true ).intensity.Override( 0f );
			profile.Add<PaniniProjection>( true ).distance.Override( 0f );
			profile.Add<DepthOfField>( true ).focusMode.Override( DepthOfFieldMode.Off );

			// ---- Tonemap / exposure ----
			profile.Add<Tonemapping>( true ).mode.Override( TonemappingMode.None );

			var exposure = profile.Add<Exposure>( true );
			exposure.mode.Override( ExposureMode.Fixed );
			exposure.fixedExposure.Override( 0f );
			exposure.compensation.Override( 0f );

			// ---- Color grading (neutralized) ----
			var whiteBalance = profile.Add<WhiteBalance>( true );
			whiteBalance.temperature.Override( 0f );
			whiteBalance.tint.Override( 0f );

			var colorAdjustments = profile.Add<ColorAdjustments>( true );
			colorAdjustments.postExposure.Override( 0f );
			colorAdjustments.contrast.Override( 0f );
			colorAdjustments.hueShift.Override( 0f );
			colorAdjustments.saturation.Override( 0f );
			colorAdjustments.colorFilter.Override( Color.white );

			profile.Add<SplitToning>( true ).balance.Override( 0f );
		}
	#endif

		public void Dispose()
		{
		#if HDRP_EXISTS
			if ( volumeGO != null )
				UnityEngine.Object.DestroyImmediate( volumeGO );

			if ( profile != null )
				UnityEngine.Object.DestroyImmediate( profile );
		#endif
		}
	}
#endif
}

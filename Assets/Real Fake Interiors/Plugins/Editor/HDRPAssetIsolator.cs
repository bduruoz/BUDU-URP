// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;

#if UNITY_EDITOR
using UnityEditor;
#endif

#if HDRP_EXISTS
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
#endif

namespace RealFakeInteriors
{
#if UNITY_EDITOR
	// =========================================================================
	// HDRP Asset feature-flag isolation
	// -------------------------------------------------------------------------
	// Some HDRP effects (SSAO, SSR, SSGI, decals, motion vectors) have a
	// pipeline-level "supports X" toggle on the HDRP Asset. When enabled,
	// the corresponding screen-space pass runs regardless of what volumes
	// say. Volume overrides can set intensity to 0, but the math still runs
	// and can leak into the captured texture.
	//
	// These flags live in the RenderPipelineSettings struct and have no public
	// setter, so they're flipped through SerializedObject (an editor API) and
	// restored on dispose. The HDRP body compiles only when the package is
	// present (HDRP_EXISTS); otherwise TryCreate returns null.
	// =========================================================================

	internal sealed class HDRPAssetIsolator : IDisposable
	{
	#if HDRP_EXISTS
		// HDRP RenderPipelineSettings flag names that affect rendering and
		// could cross-pollinate colors at silhouettes. Any flag not present
		// in the user's HDRP version is skipped silently.
		private static readonly string[] FlagsToDisable =
		{
			"supportSSAO",
			"supportSSR",
			"supportSSRTransparent",
			"supportSSGI",
			"supportMotionVectors",
			"supportDecals",
			"supportTransparentDepthPrepass",
			"supportTransparentDepthPostpass",
			"supportDistortion",
		};

		private readonly UnityEngine.Object asset;
		private readonly Dictionary<string, bool> saved = new Dictionary<string, bool>();
	#endif

		public static IDisposable TryCreate()
		{
		#if HDRP_EXISTS
			if ( !( GraphicsSettings.currentRenderPipeline is HDRenderPipelineAsset asset ) )
				return null;

			try { return new HDRPAssetIsolator( asset ); }
			catch ( Exception ex )
			{
				Debug.LogWarning( $"[RoomBaker] HDRP Asset isolation skipped: {ex.Message}" );
				return null;
			}
		#else
			return null;
		#endif
		}

	#if HDRP_EXISTS
		private HDRPAssetIsolator( HDRenderPipelineAsset asset )
		{
			this.asset = asset;

			// If anything throws while disabling flags, restore whatever we
			// already captured so the HDRP Asset is left exactly as it was.
			// TryCreate would otherwise swallow the exception and never call
			// Dispose, leaving the asset's support flags turned off.
			try
			{
				var so = new SerializedObject( asset );
				bool anyChanged = false;

				foreach ( var name in FlagsToDisable )
				{
					var prop = so.FindProperty( $"m_RenderPipelineSettings.{name}" );
					if ( prop == null ) continue;
					if ( prop.propertyType != SerializedPropertyType.Boolean ) continue;

					saved[ name ] = prop.boolValue;
					if ( prop.boolValue )
					{
						prop.boolValue = false;
						anyChanged = true;
					}
				}

				if ( anyChanged )
					so.ApplyModifiedPropertiesWithoutUndo();
			}
			catch
			{
				Dispose();
				throw;
			}
		}
	#endif

		public void Dispose()
		{
		#if HDRP_EXISTS
			if ( asset == null || saved.Count == 0 ) return;

			var so = new SerializedObject( asset );
			foreach ( var kv in saved )
			{
				var prop = so.FindProperty( $"m_RenderPipelineSettings.{kv.Key}" );
				if ( prop != null && prop.propertyType == SerializedPropertyType.Boolean )
					prop.boolValue = kv.Value;
			}
			so.ApplyModifiedPropertiesWithoutUndo();
		#endif
		}
	}
#endif
}

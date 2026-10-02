// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;

#if UNITY_EDITOR
using UnityEditor;
#endif

#if URP_EXISTS
using System.Reflection;
using System.Collections.Generic;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
#endif

namespace RealFakeInteriors
{
#if UNITY_EDITOR
	// Disables every active URP ScriptableRendererFeature on the active URP asset
	// for the duration of a bake, restoring them on Dispose. The URP-specific body
	// is compiled only when the Universal package is present (URP_EXISTS); on
	// BiRP / HDRP-only projects the type still exists but is a no-op.
	internal sealed class URPBakeRenderFeatureScope : IDisposable
	{
	#if URP_EXISTS
		// Remember each feature's state as it was before we touched it.
		private readonly List<(ScriptableRendererFeature feature, bool wasActive)> previous = new();
	#endif

		public URPBakeRenderFeatureScope()
		{
			DisableUrpFeatures();
		}

		private void DisableUrpFeatures()
		{
		#if URP_EXISTS
			var urp = GraphicsSettings.currentRenderPipeline as UniversalRenderPipelineAsset;
			if ( urp == null )
				return;

			var field = typeof( UniversalRenderPipelineAsset )
				.GetField( "m_RendererDataList", BindingFlags.Instance | BindingFlags.NonPublic );
			if ( field == null )
				return;

			if ( field.GetValue( urp ) is not ScriptableRendererData[] rendererDataList )
				return;

			foreach ( var data in rendererDataList )
			{
				if ( data == null )
					continue;

				foreach ( var feature in data.rendererFeatures )
				{
					if ( feature == null )
					continue;       // skip empty/unassigned slots

					bool wasActive = feature.isActive;
					if ( !wasActive )
						continue;            // already off � nothing to change or restore

					previous.Add( (feature, wasActive) ); // capture prior state
					feature.SetActive( false );
				}
			}
		#endif
		}

		public void Dispose()
		{
		#if URP_EXISTS
			foreach ( var (feature, wasActive) in previous )
			{
				if ( feature != null && feature.isActive != wasActive )
					feature.SetActive( wasActive );        // restore to exactly what it was
			}
			previous.Clear();
		#endif
		}
	}
#endif
}

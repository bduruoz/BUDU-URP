// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;
using System.IO;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.SceneManagement;

#if UNITY_EDITOR
using UnityEditor;
using UnityEditor.SceneManagement;
#endif

namespace RealFakeInteriors
{
	[DisallowMultipleComponent]
	public class FakeInteriorBakeTool : MonoBehaviour
	{
	#if UNITY_EDITOR
		[SerializeField] private FakeInteriorBakeSettings settingsAsset;

		[SerializeField] private string pendingAssetName = "";
		[SerializeField] private string pendingBakeName = "";
		[SerializeField] private string pendingOutputFolderAssetPath = "";
		[SerializeField] private int pendingBakeResolution = 1024;
		[SerializeField] private int pendingSupersample = 4;
		[SerializeField] private int pendingAnisoLevel = 8;
		[SerializeField] private float pendingHorizontalAspect = 1f;
		[SerializeField] private int pendingProbeResolution = 512;
		[SerializeField] private DepthRGFormat pendingDepthFormat = DepthRGFormat.Texture2D;
		[SerializeField] private bool pendingCreateMaterial = false;
		[SerializeField] private Material pendingTargetMaterial;
		[SerializeField] private Shader pendingCustomShader;

		[SerializeField] private GameObject roomGO;
		[SerializeField] private GameObject furnitureGO;

		[SerializeField] private Camera frontCamera;
		[SerializeField] private Camera backCamera;
		[SerializeField] private ReflectionProbe reflectionProbe;

		[SerializeField, HideInInspector] private bool disableAutoLighting = true;
		[SerializeField, HideInInspector] private bool writeDebugDepthSingles = false;

		private const string DepthShaderPath = "Assets/Real Fake Interiors/Plugins/EditorResources/RoomBaker_OrthoDepth01.shader";
		private const string DepthShaderName = "Hidden/RoomBaker/OrthoDepth01_ViewLinear";
		private const bool FlipBackHorizontally = true;

		private const string DefaultRoomName = "Room - Cubemap";
		private const string DefaultFurnitureName = "Furniture - Color + Depth";

		[NonSerialized] private Material depthMat;

		private void OnEnable()
		{
			disableAutoLighting = true;
			writeDebugDepthSingles = false;

			EnsurePendingDefaults();
			ResolveAutoReferences( false );
			ResolveDefaultBakeObjects( false );
			TryRestoreSceneBindingsFromAsset();
			EnsureDepthMaterialReady();

			if ( settingsAsset != null )
				LoadPendingFromAsset();
		}

		private void OnDisable()
		{
			if ( depthMat != null )
			{
				DestroyImmediate( depthMat );
				depthMat = null;
			}
		}

		internal FakeInteriorBakeSettings SettingsAsset => settingsAsset;
		internal bool HasSettingsAsset => settingsAsset != null;

		internal void EnsurePendingDefaults()
		{
			string safeRootName = Sanitize( string.IsNullOrWhiteSpace( gameObject.name ) ? "BakeRoot" : gameObject.name );

			if ( string.IsNullOrWhiteSpace( pendingAssetName ) )
				pendingAssetName = $"{safeRootName}_BakeSettings";

			if ( string.IsNullOrWhiteSpace( pendingBakeName ) )
				pendingBakeName = safeRootName;

			NormalizePendingSettings();
		}

		internal void NormalizePendingSettings()
		{
			pendingOutputFolderAssetPath = ( pendingOutputFolderAssetPath ?? string.Empty ).Replace( "\\", "/" ).Trim();

			if ( !string.IsNullOrWhiteSpace( pendingOutputFolderAssetPath ) &&
				!pendingOutputFolderAssetPath.StartsWith( "Assets", StringComparison.OrdinalIgnoreCase ) )
			{
				pendingOutputFolderAssetPath = string.Empty;
			}

			pendingBakeResolution = ClampToAllowed( pendingBakeResolution, 128, 256, 512, 1024, 2048, 4096 );
			pendingSupersample = pendingSupersample == 2 ? 2 : 4;
			pendingAnisoLevel = Mathf.Clamp( pendingAnisoLevel, 0, 16 );
			pendingHorizontalAspect = SnapAspect( pendingHorizontalAspect );
			pendingProbeResolution = ClampToAllowed( pendingProbeResolution, 16, 32, 64, 128, 256, 512, 1024, 2048 );
		}

		internal void LoadPendingFromAsset()
		{
			if ( settingsAsset == null )
				return;

			NormalizeSettingsAsset();

			pendingBakeName = settingsAsset.bakeName;
			pendingOutputFolderAssetPath = settingsAsset.outputFolderAssetPath;
			pendingBakeResolution = settingsAsset.bakeResolution;
			pendingSupersample = settingsAsset.supersample;
			pendingAnisoLevel = settingsAsset.anisoLevel;
			pendingHorizontalAspect = settingsAsset.horizontalAspect;
			pendingProbeResolution = settingsAsset.probeResolution;
			pendingDepthFormat = settingsAsset.depthFormat;
			pendingCreateMaterial = settingsAsset.createMaterial;
			pendingTargetMaterial = settingsAsset.targetMaterial;
			pendingCustomShader = settingsAsset.customShader;

			string assetPath = AssetDatabase.GetAssetPath( settingsAsset );
			if ( !string.IsNullOrWhiteSpace( assetPath ) )
				pendingAssetName = Path.GetFileNameWithoutExtension( assetPath );

			NormalizePendingSettings();
			TryRestoreSceneBindingsFromAsset();
		}

		internal void PushPendingToAsset()
		{
			if ( settingsAsset == null )
				return;

			EnsurePendingDefaults();
			NormalizePendingSettings();

			settingsAsset.bakeName = string.IsNullOrWhiteSpace( pendingBakeName ) ? "Room01" : pendingBakeName;
			settingsAsset.outputFolderAssetPath = pendingOutputFolderAssetPath;
			settingsAsset.bakeResolution = pendingBakeResolution;
			settingsAsset.supersample = pendingSupersample;
			settingsAsset.anisoLevel = pendingAnisoLevel;
			settingsAsset.horizontalAspect = pendingHorizontalAspect;
			settingsAsset.probeResolution = pendingProbeResolution;
			settingsAsset.depthFormat = pendingDepthFormat;
			settingsAsset.createMaterial = pendingCreateMaterial;
			settingsAsset.targetMaterial = pendingTargetMaterial;
			settingsAsset.customShader = pendingCustomShader;

			NormalizeSettingsAsset();
		}

		internal void AssignSettingsAsset( FakeInteriorBakeSettings asset )
		{
			settingsAsset = asset;
			ResolveAutoReferences( false );
			ResolveDefaultBakeObjects( false );

			if ( settingsAsset != null )
				LoadPendingFromAsset();
			else
				EnsurePendingDefaults();

			PersistComponent();
		}

		internal void ResolveAutoReferences( bool force )
		{
			var cams = GetComponentsInChildren<Camera>( true );
			var probes = GetComponentsInChildren<ReflectionProbe>( true );

			if ( force || frontCamera == null )
				frontCamera = cams.FirstOrDefault( c => c != null && c.name == "Camera_FRONT" ) ?? frontCamera;

			if ( force || backCamera == null )
				backCamera = cams.FirstOrDefault( c => c != null && c.name == "Camera_BACK" ) ?? backCamera;

			if ( force || reflectionProbe == null )
			{
				reflectionProbe =
					probes.FirstOrDefault( p => p != null && p.name == "Reflection Probe" )
					?? probes.FirstOrDefault( p => p != null && p.name == "ReflectionProbe" )
					?? ( probes.Length == 1 ? probes[ 0 ] : reflectionProbe );
			}
		}

		internal void ResolveDefaultBakeObjects( bool force )
		{
			if ( force || roomGO == null )
				roomGO = FindSceneObjectByName( DefaultRoomName ) ?? roomGO;

			if ( force || furnitureGO == null )
				furnitureGO = FindSceneObjectByName( DefaultFurnitureName ) ?? furnitureGO;
		}

		internal void NormalizeSettingsAsset()
		{
			if ( settingsAsset == null )
				return;

			settingsAsset.outputFolderAssetPath = ( settingsAsset.outputFolderAssetPath ?? string.Empty ).Replace( "\\", "/" ).Trim();

			if ( !string.IsNullOrWhiteSpace( settingsAsset.outputFolderAssetPath ) &&
				!settingsAsset.outputFolderAssetPath.StartsWith( "Assets", StringComparison.OrdinalIgnoreCase ) )
			{
				settingsAsset.outputFolderAssetPath = string.Empty;
			}

			if ( string.IsNullOrWhiteSpace( settingsAsset.bakeName ) )
				settingsAsset.bakeName = !string.IsNullOrWhiteSpace( pendingBakeName ) ? pendingBakeName : "Room01";

			settingsAsset.bakeResolution = ClampToAllowed( settingsAsset.bakeResolution, 128, 256, 512, 1024, 2048, 4096 );
			settingsAsset.supersample = settingsAsset.supersample == 2 ? 2 : 4;
			settingsAsset.anisoLevel = Mathf.Clamp( settingsAsset.anisoLevel, 0, 16 );
			settingsAsset.horizontalAspect = SnapAspect( settingsAsset.horizontalAspect );
			settingsAsset.probeResolution = ClampToAllowed( settingsAsset.probeResolution, 16, 32, 64, 128, 256, 512, 1024, 2048 );
		}

		internal void TryRestoreSceneBindingsFromAsset()
		{
			if ( settingsAsset == null )
				return;

			if ( roomGO == null )
				roomGO = FindSceneObjectFromHints( settingsAsset.roomObjectPath, settingsAsset.roomObjectName );

			if ( furnitureGO == null )
				furnitureGO = FindSceneObjectFromHints( settingsAsset.furnitureObjectPath, settingsAsset.furnitureObjectName );
		}

		internal void CaptureSceneBindingsToAsset()
		{
			if ( settingsAsset == null )
				return;

			if ( roomGO != null )
			{
				settingsAsset.roomObjectPath = GetHierarchyPath( roomGO.transform );
				settingsAsset.roomObjectName = roomGO.name;
			}

			if ( furnitureGO != null )
			{
				settingsAsset.furnitureObjectPath = GetHierarchyPath( furnitureGO.transform );
				settingsAsset.furnitureObjectName = furnitureGO.name;
			}
		}

		internal bool HasRequiredAutoReferences()
		{
			ResolveAutoReferences( false );
			return frontCamera != null && backCamera != null && reflectionProbe != null;
		}

		internal bool HasRequiredBakeObjects()
		{
			ResolveDefaultBakeObjects( false );
			TryRestoreSceneBindingsFromAsset();
			return roomGO != null && furnitureGO != null;
		}

		private static bool IsValidAssetsFolderPath( string path )
		{
			if ( string.IsNullOrWhiteSpace( path ) )
				return false;

			path = path.Replace( "\\", "/" ).Trim();

			if ( !path.StartsWith( "Assets", StringComparison.OrdinalIgnoreCase ) )
				return false;

			if ( AssetDatabase.IsValidFolder( path ) )
				return true;

			string abs = ToAbsolutePath( path );
			if ( Directory.Exists( abs ) )
			{
				AssetDatabase.Refresh( ImportAssetOptions.ForceSynchronousImport );
				return AssetDatabase.IsValidFolder( path ) || Directory.Exists( abs );
			}

			return false;
		}

		internal bool HasValidOutputFolder()
		{
			if ( settingsAsset != null )
				return IsValidAssetsFolderPath( settingsAsset.outputFolderAssetPath );

			return IsValidAssetsFolderPath( pendingOutputFolderAssetPath );
		}

		internal bool HasValidPendingOutputFolder()
		{
			return IsValidAssetsFolderPath( pendingOutputFolderAssetPath );
		}

		internal string GetEffectiveOutputFolder()
		{
			if ( IsValidAssetsFolderPath( pendingOutputFolderAssetPath ) )
				return pendingOutputFolderAssetPath;

			if ( settingsAsset != null && IsValidAssetsFolderPath( settingsAsset.outputFolderAssetPath ) )
				return settingsAsset.outputFolderAssetPath;

			return string.Empty;
		}

		internal void SetPendingOutputFolder( string folderAssetPath )
		{
			pendingOutputFolderAssetPath = string.IsNullOrWhiteSpace( folderAssetPath )
				? string.Empty
				: folderAssetPath.Replace( "\\", "/" ).Trim();

			NormalizePendingSettings();

			if ( settingsAsset != null )
				settingsAsset.outputFolderAssetPath = pendingOutputFolderAssetPath;
		}

		internal void PersistComponent()
		{
			EditorUtility.SetDirty( this );
			PrefabUtility.RecordPrefabInstancePropertyModifications( this );

			if ( gameObject.scene.IsValid() && !string.IsNullOrEmpty( gameObject.scene.path ) )
				EditorSceneManager.MarkSceneDirty( gameObject.scene );
		}

		internal void PersistAsset()
		{
			if ( settingsAsset == null )
				return;

			PushPendingToAsset();
			CaptureSceneBindingsToAsset();

			EditorUtility.SetDirty( settingsAsset );
			AssetDatabase.SaveAssets();
		}

		internal FakeInteriorBakeSettings CreateAndAssignSettingsAssetAtFolder( string folderAssetPath, string assetName, string bakeName )
		{
			if ( string.IsNullOrWhiteSpace( folderAssetPath ) || !IsValidAssetsFolderPath( folderAssetPath ) )
				return null;

			EnsurePendingDefaults();
			NormalizePendingSettings();

			SetPendingOutputFolder( folderAssetPath );
			pendingAssetName = string.IsNullOrWhiteSpace( assetName ) ? pendingAssetName : assetName;
			pendingBakeName = string.IsNullOrWhiteSpace( bakeName ) ? pendingBakeName : bakeName;

			string fallbackRootName = Sanitize( string.IsNullOrWhiteSpace( gameObject.name ) ? "BakeRoot" : gameObject.name );
			string safeAssetName = Sanitize( string.IsNullOrWhiteSpace( pendingAssetName ) ? $"{fallbackRootName}_BakeSettings" : pendingAssetName );

			string assetPath = AssetDatabase.GenerateUniqueAssetPath( $"{folderAssetPath}/{safeAssetName}.asset" );

			var asset = ScriptableObject.CreateInstance<FakeInteriorBakeSettings>();

			settingsAsset = asset;
			PushPendingToAsset();

			if ( roomGO != null )
			{
				asset.roomObjectPath = GetHierarchyPath( roomGO.transform );
				asset.roomObjectName = roomGO.name;
			}

			if ( furnitureGO != null )
			{
				asset.furnitureObjectPath = GetHierarchyPath( furnitureGO.transform );
				asset.furnitureObjectName = furnitureGO.name;
			}

			AssetDatabase.CreateAsset( asset, assetPath );
			AssetDatabase.SaveAssets();
			AssetDatabase.Refresh( ImportAssetOptions.ForceSynchronousImport );

			pendingAssetName = Path.GetFileNameWithoutExtension( assetPath );
			pendingBakeName = asset.bakeName;

			PersistComponent();
			PersistAsset();

			return asset;
		}

		internal bool ValidateFullState( out string whyNot )
		{
			ResolveAutoReferences( false );
			ResolveDefaultBakeObjects( false );
			TryRestoreSceneBindingsFromAsset();
			EnsurePendingDefaults();

			whyNot = null;

			if ( !HasRequiredAutoReferences() )
			{
				whyNot = "Missing Camera_FRONT, Camera_BACK or Reflection Probe.";
				return false;
			}

			if ( !HasRequiredBakeObjects() )
			{
				whyNot = "Assign Room and Furniture.";
				return false;
			}

			if ( !EnsureDepthMaterialReady() )
			{
				whyNot = $"Depth shader not found or not supported.\n{DepthShaderPath}";
				return false;
			}

			string bakeNameToValidate = settingsAsset != null ? settingsAsset.bakeName : pendingBakeName;
			if ( string.IsNullOrWhiteSpace( bakeNameToValidate ) )
			{
				whyNot = "Set a Name.";
				return false;
			}

			if ( settingsAsset != null && !HasValidOutputFolder() )
			{
				whyNot = "Output Folder must be a valid folder under Assets/.";
				return false;
			}

			return true;
		}

		internal bool ValidateCoreForBakePrompt()
		{
			ResolveAutoReferences( false );
			ResolveDefaultBakeObjects( false );
			TryRestoreSceneBindingsFromAsset();

			if ( !HasRequiredAutoReferences() )
				return false;

			if ( !HasRequiredBakeObjects() )
				return false;

			if ( !EnsureDepthMaterialReady() )
				return false;

			if ( string.IsNullOrWhiteSpace( settingsAsset != null ? settingsAsset.bakeName : pendingBakeName ) )
				return false;

			return true;
		}

		private bool EnsureDepthMaterialReady()
		{
			if ( depthMat != null && depthMat.shader != null && depthMat.shader.isSupported )
				return true;

			var shader = Shader.Find( DepthShaderName );
			if ( shader == null )
				shader = AssetDatabase.LoadAssetAtPath<Shader>( DepthShaderPath );

			if ( shader == null )
				return false;

			if ( depthMat != null )
			{
				DestroyImmediate( depthMat );
				depthMat = null;
			}

			depthMat = new Material( shader ) { hideFlags = HideFlags.HideAndDontSave };
			return depthMat.shader != null && depthMat.shader.isSupported;
		}

		internal void BakeAll()
		{
			ResolveAutoReferences( false );
			ResolveDefaultBakeObjects( false );
			TryRestoreSceneBindingsFromAsset();
			EnsurePendingDefaults();

			if ( !EnsureDepthMaterialReady() )
				throw new InvalidOperationException( $"Depth shader missing or unsupported: {DepthShaderPath}" );

			if ( settingsAsset == null )
				throw new InvalidOperationException( "Bake Asset is missing." );

			PushPendingToAsset();

			string folder = settingsAsset.outputFolderAssetPath;
			string safe = Sanitize( settingsAsset.bakeName );

			string colorPath = $"{folder}/{safe}_Color.png";
			string depthPathTex = $"{folder}/{safe}_DepthRG.asset";
			string depthPathEXR = $"{folder}/{safe}_DepthRG.exr";
			string probePath = $"{folder}/{safe}_Probe.exr";

			bool roomState = roomGO.activeSelf;
			bool furnState = furnitureGO.activeSelf;

			// giWorkflowMode was deprecated in 2023.1 in favor of
			// LightingSettings.autoGenerate. Branch on Unity version so the
			// tool compiles cleanly on both Unity 2022 and Unity 6.
#if UNITY_2023_1_OR_NEWER
        // LightingSettings.autoGenerate is also deprecated in Unity 6
        // (the auto-generate workflow is being phased out). The setter
        // still works for now, so suppress the obsolete warning at the
        // call sites and keep the behaviour identical across versions.
        var lightingSettings = Lightmapping.lightingSettings;
#pragma warning disable 618
        bool prevAutoGen = lightingSettings != null && lightingSettings.autoGenerate;
#pragma warning restore 618
#else
			var prevGI = Lightmapping.giWorkflowMode;
#endif
			int prevProbeRes = reflectionProbe.resolution;

			// Wrap the entire bake so URP Renderer Features stay disabled across
			// every Camera.Render() call in this pass (color, depth, probe). The
			// wider scope gives URP time to actually settle into the
			// feature-disabled state between renders.
			using ( new URPBakeRenderFeatureScope() )
				try
				{
					bool depthEXR = settingsAsset.depthFormat == DepthRGFormat.ImageEXR;

					Debug.Log( $"[RoomBaker] ROOT={name} FRONT={frontCamera.name} BACK={backCamera.name} PROBE={reflectionProbe.name}" );
					if ( depthEXR )
						Debug.Log( $"[RoomBaker] Output: Color='{colorPath}' Depth(EXR)='{depthPathEXR}' Probe(EXR)='{probePath}'" );
					else
						Debug.Log( $"[RoomBaker] Output: Color='{colorPath}' Depth(Tex)='{depthPathTex}' Probe(EXR)='{probePath}'" );


					if ( disableAutoLighting )
					{
#if UNITY_2023_1_OR_NEWER
#pragma warning disable 618
                if (lightingSettings != null) lightingSettings.autoGenerate = false;
#pragma warning restore 618
#else
						Lightmapping.giWorkflowMode = Lightmapping.GIWorkflowMode.OnDemand;
#endif
					}

					roomGO.SetActive( false );
					furnitureGO.SetActive( true );

					var renderers = furnitureGO.GetComponentsInChildren<Renderer>( true )
						.Where( r => r != null && r.enabled && r.gameObject.activeInHierarchy )
						.ToArray();

					// After a build-target switch Unity recompiles all shaders
					// for the new platform asynchronously. Rendering before that
					// finishes substitutes a dummy shader and the furniture bakes
					// black — which is why the first bake after switching to
					// WebGL fails but the second succeeds. Block until the
					// compiler is idle so the very first bake is reliable.
					WaitForShaderCompilation();

					// A freshly (re)initialized SRP — e.g. right after a build-
					// target switch — also needs one real render to spin up its
					// RenderGraph/resources, or the first capture comes back
					// black. Prime it once with a tiny throwaway render (resolution-
					// independent, so it doesn't scale with bake settings) instead
					// of duplicating the full-res color pass every bake.
					WarmUpPipeline( frontCamera );

					// Render everything at hi-res then resolve, using depth as a
					// surface mask. Stops bilinear downsampling from blending
					// colors/depths across silhouettes.
					var colorHi = RenderColorHi( frontCamera );
					var frontDepth = RenderDepth01( frontCamera, renderers );
					var backDepth = RenderDepth01( backCamera, renderers );

					if ( writeDebugDepthSingles )
					{
						SaveEXR16( frontDepth, $"{folder}/{safe}_FrontDepth_DEBUG.exr" );
						SaveEXR16( backDepth, $"{folder}/{safe}_BackDepth_DEBUG.exr" );
					}

					var colorFinal = ResolveColorWithDepth( colorHi, frontDepth );
					SavePNG( colorFinal, colorPath );

					var packed = PackDepthRG16( frontDepth, backDepth );
					if ( depthEXR )
						SaveEXR16( packed, depthPathEXR );
					else
						SaveTexture( packed, depthPathTex );

					DestroyImmediate( colorHi );
					DestroyImmediate( colorFinal );
					DestroyImmediate( frontDepth );
					DestroyImmediate( backDepth );
					DestroyImmediate( packed );

					furnitureGO.SetActive( false );
					roomGO.SetActive( true );

					reflectionProbe.resolution = settingsAsset.probeResolution;

					bool ok = Lightmapping.BakeReflectionProbe( reflectionProbe, probePath );
					if ( !ok )
						Debug.LogWarning( "[RoomBaker] BakeReflectionProbe returned false." );

					AssetDatabase.ImportAsset( probePath, ImportAssetOptions.ForceSynchronousImport );
					SetProbeConvolutionNone( probePath );

					GetBakeDimensions( out int finalW, out int finalH, out _, out _ );
					int longSide = Mathf.Max( finalW, finalH );
					ConfigureTexture( colorPath, true, longSide );

					if ( depthEXR )
						ConfigureTexture( depthPathEXR, false, longSide );

					// _RoomSize = (W/D, H/D) for the shader. Derived from the
					// front camera's frustum and the texture aspect.
					float worldH = 2f * frontCamera.orthographicSize;
					float worldW = worldH * Mathf.Max( 0.01f, settingsAsset.horizontalAspect );
					float worldD = Mathf.Max( 1e-4f, frontCamera.farClipPlane - frontCamera.nearClipPlane );
					Vector2 roomSize = new Vector2( worldW / worldD, worldH / worldD );
					Debug.Log( $"[RoomBaker] _RoomSize = ({roomSize.x:F3}, {roomSize.y:F3})" );

					// Material wiring: stamp an existing target, or create a new one
					// if the user opted in. The created material is then assigned to
					// settingsAsset.targetMaterial so subsequent bakes update it in
					// place instead of creating yet another one.
					StampOrCreateMaterial( folder, safe, colorPath, depthEXR ? depthPathEXR : depthPathTex, probePath, roomSize );

					AssetDatabase.SaveAssets();
					AssetDatabase.Refresh( ImportAssetOptions.ForceSynchronousImport );

					Debug.Log( "[RoomBaker] Done." );
				}
				finally
				{
					roomGO.SetActive( roomState );
					furnitureGO.SetActive( furnState );
#if UNITY_2023_1_OR_NEWER
#pragma warning disable 618
            if (lightingSettings != null) lightingSettings.autoGenerate = prevAutoGen;
#pragma warning restore 618
#else
					Lightmapping.giWorkflowMode = prevGI;
#endif
					reflectionProbe.resolution = prevProbeRes;
				}
		}

		// Real Fake Interior shader name per pipeline. Used by the auto-create
		// material flow when no custom shader override is set.
		private const string ShaderNameBiRP = "Amplify Creations/Real Fake Interior Unlit BiRP";
		private const string ShaderNameURP = "Amplify Creations/Real Fake Interior Unlit URP";
		private const string ShaderNameHDRP = "Amplify Creations/Real Fake Interior Unlit HDRP";

		// Detects the active render pipeline by inspecting the type name of the
		// currently-assigned RenderPipelineAsset. Avoids hard references to URP
		// or HDRP assemblies so this file compiles in any project.
		internal static Shader GetDefaultShaderForPipeline()
		{
			var rp = GraphicsSettings.currentRenderPipeline;
			if ( rp != null )
			{
				string typeName = rp.GetType().Name;
				if ( typeName.Contains( "Universal" ) ) return Shader.Find( ShaderNameURP );
				if ( typeName.Contains( "HDRenderPipeline" ) || typeName.Contains( "HDRP" ) )
					return Shader.Find( ShaderNameHDRP );
			}
			return Shader.Find( ShaderNameBiRP );
		}

		// Property names a Real Fake Interior shader must expose to be considered
		// a valid target for the bake outputs.
		private static readonly string[] RequiredShaderProps = new[]
		{
		"_InteriorColorTexture",
		"_InteriorHeightmapTexture",
		"_RoomCubemap",
		"_RoomSize",
	};

		internal static bool IsCompatibleMaterial( Material mat )
		{
			if ( mat == null || mat.shader == null ) return false;
			foreach ( var p in RequiredShaderProps )
				if ( !mat.HasProperty( p ) ) return false;
			return true;
		}

		// Returns the absolute path the Create-Material flow would write to,
		// or null if Create Material isn't applicable for this bake.
		internal string GetMaterialCreationPath()
		{
			if ( settingsAsset == null ) return null;
			if ( settingsAsset.targetMaterial != null ) return null;
			if ( !settingsAsset.createMaterial ) return null;

			string folder = settingsAsset.outputFolderAssetPath;
			string safe = Sanitize( settingsAsset.bakeName );
			if ( string.IsNullOrEmpty( folder ) || string.IsNullOrEmpty( safe ) ) return null;

			return $"{folder}/{safe} {AspectToSuffix( settingsAsset.horizontalAspect )}.mat";
		}

		// Room-shape suffix appended to auto-created material filenames.
		// 1 = "1x1" (Square), 2 = "2x1" (Wide), 0.5 = "1x2" (Tall).
		private static string AspectToSuffix( float aspect )
		{
			if ( aspect >= 1.5f ) return "2x1";
			if ( aspect <= 0.75f ) return "1x2";
			return "1x1";
		}

		// True if Create Material is on, no target is assigned, and a material
		// with the would-be name already exists at the destination.
		internal bool WouldOverwriteExistingMaterial( out string path )
		{
			path = GetMaterialCreationPath();
			if ( string.IsNullOrEmpty( path ) ) return false;
			return AssetDatabase.LoadAssetAtPath<Material>( path ) != null;
		}

		private void StampOrCreateMaterial( string folder, string safeName,
			string colorPath, string depthPath, string probePath, Vector2 roomSize )
		{
			var mat = settingsAsset.targetMaterial;

			// No target and user didn't ask to create one: nothing to do.
			if ( mat == null && !settingsAsset.createMaterial ) return;

			if ( mat == null )
			{
				// Custom shader if the user set one, otherwise the SRP default.
				Shader shader = settingsAsset.customShader != null
					? settingsAsset.customShader
					: GetDefaultShaderForPipeline();

				if ( shader == null )
				{
					Debug.LogWarning( "[RoomBaker] Create Material is on but no Real Fake Interior shader was found in the project. Skipping." );
					return;
				}

				string matPath = $"{folder}/{safeName} {AspectToSuffix( settingsAsset.horizontalAspect )}.mat";

				// Reuse an existing asset at this path if one is there — the
				// bake button already prompted the user to confirm overwrite.
				// Reusing preserves the GUID so any scene/prefab references to
				// this material keep working after the bake.
				var existing = AssetDatabase.LoadAssetAtPath<Material>( matPath );
				if ( existing != null )
				{
					mat = existing;
					if ( mat.shader != shader )
						mat.shader = shader;
					Debug.Log( $"[RoomBaker] Reusing existing material at '{matPath}' (GUID preserved)." );
				}
				else
				{
					mat = new Material( shader ) { name = safeName };
					AssetDatabase.CreateAsset( mat, matPath );
					Debug.Log( $"[RoomBaker] Created material at '{matPath}'." );
				}

				// Bind so the next bake updates this material in place and the
				// inspector reflects the new assignment right after the bake.
				settingsAsset.targetMaterial = mat;
				pendingTargetMaterial = mat;
				EditorUtility.SetDirty( settingsAsset );
			}

			var color = AssetDatabase.LoadAssetAtPath<Texture2D>( colorPath );
			var depth = AssetDatabase.LoadAssetAtPath<Texture2D>( depthPath );
			var probe = AssetDatabase.LoadAssetAtPath<Cubemap>( probePath );

			Undo.RecordObject( mat, "Stamp Fake Interior Bake" );

			if ( color != null && mat.HasProperty( "_InteriorColorTexture" ) )
				mat.SetTexture( "_InteriorColorTexture", color );
			if ( depth != null && mat.HasProperty( "_InteriorHeightmapTexture" ) )
				mat.SetTexture( "_InteriorHeightmapTexture", depth );
			if ( probe != null && mat.HasProperty( "_RoomCubemap" ) )
				mat.SetTexture( "_RoomCubemap", probe );

			if ( mat.HasProperty( "_RoomSize" ) )
				mat.SetVector( "_RoomSize", new Vector4( roomSize.x, roomSize.y, 0f, 0f ) );

			EditorUtility.SetDirty( mat );
		}

		// Final + hi-res texture dimensions for the current bake. Width is
		// bakeResolution; height is derived from the horizontal aspect (W/H).
		private void GetBakeDimensions( out int finalW, out int finalH, out int hiW, out int hiH )
		{
			float a = Mathf.Max( 0.01f, settingsAsset.horizontalAspect );
			finalW = settingsAsset.bakeResolution;
			finalH = Mathf.Max( 1, Mathf.RoundToInt( finalW / a ) );
			hiW = finalW * settingsAsset.supersample;
			hiH = finalH * settingsAsset.supersample;
		}

		// Blocks until Unity's async shader compiler is idle (with a safety
		// timeout). Rendering while variants are still compiling substitutes a
		// dummy shader, which bakes as black — most visibly on the first bake
		// after a build-target switch. Editor-only; no-op cost at runtime.
		private static void WaitForShaderCompilation()
		{
#if UNITY_EDITOR
			const double timeoutSeconds = 30.0;
			double start = EditorApplication.timeSinceStartup;

			// Kick a refresh so any pending imports/compiles are queued.
			while ( ShaderUtil.anythingCompiling )
			{
				if ( EditorApplication.timeSinceStartup - start > timeoutSeconds )
				{
					Debug.LogWarning( "[RoomBaker] Timed out waiting for shader compilation; baking anyway." );
					break;
				}
				System.Threading.Thread.Sleep( 50 );
			}
#endif
		}

		// One-shot pipeline warm-up: renders the bake camera to a small
		// throwaway RT so a freshly (re)initialized SRP builds its RenderGraph
		// resources before the real capture. Resolution-independent, so this
		// adds a fixed sub-millisecond cost regardless of bake resolution.
		private void WarmUpPipeline( Camera cam )
		{
			var prevTarget = cam.targetTexture;

			var warm = new RenderTexture( 32, 32, 16, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB );
			warm.Create();
			try
			{
				RenderCameraToTexture( cam, warm );
			}
			finally
			{
				cam.targetTexture = prevTarget;
				warm.Release();
				DestroyImmediate( warm );
			}
		}

		// Renders a camera to a target texture in a way that works on every
		// supported pipeline. On Unity 2023.1+ SRPs we go through
		// SubmitRenderRequest, which is the supported path under URP Render
		// Graph — a plain Camera.Render() there can silently skip the final
		// blit to targetTexture and produce an all-black capture. On older
		// versions, and on BiRP (which doesn't implement render requests),
		// Camera.Render() is still the right call.
		private static void RenderCameraToTexture( Camera cam, RenderTexture rt )
		{
#if UNITY_2023_1_OR_NEWER
			if ( GraphicsSettings.currentRenderPipeline != null )
			{
				var request = new UnityEngine.Rendering.RenderPipeline.StandardRequest
				{
					destination = rt
				};

				if ( UnityEngine.Rendering.RenderPipeline.SupportsRenderRequest( cam, request ) )
				{
					// The render request drives its own target via destination.
					// Clear the camera's own targetTexture first so the two
					// don't fight — a set targetTexture can win over destination
					// and route the render through the (RenderGraph-broken)
					// camera path, leaving destination black.
					var savedTarget = cam.targetTexture;
					cam.targetTexture = null;
					UnityEngine.Rendering.RenderPipeline.SubmitRenderRequest( cam, request );
					cam.targetTexture = savedTarget;
					return;
				}
			}
#endif
			cam.Render();
		}

		// Color rendered at supersampled res, point-filtered. Resolve happens
		// later in ResolveColorWithDepth so it can stay surface-aware.
		private Texture2D RenderColorHi( Camera cam )
		{
			GetBakeDimensions( out _, out _, out int hiW, out int hiH );

			var prevTarget = cam.targetTexture;
			var prevClear = cam.clearFlags;
			var prevBG = cam.backgroundColor;
			var prevHDR = cam.allowHDR;
			float prevAspect = cam.aspect;

			var rt = new RenderTexture( hiW, hiH, 24, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB )
			{
				antiAliasing = 1,
				useMipMap = false,
				autoGenerateMips = false,
				wrapMode = TextureWrapMode.Clamp,
				filterMode = FilterMode.Point
			};
			rt.Create();

			// HDRP belt and braces:
			//   1. Disable pipeline-level feature flags (SSAO/SSR/SSGI/etc.) on
			//      the HDRP Asset so the screen-space passes don't run at all.
			//   2. Inject a high-priority Volume to neutralize anything that's
			//      volume-driven (Bloom, color grading, tonemap, etc.).
			// Both no-op on URP / BiRP. Both restored in finally.
			var hdrpAsset = HDRPAssetIsolator.TryCreate();
			var hdrpBakeVolume = HDRPBakeOverrideVolume.TryCreate();

			try
			{
				cam.targetTexture = rt;
				cam.allowHDR = false;
				cam.clearFlags = CameraClearFlags.SolidColor;
				cam.backgroundColor = Color.black;
				cam.aspect = ( float )hiW / hiH;

				RenderCameraToTexture( cam, rt );

				return ReadRT( rt, false );
			}
			finally
			{
				cam.targetTexture = prevTarget;
				cam.clearFlags = prevClear;
				cam.backgroundColor = prevBG;
				cam.allowHDR = prevHDR;
				cam.aspect = prevAspect;

				hdrpBakeVolume?.Dispose();
				hdrpAsset?.Dispose();

				rt.Release();
				DestroyImmediate( rt );
			}
		}

		// Depth rendered at supersampled res, point-filtered. Per-pixel resolve
		// (winner-take-all) happens in PackDepthRG16.
		private Texture2D RenderDepth01( Camera cam, Renderer[] renderers )
		{
			GetBakeDimensions( out _, out _, out int hiW, out int hiH );

			var rt = new RenderTexture( hiW, hiH, 24, RenderTextureFormat.ARGBHalf, RenderTextureReadWrite.Linear )
			{
				antiAliasing = 1,
				useMipMap = false,
				autoGenerateMips = false,
				wrapMode = TextureWrapMode.Clamp,
				filterMode = FilterMode.Point
			};
			rt.Create();

			var cmd = new CommandBuffer { name = "RoomBaker_Depth01" };

			try
			{
				cmd.SetRenderTarget( rt );
				cmd.SetViewport( new Rect( 0, 0, hiW, hiH ) );
				cmd.ClearRenderTarget( true, true, Color.white );

				float aspect = ( float )hiW / hiH;
				Matrix4x4 view = cam.worldToCameraMatrix;

				Matrix4x4 proj = Matrix4x4.Ortho(
					-cam.orthographicSize * aspect,
					 cam.orthographicSize * aspect,
					-cam.orthographicSize,
					 cam.orthographicSize,
					 cam.nearClipPlane,
					 cam.farClipPlane
				);

				Matrix4x4 gpuProj = GL.GetGPUProjectionMatrix( proj, true );
				Matrix4x4 vp = gpuProj * view;

				depthMat.SetMatrix( "_RoomBakerVP", vp );
				depthMat.SetMatrix( "_RoomBakerView", view );
				depthMat.SetFloat( "_Near", cam.nearClipPlane );
				depthMat.SetFloat( "_Far", cam.farClipPlane );

				foreach ( var r in renderers )
				{
					if ( r == null ) continue;
					if ( !r.enabled || !r.gameObject.activeInHierarchy ) continue;

					if ( r is ParticleSystemRenderer ) continue;
					if ( r is TrailRenderer ) continue;
					if ( r is LineRenderer ) continue;

					int sub = Mathf.Max( 1, r.sharedMaterials != null ? r.sharedMaterials.Length : 1 );
					for ( int i = 0; i < sub; i++ )
						cmd.DrawRenderer( r, depthMat, i, 0 );
				}

				Graphics.ExecuteCommandBuffer( cmd );

				return ReadRTHalf( rt, true );
			}
			finally
			{
				cmd.Release();

				rt.Release();
				DestroyImmediate( rt );
			}
		}

		// Resolves NxN hi-res depth into final-res RG by picking the front-most
		// sample per output pixel (closest surface wins) and pairing it with the
		// back depth from the SAME hi-res sample. Independent min/max would mix
		// two different surfaces and recreate the phantom-slab smear.
		private Texture2D PackDepthRG16( Texture2D frontHi, Texture2D backHi )
		{
			int hiW = frontHi.width;
			int hiH = frontHi.height;
			int ss = Mathf.Max( 1, settingsAsset.supersample );
			int w = hiW / ss;
			int h = hiH / ss;

			var f = frontHi.GetPixels();
			var b = backHi.GetPixels();

			var outTex = new Texture2D( w, h, TextureFormat.RGHalf, false, true );
			var o = new Color[ w * h ];

			for ( int y = 0; y < h; y++ )
			{
				int hiYBase = y * ss;
				for ( int x = 0; x < w; x++ )
				{
					int hiXBase = x * ss;

					float bestFront01 = float.PositiveInfinity;
					int bestHiX = hiXBase;
					int bestHiY = hiYBase;

					for ( int sy = 0; sy < ss; sy++ )
					{
						int rowHi = ( hiYBase + sy ) * hiW;
						for ( int sx = 0; sx < ss; sx++ )
						{
							int hiX = hiXBase + sx;
							float frontD = f[ rowHi + hiX ].r;
							if ( frontD < bestFront01 )
							{
								bestFront01 = frontD;
								bestHiX = hiX;
								bestHiY = hiYBase + sy;
							}
						}
					}

					int backX = FlipBackHorizontally ? ( hiW - 1 - bestHiX ) : bestHiX;
					float bestBack01 = b[ bestHiY * hiW + backX ].r;

					float r = 1.0f - Mathf.Clamp01( bestFront01 );
					float g = Mathf.Clamp01( bestBack01 );

					o[ y * w + x ] = new Color( r, g, 0.0f, 1.0f );
				}
			}

			outTex.SetPixels( o );
			outTex.Apply( false, false );
			return outTex;
		}

		// Per output pixel: pick the closest front depth in the NxN block, then
		// average only the color samples whose depth matches that surface.
		// Empty/background and behind-surface samples are excluded, so color
		// never bleeds across object/object edges.
		private Texture2D ResolveColorWithDepth( Texture2D colorHi, Texture2D frontDepthHi )
		{
			int hiW = colorHi.width;
			int hiH = colorHi.height;
			int ss = Mathf.Max( 1, settingsAsset.supersample );
			int w = hiW / ss;
			int h = hiH / ss;

			const float SAME_SURFACE_EPS = 0.01f;

			var c = colorHi.GetPixels();
			var d = frontDepthHi.GetPixels();

			var outTex = new Texture2D( w, h, TextureFormat.RGBA32, false, false );
			var o = new Color[ w * h ];

			for ( int y = 0; y < h; y++ )
			{
				int hiYBase = y * ss;
				for ( int x = 0; x < w; x++ )
				{
					int hiXBase = x * ss;

					float winnerD = float.PositiveInfinity;
					for ( int sy = 0; sy < ss; sy++ )
					{
						int rowHi = ( hiYBase + sy ) * hiW;
						for ( int sx = 0; sx < ss; sx++ )
						{
							float fd = d[ rowHi + hiXBase + sx ].r;
							if ( fd < winnerD ) winnerD = fd;
						}
					}

					float rAcc = 0f, gAcc = 0f, bAcc = 0f, aAcc = 0f;
					int count = 0;

					for ( int sy = 0; sy < ss; sy++ )
					{
						int rowHi = ( hiYBase + sy ) * hiW;
						for ( int sx = 0; sx < ss; sx++ )
						{
							int idx = rowHi + hiXBase + sx;
							if ( d[ idx ].r - winnerD <= SAME_SURFACE_EPS )
							{
								var col = c[ idx ];
								rAcc += col.r; gAcc += col.g; bAcc += col.b; aAcc += col.a;
								count++;
							}
						}
					}

					if ( count > 0 )
					{
						float inv = 1f / count;
						o[ y * w + x ] = new Color( rAcc * inv, gAcc * inv, bAcc * inv, aAcc * inv );
					}
					else
					{
						o[ y * w + x ] = Color.black;
					}
				}
			}

			outTex.SetPixels( o );
			outTex.Apply( false, false );
			return outTex;
		}

		private void SetProbeConvolutionNone( string probeAssetPath )
		{
			var importer = AssetImporter.GetAtPath( probeAssetPath ) as TextureImporter;
			if ( importer == null ) return;

			bool changed = false;

			try
			{
				var p1 = typeof( TextureImporter ).GetProperty( "convolutionType", BindingFlags.Instance | BindingFlags.Public );
				if ( p1 != null )
				{
					object noneValue = Enum.Parse( p1.PropertyType, "None" );
					p1.SetValue( importer, noneValue, null );
					changed = true;
				}
				else
				{
					var p2 = typeof( TextureImporter ).GetProperty( "cubemapConvolution", BindingFlags.Instance | BindingFlags.Public );
					if ( p2 != null )
					{
						object noneValue = Enum.Parse( p2.PropertyType, "None" );
						p2.SetValue( importer, noneValue, null );
						changed = true;
					}
				}
			}
			catch
			{
			}

			if ( !changed )
			{
				try
				{
					var so = new SerializedObject( importer );
					string[] candidates = { "m_ConvolutionType", "m_CubemapConvolution", "m_TextureConvolution" };

					foreach ( var name in candidates )
					{
						var prop = so.FindProperty( name );
						if ( prop == null ) continue;

						if ( prop.propertyType == SerializedPropertyType.Enum )
						{
							prop.enumValueIndex = 0;
							so.ApplyModifiedPropertiesWithoutUndo();
							changed = true;
							break;
						}

						if ( prop.propertyType == SerializedPropertyType.Integer )
						{
							prop.intValue = 0;
							so.ApplyModifiedPropertiesWithoutUndo();
							changed = true;
							break;
						}
					}
				}
				catch
				{
				}
			}

			if ( changed )
				importer.SaveAndReimport();
		}

		private Texture2D ReadRT( RenderTexture rt, bool linear )
		{
			var prev = RenderTexture.active;
			RenderTexture.active = rt;

			var tex = new Texture2D( rt.width, rt.height, TextureFormat.RGBA32, false, linear );
			tex.ReadPixels( new Rect( 0, 0, rt.width, rt.height ), 0, 0, false );
			tex.Apply( false, false );

			RenderTexture.active = prev;
			return tex;
		}

		private Texture2D ReadRTHalf( RenderTexture rt, bool linear )
		{
			var prev = RenderTexture.active;
			RenderTexture.active = rt;

			var tex = new Texture2D( rt.width, rt.height, TextureFormat.RGBAHalf, false, linear );
			tex.ReadPixels( new Rect( 0, 0, rt.width, rt.height ), 0, 0, false );
			tex.Apply( false, false );

			RenderTexture.active = prev;
			return tex;
		}

		private void SavePNG( Texture2D tex, string assetPath )
		{
			assetPath = assetPath.Replace( "\\", "/" );
			string abs = ToAbsolutePath( assetPath );

			string dir = Path.GetDirectoryName( abs );
			if ( !string.IsNullOrEmpty( dir ) && !Directory.Exists( dir ) )
				Directory.CreateDirectory( dir );

			File.WriteAllBytes( abs, tex.EncodeToPNG() );
			AssetDatabase.ImportAsset( assetPath, ImportAssetOptions.ForceSynchronousImport );
		}

		private void SaveEXR16( Texture2D tex, string assetPath )
		{
			assetPath = assetPath.Replace( "\\", "/" );
			string abs = ToAbsolutePath( assetPath );

			string dir = Path.GetDirectoryName( abs );
			if ( !string.IsNullOrEmpty( dir ) && !Directory.Exists( dir ) )
				Directory.CreateDirectory( dir );

			byte[] bytes = tex.EncodeToEXR( Texture2D.EXRFlags.CompressZIP );
			File.WriteAllBytes( abs, bytes );

			AssetDatabase.ImportAsset( assetPath, ImportAssetOptions.ForceSynchronousImport );
		}

		public static void SaveTexture( Texture2D texture, string assetPath )
		{
			var clone = Instantiate( texture );
			clone.wrapMode = TextureWrapMode.Clamp;
			clone.filterMode = FilterMode.Point;
			clone.anisoLevel = 0;

			// If an asset already exists at this path, preserve its GUID by
			// copying the new texture's serialized data into the existing asset.
			// This keeps any material/scene/prefab references intact across
			// re-bakes. CopySerialized overwrites .name with the source's empty
			// name, so we restore it from the filename to avoid Unity's
			// "Main Object Name does not match filename" warning.
			var existing = AssetDatabase.LoadAssetAtPath<Texture2D>( assetPath );
			if ( existing != null )
			{
				EditorUtility.CopySerialized( clone, existing );
				existing.name = Path.GetFileNameWithoutExtension( assetPath );
				DestroyImmediate( clone );
			}
			else
			{
				// Set name before CreateAsset so the first-ever bake doesn't
				// trip the same name-mismatch warning.
				clone.name = Path.GetFileNameWithoutExtension( assetPath );
				AssetDatabase.CreateAsset( clone, assetPath );
			}
			AssetDatabase.SaveAssets();
			AssetDatabase.Refresh();
		}

		private void ConfigureTexture( string assetPath, bool isColor, int longSide )
		{
			assetPath = assetPath.Replace( "\\", "/" );
			AssetDatabase.ImportAsset( assetPath, ImportAssetOptions.ForceSynchronousImport );

			var importer = ( TextureImporter )AssetImporter.GetAtPath( assetPath );
			if ( importer == null ) return;

			importer.sRGBTexture = isColor;
			// Point + no mips: the shader's depth-aware bilinear needs each
			// tex2D to return one exact texel. Bilinear or mip averages would
			// re-introduce cross-surface bleed the bake worked hard to avoid.
			importer.mipmapEnabled = false;
			importer.textureCompression = TextureImporterCompression.Uncompressed;
			importer.wrapMode = TextureWrapMode.Clamp;
			importer.filterMode = FilterMode.Point;
			importer.anisoLevel = isColor ? Mathf.Clamp( settingsAsset.anisoLevel, 0, 16 ) : 0;
			importer.alphaIsTransparency = false;

			if ( !isColor )
			{
				var s = importer.GetDefaultPlatformTextureSettings();
				s.format = TextureImporterFormat.RGFloat;
				importer.SetPlatformTextureSettings( s );
			}

			// Default Max Size is 2048. For non-square bakes (Tall/Wide) or any
			// 4K bake the long axis exceeds that and Unity bilinearly downsamples
			// on import - which silently undoes the surface-aware bake resolve
			// and brings the silhouette smearing right back. Set Max Size to
			// accommodate the actual texture's long axis.
			importer.maxTextureSize = NextValidMaxTextureSize( longSide );

			importer.SaveAndReimport();
		}

		// Snaps any positive integer up to the next Unity-allowed texture
		// import max size. Returns 16384 (the platform max) if larger.
		private static int NextValidMaxTextureSize( int n )
		{
			int[] allowed = { 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384 };
			foreach ( var v in allowed )
				if ( n <= v ) return v;
			return 16384;
		}

		private static GameObject FindSceneObjectByName( string objectName )
		{
			var scene = SceneManager.GetActiveScene();
			if ( !scene.IsValid() || !scene.isLoaded )
				return null;

			foreach ( var root in scene.GetRootGameObjects() )
			{
				var match = root.GetComponentsInChildren<Transform>( true )
					.FirstOrDefault( t => t != null && t.name == objectName );
				if ( match != null )
					return match.gameObject;
			}

			return null;
		}

		private static GameObject FindSceneObjectFromHints( string hierarchyPath, string objectName )
		{
			var scene = SceneManager.GetActiveScene();
			if ( !scene.IsValid() || !scene.isLoaded )
				return null;

			if ( !string.IsNullOrWhiteSpace( hierarchyPath ) )
			{
				var byPath = FindSceneObjectByPath( scene, hierarchyPath );
				if ( byPath != null )
					return byPath;
			}

			if ( !string.IsNullOrWhiteSpace( objectName ) )
				return FindSceneObjectByName( objectName );

			return null;
		}

		private static GameObject FindSceneObjectByPath( Scene scene, string hierarchyPath )
		{
			if ( string.IsNullOrWhiteSpace( hierarchyPath ) )
				return null;

			string[] parts = hierarchyPath.Split( '/' );
			if ( parts.Length == 0 )
				return null;

			var root = scene.GetRootGameObjects().FirstOrDefault( r => r != null && r.name == parts[ 0 ] );
			if ( root == null )
				return null;

			Transform current = root.transform;
			for ( int i = 1; i < parts.Length; i++ )
			{
				current = current.Find( parts[ i ] );
				if ( current == null )
					return null;
			}

			return current.gameObject;
		}

		private static string GetHierarchyPath( Transform t )
		{
			if ( t == null )
				return string.Empty;

			string path = t.name;
			while ( t.parent != null )
			{
				t = t.parent;
				path = t.name + "/" + path;
			}
			return path;
		}

		private static string ToAbsolutePath( string assetPath )
		{
			assetPath = assetPath.Replace( "\\", "/" );
			string projectRoot = Directory.GetParent( Application.dataPath ).FullName.Replace( "\\", "/" );
			return ( projectRoot + "/" + assetPath ).Replace( "\\", "/" );
		}

		private static string Sanitize( string s )
		{
			foreach ( char c in Path.GetInvalidFileNameChars() )
				s = s.Replace( c, '_' );
			return s.Trim();
		}

		private static int ClampToAllowed( int current, params int[] allowed )
		{
			return allowed.Contains( current ) ? current : allowed[ 0 ];
		}

		// Snap horizontalAspect to one of three supported room shapes:
		// 0.5 = tall, 1 = square, 2 = wide.
		private static float SnapAspect( float v )
		{
			if ( v >= 1.5f ) return 2f;
			if ( v <= 0.75f ) return 0.5f;
			return 1f;
		}
	#endif
	}
}

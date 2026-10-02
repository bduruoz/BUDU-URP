// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using System;
using System.IO;
using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace RealFakeInteriors
{
#if UNITY_EDITOR
	[CustomEditor( typeof( FakeInteriorBakeTool ) )]
	public class FakeInteriorBakeToolEditor : Editor
	{
		public override void OnInspectorGUI()
		{
			var tool = ( FakeInteriorBakeTool )target;
			var toolSO = serializedObject;
			toolSO.Update();

			var settingsProp = toolSO.FindProperty( "settingsAsset" );
			var pendingAssetNameProp = toolSO.FindProperty( "pendingAssetName" );
			var pendingBakeNameProp = toolSO.FindProperty( "pendingBakeName" );
			var pendingOutputFolderProp = toolSO.FindProperty( "pendingOutputFolderAssetPath" );
			var pendingBakeResolutionProp = toolSO.FindProperty( "pendingBakeResolution" );
			var pendingSupersampleProp = toolSO.FindProperty( "pendingSupersample" );
			var pendingAnisoLevelProp = toolSO.FindProperty( "pendingAnisoLevel" );
			var pendingHorizontalAspectProp = toolSO.FindProperty( "pendingHorizontalAspect" );
			var pendingProbeResolutionProp = toolSO.FindProperty( "pendingProbeResolution" );
			var pendingDepthFormatProp = toolSO.FindProperty( "pendingDepthFormat" );
			var pendingCreateMaterialProp = toolSO.FindProperty( "pendingCreateMaterial" );
			var pendingTargetMaterialProp = toolSO.FindProperty( "pendingTargetMaterial" );
			var pendingCustomShaderProp = toolSO.FindProperty( "pendingCustomShader" );

			var roomProp = toolSO.FindProperty( "roomGO" );
			var furnitureProp = toolSO.FindProperty( "furnitureGO" );
			var frontCamProp = toolSO.FindProperty( "frontCamera" );
			var backCamProp = toolSO.FindProperty( "backCamera" );
			var probeProp = toolSO.FindProperty( "reflectionProbe" );

			tool.EnsurePendingDefaults();
			tool.ResolveAutoReferences( false );
			tool.ResolveDefaultBakeObjects( false );
			tool.TryRestoreSceneBindingsFromAsset();

			var previousAsset = tool.SettingsAsset;

			EditorGUILayout.LabelField( "Room", EditorStyles.boldLabel );

			EditorGUI.BeginChangeCheck();
			EditorGUILayout.PropertyField( settingsProp, new GUIContent( "Bake Asset",
				"ScriptableObject storing this room's bake settings and scene bindings. " +
				"Created automatically the first time you bake." ) );
			bool assetFieldChanged = EditorGUI.EndChangeCheck();

			if ( assetFieldChanged )
			{
				toolSO.ApplyModifiedProperties();

				var newAsset = ( FakeInteriorBakeSettings )settingsProp.objectReferenceValue;
				if ( newAsset != previousAsset )
				{
					tool.AssignSettingsAsset( newAsset );
					toolSO.Update();

					settingsProp = toolSO.FindProperty( "settingsAsset" );
					pendingAssetNameProp = toolSO.FindProperty( "pendingAssetName" );
					pendingBakeNameProp = toolSO.FindProperty( "pendingBakeName" );
					pendingOutputFolderProp = toolSO.FindProperty( "pendingOutputFolderAssetPath" );
					pendingBakeResolutionProp = toolSO.FindProperty( "pendingBakeResolution" );
					pendingSupersampleProp = toolSO.FindProperty( "pendingSupersample" );
					pendingAnisoLevelProp = toolSO.FindProperty( "pendingAnisoLevel" );
					pendingHorizontalAspectProp = toolSO.FindProperty( "pendingHorizontalAspect" );
					pendingProbeResolutionProp = toolSO.FindProperty( "pendingProbeResolution" );
					pendingDepthFormatProp = toolSO.FindProperty( "pendingDepthFormat" );
					pendingCreateMaterialProp = toolSO.FindProperty( "pendingCreateMaterial" );
					pendingTargetMaterialProp = toolSO.FindProperty( "pendingTargetMaterial" );
					pendingCustomShaderProp = toolSO.FindProperty( "pendingCustomShader" );

					roomProp = toolSO.FindProperty( "roomGO" );
					furnitureProp = toolSO.FindProperty( "furnitureGO" );
					frontCamProp = toolSO.FindProperty( "frontCamera" );
					backCamProp = toolSO.FindProperty( "backCamera" );
					probeProp = toolSO.FindProperty( "reflectionProbe" );
				}
			}

			EditorGUI.BeginChangeCheck();

			if ( !tool.HasSettingsAsset )
				EditorGUILayout.PropertyField( pendingAssetNameProp, new GUIContent( "Bake Asset Name",
					"Filename of the settings asset that will be created on first bake." ) );

			EditorGUILayout.PropertyField( pendingBakeNameProp, new GUIContent( "Room Bake Name",
				"Prefix used for the output files: <Name>_Color.png, <Name>_DepthRG.exr, <Name>_Probe.exr." ) );

			string pickedFolder = DrawOutputFolderPicker( pendingOutputFolderProp );

			if ( !string.IsNullOrEmpty( pickedFolder ) )
			{
				pendingOutputFolderProp.stringValue = pickedFolder;
				toolSO.ApplyModifiedProperties();

				tool.SetPendingOutputFolder( pickedFolder );

				if ( tool.HasSettingsAsset )
					tool.PushPendingToAsset();

				tool.PersistComponent();
				tool.PersistAsset();

				toolSO.Update();
				pendingOutputFolderProp = toolSO.FindProperty( "pendingOutputFolderAssetPath" );
			}

			// Room Size dropdown - 3 supported shapes, snapped to {1, 2, 0.5}.
			int aspectIndex = pendingHorizontalAspectProp.floatValue >= 1.5f ? 1
							 : pendingHorizontalAspectProp.floatValue <= 0.75f ? 2
							 : 0;
			aspectIndex = EditorGUILayout.Popup(
				new GUIContent( "Room Size",
					"Square (1:1), Wide (2:1) or Tall (1:2). Drives the baked texture aspect " +
					"and the X component of the shader's _RoomSize." ),
				aspectIndex,
				new[] { "Square (1:1)", "Wide (2:1)", "Tall (1:2)" } );
			pendingHorizontalAspectProp.floatValue = aspectIndex == 1 ? 2f : aspectIndex == 2 ? 0.5f : 1f;

			EditorGUILayout.Space();
			EditorGUILayout.LabelField( "Resolution", EditorStyles.boldLabel );

			pendingBakeResolutionProp.intValue = EditorGUILayout.IntPopup(
				new GUIContent( "Resolution",
					"Final pixel size of the baked Color and Depth textures (width). Height is derived from Room Size." ),
				pendingBakeResolutionProp.intValue,
				new[] { new GUIContent( "128" ), new GUIContent( "256" ), new GUIContent( "512" ), new GUIContent( "1024" ), new GUIContent( "2048" ), new GUIContent( "4096" ) },
				new[] { 128, 256, 512, 1024, 2048, 4096 } );

			pendingSupersampleProp.intValue = EditorGUILayout.IntPopup(
				new GUIContent( "Supersampling",
					"Internal render scale before the surface-aware resolve. Higher = cleaner silhouettes, slower bake." ),
				pendingSupersampleProp.intValue,
				new[] { new GUIContent( "2x" ), new GUIContent( "4x" ) },
				new[] { 2, 4 } );

			pendingAnisoLevelProp.intValue = EditorGUILayout.IntSlider(
				new GUIContent( "Anisotropic",
					"Anisotropic filtering applied to the baked Color texture importer. " +
					"Helps grazing-angle sampling without re-introducing cross-surface bleed (same-mip fetches). " +
					"0 disables. 8 is a sensible default." ),
				pendingAnisoLevelProp.intValue, 0, 16 );

			pendingProbeResolutionProp.intValue = EditorGUILayout.IntPopup(
				new GUIContent( "Cubemap Resolution",
					"Cubemap resolution for the baked reflection probe used as the room's ambient cubemap." ),
				pendingProbeResolutionProp.intValue,
				new[] { new GUIContent( "16" ), new GUIContent( "32" ), new GUIContent( "64" ), new GUIContent( "128" ), new GUIContent( "256" ), new GUIContent( "512" ), new GUIContent( "1024" ), new GUIContent( "2048" ) },
				new[] { 16, 32, 64, 128, 256, 512, 1024, 2048 } );

			pendingDepthFormatProp.enumValueIndex = ( int )( DepthRGFormat )EditorGUILayout.EnumPopup(
				new GUIContent( "Depth Format",
					"Format for DepthRG: Texture2D for performance, ImageEXR for platform compatibility." ),
				( DepthRGFormat )pendingDepthFormatProp.enumValueIndex );

			EditorGUILayout.Space();
			EditorGUILayout.LabelField( "Material Helper (optional)", EditorStyles.boldLabel );

			// Auto Create Material is only meaningful when no material is
			// assigned. Once one is set the bake updates it in place every time.
			using ( new EditorGUI.DisabledScope( pendingTargetMaterialProp.objectReferenceValue != null ) )
			{
				EditorGUILayout.PropertyField( pendingCreateMaterialProp, new GUIContent( "Auto Create Material and Assign",
					"If on and no Material is assigned below, the bake creates a new material in the Output Folder " +
					"using the Shader below, wires up the baked textures and _RoomSize, and assigns it here. " +
					"Subsequent bakes update that material in place without prompting." ) );
			}

			// Material slot. Reject anything whose shader is missing the
			// required Real Fake Interior properties — the bake stamp would
			// silently no-op on most of them otherwise.
			var matBefore = pendingTargetMaterialProp.objectReferenceValue as Material;
			EditorGUI.BeginChangeCheck();
			EditorGUILayout.PropertyField( pendingTargetMaterialProp, new GUIContent( "Material",
				"Optional material to receive the baked textures and _RoomSize after each bake. " +
				"Must use a Real Fake Interior shader. Auto-filled when Auto Create Material and Assign produces a new material." ) );
			if ( EditorGUI.EndChangeCheck() )
			{
				var matAfter = pendingTargetMaterialProp.objectReferenceValue as Material;
				if ( matAfter != null && !FakeInteriorBakeTool.IsCompatibleMaterial( matAfter ) )
				{
					Debug.LogWarning( $"[RoomBaker] Material '{matAfter.name}' uses shader '{( matAfter.shader != null ? matAfter.shader.name : "<none>" )}' which is missing required Real Fake Interior properties. Assignment rejected." );
					pendingTargetMaterialProp.objectReferenceValue = matBefore;
				}
			}

			// Shader field — shows the short shader name (last path segment) and
			// opens an object picker on click. When a Material is assigned, the
			// field displays that material's shader and is read-only (the bake
			// uses the material's existing shader). When no material is
			// assigned, the user can pick a shader for the Auto Create flow.
			var currentMat = pendingTargetMaterialProp.objectReferenceValue as Material;
			Shader defaultShader = FakeInteriorBakeTool.GetDefaultShaderForPipeline();
			Shader shownShader;
			bool shaderFieldReadOnly;

			if ( currentMat != null && currentMat.shader != null )
			{
				shownShader = currentMat.shader;
				shaderFieldReadOnly = true;
			}
			else
			{
				shownShader = pendingCustomShaderProp.objectReferenceValue as Shader;
				if ( shownShader == null ) shownShader = defaultShader;
				shaderFieldReadOnly = false;
			}

			using ( new EditorGUI.DisabledScope( shaderFieldReadOnly ) )
			{
				EditorGUI.BeginChangeCheck();
				var pickedShader = ( Shader )EditorGUILayout.ObjectField(
					new GUIContent( "Shader",
						"Shader used by the Material Helper. Defaults to the Real Fake Interior variant " +
						"matching your active render pipeline. When a Material is assigned above, this " +
						"reflects that material's shader and is read-only. Click to ping the shader asset; " +
						"use the picker dot to choose a different one." ),
					shownShader, typeof( Shader ), false );
				if ( EditorGUI.EndChangeCheck() && !shaderFieldReadOnly )
				{
					pendingCustomShaderProp.objectReferenceValue =
						pickedShader == defaultShader ? null : pickedShader;
				}
			}

			EditorGUILayout.Space();
			EditorGUILayout.LabelField( "Assets", EditorStyles.boldLabel );

			EditorGUILayout.PropertyField( roomProp, new GUIContent( "Room",
				"Root GameObject of the room shell. Hidden during furniture bakes, shown for the reflection probe bake." ) );
			EditorGUILayout.PropertyField( furnitureProp, new GUIContent( "Furniture",
				"Root GameObject of the furniture/interior content. Rendered into the Color and Depth textures." ) );

			tool.ResolveAutoReferences( true );

			using ( new EditorGUI.DisabledScope( true ) )
			{
				EditorGUILayout.ObjectField( new GUIContent( "Front Camera",
					"Auto-resolved by name 'Camera_FRONT'. Orthographic front-facing capture for color + front depth." ),
					frontCamProp.objectReferenceValue, typeof( Camera ), true );
				EditorGUILayout.ObjectField( new GUIContent( "Back Camera",
					"Auto-resolved by name 'Camera_BACK'. Orthographic back-facing capture for back depth." ),
					backCamProp.objectReferenceValue, typeof( Camera ), true );
				EditorGUILayout.ObjectField( new GUIContent( "Reflection Probe",
					"Auto-resolved reflection probe used to bake the room's ambient cubemap." ),
					probeProp.objectReferenceValue, typeof( ReflectionProbe ), true );
			}

			if ( EditorGUI.EndChangeCheck() )
			{
				toolSO.ApplyModifiedProperties();
				tool.SetPendingOutputFolder( pendingOutputFolderProp.stringValue );

				if ( tool.HasSettingsAsset )
					tool.PushPendingToAsset();

				tool.PersistComponent();
				tool.PersistAsset();
			}
			else
			{
				toolSO.ApplyModifiedProperties();
			}

			bool canBakeCore = tool.ValidateCoreForBakePrompt();
			if ( !canBakeCore )
			{
				tool.ValidateFullState( out string whyNotCore );
				if ( !string.IsNullOrEmpty( whyNotCore ) )
					EditorGUILayout.HelpBox( whyNotCore, MessageType.Warning );
			}

			using ( new EditorGUILayout.HorizontalScope() )
			{
				using ( new EditorGUI.DisabledScope( tool.HasSettingsAsset ) )
				{
					if ( GUILayout.Button( new GUIContent( "Create Bake Asset",
						"Creates the settings ScriptableObject in the chosen Output Folder and binds it to this component." ),
						GUILayout.Height( 28 ) ) )
					{
						toolSO.ApplyModifiedProperties();
						tool.SetPendingOutputFolder( pendingOutputFolderProp.stringValue );

						if ( tool.HasSettingsAsset )
							tool.PushPendingToAsset();

						tool.PersistComponent();
						tool.PersistAsset();

						string folder = tool.HasValidPendingOutputFolder()
							? pendingOutputFolderProp.stringValue
							: PickFolderUnderAssets( "Select Bake Folder", pendingOutputFolderProp.stringValue );

						if ( !string.IsNullOrEmpty( folder ) )
						{
							Undo.RecordObject( tool, "Create Bake Asset" );

							pendingOutputFolderProp.stringValue = folder;
							toolSO.ApplyModifiedProperties();

							tool.SetPendingOutputFolder( folder );
							tool.PersistComponent();

							var created = tool.CreateAndAssignSettingsAssetAtFolder(
								folder,
								pendingAssetNameProp.stringValue,
								pendingBakeNameProp.stringValue );

							if ( created != null )
							{
								tool.AssignSettingsAsset( created );
								toolSO.Update();
								GUIUtility.ExitGUI();
							}
						}
					}
				}

				using ( new EditorGUI.DisabledScope( !canBakeCore ) )
				{
					if ( GUILayout.Button( new GUIContent( "Bake Room",
						"Renders Color + Front/Back Depth from the furniture and bakes the reflection probe from the room. " +
						"Writes <Name>_Color.png, <Name>_DepthRG.exr and <Name>_Probe.exr to the Output Folder." ),
						GUILayout.Height( 28 ) ) )
					{
						toolSO.ApplyModifiedProperties();
						tool.SetPendingOutputFolder( pendingOutputFolderProp.stringValue );

						if ( tool.HasSettingsAsset )
							tool.PushPendingToAsset();

						tool.PersistComponent();
						tool.PersistAsset();

						if ( !tool.HasSettingsAsset )
						{
							string folder = tool.HasValidPendingOutputFolder()
								? pendingOutputFolderProp.stringValue
								: PickFolderUnderAssets( "Select Bake Folder", pendingOutputFolderProp.stringValue );

							if ( string.IsNullOrEmpty( folder ) )
								return;

							Undo.RecordObject( tool, "Create Bake Asset" );

							pendingOutputFolderProp.stringValue = folder;
							toolSO.ApplyModifiedProperties();

							tool.SetPendingOutputFolder( folder );
							tool.PersistComponent();

							var created = tool.CreateAndAssignSettingsAssetAtFolder(
								folder,
								pendingAssetNameProp.stringValue,
								pendingBakeNameProp.stringValue );

							if ( created == null )
								return;

							tool.AssignSettingsAsset( created );
							toolSO.Update();
						}
						else if ( !tool.HasValidOutputFolder() )
						{
							string folder = tool.HasValidPendingOutputFolder()
								? pendingOutputFolderProp.stringValue
								: PickFolderUnderAssets( "Select Output Folder", pendingOutputFolderProp.stringValue );

							if ( string.IsNullOrEmpty( folder ) )
								return;

							Undo.RecordObject( tool.SettingsAsset, "Set Output Folder" );

							pendingOutputFolderProp.stringValue = folder;
							toolSO.ApplyModifiedProperties();

							tool.SetPendingOutputFolder( folder );
							tool.PushPendingToAsset();
						}

						tool.PersistComponent();
						tool.PersistAsset();

						if ( tool.ValidateFullState( out string whyNotFinal ) )
						{
							// Material name collision: if Create Material is on
							// and a material with this bake name already exists,
							// confirm overwrite or cancel the entire bake.
							if ( tool.WouldOverwriteExistingMaterial( out string existingMatPath ) )
							{
								bool overwrite = EditorUtility.DisplayDialog(
									"Material already exists",
									$"A material already exists at:\n\n{existingMatPath}\n\n" +
									"Overwrite it, or cancel and change the Room Bake Name?",
									"Overwrite", "Cancel" );

								if ( !overwrite )
									return;
							}

							tool.BakeAll();
							GUIUtility.ExitGUI();
						}
						else
						{
							Debug.LogWarning( "[RoomBaker] " + whyNotFinal );
						}
					}
				}
			}
		}

		private static string DrawOutputFolderPicker( SerializedProperty outputFolderProp )
		{
			string pickedFolder = null;

			using ( new EditorGUILayout.HorizontalScope() )
			{
				EditorGUILayout.PrefixLabel( new GUIContent( "Output Folder",
					"Folder under Assets/ where the baked Color, Depth and Probe files will be written." ) );
				outputFolderProp.stringValue = EditorGUILayout.TextField( outputFolderProp.stringValue ?? string.Empty );

				if ( GUILayout.Button( new GUIContent( "Browse...", "Pick a folder under Assets/." ), GUILayout.Width( 90 ) ) )
				{
					pickedFolder = PickFolderUnderAssets( "Select Output Folder", outputFolderProp.stringValue );
					if ( !string.IsNullOrEmpty( pickedFolder ) )
						outputFolderProp.stringValue = pickedFolder;
				}
			}

			return pickedFolder;
		}

		private static string PickFolderUnderAssets( string title, string currentAssetFolder )
		{
			string projectRoot = Directory.GetParent( Application.dataPath ).FullName.Replace( "\\", "/" );
			string absStart = ToAbsolutePathForEditor( string.IsNullOrWhiteSpace( currentAssetFolder ) ? "Assets" : currentAssetFolder );

			if ( string.IsNullOrEmpty( absStart ) || !Directory.Exists( absStart ) )
				absStart = Application.dataPath;

			string selected = EditorUtility.OpenFolderPanel( title, absStart, "" );
			if ( string.IsNullOrEmpty( selected ) )
				return null;

			selected = selected.Replace( "\\", "/" );

			if ( !selected.StartsWith( projectRoot, StringComparison.OrdinalIgnoreCase ) )
			{
				EditorUtility.DisplayDialog( "Invalid Folder", "Please select a folder inside this Unity project (under Assets/).", "OK" );
				return null;
			}

			string rel = selected.Substring( projectRoot.Length ).TrimStart( '/' );

			if ( !rel.StartsWith( "Assets", StringComparison.OrdinalIgnoreCase ) )
			{
				EditorUtility.DisplayDialog( "Invalid Folder", "Please select a folder under Assets/.", "OK" );
				return null;
			}

			AssetDatabase.Refresh( ImportAssetOptions.ForceSynchronousImport );

			if ( !AssetDatabase.IsValidFolder( rel ) )
			{
				string abs = ToAbsolutePathForEditor( rel );
				if ( Directory.Exists( abs ) )
					AssetDatabase.Refresh( ImportAssetOptions.ForceSynchronousImport );
			}

			return rel;
		}

		private static string ToAbsolutePathForEditor( string assetPath )
		{
			if ( string.IsNullOrWhiteSpace( assetPath ) )
				return Application.dataPath;

			assetPath = assetPath.Replace( "\\", "/" );
			string projectRoot = Directory.GetParent( Application.dataPath ).FullName.Replace( "\\", "/" );
			return ( projectRoot + "/" + assetPath ).Replace( "\\", "/" );
		}

	}
#endif
}

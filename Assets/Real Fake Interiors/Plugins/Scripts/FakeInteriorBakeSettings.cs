// Real Fake Interiors
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>

using UnityEngine;

namespace RealFakeInteriors
{
	public enum DepthRGFormat
	{
		Texture2D, // For performance: stored as Texture2D directly
		ImageEXR // For compatibility: stored as EXR and relies on importer settings
	}

	// Created programmatically by FakeInteriorBakeTool — no CreateAssetMenu
	// on purpose, so users don't make orphan assets from the Create menu.
	public class FakeInteriorBakeSettings : ScriptableObject
	{
		public string bakeName = "Room01";
		public string outputFolderAssetPath = "Assets";

		public int bakeResolution = 1024;
		public int supersample = 4;
		public int anisoLevel = 8;
		// Horizontal aspect = Width / Height. 1 = square, 2 = twice as wide as
		// tall, 0.5 = twice as tall as wide.
		public float horizontalAspect = 1f;
		public int probeResolution = 512;
		public DepthRGFormat depthFormat = DepthRGFormat.Texture2D;

		// Material wiring. When targetMaterial is set, the bake stamps textures
		// and _RoomSize on it. When unset and createMaterial is on, the bake
		// creates a new material in the output folder and binds it here.
		public bool createMaterial = false;
		public Material targetMaterial;

		// Optional shader override for the auto-created material. When null,
		// the baker uses the Real Fake Interior variant matching the active
		// render pipeline (URP, HDRP, or BiRP).
		public Shader customShader;

		public string roomObjectPath;
		public string roomObjectName;

		public string furnitureObjectPath;
		public string furnitureObjectName;
	}
}

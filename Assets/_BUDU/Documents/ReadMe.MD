# BUDU URP Tools & Shader Ecosystem

# BUDU URP Tools & Shader Ecosystem

Comprehensive visual toolkit, shader architecture, procedural generators, audio reactivity, and workflow tools developed for Unity Universal Render Pipeline (URP).

---

## Architecture & Overview

BUDU is a modular framework designed for high-end stylized and technical rendering in Unity URP. It combines custom HLSL shader libraries, modular IMGUI ShaderGUI custom inspectors, procedural noise generation, audio visualization, screen analytics, and scene manipulation tools.

### Environment & Target
- **Unity Version:** Unity 2021 / 2022+ (URP)
- **Framework:** .NET Framework 4.7.1
- **Root Namespace:** `namespace budu`
- **Root Directory:** `Assets/_BUDU/`

---

## Directory Structure & Modules

```
Assets/_BUDU/
??? BUDU Shaders/        # Shaders, HLSL includes, custom ShaderGUI inspectors & modules
??? BUDU Tools/          # Scene, transform, atlas, and workflow productivity tools
??? BUDU Audio/          # Real-time FFT spectrum analysis, waveforms, and audio reactivity
??? BUDU Effects/        # VFX prefabs, particle textures, and materials (Flames, Fogs, etc.)
??? LibNoise Designer/   # Node-based procedural noise generator & texture baker (LibNoise port)
??? Motion Control/      # Procedural camera & object motion, sway, and kinematics
??? Screen Charts/       # In-editor and runtime telemetry, performance profiling HUD
??? Plugins/             # Global core libraries (BDColors, BDStyles, BUDUMath, Interpolations)
??? GUI/                 # Visual branding assets, banners, and icons
??? Presets/             # Preset configurations for shaders and tools
??? Documents/           # Documentation (README.MD, AGENT.MD)
```
??? Presets/             # Preset configurations for shaders and tools
??? Documents/           # Documentation (README.MD, AGENT.MD)
```

---

## ?? 1. BUDU Shaders Ecosystem

### Custom Shader Inspectors (`Assets/_BUDU/BUDU Shaders/Editor/`)
All BUDU shader inspectors inherit from Unity's `ShaderGUI` and share a centralized utility framework in `GUIExtras.cs` to enforce DRY principles:
- **`BCarPaintEditor.cs`** - Multi-layer car paint shader (Flakes, Clear Coat, Two-Tone Fresnel/Gradient, Ambient Occlusion, Decals/Stickers).
- **`BSoftToonEditor.cs`** - Soft toon shading with stepped lighting, shade color contrast, base map blending, and custom specular.
- **`BBlinnEditor.cs`** - Blinn-Phong lighting with checkerboard procedural texture mode and reflection probes.
- **`BLambertEditor.cs`** - Classic Lambertian diffuse with checkerboard mode and normal maps.
- **`BSurfaceEditor.cs`** - Advanced PBR triplanar and detail surface mapping.
- **`BFabricEditor.cs`** - Velvet/cloth anisotropic rim lighting and secondary color mixing.
- **`BFoilageEditor.cs`** - Foliage wind displacement, translucency, and sub-surface scattering.
- **`BShoreWaveEditor.cs`** - Animated shoreline foam, water depth, and wave refraction.
- **`BFogEditor.cs`** - Volumetric procedural noise fog.
- **`BHologramEditor.cs`** - Scanlines, glitch effects, fresnel transparency, and chromatic aberration.
- **`BCrystalEditor.cs` / `BCrystalDecalEditor.cs`** - Internal caustics, refraction, and crystal facets.
- **`BTransparentEditor.cs`** - Depth-faded transparent surfaces with custom refraction.
- **`BDioramaEditor.cs`** - Tilt-shift and stylized diorama rendering.
- **`BRainFlowLitEditor.cs`** - Animated dynamic rain droplets and wet streak flow maps.

### Centralized Shader Modules (`Assets/_BUDU/BUDU Shaders/Plugins/GUI/GUIExtras.cs`)
Rather than duplicating inspector code, shader sections are organized as reusable static modules:
- **`BaseSettingsGUI`** - Base color, map, and checkerboard procedural pattern.
- **`TwoColorSettingsGUI`** - Second color with Fresnel, Gradient Y, or Fresnel & Gradient blending.
- **`NormalSettingsGUI`** - Normal map, strength, and multiplier controls.
- **`ShadeColorSettingsGUI`** - Shading color, intensity, contrast pivot, and extra foldouts.
- **`SpecularSettingsGUI`** - Specular color, intensity, invert, gamma, glossy, and softness.
- **`RimSettingsGUI`** - Rim lighting, invert, bias, power, scale, and color.
- **`ReflectionSettingsGUI`** - CubeMap reflection, Fresnel reflection, probe reflection, and masking.

### HLSL Include Libraries (`Assets/_BUDU/BUDU Shaders/hlsl/`)
- **`BUDUNoises/`**: Optimized HLSL procedural noise functions (`Perlin.hlsl`, `Voronoi.hlsl`, `Billow.hlsl`, `Brownian.hlsl`, `Aliigator.hlsl`, `RippleNoise.hlsl`, `randomDots.hlsl`).
- **`Functions/`**: Math and curve algorithms (`Functions.hlsl`, `MathFunctions.hlsl`, `MathRampFunctions.hlsl`, `RotateAxis.hlsl`, `IntersectionMask.hlsl`).
- **`Includes/`**: Fundamental constants (`constants.hlsl`, `ciexyz_1931_table.hlsl`, `spectrum.hlsl`).
- **`Effects/`**: Procedural rain drops, volume clouds, volumetric fog, and caustics.
- **`FullScreenFX/`**: Fullscreen blit passes and post-processing shaders.

---

## ??? 2. BUDU Tools (Productivity & Scene Management)

Location: `Assets/_BUDU/BUDU Tools/`
- **`AlignerObjects.cs`**: Precision scene object alignment, distribution, and snapping tool.
- **`Duplicator.cs`**: Linear, grid, and radial object array duplication.
- **`GradientGenerator.cs`**: Generates and bakes 1D gradient textures directly to PNG.
- **`GridTextureSheetCreator.cs` / `SpriteAtlasCreator.cs`**: Combines textures into flipbooks and sprite atlases.
- **`IntersectionMapBaker.cs`**: Bakes mesh-to-mesh contact depth masks into textures.
- **`MaterialSelector.cs` / `MaterialSelectorEditor.cs`**: Batch selects and swaps materials across hierarchy.
- **`MoCap.cs`**: Records and bakes editor transform motion to animation clips.
- **`MyShortCuts.cs`**: Productivity shortcuts for Unity Editor.
- **`PatternEditor.cs`**: Procedural repetitive pattern generation.
- **`PoolGenerator.cs`**: Configurable object pooling runtime & generator.
- **`PrefabEmitter.cs`**: Procedural physics/transform prefab spawner.
- **`Randomizer.cs` / `RotatorRandomizer.cs` / `PropertyRandomizer.cs`**: Procedural transform and parameter variation.
- **`Renamer.cs`**: Regex and incremental batch hierarchy renaming.
- **`RotateLock.cs` / `RotationLimiter.cs`**: Transform constraint components.
- **`SelectionSetWindow.cs`**: Quick hierarchy selection group manager.
- **`Shaker.cs` / `ShakerEditor.cs`**: Noise-based transform shaking (screenshake, engine rumble).
- **`TextureOffsetScroller.cs`**: Runtime UV animation script for conveyers, liquids, and particles.

---

## ?? 3. LibNoise Designer (Procedural Noise Texture Suite)

Location: `Assets/_BUDU/LibNoise Designer/`
A full C# port of the LibNoise coherent noise library tailored for Unity editor baking:
- **Noise Generators:** `Perlin`, `Voronoi`, `Billow`, `RidgedMultifractal`, `Spheres`, `Cylinders`, `Checker`, `Const`.
- **Noise Operators:** `Add`, `Blend`, `Cache`, `Clamp`, `Curve`, `Displace`, `Exponent`, `Invert`, `Max`, `Min`, `Multiply`, `Power`, `Rotate`, `Scale`, `ScaleBias`, `Select`, `Subtract`, `Terrace`, `Translate`, `Turbulence`.
- **Baking:** Real-time preview and export to texture assets with customizable resolution, seamless tiling, and color ramps.

---

## ?? 4. BUDU Audio (Audio Reactivity & FFT Analysis)

Location: `Assets/_BUDU/BUDU Audio/`
- **`AudioPeer.cs`**: Core FFT (Fast Fourier Transform) audio analyzer that splits audio into 8 frequency bands, smoothed buffer bands, and normalized amplitude values (0.0 to 1.0).
- **`AudioParam.cs`**: Component linking `AudioPeer` frequency bands directly to Material properties (color, emission, float sliders) or Transform components (scale, position, rotation).
- **`AudioWaveform.cs`**: Real-time oscilloscope-style audio waveform visualization.
- **`VUMeter.cs` / `VUMeterNeedle.cs`**: Realistic analog VU meter gauge needle simulation with physics damping.

---

## ?? 5. Screen Charts (Telemetry & Profiling)

Location: `Assets/_BUDU/Screen Charts/`
- Real-time in-game and editor HUD rendering of performance metrics (Frame Rate, Frame Time, Memory, Custom Float telemetry).
- Configurable color palettes, line smoothing, grid lines, min/max bounds, and ScriptableObject presets (`ScreenChartsConfigPresetSO`).

---

## ?? 6. Core Plugins (`Assets/_BUDU/Plugins/`)

- **`BDColors.cs`**: Central color engine containing cohesive palettes (`NexusOrange`, `NexusBlue`, `DarkRed`, `DarkOrange`, `Black`, `White`, `GrayP`, `Transparent`).
- **`BDStyles.cs`**: Centralized IMGUI style definitions for consistent tool interfaces.
- **`BUDUMath.cs`**: Mathematical utilities, remap functions, smoothstep, fract, and pseudo-random algorithms.
- **`Interpolations.cs`**: Comprehensive collection of easing equations (Linear, EaseInQuad, EaseOutCubic, Elastic, Bounce, etc.).
- **`GizmosHelper.cs`**: High-performance gizmo drawing utilities for custom editor inspectors.

---

## ?? Getting Started

1. Import or pull the repository into your Unity URP project.
2. Shader materials using BUDU shaders will automatically present the custom styled inspector.
3. Access BUDU tools via the top menu bar (`BUDU / ...`) or right-click context menus.
4. For developer instructions and AI agent guidelines, refer to [`AGENT.MD`](./AGENT.MD).

# BUDU AI Agent Technical Handbook & Architectural Reference

# BUDU AI Agent Technical Handbook & Architectural Reference

This document serves as the permanent, authoritative operational handbook for any AI programming assistant (GitHub Copilot) or senior software engineer operating within the `Assets/_BUDU` workspace.

---

## 1. Executive Summary & Persona Directives

### 1.1 Purpose of the Repository
The `_BUDU` codebase is a high-performance visual and technical framework built for **Unity Universal Render Pipeline (URP)**. It integrates:
- Highly customized shader families with proprietary IMGUI inspectors (`ShaderGUI`).
- A centralized DRY UI library (`GUIExtras.cs`) that guarantees visual consistency across all inspectors.
- Procedural math and noise synthesis (`LibNoise Designer`, `BUDUNoises/` HLSL).
- Real-time audio spectrum telemetry and reactive material/transform binders (`BUDU Audio`).
- In-game telemetry and editor profilers (`Screen Charts`).
- Scene workflow automation and object scattering utilities (`BUDU Tools`).

### 1.2 Agent Communication & Work Philosophy
1. **Name:** When asked, you are "GitHub Copilot".
2. **Language:** Respond in Turkish to user requests, keeping technical terms clear and accurate.
3. **Tone & Style:** Short, direct, impersonal, and highly competent. Avoid conversational fluff or apologies.
4. **Minimal Invasiveness:** Make minimal, surgical modifications to achieve the goal. Never rewrite surrounding functional code unless explicitly requested.
5. **Never Break Working APIs:** Do NOT alter existing method signatures, parameter positions, or default arguments in shared libraries (`GUIExtras.cs`, `BDColors.cs`, `ShaderGUIHelpers.cs`).

---

## 2. Technical Environment & Compiler Constraints

| Parameter | Specification | Notes |
| :--- | :--- | :--- |
| **Workspace Root** | `B:\Current Projects\UnityProjects\BUDU-URP-Tools\` | Working directory |
| **Language Target** | `.NET Framework 4.7.1` / C# 7.3 | Avoid C# 8+ constructs (e.g. nullable reference types `?` on non-value types, top-level statements, positional pattern matching) |
| **Render Pipeline** | Unity Universal Render Pipeline (URP) | Custom lighting models, HLSL subgraphs |
| **Primary Namespaces** | `budu`, `UnityEditor`, `UnityEngine` | Core utilities are encapsulated under `namespace budu` |
| **Git Remote** | `https://github.com/bduruoz/BUDU-URP` (`main` branch) | Tracking main branch |

### 2.1 Workspace Compiler Diagnostics Warning
When executing full project builds (`run_build`), Unity may report ~500 compilation errors in `Packages/com.unity.render-pipelines.universal/.../VFX*.cs` (e.g., missing `IRequireVFXContext`, missing `VFXTaskCompiledData`).
- **Diagnosis:** This is a known Unity Package Manager dependency mismatch (URP VFX Graph package missing in project manifest).
- **Rule:** **These errors are external and pre-existing.** NEVER attempt to fix package-level VFX errors unless specifically instructed.
- **Validation Standard:** Always validate BUDU code using `get_errors` targeted at specific files (e.g., `GUIExtras.cs`, `BCarPaintEditor.cs`). If `get_errors` returns clean, the code is 100% valid.

---

## 3. Directory Layout & Critical File Paths

```
Assets/_BUDU/
??? BUDU Shaders/
?   ??? Editor/                       # All custom ShaderGUI inspectors (23 files)
?   ??? Plugins/GUI/                  # ? CORE SHADER INSPECTOR FRAMEWORK
?   ?   ??? GUIExtras.cs              # Central static GUI library (SHeader, SFoldout, SBox, SToggleBox, Modules)
?   ?   ??? BDShaderGUI.cs            # Universal defaults (Blending, Cull, Stencil, ZWrite, Render Queue)
?   ?   ??? ShaderGUIHelpers.cs       # Custom widgets (FloatSliderFree, Vector2Property, EnumPopupProperty)
?   ?   ??? EditorGUIHelper.cs        # UI Separator, Line drawers
?   ?   ??? BD_ScaleOffset_GUI.cs     # Texture scale & offset IMGUI widget
?   ??? hlsl/                         # HLSL Include files (BUDUNoises/, Functions/, Includes/, Effects/)
??? Plugins/
?   ??? BDColors.cs                   # Central color palette (NexusOrange, DarkRed, DarkOrange, etc.)
?   ??? BDStyles.cs                   # Shared GUIStyle definitions
?   ??? BUDUMath.cs                   # Math functions (Remap, Smoothstep, Fract)
?   ??? Interpolations.cs             # Easing equations (Quadratic, Cubic, Bounce, Elastic)
?   ??? GUI/GizmosHelper.cs           # Gizmo drawing utilities
??? BUDU Tools/                       # Editor productivity tools (Duplicator, Aligner, Renamer, Shaker)
??? BUDU Audio/                       # Audio reactivity & FFT spectrum analysis (AudioPeer, AudioParam)
??? LibNoise Designer/                # LibNoise C# port with editor texture baking
??? Motion Control/                   # Procedural transform kinetics and sway
??? Screen Charts/                    # In-editor and runtime telemetry HUD
??? Documents/                        # System documentation (README.MD, AGENT.MD)
??? GUI/                              # Inspector banners and logos
```

> ?? **Directory Disambiguation Note:**
> Notice that `GUIExtras.cs` is at `Assets/_BUDU/BUDU Shaders/Plugins/GUI/GUIExtras.cs`, NOT in `Assets/_BUDU/Plugins/GUI/`. Always confirm file locations using search tools rather than guessing.

---

## 4. The DRY ShaderGUI Modular Architecture

### 4.1 The Philosophy
Historically, every shader editor (`BCarPaintEditor.cs`, `BSoftToonEditor.cs`, `BBlinnEditor.cs`, etc.) independently implemented 50-200 lines of repetitive IMGUI code for common blocks (Base Settings, Specular, Normal Maps, Rim Lighting, Reflections, Shade Controls).

We are progressively refactoring these inspectors to adhere to a **Single Responsibility & DRY (Don't Repeat Yourself)** pattern:
1. Reusable blocks are extracted into static methods inside `GUIExtras.cs` under clear `#region <ModuleName> Module` sections.
2. Shader editors reduce their `#region` blocks to a single method invocation.
3. Shader property lookups inside modules use `GetProperty(propertyName, properties)`.
4. Material persistent flags (0 or 1 integers) are handled via `GetBool` / `SetBool` helpers.

### 4.2 Example Transformation

#### Before (Duplicated in individual editor):
```csharp
#region Normal Settings
GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);
EditorGUILayout.BeginVertical(style);
if (checkNormal)
{
    EditorGUI.indentLevel++;
    MaterialProperty nrm = ShaderGUI.FindProperty("_Normal", properties);
    GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20, true, () => {
        materialEditor.ShaderProperty(nrm, "Normal Map");
    });
    if (nrm.floatValue > 0f)
    {
        MaterialProperty flnTxt = ShaderGUI.FindProperty("_Normal_Map", properties);
        MaterialProperty flNormStrength = ShaderGUI.FindProperty("_Normal_Strength", properties);
        materialEditor.ShaderProperty(flnTxt, "Normal Map");
        materialEditor.RangeProperty(flNormStrength, "Normal Strength");
    }
    EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion
```

#### After (Clean call to centralized module):
```csharp
#region Normal Settings
GUIExtras.SHeader("NORMAL SETTINGS", ref checkNormal, "_CheckNormal", targetMat, style);
EditorGUILayout.BeginVertical(style);
if (checkNormal)
{
    EditorGUI.indentLevel++;
    GUIExtras.NormalSettingsGUI(materialEditor, properties);
    EditorGUI.indentLevel--;
}
EditorGUILayout.EndVertical();
#endregion
```

---

## 5. UI Layout Containers & IMGUI Geometry Rules (`GUIExtras.cs`)

The user requires **pixel-perfect visual rhythm**. SBox, SFoldout, and SToggleBox title bars must align on the exact same X pixel and have identical height.

### 5.1 Geometry Constants
```csharp
#region Title Bar Helpers
// Shared indent so SBox/SFoldout/SToggleBox titles all start at the same X position (matches foldout arrow indent).
const int TitleIndent = 14;

static float TitleBarHeight(int titleFontSize)
{
    return Mathf.Max(16f, titleFontSize + 8f);
}
#endregion
```
- **X-Indent Rule:** `TitleIndent = 14`. This ensures that a label in an `SBox` or `SToggleBox` aligns perfectly with the text of an `SFoldout` (which has a 14px foldout arrow).
- **Y-Height Rule:** `TitleBarHeight(fontSize) = Mathf.Max(16f, titleFontSize + 8f)`. Guarantees equal title bar thickness across all container types.

### 5.2 Container Anatomy & Exact Signatures

#### A. `SColoredVertical`
Creates a colored rectangular background behind an arbitrary block of controls:
```csharp
public static void SColoredVertical(Color bgcolor, float height = -1f, bool MiddleCenter = true, System.Action inside = null)
```
- **Frozen Signature Rule:** Never change the order of parameters. Never use `params GUILayoutOption[]`. Call sites throughout the codebase look like:
  ```csharp
  GUIExtras.SColoredVertical(BDColors.NexusOrange(50), 20, true, () => {
      materialEditor.ShaderProperty(prop, "Label");
  });
  ```

#### B. `SHeader` (Section Accordion Header)
Top-level expandable shader section header with persistent material state:
```csharp
public static bool SHeader(string title, ref bool state, string propertyName, Material targetMat, GUIStyle style)
```
- Draws `MakeBackground(1, 1, BDColors.GrayP(18, 204))`.
- Persists state directly to `targetMat.SetInt(propertyName, state ? 1 : 0)`.

#### C. `SFoldout` (Nested Foldout)
Collapsible nested block with colored title bar and background:
```csharp
public static void SFoldout(
    Material targetMat,
    string propName,
    string title,
    Color bgColor,
    int titleFontSize = 11,
    Color? titleTextColor = null,
    Color? titleBarBgColor = null,
    bool solidBackground = true,
    Action drawContent = null)
```
- Uses `EditorGUI.Foldout(foldoutRect, state, title, true, foldoutStyle)`.
- `foldoutStyle.fontStyle = FontStyle.Normal;`
- Title height is strictly clamped using `TitleBarHeight(titleFontSize)`.

#### D. `SBox` (Non-Foldout Content Box)
1. **Titleless Overload:**
   ```csharp
   public static void SBox(Color bgColor, Action drawContent = null)
   ```
2. **Titled Overload:**
   ```csharp
   public static void SBox(
       string title,
       Color bgColor,
       int titleFontSize = 11,
       Color? titleTextColor = null,
       Color? titleBarBgColor = null,
       Action drawContent = null)
   ```
- Title uses `GetControlRect(false, titleBarHeight)` and `GUI.Label(labelRect, title, titleStyle)`.
- Prevents `GUILayout.Label` natural height expansion from stretching the title bar vertically.

#### E. `SToggleBox` (Titled Box with Right-Aligned Toggle)
Renders a styled title bar with a title on the left and a toggle checkbox on the right, matching standard property row layout:
```csharp
public static bool SToggleBox(
    MaterialEditor materialEditor,
    MaterialProperty[] properties,
    string title,
    string propertyName,
    Material targetMat,
    Color bgColor,
    int titleFontSize = 11,
    Color? titleTextColor = null,
    Color? titleBarBgColor = null,
    Action drawContent = null)
```

**The Exact IMGUI Alignment Formula:**
```csharp
Rect fullRect = EditorGUILayout.GetControlRect(false, titleBarHeight);
int prevIndent = EditorGUI.indentLevel;
EditorGUI.indentLevel = 0; // Prevent indent offset from displacing label/toggle calculation

Rect labelRect = new Rect(fullRect.x, fullRect.y, EditorGUIUtility.labelWidth, fullRect.height);
Rect toggleRect = new Rect(fullRect.x + EditorGUIUtility.labelWidth + 2f, fullRect.y, 16f, fullRect.height);

GUI.Label(labelRect, title, titleStyle);

EditorGUI.showMixedValue = toggleProp.hasMixedValue;
EditorGUI.BeginChangeCheck();
bool newVal = EditorGUI.Toggle(toggleRect, toggleProp.floatValue > 0f);
if (EditorGUI.EndChangeCheck())
{
    toggleProp.floatValue = newVal ? 1f : 0f;
}
EditorGUI.showMixedValue = false;
state = newVal;
EditorGUI.indentLevel = prevIndent;
```
> **Why `+2f` Offset?** Unity's standard `ShaderProperty` checkbox begins at `labelWidth + 2px` relative to control X. Setting `labelWidth + 2f` aligns `SToggleBox` checkboxes with standard property sliders and fields.

---

## 6. Complete Inventory of Modules in `GUIExtras.cs`

| Module Method | Signature & Key Params | Handled Material Properties | Typical Consuming Inspectors |
| :--- | :--- | :--- | :--- |
| **`BaseSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props)` | `_Base_Color`, `_Checkerboard`, `_Checker_Color_A`, `_Checker_Color_B`, `_Checker_Frequency`, `_Base_Map` | `BBlinnEditor`, `BLambertEditor` |
| **`TwoColorSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, Material mat)` | `_TwoColorFold`, `_Two_Colors`, `_PAINT_TYPE_SELECTOR`, `_Second_Color`, Fresnel params, Gradient Y params | `BCarPaintEditor` |
| **`NormalSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props)` | `_Normal`, `_Normal_Map`, `_Normal_Strength`, `_Normal_Multiplier` | `BCarPaintEditor`, `BSoftToonEditor`, `BBlinnEditor`, `BLambertEditor`, `BSurfaceEditor`, etc. |
| **`ShadeColorSettingsGUI`**| `(MaterialEditor editor, MaterialProperty[] props, Material mat)` | `_Shading_Toggle`, `_Shade_Color`, `_Shading_Contribution`, `_Shading_Intensity`, `_Full_Shade_Contrast`, `_ShadeExtFold`, `_Shading_Normal_Strength`, `_Shading_Affect_Base_Map` | `BSoftToonEditor` |
| **`SpecularSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, Material mat, bool nrm = false)` | `_Spec_Toggle`, `_Spec_Color`, `_Spec_Intensity`, `_Spec_Map`, `_Spec_Map_Invert`, `_Spec_Gamma`, `_Spec_Glossy`, `_blinnFold`, `_Spec_Normal_Strength` | `BCarPaintEditor`, `BSoftToonEditor`, `BBlinnEditor` |
| **`RimSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, bool nrm = false)` | `_Rim_Toggle`, `_Rim_Invert`, `_Rim_Intensity`, `_Rim_Color`, `_Rim_Contrast`, `_Rim_Contrast_Pivot`, `_Rim_Gamma`, `_Rim_Bias`, `_Rim_Power`, `_Rim_Scale` | `BCarPaintEditor`, `BSoftToonEditor`, `BSurfaceEditor` |
| **`ReflectionSettingsGUI`**| `(MaterialEditor editor, MaterialProperty[] props, Material mat, bool nrm = false)` | `_Reflection_Feature`, `_Reflection_Type`, Probe controls, Cubemap controls, Fresnel controls, Mask controls | `BCarPaintEditor`, `BBlinnEditor`, `BSoftToonEditor` |
| **`ProbeSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props)` | `_Probe_Intensity`, `_Probe_Color`, `_Probe_Roughness` | Internal to `ReflectionSettingsGUI` |
| **`ReflectionCubemapSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, Material mat)` | `_CubemapFold`, `_Cubemap_Type`, `_Cube_Map`, `_Cube_Map_HDR`, `_Cube_LOD`, `_Cube_Rotate_X/Y/Z`, `_Cube_Stretch_X/Y/Z`, `_Cube_Position_X/Y/Z` | Internal to `ReflectionSettingsGUI` |
| **`ReflectionFresnelSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, Material mat)` | `_FresnelFold`, `_Reflect_Fresnel_Invert`, `_Reflect_Fresnel_Bias`, `_Reflect_Fresnel_Scale`, `_Reflect_Fresnel_Power`, `_Reflect_Fresnel_Contrast` | Internal to `ReflectionSettingsGUI` |
| **`ReflectionMaskSettingsGUI`** | `(MaterialEditor editor, MaterialProperty[] props, Material mat)` | `_RefMaskFold`, `_Reflection_Mask_Map`, `_Reflection_Mask_Invert`, `_Reflection_Mask_Channel`, `_Reflection_Mask_Multiplier` | Internal to `ReflectionSettingsGUI` |

---

## 7. State Management & Utility Helpers (`GUIExtras.cs`)

### 7.1 Property Extraction
```csharp
static MaterialProperty GetProperty(string propertyName, MaterialProperty[] properties)
```
- Iterates through `MaterialProperty[]` by name.
- Throws clear `ArgumentException` if the property is missing, preventing silent null references in the inspector.

### 7.2 Material Boolean Accessors
```csharp
public static bool GetBool(Material targetMat, string propertyName)
public static void SetBool(Material targetMat, string propertyName, bool value)
public static bool TryGetBool(Material targetMat, string propertyName, bool defaultValue = false)
```
- Unity materials store boolean toggles as floats or ints (`0` or `1`).
- `loadMaterialVariables` in any `ShaderGUI` should strictly use `GetBool` to populate local bool fields:
  ```csharp
  void loadMaterialVariables(Material targetMat)
  {
      checkBase = GUIExtras.GetBool(targetMat, "_CheckBase");
      checkNormal = GUIExtras.GetBool(targetMat, "_CheckNormal");
      checkSpec = GUIExtras.GetBool(targetMat, "_CheckSpec");
  }
  ```

### 7.3 Conditional Normal Texture Validation
```csharp
public static bool IsToggleAndTextureEnabled(MaterialProperty[] properties, string togglePropertyName, string texturePropertyName)
```
- Checks if the texture slot is non-null AND the toggle property is active (> 0).
- Example usage in shader editors:
  ```csharp
  bool nrmTog = GUIExtras.IsToggleAndTextureEnabled(properties, "_Normal", "_Normal_Map");
  GUIExtras.SpecularSettingsGUI(materialEditor, properties, targetMat, nrmTog);
  ```

---

## 8. Color Palette Standards (`BDColors.cs`)

All styling uses `budu.BDColors` to maintain palette harmony:

| Method | Visual Role | Sample Hex/RGB |
| :--- | :--- | :--- |
| `BDColors.NexusOrange()` | Primary accent color, active titles, highlights | Vibrant Orange (`#FF7F00`) |
| `BDColors.NexusOrange(50)` | Subtle horizontal/vertical highlight band | Orange at ~20% alpha |
| `BDColors.NexusBlue(50)` | Secondary feature highlight band (e.g. AO) | Cyan/Blue at ~20% alpha |
| `BDColors.DarkRed(120)` | Deep maroon background for nested foldout headers | Rich Dark Red (`#5A1010`) |
| `BDColors.DarkOrange(80)` | Header bar background for warning/accent groups | Warm Amber |
| `BDColors.Black(20)` | Faint contrast backing behind label rows | Black at ~8% alpha |
| `BDColors.Black(40)` | Medium contrast outline / title bar background | Black at ~16% alpha |
| `BDColors.GrayP(18, 204)` | Standard top-level SHeader button background | Dark Charcoal Grey |
| `BDColors.White(255)` | Pure white text / icon color | `#FFFFFF` |

---

## 9. Catalog of All 23 Shader Editors (`BUDU Shaders/Editor/`)

| File Name | Shader Target | Key Features | Modular Status |
| :--- | :--- | :--- | :--- |
| `BCarPaintEditor.cs` | BUDU Car Paint | Multi-layer flakes, two-tone, decals, clear coat, AO, reflections | Fully Refactored (TwoColor, Spec, Norm, Refl) |
| `BSoftToonEditor.cs` | BUDU Soft Toon | Stepped lighting, shade color contrast, base blending, specular | Fully Refactored (ShadeColor, Spec, Norm, Rim, Refl) |
| `BBlinnEditor.cs` | BUDU Blinn | Blinn-Phong, checkerboard generator, reflection probes | Fully Refactored (Base, Spec, Norm, Refl) |
| `BLambertEditor.cs` | BUDU Lambert | Classic diffuse, checkerboard generator, normal mapping | Candidate for `BaseSettingsGUI` |
| `BSurfaceEditor.cs` | BUDU Surface | Advanced PBR, Triplanar mapping, detail normal/albedo | Uses `NormalSettingsGUI`, `RimSettingsGUI` |
| `BFabricEditor.cs` | BUDU Fabric | Velvet anisotropic rim, cloth secondary mix, detail fuzz | Custom cloth logic + `NormalSettingsGUI` |
| `BFoilageEditor.cs` | BUDU Foliage | Wind displacement, vertex flutter, translucency SSS | Custom wind + `NormalSettingsGUI` |
| `BShoreWaveEditor.cs` | BUDU Shore Wave | Animated wave displacement, foam line, shoreline depth | Custom water dynamics |
| `BFogEditor.cs` | BUDU Fog | Procedural 3D noise volume fog, light scatter | Custom fog parameters |
| `BCrystalEditor.cs` | BUDU Crystal | Internal caustics, refraction dispersion, facet normals | Custom crystal physics |
| `BCrystalDecalEditor.cs`| BUDU Crystal Decal | Decal projector caustics | Custom decal inspector |
| `BCausticDecalEditor.cs`| BUDU Caustic Decal | Animated underwater caustics projection | Custom caustic animation |
| `BHologramEditor.cs` | BUDU Hologram | Scanlines, vertex glitch noise, fresnel transparency | Custom hologram parameters |
| `BLiquidEditor.cs` | BUDU Liquid | Wobble physics, meniscus level, fill plane | Custom liquid container physics |
| `BIvyEditor.cs` | BUDU Ivy | Cutout foliage with procedural growth masking | Uses `NormalSettingsGUI` |
| `BSkyboxEditor.cs` | BUDU Skybox | Procedural atmosphere, sun disk, ground fog | Custom sky parameters |
| `BToonEditor.cs` | BUDU Toon | Hard ramp toon shading, multi-step shadows | Toon ramp controls |
| `BTransparentEditor.cs` | BUDU Transparent | Depth fade transparency, refractive distortion | Transparency controls |
| `BDioramaEditor.cs` | BUDU Diorama | Tilt-shift depth of field, miniature vignette | Diorama post-effects |
| `BRainFlowLitEditor.cs` | BUDU Rain Flow Lit | Dynamic rain ripples, wet surface flow maps | Wetness & rain physics |
| `BEmissiveEditor.cs` | BUDU Emissive | Pulsing glow, audio-driven emission | Emission modifiers |
| `_BMatTemp.cs` | Template | Scaffold for authoring new ShaderGUIs | Template |

---

## 10. Non-Shader Subsystems Quick Reference

### 10.1 `BUDU Audio` (`Assets/_BUDU/BUDU Audio/`)
- **`AudioPeer.cs`**: Attach to a GameObject with an `AudioSource`. Performs 512-sample FFT spectrum analysis. Exposes `audioBand[]`, `audioBandBuffer[]` (smoothed), `Amplitude`, and `AmplitudeBuffer` (0.0 to 1.0).
- **`AudioParam.cs`**: Links `AudioPeer` outputs directly to Material Properties (float, color, emission) or Transform scale/position without writing script hooks.
- **`VUMeter.cs` / `VUMeterNeedle.cs`**: Simulates physics-damped needle dynamics of vintage analog VU meters.

### 10.2 `LibNoise Designer` (`Assets/_BUDU/LibNoise Designer/`)
- Full C# port of the LibNoise coherent noise library.
- **Generators:** `Perlin`, `Voronoi`, `Billow`, `RidgedMultifractal`, `Spheres`, `Cylinders`, `Checker`, `Const`.
- **Operators:** `Add`, `Blend`, `Clamp`, `Displace`, `Exponent`, `Invert`, `Multiply`, `Select`, `Turbulence`.
- **Baking:** Open via Unity menu to preview and bake seamless noise textures directly to project assets.

### 10.3 `BUDU Tools` (`Assets/_BUDU/BUDU Tools/`)
- **`AlignerObjects.cs`**: Scene object alignment tool (X, Y, Z min/max/center distribution).
- **`Duplicator.cs`**: Array duplicator (Linear, Grid, Circular).
- **`GradientGenerator.cs`**: Bakes Unity `Gradient` curves into 1D/2D PNG texture assets.
- **`GridTextureSheetCreator.cs`**: Compiles individual frames into particle flipbooks.
- **`IntersectionMapBaker.cs`**: Bakes mesh intersection depth contact masks.
- **`Shaker.cs`**: Trauma-based rotational and positional camera/object shaking.

---

## 11. Golden Operational Rules for the AI Agent

1. **Rule 1 — Never Break Working Method Signatures:**
   Do not modify parameter lists or default values of existing public methods in `GUIExtras.cs` (e.g. `SColoredVertical`, `SFoldout`, `SBox`).
2. **Rule 2 — Respect Title Bar Indent & Height:**
   Always use `TitleIndent = 14` and `TitleBarHeight(fontSize)` so foldouts, boxes, and toggle boxes stay aligned.
3. **Rule 3 — Toggle Box Indent Reset Pattern:**
   In custom controls that split `GetControlRect`, always save `prevIndent = EditorGUI.indentLevel; EditorGUI.indentLevel = 0;`, draw labels/toggles with explicit coordinates, and restore `EditorGUI.indentLevel = prevIndent;`.
4. **Rule 4 — Verify with `get_errors` After Every Change:**
   Run `get_errors` on every file you touch. Ensure zero new errors exist before confirming completion. Ignore unrelated VFX package errors in `Packages/`.
5. **Rule 5 — Use `BDColors` Instead of Raw Colors:**
   Use the cohesive palette (`BDColors.NexusOrange()`, `BDColors.DarkRed(120)`, etc.) rather than ad-hoc `new Color(...)`.
6. **Rule 6 — Keep Responses Crisp and in Turkish:**
   Summarize your actions cleanly and concisely in Turkish without preamble.

About

  Real Fake Interiors (c) Amplify Creations, Lda. All rights reserved.

  Real Fake Interiors is a parallax interior shader and baker for Unity.

    https://u3d.as/3WRV?aid=1011lPwI&pubref=Editor

Description

  Real Fake Interiors fakes the look of furnished rooms behind a flat window
  using a depth-aware parallax raymarch over baked Color + Depth textures and
  a baked reflection cubemap. Build a real room once in the scene, point the
  bake tool at it, and reuse the result on any flat window surface across
  your project.

Features

  * One-click baker - Color (PNG), Depth RG (Texture2D or EXR) and Reflection Probe (EXR)
  * Square, Wide (2:1) and Tall (1:2) room aspects
  * Optional auto-create / re-bind of the output material
  * Surface-aware supersample resolve - clean object/object silhouettes
  * Depth-aware bilinear sampling in the shader - smooth interiors, no
    cross-surface bleed at runtime
  * Coarse-to-fine parallax march with binary refine
  * Per-pixel blue-noise jitter and start-phase offset to break banding
  * Optional blinds mask texture
  * HDR cubemap exposure, rotation and tint controls
  * Per-instance tiling for window grids and building facades
  * Anisotropic filtering preserved at runtime for grazing angles
  * Single shader, one variant per pipeline (BiRP / URP / HDRP)

Supported Platforms

  * Runtime - Windows, macOS, Linux, Consoles, iOS, Android, WebGL, VR
  * Compatible with Built-in, URP and HDRP render pipelines
  * One bake works on all three pipelines

Minimum Requirements

  Software

    Unity 6.x
    Unity 2022.2+

Quick Guide - Baker

  The included "Room Baker" prefab is the entry point. It ships with the
  bake component, Camera_FRONT, Camera_BACK and the Reflection Probe
  already wired up - you don't build any of that yourself. Your only job
  is to provide the content that gets baked.

  1) Drag the Room Baker prefab into a scene.
  2) Build your room in the scene and split it into two parent GameObjects
     - one for the cubemap bake, one for the color + depth bake:
     - Cubemap parent: walls, ceiling, floor, window frames, doors, rugs,
       posters, paintings - anything mostly flat against the room shell.
       This drives the reflection probe and ambient response.
     - Furniture parent: everything that should read as having depth
       through the window - tables, chairs, lamps, sofas, props.
       This drives the parallax Color + Depth textures.
     Build these the way you'd build any other scene - real geometry,
     real materials, real lighting.
  3) Select Room Baker in the Hierarchy and assign your two parents to
     the bake tool's Room and Furniture slots. If you name the parents
     "Room - Cubemap" and "Furniture - Color + Depth" the tool auto-fills
     them for you.
  4) Click "Create Bake Asset" the first time to generate a settings asset
     under a folder of your choice. Subsequent bakes reuse it.
  5) Set the bake parameters:
     - Resolution: final texture size (256 to 4096).
     - Supersampling: internal render scale before the surface-aware
       resolve. Higher = cleaner silhouettes, slower bake.
     - Anisotropic Level: applied to the baked Color texture importer.
       0 disables. 8 is a sensible default.
     - Room Aspect: Square (1:1), Wide Room (2:1) or Tall Room (1:2).
       The baker stamps the choice on the material as _RoomSize so the
       shader's parallax box matches the bake.
     - Depth Format: Texture2D (.asset, fastest) or EXR (.exr, more
       portable). Both are point-filtered, no mips.
     - Probe Resolution: cubemap size for the reflection probe.
     - Output Folder: where the bake outputs are written.
     - Material Helper (optional): assign an existing material to have
       the baker re-bind its Color, Depth, Cubemap and _RoomSize on each
       bake, or enable "Create Material" to have the baker generate one
       automatically using the active pipeline's Real Fake Interior
       shader (or a custom shader you pick).
  6) Click "Bake Room". Three assets are produced:
     - <Name>_Color.png                 - baked color, point-filtered, no mips
     - <Name>_DepthRG.asset / .exr      - packed front/back depth in RG channels
     - <Name>_Probe.exr                 - reflection cubemap
  7) Assign all three to a material using the Parallax Fake Interior shader
     (Color, Depth, Cubemap slots) and apply it to any flat quad or plane mesh.
     If you used the Material Helper, this step is already done.

Shader Properties

  Parallax

    Parallax Steps                  Number of coarse raymarch iterations.
                                    Higher = sharper interior, slower.
                                    Default 80(close view). Try 20 on mobile.

    Parallax Offset                 Virtual depth of the room behind the
                                    window. Larger = deeper room feel.
                                    Default 1.

    Refine Steps                    Binary-search refinement after the
                                    coarse march finds a hit. Higher =
                                    sharper hit position. Range 0-8.

    Start Phase Strength            Per-pixel random offset applied to the
                                    march start. Hides repeated-slab hits
                                    and vertical banding artifacts.

  Room Look

    Room Brightness                 Multiplier added on top of the sampled
                                    interior color. Use to lift or darken
                                    the whole interior.

    Room Tint                       Color tint applied to the interior.
                                    Set to black for no tint.

    Room Tiling                     UV tile multiplier. Use values > 1
                                    when a single material drives a wall
                                    of windows; each tile shows the same
                                    interior.

    Room Size                       (X, Y) aspect of the parallax box.
                                    Set automatically by the baker to
                                    match the chosen Room Aspect; only
                                    touch this if you bake a custom
                                    aspect manually.

  Cubemap

    Room Cubemap                    Reflection cubemap baked by the tool.
                                    
    Cubemap Exposure                HDR multiplier for the cubemap. Tune
                                    against your scene lighting.

    Cubemap Rotation                Yaw rotation of the cubemap, in
                                    degrees. Useful when you want the
                                    interior light direction to read
                                    differently per building or facade.

  Textures

    Interior Color Texture          Baked color PNG. Must be Point + no
                                    mips (baker sets this automatically).

    Interior Heightmap Texture      Packed depth (Texture2D .asset or
                                    .exr) - R = inverted front depth,
                                    G = back depth. Must be Point.

    Blue Noise                      Tiling blue-noise texture used to jitter
                                    the march and break banding.

    Use Blinds                      Toggles the Blinds mask.

    Blinds                          Optional grayscale mask multiplied into
                                    the final color. Use to add curtains,
                                    shutters or window frame decals.

  Sampling

    Blue Noise Scale                Frequency of the noise jitter pattern
                                    in screen space.

    Blue Noise Strength             Amplitude of the per-step jitter. Too
                                    high = noisy interiors, too low = hard
                                    banding.

    Use Screen Space Blue Noise     0/1 toggle. Screen-space jitter looks
                                    stable; surface-space looks tied to
                                    the geometry.

Tips

  * Strongly recommended: use baked lighting in your source room. Dynamic-only lighting will look flat
    and possibly noisy in the baked Color texture.
  * Strongly recommended: pack as much as possible into the cubemap parent
    (rugs, posters, paintings, doors, baseboards, ceiling fixtures, wall
    decor). Anything that lives close to the room shell costs you nothing
    at runtime - it's all flattened into the reflection probe - and adds
    a huge amount of visual richness to the result.
  * Bake at 1024 with 4x supersample as a sensible default. Bump to 2048
    only if you can see individual texels on a close window.
  * The shader does depth-aware bilinear internally. Do NOT enable
    bilinear/trilinear or mipmaps on the baked Color or Depth textures -
    the baker imports them as Point + no mips on purpose. Anisotropic is
    fine and helps grazing angles.
  * For best results, the Color and Depth textures must come from the same
    bake - they share a per-pixel surface assignment. Mixing them across
    bakes will smear silhouettes.
  * Use the per-instance Cubemap Rotation + Room Tint to make a single
    bake look different across many materials.

Feedback

  To file error reports, questions or suggestions, you may use
  our feedback form online:

    http://amplify.pt/contact

  Or contact us directly:

    For general inquiries - info@amplify.pt
    For technical support - support@amplify.pt (customers only)

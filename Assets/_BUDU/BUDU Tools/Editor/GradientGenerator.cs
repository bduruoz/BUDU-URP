// file: Assets/Editor/GradientTextureGeneratorWindow.cs
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

public class GradientGenerator : EditorWindow
{
    #region Fields 
    // GUI & Preview
    bool isDirty = true;
    const int PREVIEW_SIZE = 390;
    Texture2D banner;
    Vector2 previewScroll;
    Texture2D previewTex;

    //Gradient Parameters
    Gradient gradient = new Gradient();
    int resolution = 512;
    int stepCount = 0;
    
    // Direction & Flips
    enum Dir { 
        Horizontal, 
        Vertical, 
        Rotated, 
        Radial, 
        Diamond, 
        Conical, 
        Spiral, 
        RadialRipple,
        QuadricRadialRipple,
        HorizSinus, 
        VertSinus, 
        HorizSineStripes, 
        VertSineStripes,
        HorizHyperbolic,
        VertHyperbolic
    }
    Dir direction = Dir.Horizontal;
    bool flipH, flipV, invertRotated;
    float rotation = 0f;

    float shiftAmount = 0f;

    // Radial
    Vector2 radialCenter = new Vector2(0.5f, 0.5f);
    float radialScale = 1f;
    bool radialRepeat = false;
    bool radialInvert = false;
    
    // Conical
    float conicalOffset = 0f;   // degrees
    bool conicalInvert = false;
    
    // Spiral
    float spiralTightness = 4f; // 0 = circle, >0 tight spiral
    bool spiralInvert = false;

    // Radial Ripple
    float rippleFreq = 10f;
    float power = 1.2f;
    bool rippleInvert = false;

    // Sin
    float sinusFreq = 10f;
    bool sinusInvert = false;

    // Sine Stripes
    float stripeFreq = 10f;
    float stripeAmplitude = 0.5f;
    float stripeRepeat = 1f;
    bool stripeInvert = false;

    // Hyperbolic Stripes
    float hyStripeAmplitude = 0.5f;
    float hyStripeRepeat = 1f;
    bool hyStripeInvert = false;
    #endregion

    [MenuItem("BUDU-Tools/Generators/Gradient Generator")]
    static void ShowWindow()
    {
        var window = GetWindow<GradientGenerator>("Gradient Generator");
        window.minSize = new Vector2(400, 400);
        window.maxSize = new Vector2(400, 850);
        window.Show();
    }

    void OnEnable()
    {
        banner = AssetDatabase.LoadAssetAtPath<Texture2D>("Assets/_BUDU/GUI/BUDU-ToolsGradientGenerator.png");
    }

    #region OnGUI
    void OnGUI()
    {
        DrawHeader();
        GUILayout.Space(10);

        gradient = EditorGUILayout.GradientField("Gradient", gradient);
        direction = (Dir)EditorGUILayout.EnumPopup("Direction", direction);
        stepCount = EditorGUILayout.IntSlider("Step Count", stepCount, 1, 64);
        shiftAmount = EditorGUILayout.Slider("Shift Amount", shiftAmount, -5f, 5f);

        // direction-specific parameters
        switch (direction)
        {
            case Dir.Horizontal: 
                flipH = EditorGUILayout.Toggle("Flip Horizontal", flipH); 
                break;
            case Dir.Vertical: 
                flipV = EditorGUILayout.Toggle("Flip Vertical", flipV); 
                break;
            case Dir.Rotated:
                rotation = EditorGUILayout.Slider("Rotation (deg)", rotation, 0f, 360f);
                invertRotated = EditorGUILayout.Toggle("Invert Rotated", invertRotated); 
                break;
            case Dir.Radial:
                GUILayout.Label("Radial Options", EditorStyles.boldLabel);
                radialCenter = EditorGUILayout.Vector2Field("Center (UV)", radialCenter);
                radialScale = EditorGUILayout.Slider("Scale", radialScale, 0.1f, 32f);
                radialRepeat = EditorGUILayout.Toggle("Repeat", radialRepeat);
                radialInvert = EditorGUILayout.Toggle("Invert", radialInvert); 
                break;
            case Dir.Diamond:
                GUILayout.Label("Diamond Options", EditorStyles.boldLabel);
                radialCenter = EditorGUILayout.Vector2Field("Center (UV)", radialCenter);
                radialScale = EditorGUILayout.Slider("Scale", radialScale, 0.1f, 32f);
                radialRepeat = EditorGUILayout.Toggle("Repeat", radialRepeat);
                radialInvert = EditorGUILayout.Toggle("Invert", radialInvert); 
                break;
            case Dir.Conical:
                GUILayout.Label("Conical Options", EditorStyles.boldLabel);
                conicalOffset = EditorGUILayout.Slider("Start Offset (deg)", conicalOffset, 0f, 360f);
                conicalInvert = EditorGUILayout.Toggle("Invert", conicalInvert); 
                break;
            case Dir.Spiral:
                GUILayout.Label("Spiral Options", EditorStyles.boldLabel);
                spiralTightness = EditorGUILayout.Slider("Tightness", spiralTightness, 0f, 32f);
                spiralInvert = EditorGUILayout.Toggle("Invert", spiralInvert); 
                break;
            case Dir.RadialRipple:
            case Dir.QuadricRadialRipple:
                GUILayout.Label("Ripple Options", EditorStyles.boldLabel);
                rippleFreq = EditorGUILayout.Slider("Frequency", rippleFreq, 1f, 64f);
                power = EditorGUILayout.Slider("Power", power, 0.01f, 4f);
                rippleInvert = EditorGUILayout.Toggle("Invert", rippleInvert); 
                break;
            case Dir.HorizSinus:
            case Dir.VertSinus:
                sinusFreq = EditorGUILayout.Slider("Frequency", sinusFreq, 1f, 64f);
                sinusInvert = EditorGUILayout.Toggle("Invert", sinusInvert); 
                break;
            case Dir.HorizSineStripes:
            case Dir.VertSineStripes:
                stripeFreq = EditorGUILayout.Slider("Stripe Frequency", stripeFreq, 1f, 64f);
                stripeAmplitude = EditorGUILayout.Slider("Stripe Amplitude", stripeAmplitude, -2f, 2f);
                stripeRepeat = EditorGUILayout.Slider("Stripe Repeat", stripeRepeat, 0.1f, 64f);
                stripeInvert = EditorGUILayout.Toggle("Invert Stripes", stripeInvert); 
                break;
            case Dir.HorizHyperbolic:
            case Dir.VertHyperbolic:
                hyStripeAmplitude = EditorGUILayout.Slider("Stripe Amplitude", hyStripeAmplitude, -4f, 4f);
                hyStripeRepeat = EditorGUILayout.Slider("Stripe Repeat", hyStripeRepeat, 0.1f, 64f);
                hyStripeInvert = EditorGUILayout.Toggle("Invert Stripes", hyStripeInvert);
                break;
        }

        GUILayout.Space(10);
        if (isDirty || GUI.changed)   // parametre değişti mi?
        {
            GeneratePreview();
            isDirty = false;
        }

        if (previewTex != null)
        {
            previewScroll = EditorGUILayout.BeginScrollView(previewScroll, GUILayout.Height(400));
            GUILayout.Label("", GUILayout.Width(PREVIEW_SIZE), GUILayout.Height(PREVIEW_SIZE));
            GUI.DrawTexture(GUILayoutUtility.GetLastRect(), previewTex, ScaleMode.StretchToFill);
            EditorGUILayout.EndScrollView();
        }

        EditorGUI.BeginDisabledGroup(previewTex == null);
        resolution = EditorGUILayout.IntSlider("Export Size", resolution, 16, 4096);
        if (GUILayout.Button("Save Texture as PNG", GUILayout.Height(30))) SaveAsPNG();
        EditorGUI.EndDisabledGroup();
    }
    #endregion

    #region Header
    void DrawHeader()
    {
        GUILayout.Space(3);
        if (banner != null)
        {
            float h = 25f, ratio = (float)banner.width / banner.height;
            Rect r = GUILayoutUtility.GetRect(h * ratio, h, GUILayout.ExpandWidth(false));
            GUI.DrawTexture(r, banner, ScaleMode.ScaleToFit);
        }
        else
        {
            GUILayout.BeginHorizontal(); GUILayout.FlexibleSpace();
            var st = new GUIStyle() { fontSize = 18, fontStyle = FontStyle.Bold, normal = { textColor = Color.white } };
            GUILayout.Label("Gradient Generator", st); GUILayout.FlexibleSpace(); GUILayout.EndHorizontal();
        }
    }
    #endregion

    #region Generate / Save
    void GeneratePreview() => GenerateTexture(PREVIEW_SIZE, PREVIEW_SIZE, ref previewTex);

    void GenerateTexture(int w, int h, ref Texture2D tex)
    {
        if (tex) DestroyImmediate(tex);
        tex = new Texture2D(w, h, TextureFormat.RGBA32, false) { wrapMode = TextureWrapMode.Clamp };

        for (int y = 0; y < h; y++)
        {
            for (int x = 0; x < w; x++)
            {
                float u = x / (float)(w - 1f);
                float v = y / (float)(h - 1f);

                // flips
                if (direction == Dir.Horizontal && flipH) u = 1f - u;
                if (direction == Dir.Vertical && flipV) v = 1f - v;

                float t = direction switch
                {
                    Dir.Horizontal => SampleHorizontal(u),
                    Dir.Vertical => SampleVertical(v),
                    Dir.Rotated => SampleRotated(u, v),
                    Dir.Radial => SampleRadial(u, v, w, h),
                    Dir.Diamond => SampleDiamond(u, v, w, h),
                    Dir.Conical => SampleConical(u, v),
                    Dir.Spiral => SampleSpiral(u, v),
                    Dir.RadialRipple => SampleRadialRipple(u, v),
                    Dir.QuadricRadialRipple => SampleRadialQuadricRipple(u, v),
                    Dir.HorizSinus => SampleSinus(v),
                    Dir.VertSinus => SampleSinus(u),
                    Dir.HorizSineStripes => SampleHorizSineStripes(u, v),
                    Dir.VertSineStripes => SampleVertSineStripes(u, v),
                    Dir.HorizHyperbolic => SampleHyperbolic(u, v),
                    Dir.VertHyperbolic => SampleHyperbolic(v, u),
                    _ => 0f
                };

                if (stepCount > 1) t = Mathf.Floor(t * stepCount) / (stepCount - 1);
                tex.SetPixel(x, y, gradient.Evaluate(Mathf.Clamp01(t)));
            }
        }
        tex.Apply();
    }

    void SaveAsPNG()
    {
        string path = EditorUtility.SaveFilePanel("Save Gradient Texture", "", "GradientTexture", "png");
        if (string.IsNullOrEmpty(path)) return;
        Texture2D export = null;
        GenerateTexture(resolution, resolution, ref export);
        System.IO.File.WriteAllBytes(path, export.EncodeToPNG());
        DestroyImmediate(export);
        AssetDatabase.Refresh();
        Debug.Log($"Gradient texture saved to: {path}");
    }
    #endregion

    #region Sampling Methods
    float SampleHorizontal(float u)
    {
        return u + shiftAmount;
    }
    float SampleVertical(float v)
    {
        return (v + shiftAmount);
    }
    float SampleRotated(float u, float v)
    {
        float uc = u - 0.5f, vc = v - 0.5f;
        float rad = rotation * Mathf.Deg2Rad;
        float cos = Mathf.Cos(rad), sin = Mathf.Sin(rad);
        float ru = cos * uc - sin * vc;
        float[] c =
        {
            cos * -0.5f - sin * -0.5f, cos *  0.5f - sin * -0.5f,
            cos * -0.5f - sin *  0.5f, cos *  0.5f - sin *  0.5f
        };
        float t = ((ru + shiftAmount) - Mathf.Min(c)) / (Mathf.Max(c) - Mathf.Min(c));
        return invertRotated ? 1f - t : t;
    }
    float SampleRadial(float u, float v, int w, int h)
    {
        float t = 0f;
        float dx = (u - radialCenter.x) * w / Mathf.Max(w, h);
        float dy = v - radialCenter.y;
        float d = (Mathf.Sqrt(dx * dx + dy * dy) + shiftAmount) * radialScale;
        if (radialRepeat)
        {
            t = Mathf.Repeat(d * 2f, 1f);
        }
        else
        {
            t = Mathf.Clamp01(d * 2f);
        }
        return radialInvert ? 1f - t : t;
    }
    float SampleDiamond(float u, float v, int w, int h)
    {
        float t = 0f;
        float dx = Mathf.Abs((u - radialCenter.x) * w / Mathf.Max(w, h));
        float dy = Mathf.Abs(v - radialCenter.y);
        float d = ((dx + dy) + shiftAmount) * radialScale;
        if (radialRepeat)
        {
            t = Mathf.Repeat(d * 2f, 1f);
        }
        else
        {
            t = Mathf.Clamp01(d * 2f);
        }
        return radialInvert ? 1f - t : t;
    }
    float SampleConical(float u, float v)
    {
        float a = Mathf.Atan2(v - 0.5f, u - 0.5f) * Mathf.Rad2Deg + 180f + conicalOffset;
        a = Mathf.Repeat((a + shiftAmount), 360f) / 360f;
        return conicalInvert ? 1f - a : a;
    }
    float SampleSpiral(float u, float v)
    {
        float dx = u - 0.5f, dy = v - 0.5f;
        float radius = Mathf.Sqrt(dx * dx + dy * dy);
        float angle = Mathf.Atan2(dy, dx) * Mathf.Rad2Deg + 180f;
        float t = (angle + radius * spiralTightness * 360f) / 360f;
        t = Mathf.Repeat(t, 1f);
        return spiralInvert ? 1f - t : t;
    }
    float SampleRadialRipple(float u, float v)
    {
        float dx = u - 0.5f;
        float dy = v - 0.5f;
        float d = Mathf.Sqrt(dx * dx + dy * dy);
        float t = Mathf.Sin(d * rippleFreq * Mathf.PI * 2f) * 0.5f + 0.5f;
        t = Mathf.Clamp01(t);
        return rippleInvert ? 1f - t : t;
    }
    float SampleRadialQuadricRipple(float u, float v)
    {
        float dx = u - 0.5f;
        float dy = v - 0.5f;
        float d = Mathf.Pow(dx * dx + dy * dy,power);
        float t = Mathf.Sin((d + shiftAmount) * rippleFreq * Mathf.PI * 2f) * 0.5f + 0.5f;
        return rippleInvert ? 1f - t : t;
    }
    float SampleSinus(float u)
    {
        float t = 0f;
        float mask = Mathf.Sin((u + shiftAmount) * sinusFreq * Mathf.PI) * 0.5f + 0.5f;
        t = Mathf.Repeat(mask, 1f);
        return sinusInvert ? 1f - t : t;
    }
    float SampleHorizSineStripes(float u, float v)
    {
        float t = 0f;
        float samp = stripeAmplitude * (stripeRepeat / 10f);
        float mask = Mathf.Sin(u * stripeFreq * Mathf.PI) * samp;
        t = Mathf.Repeat((v * stripeRepeat) + mask,1f);
        t = Mathf.Clamp01(t);
        return stripeInvert ? 1f - t : t;
    }
    float SampleVertSineStripes(float u, float v)
    {
        float t = 0f;
        float samp = stripeAmplitude * (stripeRepeat / 10f);
        float mask = Mathf.Sin(v * stripeFreq * Mathf.PI) * samp;
        t = Mathf.Repeat((u * stripeRepeat) + mask, 1f);
        t = Mathf.Clamp01(t);
        return stripeInvert ? 1f - t : t;
    }
    float SampleHyperbolic(float u, float v)
    {
        float samp = hyStripeAmplitude * (hyStripeRepeat);
        float mask = (u - 0.5f) * (u - 0.5f);
        float t = Mathf.Repeat(v * hyStripeRepeat + (mask * samp), 1f);
        t = Mathf.Clamp01(t);
        return hyStripeInvert ? 1f - t : t;
    }
    #endregion
}
#endif
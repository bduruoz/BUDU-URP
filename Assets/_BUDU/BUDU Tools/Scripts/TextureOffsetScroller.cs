// BUDU Games 2024 - 2025
using UnityEngine;

[ExecuteAlways]
public class TextureOffsetScroller : MonoBehaviour
{
    [System.Serializable]
    public class TextureScrollSettings
    {
        [Tooltip("Texture property adı (örn. _BaseMap, _MainTex, _EmissionMap).")]
        public string textureProperty = "_MainTex";

        [Header("U Ayarları")]
        public bool animateU = true;
        public float speedU = 0.1f;

        [Header("V Ayarları")]
        public bool animateV = true;
        public float speedV = 0.1f;
    }

    [Header("Renderer ve Material Ayarları")]
    public Renderer targetRenderer;
    [Tooltip("Material index (ör. 0 = ilk material).")]
    public int materialIndex = 0;

    [Header("Texture Scroll Listesi")]
    public TextureScrollSettings[] textures;

    private Material mat;

    void Awake()
    {
        SetupMaterial();
    }

    void OnValidate()
    {
        SetupMaterial();
    }

    //void SetupMaterial()
    //{
    //    if (targetRenderer == null) return;

    //    if (materialIndex < 0 || materialIndex >= targetRenderer.sharedMaterials.Length)
    //    {
    //        Debug.LogWarning($"Material index {materialIndex} geçersiz. Renderer'da {targetRenderer.sharedMaterials.Length} adet material var.");
    //        return;
    //    }

    //    // Instancing için material kullanıyoruz
    //    mat = targetRenderer.materials[materialIndex];
    //}

    void SetupMaterial()
    {
        if (targetRenderer == null) return;

        if (materialIndex < 0 || materialIndex >= targetRenderer.sharedMaterials.Length)
        {
            Debug.LogWarning($"Material index {materialIndex} geçersiz. Renderer'da {targetRenderer.sharedMaterials.Length} adet material var.");
            return;
        }

        // Materiali bir kez instantiate et (memory leak önler)
#if UNITY_EDITOR
        if (!Application.isPlaying)
        {
            // Editor modunda shared material kullan
            mat = targetRenderer.sharedMaterials[materialIndex];
            return;
        }
#endif

        // Play modunda instance yarat
        Material[] mats = targetRenderer.materials; // bu bir array kopyası yaratır
        mats[materialIndex] = new Material(mats[materialIndex]);
        targetRenderer.materials = mats;
        mat = targetRenderer.materials[materialIndex];
    }

    void Update()
    {
        if (mat == null) return;

        foreach (var tex in textures)
        {
            if (!mat.HasProperty(tex.textureProperty)) continue;

            float u = tex.animateU ? (Time.time * tex.speedU) % 1f : 0f;
            float v = tex.animateV ? (Time.time * tex.speedV) % 1f : 0f;

            mat.SetTextureOffset(tex.textureProperty, new Vector2(u, v));
        }
    }
}

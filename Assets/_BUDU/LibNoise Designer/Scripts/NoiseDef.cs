using LibNoise;
using UnityEngine;

public abstract class NoiseDef : ScriptableObject
{
    public abstract ModuleBase Build();

    // Inspector’da her parametre değişiminde yeniden hesaplanır
    public int ParamHash()
    {
        int h = 17;
        // tüm serialize field’ları ekle
        foreach (var f in GetType().GetFields(
                    System.Reflection.BindingFlags.NonPublic |
                    System.Reflection.BindingFlags.Instance))
            if (f.IsDefined(typeof(SerializeField), false))
                h = h * 31 + (f.GetValue(this)?.GetHashCode() ?? 0);
        return h;
    }

    int _cachedHash = int.MinValue;
    public int GetParamHash()
    {
        if (_cachedHash != int.MinValue) return _cachedHash;   // ilk çağrıda hesapla
        int h = 17;
        foreach (var f in GetType().GetFields(
                    System.Reflection.BindingFlags.NonPublic |
                    System.Reflection.BindingFlags.Instance))
            if (f.IsDefined(typeof(SerializeField), false))
                h = h * 31 + (f.GetValue(this)?.GetHashCode() ?? 0);
        _cachedHash = h;
        return h;
    }

    // Inspector’da her parametre değiştiğinde çağır
    void OnValidate() => _cachedHash = int.MinValue;   // önbelleği boz
}
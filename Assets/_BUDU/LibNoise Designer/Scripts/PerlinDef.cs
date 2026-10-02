// © BUDU Games 2024 - 2026
// LibNoise Perlin Definition

using UnityEngine;
using LibNoise;
using LibNoise.Generator;

namespace BUDU.LNoise.Generators
{
    [CreateAssetMenu(fileName = "Perlin", menuName = "BUDU/Noise/Perlin", order = 0)]
    public class PerlinDef : NoiseDef
    {
        [SerializeField] float _frequency = 1f;
        [SerializeField] int _octaves = 6;
        [SerializeField] float _lacunarity = 2f;
        [SerializeField] float _persistence = 0.5f;
        [SerializeField] int _seed = 0;
        public override ModuleBase Build() =>
            new Perlin(_frequency, _lacunarity, _persistence,
                                          _octaves, _seed, QualityMode.High);
    }
}
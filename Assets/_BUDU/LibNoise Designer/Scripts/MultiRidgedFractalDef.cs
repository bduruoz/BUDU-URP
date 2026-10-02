// © BUDU Games 2024 - 2026
// LibNoise Multi Ridget Fractal Definition

using UnityEngine;
using LibNoise;
using LibNoise.Generator;

namespace BUDU.LNoise.Generators
{
    [CreateAssetMenu(fileName = "RidgedMultifractal", menuName = "BUDU/Noise/RidgedMultifractal", order = 4)]
    public class RidgedMultifractalDef : NoiseDef
    {
        [SerializeField] float _frequency = 1f;
        [SerializeField] float _lacunarity = 2f;
        [SerializeField] int _octaves = 6;
        [SerializeField] int _seed = 0;
        [SerializeField] float _exponent = 1f;
        [SerializeField] float _gain = 2f;
        [SerializeField] float _offset = 1f;
        [SerializeField] QualityMode _quality = QualityMode.Medium;

        public override ModuleBase Build()
        {
            var module = new RidgedMultifractal(
                frequency: _frequency,
                lacunarity: _lacunarity,
                octaves: _octaves,
                seed: _seed,
                quality: _quality
            );

            // Ekstra parametreleri sonradan ayarla
            module.SpectralWeightsExponent = _exponent;
            module.Gain = _gain;
            module.Offset = _offset;
            

            return module;
        }
    }
}
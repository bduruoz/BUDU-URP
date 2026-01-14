using UnityEngine;
using LibNoise;
using LibNoise.Generator;

namespace BUDU.LNoise.Generators
{
    [CreateAssetMenu(fileName = "Billow", menuName = "BUDU/Noise/Billow", order = 2)]
    public class BillowDef : NoiseDef
    {
        [SerializeField] float _frequency = 1f;
        [SerializeField] int _octaves = 6;
        [SerializeField] float _lacunarity = 2f;
        [SerializeField] float _persistence = 0.5f;
        [SerializeField] int _seed = 0;

        public override ModuleBase Build() =>
            new Billow(_frequency, _lacunarity, _persistence,
                       _octaves, _seed, QualityMode.High);
    }
}
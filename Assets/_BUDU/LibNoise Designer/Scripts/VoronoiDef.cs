// © BUDU Games 2024 - 2026
// LibNoise Voronoi Definition

using UnityEngine;
using LibNoise;
using LibNoise.Generator;
using LibNoise.Operator;

namespace BUDU.LNoise.Generators
{
    [CreateAssetMenu(fileName = "Voronoi", menuName = "BUDU/Noise/Voronoi", order = 1)]
    public class VoronoiDef : NoiseDef
    {
        [SerializeField] float _frequency = 1f;
        [SerializeField] float _displacement = 0f;
        [SerializeField] bool _distance = true;
        [SerializeField] int _seed = 0;
        [SerializeField] float _pow = 1f;
        public override ModuleBase Build()
        {
            ModuleBase voronoi = new Voronoi(_frequency, _displacement, _seed, _distance);

            //var mn = new Const(_min);
            var pow = new Const(_pow);
            var pww = new Max(pow, voronoi);

            return pww;
            

        }
    }
}
#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

float voronoi_noise(float2 uv, float type, float speed, float pointNo, float seed, out float cellIndex)
{
    float coeff = 1;//0.35;
    float t = _Time * speed;
    float minDist = 100;
    float d = 0;
    float2 p = 0;

    for(int i = 0; i < pointNo; i++)
    {
        //seed += 0.03;
        float2 n = noise_v1(float2(i + seed,i - seed));
        if(t == 0)
        {
            p = (sin(n) * 2.5)-1;
        }
        else
        {
            p = (sin(n * t));
        } 
        
        float2 ruv = (uv * 2) - 1;
        float td = length(ruv - p);

        float euclidean2 = dot(td,td);
        float euclidean = td;
        float manhattan = abs(length(ruv.x - p.x)) + abs(length(ruv.y - p.y));
        float chebyshev = max(abs(length(ruv.x-p.x)), abs(length(ruv.y-p.y)));

        d = td;
        switch(type)
        {
            case 0:
                // Euclidean^2
                d = euclidean2;
                break;
            case 1:
                // Euclidean
                d = euclidean;                                             
                break;
            case 2:
                // Manhattan
                d = manhattan;
                break;
            case 3:
                // Chebyshev
                d = chebyshev;
                break;
            case 4:
                // dot(Manhattan, Chebyshev)
                d = dot(manhattan, chebyshev);
                break;
            case 5:
                // tests
                d = pow(euclidean, 0.5) * pow(chebyshev + manhattan, 0.5);
                break;       
        }

        if(d < minDist)
        {
            minDist = d;
            cellIndex = i / pointNo;
        }
    }
    return minDist;
}

void voronoi_float( float2 uv, float Type, float Speed, float PointNo, float edgeSize, float seed,
     out float Voronoi, out float CellIndex, out float Edges)
{
    // type
    // 1 - Euclidean ^2
    // 2 - Euclidean
    // 3 - Manhattan
    // 4 - Chebyshev
    // 5 - Chebyshev + Manhattan
    // 6 - tests

    edgeSize *= 0.001;

    voronoi_noise(uv + float2(edgeSize, 0), Type, Speed, PointNo, seed, CellIndex);
    float dx1 = CellIndex;
    voronoi_noise(uv - float2(edgeSize, 0), Type, Speed, PointNo, seed, CellIndex);
    float dx2 = CellIndex;
    voronoi_noise(uv + float2(0, edgeSize), Type, Speed, PointNo, seed, CellIndex);
    float dy1 = CellIndex;
    voronoi_noise(uv - float2(0, edgeSize), Type, Speed, PointNo, seed, CellIndex);
    float dy2 = CellIndex;
    
    float dx = dx1 - dx2;
    float dy = dy1 - dy2;

    Edges = abs(dx) + abs(dy) > 0;

    Voronoi = voronoi_noise(uv, Type, Speed, PointNo, seed, CellIndex);

}

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

float voronoi_calc(float2 uv, float type, float speed, float gridNo, float gridArea, float seed, out float2 cellIndex)
{
    //gridArea = 5; // grid render area
    if(gridArea < 1)
    {
        gridArea = 1;
    }
    if(gridArea > 5)
    {
        gridArea = 5;
    }

    float count = 0;
    float radius = 1;
    float t = 0;

    if(speed == 0)
    {
        t = 152.453;
    }
    else
    {
        t = _Time * (speed * 30);
    }

    float minDist = 100;
    //float2 cid = float2(0,0);
    float d = 0;

    uv *= gridNo ;
    float2 gv = frac(uv);
    float2 id = floor(uv);

    for(float y = -gridArea; y <= gridArea; y++)
    {
        for(float x = -gridArea; x <= gridArea; x++)
        {
            count++;
            
            float2 offs = float2(x, y);
            float2 n = noise_v1(id + offs + seed);
            float2 p = ((offs) + sin(n * t) * 0.4);

            float euclidean2 = dot(p - gv, p - gv);
            float euclidean = distance(p - gv, 0);
            float manhattan = abs(length(gv.x - p.x)) + abs(length(gv.y - p.y));
            float chebyshev = max(abs(length(gv.x - p.x)), abs(length(gv.y - p.y)));

            switch(type)
            {
                case 0:
                    d = euclidean2;
                    break;
                case 1:
                    d = euclidean;
                    break;
                case 2:
                    d = manhattan;
                    break;
                case 3:
                    d = chebyshev;
                    break;
                case 4:
                    d = dot( manhattan, chebyshev);
                    break;
                case 5:
                    p -= gv;
                    d = pow(p.x * p.x * p.x * p.x + p.y * p.y * p.y * p.y,
                        1.5);
                    break;
                case 6:
                    d = distance((manhattan) - (chebyshev/2), (manhattan/2) + (chebyshev));
                    break;
                case 7:
                    p = euclidean2;
                    float p2 = clamp(saturate(smoothstep(0.32, 0.32, euclidean2)),0,1);
                    //p += (saturate(step(euclidean2,0.5)))-1;
                    d = p2+p;
                    break;
            }

            if(d < minDist)
            {
                minDist = d;
                cellIndex = n;
            }
        }
    }
    return minDist;
}

float voronoi_iter(float2 uv, float type, float Speed, float gridNo, float gridArea, float iterAlpha, float octave, float iterSpeed, float seed, out float2 cellIndex)
{   
    if(octave > 10)
    {
        octave = 9;
    }

    float s = 0.0;
    float m = 0.0;
    float a = 0.5;
    float b = 0;
    float result = 0;

    for(int i = 0; i < octave; i++)
    {
        b = voronoi_calc(uv, type, Speed, gridNo, gridArea, seed, cellIndex);

        s += a * b;
        m += a;

        Speed *= iterSpeed;

        a *= iterAlpha;
        gridNo *= 2.0;
        result = s / m;
    }
    return result;
}


void voronoi_float(float2 uv, float Type, float octave, float Speed, float gridNo, float gridArea, float iterAlpha, float iterSpeed, float edgeSize, float seed,
    out float Voronoi, out float2 CellIndex, out float Edges)
{
    // type
    // 1 - Euclidean ^2
    // 2 - Euclidean
    // 3 - Manhattan
    // 4 - Chebyshev
    // 5 - Chebyshev + Manhattan
    // 6 - dot Chebyshev, Manhattan

    edgeSize *= 0.001;

    voronoi_iter(uv + float2(edgeSize, 0), Type, Speed, gridNo, gridArea, iterAlpha, octave, iterSpeed, seed, CellIndex);
    float2 dx1 = CellIndex;
    voronoi_iter(uv - float2(edgeSize, 0), Type, Speed, gridNo, gridArea, iterAlpha, octave, iterSpeed, seed, CellIndex);
    float2 dx2 = CellIndex;
    voronoi_iter(uv + float2(0, edgeSize), Type, Speed, gridNo, gridArea, iterAlpha, octave, iterSpeed, seed, CellIndex);
    float2 dy1 = CellIndex;
    voronoi_iter(uv - float2(0, edgeSize), Type, Speed, gridNo, gridArea, iterAlpha, octave, iterSpeed, seed, CellIndex);
    float2 dy2 = CellIndex;
    
    float dx = dx1.x - dx2.x;
    float dy = dy1.y - dy2.y;

    Edges = abs(dx) + abs(dy) > 0;

    Voronoi = voronoi_iter(uv, Type, Speed, gridNo, gridArea, iterAlpha, octave, iterSpeed, seed, CellIndex);
}

/* tests
                    // forte (ters s)
                    //p *= distance(cos(p.x*2) * sin(p.y*2), p/2);
                    //d = distance(p,0);

                    // wood gibi
                    //p *= distance(cos(p.x*2) * sin(p.y*2), p/2);
                    //d = pow(p,.1);

                    // ilginc O ortasında nokta var gibi
                    //p *= distance(cos(p.x*2) * cos(p.y*2), p * 0.5);
                    //d = distance(p,p/2);

                    // ilginc ucube bi sekil
                    //p *= distance(sin(p.x*2) * sin(p.y*2), p*1.2);
                    //d = length(asin(p)) * length(acos(p));

                    // 70's pattern
                    //p *= distance(cos(p.x*2) * sin(p.y*2), sin(p * 0.1)*0.4);
                    //d = length(p);

                    // baya ilginc
                    //p *= distance(cos(p.y*2) * sin(p.y*2), cos(p.x*4));
                    //p *= distance(sin(p.x*2) * cos(p.x*2), sin(p.y*4));
                    //d = distance(cos(p*2),sin(p*2));

                    // Black Vein
                    //p += distance(cos(p.y*2) * sin(p.y*2), (p/2)-0.5);
                    //p -= distance(cos(p.x*2) * sin(p.x*2), (p/2)-0.5);
                    //d = pow(distance(sin(p), sin(-p)),tan(p*10));

                    // Black Gray Vein 2
                    //p -= distance(cos(p.y*2) * sin(p.y*2), (p/2) - 0.5);
                    //p += distance(cos(p.x*2) * sin(p.x*2), (p/2) - 0.5);
                    //d = min(sqrt(distance(sin(p), sin(-p))), sqrt(sin(p*1) * cos(p*1)));

                    //p += ((cos(p.x) * cos(p.y)) * (t/10)); // cok iyi
                    //d = distance(p, 0);
                    //p += ((sin(p.x) * sin(p.y)) * (t/10)); // cok iyi star 
                    //d = distance(p, 0);

                    // !!! Ekle bunu --- cok cok iyi
                    //p += (sin(p.x) * sin(p.y)) * p;
                    //d = distance(p, 0);

                    // !!! Ekle bunu --- cok cok iyi v2
                    //p -= (sin(p.x) * sin(p.y)) * p;
                    //d = distance(p, 0);

                    // !! Ekle bunu --- circle voronoi
                    // p += sin(sin(p.x) * sin(p.y)) * p*1.21;
                    // d = distance(p, 0); // v1
                    // d = length(p+p) - distance(p,0); // v2
                    
                    // !! Ekle bunu --- circle voronoi radius ayarli
                    // radius = 1.4;
                    // p += sin(sin(p.x/radius) * sin(p.y/radius)) * p * 1.21;
                    // d = length(p+p) - distance(p,sin(p.x) * sin(p.y));

                    //float2 p = ((offs + coeff) + sin(n * t) * 0.4);
*/
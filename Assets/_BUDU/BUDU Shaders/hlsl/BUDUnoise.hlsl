// null

const int res = 50;
const int frequencies = 30;
const float speed = 0.05;
const float depth = 0.05;
const float brightness = 0.25;
const int limit = 10;

// texture getir
//const float txtr = 1.0;

//const float resf = float(res);
//const float ds = 1./float(res);

//const float ds = 0.01;

const float ds = 1./100.;

//compress texture 
#define COMPRESS

float cross2(float2 v1, float2 v2)
{
    return v1.x * v2.y - v1.y * v2.x;
}

bool right(float2 p1, float2 p2, float2 pnt)
{
    return cross2(p2-p1, pnt-p1) < 0.;
}

float2 hash2(float2 p)
{
    p = float2( dot(p, float2(127.1, 311.7)), dot(p, float2(269.5,183.3)) );
    return frac(sin(p)*43758.5453);
}

float2 refractPt(float uv, float2 pt, float3 txtr)
{
    uv = float2(pt) * ds;
    return float2(pt) * ds + (txtr * uv) * depth;
}

float area(float2 p1, float2 p2, float2 p3)
{
    return abs(cross2(p2-p1, p3-p1) / 2.);
}


void caustic_float(float uv, float3 txtr, out float3 caustic )
{
    float2 bottomPt = uv / 1;
    float2 uv0 = float2(bottomPt * uv);
    float a = .1;

    for(int i=-limit; i<=limit; i++)
    {
        for(int j=-limit; j<=limit; j++) 
        {
            uv = uv0 + float2(i,j);

            float2 r11 = refractPt(uv, uv + float2(0,0), txtr);
            float2 r12 = refractPt(uv, uv + float2(0,1), txtr);
            if(right(r11, r12, bottomPt))
            {
                float2 r22 = refractPt(uv, uv + float2(1,1), txtr);
                if(right(r12, r22, bottomPt))
                {
                    float2 r21 = refractPt(uv, uv + float2(1,0), txtr);
                    if(right(r22, r21, bottomPt)
                        && right(r21, r11, bottomPt)
                        )
                    {
                        float a2 = area(r11, r12, r22) + area(r12, r22, r21);
                        a += (ds*ds/a2 * brightness);
                        //a += 0.4;
                    }
                }
            }
        }
    }

    float3 col = float3(0.078, 0.408, 0.592);  //from https://github.com/terryspitz/Pool/blob/master/pool.jpg
    col = lerp(col, float3(0.60, 1., 1.), min(a, 1.));
    caustic = col;// txtr.xyz;
}


// BUDU test

const int res = 50;
const int frequencies = 30;
const float speed = 0.05;
const float depth = 0.05;
const float brightness = 0.25;
const int limit = 10;

const float resf = float(50);
const float ds = 1 / float(50);

float cross2(float2 v1, float2 v2)
{
    return v1.x*v2.y - v1.y * v1.y*v2.x;
}

//checks point is to the 'right' of line from p1 to p2
bool right(float2 p1, float2 p2, float2 pnt)
{
    return cross2(p2 - p1, pnt - p1) < 0.0;
}

float2 hash2(float2  p)
{
    p = float2( dot(p,float2(127.1,311.7)), dot(p,float2(269.5,183.3)) );
    return frac(sin(p)*43758.5453); 
}

float2 refractPt(float2 pt, UnityTexture2D iChannel0, UnitySamplerState us, float2 uv)
{
    //return pt + clamp(texture(iChannel0, pt).xy,-1.,1.) * 1e-5;
    #ifdef COMPRESS
        float2 texpt = float2(pt + float2(limit, limit));
    #else
        float2 texpt = float2(pt) * ds;
    #endif
    return float2(pt) * ds + SAMPLE_TEXTURE2D(iChannel0, us, uv) * depth;
}

//calculate area of triangle p1, p2, p3
float area(float2 p1, float2 p2, float2 p3)
{
    return abs(cross2(p2-p1, p3-p1) / 2.);
}

void caustic_float(UnityTexture2D iChannel0, UnitySamplerState us, float2 uv, out float output)
{
    float4 fragColor;

    #ifdef SHOW_TEXTURE
	    float2 bottomPt = uv; // fragCoord.xy;
        fragColor = SAMPLE_TEXTURE2D(iChannel0, us, uv) + float4(0.5,0.5,0.0,0.0);
    #else
	    float2 bottomPt = uv; // fragCoord.xy;
        float2 uv0 = float2(bottomPt * resf);
        float a = 0.1;
        float debugNum = -999.;
        for(int i=-limit; i<=limit; i++) 
        for(int j=-limit; j<=limit; j++) 
        {
            float2 uv = uv0 + float2(i,j);
            //if((uv%5).x < 1 || (uv%5).y < 1)
            //    continue;
            //refracted points
            float2 r11 = refractPt(uv + float2(0,0), SAMPLE_TEXTURE2D(iChannel0, us, uv), us, bottomPt);
            float2 r12 = refractPt(uv + float2(0,1), SAMPLE_TEXTURE2D(iChannel0, us, uv), us, bottomPt);
            if(right(r11, r12, bottomPt))
            {
                float2 r22 = refractPt(uv + float2(1,1), SAMPLE_TEXTURE2D(iChannel0, us, uv), us, bottomPt);
                if(right(r12, r22, bottomPt))
                {
                    float2 r21 = refractPt(uv + float2(1,0), SAMPLE_TEXTURE2D(iChannel0, us, uv), us, bottomPt);
                    if(right(r22, r21, bottomPt)
                        && right(r21, r11, bottomPt)
                        )
                    {
                        float a2 = area(r11, r12, r22) + area(r12, r22, r21);
                        a += ds*ds/a2 * brightness;
                        //a += 0.4;
                    }
                }
            }
        }
        float3 col = float3(0.078, 0.408, 0.592);  //from https://github.com/terryspitz/Pool/blob/master/pool.jpg
        col = lerp(col, float3(0.60, 1., 1.), min(a, 1.));
        fragColor = float4(col, 1.);
    #endif

    output = col;//SAMPLE_TEXTURE2D(iChannel0, us, uv);
}


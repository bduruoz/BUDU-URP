// BUDU Games 2024 
// Billow Noise

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"
#include "Assets/_Main/Shaders/hlsl/Functions/Functions.hlsl"

float billow_calc(float2 xy, float2 period, float alpha, float seed, float i, out float2 result)
{
	float2 uv = float2(xy.x + xy.y * 0.5, xy.y);
	float2 i0 = floor(uv);
	float2 f0 = frac(uv);

	float cmp = step(f0.y, f0.x);
	
	float2 o1 = float2(cmp, 1.0 - cmp);
	
	float2 i1 = i0 + o1;
	float2 i2 = i0 + 1.0;

	float2 v0 = float2(i0.x - i0.y * 0.5, i0.y);
	float2 v1 = float2(v0.x + o1.x - o1.y * 0.5, v0.y + o1.y);
	float2 v2 = float2(v0.x + 0.5, v0.y + 1.0);

	float2 x0 = xy - v0;
	float2 x1 = xy - v1;
	float2 x2 = xy - v2;

	float3 iu;
	float3 iv;
	float3 xw;
	float3 yw;

	if(any(period > float2(0,0)))
	{
		xw = float3(v0.x, v1.x, v2.x);
		yw = float3(v0.y, v1.y, v2.y);
		if(period.x > 0.0)
			xw = fmod(float3(v0.x, v1.x, v2.x), period.x);
		if(period.y > 0.0)
			yw = fmod(float3(v0.y, v1.y , v2.y), period.y);
		iu = floor(xw + 0.5 * yw + 0.5);
		iv = floor(yw + 0.5);
	} else {
		iu = float3(i0.x, i1.x, i2.x); iv = float3(i0.y, i1.y, i2.y);
	}

	float sd = seed * 412.234;
	float3 hash = fmod(iu, 289.0 + sd);
	hash = fmod((hash * 51.0 + 2.0) * hash + iv, 289.0 + (sd/2));
	hash = fmod((hash * 34.0 + 10.0) * hash, 289.0 + (sd/4));
	float3 psi = hash * 0.07482 + alpha;

	float3 gx = sin(psi / 2); 
	float3 gy = cos(psi);

	float2 g0 = float2(gx.x, gy.x);
	float2 g1 = float2(gx.y, gy.y);
	float2 g2 = float2(gx.z, gy.z);

	float3 w = 0.8 - float3(dot(x0, x0), dot(x1, x1), dot(x2, x2));
	w = max(w, 0.0); 
	float3 w2 = w * w; 
	float3 w4 = w2 * w2;

	float3 gdotx = float3(dot(g0, x0), dot(g1, x1), dot(g2, x2));

	float n = dot(w4, gdotx);
	float3 w3 = w * w2; 

	float3 dw = -8.0 * w3 * gdotx;

	float2 dn0 = (w4.x * g0 + dw.x * x0);
	float2 dn1 = (w4.y * g1 + dw.y * x1);
	float2 dn2 = (w4.z * g2 + dw.z * x2);

	result = 10.9 * (dn0 + dn1 + dn2);

	//return expSustainedImpulse(10.9 * n, -1, 1); // baya yakin caustic'e
	//return cubicPulse(10.9 * n, -1, 1); // yakin caustic'e
	//return opXor(10.9 * n, i); // yakin caustic'e
	// return sin(x + sin(x + sin(x))*3) * (log10(x)) * (cosh(x)+1); mapping
	//return smoothstep(0.9,1,-sqrt(x)+1); // flame oldu


	float x = 10.9 * n; 
	//x = expSustainedImpulse(x,-1,1);
	//x = cubicPulse(x,-1,1);
	//x = opXor(x, i);
	//x = -sqrt(x*5)+0.5;

	return x;
}

void billow_float(
	float2 uv, 
	float time, 
	float octave, 
	float freq, 
	float freqM,
	float amp, 
	float ampM,
	float ior,
	float2 period,
	float2 translate,
	float seed,
	out float output)
{
    float n = 0.0;
    float2 g;
	float2 gsum = float2(translate.x, translate.y);
	
	if(octave > 8) octave = 8;
	if(octave < 1) octave = 1;

    for (int i=0; i<(int)octave; i++)
	{
        n += amp * billow_calc(
			uv * freq + gsum * ior, 
			float2(period.x, period.y), 
			0.5 * freq * ((time/freq) * 4), 
			seed,
			i,
			g
			);

        gsum += g * amp;
        freq *= freqM;
        amp *= ampM;
    }
    output = n * 0.35 + 0.5;
}

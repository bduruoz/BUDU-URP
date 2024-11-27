// BUDU Games 2024
// Wireframe Shader WIP

#ifndef WIREFRAMESHADER
#define WIREFRAMESHADER

#define WSNLength(x, y, z) length(cross(x - y, x - z))
#define WSSmooth(x) x = saturate(x * x * (3 - 2 * x));
#define WSMin(f) min(f.x, min(f.y,f.z))

float fwidth(float val)
{
    return abs(ddx(val)) + abs(ddy(val));
}
float3 fwidth(float3 val)
{
    return abs(ddx(val) + abs(ddy(val)));
}

void ReadWireFrame_float(float3 uv, float thickness, float smoothness, out float result)
{
    float3 fWidth = fwidth(uv);
    float3 width = uv - thickness;

    float3 df1 = smoothstep(0, fWidth, width);
    float w1 = WSMin(df1);

    float3 df2 = width / (fWidth * (1 + smoothness * 3) + 0.000001); // 1e-6
    float w2 = smoothstep(0.0, 1.0, WSMin(df2) + 0.5);
    w2 *= w2;

    result = 1 - lerp(w1,w2,smoothness);
}




















#endif

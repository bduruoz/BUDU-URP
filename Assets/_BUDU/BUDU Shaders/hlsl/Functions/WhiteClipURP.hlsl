#ifndef BUDU_WHITE_CLIP_URP
#define BUDU_WHITE_CLIP_URP

float4 _Color;
float4 _ClipRect;   // x=minX, y=minY, z=maxX, w=maxY (NDC -1..1)

void BUDU_ClipFloat(float4 positionHCS)
{
    float2 ndc = positionHCS.xy / positionHCS.w;
    if (ndc.x < _ClipRect.x || ndc.x > _ClipRect.z ||
        ndc.y < _ClipRect.y || ndc.y > _ClipRect.w)
        discard;
}

#endif // BUDU_WHITE_CLIP_URP
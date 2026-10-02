// © BUDU Games 2024 - 2026
// Normal From Height

#ifndef NORMAL_FROM_HEIGHT_FIX_INCLUDED
#define NORMAL_FROM_HEIGHT_FIX_INCLUDED

// Internal fonksiyon (float olarak çalışır)
void BUDUNormalFromHeight_Internal(
    float In,               // Height değeri (float noise)
    float Strength,         // Normal kuvveti
    float3 ObjectNormal,    // Mesh'in objeye göre normal vektörü
    float3 ObjectTangent,   // Objeye göre tangent
    float3 ObjectBitangent, // Objeye göre bitangent
    out float3 Out)
{
    // Height gradient
    float dHdx = ddx(In);
    float dHdy = ddy(In);

    // Türevleri tangent-space yönleriyle birleştir
    float3 surfGrad = dHdx * ObjectTangent + dHdy * ObjectBitangent;

    // Normal map oluştur
    float3 n = normalize(ObjectNormal - Strength * surfGrad) + float3(0, 0, 2);

    // Çıkışı ver
    Out = n;
}

// Float versiyonu
void BUDUNormalFromHeight_float(
    float In,
    float Strength,
    float3 ObjectNormal,
    float3 ObjectTangent,
    float3 ObjectBitangent,
    out float3 Out)
{
    BUDUNormalFromHeight_Internal(In, Strength, ObjectNormal, ObjectTangent, ObjectBitangent, Out);
}

// Half versiyonu
void BUDUNormalFromHeight_half(
    half In,
    half Strength,
    half3 ObjectNormal,
    half3 ObjectTangent,
    half3 ObjectBitangent,
    out half3 Out)
{
    float3 temp;
    BUDUNormalFromHeight_Internal((float)In, (float)Strength, (float3)ObjectNormal,(float3)ObjectTangent, (float3)ObjectBitangent, temp);
    Out = (half3)temp;
}

#endif

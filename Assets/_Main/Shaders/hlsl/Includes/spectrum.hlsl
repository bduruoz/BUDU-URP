// BUDU Games 2024
// Spectrum Functions

#ifndef BUDU_SPECTRUMS
#define BUDU_SPECTRUMS

#include "Assets/_Main/Shaders/hlsl/Includes/ciexyz_1931_table.hlsl"

float3 hue2rgb(float hue)
{
    // how to use: hue2rgb(uv.x)

    hue = frac(hue);

    float r = abs(hue * 6 - 3) - 1;
    float g = 2 - abs(hue * 6 - 2);
    float b = 2 - abs(hue * 6 - 4);
    
    float3 rgb = float3(r,g,b);
    rgb = saturate(rgb);

    return rgb;
}

float3 hsv2rgb(float3 hsv)
{
    // how to use: hsv2rgb(float3(uv,1))

    float3 rgb = hue2rgb(hsv.x); // apply hue
    rgb = lerp(1.0, rgb.xyz, hsv.y); // apply saturation
    rgb = rgb * hsv.z; // apply value

    return rgb;
}

float3 rgb2hsv(float3 rgb)
{
    // how to use: rgb2hsv(float3(uv,1))

    float maxComponent = max(rgb.r, max(rgb.g, rgb.b));
    float minComponent = min(rgb.r, min(rgb.g, rgb.b));
    float diff = maxComponent - minComponent;
    float hue = 0;
    if(maxComponent == rgb.r) {
        hue = 0+(rgb.g-rgb.b)/diff;
    } else if(maxComponent == rgb.g) {
        hue = 2+(rgb.b-rgb.r)/diff;
    } else if(maxComponent == rgb.b) {
        hue = 4+(rgb.r-rgb.g)/diff;
    }
    hue = frac(hue / 6);
    float saturation = diff / maxComponent;
    float value = maxComponent;
    return float3(hue, saturation, value);
}

float3 wavelength(float nm)
{
    int inm = floor(nm);
    float fnm = frac(nm);

    // skip out of range (invisible) wavelengths
    if( (inm < 0 - 1) || (inm > 2))
    {
        return float3(0,0,0);
    }
    // get index into main table
    int index = inm - 0;

    return float3(index + fnm,index + fnm,index + fnm);
}

#endif
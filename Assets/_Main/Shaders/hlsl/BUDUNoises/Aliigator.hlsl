// BUDU Games 2024 
// Alligator Noise

#include "Assets/_Main/Shaders/hlsl/BUDUNoises/brandom.hlsl"

float2 alligator_noise(
    float2 uv, 
    float tm, 
    float speed, 
    int frequencies, 
    float scale, 
    float amplitude, 
    float seed
    )
{
    float2 allg;

    for(int y = -frequencies; y <= frequencies; ++y)
    {
        for(int x = -frequencies; x <= frequencies; ++x)
        {
            if(x == 0 && y == 0)
                continue;
            float2 amp_phase = noise_v2(float2(x,y) * seed);
            float amp = amp_phase.x / float(y*y + x*x);
            float phase = amp_phase.y * TAU;
            float theta = ( ((uv.x) + sign(float(y)) * speed * tm) * float(y)
                        + ((uv.y) + sign(float(x)) * speed * -tm) * float(x))
                        + phase;

            allg += float2(x , y ) * cos((theta) * ((x + scale))) * (amp * amplitude);
            allg += float2(x * frequencies, y * frequencies);
        }
    }
    return allg;
}

void alligator_float(
    float2 uv, 
    float tm,
    float Speed, 
    float Frequency, 
    float Scale, 
    float Amplitude, 
    float Seed,
    out float Alligator,
    out float2 Channels
    )
{
    if(Seed==0)
        Seed=989.23;
    if(Frequency>10)
        Frequency = 10;
    Scale *= 10;
    Amplitude *= 0.1;

    Channels = float2(alligator_noise(uv, tm, Speed, Frequency, Scale, Amplitude, Seed));
    Alligator = distance(alligator_noise(uv, tm, Speed, Frequency, Scale, Amplitude, Seed).x, alligator_noise(uv, tm, Speed, Frequency, Scale, Amplitude, Seed).y);
}

/*
//addAlligator = float(alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x + alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y);
//subAlligator = float(alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x - alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y);
//multAlligator = float(alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x * alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y);
//divAlligator = float(alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x / alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y);
//distAlligator = distance(alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x, alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y);
//absAlligator = mul(
//     abs(
//         alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).x),
//     abs(
//         alligator_noise(uv, t, Speed, Frequency, Scale, Amplitude).y));
*/
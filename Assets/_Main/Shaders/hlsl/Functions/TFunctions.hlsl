// BUDU Games - Trigonometric Functions
// Not Used in RainDrop

#define PI          3.14159265359
#define TAU         6.28318530718

void drop_float(float t, out float outTime)
{
    outTime = -sin(t + sin(t + sin(t) * 0.5)) * 0.45;
}

void wiggle_float(float w, out float outTime)
{
    outTime = sin(3 * w) * pow(sin(w), 6) * 0.45;
}

void wiggle2_float(float w, out float outTime)
{
    outTime = (sin(w*1.5 + sin(w*2.1 + sin(w*3.2))) * pow(sin(w * 0.5), 5)) * 0.45;
}

void wiggle3_float(float w, out float outTime)
{
    outTime = (sin(w*1.5 + sin(w*2 + cos(w*3))) * pow(sin(w * 1.3), 4)) * 0.45;
}

void sinus_float(float t, out float outTime)
{
    outTime = sin(t);
}


// BUDU Games - Trigonometric Functions

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


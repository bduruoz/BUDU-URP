// BUDU Games 2024
// Math Functions

#ifndef BUDU_MATH_FUNCTIONS
#define BUDU_MATH_FUNCTIONS

void sqrtx_float(bool negative, float input, float tm, out float output)
{
    float result = input;
    if(negative)
    {
        result = 1-input;
    }

    for(int i=0;i<tm;i++)
    {
        result = sqrt(result);
    }
            
    output = result;

    if(negative)
    {
        output = 1-result;
    }
}

#endif



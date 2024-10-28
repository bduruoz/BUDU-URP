// BUDU Games - Functions
#ifndef BUDU_FUNCTIONS
#define BUDU_FUNCTIONS

#define PI          3.14159265359
#define TAU         6.28318530718

float repeated(float3 p, float s)
{
    float3 id = round(p/s);
    float2 r = p - s * id;
    return r;
}

/////////////////////////////////////////////
// https://iquilezles.org/articles/functions/
float almostIdentity( float x, float m, float n )
{
    if( x>m ) return x;
    float a = 2.0*n - m;
    float b = 2.0*m - 3.0*n;
    float t = x/m;
    return (a*t + b)*t*t + n;
}

float almostIdentity2( float x, float n )
{
    return sqrt(x*x+n*n);
}

float integralSmoothstep( float x, float T )
{
    if( x>T ) return x - T/2.0;
    return x*x*x*(1.0-x*0.5/T)/T/T;
}

float expImpulse( float x, float k )
{
    float h = k*x;
    return h*exp(1.0-h);
}

float quaImpulse( float x, float k )
{
    return 2.0*sqrt(k)*x/(1.0+k*x*x);
}

float polyImpulse(float x, float n, float k )
{
    return (n/(n-1.0))*
           pow((n-1.0)*k,1.0/n)*
           x/(1.0+k*pow(x,n));
}

float expSustainedImpulse( float x, float f, float k )
{
    float s = max(x-f,0.0);
    return min( x*x/(f*f), 1.0+(2.0/f)*s*exp(-k*s));
}

float sinc(float x, float k)
{
    float a = PI*(k*x-1.0);
    return sin(a)/a;
}

float trunc_fallof( float x, float m )
{
    x /= m;
    return (x-2.0)*x+1.0;
}

float almostUnitIdentity( float x )
{
    return x*x*(2.0-x);
}

float gain( float x, float k ) 
{
    float a = 0.5*pow(2.0*((x<0.5)?x:1.0-x), k);
    return (x<0.5)?a:1.0-a;
}

float parabola( float x, float k )
{
    return pow( 4.0*x*(1.0-x), k );
}

float pcurve( float x, float a, float b )
{
    float k = pow(a+b,a+b)/(pow(a,a)*pow(b,b));
    return k*pow(x,a)*pow(1.0-x,b);
}

float tone( float x, float k )
{
    return (k+1.0)/(1.0+k*x);
}

float cubicPulse( float x, float c, float w )
{
    x = abs(x - c);
    if( x>w ) return 0.0;
    x /= w;
    return 1.0 - x*x*(3.0-2.0*x);
}

float rationalBump( float x, float k )
{
    return 1.0/(1.0+k*x*x);
}

float expStep( float x, float n )
{
    return exp2( -exp2(n)*pow(x,n) );
}

////////////////////////////////////////////////
// https://iquilezles.org/articles/smoothsteps/

// Polynominals
float cubicSmoothstep( float x )
{
  return x*x*(3.0-2.0*x);
}

float inv_cubicSmoothstep( float x )
{
  return 0.5-sin(asin(1.0-2.0*x)/3.0);
}

float quarticSmoothstep( float x )
{
  return x*x*(2.0-x*x);
}

float inv_quarticSmoothstep( float x )
{
  return sqrt(1.0-sqrt(1.0-x));
}

float quinticSmoothstep( float x )
{
  return x*x*x*(x*(x*6.0-15.0)+10.0);
}

// Rationals
float quadraticRSmoothstep( float x )
{
  return x*x/(2.0*x*x-2.0*x+1.0);
}

float inv_quadraticRSmoothstep( float x )
{
  return (x-sqrt(x*(1.0-x)))/(2.0*x-1.0);
}

float cubicRSmoothstep( float x )
{
  return x*x*x/(3.0*x*x-3.0*x+1.0);
}

float inv_cubicRSmoothstep( float x )
{
  float a = pow(    x,1.0/3.0);
  float b = pow(1.0-x,1.0/3.0);
  return a/(a+b);
}

float inv_cubicRSmoothstep2( float x )// alternative
{
  float w=2.0*sqrt(x*(1.0-x));
  float t=(x*(3.0-2.0*x)-1.0)/(w*(1.0-x));
  return x-w*sinh(sinh(t)/3.0);
}

float rationalSmoothstep( float x, float n )
{
  return pow(x,n)/(pow(x,n)+pow(1.0-x,n));
}

float inv_rationalSmoothstep( float x, float n )
{
  return rationalSmoothstep( x, 1.0/n );
}

// Piecewise
float pwQuadSmoothstep( float x )
{
  return (x<0.5) ?
  2.0*x*x: 
  2.0*x*(2.0-x)-1.0;
}

float inv_pwQuadSmoothstep( float x )
{
  return (x<0.5) ?
  sqrt(0.5*x):
  1.0-sqrt(0.5-0.5*x);
}

float pwPolySmoothstep( float x, float n )
{
  return (x<0.5) ?
      0.5*pow(2.0*     x,  n):
  1.0-0.5*pow(2.0*(1.0-x), n);
}

float inv_pwPolySmoothstep( float x, float n )
{
  return (x<0.5) ? 
      0.5*pow(2.0*     x, 1.0/n):
  1.0-0.5*pow(2.0*(1.0-x),1.0/n);
}

float triSmoothstep( float x )
{
  return 0.5-0.5*cos(PI*x);
}

float inv_triSmoothstep( float x )
{
  return acos(1.0-2.0*x)/PI;
}

/////////////////////////////////////////////

float opXor( float a, float b )
{
    return max( min(a,b), -max(a,b) );
}

float xor(float a, float b)
{
    return max(-max(-a,-b), min(-a,-b));
}

/////////////////////////////////////////////










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

#endif

// BUDU Games 2024
// Color Ramps

#include "Assets/_Main/Shaders/hlsl/Includes/constants.hlsl"
#include "Assets/_Main/Shaders/hlsl/Includes/spectrum.hlsl"

// Thin film from http://markkness.net/colorpy/ColorPy.html

//float field_reflection_coefficient(float n1, float n2)
//{
    /// Calculate the reflection coefficient for a light wave traveling from
    /// a region with index of refraction n1 to one having an index of n2.
    /// This is the coefficient for the electric field, not the intensity.
//    return ( (n1 - n2) / (n1 + n2) );
//}

//float get_interference_reflection_coefficient (self, wl_nm, toothick)
//{
    /// Get the reflection coefficient for the intensity for light
    /// of the given wavelength impinging on the film.
        
    //if (too_thick)
    //{
        /// would alias - 
        /// if the layer is too thick, the cos() factor is averaged over multiple periods
        /// to zero, this is the best we can do
            
        //return R12sqd_plus_R23sqd;
    //}

    /// small-reflection approximation
    /// R = self.R12sqd_plus_R23sqd + self.R12_times_R23_times_2 * math.cos (self.phase_factor / wl_nm)
    /// return R
        
    /// exact - accounts for multiple reflections, and does not assume a small
    /// reflection coefficient.  Should be correct for complex n1,n2,n3 as well.
    
    //phase = cmath.exp (complex (0, 1.0) * (self.phase_factor / wl_nm))
    //num   = self.R12 + self.R23 * phase
    //den   = 1.0 + self.R12 * self.R23 * phase
    //Re    = num / den
    //R     = Re.real*Re.real + Re.imag*Re.imag
    //return R

//}

// float reflection_spectrum()
// {
    /// Get the reflection spectrum (independent of illuminant) for the thin film.'''
    //spectrum = ciexyz.empty_spectrum()
    //(num_rows, num_cols) = spectrum.shape
    //for i in xrange (0, num_rows):
    //    wl_nm = spectrum [i][0]
    //    spectrum [i][1] = self.get_interference_reflection_coefficient (wl_nm)
    //return spectrum
// }

//float thinFilm_calc(float n1, float n2, float n3, float thickness_nm)
//{
//    /// R12 = field reflection coefficient for light traveling from region 1 to 2
//	/// R23 = field reflection coefficient for light traveling from region 2 to 3

//    float R12 = field_reflection_coefficient(n1, n2);
//    float R23 = field_reflection_coefficient(n2, n3);
//    bool too_thick = FALSE;

//    float R12sqd_plus_R23sqd = R12 * R12 + R23 * R23;
//    float R12_times_R23_time2 = 2.0 * R12 * R23;
//    float phase_factor = -2.0 * thickness_nm * 2.0 * PI * n2;

//    /// aliasing will occur if the layer is too thick - see if this is true
//    float sample_interval_nm = 1.0; /// assuming 1 nm
//    float wavelength_0_nm = 380.0; /// shortest wl results in minimum max_thickness
//    float max_thickness_nm = 0.25 * pow(wavelength_0_nm, 2) / (n2 * sample_interval_nm);
//    if (thickness_nm > max_thickness_nm) too_thick = TRUE;

//    if(too_thick == TRUE)
//    {
//        ///
//    }

//    return 0;
//}

//////////////////////////////////////////////////////////////////////////////////////////////////

void iridescent_float(float2 uv, out float3 irRampU, out float3 irRampV)
{
    // shadertoydan
    //float3 c1 = float3(sin(uv.x  * float3(0.987,0.765,0.543) * PI * 20.4));
    //float3 c2 = float3(sin(uv.x * float3(0.13 * 1.0, 0.865 * 1.0, 0.943 * 1.0) * 6.664));
    //irRamp = c1;
    //irRamp = c2;

    //irRampU = hsv2rgb(float3(uv,1));
    //irRampU = rgb2hsv(float3(uv,1));

    //irRampU = hue2rgb(uv.x);
    
    float4 res = 0;
    
    for (int i = 0; i < 471; i++)
    {
        res = uv.x * ciexyz1931table(i);
    }
    
    
    //irRampU = wavelength(uv.x);
    irRampU = res;

    irRampV = 0;
}


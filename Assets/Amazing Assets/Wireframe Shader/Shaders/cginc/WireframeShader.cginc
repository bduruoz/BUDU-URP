// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>
 
#ifndef WIREFRAME_SHADER_CGINC
#define WIREFRAME_SHADER_CGINC


#define WireframeShaderNormalLength(a,b,c) length(cross(a - b, a - c))
#define WireframeShaderMaskSmooth(x) x = saturate(x * x * (3 - 2 * x));
#define WireframeShaderMin(f) min(f.x, min(f.y, f.z))


float WireframeShaderReadTriangleMassFromUV(float3 uv, float thickness, float smoothness)
{
	float3 fWidth = fwidth(uv);
	float3 width = uv - thickness.xxx;

	float3 df1 = smoothstep(0, fWidth, width);	
	float w1 = WireframeShaderMin(df1);

	float3 df2 = width / (fWidth * (1 + smoothness * 3) + 1e-6);
	float w2 = smoothstep(0.0, 1.0, WireframeShaderMin(df2) + 0.5);
	w2 *= w2;
    

	return 1 - lerp(w1, w2, smoothness);
}

void WireframeShaderCalculateTriangleMass(float3 vertex1, float3 vertex2, float3 vertex3, out float3 mass1, out float3 mass2, out float3 mass3)
{
	#if defined(WIREFRAME_NORMALIZE_EDGES_ON)

		float d1 = distance(vertex1, vertex2);
		float d2 = distance(vertex2, vertex3);
		float d3 = distance(vertex3,  vertex1);		

		float4 b = float4(0, 
		                  WireframeShaderNormalLength(vertex3, vertex1, vertex2) / d1, 
						  WireframeShaderNormalLength(vertex1, vertex2, vertex3) / d2, 
						  WireframeShaderNormalLength(vertex2, vertex1, vertex3) / d3);
		b /= min(b.y, min(b.z, b.w));


		mass1 = b.xzx;
		mass2 = b.xxw;
		mass3 = b.yxx;

		#ifdef WIREFRAME_TRY_QUAD_ON
			
			mass1.x = ((d1 > d2) && (d1 > d3)) ? 10000 : 0;
			mass1.z = ((d3 >= d1) && (d3 > d2)) ? 10000 : 0;
			mass2.y = ((d2 >= d1) && (d2 >= d3)) ? 10000 : 0;

		#endif

	#else

		#if defined(WIREFRAME_TRY_QUAD_ON)

			float d1 = distance(vertex1, vertex2);
			float d2 = distance(vertex2, vertex3);
			float d3 = distance(vertex3, vertex1);

			float3 offset = 0;
			if (d1 > d2 && d1 > d3)
				offset.y = 1;
			else if (d2 > d3 && d2 > d1)
				offset.x = 1;
			else
				offset.z = 1;
			
			mass1 = float3(1, 0, 0) + offset;
			mass2 = float3(0, 0, 1) + offset;
			mass3 = float3(0, 1, 0) + offset;

		#else

			mass1 = float3(1, 0, 0);
			mass2 = float3(0, 1, 0);
			mass3 = float3(0, 0, 1);

		#endif

	#endif
}

float WireframeShaderMaskPlane(float3 planePosition, float3 planeNormal, float3 vertexPositionWS, float edgeFalloff, float invert)
{
	float edge = dot(planeNormal, (vertexPositionWS - planePosition));

    edge = saturate(edge / max(0.01, edgeFalloff) * lerp(1, -1, invert));


    //WireframeShaderMaskSmooth(edge);

    return edge;
}

float WireframeShaderMaskSphere(float3 spherePosition, float sphereRadius, float3 vertexPositionWS, float edgeFalloff, float invert)
{
	float d = distance(vertexPositionWS, spherePosition);

    edgeFalloff = max(0.01, edgeFalloff);
    float offset = lerp(0, edgeFalloff, invert);

    float edge = saturate(max(0, d - offset - sphereRadius + edgeFalloff) / edgeFalloff);
                        

    //WireframeShaderMaskSmooth(edge);

    return lerp(1- edge, edge, invert);
}

float WireframeShaderMaskBox(float4x4 boxTRS, float3 boundingBox, float3 vertexPositionWS, float edgeFalloff, float invert)
{
	float3 vertexInverseTransform = mul(boxTRS, float4(vertexPositionWS, 1)).xyz;

    edgeFalloff = max(0.01, edgeFalloff);
    float offset = lerp(0, edgeFalloff, invert);

	float3 boundsMin = boundingBox - offset.xxx;
    float3 boundsMax = boundsMin * -1;
 
	float3 s = smoothstep(boundsMin, boundsMin + edgeFalloff, vertexInverseTransform) - 
	           smoothstep(boundsMax - edgeFalloff, boundsMax, vertexInverseTransform);

	float edge = (s.x * s.y * s.z);


    //WireframeShaderMaskSmooth(edge);

	return lerp(edge, 1 - edge, invert);
}

float WireframeShaderDistanceFade(float3 cameraPositionWS, float3 vertexPositionWS, float startDistance, float endDistance)
{
	float distanceToCamera = distance(cameraPositionWS, vertexPositionWS);

	float distanceFade = (endDistance - distanceToCamera) / (endDistance - startDistance); 

	return saturate(distanceFade);
}




//Unity Shader Graph///////////////////////////////////////////////////////////////////////////////////
void WireframeShaderReadTriangleMassFromUV_float(float3 uv, float thickness, float smoothness, out float value)
{
	value = WireframeShaderReadTriangleMassFromUV(uv, thickness, smoothness);
}

void WireframeShaderReadTriangleMassFromUV_half(half3 uv,  half thickness, half smoothness, out half value)
{
	value = WireframeShaderReadTriangleMassFromUV(uv, thickness, smoothness);
}

void WireframeShaderMaskPlane_float(float3 planePosition, float3 planeNormal, float3 vertexPositionWS, float edgeFalloff, float invert, out float value)
{
	value = WireframeShaderMaskPlane(planePosition, planeNormal, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderMaskPlane_half(half3 planePosition, half3 planeNormal, half3 vertexPositionWS, half edgeFalloff, half invert, out half value)
{
	value = WireframeShaderMaskPlane(planePosition, planeNormal, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderMaskSphere_float(float3 spherePosition, float sphereRadius, float3 vertexPositionWS, float edgeFalloff, float invert, out float value)
{
	value = WireframeShaderMaskSphere(spherePosition, sphereRadius, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderMaskSphere_half(half3 spherePosition, half sphereRadius, half3 vertexPositionWS, half edgeFalloff, half invert, out half value)
{
	value = WireframeShaderMaskSphere(spherePosition, sphereRadius, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderMaskBox_float(float4x4 boxTRS, float3 boundingBox, float3 vertexPositionWS, float edgeFalloff, float invert, out float value)
{
	value = WireframeShaderMaskBox(boxTRS, boundingBox, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderMaskBox_half(half4x4 boxTRS, half3 boundingBox, half3 vertexPositionWS, half edgeFalloff, half invert, out half value)
{
	value = WireframeShaderMaskBox(boxTRS, boundingBox, vertexPositionWS, edgeFalloff, invert);
}

void WireframeShaderDistanceFade_float(float3 cameraPositionWS, float3 vertexPositionWS, float startDistance, float endDistance, out float value)
{
	value = WireframeShaderDistanceFade(cameraPositionWS, vertexPositionWS, startDistance, endDistance);
}

void WireframeShaderDistanceFade_half(half3 cameraPositionWS, half3 vertexPositionWS, half startDistance, half endDistance, out half value)
{
	value = WireframeShaderDistanceFade(cameraPositionWS, vertexPositionWS, startDistance, endDistance);
}

#endif

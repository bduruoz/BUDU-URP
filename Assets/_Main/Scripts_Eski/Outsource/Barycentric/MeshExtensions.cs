/// <summary>
/// Mesh extension methods.
///
/// Based on code from http://answers.unity3d.com/answers/613726/view.html
/// Adapted for use with submeshes and optimized by Eliot Lash.
///
/// Copyright (c) 2015 Eliot Lash
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.
/// </summary>
using UnityEngine;

namespace com.eliotlash.core.util {
	static class MeshExtensions {
		public const int ENTIRE_MESH = -1;

		/// <summary>
		/// Picks a random point on a mesh.
		/// This requires a lot of expensive setup so don't call in a tight loop.
		/// Instead, call the one that returns an array with the # of random points you want to pick.
		/// </summary>
		/// <returns>The random point.</returns>
		public static Vector3 PickRandomPoint(this Mesh mesh) {
			return PickRandomPoint(mesh, ENTIRE_MESH);
		}

		/// <summary>
		/// Picks a random point on a mesh.
		/// This requires a lot of expensive setup so don't call in a tight loop.
		/// Instead, call the one that returns an array with the # of random points you want to pick.
		/// </summary>
		/// <returns>The random point.</returns>
		/// <param name="submesh">Submesh index.</param>
		public static Vector3 PickRandomPoint(this Mesh mesh, int submesh) {
			return PickRandomPoints(mesh, submesh, 1)[0];
		}

		/// <summary>
		/// Picks a batch of random points on a mesh.
		/// Call this if you need more than one to avoid expensive overhead.
		/// </summary>
		/// <returns>The random points.</returns>
		/// <param name="submesh">Submesh index, or MeshExtensions.ENTIRE_MESH to use the entire mesh</param>
		/// <param name="numPoints">Number of random points to pick.</param>
		public static Vector3[] PickRandomPoints(this Mesh mesh, int submesh, int numPoints) {
			// 0 - Grab appropriate triangles array depending on if we're looking at the entire mesh or a submesh
			int[] triangles;
			if(ENTIRE_MESH == submesh) {
				triangles = mesh.triangles;
			} else {
				triangles = mesh.GetTriangles(submesh);
			}

			// 1 - Calculate Surface Areas
			float[] triangleSurfaceAreas = CalculateSurfaceAreas(mesh, ref triangles);
			
			// 2 - Normalize area weights
			float[] normalizedAreaWeights = NormalizeAreaWeights(ref triangleSurfaceAreas);
			

			Vector3[] randomPoints = new Vector3[numPoints];

			for (int i = 0; i < randomPoints.Length; ++i) {
				// 3 - Generate 'triangle selection' random #
				float triangleSelectionValue = Random.value;
				
				// 4 - Walk through the list of weights to select the proper triangle
				int triangleIndex = SelectRandomTriangle(ref normalizedAreaWeights, triangleSelectionValue);

				// 5 - Generate a random barycentric coordinate
				Barycentric3 randomBarycentricCoordinates = Barycentric3.Random();
				
				// 6 - Using the selected barycentric coordinate and the selected mesh triangle, in local space
				randomPoints[i] = ConvertToLocalSpace(randomBarycentricCoordinates, triangleIndex, mesh, ref triangles);
			}

			return randomPoints;
		}
		
		private static float[] CalculateSurfaceAreas(Mesh mesh, ref int[] triangles) {
			int triangleCount = triangles.Length / 3;
			
			float[] surfaceAreas = new float[triangleCount];
			
			
			for (int triangleIndex = 0; triangleIndex < triangleCount; triangleIndex++)
			{
				Vector3[] points = new Vector3[3];
				points[0] = mesh.vertices[triangles[triangleIndex * 3 + 0]];
				points[1] = mesh.vertices[triangles[triangleIndex * 3 + 1]];
				points[2] = mesh.vertices[triangles[triangleIndex * 3 + 2]];
				
				// calculate the three sidelengths and use those to determine the area of the triangle
				// http://www.wikihow.com/Sample/Area-of-a-Triangle-Side-Length
				float a = (points[0] - points[1]).magnitude;
				float b = (points[0] - points[2]).magnitude;
				float c = (points[1] - points[2]).magnitude;
				
				float s = (a + b + c) / 2;
				
				surfaceAreas[triangleIndex] = Mathf.Sqrt(s*(s - a)*(s - b)*(s - c));
			}
			
			return surfaceAreas;
		}
		
		private static float[] NormalizeAreaWeights(ref float[] surfaceAreas) {
			float[] normalizedAreaWeights = new float[surfaceAreas.Length];
			
			float totalSurfaceArea = 0;
			foreach (float surfaceArea in surfaceAreas)
			{
				totalSurfaceArea += surfaceArea;
			}
			
			for (int i = 0; i < normalizedAreaWeights.Length; i++)
			{
				normalizedAreaWeights[i] = surfaceAreas[i] / totalSurfaceArea;
			}
			
			return normalizedAreaWeights;
		}
		
		private static int SelectRandomTriangle(ref float[] normalizedAreaWeights, float triangleSelectionValue) {
			float accumulated = 0;
			
			for (int i = 0; i < normalizedAreaWeights.Length; i++)
			{
				accumulated += normalizedAreaWeights[i];
				
				if (accumulated >= triangleSelectionValue)
				{
					return i;
				}
			}
			
			// unless we were handed malformed normalizedAreaWeights, we should have returned from this already.
			throw new System.ArgumentException("Normalized Area Weights were not normalized properly, or triangle selection value was not [0, 1]");
		}
		
		private static Vector3 ConvertToLocalSpace(Barycentric3 barycentric, int triangleIndex, Mesh mesh, ref int[] triangles) {
			Vector3[] points = new Vector3[3];
			points[0] = mesh.vertices[triangles[triangleIndex * 3 + 0]];
			points[1] = mesh.vertices[triangles[triangleIndex * 3 + 1]];
			points[2] = mesh.vertices[triangles[triangleIndex * 3 + 2]];
			
			return (points[0] * barycentric.x + points[1] * barycentric.y + points[2] * barycentric.z);
		}
	}
}
/// <summary>
/// Wrapper/utility class for Vector3 that provides methods for manipulating Barycentric coordinates.
///
/// Uses math from http://answers.unity3d.com/answers/613726/view.html
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
	public struct Barycentric3
	{
		Vector3 vector;

		public float x { get { return vector.x; } set { vector.x = value; } }
		public float y { get { return vector.y; } set { vector.y = value; } }
		public float z { get { return vector.z; } set { vector.z = value; } }

		public float magnitude { get { return Magnitude(vector); } }

		public Barycentric3(Vector3 v) {
			vector = v;
		}

		public void Normalize() {
			Normalize(ref vector);
		}

		public static Barycentric3 Random() {
			return new Barycentric3(RandomVector());
		}

		public static Vector3 RandomVector() {
			Vector3 v = new Vector3(UnityEngine.Random.value, UnityEngine.Random.value, UnityEngine.Random.value);
			
			while (v == Vector3.zero)
			{
				// seems unlikely, but just in case...
				v = new Vector3(UnityEngine.Random.value, UnityEngine.Random.value, UnityEngine.Random.value);
			}

			Normalize(ref v);
			
			return v;
		}

		public static float Magnitude(Vector3 v) {
			return v.x + v.y + v.z;
		}

		public static void Normalize(ref Vector3 v) {
			// normalize the barycentric coordinates. These are normalized such that x + y + z = 1, as opposed to
			// normal vectors which are normalized such that Sqrt(x^2 + y^2 + z^2) = 1. See:
			// http://en.wikipedia.org/wiki/Barycentric_coordinate_system
			v /= Magnitude(v);
		}

	}
}


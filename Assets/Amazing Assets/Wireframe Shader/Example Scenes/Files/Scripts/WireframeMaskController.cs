// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.WireframeShader.Examples
{

    [ExecuteAlways]
    public class WireframeMaskController : MonoBehaviour
    {
        public enum MaskType { None, Plane, Sphere, Box }


        public MaskType maskType;
        public Transform maskObject;
        public Material[] materials;


        void Update()
        {
            if (maskObject != null && materials != null)
            {
                for (int i = 0; i < materials.Length; i++)
                {
                    if (materials[i] == null)
                        continue;

                    materials[i].DisableKeyword("WIREFRAME_DYNAMIC_MASK_PLANE");
                    materials[i].DisableKeyword("WIREFRAME_DYNAMIC_MASK_SPHERE");
                    materials[i].DisableKeyword("WIREFRAME_DYNAMIC_MASK_BOX");


                    switch (maskType)
                    {
                        case MaskType.Plane:
                            materials[i].EnableKeyword("WIREFRAME_DYNAMIC_MASK_PLANE");
                            materials[i].SetFloat("WIREFRAME_DYNAMIC_MASK", 1);
                            materials[i].SetVector("_WireframeShaderMaskPlanePosition", maskObject.position);
                            materials[i].SetVector("_WireframeShaderMaskPlaneNormal", maskObject.up);
                            break;

                        case MaskType.Sphere:
                            materials[i].EnableKeyword("WIREFRAME_DYNAMIC_MASK_SPHERE");
                            materials[i].SetFloat("WIREFRAME_DYNAMIC_MASK", 2);
                            materials[i].SetVector("_WireframeShaderMaskSpherePosition", maskObject.position);

                            float radius = Mathf.Abs(maskObject.localScale.x) * 0.5f;
                            materials[i].SetFloat("_WireframeShaderMaskSphereRadius", radius);
                            break;

                        case MaskType.Box:
                            materials[i].EnableKeyword("WIREFRAME_DYNAMIC_MASK_BOX");
                            materials[i].SetFloat("WIREFRAME_DYNAMIC_MASK", 3);
                            Matrix4x4 matrixRTS = Matrix4x4.TRS(maskObject.position, maskObject.rotation, Vector3.one).inverse;
                            materials[i].SetMatrix("_WireframeShaderMaskBoxMatrixTRS", matrixRTS);

                            Vector3 boxBoundMin = new Vector3(-0.5f, -0.5f, -0.5f);
                            Vector3 localScale = maskObject.localScale;

                            //Keep all values positive
                            localScale.x *= localScale.x > 0 ? 1 : -1;
                            localScale.y *= localScale.y > 0 ? 1 : -1;
                            localScale.z *= localScale.z > 0 ? 1 : -1;


                            materials[i].SetVector("_WireframeShaderMaskBoxBoundingBox", Vector3.Scale(boxBoundMin, localScale));
                            break;

                        default:
                            materials[i].SetFloat("WIREFRAME_DYNAMIC_MASK", 0);
                            break;
                    }
                }
            }
        }
    }
}
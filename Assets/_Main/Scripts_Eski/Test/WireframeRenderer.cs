using UnityEngine;

// Only Runs Built-in Render Pipelinme 
// Attach this script to a camera
public class WireframeRenderer : MonoBehaviour
{
    private void OnPreRender()
    {
        GL.wireframe = true;
    }

    private void OnPostRender()
    {
        GL.wireframe = false;
    }
}

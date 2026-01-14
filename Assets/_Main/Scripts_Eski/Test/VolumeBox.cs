using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;

public class VolumeBox : MonoBehaviour
{
    public int horizontalStack = 20;
    public float volumeHeight;
    public GameObject quadMesh;
    public Material volumeMaterial;

    Transform temp;

    [ContextMenu("Create Volume Box")]
    void CreateVolumeBox()
    {
        if (quadMesh == null)
        {
            // No Object !
            return;
        }
        if(transform.childCount>0)
        {
            // Deleting old objects
            while(this.transform.childCount>0)
            {
                DestroyImmediate(this.transform.GetChild(0).gameObject);
            }

        }
        // Calculating - Duzenleme gerekiyor
        var h = transform.localScale.y;
        float btw = h / horizontalStack;
        // Creating
        for (int i = 0; i < horizontalStack; i++)
        {
            temp = Instantiate(quadMesh).transform;
            temp.parent = transform;
            temp.name = "Vol-" + (i+1).ToString("00");
            temp.position = new Vector3(0, btw * i, 0);
            temp.GetComponent<Renderer>().material = volumeMaterial;    
        }
    }
}

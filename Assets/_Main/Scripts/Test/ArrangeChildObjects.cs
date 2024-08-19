using Unity.VisualScripting;
using UnityEngine;

[ExecuteInEditMode]
public class ArrangeChildObjects : MonoBehaviour
{
    public bool arrange = false;
    // su an sadece y de arrange ediyor

    private int ct = 0;

    void Update()
    {
        if(arrange)
        {
            var h = getBounds(this.gameObject);
            float btw = (float)h.size.y / (float)transform.childCount;
            //Debug.Log("adet = " + transform.childCount + "\nyukseklik = " + (h.size.y/2f) + "\naralik = " + btw);
            foreach(Transform child in transform)
            {
                child.transform.localPosition = new Vector3(0, btw * ct, 0);
                ct++;
            }
            ct = 0;
            arrange = false;

        }
    }



    Bounds getBounds(GameObject objeto)
    {
        Bounds bounds;
        bounds = new Bounds(objeto.transform.position, Vector3.zero);
        foreach(Transform child in objeto.transform)
        {
            bounds.Encapsulate(getBounds(child.gameObject));
        }
        return bounds;
    }
}
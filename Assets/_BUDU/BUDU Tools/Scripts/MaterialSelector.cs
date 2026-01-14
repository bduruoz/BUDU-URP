// BUDU Games 2024 - 2025
using UnityEngine;

public class MaterialSelector : MonoBehaviour
{
    public Material[] materials;
    [HideInInspector] public int selectedMatIndex = 0;

    public bool AnotherObjects = false;
    public Transform[] MatGroups; // Group of objects of materials to be changed

    public void ApplyMaterialToChildren()
    {
        Material mat = GetSelectedMaterial();
        if (mat == null) return;

        // Eğer AnotherObjects true ve MatGroup dolu ise, her grup üzerinde dönecek
        if (AnotherObjects && MatGroups != null && MatGroups.Length > 0)
        {
            foreach (Transform group in MatGroups)
            {
                ApplyMaterialToTransform(group, mat);
                Debug.Log(group.name);
            }
        }
        else
        {
            // Tek obje üzerinde uygula
            ApplyMaterialToTransform(this.transform, mat);
        }
    }

    // Tek bir transform ve onun çocukları için materyal uygular
    private void ApplyMaterialToTransform(Transform tform, Material mat)
    {
        if(tform.childCount > 0)
        {
            foreach (Transform child in tform)
            {
                Renderer rend = child.GetComponent<Renderer>();
                if (rend == null) continue;

                Material[] sharedMats = new Material[rend.sharedMaterials.Length];
                for (int i = 0; i < sharedMats.Length; i++)
                {
                    sharedMats[i] = mat;
                }

                rend.sharedMaterials = sharedMats;
            }
        }
        else
        {
            Renderer rend = tform.GetComponent<Renderer>();
            if (rend == null) return;

            Material[] sharedMats = new Material[rend.sharedMaterials.Length];
            for (int i = 0; i < sharedMats.Length; i++)
            {
                sharedMats[i] = mat;
            }

            rend.sharedMaterials = sharedMats;

        }
    }

    public Material GetSelectedMaterial()
    {
        if (materials != null && materials.Length > 0 && selectedMatIndex < materials.Length)
            return materials[selectedMatIndex];
        return null;
    }
}

// BUDU Games 2024 - 2025
using UnityEngine;

public class GizmoControl : MonoBehaviour
{
    public bool showGizmo = false;
    public Color gizmoColor = Color.cyan;

    [SerializeField] 
    private bool customTranslates = false;

    [SerializeField] 
    private Vector3 gizmoPosition = Vector3.zero;
    [SerializeField] 
    private Vector3 gizmoScale = Vector3.one;
    [SerializeField] 
    private Vector3 gizmoRotation = Vector3.zero;

    public enum gizmoType
    {
        Box,
        Sphere,
        Ellipsoid,
        Circle
    }
    public gizmoType selGizmoType = gizmoType.Box;

    private void OnDrawGizmos()
    {
        Gizmos.color = gizmoColor;

        if (showGizmo)
        {
            if(!customTranslates)
            {
                gizmoPosition = transform.position;
                gizmoScale = transform.localScale;
                gizmoRotation = transform.eulerAngles;
            }

            switch (selGizmoType)
            {
                case gizmoType.Box:
                    GizmoHelper.DrawWireBox(gizmoPosition, gizmoScale, Quaternion.Euler(gizmoRotation));
                    break;
                case gizmoType.Sphere:
                    GizmoHelper.DrawWireSphere(gizmoPosition, (gizmoScale.x + gizmoScale.y + gizmoScale.z) / 3f);
                    break;
                case gizmoType.Ellipsoid:
                    GizmoHelper.DrawWireEllipsoid(gizmoPosition, gizmoScale, Quaternion.Euler(gizmoRotation), 32);
                    break;
                case gizmoType.Circle:
                    GizmoHelper.DrawCircle(gizmoPosition, gizmoScale.x, Quaternion.Euler(gizmoRotation), 32);
                    break;
            }
        }
    }
}

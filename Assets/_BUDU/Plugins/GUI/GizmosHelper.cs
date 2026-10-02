// © BUDU Games 2024 - 2026
// Gizmos Helper

using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

public static class GizmoHelper
{
    #region Renk Ayarları
    public static readonly Color TransparentRed = new Color(1f, 0f, 0f, 0.3f);
    public static readonly Color TransparentGreen = new Color(0f, 1f, 0f, 0.3f);
    public static readonly Color TransparentBlue = new Color(0f, 0f, 1f, 0.3f);
    public static readonly Color TransparentYellow = new Color(1f, 1f, 0f, 0.3f);
    #endregion

    #region Temel Şekiller
    /// <summary>
    /// Merkezi ve boyutları belirtilen bir WireCube çizer
    /// </summary>
    public static void DrawWireCube(Vector3 center, Vector3 size)
    {
        Gizmos.DrawWireCube(center, size);
    }

    /// <summary>
    /// Merkezi ve yarıçapı belirtilen bir WireSphere çizer
    /// </summary>
    public static void DrawWireSphere(Vector3 center, float radius)
    {
        Gizmos.DrawWireSphere(center, radius);
    }

    /// <summary>
    /// Rotasyon uygulanmış Wire Sphere çizer
    /// </summary>
    public static void DrawWireSphere(Vector3 center, float radius, Quaternion rotation)
    {
        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);
        Gizmos.DrawWireSphere(Vector3.zero, radius);
        Gizmos.matrix = originalMatrix;
    }

    /// <summary>
    /// Rotasyon uygulanmış Solid Sphere çizer
    /// </summary>
    public static void DrawSphere(Vector3 center, float radius, Quaternion rotation)
    {
        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);
        Gizmos.DrawSphere(Vector3.zero, radius);
        Gizmos.matrix = originalMatrix;
    }
    #endregion

    #region Rotasyonlu Box Çizimi
    /// <summary>
    /// Rotasyon uygulanmış Wire Box çizer
    /// </summary>
    public static void DrawWireBox(Vector3 center, Vector3 size, Quaternion rotation)
    {
        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);
        Gizmos.DrawWireCube(Vector3.zero, size);
        Gizmos.matrix = originalMatrix;
    }

    /// <summary>
    /// Rotasyon uygulanmış Solid Box çizer
    /// </summary>
    public static void DrawBox(Vector3 center, Vector3 size, Quaternion rotation)
    {
        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);
        Gizmos.DrawCube(Vector3.zero, size);
        Gizmos.matrix = originalMatrix;
    }

    /// <summary>
    /// Transform'un rotasyonlu kutusunu çizer
    /// </summary>
    public static void DrawTransformWireBox(Transform transform)
    {
        DrawWireBox(transform.position, transform.lossyScale, transform.rotation);
    }

    /// <summary>
    /// Transform'un rotasyonlu solid kutusunu çizer
    /// </summary>
    public static void DrawTransformBox(Transform transform)
    {
        DrawBox(transform.position, transform.lossyScale, transform.rotation);
    }

    /// <summary>
    /// Transform'un rotasyonlu wire sphere'ini çizer
    /// </summary>
    public static void DrawTransformWireSphere(Transform transform, float radius)
    {
        DrawWireSphere(transform.position, radius, transform.rotation);
    }

    /// <summary>
    /// Transform'un rotasyonlu solid sphere'ini çizer
    /// </summary>
    public static void DrawTransformSphere(Transform transform, float radius)
    {
        DrawSphere(transform.position, radius, transform.rotation);
    }
    #endregion

    #region Gelişmiş Şekiller
    /// <summary>
    /// Elipsoid (non-uniform scale uygulanmış küre) çizer
    /// </summary>
    public static void DrawWireEllipsoid(Vector3 center, Vector3 scale, Quaternion rotation, int segments = 32)
    {
#if UNITY_EDITOR
        Matrix4x4 originalMatrix = Handles.matrix;
        Handles.color = Gizmos.color;
        Handles.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);

        // Üç farklı düzlemde daireler çizerek elipsoid oluştur
        Handles.DrawWireArc(Vector3.zero, Vector3.up, Vector3.forward, 360f, 1f);
        Handles.DrawWireArc(Vector3.zero, Vector3.right, Vector3.forward, 360f, 1f);
        Handles.DrawWireArc(Vector3.zero, Vector3.forward, Vector3.up, 360f, 1f);

        Handles.matrix = originalMatrix;
#endif
    }

    /// <summary>
    /// 3D Ok çizer (yönü gösterir)
    /// </summary>
    public static void DrawArrow(Vector3 from, Vector3 to, float arrowHeadLength = 0.25f, float arrowHeadAngle = 20.0f)
    {
        Gizmos.DrawLine(from, to);

        Vector3 direction = to - from;
        if (direction == Vector3.zero) return;

        Vector3 right = Quaternion.LookRotation(direction) * Quaternion.Euler(0, 180 + arrowHeadAngle, 0) * Vector3.forward;
        Vector3 left = Quaternion.LookRotation(direction) * Quaternion.Euler(0, 180 - arrowHeadAngle, 0) * Vector3.forward;

        Gizmos.DrawLine(to, to + right * arrowHeadLength);
        Gizmos.DrawLine(to, to + left * arrowHeadLength);
    }

    /// <summary>
    /// Rotasyonlu Daire yayı çizer
    /// </summary>
    public static void DrawWireArc(Vector3 center, Vector3 normal, Vector3 from, float angle, float radius, Quaternion rotation, int segments = 20)
    {
#if UNITY_EDITOR
        Matrix4x4 originalMatrix = Handles.matrix;
        Handles.color = Gizmos.color;
        Handles.matrix = Matrix4x4.TRS(center, rotation, Vector3.one);
        Handles.DrawWireArc(Vector3.zero, normal, from, angle, radius);
        Handles.matrix = originalMatrix;
#endif
    }
    #endregion

    #region Yardımcı Metodlar
    /// <summary>
    /// Rotasyon uygulanmış sınırlayıcı kutu çizer (Bounds)
    /// </summary>
    public static void DrawBounds(Bounds bounds, Quaternion rotation)
    {
        DrawWireBox(bounds.center, bounds.size, rotation);
    }

    /// <summary>
    /// Rotasyonlu Kamera görüş konisi çizer
    /// </summary>
    public static void DrawCameraFrustum(Vector3 position, Quaternion rotation, float fov, float maxRange, float minRange = 0.1f, float aspect = 1.0f)
    {
#if UNITY_EDITOR
        Matrix4x4 originalMatrix = Handles.matrix;
        Handles.color = Gizmos.color;
        Handles.matrix = Matrix4x4.TRS(position, rotation, Vector3.one);

        Handles.DrawWireCube(Vector3.forward * (maxRange + minRange) / 2f,
                            new Vector3(aspect * 2f * Mathf.Tan(fov * 0.5f * Mathf.Deg2Rad) * (maxRange - minRange),
                                        2f * Mathf.Tan(fov * 0.5f * Mathf.Deg2Rad) * (maxRange - minRange),
                                        maxRange - minRange));

        Handles.matrix = originalMatrix;
#endif
    }

    /// <summary>
    /// Rotasyonlu 2B Daire çizer
    /// </summary>
    public static void DrawCircle(Vector3 center, float radius, Quaternion rotation, int segments = 32)
    {
        Vector3 prevPoint = center + rotation * new Vector3(radius, 0, 0);

        for (int i = 1; i <= segments; i++)
        {
            float angle = i * Mathf.PI * 2f / segments;
            Vector3 point = center + rotation * new Vector3(Mathf.Cos(angle) * radius, Mathf.Sin(angle) * radius, 0);

            Gizmos.DrawLine(prevPoint, point);
            prevPoint = point;
        }
    }
    #endregion

    #region Debug Gizmos
    /// <summary>
    /// Hata ayıklama için koordinat eksenleri çizer
    /// </summary>
    public static void DrawCoordinateSystem(Vector3 position, Quaternion rotation, float scale = 1.0f)
    {
        Color originalColor = Gizmos.color;

        // X ekseni (Kırmızı)
        Gizmos.color = Color.red;
        DrawArrow(position, position + rotation * Vector3.right * scale);

        // Y ekseni (Yeşil)
        Gizmos.color = Color.green;
        DrawArrow(position, position + rotation * Vector3.up * scale);

        // Z ekseni (Mavi)
        Gizmos.color = Color.blue;
        DrawArrow(position, position + rotation * Vector3.forward * scale);

        Gizmos.color = originalColor;
    }

    /// <summary>
    /// Yüzey normali çizer
    /// </summary>
    public static void DrawNormal(Vector3 position, Vector3 normal, float length = 1.0f)
    {
        Gizmos.color = Color.cyan;
        DrawArrow(position, position + normal.normalized * length);
    }

    /// <summary>
    /// Transform eksenlerini çizer
    /// </summary>
    public static void DrawTransformAxes(Transform transform, float scale = 1.0f)
    {
        DrawCoordinateSystem(transform.position, transform.rotation, scale);
    }
    #endregion

    #region Collider Gizmos
    /// <summary>
    /// BoxCollider çizer (rotasyonlu)
    /// </summary>
    public static void DrawBoxCollider(BoxCollider collider)
    {
        if (collider == null) return;

        Gizmos.color = Color.green;
        DrawWireBox(collider.bounds.center, collider.size, collider.transform.rotation);
    }

    /// <summary>
    /// SphereCollider çizer (rotasyonlu)
    /// </summary>
    public static void DrawSphereCollider(SphereCollider collider)
    {
        if (collider == null) return;

        Gizmos.color = Color.blue;
        DrawWireSphere(collider.bounds.center, collider.radius, collider.transform.rotation);
    }

    /// <summary>
    /// CapsuleCollider çizer (rotasyonlu)
    /// </summary>
    public static void DrawCapsuleCollider(CapsuleCollider collider)
    {
        if (collider == null) return;

        Gizmos.color = Color.yellow;
        // Capsule çizimi için basit bir kutu çiziyoruz, daha gelişmiş çizim yapılabilir
        DrawWireBox(collider.bounds.center,
                   new Vector3(collider.radius * 2, collider.height, collider.radius * 2),
                   collider.transform.rotation);
    }
    #endregion

    #region Mesh Gizmos
    /// <summary>
    /// Mesh'in wireframe'ini çizer (rotasyonlu)
    /// </summary>
    public static void DrawWireMesh(Mesh mesh, Vector3 position, Quaternion rotation, Vector3 scale)
    {
        if (mesh == null) return;

        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(position, rotation, scale);
        Gizmos.DrawWireMesh(mesh);
        Gizmos.matrix = originalMatrix;
    }

    /// <summary>
    /// Mesh çizer (rotasyonlu)
    /// </summary>
    public static void DrawMesh(Mesh mesh, Vector3 position, Quaternion rotation, Vector3 scale)
    {
        if (mesh == null) return;

        Matrix4x4 originalMatrix = Gizmos.matrix;
        Gizmos.matrix = Matrix4x4.TRS(position, rotation, scale);
        Gizmos.DrawMesh(mesh);
        Gizmos.matrix = originalMatrix;
    }
    #endregion
}
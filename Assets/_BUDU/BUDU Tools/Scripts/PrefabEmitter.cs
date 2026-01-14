// BUDU Games 2024 - 2025
using UnityEngine;
using System.Collections;

public class PrefabEmitter : MonoBehaviour
{
    public bool start = false;

    public enum EmitMode { 
        Random, 
        Grid };

    //[Header("Emit Settings")]
    public EmitMode emitMode = EmitMode.Random;

    //[Header("Grid Emit Settings")]
    public int gridX = 5;
    public int gridY = 5;
    public int gridZ = 1;

    //[Header("Common Settings")]
    public GameObject prefabToSpawn;
    public float duration = 5f;       // toplam çalışma süresi (s)
    public float spawnRate = 10f;          // Random mod: saniyede kaç adet
    public float gridEmitInterval = 0.2f; // Grid mod: her kaç sn'de bir tüm grid

    //[Header("Area Settings")]
    public Vector3 areaSize = Vector3.one;  // spawn alanı
    public bool useTransformScale = true;

    //[Header("Scale Settings")]
    public bool randomizeScale = false;
    public Vector2 scaleRange = new Vector2(1f, 1f);
    public float scaleMultiplier = 1f;

    //[Header("Rotate Settings")]
    public bool randomizeRotate = false;
    public Vector3 minRotate = new Vector3(-30f, -30f, -30f);
    public Vector3 maxRotate = new Vector3(30f, 30f, 30f);

    //[Header("Parent Group")]
    public bool useParentGroup = true;
    public string parentName = "Spawned Objects";
    public bool secondParent = false;
    public string sParentName = "";

    //[Header("RigidBody Settings")]
    public bool freezer = true;

    //[Header("Force Settings")]
    public bool Force = false;
    public ForceMode forceMode = ForceMode.Impulse;
    public Vector3 forceDirection = Vector3.up;
    public float forceStrength = 5f;

    private Transform parentTransform;
    private bool isSpawning = false;

    void Start()
    {
        if (prefabToSpawn == null)
        {
            Debug.LogWarning("Prefab not assigned!");
            enabled = false;
            return;
        }

        if (useTransformScale)
            areaSize = transform.localScale;

        Parenting();
    }

    void Update()
    {
        // Sadece coroutine’i başlatıp bırakıyoruz
        if (start && !isSpawning)
        {
            Parenting();
            StartCoroutine(SpawnRoutine());
        }
    }

    private void Parenting()
    {
        if (useParentGroup)
        {
            if (secondParent)
            {
                var existing = GameObject.Find(sParentName);
                if (existing != null) parentTransform = existing.transform;
                else
                {
                    GameObject parentObj = new GameObject(sParentName);
                    parentTransform = parentObj.transform;
                }
            }
            else
            {
                var existing = GameObject.Find(parentName);
                if (existing != null) parentTransform = existing.transform;
                else
                {
                    GameObject parentObj = new GameObject(parentName);
                    parentTransform = parentObj.transform;
                }
            }
        }
    }

    IEnumerator SpawnRoutine()
    {
        isSpawning = true;

        float elapsed = 0f;
        float accumulator = 0f;                // Random için
        float startTime = Time.fixedTime;
        float nextGridEmitTime = startTime;    // Grid: time=0'da ilk pulse

        while ((Time.fixedTime - startTime) < duration)
        {
            float dt = Time.deltaTime;
            elapsed += dt;

            if (emitMode == EmitMode.Random)
            {
                // saniyede 'rate' adet olacak şekilde
                accumulator += spawnRate * dt;
                while (accumulator >= 1f)
                {
                    SpawnPrefabRandom();
                    accumulator -= 1f;
                }
            }
            else // Grid
            {
                // duration içinde, belirlenen aralıklarla tüm grid'i bas
                if (Time.time >= nextGridEmitTime)
                {
                    SpawnGridPrefabs();
                    nextGridEmitTime += gridEmitInterval;
                }
            }

            yield return null;
        }

        isSpawning = false;
        start = false; // süre bitince otomatik kapat
    }

    void SpawnPrefabRandom()
    {
        Vector3 randomPos = new Vector3(
            Random.Range(-areaSize.x / 2f, areaSize.x / 2f),
            Random.Range(-areaSize.y / 2f, areaSize.y / 2f),
            Random.Range(-areaSize.z / 2f, areaSize.z / 2f)
        );

        Vector3 spawnPos = transform.position + randomPos;
        CreateOne(spawnPos);
    }

    void SpawnGridPrefabs()
    {
        for (int x = 0; x < Mathf.Max(1, gridX); x++)
        {
            for (int y = 0; y < Mathf.Max(1, gridY); y++)
            {
                for (int z = 0; z < Mathf.Max(1, gridZ); z++)
                {
                    float px = (gridX > 1) ? (x / (float)(gridX - 1) - 0.5f) * areaSize.x : 0f;
                    float py = (gridY > 1) ? (y / (float)(gridY - 1) - 0.5f) * areaSize.y : 0f;
                    float pz = (gridZ > 1) ? (z / (float)(gridZ - 1) - 0.5f) * areaSize.z : 0f;

                    Vector3 pos = transform.position + new Vector3(px, py, pz);

                    // Oluşturma ve scale / rotation uygulaması
                    GameObject instance = CreateOne(pos);

                    // Random scale
                    if (randomizeScale)
                    {
                        float randomScale = Random.Range(scaleRange.x, scaleRange.y);
                        instance.transform.localScale = Vector3.one * randomScale;
                    }
                    else
                    {
                        instance.transform.localScale = Vector3.one * scaleMultiplier;
                    }

                    // Opsiyonel: Random rotation eklemek istersen
                    instance.transform.rotation = Random.rotation;
                }
            }
        }
    }

    GameObject CreateOne(Vector3 pos)
    {
        GameObject obj = Instantiate(prefabToSpawn, pos, Quaternion.identity);

        // Scale
        float finalScale = randomizeScale ? Random.Range(scaleRange.x, scaleRange.y) : scaleMultiplier;
        obj.transform.localScale = Vector3.one * finalScale;

        // Rotation
        if (randomizeRotate)
        {
            float rx = Random.Range(minRotate.x, maxRotate.x);
            float ry = Random.Range(minRotate.y, maxRotate.y);
            float rz = Random.Range(minRotate.z, maxRotate.z);

            Rigidbody rb = obj.GetComponent<Rigidbody>();
            if(rb != null)
            {
                rb.rotation = Quaternion.Euler(rx, ry, rz);
            }
            else
            {
                obj.transform.rotation = Quaternion.Euler(rx, ry, rz);
            }
        }

        // Parent
        if (useParentGroup && parentTransform != null)
            obj.transform.SetParent(parentTransform);

        // Layer güvenli atama (layer yoksa -1 döner)
        int layer = LayerMask.NameToLayer("SpawnedObjects");
        if (layer >= 0) obj.layer = layer;


        // Force
        if (Force)
        {
            var rb = obj.GetComponent<Rigidbody>();
            if (rb != null)
                rb.AddForce(forceDirection.normalized * forceStrength, forceMode);

            // Physics freeze: obje yere çarptığında veya delay sonra
            if (rb != null)
            {
                if (freezer)
                {
                    StartCoroutine(FreezeWhenStopped(rb, 0.001f));
                }
            }
        }

        return obj;
    }

    IEnumerator FreezeWhenStopped(Rigidbody rb, float threshold = 0.01f)
    {
        yield return new WaitForFixedUpdate(); // bir frame bekle
        yield return new WaitForFixedUpdate(); // ikinci frame bekle
        while (rb != null)
        {
            if (rb.linearVelocity.sqrMagnitude < threshold * threshold
             && rb.angularVelocity.sqrMagnitude < threshold * threshold)
            {
                rb.isKinematic = true;
                rb.linearVelocity = Vector3.zero;
                rb.angularVelocity = Vector3.zero;
                yield break;
            }
            yield return null;
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.cyan;
        Vector3 size = useTransformScale ? transform.localScale : areaSize;
        Gizmos.DrawWireCube(transform.position, size);
    }

    public void Starter()
    {
        start = true;

    }
}

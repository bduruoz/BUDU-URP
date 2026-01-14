// BUDU Games 2024 - 2025
using UnityEngine;
using System.Collections;

public class AnimationController : MonoBehaviour
{
    [Header("Animation Target")]
    public GameObject targetObject; // Animasyonu oynatılacak child objesi

    [Header("Animation Settings")]
    public string animationTriggerName = "YourTrigger";
    public string animationStateName = "YourAnimationState";
    public string boolParameterName = "YourBoolParameter";

    [Header("Debug Info")]
    [ReadOnly] public bool isAnimationPlaying = false;
    [ReadOnly] public string currentStatus = "Ready";

    private Animator targetAnimator;

    private void Start()
    {
        InitializeAnimator();
    }

    public void InitializeAnimator()
    {
        // Target object belirtilmemişse, bu objeyi kullan
        if (targetObject == null)
        {
            targetObject = gameObject;
        }

        // Animator'ı bul
        targetAnimator = targetObject.GetComponent<Animator>();
        if (targetAnimator == null)
        {
            Debug.LogError("Animator component not found on target object: " + targetObject.name);
            currentStatus = "Error: No Animator";
        }
        else
        {
            currentStatus = "Ready";
        }
    }

    public void PlayChildAnimation()
    {
        if (!isAnimationPlaying && targetAnimator != null)
        {
            StartCoroutine(PlayAnimationAndReset());
        }
        else if (targetAnimator == null)
        {
            Debug.LogWarning("Animator not found. Initializing...");
            InitializeAnimator();
        }
    }

    private IEnumerator PlayAnimationAndReset()
    {
        isAnimationPlaying = true;
        currentStatus = "Playing Animation";

        // Bool'u true yap (eğer kullanılıyorsa)
        if (!string.IsNullOrEmpty(boolParameterName))
        {
            targetAnimator.SetBool(boolParameterName, true);
        }

        // Trigger'ı tetikle
        targetAnimator.SetTrigger(animationTriggerName);

        Debug.Log("Animation started on: " + targetObject.name);

        // Animasyonun başlamasını bekle
        yield return new WaitForEndOfFrame();

        // Animasyon state'ini bul ve süresini al
        AnimatorStateInfo stateInfo = targetAnimator.GetCurrentAnimatorStateInfo(0);

        // Eğer spesifik state name verilmişse, onu bul
        if (!string.IsNullOrEmpty(animationStateName))
        {
            int stateHash = Animator.StringToHash(animationStateName);

            // State'in geçiş yapmasını bekle (max 2 saniye)
            float timeout = 2f;
            float timer = 0f;

            while (targetAnimator.GetCurrentAnimatorStateInfo(0).shortNameHash != stateHash && timer < timeout)
            {
                yield return null;
                timer += Time.deltaTime;
            }

            if (timer >= timeout)
            {
                Debug.LogWarning("Animation state timeout: " + animationStateName);
            }

            stateInfo = targetAnimator.GetCurrentAnimatorStateInfo(0);
        }

        // Animasyonun bitmesini bekle
        yield return new WaitForSeconds(stateInfo.length);

        // Bool'u false yap
        if (!string.IsNullOrEmpty(boolParameterName))
        {
            targetAnimator.SetBool(boolParameterName, false);
        }

        isAnimationPlaying = false;
        currentStatus = "Completed";

        Debug.Log("Animation completed on: " + targetObject.name);

        // 2 saniye sonra ready durumuna dön
        yield return new WaitForSeconds(2f);
        if (!isAnimationPlaying)
        {
            currentStatus = "Ready";
        }
    }

    public bool CanPlayAnimation()
    {
        return !isAnimationPlaying && targetAnimator != null;
    }
}

// ReadOnly attribute for inspector
public class ReadOnlyAttribute : PropertyAttribute { }
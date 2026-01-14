// AudioParam.cs
using System.Diagnostics;
using UnityEngine;
using UnityEngine.UI;

public class AudioParam : MonoBehaviour
{
    public int band;
    //public float startScale;
    //public float multiplier = 1f;

    public bool UIFill = false;
    public bool TRScl = true;

    // INSPECTOR'DAN SÜRÜKLE-BIRAK İLE BAĞLA!
    public AudioPeer audioPeer;

    private Image img;
    private float scalar;

    void Start()
    {
        img = GetComponent<Image>();
    }

    void Update()
    {
        if(audioPeer !=null && band < audioPeer.freqBand.Length)
        {
            scalar = audioPeer.freqBand[band];


            if (UIFill)
            {
                img.fillAmount = (scalar * audioPeer.multiplier) + audioPeer.startLevel;
            }
            if (TRScl)
            {
                transform.localScale = new Vector3(transform.localScale.x, (scalar * audioPeer.multiplier) + audioPeer.startLevel, transform.localScale.z);
            }
        }
    }
}
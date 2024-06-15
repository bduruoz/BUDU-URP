using UnityEngine;
using System;
using System.Collections;

namespace budu
{

    public class bdStyles
    {
        public static GUIStyle def()
        {
            GUIStyle style = new GUIStyle();
            return style;
        }

        public static GUIStyle BDTitle()
        {
            GUIStyle style = new GUIStyle();
            style.normal.background = MakeBackground(1, 32, bdColors.GrayP(18, 204));
            style.fontSize = 16;
            style.normal.textColor = bdColors.NexusOrange();
            return style;
        }

        public static GUIStyle BDBoxBack() 
        {
            GUIStyle style = new GUIStyle();
            GUI.backgroundColor = bdColors.GrayP(18, 204);
            style.normal.textColor += bdColors.NexusOrange();
            style.alignment = TextAnchor.UpperCenter;
            return style;
        }

        public static GUIStyle BDSubTitle()
        {
            GUIStyle style = new GUIStyle();
            GUI.backgroundColor = bdColors.Transparent(0);
            style.normal.textColor = bdColors.NexusOrange(153);
            style.fontSize = 10;
            style.fontStyle = FontStyle.Italic;
            return style;
        }

        //public static GUIStyle BDLightBG()
        //{
        //    GUIStyle style = new GUIStyle();
        //    GUI.backgroundColor = bdColors.White(255);
        //    style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));
        //    return style;
        //}

        public static GUIStyle UnityDefGUI()
        {
            GUIStyle style = new GUIStyle();
            GUI.backgroundColor = bdColors.White(255);
            style.normal.background = MakeBackground(1, 1, bdColors.Gray60(76));
            return style;
        }

        public static Texture2D MakeBackground(int width, int height, Color col)
        {
            Color[] pix = new Color[width * height];
            for(int i = 0; i < pix.Length; i++)
            {
                pix[i] = col;
            }
            Texture2D result = new Texture2D(width, height);
            result.SetPixels(pix);
            result.Apply();
            return result;
        }
    }
}


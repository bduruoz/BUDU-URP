using UnityEngine;
using System.Collections;

namespace budu
{
    public class bdColors
    {
        public static Color Black(byte alpha = 255)
        {
            return new Color32(0,0,0,alpha); ;
        }
        public static Color White(byte alpha = 255)
        {
            return new Color32(255, 255, 255, alpha);
        }
        public static Color Transparent (byte alpha = 255)
        {
            return new Color32(0,0,0,alpha);
        }

        public static Color DarkRed(byte alpha = 255)
        {
            return new Color32(102, 0, 0, alpha);
        }
        public static Color BrightRed(byte alpha = 255)
        {
            return new Color32(200, 0, 0, alpha);
        }

        public static Color NexusOrange (byte alpha = 255)
        {
            return new Color32(204,153,0, alpha);
        }
        public static Color NexusRed (byte alpha = 255)
        {
            return new Color32(204,25,0, alpha);
        }
        public static Color NexusBlue (byte alpha = 255)
        {
            return new Color32(0, 30, 100, alpha);
        }

        #region Grays
        public static Color Gray10(byte alpha = 255)
        {
            return new Color32(25, 25, 25, alpha);
        }
        public static Color Gray20(byte alpha = 255)
        {
            return new Color32(51, 51, 51, alpha);
        }
        public static Color Gray30(byte alpha = 255)
        {
            return new Color32(76, 76, 76, alpha);
        }
        public static Color Gray40(byte alpha = 255)
        {
            return new Color32(102, 102, 102, alpha);
        }
        public static Color Gray50(byte alpha = 255)
        {
            return new Color32(127, 127, 127, alpha);
        }
        public static Color Gray60(byte alpha = 255)
        {
            return new Color32(153, 153, 153, alpha);
        }
        public static Color Gray70(byte alpha = 255)
        {
            return new Color32(178, 178, 178, alpha);
        }
        public static Color Gray80(byte alpha = 255)
        {
            return new Color32(204, 204, 204, alpha);
        }
        public static Color Gray90(byte alpha = 255)
        {
            return new Color32(229, 229, 229, alpha);
        }
        public static Color GrayP (byte percent, byte alpha)
        {
            byte tc = (byte)((percent / 100f) * 255);
            return new Color32(tc,tc,tc, alpha);
        }
        #endregion

        #region old
        public static Color dGreenBrown(byte alpha = 255)
        {
            return new Color32(48, 110, 0, alpha);
        }
        public static Color lGreenBrown(byte alpha = 255)
        {
            return new Color32(160, 123, 20, alpha);
        }

        public static Color dGreenViolet(byte alpha = 255)
        {
            return new Color32(42, 152, 13, alpha);
        }
        public static Color lGreenViolet(byte alpha = 255)
        {
            return new Color32(127, 60, 158, alpha);
        }

        public static Color dGreenRed(byte alpha = 255)
        {
            return new Color32(26, 124, 0, alpha);
        }
        public static Color lGreenRed(byte alpha = 255)
        {
            return new Color32(213, 36, 57, alpha);
        }

        public static Color dBlueYellow(byte alpha = 255)
        {
            return new Color32(34, 86, 145, alpha);
        }
        public static Color lBlueYellow(byte alpha = 255)
        {
            return new Color32(141, 173, 14, alpha);
        }

        public static Color dBlueOrange(byte alpha = 255)
        {
            return new Color32(32, 95, 143, alpha);
        }
        public static Color lBlueOrange(byte alpha = 255)
        {
            return new Color32(222, 143, 38, alpha);
        }

        public static Color dBlueRed(byte alpha = 255)
        {
            return new Color32(32, 95, 143, alpha);
        }
        public static Color lBlueRed(byte alpha = 255)
        {
            return new Color32(169, 14, 41, alpha);
        }

        public static Color dPurpleCyan(byte alpha = 255)
        {
            return new Color32(107, 32, 148, alpha);
        }
        public static Color lPurpleCyan(byte alpha = 255)
        {
            return new Color32(23, 135, 131, alpha);
        }

        public static Color dPinkBlue(byte alpha = 255)
        {
            return new Color32(151, 13, 78, alpha);
        }
        public static Color lPinkBlue(byte alpha = 255)
        {
            return new Color32(23, 48, 122, alpha);
        }

        public static Color dOrangeViolet(byte alpha = 255)
        {
            return new Color32(222, 116, 38, alpha);
        }
        public static Color lOrangeViolet(byte alpha = 255)
        {
            return new Color32(99, 33, 149, alpha);
        }

        public static Color dYellowRed(byte alpha = 255)
        {
            return new Color32(180, 150, 15, alpha);
        }
        public static Color lYellowRed(byte alpha = 255)
        {
            return new Color32(214, 36, 53, alpha);
        }

        public static Color dCyanGreen(byte alpha = 255)
        {
            return new Color32(9, 111, 104, alpha);
        }
        public static Color lCyanGreen(byte alpha = 255)
        {
            return new Color32(42, 152, 13, alpha);
        }

        public static Color dCyanRed(byte alpha = 255)
        {
            return new Color32(23, 136, 128, alpha);
        }
        public static Color lCyanRed(byte alpha = 255)
        {
            return new Color32(213, 36, 57, alpha);
        }

        public static Color dCyanOrange(byte alpha = 255)
        {
            return new Color32(51, 146, 139, alpha);
        }
        public static Color lCyanOrange(byte alpha = 255)
        {
            return new Color32(222, 116, 38, alpha);
        }

        public static Color dVioletOrange(byte alpha = 255)
        {
            return new Color32(85, 36, 150, alpha);
        }
        public static Color lVioletOrange(byte alpha = 255)
        {
            return new Color32(222, 149, 38, alpha);
        }
        #endregion
    }
}


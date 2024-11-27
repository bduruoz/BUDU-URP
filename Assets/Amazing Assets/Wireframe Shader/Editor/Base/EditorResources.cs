// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System.IO;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    static public class EditorResources
    {
        static public Color projectRelatedPathColor = new Color(0.08f, 0.62f, 1, 0.59f);



        static GUIStyle guiStyleFoldoutBold;
        static internal GUIStyle GUIStyleFoldoutBold
        {
            get
            {
                if (guiStyleFoldoutBold == null)
                {
                    guiStyleFoldoutBold = new GUIStyle(EditorStyles.foldout);
                    guiStyleFoldoutBold.fontStyle = FontStyle.Bold;
                    guiStyleFoldoutBold.richText = true;
                }

                return guiStyleFoldoutBold;
            }
        }
        static GUIStyle guiStyleBoldLabelMiddleCenter;
        static internal GUIStyle GUIStyleBoldLabelMiddleCenterWhite
        {
            get
            {
                if (guiStyleBoldLabelMiddleCenter == null)
                {
                    guiStyleBoldLabelMiddleCenter = new GUIStyle(EditorStyles.boldLabel);
                    guiStyleBoldLabelMiddleCenter.alignment = TextAnchor.MiddleCenter;
                    guiStyleBoldLabelMiddleCenter.normal.textColor = Color.white * 0.9f;
                }

                return guiStyleBoldLabelMiddleCenter;
            }
        }
        static GUIStyle miniBoldLabelCenter;
        static internal GUIStyle MiniBoldLabelCenter
        {
            get
            {
                if (miniBoldLabelCenter == null)
                {
                    miniBoldLabelCenter = new GUIStyle(EditorStyles.miniBoldLabel);
                    miniBoldLabelCenter.alignment = TextAnchor.MiddleCenter;
                }

                return miniBoldLabelCenter;
            }
        }

        static GUIStyle guiSeparator;
        static internal GUIStyle GUISeparator
        {
            get
            {
                if (guiSeparator == null)
                {
                    guiSeparator = new GUIStyle("sv_iconselector_sep");
                }

                return guiSeparator;
            }
        }
        static GUIStyle guiMeshIndexFormat;
        static internal GUIStyle GUIMeshIndexFormat
        {
            get
            {
                if (guiMeshIndexFormat == null)
                {
                    guiMeshIndexFormat = new GUIStyle(EditorStyles.centeredGreyMiniLabel);

                    if (UnityEditor.EditorGUIUtility.isProSkin)
                        guiMeshIndexFormat.normal.textColor = Color.black;
                }
                if (guiMeshIndexFormat.normal.background == null)
                {
                    guiMeshIndexFormat.normal.background = new Texture2D(1, 1);
                    guiMeshIndexFormat.normal.background.SetPixels(new Color[] { Color.yellow * (UnityEditor.EditorGUIUtility.isProSkin ? 0.85f : 1) });
                    guiMeshIndexFormat.normal.background.Apply();
                }

                return guiMeshIndexFormat;
            }
        }
        static GUIStyle guiStyleMiniLabel;
        static internal GUIStyle GUIStyleMiniLabel
        {
            get
            {
                if (guiStyleMiniLabel == null)
                {
                    guiStyleMiniLabel = new GUIStyle(EditorStyles.centeredGreyMiniLabel);

                    if (UnityEditor.EditorGUIUtility.isProSkin)
                        guiStyleMiniLabel.normal.textColor = new Color(1, 1, 1, 0.6f);
                    else
                        guiStyleMiniLabel.normal.textColor = new Color(0, 0, 0, 0.6f);
                }

                return guiStyleMiniLabel;
            }
        }
        static GUIStyle guiStyleToolbarMiniLabel;
        static internal GUIStyle GUIStyleToolbarMiniLabel
        {
            get
            {
                if (guiStyleToolbarMiniLabel == null)
                {
                    guiStyleToolbarMiniLabel = new GUIStyle(EditorStyles.toolbarButton);
                    guiStyleToolbarMiniLabel.alignment = TextAnchor.MiddleCenter;
                    guiStyleToolbarMiniLabel.fontSize = 10;

                    if (UnityEditor.EditorGUIUtility.isProSkin)
                        guiStyleToolbarMiniLabel.normal.textColor = new Color(1, 1, 1, 0.6f);
                    else
                        guiStyleToolbarMiniLabel.normal.textColor = new Color(0, 0, 0, 0.6f);
                }

                return guiStyleToolbarMiniLabel;
            }
        }
        static GUIStyle guiStyleToolbarMiniLabelBold;
        static internal GUIStyle GUIStyleToolbarMiniLabelBold
        {
            get
            {
                if (guiStyleToolbarMiniLabelBold == null)
                {
                    guiStyleToolbarMiniLabelBold = new GUIStyle(EditorStyles.toolbarButton);
                    guiStyleToolbarMiniLabelBold.alignment = TextAnchor.MiddleCenter;
                    guiStyleToolbarMiniLabelBold.fontStyle = FontStyle.Bold;
                    guiStyleToolbarMiniLabelBold.fontSize = 10;

                    if (UnityEditor.EditorGUIUtility.isProSkin)
                        guiStyleToolbarMiniLabelBold.normal.textColor = new Color(1, 1, 1, 0.6f);
                    else
                        guiStyleToolbarMiniLabelBold.normal.textColor = new Color(0, 0, 0, 0.6f);
                }

                return guiStyleToolbarMiniLabelBold;
            }
        }




        static Texture2D iconManual;
        static internal Texture2D IconManual
        {
            get
            {
                return LoadTexture(ref iconManual, false, ref iconManual, "IconManual");
            }
        }
        static Texture2D iconForum;
        static internal Texture2D IconForum
        {
            get
            {
                return LoadTexture(ref iconForum, false, ref iconForum, "IconForum");
            }
        }
        static Texture2D iconSupport;
        static internal Texture2D IconSupport
        {
            get
            {
                return LoadTexture(ref iconSupport, false, ref iconSupport, "IconSupport");
            }
        }
        static Texture2D iconRate;
        static internal Texture2D IconRate
        {
            get
            {
                return LoadTexture(ref iconRate, false, ref iconRate, "IconRate");
            }
        }
        static Texture2D iconMore;
        static internal Texture2D IconMore
        {
            get
            {
                return LoadTexture(ref iconMore, false, ref iconMore, "IconMore");
            }
        }


        static Texture2D iconNone_Free;
        static Texture2D iconNone_Pro;
        static internal Texture2D IconNone
        {
            get
            {
                return LoadTexture(ref iconNone_Free, true, ref iconNone_Pro, "IconNone");
            }
        }

        static Texture2D iconFolder_Free;
        static Texture2D iconFolder_Pro;
        static internal Texture2D IconFolder
        {
            get
            {
                return LoadTexture(ref iconFolder_Free, true, ref iconFolder_Pro, "IconFolder");
            }
        }

        static Texture2D iconFont_Free = null;
        static Texture2D iconFont_Pro = null;
        static internal Texture2D IconFont
        {
            get
            {
                return LoadTexture(ref iconFont_Free, true, ref iconFont_Pro, "IconFont");
            }
        }


        static Texture2D iconWireframe;
        static internal Texture2D IconWireframe
        {
            get
            {
                return LoadTexture(ref iconWireframe, false, ref iconWireframe, "IconWireframe");
            }
        }
        static Texture2D iconDistanceFade;
        static internal Texture2D IconDistanceFade
        {
            get
            {
                return LoadTexture(ref iconDistanceFade, false, ref iconDistanceFade, "IconDistance");
            }
        }
        static Texture2D iconMaskPlane;
        static internal Texture2D IconMaskPlane
        {
            get
            {
                return LoadTexture(ref iconMaskPlane, false, ref iconMaskPlane, "IconPlane");
            }
        }
        static Texture2D iconMaskSphere;
        static internal Texture2D IconMaskSphere
        {
            get
            {
                return LoadTexture(ref iconMaskSphere, false, ref iconMaskSphere, "IconSphere");
            }
        }
        static Texture2D iconMaskBox;
        static internal Texture2D IconMaskBox
        {
            get
            {
                return LoadTexture(ref iconMaskBox, false, ref iconMaskBox, "IconBox");
            }
        }


        static Texture2D iconInfo;
        static internal Texture2D IconInfo
        {
            get
            {
                return LoadTexture(ref iconInfo, false, ref iconInfo, "IconInfo");
            }
        }
        static Texture2D iconYes;
        static internal Texture2D IconYes
        {
            get
            {
                return LoadTexture(ref iconYes, false, ref iconYes, "IconYes");
            }
        }
        static Texture2D iconYesDisabled;
        static internal Texture2D IconYesDisabled
        {
            get
            {
                return LoadTexture(ref iconYesDisabled, false, ref iconYesDisabled, "IconYesDisabled");
            }
        }
        static Texture2D iconNo;
        static internal Texture2D IconNo
        {
            get
            {
                return LoadTexture(ref iconNo, false, ref iconNo, "IconNo");
            }
        }
        static Texture2D iconWarning;
        static internal Texture2D IconWarning
        {
            get
            {
                return LoadTexture(ref iconWarning, false, ref iconWarning, "IconWarning");
            }
        }
        static Texture2D iconError;
        static internal Texture2D IconError
        {
            get
            {
                return LoadTexture(ref iconError, false, ref iconError, "IconError");
            }
        }
        static Texture2D iconHierarchy_Free;
        static Texture2D iconHierarchy_Pro;
        static internal Texture2D IconHierarchy
        {
            get
            {
                return LoadTexture(ref iconHierarchy_Free, true, ref iconHierarchy_Pro, "IconHierarchy");
            }
        }



        static Texture2D LoadTexture(ref Texture2D free, bool needPro, ref Texture2D pro, string textureName, TextureWrapMode wrapMode = TextureWrapMode.Clamp)
        {
            if (needPro)
            {
                if (free == null)
                {
                    free = (Texture2D)AssetDatabase.LoadAssetAtPath(Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Editor", "Icons", $"{textureName}_Free.png"), typeof(Texture2D));
                    free.wrapMode = wrapMode;
                }

                if (pro == null)
                {
                    pro = (Texture2D)AssetDatabase.LoadAssetAtPath(Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Editor", "Icons", $"{textureName}_Pro.png"), typeof(Texture2D));
                    pro.wrapMode = wrapMode;
                }

                return UnityEditor.EditorGUIUtility.isProSkin ? pro : free;
            }
            else
            {
                if (free == null)
                {
                    free = (Texture2D)AssetDatabase.LoadAssetAtPath(Path.Combine(EditorUtilities.GetThisAssetProjectPath(), "Editor", "Icons", textureName + ".png"), typeof(Texture2D));
                    free.wrapMode = wrapMode;
                }

                return free;
            }
        }
    }
}
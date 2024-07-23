using UnityEditor;
using budu;

public class BDShaderGUI : ShaderGUI
{
    public static void MiscGUI(MaterialEditor materialEditor, MaterialProperty[] properties, BD_Misc_GUI propertyNames)
    {
        if(propertyNames.Invert != "")
        {
            MaterialProperty soInvert = ShaderGUI.FindProperty(propertyNames.Invert, properties);
            materialEditor.ShaderProperty(soInvert, "Invert");
        }
        if(propertyNames.Intensity != "")
        {
            MaterialProperty soIntensity = ShaderGUI.FindProperty(propertyNames.Intensity, properties);
            materialEditor.ShaderProperty(soIntensity, "Intensity");
        }
        if(propertyNames.Contrast != "")
        {
            MaterialProperty soContrast = ShaderGUI.FindProperty(propertyNames.Contrast, properties);
            materialEditor.ShaderProperty(soContrast, "Contrast");
        }
    }

    public static void ScaleOffsetGUI(MaterialEditor materialEditor, MaterialProperty[] properties, BD_ScaleOffset_GUI propertyNames)
    {
        EditorGUI.indentLevel++;
        {
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                if(propertyNames.Tile.x !="")
                {
                    MaterialProperty soTileX = ShaderGUI.FindProperty(propertyNames.Tile.x, properties);
                    materialEditor.FloatProperty(soTileX, "Tile X");
                }
                if (propertyNames.Tile.y != "")
                {
                    MaterialProperty soTileY = ShaderGUI.FindProperty(propertyNames.Tile.y, properties);
                    materialEditor.FloatProperty(soTileY, "Tile Y");
                }
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                if (propertyNames.Offset.x !="")
                {
                    MaterialProperty soOffsetX = ShaderGUI.FindProperty(propertyNames.Offset.x, properties);
                    materialEditor.FloatProperty(soOffsetX, "Offset X");
                }
                if(propertyNames.Offset.y != "")
                {
                    MaterialProperty soOffsetY = ShaderGUI.FindProperty(propertyNames.Offset.y, properties);
                    materialEditor.FloatProperty(soOffsetY, "Offset Y");
                }
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                if (propertyNames.Speed.x !="")
                {
                    MaterialProperty soSpeedX = ShaderGUI.FindProperty(propertyNames.Speed.x, properties);
                    materialEditor.FloatProperty(soSpeedX, "Speed X");
                }
                if (propertyNames.Speed.y != "")
                {
                    MaterialProperty soSpeedY = ShaderGUI.FindProperty(propertyNames.Speed.y, properties);
                    materialEditor.FloatProperty(soSpeedY, "Speed Y");
                }
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                if(propertyNames.OverallSpeed != "")
                {
                    MaterialProperty soSpeed = ShaderGUI.FindProperty(propertyNames.OverallSpeed, properties);
                    materialEditor.ShaderProperty(soSpeed, "Overall Speed");
                }
                if(propertyNames.RotateSpeed != "")
                {
                    MaterialProperty soRotateSpeed = ShaderGUI.FindProperty(propertyNames.RotateSpeed, properties);
                    materialEditor.ShaderProperty(soRotateSpeed, "Rotate Speed");
                }
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            if(propertyNames.Rotate != "")
            {
                MaterialProperty soRotate = ShaderGUI.FindProperty(propertyNames.Rotate, properties);
                materialEditor.ShaderProperty(soRotate, "Rotate");
            }
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                if(propertyNames.Anchor.x != "")
                {
                    MaterialProperty soAnchorX = ShaderGUI.FindProperty(propertyNames.Anchor.x, properties);
                    materialEditor.FloatProperty(soAnchorX, "Pivot X");
                }
                if(propertyNames.Anchor.y != "")
                {
                    MaterialProperty soAnchorY = ShaderGUI.FindProperty(propertyNames.Anchor.y, properties);
                    materialEditor.FloatProperty(soAnchorY, "Pivot Y");
                }
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
        }
        EditorGUI.indentLevel--;
    }

    public static void NoiseSelectGUI(MaterialEditor materialEditor, MaterialProperty[] properties, BD_NoiseTypes_GUI propertyNames)
    {
        MaterialProperty ntType = ShaderGUI.FindProperty(propertyNames.NoiseType, properties);
        materialEditor.ShaderProperty(ntType, "Noise Type");
        if((int)ntType.floatValue > 0)
        {

            MaterialProperty ntVCell = ShaderGUI.FindProperty(propertyNames.VorCellOct, properties);
            MaterialProperty ntVCaus = ShaderGUI.FindProperty(propertyNames.VorCaustOct, properties);
            MaterialProperty ntTMap = ShaderGUI.FindProperty(propertyNames.TextureMap, properties);
            MaterialProperty ntScale = ShaderGUI.FindProperty(propertyNames.NoiseScale, properties);
            MaterialProperty ntSmooth = ShaderGUI.FindProperty(propertyNames.NoiseSmooth, properties);
            MaterialProperty ntAngle = ShaderGUI.FindProperty(propertyNames.NoiseAngle, properties);

            switch((int)ntType.floatValue)
            {
                case 0:
                    break;
                case 1:
                    materialEditor.ShaderProperty(ntVCell, "Cell Octave");
                    materialEditor.ShaderProperty(ntScale, "Cell Scale");
                    materialEditor.ShaderProperty(ntAngle, "Cell Angle");
                    materialEditor.ShaderProperty(ntSmooth, "Cell Smooth");
                    break;
                case 2:
                    materialEditor.ShaderProperty(ntVCaus, "Caustic Octave");
                    materialEditor.ShaderProperty(ntScale, "Caustic Scale");
                    materialEditor.ShaderProperty(ntAngle, "Caustic Angle");
                    break;
                case 3:
                    // Perlin Noise
                    materialEditor.ShaderProperty(ntScale, "Perlin Scale");
                    break;
                case 4:
                    // Texture Map
                    materialEditor.ShaderProperty(ntTMap, "Deformation Map");
                    break;
            }
        }
    }
}

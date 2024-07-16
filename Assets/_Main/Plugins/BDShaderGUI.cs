using UnityEditor;
using budu;

public class BDShaderGUI : ShaderGUI
{
    public static void ScaleOffsetGUI(MaterialEditor materialEditor, MaterialProperty[] properties, BD_ScaleOffset_GUI propertyNames)
    {
        MaterialProperty soInvert = ShaderGUI.FindProperty(propertyNames.Invert, properties);
        MaterialProperty soIntensity = ShaderGUI.FindProperty(propertyNames.Intensity, properties);
        MaterialProperty soContrast = ShaderGUI.FindProperty(propertyNames.Contrast, properties);
        MaterialProperty soTileX = ShaderGUI.FindProperty(propertyNames.Tile.x, properties);
        MaterialProperty soTileY = ShaderGUI.FindProperty(propertyNames.Tile.y, properties);
        MaterialProperty soOffsetX = ShaderGUI.FindProperty(propertyNames.Offset.x, properties);
        MaterialProperty soOffsetY = ShaderGUI.FindProperty(propertyNames.Offset.y, properties);
        MaterialProperty soSpeedX = ShaderGUI.FindProperty(propertyNames.Speed.x, properties);
        MaterialProperty soSpeedY = ShaderGUI.FindProperty(propertyNames.Speed.y, properties);
        MaterialProperty soSpeed = ShaderGUI.FindProperty(propertyNames.OverallSpeed, properties);
        MaterialProperty soAnchorX = ShaderGUI.FindProperty(propertyNames.Anchor.x, properties);
        MaterialProperty soAnchorY = ShaderGUI.FindProperty(propertyNames.Anchor.y, properties);
        MaterialProperty soRotate = ShaderGUI.FindProperty(propertyNames.Rotate, properties);
        MaterialProperty soRotateSpeed = ShaderGUI.FindProperty(propertyNames.RotateSpeed, properties);

        materialEditor.ShaderProperty(soInvert, "Invert");
        materialEditor.ShaderProperty(soIntensity, "Intensity");
        materialEditor.ShaderProperty(soContrast, "Contrast");

        EditorGUI.indentLevel++;
        {
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                materialEditor.FloatProperty(soTileX, "Tile X");
                materialEditor.FloatProperty(soTileY, "Tile Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                materialEditor.FloatProperty(soOffsetX, "Offset X");
                materialEditor.FloatProperty(soOffsetY, "Offset Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                materialEditor.FloatProperty(soSpeedX, "Speeed X");
                materialEditor.FloatProperty(soSpeedY, "Speed Y");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                materialEditor.ShaderProperty(soSpeed, "Overall Speed");
                materialEditor.ShaderProperty(soRotateSpeed, "Rotate Speed");
                EditorGUIUtility.labelWidth = 0;
                EditorGUIUtility.fieldWidth = 0;
            }
            EditorGUILayout.EndHorizontal();
            materialEditor.ShaderProperty(soRotate, "Rotate");
            EditorGUILayout.BeginHorizontal();
            {
                EditorGUIUtility.labelWidth = 170;
                EditorGUIUtility.fieldWidth = 30;
                materialEditor.FloatProperty(soAnchorX, "Pivot X");
                materialEditor.FloatProperty(soAnchorY, "Pivot Y");
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

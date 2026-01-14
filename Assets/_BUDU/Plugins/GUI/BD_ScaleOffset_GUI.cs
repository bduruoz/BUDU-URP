namespace budu
{
    public struct BD_Misc_GUI
    {
        public string Invert;
        public string Intensity;
        public string Contrast;
    }

    public struct BD_ScaleOffset_GUI 
    {
        public Vector2Str Tile;
        public Vector2Str Offset;
        public Vector2Str Speed;
        public Vector2Str Anchor;
        public string OverallSpeed;
        public string Rotate;
        public string RotateSpeed;
    }

    public struct Vector2Str
    {
        public string x;
        public string y;
    }

    public struct BD_NoiseTypes_GUI
    {
        public string NoiseType;
        public string VorCellOct;
        public string VorCaustOct;
        public string TextureMap;
        public string NoiseAngle;
        public string NoiseSmooth;
        public string NoiseScale;
    }
}

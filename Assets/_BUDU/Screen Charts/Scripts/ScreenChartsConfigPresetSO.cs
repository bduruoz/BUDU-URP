// © BUDU Games 2024 - 2026

#if UNITY_EDITOR
using UnityEngine;

// Simple SO wrapper that stores a Snapshot for inspector and asset usage.
public class ScreenChartsConfigPresetSO : ScriptableObject
{
    public ScreenChartsConfig.Snapshot snapshot;
}
#endif

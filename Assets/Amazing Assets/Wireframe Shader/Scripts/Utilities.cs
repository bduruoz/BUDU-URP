// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using UnityEngine;


namespace AmazingAssets.WireframeShader
{
    static public class Utilities
    {      
        static public Enum.RenderPipeline GetCurrentRenderPipeline()
        {
#if UNITY_6000_0_OR_NEWER
            if (UnityEngine.Rendering.GraphicsSettings.defaultRenderPipeline == null && UnityEngine.QualitySettings.renderPipeline == null)
                return Enum.RenderPipeline.Builtin;
            else
            {
                string sType = UnityEngine.Rendering.GraphicsSettings.defaultRenderPipeline == null ? UnityEngine.QualitySettings.renderPipeline.GetType().ToString() :
                                                                                                      UnityEngine.Rendering.GraphicsSettings.defaultRenderPipeline.GetType().ToString();
#else
            if (UnityEngine.Rendering.GraphicsSettings.renderPipelineAsset == null && UnityEngine.QualitySettings.renderPipeline == null)
                return Enum.RenderPipeline.Builtin;
            else
            {
                string sType = UnityEngine.Rendering.GraphicsSettings.renderPipelineAsset == null ? UnityEngine.QualitySettings.renderPipeline.GetType().ToString() :
                                                                                                    UnityEngine.Rendering.GraphicsSettings.renderPipelineAsset.GetType().ToString();
#endif

                if (sType.Contains("UnityEngine.Rendering.Universal."))
                    return Enum.RenderPipeline.Universal;

                else if (sType.Contains("UnityEngine.Rendering.HighDefinition."))
                    return Enum.RenderPipeline.HighDefinition;


                return Enum.RenderPipeline.Unknow;
            }
        }

        static public void Log(string message)
        {
            Log(LogType.Log, message, null, null);
        }
        static public void Log(LogType logType, string message)
        {
            Log(logType, message, null, null);
        }
        static public void Log(LogType logType, string message, System.Exception exception, UnityEngine.Object context = null)
        {
            message = "[Wireframe Shader] " + message;

            StackTraceLogType save = Application.GetStackTraceLogType(logType);
            Application.SetStackTraceLogType(logType, StackTraceLogType.None);

            switch (logType)
            {
                case LogType.Assert:
                    {
                        if (context == null)
                            UnityEngine.Debug.LogAssertion(message);
                        else
                            UnityEngine.Debug.LogAssertion(message, context);

                    }
                    break;

                case LogType.Error:
                    {
                        if (context == null)
                            UnityEngine.Debug.LogError(message);
                        else
                            UnityEngine.Debug.LogError(message, context);
                    }
                    break;

                case LogType.Exception:
                    {
                        if (context == null)
                            UnityEngine.Debug.LogException(exception);
                        else
                            UnityEngine.Debug.LogException(exception, context);
                    }
                    break;

                case LogType.Log:
                    {
                        if (context == null)
                            UnityEngine.Debug.Log(message);
                        else
                            UnityEngine.Debug.Log(message, context);

                    }
                    break;

                case LogType.Warning:
                    {
                        if (context == null)
                            UnityEngine.Debug.LogWarning(message);
                        else
                            UnityEngine.Debug.LogWarning(message, context);

                    }
                    break;
            }

            Application.SetStackTraceLogType(logType, save);
        }
    }
}

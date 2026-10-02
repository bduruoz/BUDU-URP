// © BUDU Games 2024 - 2026
// Effects

using UnityEngine;

namespace budu
{
    public class BUDUEffects
    {
        // Most Effective Blur Method
        public static float[,] ApplyGaussianBlurSeparable(float[,] data, int res, int radius, float sigma)
        {
            #region DEBUG: Parameters
            //Debug.Log($"Blur params - Radius: {radius}, Sigma: {sigma}, Res: {res}");
            #endregion

            float[,] temp = new float[res, res];
            float[,] result = new float[res, res];

            #region 1D Gaussian Kernel
            int size = radius * 2 + 1;
            float[] kernel = new float[size];
            float kernelSum = 0f;

            for (int i = -radius; i <= radius; i++)
            {
                float value = Mathf.Exp(-(i * i) / (2f * sigma * sigma));
                kernel[i + radius] = value;
                kernelSum += value;
            }
            #endregion
            #region DEBUG: Control Kernel Values
            //Debug.Log($"Kernel sum before normalization: {kernelSum}");
            //string kernelValuesBefore = "Kernel before: ";
            //for (int i = 0; i < size; i++)
            //{
            //    kernelValuesBefore += $"{kernel[i]:F4} ";
            //}
            //Debug.Log(kernelValuesBefore);
            #endregion
            #region Normalize
            float normalizedSum = 0f;
            for (int i = 0; i < size; i++)
            {
                kernel[i] /= kernelSum;
                normalizedSum += kernel[i];
            }
            #endregion
            #region DEBUG: Control Kernel after Normalize
            //Debug.Log($"Kernel sum after normalization: {normalizedSum}");
            //string kernelValuesAfter = "Kernel after: ";
            //for (int i = 0; i < size; i++)
            //{
            //    kernelValuesAfter += $"{kernel[i]:F4} ";
            //}
            //Debug.Log(kernelValuesAfter);
            #endregion
            #region Horizontal Blur
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int kx = -radius; kx <= radius; kx++)
                    {
                        int px = Mathf.Clamp(x + kx, 0, res - 1);
                        val += data[px, y] * kernel[kx + radius];
                    }
                    temp[x, y] = val;
                }
            }
            #endregion
            #region Vertical Blur
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        int py = Mathf.Clamp(y + ky, 0, res - 1);
                        val += temp[x, py] * kernel[ky + radius];
                    }
                    result[x, y] = val;

                    #region DEBUG: Only at key points
                    //if ((x == res / 2 && y == res / 2) || (x == res / 4 && y == res / 4))
                    //{
                    //    Debug.Log($"Important point [{x},{y}] = {result[x, y]:F6}");
                    //}
                    #endregion
                }
            }
            #endregion
            #region Result Controls
            //float minResult = float.MaxValue, maxResult = float.MinValue;
            //for (int y = 0; y < res; y++)
            //{
            //    for (int x = 0; x < res; x++)
            //    {
            //        if (result[x, y] < minResult) minResult = result[x, y];
            //        if (result[x, y] > maxResult) maxResult = result[x, y];
            //    }
            //}
            //Debug.Log($"Result range: {minResult:F6} to {maxResult:F6}");
            #endregion
            #region Check the Edge Points after bluring
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        int py = Mathf.Clamp(y + ky, 0, res - 1);
                        val += temp[x, py] * kernel[ky + radius];
                    }
                    result[x, y] = val;

                    #region DEBUG: Check the edge points
                    //if (IsEdgePoint(data, x, y, res))
                    //{
                    //    Debug.Log($"EDGE point [{x},{y}] = {result[x, y]:F6} (was {data[x, y]})");
                    //}
                    #endregion
                }
            }
            #endregion

            return result;
        }
        bool IsEdgePoint(float[,] data, int x, int y, int res)
        {
            // Edge point control
            if (x <= 0 || x >= res - 1 || y <= 0 || y >= res - 1) return false;

            float center = data[x, y];

            // If the centre is 1 and one of the neighbours is 0, this is an edge point
            if (center > 0.5f && (
                data[x - 1, y] < 0.5f || data[x + 1, y] < 0.5f ||
                data[x, y - 1] < 0.5f || data[x, y + 1] < 0.5f))
            {
                return true;
            }

            // Or if the centre is 0 and one of the neighbours is 1
            if (center < 0.5f && (
                data[x - 1, y] > 0.5f || data[x + 1, y] > 0.5f ||
                data[x, y - 1] > 0.5f || data[x, y + 1] > 0.5f))
            {
                return true;
            }

            return false;
        }






        // Other methods
        public static float[,] ApplyAggressiveContrast(float[,] data, int res, float blackPoint = 0.1f)
        {
            float[,] result = new float[res, res];

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = data[x, y];

                    if (val < blackPoint)
                        result[x, y] = 0f;
                    else
                        result[x, y] = Mathf.Clamp01((val - blackPoint) / (1f - blackPoint));
                }
            }

            return result;
        }
        public static float[,] ApplyStrongGamma(float[,] data, int res, float gamma = 0.3f)
        {
            float[,] result = new float[res, res];

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = data[x, y];
 
                    result[x, y] = Mathf.Pow(val, gamma);
                }
            }

            return result;
        }
        public static float[,] ApplyContrastStretch(float[,] data, int res)
        {
            float minVal = float.MaxValue;
            float maxVal = float.MinValue;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = data[x, y];
                    if (val < minVal && val > 0.0001f) minVal = val;
                    if (val > maxVal) maxVal = val;
                }
            }

            Debug.Log($"Contrast stretch: {minVal:F6} to {maxVal:F6}");

            float[,] result = new float[res, res];
            float range = maxVal - minVal;

            if (range > 0.0001f)
            {
                for (int y = 0; y < res; y++)
                {
                    for (int x = 0; x < res; x++)
                    {
                        float val = data[x, y];
                        if (val > 0f)
                        {
                            result[x, y] = (val - minVal) / range;
                        }
                        else
                        {
                            result[x, y] = 0f;
                        }
                    }
                }
            }
            else
            {
                for (int y = 0; y < res; y++)
                    for (int x = 0; x < res; x++)
                        result[x, y] = data[x, y];
            }

            return result;
        }
        public static float[,] PreprocessBinaryMask(float[,] data, int res)
        {
            float[,] result = new float[res, res];

            // Eğer data zaten gradient ise değiştirme
            bool isBinary = true;
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (data[x, y] != 0f && data[x, y] != 1f)
                    {
                        isBinary = false;
                        break;
                    }
                }
                if (!isBinary) break;
            }

            if (!isBinary)
            {
                Debug.Log("Mask already has gradient values, no preprocessing needed");
                return data;
            }

            Debug.Log("Binary mask detected, converting to gradient...");

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    result[x, y] = data[x, y];
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurFloat(float[,] data, int res, int radius, float sigma)
        {
            float[,] result = new float[res, res];

            // Gaussian kernel hesapla
            int size = radius * 2 + 1;
            float[,] kernel = new float[size, size];
            float sum = 0f;

            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float value = Mathf.Exp(-(x * x + y * y) / (2f * sigma * sigma));
                    kernel[x + radius, y + radius] = value;
                    sum += value;
                }
            }

            // normalize
            for (int y = 0; y < size; y++)
                for (int x = 0; x < size; x++)
                    kernel[x, y] /= sum;

            // konvolüsyon
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int px = Mathf.Clamp(x + kx, 0, res - 1);
                            int py = Mathf.Clamp(y + ky, 0, res - 1);
                            val += data[px, py] * kernel[kx + radius, ky + radius];
                        }
                    }
                    result[x, y] = val;
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurFloat_NoNormalize(float[,] data, int res, int radius, float sigma)
        {
            float[,] result = new float[res, res];

            // Gaussian kernel hesapla
            int size = radius * 2 + 1;
            float[,] kernel = new float[size, size];
            float sum = 0f;

            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float value = Mathf.Exp(-(x * x + y * y) / (2f * sigma * sigma));
                    kernel[x + radius, y + radius] = value;
                    sum += value;
                }
            }

            // kernel normalize
            for (int y = 0; y < size; y++)
                for (int x = 0; x < size; x++)
                    kernel[x, y] /= sum;

            // konvolüsyon
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int px = Mathf.Clamp(x + kx, 0, res - 1);
                            int py = Mathf.Clamp(y + ky, 0, res - 1);
                            val += data[px, py] * kernel[kx + radius, ky + radius];
                        }
                    }
                    // burada normalize yok, direk sonucu ata
                    result[x, y] = val;
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurFloatSeparable(float[,] data, int res, int radius, float sigma)
        {
            float[,] temp = new float[res, res];
            float[,] result = new float[res, res];

            // 1D Gaussian kernel hesapla (normalize etmiyoruz)
            int size = radius * 2 + 1;
            float[] kernel = new float[size];
            for (int i = -radius; i <= radius; i++)
            {
                kernel[i + radius] = Mathf.Exp(-(i * i) / (2f * sigma * sigma));
            }

            // X yönünde blur
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int k = -radius; k <= radius; k++)
                    {
                        int px = Mathf.Clamp(x + k, 0, res - 1);
                        val += data[px, y] * kernel[k + radius];
                    }
                    temp[x, y] = val;
                }
            }

            // Y yönünde blur
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int k = -radius; k <= radius; k++)
                    {
                        int py = Mathf.Clamp(y + k, 0, res - 1);
                        val += temp[x, py] * kernel[k + radius];
                    }
                    result[x, y] = val;
                }
            }

            return result;
        }
        public static float[,] GaussianBlur(float[,] mask, int res, int radius, float sigma)
        {
            float[,] result = new float[res, res];

            // kernel
            int size = radius * 2 + 1;
            float[,] kernel = new float[size, size];
            float sum = 0f;

            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float v = Mathf.Exp(-(x * x + y * y) / (2 * sigma * sigma));
                    kernel[x + radius, y + radius] = v;
                    sum += v;
                }
            }

            // normalize kernel
            for (int y = 0; y < size; y++)
                for (int x = 0; x < size; x++)
                    kernel[x, y] /= sum;

            // konvolüsyon
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int px = Mathf.Clamp(x + kx, 0, res - 1);
                            int py = Mathf.Clamp(y + ky, 0, res - 1);
                            val += mask[px, py] * kernel[kx + radius, ky + radius];
                        }
                    }
                    result[x, y] = val; // CLAMP YOK
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurFloat2(float[,] data, int res, int radius, float sigma)
        {
            float[,] result = new float[res, res];

            // Gaussian kernel hesapla
            int size = radius * 2 + 1;
            float[,] kernel = new float[size, size];
            float kernelSum = 0f;

            // Kernel oluştur
            float sigmaSquared = 2f * sigma * sigma;
            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float value = Mathf.Exp(-(x * x + y * y) / sigmaSquared);
                    kernel[x + radius, y + radius] = value;
                    kernelSum += value;
                }
            }

            // Kernel'i normalize et
            for (int y = 0; y < size; y++)
            {
                for (int x = 0; x < size; x++)
                {
                    kernel[x, y] /= kernelSum;
                }
            }

            // Konvolüsyon uygula
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = 0f;

                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        int py = y + ky;
                        // Kenar kontrolü
                        if (py < 0 || py >= res) continue;

                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int px = x + kx;
                            // Kenar kontrolü
                            if (px < 0 || px >= res) continue;

                            val += data[px, py] * kernel[kx + radius, ky + radius];
                        }
                    }

                    result[x, y] = val;
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurWithContrast(float[,] data, int res, int radius, float sigma, float contrast = 1.0f)
        {
            float[,] blurred = ApplyGaussianBlurSeparable(data, res, radius, sigma);
            float[,] result = new float[res, res];

            // Kontrast uygula
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    // Orta nokta 0.5, kontrast uygula
                    result[x, y] = 0.5f + (blurred[x, y] - 0.5f) * contrast;
                }
            }

            return result;
        }
        public static float[,] ApplyGaussianBlurWithNormalization(float[,] data, int res, int radius, float sigma)
        {
            float[,] result = new float[res, res];

            // Önce mevcut datanın min-max değerlerini bul
            float minVal = float.MaxValue;
            float maxVal = float.MinValue;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (data[x, y] < minVal) minVal = data[x, y];
                    if (data[x, y] > maxVal) maxVal = data[x, y];
                }
            }

            Debug.Log($"Input range: {minVal} to {maxVal}");

            // Gaussian blur uygula
            result = ApplyGaussianBlurSeparable(data, res, radius, sigma);

            // Çıktı aralığını kontrol et
            minVal = float.MaxValue;
            maxVal = float.MinValue;
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    if (result[x, y] < minVal) minVal = result[x, y];
                    if (result[x, y] > maxVal) maxVal = result[x, y];
                }
            }

            Debug.Log($"Output range after blur: {minVal} to {maxVal}");

            return result;
        }
        public static float[,] ConvertBinaryToGradient(float[,] binaryData, int res, int blurRadius)
        {
            float[,] result = new float[res, res];

            // Binary mask'i kopyala
            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                    result[x, y] = binaryData[x, y];

            // Hemen blur uygula - bu binary'yi gradient'e dönüştürecek
            result = ApplyGaussianBlurSeparable(result, res, blurRadius, blurRadius / 2f);

            return result;
        }
        public static float[,] ApplyTrueGaussianBlur(float[,] data, int res, int radius, float sigma)
        {
            // Önce datayı 0-1 arasına normalize et (eğer değilse)
            float[,] normalizedData = new float[res, res];
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    normalizedData[x, y] = data[x, y] > 0.5f ? 1f : 0f;
                }
            }

            // Gaussian blur uygula
            float[,] blurred = ApplyGaussianBlurSeparable(normalizedData, res, radius, sigma);

            return blurred;
        }
        public static void DebugDataDistribution(float[,] data, int res, string label)
        {
            int[] bins = new int[10]; // 0-0.1, 0.1-0.2, ..., 0.9-1.0
            float minVal = float.MaxValue;
            float maxVal = float.MinValue;
            int totalPixels = res * res;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float val = data[x, y];
                    if (val < minVal) minVal = val;
                    if (val > maxVal) maxVal = val;

                    int bin = Mathf.Clamp((int)(val * 10), 0, 9);
                    bins[bin]++;
                }
            }

            Debug.Log($"=== {label} ===");
            Debug.Log($"Range: {minVal:F6} to {maxVal:F6}");

            for (int i = 0; i < bins.Length; i++)
            {
                float percentage = (float)bins[i] / totalPixels * 100f;
                Debug.Log($"Bin {i * 0.1f:F1}-{(i + 1) * 0.1f:F1}: {bins[i]} pixels ({percentage:F1}%)");
            }

            // Binary mi gradient mi kontrol et
            int binaryCount = bins[0] + bins[9]; // Sadece 0 ve 1 değerleri
            float binaryPercentage = (float)binaryCount / totalPixels * 100f;
            Debug.Log($"Binary content: {binaryPercentage:F1}% ({(binaryPercentage > 95f ? "BINARY" : "GRADIENT")})");
        }
        public static void SaveTexture(Texture2D texture, string name)
        {
            byte[] bytes = texture.EncodeToPNG();
            string path = Application.dataPath + "/" + name + ".png";
            System.IO.File.WriteAllBytes(path, bytes);
            Debug.Log("Texture saved: " + path);

#if UNITY_EDITOR
            UnityEditor.AssetDatabase.Refresh();
#endif
        }
        public static float[,] ApplyAdaptiveBlur(float[,] binaryData, int res, float blurAmount)
        {
            // Mask'in boyutuna göre blur radius hesapla
            int totalPixels = res * res;
            int whitePixels = 0;

            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                    if (binaryData[x, y] > 0.5f) whitePixels++;

            float coverage = (float)whitePixels / totalPixels;

            // Coverage'a göre blur radius ayarla
            int adaptiveRadius = Mathf.Clamp((int)(blurAmount * (1f - coverage) * 10f), 1, 50);
            float adaptiveSigma = adaptiveRadius / 2f;

            Debug.Log($"Adaptive blur: Coverage={coverage:P1}, Radius={adaptiveRadius}, Sigma={adaptiveSigma}");

            return ApplyGaussianBlurSeparable(binaryData, res, adaptiveRadius, adaptiveSigma);
        }

        /* testler
        void TestExtremeBlur()
        {
            float[,] testData = new float[64, 64];

            // Binary daire oluştur
            for (int y = 0; y < 64; y++)
            {
                for (int x = 0; x < 64; x++)
                {
                    float dist = Vector2.Distance(new Vector2(x, y), new Vector2(32, 32));
                    testData[x, y] = dist < 20 ? 1f : 0f;
                }
            }

            Debug.Log("=== EXTREME BLUR TEST ===");

            // Hiç blur uygulanmamış
            DebugDataDistribution(testData, 64, "NO BLUR");

            // Farklı blur seviyeleri
            float[,] blur1 = ApplyGaussianBlurSeparable(testData, 64, 5, 2.5f);
            DebugDataDistribution(blur1, 64, "BLUR 5px");

            float[,] blur2 = ApplyGaussianBlurSeparable(testData, 64, 15, 7.5f);
            DebugDataDistribution(blur2, 64, "BLUR 15px");

            float[,] blur3 = ApplyGaussianBlurSeparable(testData, 64, 30, 15f);
            DebugDataDistribution(blur3, 64, "BLUR 30px");

            // Manuel olarak gradient kontrol et
            Debug.Log("Center gradient:");
            for (int i = 15; i <= 25; i++)
            {
                Debug.Log($"  [{i},32] = {blur3[i, 32]:F6}");
            }
        }


        public static void TestCompletePipeline()
        {
            int testRes = 256;

            // 1. Manuel test texture oluştur
            Texture2D testTexture = CreateManualTestBlur(testRes);

            // 2. Extract et
            float[,] testData = new float[testRes, testRes];
            for (int y = 0; y < testRes; y++)
                for (int x = 0; x < testRes; x++)
                    testData[x, y] = testTexture.GetPixel(x, y).r;

            DebugDataDistribution(testData, testRes, "Manual Test Before Blur");

            // 3. BLUR UYGULA
            float[,] blurredData = ApplyGaussianBlurSeparable(testData, testRes, 20, 10f); // ÇOK GÜÇLÜ

            // 4. Sonucu kontrol et
            DebugDataDistribution(blurredData, testRes, "Manual Test After Blur");

            // 5. Görsel olarak kaydet
            Texture2D resultTex = new Texture2D(testRes, testRes);
            for (int y = 0; y < testRes; y++)
                for (int x = 0; x < testRes; x++)
                    resultTex.SetPixel(x, y, new Color(blurredData[x, y], blurredData[x, y], blurredData[x, y], 1f));

            resultTex.Apply();
            SaveTexture(resultTex, "ManualBlurTest");
        }
        Texture2D CreateManualTestBlur(int res)
        {
            Texture2D testTex = new Texture2D(res, res, TextureFormat.RGBA32, false);

            // ORTAYA BÜYÜK BEYAZ BİR DAİRE ÇİZ
            int center = res / 2;
            int radius = res / 4;

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float dist = Vector2.Distance(new Vector2(x, y), new Vector2(center, center));
                    float value = dist < radius ? 1f : 0f;
                    testTex.SetPixel(x, y, new Color(value, value, value, 1f));
                }
            }

            testTex.Apply();
            return testTex;
        }
        Texture2D ApplyGaussianBlur2Bit(Texture2D tex, int res, int radius = 1)
        {
            Color[] pixels = tex.GetPixels();
            Color[] result = new Color[pixels.Length];

            float sigma = radius / 2f;
            int size = radius * 2 + 1;
            float[] kernel = new float[size];
            float sum = 0;

            // 1D Gaussian kernel
            for (int i = 0; i < size; i++)
            {
                int x = i - radius;
                kernel[i] = Mathf.Exp(-(x * x) / (2 * sigma * sigma));
                sum += kernel[i];
            }
            for (int i = 0; i < size; i++) kernel[i] /= sum;

            // Horizontal pass
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    Color c = Color.black;
                    for (int k = -radius; k <= radius; k++)
                    {
                        int xx = Mathf.Clamp(x + k, 0, res - 1);
                        c += pixels[y * res + xx] * kernel[k + radius];
                    }
                    result[y * res + x] = c;
                }
            }

            // Vertical pass
            Color[] final = new Color[pixels.Length];
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    Color c = Color.black;
                    for (int k = -radius; k <= radius; k++)
                    {
                        int yy = Mathf.Clamp(y + k, 0, res - 1);
                        c += result[yy * res + x] * kernel[k + radius];
                    }
                    final[y * res + x] = c;
                }
            }

            tex.SetPixels(final);
            tex.Apply();
            return tex;
        }

        Texture2D ApplyProperGaussianBlur(Texture2D tex, int res, int radius = 2)
        {
            float[,] kernel = new float[radius * 2 + 1, radius * 2 + 1];
            float sigma = radius / 2f;
            float sum = 0f;

            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float val = Mathf.Exp(-(x * x + y * y) / (2f * sigma * sigma));
                    kernel[x + radius, y + radius] = val;
                    sum += val;
                }
            }

            for (int y = 0; y < radius * 2 + 1; y++)
                for (int x = 0; x < radius * 2 + 1; x++)
                    kernel[x, y] /= sum;

            Color[] pixels = tex.GetPixels();
            Color[] result = new Color[pixels.Length];

            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float c = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int xx = Mathf.Clamp(x + kx, 0, res - 1);
                            int yy = Mathf.Clamp(y + ky, 0, res - 1);
                            float pixelVal = pixels[yy * res + xx].r; // grayscale
                            c += pixelVal * kernel[kx + radius, ky + radius];
                        }
                    }
                    result[y * res + x] = new Color(c, c, c, 1f);
                }
            }

            tex.SetPixels(result);
            tex.Apply();
            return tex;
        }


        Texture2D ApplyGaussianBlur(Texture2D tex, int res, int radius = 3)
        {
            float[,] mask = ExtractMask(tex, res);
            float[,] temp = new float[res, res];
            float sigma = radius / 2f;
            float[,] kernel = new float[radius * 2 + 1, radius * 2 + 1];
            float sum = 0f;

            // kernel oluştur
            for (int y = -radius; y <= radius; y++)
            {
                for (int x = -radius; x <= radius; x++)
                {
                    float val = Mathf.Exp(-(x * x + y * y) / (2f * sigma * sigma));
                    kernel[x + radius, y + radius] = val;
                    sum += val;
                }
            }
            for (int y = 0; y < radius * 2 + 1; y++)
                for (int x = 0; x < radius * 2 + 1; x++)
                    kernel[x, y] /= sum;

            // convolution
            for (int y = 0; y < res; y++)
            {
                for (int x = 0; x < res; x++)
                {
                    float c = 0f;
                    for (int ky = -radius; ky <= radius; ky++)
                    {
                        for (int kx = -radius; kx <= radius; kx++)
                        {
                            int xx = Mathf.Clamp(x + kx, 0, res - 1);
                            int yy = Mathf.Clamp(y + ky, 0, res - 1);
                            c += mask[xx, yy] * kernel[kx + radius, ky + radius];
                        }
                    }
                    temp[x, y] = Mathf.Clamp01(c);
                }
            }

            // float array -> Texture2D
            for (int y = 0; y < res; y++)
                for (int x = 0; x < res; x++)
                    tex.SetPixel(x, y, new Color(temp[x, y], temp[x, y], temp[x, y], 1f));

            tex.Apply();
            return tex;
        }
        */
    }

}

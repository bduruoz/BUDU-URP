// Wireframe Shader <http://u3d.as/26T8>
// Copyright (c) Amazing Assets <https://amazingassets.world>

using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Diagnostics;
using System.Collections.Generic;
using System.Text.RegularExpressions;

using UnityEngine;
using UnityEditor;


namespace AmazingAssets.WireframeShader.Editor
{
    static internal class EditorUtilities
    {
        static string thisAssetPath = string.Empty;

        static public char[] invalidFileNameCharachters = Path.GetInvalidFileNameChars();



        static internal string GetThisAssetProjectPath()
        {
            if (string.IsNullOrEmpty(thisAssetPath))
            {
                string fileName = "AmazingAssets.WireframeShader.Editor";

                string[] assets = AssetDatabase.FindAssets(fileName, null);
                if (assets != null && assets.Length > 0)
                {
                    string currentFilePath = AssetDatabase.GUIDToAssetPath(assets[0]);
                    thisAssetPath = Path.GetDirectoryName(Path.GetDirectoryName(currentFilePath));
                }
                else
                {
                    Utilities.Log(LogType.Error, "Cannot detect 'This Asset' path.");
                }
            }
            return thisAssetPath;
        }

        static public string ConvertPathToProjectRelative(string path)
        {
            //Before using this method, make sure path 'is' project relative
            if (path.IndexOf("Assets") == 0)
                return path;
            else
                return NormalizePath("Assets" + path.Substring(Application.dataPath.Length));
        }
        static public bool IsPathProjectRelative(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
                return false;

            if (Directory.Exists(path) == false)
                return false;

            if (path.IndexOf("Assets") == 0)
                return true;


            return NormalizePath(path).Contains(NormalizePath(Application.dataPath));
        }
        static string NormalizePath(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
                return path;
            else
                return path.Replace("//", "/").Replace("\\\\", "/").Replace("\\", "/");
        }

        static public void DeleteTempDirectory()
        {
            if(Directory.Exists(AssetInfo.tempFolder))
                FileUtil.DeleteFileOrDirectory(AssetInfo.tempFolder);

            string metaFile = AssetInfo.tempFolder + ".meta";
            if (File.Exists(metaFile))
                File.Delete(metaFile);
        }
        static public string CopyTempFolderToDestination(string destinationPath)
        {
            string lastSavedFilePath = string.Empty;

            //Create all directories
            foreach (string dirPath in Directory.GetDirectories(AssetInfo.tempFolder, "*", SearchOption.AllDirectories))
                Directory.CreateDirectory(dirPath.Replace(AssetInfo.tempFolder, destinationPath));


            //Copy files (overwrite)
            string[] allFiles = Directory.GetFiles(AssetInfo.tempFolder, "*.*", SearchOption.AllDirectories);
            for (int c = 0; c < allFiles.Length; c++)
            {
                string destFileName = allFiles[c].Replace(AssetInfo.tempFolder, destinationPath);

                bool copyingDone;

                try
                {
                    FileUtil.ReplaceFile(allFiles[c], destFileName);
                    copyingDone = true;
                }
                catch
                {
                    copyingDone = false;
                }


                //If failed, try delete file and repeat copy
                if (copyingDone == false && File.Exists(destFileName))
                {
                    try
                    {
                        File.Delete(destFileName);

                        FileUtil.CopyFileOrDirectory(allFiles[c], destFileName);
                        copyingDone = true;
                    }
                    catch
                    {
                        Utilities.Log(LogType.Error, "Asset cannot be created at '" + destFileName + "'. Try other save location or rename source asset file.", null);
                        copyingDone = false;
                    }
                }

                if (copyingDone)
                    lastSavedFilePath = destFileName;

                //DisplayProgressBar
                UnityEditor.EditorUtility.DisplayProgressBar("Hold On", "Moving Files", (float)c / allFiles.Length);
            }


            DeleteTempDirectory();


            return lastSavedFilePath;
        }

        public static string PadNumbers(string input)
        {
            return Regex.Replace(input, "[0-9]+", match => match.Value.PadLeft(10, '0'));
        }
        internal static void ExportObjectInfoToPackage(UnityEngine.Object obj, string editorSettings, string exception)
        {
            if (obj == null)
            {
                Utilities.Log(LogType.Error, "Can not export package.", null);

                return;
            }

            UnityEditor.EditorUtility.DisplayProgressBar("Hold On", "Collecting Dependencies", 0);


            UnityEngine.Object[] dependences = UnityEditor.EditorUtility.CollectDependencies(new UnityEngine.Object[] { obj });
            if (dependences == null || dependences.Length == 0)
                return;


            List<string> assets = new List<string>();
            for (int i = 0; i < dependences.Length; i++)
            {
                assets.Add(AssetDatabase.GetAssetPath(dependences[i]));
            }

            //Add settings log
            string logFileEditorSettings = Path.Combine("Assets", AssetInfo.assetNameTrimmed + "EditorSettings.txt");
            assets.Add(logFileEditorSettings);

            AssetDatabase.CreateAsset(new TextAsset(editorSettings), logFileEditorSettings);

            string logFileUnitySystemInfo = Path.Combine("Assets", AssetInfo.assetNameTrimmed + "UnitySystemInfo.txt");
            assets.Add(logFileUnitySystemInfo);
            AssetDatabase.CreateAsset(new TextAsset(GetSystemInfo()), logFileUnitySystemInfo);

            string logFileException = Path.Combine("Assets", AssetInfo.assetNameTrimmed + "Exception.txt");
            assets.Add(logFileException);
            AssetDatabase.CreateAsset(new TextAsset(exception), logFileException);



            string savePath = Application.dataPath + "/../" + obj.name + ".unitypackage";

            Utilities.Log("Package has been created at '" + Path.GetFullPath(savePath) + "'");

            UnityEditor.EditorUtility.DisplayProgressBar("Hold On", "Exporting package", 0.5f);
            AssetDatabase.ExportPackage(assets.ToArray(), savePath, ExportPackageOptions.Default);


            //Delete log files
            AssetDatabase.DeleteAsset(logFileEditorSettings);
            AssetDatabase.DeleteAsset(logFileUnitySystemInfo);
            AssetDatabase.DeleteAsset(logFileException);


            UnityEditor.EditorUtility.ClearProgressBar();


            //Open folder and select file
            string argument = "/select, \"" + Path.GetFullPath(savePath) + "\"";
            System.Diagnostics.Process.Start("explorer.exe", argument);
        }
        static string GetSystemInfo()
        {
            List<string> info = new List<string>();

            info.Add($"{AssetInfo.assetName}: {AssetInfo.assetVersion}\n");
            info.Add($"Unity Version: {Application.unityVersion}\n");
            info.Add($"Render Pipeline: {(UnityEngine.QualitySettings.renderPipeline == null ? "Built-in" : UnityEngine.QualitySettings.renderPipeline.name)}\n");
            info.Add($"Color Space: {QualitySettings.activeColorSpace}\n");
            info.Add($"Built Target: {EditorUserBuildSettings.activeBuildTarget}\n");
            info.Add($"Project Path ({Application.dataPath.Length}): {Application.dataPath}\n");

            Type type = typeof(SystemInfo);
            MethodInfo[] methodInfo = type.GetMethods(BindingFlags.Public | BindingFlags.Static);
            foreach (var method in methodInfo)
            {
                if (method.Name.Contains("get_") && method.Name.Contains("deviceUniqueIdentifier") == false)
                    info.Add(method.Name.Replace("get_", string.Empty) + ": " + method.Invoke(null, null) + System.Environment.NewLine);
            }

            return string.Concat(info.ToArray());
        }

        static public void RemoveMissingScripts(GameObject gameObject)
        {
            if (gameObject == null)
                return;

            Transform[] transforms = gameObject.GetComponentsInChildren<Transform>(true);
            if (transforms != null && transforms.Length > 0)
            {
                for (int i = 0; i < transforms.Length; i++)
                {
                    if (transforms[i] != null && transforms[i].gameObject != null && GameObjectUtility.GetMonoBehavioursWithMissingScriptCount(transforms[i].gameObject) > 0)
                    {
                        GameObjectUtility.RemoveMonoBehavioursWithMissingScript(transforms[i].gameObject);
                    }
                }
            }
        }
        static public string RemoveInvalidCharacters(string name)
        {
            if (string.IsNullOrEmpty(name))
                return string.Empty;
            else
            {
                if (name.IndexOfAny(invalidFileNameCharachters) == -1)
                    return name;
                else
                    return string.Concat(name.Split(invalidFileNameCharachters, StringSplitOptions.RemoveEmptyEntries));
            }
        }
        static public bool ContainsInvalidFileNameCharacters(string name)
        {
            if (string.IsNullOrEmpty(name))
                return false;
            else
                return name.IndexOfAny(invalidFileNameCharachters) >= 0;
        }

        static public void SelectFile(string filePath)
        {
            if (System.IO.Path.IsPathRooted(filePath))
            {
                filePath = filePath.Replace("/", Path.DirectorySeparatorChar.ToString()).Replace("\\", Path.DirectorySeparatorChar.ToString());


                if (File.Exists(filePath))
                {
                    string args = string.Format("/e, /select, \"{0}\"", filePath);

                    System.Diagnostics.ProcessStartInfo info = new System.Diagnostics.ProcessStartInfo();
                    info.FileName = "explorer";
                    info.Arguments = args;
                    System.Diagnostics.Process.Start(info);
                }
            }
            else
            {
                PingObject(filePath);
            }
        }
        static public void OpenFolder(string folderPath)
        {
            if (string.IsNullOrEmpty(folderPath) == false && Directory.Exists(folderPath))
            {
                if (folderPath.StartsWith("Assets"))
                    folderPath = Path.Combine(Application.dataPath.Substring(0, Application.dataPath.LastIndexOf("Assets")), folderPath);

                Process.Start(folderPath);
            }
        }

        static public void PingObject(string assetPath)
        {
            // Load object
            UnityEngine.Object obj = AssetDatabase.LoadAssetAtPath(assetPath, typeof(UnityEngine.Object));


            if (obj == null)
            {
                assetPath = Path.GetDirectoryName(assetPath);
                obj = AssetDatabase.LoadAssetAtPath(assetPath, typeof(UnityEngine.Object));
            }


            if (obj != null)
                PingObject(obj);
        }
        static public void PingObject(UnityEngine.Object obj)
        {
            if (obj != null)
            {
                // Select the object in the project folder
                Selection.activeObject = obj;

                // Also flash the folder yellow to highlight it
                UnityEditor.EditorGUIUtility.PingObject(obj);
            }
        }

        static public void MakeMeshesReadable(GameObject gameObject)
        {
            MeshFilter[] meshFilters = gameObject.GetComponentsInChildren<MeshFilter>();
            if (meshFilters != null)
            {
                for (int i = 0; i < meshFilters.Length; i++)
                {
                    if (meshFilters[i] != null && meshFilters[i].sharedMesh != null)
                        MakeMeshReadable(meshFilters[i].sharedMesh);
                }
            }


            SkinnedMeshRenderer[] skinnedMeshRenderer = gameObject.GetComponentsInChildren<SkinnedMeshRenderer>();
            if (skinnedMeshRenderer != null)
            {
                for (int i = 0; i < skinnedMeshRenderer.Length; i++)
                {
                    if (skinnedMeshRenderer[i] != null && skinnedMeshRenderer[i].sharedMesh != null)
                        MakeMeshReadable(skinnedMeshRenderer[i].sharedMesh);
                }
            }
        }
        static public void MakeMeshReadable(Mesh mesh)
        {
            if (mesh == null || mesh.isReadable == true)
                return;

            string assetPath = AssetDatabase.GetAssetPath(mesh);
            if (string.IsNullOrEmpty(assetPath) == false)
            {
                ModelImporter modelImporter = AssetImporter.GetAtPath(assetPath) as ModelImporter;
                if (modelImporter != null)
                {
                    modelImporter.isReadable = true;
                    modelImporter.SaveAndReimport();
                }
            }
        }

        public static bool IsPackageInstalled(string packageId)
        {
            if (!File.Exists("Packages/manifest.json"))
                return false;

            string jsonText = File.ReadAllText("Packages/manifest.json");
            return jsonText.Contains(packageId);
        }
        public static bool IsFileInProject(string fileName, string extension)
        {
            return AssetDatabase.FindAssets(fileName, null).Select(c => AssetDatabase.GUIDToAssetPath(c)).Where(c => Path.GetExtension(c) == extension).Count() > 0;
        }
    }
}
using UnityEngine;

namespace ShaderGraphHotKey
{
    [System.Serializable]
    public struct CashNode
    {
        public string nodeName;
        public KeyCode nodePath;

        public CashNode(string nodeName, KeyCode nodePath)
        {
            this.nodeName = nodeName;
            this.nodePath = nodePath;
        }
    }
}

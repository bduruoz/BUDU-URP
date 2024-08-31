using System;
using System.Collections.Generic;
using UnityEngine;

//실수로 파일을 삭제했을 경우에만 활성화 해서 사용합니다.
//이름은 HotKeySettings로 생성하는 것을 권장합니다.
namespace ShaderGraphHotKey
{
    public class NodeManager : ScriptableObject
    {
        public List<CashNode> cashNodes = new List<CashNode>();

        [HideInInspector] public bool change = false;

        private string m_PreJson = string.Empty;

        private void OnValidate()
        {
            if (string.IsNullOrEmpty(m_PreJson))
            {
                m_PreJson = JsonUtility.ToJson(new JsonableListWrapper<CashNode>(cashNodes));
                return;
            }
            
            string curJson = JsonUtility.ToJson(new JsonableListWrapper<CashNode>(cashNodes));
            
            if (m_PreJson != curJson) 
                change = true;

            m_PreJson = JsonUtility.ToJson(new JsonableListWrapper<CashNode>(cashNodes));
        }
    }

    [Serializable]
    public class JsonableListWrapper<T>
    {
        public List<T> list;
        public JsonableListWrapper(List<T> list) => this.list = list;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Data;
using DayCareLib.Common.DAL;

namespace DayCareLib.Common
{
    public class State
    {
        string _id;
        string _name;

        public State()
            : this("", "")
        { }

        public State(string id, string name)
        {
            _id = id;
            _name = name;
        }

        public string ID
        {
            get { return _id; }
            set { _id = value; }
        }
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public string IdAndName
        {
            get { return _id + " - " + _name; }
        }
    }

    public sealed class StateService
    {
        private static HttpContext _httpContext = null;
        private static Cache _cache = null;

        static StateService()
        {
            if (HttpContext.Current != null)
            {
                _httpContext = HttpContext.Current;
                _cache = _httpContext.Cache;
            }
        }

        public static List<State> GetStates()
        {
            List<State> l = new List<State>();

            string currentCulture = "en-US";
            string cacheKey = "__States:" + currentCulture + "__";
            if (_cache != null && _cache[cacheKey] is List<State>)
            {
                l = _cache[cacheKey] as List<State>;
            }
            else
            {
                DataTable dt = StateData.GetStatesByCultureID(currentCulture);
                if (dt != null)
                {
                    foreach (DataRow dr in dt.Rows)
                        l.Add(new State(dr["Code"].ToString(), dr["State"].ToString()));
                }

                if (_cache != null)
                    _cache.Add(cacheKey, l, null, DateTime.Now.AddHours(1), TimeSpan.Zero, CacheItemPriority.Normal, null);
            }
            return l;
        }
    }
}

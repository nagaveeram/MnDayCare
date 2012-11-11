using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Common.CookieStorage
{
    public interface ICookieStorageService
    {
        void Set(string key, string value, string domain, string path);
        void Set(string key, string value, DateTime expires, string domain, string path);
        string Get(string key);
    }
}

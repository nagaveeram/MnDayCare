using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace DayCareLib.Common.CookieStorage
{
    public class CookieStorageService : ICookieStorageService
    {
        public void Set(string key, string value, string domain, string path)
        {
            HttpCookie cookie = new HttpCookie(key, value);

            if (!HttpContext.Current.Request.IsLocal && !string.IsNullOrEmpty(domain))
            {
                cookie.Domain = domain;
            }

            cookie.Path = path;

            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public void Set(string key, string value, DateTime expires, string domain, string path)
        {
            HttpCookie cookie = new HttpCookie(key, value);

            if (!HttpContext.Current.Request.IsLocal && !string.IsNullOrEmpty(domain))
                cookie.Domain = domain;

            if (!HttpContext.Current.Request.IsLocal)
                cookie.Expires = expires;

            cookie.Path = path;

            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public string Get(string key)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[key];

            if (cookie != null && cookie.Value != null)
                return cookie.Value;

            return "";
        }
    }
}

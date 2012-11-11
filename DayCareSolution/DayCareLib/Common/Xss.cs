using System;
using System.Collections.Generic;
using System.Linq;

namespace DayCareLib.Common
{
    public class Xss
    {
        public static string HtmlEncode(object input)
        {
            return HtmlEncode(input.ToString());
        }

        public static string HtmlEncode(string input)
        {
            return Microsoft.Security.Application.Encoder.HtmlEncode(input);
        }

        public static string HtmlAttributeEncode(object input)
        {
            return HtmlAttributeEncode(input.ToString());
        }

        public static string HtmlAttributeEncode(string input)
        {
            return Microsoft.Security.Application.Encoder.HtmlAttributeEncode(input);
        }

        public static string UrlEncode(object input)
        {
            return UrlEncode(input.ToString());
        }

        public static string UrlEncode(string input)
        {
            return Microsoft.Security.Application.Encoder.UrlEncode(input);
        }

        public static string GetSafeHtmlFragment(object input)
        {
            return GetSafeHtmlFragment(input.ToString());
        }

        public static string GetSafeHtmlFragment(string input)
        {
            return Microsoft.Security.Application.Sanitizer.GetSafeHtmlFragment(input);
        }

        public static string GetSafeHtml(object input)
        {
            return GetSafeHtml(input.ToString());
        }

        public static string GetSafeHtml(string input)
        {
            return Microsoft.Security.Application.Sanitizer.GetSafeHtml(input);
        }
    }
}

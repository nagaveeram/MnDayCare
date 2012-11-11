using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DayCareLib.Common
{
    public abstract class BaseMessages
    {
        private static string _sessionKey = "__CurrentMessage__";

        public static void SetCurrentMessage(string message)
        {
            HttpContext.Current.Session[_sessionKey] = message;
        }

        public static void SetCurrentMessage(string message, string style)
        {
            SetCurrentMessage("", message, style);
        }

        public static void SetCurrentMessage(string title, string message, string style)
        {
            if (style == "info")
                message = GetInfoMessageHtml(title, message);
            else if (style == "error")
                message = GetErrorMessageHtml(title, message);
            else if (style == "success")
                message = GetSuccessMessageHtml(title, message);

            SetCurrentMessage(message);
        }

        public static string GetCurrentMessage(bool clear)
        {
            string message = "";

            if (HttpContext.Current.Session[_sessionKey] != null)
            {
                message = HttpContext.Current.Session[_sessionKey].ToString();

                if (clear)
                    HttpContext.Current.Session[_sessionKey] = null;
            }

            return message;
        }

        public static string GetMessageByID(int msgID)
        {
            return "";
        }

        public static string GetErrorMessageHtml(string message)
        {
            return GetErrorMessageHtml("", message);
        }

        public static string GetErrorMessageHtml(string title, string message)
        {
            string html = "";
            if (message.Length > 0)
            {
                html += @"<div class=""errorBox"">";
                if (title != "")
                    html += string.Format("<h3>{0}</h3><span></span>", Xss.HtmlEncode(title));
                html += GetHtmlFormattedMessage(message);
                html += @"</div>";
            }
            return html;
        }

        public static string GetInfoMessageHtml(string message)
        {
            return GetInfoMessageHtml("", message);
        }

        public static string GetInfoMessageHtml(string title, string message)
        {
            string html = "";
            if (message.Length > 0)
            {
                html += @"<div class=""infoBox"">";
                if (title != "")
                    html += string.Format("<h3>{0}</h3><span></span>", Xss.HtmlEncode(title));
                html += GetHtmlFormattedMessage(message);
                html += @"</div>";
            }
            return html;
        }

        public static string GetSuccessMessageHtml(string message)
        {
            return GetSuccessMessageHtml("", message);
        }

        public static string GetSuccessMessageHtml(string title, string message)
        {
            string html = "";
            if (message.Length > 0)
            {
                html += @"<div class=""successBox"">";
                if (title != "")
                    html += string.Format("<h3>{0}</h3><span></span>", Xss.HtmlEncode(title));
                html += GetHtmlFormattedMessage(message);
                html += @"</div>";
            }
            return html;
        }

        private static string GetHtmlFormattedMessage(string rawMessage)
        {
            string html = "";
            if (!rawMessage.Contains("\r\n"))
                html = string.Format("<div class='message'>{0}</div>", rawMessage);
            else
            {
                rawMessage = rawMessage.Replace("\r\n", "^");
                List<string> messages = rawMessage.Split(new char[] { '^' }, StringSplitOptions.RemoveEmptyEntries).ToList();
                html += "<ul>";
                foreach (string message in messages)
                {
                    html += string.Format("<li>{0}</li>", message);
                }
                html += "</ul>";
            }
            return html;
        }
    }
}

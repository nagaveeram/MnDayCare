using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using DayCareLib.Common.CookieStorage;
using System.Collections.Specialized;
using CommonLib;
using System.Collections;
using System.Web.UI.WebControls;
using System.Linq;
using System.Drawing;
using System.IO;
using System.Xml.Serialization;
using System.Reflection;
using System.Data;


namespace DayCareLib.Common
{
    public sealed class Helpers
    {
        private static readonly ICookieStorageService _cookieStorageService = new CookieStorageService();

        private const string COOKIE_DOMAIN = ".mndaycare.com";
     

        #region SurferID
        public static string GetSurferID()
        {
            string surferID = _cookieStorageService.Get(Constants.CookieKeys.SurferID).ToUpper();

            // If cookie is not yet there, create it
            if (surferID == "")
                surferID = SetSurferID();
            
            return surferID;
        }

        private static string SetSurferID()
        {
            string surferID = Guid.NewGuid().ToString();
            surferID = surferID.Replace("{", "").Replace("}", "").Replace("-", "").ToUpper();

            // Store value in cookie called SurferID
            _cookieStorageService.Set(Constants.CookieKeys.SurferID, surferID, DateTime.Now.AddYears(10), COOKIE_DOMAIN, "/");

            return surferID;
        }
        #endregion

        #region Generic Lists
        public static List<T> CreateEmptyGenericList<T>(T example)
        {
            return new List<T>();
        }
        #endregion

        #region Enum
        public static string GetEnumDisplayText(string enumName)
        {
            string result = string.Empty;
            char[] letters = enumName.ToCharArray();
            foreach (char c in letters)
                if (c.ToString() != c.ToString().ToLower())
                    result += " " + c.ToString();
                else
                    result += c.ToString();
            return result;
        }

        public static void FillDropDownWithEnum(DropDownList list, Type enumType, string promptText, string promptValue)
        {
            if (list == null)
            {
                throw new ArgumentNullException("list");
            }

            if (enumType == null)
            {
                throw new ArgumentNullException("enumType");
            }

            if (!enumType.IsEnum)
            {
                throw new ArgumentException("enumType must be enum type");
            }

            // Always clear the list
            list.Items.Clear();
            
            string[] strArray = Enum.GetNames(enumType);
            foreach (string str2 in strArray)
            {
                int enumValue = (int)Enum.Parse(enumType, str2, true);
                ListItem ddlItem = new ListItem(GetEnumDisplayText(str2), enumValue.ToString());
                list.Items.Add(ddlItem);
            }

            if (promptText != "")
            {
                list.Items.Insert(0, new ListItem(promptText, promptValue));
            }
        }
        #endregion

        #region QueryString
        public static string GetQueryString(string name)
        {
            string result = string.Empty;
            if (HttpContext.Current != null && HttpContext.Current.Request.QueryString[name] != null)
                result = HttpContext.Current.Request.QueryString[name].ToString();
            return result;
        }

        public static int GetQueryStringInt(string name)
        {
            return GetQueryStringInt(name, 0);
        }

        public static int GetQueryStringInt(string name, int defaultValue)
        {
            string resultStr = GetQueryString(name).ToUpperInvariant();
            int result = 0;
            if (!Int32.TryParse(resultStr, out result))
                result = defaultValue;
            return result;
        }

        public static DateTime GetQueryStringDateTime(string name)
        {
            return GetQueryStringDateTime(name, Constants.Values.EmptyDate);
        }

        public static DateTime GetQueryStringDateTime(string name, DateTime defaultValue)
        {
            string resultStr = GetQueryString(name).ToUpperInvariant();
            DateTime result = defaultValue;
            if (!DateTime.TryParse(resultStr, out result))
                result = defaultValue;
            return result;
        }

        public static bool GetQueryStringBool(string name)
        {
            string resultStr = GetQueryString(name).ToUpperInvariant();
            return (resultStr == "YES" || resultStr == "TRUE" || resultStr == "Y" || resultStr == "1");
        }

        public static string AppendQueryStringParam(string url, string key, string value)
        {
            string urlWithParameters = url;

            // Append value only if the URL does not yet have it
            if (value != "" && urlWithParameters.ToLower().IndexOf(key.ToLower() + "=") == -1)
            {
                if (url.EndsWith("?"))
                    urlWithParameters = urlWithParameters.TrimEnd(new char[] { '?' });

                if (urlWithParameters.Contains("?"))
                    urlWithParameters += "&" + key;
                else
                    urlWithParameters += "?" + key;

                
                urlWithParameters += "=" + Xss.UrlEncode(value);
            }

            return urlWithParameters;
        }

        public static string PassUtmParametersToNextPage(string nextPage)
        {
            try
            {
                string sourceKey = "utm_source";
                string contentKey = "utm_content";
                string mediumKey = "utm_medium";
                string termKey = "utm_term";
                string campaignKey = "utm_campaign";

                // Get values that were passed to ec.aspx
                string source = Helpers.GetQueryString(sourceKey);
                string content = Helpers.GetQueryString(contentKey);
                string medium = Helpers.GetQueryString(mediumKey);
                string term = Helpers.GetQueryString(termKey);
                string campaign = Helpers.GetQueryString(campaignKey);

                // Append them to the next page if not there yet
                nextPage = AppendQueryStringParam(nextPage, sourceKey, source);
                nextPage = AppendQueryStringParam(nextPage, contentKey, content);
                nextPage = AppendQueryStringParam(nextPage, mediumKey, medium);
                nextPage = AppendQueryStringParam(nextPage, termKey, term);
                nextPage = AppendQueryStringParam(nextPage, campaignKey, campaign);
            }
            catch { }

            return nextPage;
        }

        public static bool IsSameDomain(string url1, string url2)
        {
            try
            {
                Uri uri1 = new Uri(url1);
                Uri uri2 = new Uri(url2);

                return (uri1.Host.ToLower() == uri2.Host.ToLower());
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region DataRow Conversions     
  
        public static int ConvertToInt(DataRow dr, string colName, int defaultValue = 0)
        {
            int value = defaultValue;
            try { value = Convert.ToInt32(dr[colName]); }
            catch { value = defaultValue; }
            return value;
        }

        public static string ConvertToString(DataRow dr, string colName, string defaultValue = "")
        {
            string value = defaultValue;
            try { value = dr[colName].ToString(); }
            catch { value = defaultValue; }
            return value;
        }

        public static decimal ConvertToDecimal(DataRow dr, string colName, decimal defaultValue = 0)
        {
            decimal value = defaultValue;
            try { value = Convert.ToDecimal(dr[colName]); }
            catch { value = defaultValue; }
            return value;
        }

        public static double ConvertToDouble(DataRow dr, string colName, double defaultValue = 0)
        {
            double value = defaultValue;
            try { value = Convert.ToDouble(dr[colName]); }
            catch { value = defaultValue; }
            return value;
        }

        public static DateTime ConvertToDateTime(DataRow dr, string colName, DateTime defaultValue)
        {
            DateTime value = defaultValue;
            try { value = Convert.ToDateTime(dr[colName]); }
            catch { value = defaultValue; }
            return value;
        }

        public static bool ConvertToBoolean(DataRow dr, string colName, bool defaultValue = false)
        {
            bool value = defaultValue;
            try { value = Convert.ToBoolean(dr[colName]); }
            catch { value = defaultValue; }
            return value;
        }

        public static DateTime ConvertToDateTime(DataRow dr, string colName)
        {
            DateTime value = Constants.Values.EmptyDate;
            try { value = Convert.ToDateTime(dr[colName]); }
            catch { value = Constants.Values.EmptyDate; }
            return value;
        }

        public static Guid ConvertToGuid(DataRow dr, string colName)
        {
            Guid guid = Guid.Empty;
            try { guid = new Guid(dr["AspnetUserID"].ToString()); }
            catch { guid = Guid.Empty; }
            return guid;
        }

        public static Guid ConvertToGuid(DataRow dr, string colName, Guid defaultValue)
        {
            Guid guid = defaultValue;
            try { guid = new Guid(dr["AspnetUserID"].ToString()); }
            catch { guid = defaultValue; }
            return guid;
        }
        #endregion

        #region Validations
        public static bool IsValidEmail(string email)
        {
            bool result = false;
            
            if (string.IsNullOrEmpty(email))
                return result;

            email = email.Trim();

            result = Regex.IsMatch(email, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

            return result;
        }

        public static bool IsValidEmailWithDisplayName(string email)
        {
            bool result = false;

            if (string.IsNullOrEmpty(email))
                return result;
            
            email = email.Trim();
            
            result = Regex.IsMatch(email, @"^[A-z0-9.]{3,}\s\<([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)\>$");
            
            return result;
        }

        public static bool IsValidPhone(string phone)
        {
            bool result = false;

            if (string.IsNullOrEmpty(phone))
                return result;

            phone = phone.Trim();

            result = Regex.IsMatch(phone, @"^[()\-0-9xX\.\s]{7,50}$");

            return result;
        }
        #endregion

        #region String Conversions
        public static string AddLikeWildCards(string s)
        {
            if (s.Trim() != "")
            {
                if (!s.StartsWith("%") && !s.StartsWith("http"))
                    s = "%" + s;
                if (!s.EndsWith("%"))
                    s = s + "%";
            }
            return s;
        }

        public static string CsvEscape(string s)
        {
            StringBuilder sb = new StringBuilder();
            bool needQuotes = false;
            foreach (char c in s.ToArray())
            {
                switch (c)
                {
                    case '"': sb.Append("\"\""); needQuotes = true; break;
                    case ' ': sb.Append(" "); needQuotes = true; break;
                    case ',': sb.Append(","); needQuotes = true; break;
                    case '\t': sb.Append(" "); needQuotes = true; break;
                    case '\n': sb.Append(" "); needQuotes = true; break;
                    default: sb.Append(c); break;
                }
            }
            if (needQuotes)
                return "\"" + sb.ToString() + "\"";
            else
                return sb.ToString();
        }

        public static string GetCsvFromList<T>(List<T> list, List<string> skipColumns)
        {
            StringBuilder sb = new StringBuilder();

            string delimiter = ",";

            // Get the properties for type T for the headers
            PropertyInfo[] propInfos = typeof(T).GetProperties();
            for (int i = 0; i <= propInfos.Length - 1; i++)
            {
                if (!skipColumns.Contains(propInfos[i].Name))
                {
                    sb.Append(Helpers.CsvEscape(propInfos[i].Name));

                    if (i < propInfos.Length - 1)
                        sb.Append(delimiter);
                }
            }

            sb.AppendLine();

            // Loop through the collection, then the properties and add the values
            for (int i = 0; i <= list.Count - 1; i++)
            {
                T item = list[i];
                for (int j = 0; j <= propInfos.Length - 1; j++)
                {
                    if (!skipColumns.Contains(propInfos[j].Name))
                    {
                        object o = item.GetType().GetProperty(propInfos[j].Name).GetValue(item, null);
                        if (o != null)
                        {
                            string value = o.ToString();
                            sb.Append(Helpers.CsvEscape(value));
                        }

                        if (j < propInfos.Length - 1)
                            sb.Append(delimiter);
                    }
                }

                sb.AppendLine();
            }

            return sb.ToString();
        }

        public static string GetCsvFromDataTable(DataTable dt)
        {
            var result = new StringBuilder();

            for (int i = 0; i < dt.Columns.Count; i++)
            {
                result.Append(dt.Columns[i].ColumnName);
                result.Append(i == dt.Columns.Count - 1 ? "\n" : ",");
            }

            foreach (DataRow row in dt.Rows)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    result.Append(row[i].ToString().Replace(",", " "));
                    result.Append(i == dt.Columns.Count - 1 ? "\n" : ",");
                }
            }

            return result.ToString();
        }
        #endregion
    
        #region Images Manipulation
        public static System.Drawing.Image ResizeImage(System.Drawing.Image imgToResize, float percent)
        {
            int sourceWidth = imgToResize.Width;
            int sourceHeight = imgToResize.Height;

            int destWidth = (int)(sourceWidth * percent);
            int destHeight = (int)(sourceHeight * percent);

            return ResizeImage(imgToResize, new Size(destWidth, destHeight));
        }

        public static System.Drawing.Image ResizeImage(System.Drawing.Image imgToResize, Size newSize)
        {
            Bitmap b = new Bitmap(newSize.Width, newSize.Height);
            Graphics g = Graphics.FromImage((System.Drawing.Image)b);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

            g.DrawImage(imgToResize, 0, 0, newSize.Width, newSize.Height);
            g.Dispose();

            return (System.Drawing.Image)b;
        }

        public static System.Drawing.Image ConvertByteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }

        public static byte[] ConvertImageToByteArray(System.Drawing.Image image)
        {
            byte[] imageBytes;
            ImageConverter converter = new ImageConverter();
            imageBytes = (byte[])converter.ConvertTo(image, typeof(byte[]));
            return imageBytes;
        }
        #endregion

        #region Serialization
        public static string SerializeToXml(object obj)
        {
            XmlSerializer serializer = new XmlSerializer(obj.GetType());

            using (StringWriter writer = new StringWriter())
            {
                serializer.Serialize(writer, obj);
                return writer.ToString();
            }
        }
        #endregion        

        #region Other Utilities

        private string AppendQueryStringParameter(string url, string key, string value)
        {
            Regex regex = new Regex("(^[^?]+)");
            string query = regex.Replace(url, "");
            string baseUrl = url;
            if (query != "")
                baseUrl = url.Replace(query, "");

            NameValueCollection nvc = HttpUtility.ParseQueryString(query);
            bool isParamExists = false;
            foreach (String name in nvc.Keys)
            {
                if (!string.IsNullOrEmpty(name) && name == key)
                {
                    isParamExists = true;
                    break;
                }
            }

            if (!isParamExists)
            {
                if (value != "")
                    nvc.Add(key, value);
            }
            else if (value == "")
                nvc.Remove(key);
            else
                nvc[key] = value;

            List<string> items = new List<string>();

            foreach (String name in nvc.Keys)
            {
                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(nvc[name]))
                    items.Add(String.Concat(name, "=", HttpUtility.UrlEncode(nvc[name])));
            }

            string newQuery = String.Join("&", items.ToArray());

            string newBaseUrl = baseUrl;
            if (newQuery != "" && !newBaseUrl.EndsWith("?"))
                newBaseUrl = baseUrl + "?";

            string newUrl = newBaseUrl + newQuery;
            return newUrl;
        }
        #endregion
    }
}

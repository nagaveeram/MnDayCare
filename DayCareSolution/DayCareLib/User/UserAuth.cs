using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using CommonLib;
using System.Net;
using System.IO;
using System.Collections.Specialized;
using DayCareLib.Common;
using DayCareLib.Common.CookieStorage;

namespace DayCareLib.User
{
    public class UserAuth
    {
        public class ValidateUserLoginResult
        {
            public Constants.Enumerators.LoginResult LoginResult;
            public Guid AspnetUserID;
            public string Username;

            public ValidateUserLoginResult()
            {
                LoginResult = Constants.Enumerators.LoginResult.UnknownError;
                AspnetUserID = Guid.Empty;
                Username = "";
            }
        }

        private static readonly ICookieStorageService _cookieStorageService = new CookieStorageService();

        public static string LoginUrl = "~/login.aspx";

        // Logout
        public static void Logout(bool doRedirect)
        {
            if (HttpContext.Current == null)
                return;

            UserSession.Current.Clear();
            FormsAuthentication.SignOut();
            HttpContext.Current.Session.Abandon();

            if (doRedirect)
                HttpContext.Current.Response.Redirect(LoginUrl + "?msgid=9");
        }

        // Login
        public static void Login(string username, string password, string enteredCaptcha, string nextPage, bool fromIframe, bool shouldRedirect)
        {
            if (HttpContext.Current == null)
                return;

            List<string> blockedIPs = GetBlockedIPs();
            Dictionary<string, string> blockedUserAgents = GetBlockedUserAgents();

            string ip = HttpContext.Current.Request.UserHostAddress ?? "";
            string userAgent = HttpContext.Current.Request.UserAgent ?? "";
            string surferID = Helpers.GetSurferID();
            string serverSideCaptcha = "";
            if (HttpContext.Current.Session["Captcha"] != null)
            {
                serverSideCaptcha = HttpContext.Current.Session["Captcha"].ToString();
            }

            // Empty username (password can be empty for not protected users)
            if (username == "")
                RedirectWrapper(fromIframe, LoginUrl + "?msgID=1", nextPage);
            else if (blockedIPs.Contains(HttpContext.Current.Request.UserHostAddress) || blockedUserAgents.ContainsKey(HttpContext.Current.Request.UserAgent))
                RedirectWrapper(fromIframe, LoginUrl + "?msgID=3", nextPage);

            // Get and validate CSR username
            string userData = "";
            
            ValidateUserLoginResult result = ValidateUserLogin(Membership.Provider.Name, username, password, enteredCaptcha, serverSideCaptcha, ip, userAgent, surferID);

            if (result.LoginResult == Constants.Enumerators.LoginResult.Success)
            {
                CreateFormsAuthenticationTicket(result.Username, nextPage, userData);
                if (shouldRedirect)
                    RedirectWrapper(fromIframe, nextPage);
            }
            else
            {
                if (result.LoginResult == Constants.Enumerators.LoginResult.UsernameInvalid)
                    RedirectWrapper(fromIframe, LoginUrl + "?msgID=1", nextPage);
                else if (result.LoginResult == Constants.Enumerators.LoginResult.NotApproved)
                    RedirectWrapper(fromIframe, LoginUrl + "?msgID=5", nextPage);
                else if (result.LoginResult == Constants.Enumerators.LoginResult.LockedOut)
                    RedirectWrapper(fromIframe, LoginUrl + "?msgID=6", nextPage);
                else if (result.LoginResult == Constants.Enumerators.LoginResult.PasswordInvalid)
                    RedirectWrapper(fromIframe, LoginUrl + "?msgID=1", nextPage);
            }
        }

        public static void Login(string username, string password, string enteredCaptcha)
        {
            Login(username, password, enteredCaptcha, "", false, false);
        }

        public static void Login(string username, string password, string enteredCaptcha, string nextPage, bool fromIframe)
        {
            Login(username, password, enteredCaptcha, nextPage, fromIframe, true);
        }

        public static void CreateFormsAuthenticationTicket(string username, string nextPage, string userData)
        {
            // Create persistent ticket
            bool isPersistent = true;
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, username, DateTime.Now, DateTime.Now.AddMinutes(FormsAuthentication.Timeout.TotalMinutes), isPersistent, userData, FormsAuthentication.FormsCookiePath);

            // Encryt the ticket
            string encryptedTicket = FormsAuthentication.Encrypt(ticket);

            // Set the cookie
            _cookieStorageService.Set(FormsAuthentication.FormsCookieName, encryptedTicket, ticket.Expiration, "", FormsAuthentication.FormsCookiePath);

            // Redirect to the next page
            if (nextPage == "")
                nextPage = FormsAuthentication.GetRedirectUrl(username, isPersistent);

            UserSession.DestroyCurrent();
        }

        public static ValidateUserLoginResult ValidateUserLogin(string userMembershipProviderName, string username, string password, string enteredCaptcha, string serverSideCaptcha, string ip, string userAgent, string surferID)
        {
            ValidateUserLoginResult result = new ValidateUserLoginResult();

            if (!Helpers.IsValidEmail(username))
            {
                User user = UserService.GetUserByUsername(username);
                if (user.UserID == 0)
                    result.LoginResult = Constants.Enumerators.LoginResult.UsernameInvalid;
                else
                    username = user.Email;
            }

            if (result.LoginResult != Constants.Enumerators.LoginResult.UsernameInvalid)
            {
                // Get user by username
                MembershipUser mu = Membership.Providers[userMembershipProviderName].GetUser(username, true);

                if (mu != null)
                {
                    result.AspnetUserID = (Guid)mu.ProviderUserKey;
                    result.Username = username;
                }

                if (mu == null)
                {
                    // Invalid username
                    result.LoginResult = Constants.Enumerators.LoginResult.UsernameInvalid;
                }
                else if (!mu.IsApproved)
                {
                    // User is not approved
                    result.LoginResult = Constants.Enumerators.LoginResult.NotApproved;
                }
                else if (mu.IsLockedOut)
                {
                    // User is locked out
                    result.LoginResult = Constants.Enumerators.LoginResult.LockedOut;
                }
                else
                {

                    // Check username and password and update failed attempts counts, etc.
                    if (!Membership.Providers[userMembershipProviderName].ValidateUser(username, password))
                        result.LoginResult = Constants.Enumerators.LoginResult.PasswordInvalid;
                    else
                        result.LoginResult = Constants.Enumerators.LoginResult.Success;

                }
            }

            AddUserLog(result, username, password, enteredCaptcha, serverSideCaptcha, ip, userAgent, surferID);

            return result;
        }

        #region Private Functions
        private static void AddUserLog(ValidateUserLoginResult result, string username, string password, string enteredCaptcha, string serverSideCaptcha, string ip, string userAgent, string surferID)
        {
            int userID = 0;

            password = ("").PadLeft(password.Length, '*');

            string action = "";

            if (result.LoginResult == Constants.Enumerators.LoginResult.UsernameInvalid)
                action = string.Format("LOGIN FAILURE - USERNAME INVALID (U: {0}; P: {1})", username, password);
            else if (result.LoginResult == Constants.Enumerators.LoginResult.NotApproved)
                action = string.Format("LOGIN FAILURE - NOT APPROVED");
            else if (result.LoginResult == Constants.Enumerators.LoginResult.LockedOut)
                action = string.Format("LOGIN FAILURE - LOCKED OUT");
            else if (result.LoginResult == Constants.Enumerators.LoginResult.PasswordInvalid)
                action = string.Format("LOGIN FAILURE (P: {0})", password);
            else if (result.LoginResult == Constants.Enumerators.LoginResult.CaptchaInvalid)
                action = string.Format("LOGIN FAILURE - CAPTCHA INVALID (P: {0}; IN: {1}; EX: {2})", password, enteredCaptcha, serverSideCaptcha);
            else if (result.LoginResult == Constants.Enumerators.LoginResult.Success)
                action = "LOGIN SUCCESS";
            else
                action = string.Format("LOGIN FAILURE - UNKNOWN ERROR (P: {0})", password);

            int userLogID = UserLogService.AddUserLog(result.AspnetUserID, userID, action, ip, userAgent, surferID);
        }

        private static List<string> GetBlockedIPs()
        {
            List<string> blockedIPs = new List<string>();
            blockedIPs.Add("0.0.0.0");
            return blockedIPs;
        }

        private static Dictionary<string, string> GetBlockedUserAgents()
        {
            Dictionary<string, string> blockedUserAgents = new Dictionary<string, string>(StringComparer.CurrentCultureIgnoreCase);
            blockedUserAgents.Add("", null);
            return blockedUserAgents;
        }

        #endregion

        #region ReCaptcha
        public static bool IsValidReCaptcha()
        {
            bool valid = false;

            if (HttpContext.Current == null)
                return valid;

            string verifyUrl = "http://www.google.com/recaptcha/api/verify";
            string privateKey = "6LfP_NQSAAAAAGMpw2Vmm26sXqX6P9EhCrwMtsbc";

            string captchaChallenge = "", captchaResponse = "";
            if (HttpContext.Current.Request.Form["recaptcha_challenge_field"] != null)
                captchaChallenge = HttpContext.Current.Request.Form["recaptcha_challenge_field"];

            if (HttpContext.Current.Request.Form["recaptcha_response_field"] != null)
                captchaResponse = HttpContext.Current.Request.Form["recaptcha_response_field"];

            if (captchaChallenge == "" || captchaResponse == "")
                return false;

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(verifyUrl);
            req.ProtocolVersion = HttpVersion.Version10;
            req.Method = "POST";
            req.Timeout = 30000;
            req.ContentType = "application/x-www-form-urlencoded";

            string postData = string.Format("privatekey={0}&remoteip={1}&challenge={2}&response={3}",
                HttpUtility.UrlEncode(privateKey),
                HttpUtility.UrlEncode(HttpContext.Current.Request.UserHostAddress),
                HttpUtility.UrlEncode(captchaChallenge),
                HttpUtility.UrlEncode(captchaResponse));

            byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(postData);

            Stream requestStream = req.GetRequestStream();
            requestStream.Write(postBytes, 0, postBytes.Length);
            requestStream.Close();

            WebResponse res = null;
            string[] results;
            try
            {
                res = req.GetResponse();
                Stream receiveStream = res.GetResponseStream();
                StreamReader readStream = new StreamReader(receiveStream, System.Text.Encoding.UTF8);
                results = readStream.ReadToEnd().Split();
                readStream.Close();
                receiveStream.Close();

                if (results.Length > 0 && results[0].ToLower() == "true")
                    valid = true;
            }
            catch
            {
                // Recaptcha Not Reachable
                valid = false;
            }
            finally
            {
                if (res != null)
                    res.Close();
            }

            return valid;
        }
        #endregion

        #region Redirect Helpers
        private static void RedirectWrapper(bool fromIframe, string url)
        {
            RedirectWrapper(fromIframe, url, "");
        }

        private static void RedirectWrapper(bool fromIframe, string url, string nextPage)
        {
            if (HttpContext.Current == null)
                return;

            if (nextPage != "")
                url = Helpers.AppendQueryStringParam(url, "nextpage", nextPage);

            if (fromIframe)
                RedirectFromIframe(url);
            else
                HttpContext.Current.Response.Redirect(url);
        }



        public static void RedirectFromIframe(string url)
        {
            if (HttpContext.Current == null)
                return;

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Write("<html><head><script type=\"text/javascript\">window.parent.location=" + Microsoft.Security.Application.Encoder.JavaScriptEncode(url) + ";</script></head><body></body></html>");
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public static void RedirectWithoutSslWarning(string nextPage)
        {
            if (HttpContext.Current == null)
                return;

            if (!HttpContext.Current.Request.IsSecureConnection || !nextPage.StartsWith("http://", StringComparison.InvariantCultureIgnoreCase))
            {
                HttpContext.Current.Response.Redirect(nextPage);
            }
            else
            {
                string html = "<html><head><title>Redirecting...</title>\r\n\r\n";
                html += "<meta http-equiv=\"refresh\" content=\"0; url={0}\"></head>";
                html += "<body bgcolor=\"#ffffff\" text=\"#000000\" link=\"#0000cc\" vlink=\"#0000cc\">\r\n";
                html += "<script type=\"text/javascript\" language=\"javascript\">\r\n";
                html += "location.replace({1});\r\n";
                html += "</script>\r\n";
                html += "<noscript><a href=\"{0}\">Click to continue...</a></noscript>\r\n";
                html += "</body></html>";

                html = string.Format(html, Microsoft.Security.Application.Encoder.HtmlAttributeEncode(nextPage), Microsoft.Security.Application.Encoder.JavaScriptEncode(nextPage));

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Write(html);
                HttpContext.Current.Response.End();
            }
        }
        #endregion
    }
}

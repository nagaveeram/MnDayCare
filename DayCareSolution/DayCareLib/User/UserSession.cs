using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Collections.Specialized;

using CommonLib;
using DayCareLib.Common;

namespace DayCareLib.User
{
    public class UserSession
    {
        private const string USER_SESSION_KEY = "_UserSession_";

        public Guid AspnetUserID = Guid.Empty;
        public int UserID = 0;
        public string Email = "";
        public string Username = "";
        public User User = new User();
        public DateTime LoginDate = Constants.Values.EmptyDate;

        public void Clear()
        {
            AspnetUserID = Guid.Empty;
            UserID = 0;
            Email = "";
            Username = "";
            LoginDate = Constants.Values.EmptyDate;
            User = new User();
        }

        public static void DestroyCurrent()
        {
            HttpContext.Current.Session[USER_SESSION_KEY] = null;
        }

        public static UserSession Current
        {
            get
            {
                UserSession userSession;

                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                {
                    if (HttpContext.Current.Session[USER_SESSION_KEY] != null)
                    {
                        userSession = HttpContext.Current.Session[USER_SESSION_KEY] as UserSession;
                    }
                    else
                    {
                        userSession = CreateUserSessionBasedOnFormsAuthenticationTicket();
                        HttpContext.Current.Session[USER_SESSION_KEY] = userSession;
                    }
                }
                else
                    userSession = new UserSession();

                // Web Farm: When the user is connected via HTTPS to .65 and via HTTP to .64,
                // it is possible that the session is created on both servers. However, after the user logs out,
                // the cookie is cleared on both servers, but the session is cleared only on one of them
                // since logout.aspx is called only once
                if (userSession.UserID != 0 && (HttpContext.Current.User == null || HttpContext.Current.User.Identity == null || !HttpContext.Current.User.Identity.IsAuthenticated || HttpContext.Current.User.Identity.Name.ToLower() != userSession.Email.ToLower()))
                {
                    // Log out the session
                    userSession = new UserSession();
                    HttpContext.Current.Session[USER_SESSION_KEY] = userSession;
                }
                else if (userSession.UserID == 0 && HttpContext.Current.User != null && HttpContext.Current.User.Identity != null && HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    // Log in the session
                    userSession = CreateUserSessionBasedOnFormsAuthenticationTicket();
                    HttpContext.Current.Session[USER_SESSION_KEY] = userSession;
                }

                return userSession;
            }

            set
            {
                if (HttpContext.Current != null && HttpContext.Current.Session != null)
                    HttpContext.Current.Session[USER_SESSION_KEY] = value;
            }
        }

        private static UserSession CreateUserSessionBasedOnFormsAuthenticationTicket()
        {
            UserSession userSession = new UserSession();

            if (HttpContext.Current != null && HttpContext.Current.User != null && HttpContext.Current.User.Identity != null)
            {
                FormsIdentity id = HttpContext.Current.User.Identity as FormsIdentity;

                if (id != null && id.IsAuthenticated)
                {
                    FormsAuthenticationTicket ticket = id.Ticket;
                    
                    MembershipUser mu = Membership.GetUser();
                    if (mu != null)
                    {
                        userSession.AspnetUserID = (Guid)mu.ProviderUserKey;
                        userSession.Email = mu.UserName.ToLower();
                        userSession.LoginDate = ticket.IssueDate;

                        User user = UserService.GetUserByAspnetUserID(userSession.AspnetUserID);

                        if (user != null && user.UserID > 0)
                        {
                            userSession.User = user;
                            userSession.UserID = user.UserID;
                            userSession.Username = user.Username;
                            userSession.Email = user.Email;
                        }
                    }
                }
            }

            return userSession;
        }
    }
}

using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CommonLib;
using DayCareLib.Common;
using DayCareLib.User;

public class BasePage : Page
{
    public enum PageSslProtection { Yes, No, DoesNotMatter }

    public BasePage()
    {
    }

    public string BaseUrl
    {
        get
        {
            string url = this.Request.ApplicationPath.ToLower();
            if (url.EndsWith("/"))
                return url;
            else
                return url + "/";
        }
    }

    public string FullBaseUrl
    {
        get
        {
            return this.Request.Url.AbsoluteUri.Replace(this.Request.Url.PathAndQuery, "") + this.BaseUrl;
        }
    }

    public string CurrentPageName
    {
        get
        {
            return System.IO.Path.GetFileName(this.Request.FilePath);
        }
    }

    public string UIVersion
    {
        get
        {
            return Util.GetAppSetting("UIVersion", "");
        }
    }

    public virtual PageSslProtection SslProtected
    {
        get
        {
            return PageSslProtection.No;
        }
    }

    #region Display Current Message
    public void DisplayCurrentMessage()
    {
        DisplayCurrentMessage(true);
    }

    public void DisplayCurrentMessage(bool clear)
    {
        string message = UserMessages.GetCurrentMessage(clear);

        Literal litCurrentMessage = this.FindControlRecursive("litCurrentMessage") as Literal;

        if (litCurrentMessage != null)
            litCurrentMessage.Text = message;
    }
    #endregion

    #region OnPreInit Override
    protected override void OnPreInit(EventArgs e)
    {
        // SSL
        switch (this.SslProtected)
        {
            case PageSslProtection.Yes:
                ForceSslConnection();
                break;

            case PageSslProtection.No:
                ForceNonSslConnection();
                break;

            case PageSslProtection.DoesNotMatter:
                break;
        }

        base.OnPreInit(e);
    }
    #endregion

    #region PostToken
    // Used to prevent multiple submissions of the same form and possibly CSRF attacks
    public string PostTokenClient
    {
        get
        {
            if (ViewState["PostTokenClient"] != null)
                return ViewState["PostTokenClient"].ToString();
            else
                return "";
        }
        set
        {
            ViewState["PostTokenClient"] = value.ToString();
        }
    }

    public string PostTokenServer
    {
        get
        {
            if (Session["PostTokenServer_" + Request.Url.AbsoluteUri.ToString().ToLower()] != null)
                return Session["PostTokenServer_" + Request.Url.AbsoluteUri.ToString().ToLower()].ToString();
            else
                return "";
        }
        set
        {
            Session["PostTokenServer_" + Request.Url.AbsoluteUri.ToString().ToLower()] = value;
        }
    }
    #endregion

    #region Common
    public void ForceNonSslConnection()
    {
        if (!Request.Url.IsLoopback && Request.IsSecureConnection)
            Response.Redirect("http://" + Request.Url.Host + Request.Url.PathAndQuery);
    }

    public void ForceSslConnection()
    {
        if (!Request.Url.IsLoopback && !Request.IsSecureConnection)
            Response.Redirect("https://" + Request.Url.Host + Request.Url.PathAndQuery);
    }

    public void SetChromeFix()
    {
        // http://weblogs.asp.net/stefansedich/archive/2008/11/04/bug-with-latest-google-chrome-and-asp-net-validation.aspx
        // Adds a script that fixes the .Net ValidatorHookupEvent for Google Chrome
        string browser = Context.Request.UserAgent;

        if (!String.IsNullOrEmpty(browser) && browser.IndexOf("Chrome") > -1 && !Page.ClientScript.IsStartupScriptRegistered("GoogleChromeValidatorHookupEventFix"))
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "GoogleChromeValidatorHookupEventFix", @"
            // Google Chrome Fix
            function redefineValidatorHookupEvent() {
                if (typeof (ValidatorHookupEvent) == ""function"") {
                    ValidatorHookupEvent = function(control, eventType, functionPrefix) {
                        var ev;
                        eval(""ev = control."" + eventType + "";"");
                        if (typeof(ev) == ""function"") {
                            ev = ev.toString();
                            ev = ev.substring(ev.indexOf(""{"") + 1, ev.lastIndexOf(""}""));
                        } else {
                            ev = """";
                        }
                        var func = new Function(""event"", "" var evt = event; "" + functionPrefix + "" "" + ev);
                        eval(""control."" + eventType + "" = func;"");
                    }
                }
           }
           redefineValidatorHookupEvent();
           ", true);
        }
    }

    public Control FindControlRecursive(string id)
    {
        return FindControlRecursive(id, this);
    }

    public Control FindControlRecursive(string id, Control parent)
    {
        if (string.Compare(parent.ID, id, true) == 0)
            return parent;

        foreach (Control child in parent.Controls)
        {
            Control match = FindControlRecursive(id, child);
            if (match != null)
                return match;
        }

        return null;
    }

    #endregion

    #region OnPreInit Overrride
    protected override void OnPreRender(System.EventArgs e)
    {
        try
        {
            if (Page.Header != null && Page.Header.Controls.Count > 0)
            {
                // Force App_Themes CSS to update
                foreach (Control link in Page.Header.Controls)
                {
                    HtmlLink lk = link as HtmlLink;
                    if (lk != null && lk.Attributes != null)
                    {

                        if (lk.Attributes["type"] != null && lk.Attributes["type"].Equals("text/css", StringComparison.CurrentCultureIgnoreCase))
                        {
                            if (lk.Attributes["href"] != null && lk.Attributes["href"].Equals(String.Format("~/App_Themes/Default/Default.css"), StringComparison.CurrentCultureIgnoreCase))
                            {
                                // Un-cache by adding version to url
                                string version = "v=20120616";
                                lk.Attributes["href"] += "?" + version;
                            }
                        }
                    }
                }
            }
        }
        catch { }
        finally
        {
            base.OnPreRender(e);
        }

    }
    #endregion
}

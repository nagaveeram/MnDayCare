using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class BaseUserControl : System.Web.UI.UserControl
{
    public BaseUserControl()
    {
    }

    public void DisplayCurrentMessage()
    {
        ((BasePage)this.Page).DisplayCurrentMessage();
    }

    public string UIVersion
    {
        get { return ((BasePage)this.Page).UIVersion; }
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
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;
using DayCareLib.Common;

public partial class Controls_LoginControl : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (UserSession.Current.UserID > 0)
        {
            User user = UserSession.Current.User;
            pnlLoggedIn.Visible = true;
            pnlLoggedOut.Visible = false;            
            litUsername.Text = string.Format("Welcome, {0} {1}", Xss.HtmlEncode(user.FirstName), Xss.HtmlEncode(user.LastName));
        }
        else
        {
            pnlLoggedIn.Visible = false;
            pnlLoggedOut.Visible = true;
        }
    }
}
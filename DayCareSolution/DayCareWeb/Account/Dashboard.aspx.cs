using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;

public partial class Account_Dashboard : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PreInitForm();
        if (!IsPostBack)
        {
            DisplayCurrentMessage();
        }
    }

    private void PreInitForm()
    {
        if (UserSession.Current.UserID == 0)
            Response.Redirect("~/login.aspx", true);

    }
}
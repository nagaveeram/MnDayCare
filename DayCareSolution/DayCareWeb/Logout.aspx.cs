using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;

public partial class Logout : BasePage
{
    public override PageSslProtection SslProtected
    {
        get
        {
            return PageSslProtection.DoesNotMatter;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        UserAuth.Logout(true);
    }
}
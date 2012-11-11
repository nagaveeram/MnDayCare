using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;
using DayCareLib.Common;

public partial class Login : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PreInitForm();
        if (!IsPostBack)
        {
            InitForm();          
        }
    }


    private void PreInitForm()
    {
        if (UserSession.Current.UserID > 0)
            Response.Redirect("~/account/dashboard.aspx");
    }

    private void InitForm()
    {
        DisplayMessage();
    }

    protected string GetNextPage()
    {
        string nextPage = Helpers.GetQueryString("nextpage");
      
        if (nextPage == "")
            nextPage = "~/account/dashboard.aspx";

        return nextPage;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
          
            string captcha = "";
            bool fromIframe = false;

            UserAuth.Login(username, password, captcha, GetNextPage(), fromIframe);
        }
    }

    private void DisplayMessage()
    {
        int msgID = Helpers.GetQueryStringInt("msgID");

        if (msgID == 0)
            DisplayCurrentMessage();
        else
        {
            UserMessages.SetCurrentMessage(UserMessages.GetMessageByID(msgID), "error");
            DisplayCurrentMessage();
        }
    }
}
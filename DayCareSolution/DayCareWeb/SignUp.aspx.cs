using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;
using DayCareLib.Common;
using System.Web.Security;

public partial class SignUp : BasePage
{
    private string _errorTitle = "We're sorry, please fix the following issues...";

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
            Response.Redirect("dashboard.aspx");
    }

    private void InitForm()
    {
        DisplayCurrentMessage();
        if (Request.IsLocal)
        {
            txtPassword.Text = "password123";
            txtPasswordVerify.Text = "password123";
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid)
        {
            string errors = ValidateForm();
            if (errors != "")
            {
                UserMessages.SetCurrentMessage(_errorTitle, errors, "error");
                DisplayCurrentMessage();
                return;
            }
         
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string address1 = txtAddress1.Text.Trim();
            string address2 = txtAddress2.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = lstStates.SelectedValue;
            string zip = txtZip.Text.Trim();
            string phone = txtPhone.Text.Trim();

            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();    
        
            User user = new User()
            {
                AccessType = Constants.Enumerators.AccessType.Regular,
                Address1 = address1,
                Address2 = address2,
                City = city,
                Email = email,
                FirstName = firstName,
                LastName = lastName,
                Password = password,
                Phone = phone,
                State = state,
                Status = 1,
                Username = username,
                Zip = zip
            };

            string error = UserService.CreateUserAccount(Membership.Provider, user);

            if (error != "")
            {
                UserMessages.SetCurrentMessage(_errorTitle, error, "error");
                DisplayCurrentMessage();
                return;
            }

            // Login the created user
            UserAuth.CreateFormsAuthenticationTicket(user.Email, "", "");

            // TODO: Send user welcome email.

            Response.Redirect("~/account/dashboard.aspx");
        }
    }

   

    #region Validation
    protected string ValidateForm()
    {
        List<string> errors = new List<string>();

        string serverSideCaptcha = (HttpContext.Current.Session["Captcha"] != null) ? HttpContext.Current.Session["Captcha"].ToString() : "";
        string enteredCaptcha = txtSecurityCode.Text.Trim();

        if (string.Compare(serverSideCaptcha, enteredCaptcha, true) != 0 || enteredCaptcha.Length == 0)
            errors.Add(UserMessages.InvalidSecurityCode);

        string username = txtUsername.Text.Trim();
        User user = UserService.GetUserByUsername(username);
        if (user.UserID > 0)
            errors.Add(UserMessages.UsernameAlreadyUsed);

        string email = txtEmail.Text.Trim();
        user = UserService.GetUserByEmail(email);
        if (user.UserID > 0)
            errors.Add(UserMessages.EmailAlreadyUsed);

        return string.Join("\r\n", errors);
    }

    #endregion
}
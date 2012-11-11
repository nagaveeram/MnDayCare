using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;
using DayCareLib.Common;

public partial class Admin_ManageUserSubscriptionTypes : BasePage
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

    #region Initialization

    private void PreInitForm()
    {
        // TODO: Redirect to dashboard or login page if not logged in admininstrator.
        if (UserSession.Current.UserID == 0)
            Response.Redirect("~/login.aspx?nextpage=" + Xss.UrlEncode("~/admin/manageusersubscriptiontypes.aspx"), true);
            
    }

    private void InitForm()
    {
        var subscriptionTypes = UserSubscriptionService.GetUserSubscriptionTypes().Select(us => new { Text = us.Name, Value = us.SubscriptionTypeID });
        if(subscriptionTypes.Count() > 0)
        {
            lstSubscriptionTypes.DataSource = subscriptionTypes;
            lstSubscriptionTypes.DataBind();
            pnlSubscriptionTypes.Visible = true;
            pnlAddNewSubscriptionType.Visible = false;
        }
        else 
        {
            pnlSubscriptionTypes.Visible = false;
            pnlAddNewSubscriptionType.Visible = true;            
        }

        Helpers.FillDropDownWithEnum(lstDurationType, typeof(Constants.Enumerators.DurationType), "-- please select --", "-1");
        DisplayCurrentMessage();
    }
    #endregion

    #region Event Handlers
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int subscriptionTypeID = Convert.ToInt32(lstSubscriptionTypes.SelectedValue);
            string name = lstSubscriptionTypes.SelectedItem.Text;
            if (UserSubscriptionService.DeleteUserSubscriptionType(subscriptionTypeID))
            {
                string message = string.Format("Subscription type \" {0} \" was deleted successfully.", Xss.HtmlEncode(name));
                UserMessages.SetCurrentMessage(message, "success");
                Response.Redirect(Request.Url.AbsoluteUri, true);
            }
            else
            {
                string message = string.Format("There was an error deleting subscription type \" {0} \". Please try again or contact customer support if problem persits.", Xss.HtmlEncode(name));
                UserMessages.SetCurrentMessage(message, "error");
                DisplayCurrentMessage();
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        pnlAddNewSubscriptionType.Visible = true;
        pnlSubscriptionTypes.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
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

            decimal amount = 0;
            string amountStr = txtAmount.Text.Trim();
            decimal.TryParse(amountStr, out amount);
            Constants.Enumerators.DurationType durationType = (Constants.Enumerators.DurationType)Convert.ToInt32(lstDurationType.SelectedValue);
            double duration = 0;
            string durationStr = txtDurationTime.Text.Trim();
            double.TryParse(durationStr, out duration);
            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();
            int totalCycles = 0;
            int.TryParse(txtTotalCycles.Text.Trim(), out totalCycles);

            int subscriptionTypeID = UserSubscriptionService.AddUserSubscriptionType(amount, durationType, duration, totalCycles, name, description);

            if (subscriptionTypeID > 0)
            {
                string message = string.Format("Subscription type \" {0} \" was successfully added", Xss.HtmlEncode(name));
                UserMessages.SetCurrentMessage(message, "success");
                Response.Redirect(Request.Url.AbsoluteUri, true);
            }
            else
            {
                string message = string.Format("There was an error adding subscription type \" {0} \". Please try again or contact customer support if problem persits.", Xss.HtmlEncode(name));
                UserMessages.SetCurrentMessage(message, "error");
                DisplayCurrentMessage();            
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlAddNewSubscriptionType.Visible = false;
        pnlSubscriptionTypes.Visible = true;
    } 
    #endregion

    #region Private Functions
    private string ValidateForm()
    {
        List<string> errors = new List<string>();

        decimal amount = 0;
        string amountStr = txtAmount.Text.Trim();
        decimal.TryParse(amountStr, out amount);
        if (amount <= 0)
            errors.Add("Please enter valid amount.");

        double duration = 0;
        string durationStr = txtDurationTime.Text.Trim();
        double.TryParse(durationStr, out duration);

        if (duration <= 0)
            errors.Add("Please enter valid duration time.");

        string name = txtName.Text.Trim();

        if (name.Length < 4)
            errors.Add("Name should be atleast 4 characters in length.");

        string description = txtDescription.Text.Trim();
        if(description.Length < 4)
            errors.Add("Description should be at least 4 characters in length.");

         return string.Join("\r\n", errors);
    }
    #endregion
}
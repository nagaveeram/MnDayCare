using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.User;
using DayCareLib.Common;
using CommonLib;
using System.Text.RegularExpressions;

public partial class Account_AddSubscription : BasePage
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
        if (UserSession.Current.UserID == 0)
            Response.Redirect("~/login.aspx?nextpage=" + Xss.UrlEncode("~/addsubscription.aspx"), true);
    }

    private void InitForm()
    {
        int userID = UserSession.Current.UserID;
        DateTime subscriptionExpiryDate = UserSubscriptionService.GetUserSubscriptionExpiryDate(userID);
        if (subscriptionExpiryDate.Date != Constants.Values.EmptyDate)
            litCurrentSubscriptionStatus.Text = string.Format("<div class='box substatus'>You currently have an active subscription that expires on {0}</div>", subscriptionExpiryDate.Date.ToString("MMMM dd, yyyy"));
        else
            litCurrentSubscriptionStatus.Text = "";

        List<UserSubscriptionType> types = UserSubscriptionService.GetUserSubscriptionTypes();
        var subTypes = types.Select(st => new { Name = string.Format("{0} for {1}", st.Amount.ToString("c2"), st.Name), Value = st.SubscriptionTypeID });
        lstSubscriptionTypes.DataSource = subTypes;
        lstSubscriptionTypes.DataBind();

        User user = UserSession.Current.User;
        txtName.Text = user.FirstName;
        txtLastName.Text = user.LastName;
        txtAddress1.Text = user.Address1;
        txtAddress2.Text = user.Address2;
        txtCity.Text = user.City;
        lstStates.SelectedValue = user.State;
        txtZip.Text = user.Zip;

        if (Request.IsLocal)
        {
            txtCcNum.Text = "4111111111111111";
            lstCcType.SelectedValue = "1";
            txtCSC.Text = "123";
            ucExpDate.DefaultExpDate = DateTime.Now.Date.AddYears(1);
        }
    }


    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string ip = Request.UserHostAddress;
            string userAgent = (Request.UserAgent != null) ? Request.UserAgent : "";
            string surferID = Helpers.GetSurferID();

            User user = UserSession.Current.User;

            int userSubscriptionTypeID = Convert.ToInt32(lstSubscriptionTypes.SelectedValue);
            UserSubscriptionRequest req = new UserSubscriptionRequest(UserSession.Current.UserID, userSubscriptionTypeID, Constants.Enumerators.TransactionType.Sale, Constants.Enumerators.PaymentType.Manual, ip, userAgent, surferID);

            int ccType = Convert.ToInt32(lstCcType.SelectedValue);

            req.SetCreditCard(0,
                ccType,
                T(txtCcNum),
                ucExpDate.SelectedExpDate.Date,
                T(txtCSC),
                T(txtName),
                T(txtLastName),
                user.Email,
                T(txtAddress1),
                T(txtAddress2),
                T(txtCity),
                lstStates.SelectedValue,
                T(txtZip),
                840,
                user.Phone,
                "");

            UserSubscriptionResult result = UserSubscriptionService.ProcessUserSubscriptionRequest(req);
            if (result.ErrorMessages.Count > 0)
            {
                string errors = string.Join("\r\n", result.ErrorMessages);
                UserMessages.SetCurrentMessage(errors, "error");
                DisplayCurrentMessage();
                return;
            }
            else
            {
                UserMessages.SetCurrentMessage("Congratulations!", "Your subscription was successfully processed.", "success");
                Response.Redirect("dashboard.aspx", true);
            }
        }
    }

    private string T(TextBox txt)
    {
        return txt.Text.Trim();
    }

    protected void CustomValidateCreditCard(object source, ServerValidateEventArgs args)
    {
        string error = "";

        // Credit card number validation
        txtCcNum.Text = Regex.Replace(txtCcNum.Text, @"[^\d]", "");
        if (!Util.IsValidCreditCardNumber(txtCcNum.Text))
            error += "Credit card number is invalid";
        else
        {
            // Credit card type validation
            string ccTypeBasedOnNumber = Util.DetermineCreditCardType(txtCcNum.Text).ToLower();
            if ((string.Compare(ccTypeBasedOnNumber, "visa", true) != 0 && lstCcType.SelectedValue == "1") ||
                (string.Compare(ccTypeBasedOnNumber, "mastercard", true) != 0 && lstCcType.SelectedValue == "2") ||
                (string.Compare(ccTypeBasedOnNumber, "amex", true) != 0 && lstCcType.SelectedValue == "3"))
                error += "Credit card type is invalid";
        }

        if (error != "")
        {
            args.IsValid = false;
            vldCcNumCustom.ErrorMessage = error;
        }
        else
        {
            args.IsValid = true;
            vldCcNum.ErrorMessage = "";
        }
    }
}

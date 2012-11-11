using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DayCareLib.Common;
using DayCareLib.Services;
using DayCareLib.Domain;
using System.Web.Script.Serialization;
using Microsoft.Security.Application;
using CommonLib;
using Xamarin.Payments.Stripe;
using DayCareLib.User;
using DayCareLib.Common.Logging;

public partial class Search : BasePage
{
    protected string _searchResults
    {
        get;
        set; 
    }

    protected string Query
    {
        get
        {
            string query = "";
            if (ViewState["Query"] != null)
                query = ViewState["Query"].ToString();

            return query;
        }
        set
        {
            ViewState["Query"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitForm();
            DisplayCurrentMessage();
        }
    }

    private void TestStripePayment()
    {
        string stripeApiKey = Util.GetAppSetting(Constants.AppSettingKeys.StripeApiKey);
        StripePayment payment = new StripePayment(stripeApiKey);


        StripeCreditCardInfo cc = new StripeCreditCardInfo();
        cc.CVC = "1234";
        cc.ExpirationMonth = 6;
        cc.ExpirationYear = 2013;
        cc.Number = "4242424242424242";
            
        StripeCustomerInfo customerInfo = new StripeCustomerInfo();
        customerInfo.Card = cc;
        customerInfo.Description = "Test User";
        customerInfo.Email = UserSession.Current.Email;
        customerInfo.Validate = false;

        try
        {
            StripeCustomer customer = payment.CreateCustomer(customerInfo);

            int userID = UserSession.Current.UserID;

            StripeUser stripeUser = new StripeUser()
            {
                UserID = userID,
                StripeCustomerID = customer.ID,
                LiveMode = customer.LiveMode,
                Description = customer.Description,
                DateCreated = DateTime.UtcNow
            };

            int stripeUserID = StripeUserService.AddStripeUser(stripeUser);

            StripeCustomer customerFromPayment = payment.GetCustomer(customer.ID);

            customerInfo.Description = "Other Description";
            StripeCustomer updatedCustomer = payment.UpdateCustomer(customerFromPayment.ID, customerInfo);

            StripeCharge charge = payment.Charge(5001, "usd", customer.ID, "Another Test Charge");


            List<StripeUser> stripeUsers = StripeUserService.GetStripeUsers(userID, customer.ID);

        }
        catch (Exception ex)
        {
            string error = "Error Processing Request";
            LoggingFactory.GetLogger().LogError(error, ex);
        }

        //StripeCharge charge = payment.Charge(5001, "usd", cc, "Test charge");
        //string charge_id = charge.ID;
        //StripeCharge charge_info = payment.GetCharge(charge_id);
        //StripeCharge refund = payment.Refund(charge_info.ID);
    }

    private void InitForm()
    {        
        //objSearchResults.Type
        Query = Helpers.GetQueryString("query");
        //TestStripePayment();
    }

    private void InitForm2()
    {
        string query = Helpers.GetQueryString("query");
        JavaScriptSerializer json = new JavaScriptSerializer();
        List<SearchResult> searchResults = null;
        if (query != "")
        {
            //TODO: User query instead
            //searchResults = SearchResultService.GetSearchResultsFromRepository(query, 50);
            double latitude = 45.117374, longitude = -93.215287;

            searchResults = SearchResultService.GetSearchResultsFromRepository(latitude, longitude, 50);
            litTitle.Text = string.Format("<h1 class='resultsnear'>Results for Child Care Centers near \"{0}\"</h1>", Xss.HtmlEncode(query));
            gvSearchResults.DataSource = searchResults;
            gvSearchResults.DataBind();
            _searchResults = json.Serialize(new
            {
                query = query,
                results = searchResults
            });
        }
        else
        {
            _searchResults = json.Serialize(new
            {
                query = "",
                results = searchResults
            });
        }
    }
    #region Event Handlers

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string zip = txtZip.Text.Trim();
        if (zip != "")
            Response.Redirect("search.aspx?query=" + HttpUtility.UrlEncode(zip), true);
    }

    protected void objSearchResults_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (Query == "")
        {
            e.Cancel = true;
            return;
        }

     
        double latitude = 45.117374, longitude = -93.215287;
        e.InputParameters["latitude"] = latitude;
        e.InputParameters["longitude"] = longitude;
        
    }
    #endregion

    #region Formatting Functions

    protected string FormatHtml(object o, string whatToShow)
    {
        string html = "";
        SearchResult searchResult = o as SearchResult;
        switch (whatToShow)
        {
            case "image":
                html = string.Format("<img src='{0}'", Request.ApplicationPath +  searchResult.ImageUrl);
                break;
            case "title":
                html = Encoder.HtmlEncode(searchResult.Name);
                break;
            case "address":
                html = Encoder.HtmlEncode(searchResult.Address);
                break;
            case "desc":
                html = Util.LeftWithDots(Encoder.HtmlEncode(searchResult.Description), 150);
                break;
            case "phone":
                html = Encoder.HtmlEncode(searchResult.Phone);
                break;
            case "viewdetails":
                html = string.Format("<a href='#'>View Details</a>");
                break;
            case "viewonmap":
                html = "<a href='#' onclick='return false;'>View on Map</a>";
                break;
            default: break;
        }

        return html;
    }
    #endregion


    
}
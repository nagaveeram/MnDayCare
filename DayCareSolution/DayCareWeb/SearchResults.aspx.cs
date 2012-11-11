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

public partial class SearchResults : BasePage
{
    protected string _searchResults
    {
        get;
        set; 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitForm();
            DisplayCurrentMessage();
        }
    }

    private void InitForm()
    {
        string query = Helpers.GetQueryString("query");
        JavaScriptSerializer json = new JavaScriptSerializer();
        List<SearchResult> searchResults = null;
        if (query != "")
        {
            //TODO: User query instead
            //searchResults = SearchResultService.GetSearchResultsFromRepository(query, 50);\
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
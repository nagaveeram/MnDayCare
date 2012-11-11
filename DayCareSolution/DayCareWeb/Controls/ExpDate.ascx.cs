using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ExpDate : UserControl
{
    private DateTime _defaultExpDate = DateTime.MinValue;

    #region Properties
    public DateTime DefaultExpDate
    {
        set
        {
            _defaultExpDate = value;
        }
    }

    public DateTime SelectedExpDate
    {
        get
        {
            return GetSelectedDate();
        }
    }
    public bool IsRequired
    {
        set
        {
            ViewState["IsRequired"] = value;
        }
        get
        {
            if (ViewState["IsRequired"] == null)
                return false;
            else
                return (bool)ViewState["IsRequired"];
        }
    }

    public string ValidationGroup
    {
        set
        {
            vldMonth.ValidationGroup = value;
            vldYear.ValidationGroup = value;
            vldExpDate.ValidationGroup = value;
        }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            InitControl();
    }

    private void InitControl()
    {
        for (int i = 1; i <= 12; i++)
            lstMonth.Items.Add(new ListItem(i.ToString().PadLeft(2, '0'), i.ToString()));

        for (int i = DateTime.Now.Year; i <= DateTime.Now.Year + 15; i++)
            lstYear.Items.Add(new ListItem(i.ToString(), i.ToString()));

        if (_defaultExpDate >= DateTime.Now)
        {
            lstMonth.SelectedValue = _defaultExpDate.Month.ToString();
            lstYear.SelectedValue = _defaultExpDate.Year.ToString();
        }
        else
        {
            lstMonth.Items.Insert(0, new ListItem("", ""));
            lstYear.Items.Insert(0, new ListItem("", ""));
        }

        if (IsRequired)
        {
            vldMonth.Enabled = vldYear.Enabled = true;
        }
    }

    protected void vldExpDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((lstMonth.SelectedValue != "0" || lstYear.SelectedValue != "") && GetSelectedDate() < DateTime.Now)
        {
            args.IsValid = false;
            vldExpDate.ErrorMessage = "Expiration date cannot be in the past.";
        }
    }

    private DateTime GetSelectedDate()
    {
        DateTime selectedDate;
        try
        {
            selectedDate = DateTime.Parse(lstYear.SelectedValue + "-" + lstMonth.SelectedValue + "-1").AddMonths(1).AddDays(-1);
        }
        catch
        {
            selectedDate = DateTime.MinValue;
        }
        return selectedDate;
    }
}

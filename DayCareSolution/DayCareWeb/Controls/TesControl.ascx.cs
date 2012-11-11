using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_TesControl : System.Web.UI.UserControl
{
    public System.Web.UI.HtmlControls.HtmlGenericControl _testContainer = null;
    public System.Web.UI.HtmlControls.HtmlGenericControl TestContainer
    {
        get
        {
            return _testContainer;
        }
        set
        {
            _testContainer = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (TestContainer != null)
            {
                TestContainer.InnerHtml = "<h1>Hello World</h1>";
            }
        }
    }
    protected void btnClickMe_Click(object sender, EventArgs e)
    {
        TestContainer.InnerHtml = "<h1>Button Clicked</h1>";
    }
}
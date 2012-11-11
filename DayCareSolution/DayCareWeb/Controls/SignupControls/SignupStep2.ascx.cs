using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class Controls_SignupControls_SignupStep2 : System.Web.UI.UserControl
    {
        public event EventHandler btnDCStep2NextHandler;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDCStep2Next_Click(object sender, EventArgs e)
        {
            btnDCStep2NextHandler(sender,e);
        }
    }

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Controls_SignupControls_SignupStep5 : System.Web.UI.UserControl
    {
        public event EventHandler btnDCStep5NextHandler;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDCStep5Next_Click(object sender, EventArgs e)
        {
            btnDCStep5NextHandler(sender, e);
        }
    }

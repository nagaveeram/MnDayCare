using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class Controls_SignupControls_SignupStep10 : System.Web.UI.UserControl
    {
        public event EventHandler btnDCStep10SignupHandler;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDCStep10Signup_Click(object sender, EventArgs e)
        {
            btnDCStep10SignupHandler(sender, e);
        }
    }

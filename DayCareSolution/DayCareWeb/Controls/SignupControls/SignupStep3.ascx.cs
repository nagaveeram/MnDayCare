using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Controls_SignupControls_SignupStep3 : System.Web.UI.UserControl
    {
        public event EventHandler btnDCStep3NextHandler;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDCStep3Next_Click(object sender, EventArgs e)
        {
            btnDCStep3NextHandler(sender, e);
        }
    }

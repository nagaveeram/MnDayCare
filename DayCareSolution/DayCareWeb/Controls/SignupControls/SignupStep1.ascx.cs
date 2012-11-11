using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Controls_SignupControls_SignupStep1 : BaseUserControl
    {
        public event EventHandler btnFCProviderHandler;
        public event EventHandler btnCCCenterHandler;

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnFCProvider_Click(object sender, EventArgs e)
        {
            
            btnFCProviderHandler(sender, e);
        }

        protected void btnCCCenter_Click(object sender, EventArgs e)
        {

            btnCCCenterHandler(sender, e);
        }


    }

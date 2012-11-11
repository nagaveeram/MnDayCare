using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CommonLib;
using System.Configuration;
using System.Data.SqlClient;


    public partial class Signup12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)            
        {
            mvSignup.SetActiveView(vStep1);
            SignupStep1.btnCCCenterHandler += new EventHandler(btnCCCenterHandler_Click);
            SignupStep1.btnFCProviderHandler += new EventHandler(btnFCProviderHandler_Click);

            SignupStep2.btnDCStep2NextHandler += new EventHandler(btnDCStep2NextHandler_Click);
            SignupStep3.btnDCStep3NextHandler += new EventHandler(btnDCStep3NextHandler_Click);
            SignupStep4.btnDCStep4NextHandler += new EventHandler(btnDCStep4NextHandler_Click);
            SignupStep5.btnDCStep5NextHandler += new EventHandler(btnDCStep5NextHandler_Click);

            SignupStep10.btnDCStep10SignupHandler += new EventHandler(btnDCStep10NextHandler_Click);
            //vStep1..ButtonClickDemo += new EventHandler(Demo1_ButtonClickDemo);

            //PreInitForm();
            if (!IsPostBack)
            {
                //InitForm();
                
               
            }
               
        }

        protected void btnCCCenterHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep2);
        }

        protected void btnFCProviderHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep2);
        }

        protected void btnDCStep2NextHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep3);
        }

        protected void btnDCStep3NextHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep4);
        }

        protected void btnDCStep4NextHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep5);
        }

        protected void btnDCStep5NextHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep10);
        }
        protected void btnDCStep10NextHandler_Click(object sender, EventArgs e)
        {
            mvSignup.SetActiveView(vStep10);
        }
    }


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
<style type="text/css">
    #signupcontainer  { margin:20px 0px; font-family:Verdana, Georgia, Helvetica, Arial;}    
    #signupcontainer h1 { margin:10px 0px 30px; font-size:22px;  color:#5B5B5B; font-weight:normal; font-family:Tahoma; }
    #signupcontainer .col1 { float:left; margin-right:50px; }    
    #signupcontainer .col2 { float:left; }    
    #signupcontainer .row { margin-bottom:10px; }
    #signupcontainer .lbl { color:#444; font-weight:bold; float:left; text-align:right; width:175px; margin-right:15px; line-height:30px;}
    #signupcontainer .value { float:left; }
    #signupcontainer .txt { font-size:14px; font-weight:bold; padding:4px 2px; width:180px;}    
    #signupcontainer .state { padding:4px 2px; font-size:12px;}
    #signupcontainer .address, #signupcontainer .city, #signupcontainer .name{ width:225px; }
    #signupcontainer .email { width:230px; }
    #signupcontainer .username { width:150px; }
    #signupcontainer .zip { width:100px; }
    #signupcontainer .phone { width:120px; }
    #signupcontainer .securitycode { width:80px; }
    #signupcontainer .btn { padding:5px 10px; font-size:20px; font-weight:bold; font-family:Tahoma, Georgia, Arial; }
</style>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
    <div id="signupcontainer">
        <h1>
            The complete list of child care providers in your area is only available to subscribers.
            To become a subscriber of mndaycare.com please fill out the required information below:
        </h1>
        <div class="clearfix">
            <div class="row clearfix">
                <asp:ValidationSummary ID="vldSummary" runat="server" ShowMessageBox="false" ShowSummary="true" />
                <div id="messageBox"><asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" /></div>
            </div>
            <div class="col1">
                <div class="row clearfix">
                    <div class="lbl">* First Name:</div>
                    <div class="value">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="txt name" TabIndex="1" />
                        <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ControlToValidate="txtFirstName" Text="*" ErrorMessage="Please enter your first name." />
                        <asp:RegularExpressionValidator ID="vldFirstName2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name can be between 2 and 100 characters and can only contain letters, spaces, a period, and a single-quote." ValidationExpression="[A-z\.\s\-']{2,100}">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Last Name:</div>
                    <div class="value">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="txt name" TabIndex="2" />
                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ControlToValidate="txtLastName" Text="*" ErrorMessage="Please enter your last name." />
                        <asp:RegularExpressionValidator ID="vldLastName2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name can be between 3 and 100 characters and can only contain letters, spaces, a period, and a single-quote." ValidationExpression="[A-z\.\s\-']{2,100}">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Address Line 1:</div>
                    <div class="value">
                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="txt address" TabIndex="3" />
                        <asp:RequiredFieldValidator ID="reqAddress1" runat="server" ControlToValidate="txtAddress1" Text="*" ErrorMessage="Please enter your address." />
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">Address Line 2:</div>
                    <div class="value">
                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="txt address" TabIndex="4" />
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* City:</div>
                    <div class="value">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="txt city" TabIndex="5" />
                        <asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="txtCity" Text="*" ErrorMessage="Please enter your city." />
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* State:</div>
                    <div class="value">
                        <asp:DropDownList ID="lstStates" runat="server"  DataSourceID="odsStates"  TabIndex="6" AppendDataBoundItems="true" DataTextField="IdAndName" DataValueField="ID" CssClass="state">
                            <asp:ListItem Text="-- Please Select --" Value="" />
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsStates" runat="server" TypeName="DayCareLib.Common.StateService" SelectMethod="GetStates"></asp:ObjectDataSource>
                        <asp:RequiredFieldValidator ID="vldState" runat="server" ControlToValidate="lstStates" ErrorMessage="Please select state." InitialValue="">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Zip:</div>
                    <div class="value">
                        <asp:TextBox ID="txtZip" runat="server" CssClass="txt zip" TabIndex="7" />
                        <asp:RequiredFieldValidator ID="reqZip" runat="server" ControlToValidate="txtZip" Text="*" ErrorMessage="Please enter zip." />
                        <asp:RegularExpressionValidator ID="vldZip" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip/postal code where you live can only contain numbers, letters, spaces, and dashes." ValidationExpression="[A-z0-9\s\-]{4,100}">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">Phone</div>
                    <div class="value">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="txt phone" TabIndex="8" />
                    </div>
                </div>                
            </div>
            <div class="col2">              
                <div class="row clearfix">
                    <div class="lbl">* Email Address:</div>
                    <div class="value">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt email" />
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" Text="*" ErrorMessage="Please enter your email." />
                        <asp:RegularExpressionValidator ID="vldEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter valid email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Verify Email Address:</div>
                    <div class="value">
                        <asp:TextBox ID="txtEmailVerify" runat="server" CssClass="txt email" />
                        <asp:RequiredFieldValidator ID="reqEmailVerify" runat="server" ControlToValidate="txtEmailVerify" Text="*" ErrorMessage="Please verify your email." />
                        <asp:CompareValidator ID="vldEmailVerify" runat="server" ControlToCompare="txtEmailVerify" ControlToValidate="txtEmail" ErrorMessage="Emails you provided do not match." Text="*" />
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Username:</div>
                    <div class="value">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="txt username" />
                        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="txtUsername" Text="*" ErrorMessage="Please enter username you like to use." />
                        <asp:RegularExpressionValidator ID="vldUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter valid username. <br />Username should be between 3 and 15 characters and should contain only a-z, 0-9, underscore (_), hyphen (-)." ValidationExpression="^[A-z0-9_-]{3,15}$">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Password:</div>
                    <div class="value">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txt password" />
                        <asp:RequiredFieldValidator ID="vldPasswordReq" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Choose your password." Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="vldPasswordReg" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password must be at least 6 characters long" Text="*" ValidationExpression="[\S]{6,100}" />
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="lbl">* Verify Password:</div>
                    <div class="value">
                        <asp:TextBox ID="txtPasswordVerify" runat="server" TextMode="Password" CssClass="txt password" />
                        <asp:RequiredFieldValidator ID="vldNewPassword2Req" runat="server" ControlToValidate="txtPasswordVerify" ErrorMessage="Verify your password by typing it again." Text="*"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="vldPasswordCom" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordVerify" ErrorMessage="Passwords that you provided do not match" Text="*" />
                    </div>
                </div>  
                <div class="row clearfix">
                    <div class="lbl">* Security Code:</div>
                    <div class="value">
                        <img src="captcha.aspx?rnd=<%=(new Random()).Next(1000,9999).ToString()%>" alt="Graphical Security Code. If you cannot see it, please contact us." width="80" height="30"/>   
                        <asp:TextBox ID="txtSecurityCode" runat="server" Width="65px" MaxLength="6" CssClass="txt securitycode" />
                        <asp:RequiredFieldValidator ID="vldSecurityCode" runat="server" ControlToValidate="txtSecurityCode" Text="*" ErrorMessage="Security code is required."/>                        
                    </div>                    
                </div>
                <div class="row clearfix" style="margin-top:40px;">
                    <div class="lbl">&nbsp;</div>
                    <div class="value" style="text-align:right;float:right;margin-right:20px;">
                        <asp:Button ID="btnSignUp" runat="server" CssClass="btn" Text="NEXT" OnClick="btnSignUp_Click" OnClientClick="clearMessageBox();"/>
                    </div>
                </div>              
            </div>
        </div>

    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddSubscription.aspx.cs" Inherits="Account_AddSubscription" %>
<%@ Register Src="~/Controls/ExpDate.ascx" TagName="ExpDate" TagPrefix="uc1" %>

<asp:Content ID="StyleContent" ContentPlaceHolderID="HC" Runat="Server">
<style type="text/css">
    #subscriptioncontainer  { margin:20px 0px; font-family:Verdana, Georgia, Helvetica, Arial;}    
    #subscriptioncontainer h1 { margin:10px 0px; font-size:26px;  color:#5B5B5B; font-weight:normal; font-family:Tahoma; }
    #subscriptioncontainer .col1 { float:left; margin-right:50px; }    
    #subscriptioncontainer .col2 { float:left; }    
    #subscriptioncontainer .row { margin-bottom:10px; }
    #subscriptioncontainer .lbl { color:#444; font-weight:bold; float:left; text-align:right; width:175px; margin-right:15px; line-height:30px;}
    #subscriptioncontainer .value { float:left; }
    #subscriptioncontainer .txt { font-size:14px; font-weight:bold; padding:4px 2px; width:180px;}    
    #subscriptioncontainer .state { padding:4px 2px; font-size:12px;}
    #subscriptioncontainer .cnum_cctype { padding:4px 2px; font-size:12px;}
    #subscriptioncontainer .cnum_expmonth, #subscriptioncontainer .cnum_expyear { padding:4px 2px; font-size:12px;}
    #subscriptioncontainer .address, #subscriptioncontainer .city, #subscriptioncontainer .name{ width:225px; }
    #subscriptioncontainer .zip { width:100px; }    
    #subscriptioncontainer .seccode { width:80px; }
    #subscriptioncontainer .cnum { width:180px; font-weight:bold;font-size:14px; }
    #subscriptioncontainer .btn { padding:5px 10px; font-size:20px; font-weight:bold; font-family:Tahoma, Georgia, Arial; }
    #subscriptioncontainer .ex { font-size:11px; color:#888; }
    #subscriptioncontainer h2 {font-size:18px; margin:10px 0px; padding:0px; }
    #subscriptioncontainer .selectsub td { padding:5px; font-size:14px; font-weight:bold;}    
    #subscriptioncontainer .box.substatus { border:1px solid #cc0000; font-size:30px; font-weight:bold; }
</style>
<script type="text/javascript">
    function clearMessageBox() {
        $('#messageBox').empty();
    }
</script>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
 <div id="subscriptioncontainer">
    <asp:Literal ID="litCurrentSubscriptionStatus" runat="server" />
    <h1>
        Please select subscription option below and enter your billing information
    </h1>
    <div class="clearfix">       
        <div class="row clearfix">
            <asp:ValidationSummary ID="vldSummary" runat="server" ShowMessageBox="false" ShowSummary="true" />
            <div id="messageBox"><asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" /></div>
        </div>
         <h2>Select Subscription Option: <asp:RequiredFieldValidator ID="reqSubType" runat="server" ControlToValidate="lstSubscriptionTypes" Text="*" ErrorMessage="Please select Subscription Type" /></h2>
        <asp:RadioButtonList ID="lstSubscriptionTypes" runat="server" DataValueField="Value" DataTextField="Name" RepeatColumns="1" RepeatDirection="Vertical" CssClass="selectsub"></asp:RadioButtonList>        
        <hr />
        <h2>Enter Billing Details:</h2>
         <div class="col1">
            <div class="row clearfix">
                <div class="lbl">* First Name on credit card:</div>
                <div class="value">
                    <asp:TextBox ID="txtName" runat="server" CssClass="txt name" TabIndex="1" />
                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" Text="*" ErrorMessage="Please enter your first name as it appears on your credit card." />
                    <asp:RegularExpressionValidator ID="vldName2" runat="server" ControlToValidate="txtName" ErrorMessage="First Name should be between 2 and 100 characters and can only contain letters, spaces, a period, and a single-quote." ValidationExpression="[A-z\.\s\-']{2,100}">*</asp:RegularExpressionValidator>
                </div>
            </div>    
            <div class="row clearfix">
                <div class="lbl">* Last Name on credit card:</div>
                <div class="value">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="txt name" TabIndex="1" />
                    <asp:RequiredFieldValidator ID="reqLastName" runat="server" ControlToValidate="txtLastName" Text="*" ErrorMessage="Please enter your last name as it appears on your credit card." />
                    <asp:RegularExpressionValidator ID="vldLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name should be between 2 and 100 characters and can only contain letters, spaces, a period, and a single-quote." ValidationExpression="[A-z\.\s\-']{2,100}">*</asp:RegularExpressionValidator>
                </div>
            </div>           
            <div class="row clearfix">
                <div class="lbl">* Billing Address Line 1:</div>
                <div class="value">
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="txt address" TabIndex="3" />
                    <asp:RequiredFieldValidator ID="reqAddress1" runat="server" ControlToValidate="txtAddress1" Text="*" ErrorMessage="Please enter your address." />
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">Billing Address Line 2:</div>
                <div class="value">
                    <asp:TextBox ID="txtAddress2" runat="server" CssClass="txt address" TabIndex="4" />
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Billing City:</div>
                <div class="value">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="txt city" TabIndex="5" />
                    <asp:RequiredFieldValidator ID="reqCity" runat="server" ControlToValidate="txtCity" Text="*" ErrorMessage="Please enter your city." />
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Billing State:</div>
                <div class="value">
                    <asp:DropDownList ID="lstStates" runat="server"  DataSourceID="odsStates"  TabIndex="6" AppendDataBoundItems="true" DataTextField="IdAndName" DataValueField="ID" CssClass="state">
                        <asp:ListItem Text="-- Please Select --" Value="" />
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsStates" runat="server" TypeName="DayCareLib.Common.StateService" SelectMethod="GetStates"></asp:ObjectDataSource>
                    <asp:RequiredFieldValidator ID="vldState" runat="server" ControlToValidate="lstStates" ErrorMessage="Please select state." InitialValue="">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Billing Zip:</div>
                <div class="value">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="txt zip" TabIndex="7" />
                    <asp:RequiredFieldValidator ID="reqZip" runat="server" ControlToValidate="txtZip" Text="*" ErrorMessage="Please enter zip." />
                    <asp:RegularExpressionValidator ID="vldZip" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip/postal code where you live can only contain numbers, letters, spaces, and dashes." ValidationExpression="[A-z0-9\s\-]{4,100}">*</asp:RegularExpressionValidator>
                </div>
            </div>                       
        </div>
        <div class="col2">              
            <div class="row clearfix">
                <div class="lbl">* Credit Card Type:</div>
                <div class="value">
                    <asp:DropDownList ID="lstCcType" runat="server" AppendDataBoundItems="True" DataSourceID="CreditCardTypesDataSource" DataTextField="Value" DataValueField="Key" CssClass="cnum_cctype">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <img src="../images/visa-master-amex.gif" alt="Credit Card Types" />
                    <asp:ObjectDataSource ID="CreditCardTypesDataSource" runat="server" SelectMethod="GetCreditCardTypes" TypeName="DayCareLib.Common.CreditCardTypes"></asp:ObjectDataSource>
                    <asp:RequiredFieldValidator ID="vldCcType" runat="server" ControlToValidate="lstCcType" ErrorMessage="Credit card type is required">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Credit Card Number:</div>
                <div class="value">
                    <asp:TextBox ID="txtCcNum" runat="server"  MaxLength="20" AutoCompleteType="Disabled" CssClass="txt cnum" />
                    <asp:RequiredFieldValidator ID="vldCcNum" runat="server" ControlToValidate="txtCcNum" ErrorMessage="Credit card number is required">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vldCcNum2" runat="server" ControlToValidate="txtCcNum" ErrorMessage="Credit card number can be between 13 and 19 digits long" ValidationExpression="[0-9\s]{13,20}">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="vldCcNumCustom" runat="server" ControlToValidate="txtCcNum" ValidateEmptyText="True" OnServerValidate="CustomValidateCreditCard">*</asp:CustomValidator>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Expiration Date:</div>
                <div class="value">
                     <uc1:ExpDate id="ucExpDate" runat="server" IsRequired="True"></uc1:ExpDate>
                    <span class="ex">month and year</span>
                </div>
            </div>
            <div class="row clearfix">
                <div class="lbl">* Security Code:</div>
                <div class="value">
                    <asp:TextBox ID="txtCSC" runat="server" Width="35px" MaxLength="4" AutoCompleteType="Disabled" CssClass="txt seccode"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldCSC" runat="server" ControlToValidate="txtCSC" ErrorMessage="Credit card verification code is required">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vldCSC2" runat="server" ControlToValidate="txtCSC" ErrorMessage="Credit card verification code can be either 3 or 4 digits long" ValidationExpression="[0-9]{3,4}">*</asp:RegularExpressionValidator>
                    <div class="ex">3 digits for Visa and MasterCard.</div>
                    <div class="ex">4 digits for Amex</div>
                </div>
            </div>          
            <div class="row clearfix" style="margin-top:40px;">
                <div class="lbl">&nbsp;</div>
                <div class="value" style="text-align:right;float:right;margin-right:20px;">
                    <asp:Button ID="btnSignUp" runat="server" CssClass="btn" Text="SUBMIT" OnClick="btnSignUp_Click" OnClientClick="clearMessageBox();"/>
                </div>
            </div>              
        </div>
    </div>
</div>
</asp:Content>


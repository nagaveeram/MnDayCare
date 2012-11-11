<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep1.ascx.cs"
    Inherits="Controls_SignupControls_SignupStep1" %>
<div class="normal" style="width: 100%;">
    to get started, enter your license number below and
    <br />
    click your childcare setting:
</div>
<div class="normal" style="width: 100%;">
    <br />
    license number:
    <asp:TextBox ID="txtLicensenumber" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvtxtLicensenumber" runat="server" ControlToValidate="txtLicensenumber" Text="*" ErrorMessage="Please enter your Licensenumber." />    
</div>
<div class="clear">
</div>
<div style="margin: 50px auto;width:620px; ">
    <div style="float:left;">
        <asp:Button ID="btnFCProvider" runat="server" Text="Family Childcare Provider" 
            class="GreenBox Large" onclick="btnFCProvider_Click"  />
    </div>
    <div style="font-weight: bold; font-size: 30px; display: inherit; float: left; width: 100px;
        text-align: center; line-height: 100px;">
        or
    </div>
    <div style="float:left;">
        <asp:Button ID="btnCCCenter" runat="server" Text="Childcare Center" 
            class="GreenBox Large" onclick="btnCCCenter_Click" />
    </div>
    <div class="clear"></div>
</div>

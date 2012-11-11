<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep10.ascx.cs"
    Inherits="Controls_SignupControls_SignupStep10" %>
<div class="normal" style="width: 700px; text-align: center; line-height: 29px; margin: 0 auto;">
    with no contracts, sign-up fees, cancellation fees or monthly-minimums, we are confident
    that this 100% tax deductable business expense will provide you with the visibility
    and marketability you need.
</div>
<br />
<br />
<div class="normal" style="width: 700px; margin: 0 auto;">
    Please select your subscriber status and enter your billing information below:<br />
    <div style="line-height: 35px; float: left; margin-left: 55px;">
        <asp:CheckBox ID="chkPerMonth" runat="server" />$14.50/month
        <br />
        <asp:CheckBox ID="chkPerYear" runat="server" />$99.95/year
    </div>
</div>
<div class="clear"></div>
<table style="width:700px;margin:0 auto;">
    <tr >
        <td class="normal" style="text-align: left;width:200px;">
            first name:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingFName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            last name:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingLName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            billing address line 1:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingAddress1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            billing address line 2:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingAddress2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            billing city:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingCity" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            billing state:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingState" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            billing zip:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtBillingZip" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            email address:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            confimr email address:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtConfirmEmail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            user name:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            password:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            confirm password:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            name on credit card:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtCCName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            type of credit card:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtCCType" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            credit card numer:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtCCNum" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            expiration date:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtExpdate" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
            cvv security code:
        </td>
        <td class="normal" style="text-align: left;">
            <asp:TextBox ID="txtCVV" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="normal" style="text-align: left;">
          
        </td>
        <td class="normal" style="text-align: left;padding-left:50px;">
           <asp:Button ID="btnDCStep10Signup" runat="server" Text="Sign-up" class="GreenBox Medium" 
        style="font-size:25px;" onclick="btnDCStep10Signup_Click" />
        </td>
    </tr>
    
</table>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
<style type="text/css">
    #logincontainer { width:600px;margin:50px auto; }
    #logincontainer h1 { margin:10px 0px 30px; font-size:22px;  color:#5B5B5B; font-weight:normal; font-family:Tahoma; text-align:center;}
    #logincontainer .row { margin-bottom:10px; }
    #logincontainer .lbl { color:#444; font-weight:bold; float:left; text-align:right; width:175px; margin-right:15px; line-height:30px;}
    #logincontainer .value { float:left; }
    #logincontainer .txt { font-size:14px; font-weight:bold; padding:4px 2px; width:180px;}   
</style>
<script type="text/javascript">
    function clearMessageBox() {
        $('#messageBox').empty();
    }
</script>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
<div id="logincontainer">
<asp:ValidationSummary ID="vldSummary" runat="server" ShowMessageBox="false" ShowSummary="true" />
<div id="messageBox">
    <asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" />
</div>
<div class="box">   
    
    <h1>Please enter your username and password below:</h1>
    <div class="row clearfix">
        <div class="lbl">Username:</div>
        <div class="value">
            <asp:TextBox ID="txtUsername" runat="server" MaxLength="50" CssClass="txt"/>
            <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="txtUsername" Text="*" ErrorMessage="Please enter username." />
            <asp:RegularExpressionValidator ID="vldUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter valid username." ValidationExpression="^[A-z0-9_-]{3,15}$">*</asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="row clearfix">
        <div class="lbl">Password:</div>
        <div class="value">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" MaxLength="15" CssClass="txt"/>
            <asp:RequiredFieldValidator ID="vldPasswordReq" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please enter password." Text="*"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="vldPasswordReg" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please enter valid password." Text="*" ValidationExpression="[\S]{6,100}" />
        </div>
    </div>
    <div class="row clearfix">
        <div class="lbl">&nbsp;</div>
        <div class="value">
            <asp:Button ID="btnSubmit" runat="server" Text="LOGIN" CssClass="btn" OnClientClick="clearMessageBox();" OnClick="btnSubmit_Click" />
        </div>
    </div>
</div>
</div>
</asp:Content>


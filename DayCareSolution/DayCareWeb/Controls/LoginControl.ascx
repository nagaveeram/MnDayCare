<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginControl.ascx.cs" Inherits="Controls_LoginControl" %>
<asp:Panel ID="pnlLoggedOut" runat="server" Visible="false">
    <ul class="member_nav">
        <li><a id="lnkLogin" runat="server" href="~/login.aspx" class="nav_login">Login</a>|</li>
        <li><a id="lnkSignup" runat="server" href="~/signup.aspx" class="nav_signup">Sign Up</a></li>
    </ul>
</asp:Panel>
<asp:Panel ID="pnlLoggedIn" runat="server" Visible="false">
    <ul class="member_nav">
        <li>
            <a id="lnkProfile" runat="server" href="~/account/dashboard.aspx" class="nav_dashboard">
                <asp:Literal ID="litUsername" runat="server" />
            </a>|
        </li>
        <li>
            <a id="lnkLogout" runat="server" href="~/logout.aspx" class="nav_logout">Logout</a>
        </li>
    </ul>
</asp:Panel>

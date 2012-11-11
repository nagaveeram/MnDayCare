<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Account_Dashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
    <h1>Welcome to MN-DayCare.com</h1>
    <div class="messageBox">
        <asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" />
    </div>
</asp:Content>


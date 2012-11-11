<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExpDate.ascx.cs" Inherits="Controls_ExpDate" %>
<asp:DropDownList ID="lstMonth" runat="server" CssClass="cnum_expmonth"></asp:DropDownList>
<asp:DropDownList ID="lstYear" runat="server" CssClass="cnum_expyear"></asp:DropDownList>
<asp:RequiredFieldValidator ID="vldMonth" runat="server" ControlToValidate="lstMonth" Enabled="False" ErrorMessage="Expiration month is required">*</asp:RequiredFieldValidator>
<asp:RequiredFieldValidator ID="vldYear" runat="server" ControlToValidate="lstYear" Enabled="False" ErrorMessage="Expiration year is required">*</asp:RequiredFieldValidator>
<asp:CustomValidator ID="vldExpDate" runat="server" ControlToValidate="lstYear" OnServerValidate="vldExpDate_ServerValidate">*</asp:CustomValidator>
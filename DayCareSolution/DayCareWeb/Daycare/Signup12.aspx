<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Signup12.aspx.cs" Inherits="Signup12" %>
<%@ Register TagName="SignupStep1" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep1.ascx" %>
<%@ Register TagName="SignupStep2" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep2.ascx" %>
<%@ Register TagName="SignupStep3" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep3.ascx" %>
<%@ Register TagName="SignupStep4" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep4.ascx" %>
<%@ Register TagName="SignupStep5" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep5.ascx" %>
<%@ Register TagName="SignupStep10" TagPrefix="CC" src="~/Controls/SignupControls/SignupStep10.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HC" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
 <div class="row clearfix">
    <asp:ValidationSummary ID="vldSummary" runat="server" ShowMessageBox="false" ShowSummary="true" />
    <div id="messageBox"><asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" /></div>
</div>

<asp:MultiView ID="mvSignup" runat="server" Visible="true" ViewStateMode="Enabled" ActiveViewIndex="4">
 <asp:View ID="vStep1" runat="server">
  <CC:SignupStep1 ID="SignupStep1" runat="server"></CC:SignupStep1> 
 </asp:View> 
 <asp:View ID="vStep2" runat="server">
  <CC:SignupStep2 ID="SignupStep2" runat="server"></CC:SignupStep2> 
 </asp:View>
 <asp:View ID="vStep3" runat="server">
  <CC:SignupStep3 ID="SignupStep3" runat="server"></CC:SignupStep3> 
 </asp:View>
 <asp:View ID="vStep4" runat="server">
  <CC:SignupStep4 ID="SignupStep4" runat="server"></CC:SignupStep4> 
 </asp:View>
 <asp:View ID="vStep5" runat="server">
  <CC:SignupStep5 ID="SignupStep5" runat="server"></CC:SignupStep5> 
 </asp:View>
 <asp:View ID="vStep6" runat="server"></asp:View>
 <asp:View ID="vStep10" runat="server">
 <CC:SignupStep10 ID="SignupStep10" runat="server"></CC:SignupStep10> 
 </asp:View>
</asp:MultiView>

</asp:Content>

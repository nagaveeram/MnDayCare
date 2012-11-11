<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep2.ascx.cs" Inherits="Controls_SignupControls_SignupStep2" %>
<div style="width:100%;margin: 0 auto;">
<div class="normal" style="width:100%;"> 
verify your information is correct:
</div>
<p></p>
<div class="normal" style="width:480px;margin:0 auto;;"> 
<table>
<tr>
<td class="normal" style="text-align:left;">
   name/name of facility:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCName" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   address line 1:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCaddress1" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   address line 2:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCaddress2" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   city:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCCity" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   state:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCState" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   zip:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCZip" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   Phone number:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCPhoneNumber" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td class="normal" style="text-align:left;">
   license number:
</td>
<td class="normal" style="text-align:left;">
  <asp:Label ID="lblDCLicenseNumber" runat="server">TESTSTEWTETEWTEWTR</asp:Label>
</td>
</tr>
<tr>
<td>
</td>
<td>
<p></p>
</td>
</tr>
<tr>
<td>
</td>
<td style="text-align:right;">
<asp:Button ID="btnDCStep2Next" runat="server" Text="next" class="GreenBox Medium" 
        style="font-size:25px;" onclick="btnDCStep2Next_Click"/>
</td>
</tr>
</table>


</div>
</div>
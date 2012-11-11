<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep3.ascx.cs" Inherits="Controls_SignupControls_SignupStep3" %>
<div class="normal" >
tell us about your child care facility:
</div>
<div class="normal" style="margin:0 auto; width:650px;">
<div>
 <asp:TextBox ID="txtDCAboutus" runat="server" TextMode="MultiLine" Rows="10" Columns="100"></asp:TextBox>
</div>
<div style="float:right;padding:5px;">
 <asp:Button ID="btnDCStep3Next" runat="server" Text="next" class="GreenBox Medium" 
        onclick="btnDCStep3Next_Click"/>
</div>
</div>
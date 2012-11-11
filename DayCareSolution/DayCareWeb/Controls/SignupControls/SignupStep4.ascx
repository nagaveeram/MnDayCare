<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep4.ascx.cs" Inherits="Controls_SignupControls_SignupStep4" %>
<div class="normal" style="width:700px;">
select the amenities below that are present at your child care facility:
</div>
<div class="normal" style="margin:20px 40px; width:650px;">
<div style="line-height:25px;text-align:left;margin-left:50px;">
 infant care <br />
 toddler care <br />
 preschool aged cure
</div>
<div style="float:right;padding:5px;">
 <asp:Button ID="btnDCStep4Next" runat="server" Text="next" class="GreenBox Medium" 
        onclick="btnDCStep4Next_Click"/>
</div>
</div>
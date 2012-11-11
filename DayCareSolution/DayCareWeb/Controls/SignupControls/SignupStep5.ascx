<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SignupStep5.ascx.cs" Inherits="Controls_SignupControls_SignupStep5" %>
<div >
     introduce yourself to parents by uploading a photo of yourself, and write about your childcare experience, and why you are a great child care provider
 </div>
 <div class="GreenBar"></div>
 
 <div style="margin: 0 auto;width:900px;">
 <div style="width:450px;float:left;"> 
  <asp:FileUpload ID="FileUpload1" runat="server" Width="1"  />
    <br />
    <asp:TextBox ID="txtEducationBackGround" runat="server" onfocus="Focus(this.id,'enter education background here: (high school diploma, BA/BS, MA, PHD)')"
                    onblur="Blur(this.id,'enter education background here: (high school diploma, BA/BS, MA, PHD)')" 
		    CssClass="WaterMarkedTextBox" Width="417px">enter education background here: (high school diploma, BA/BS, MA, PHD)</asp:TextBox>
     <br />
    <asp:TextBox ID="txtExperience" runat="server" onfocus="Focus(this.id,'enter number years experience as a child care provider here:')"
                    onblur="Blur(this.id,'enter number years experience as a child care provider here:')" 
		    CssClass="WaterMarkedTextBox" Text="enter number years experience as a child care provider here:" Width="375px"></asp:TextBox>   
  </div>
 
 <div style="width:450px;float:left;"> 
    <asp:TextBox ID="TxtBio" runat="server" onfocus="Focus(this.id,'Enter Bio Here!')"
                    onblur="Blur(this.id,'Enter Bio Her!')" 
		    CssClass="WaterMarkedTextBox" Text="Enter Bio Here!" TextMode="MultiLine" Rows="20" Columns="100"></asp:TextBox>    
</div>
<div class="clear"></div>
</div>
<div class="clear"></div>
<div style="margin:0 auto;width:900px;padding-top:15px;padding-right:5px; ">
  <asp:Button ID="btnDCStep5Next" style="float:right;" runat="server" Text="next" 
        class="GreenBox Medium" onclick="btnDCStep5Next_Click"/>
</div>
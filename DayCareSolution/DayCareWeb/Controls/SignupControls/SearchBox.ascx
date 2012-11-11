<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchBox.ascx.cs" Inherits="Controls_SignupControls_SearchBox" %>

<span class="near">
    <asp:TextBox ID="txtZipcode" runat="server" MaxLength="5" CssClass="s" Text="Zip Code"
        onblur="if (this.value == '') {this.value = 'Zip Code';}"
        onfocus="if (this.value == 'Zip Code') {this.value = '';}" />

    <asp:RegularExpressionValidator runat="server" ID="valNumbersOnly" ControlToValidate="txtZipcode" Display="Dynamic" 
        ErrorMessage="Enter a valid Zip code" 
        ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)" />
</span> 
                    
<asp:ImageButton runat="server" ID="btnSearch" CssClass="search_btn" 
ImageUrl="~/images/go_button.png" AlternateText="Search" />
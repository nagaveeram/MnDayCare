<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginForm.ascx.cs" Inherits="Controls_SignupControls_LoginForm" %>
    <div style="padding-left:100px">
        <table>
            <tr>
                <td>
                    <h2>Username: </h2>
                </td>
                <td>
                    <h2><asp:TextBox ID="txtUsername" runat="server" Width="250px" /></h2>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <h2>Password: </h2>
                </td>
                <td>
                    <h2><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="250px" /></h2>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server" Text="No records matched the credentials entered. Try again!"
                     ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align:center">
                    <asp:ImageButton runat="server" ID="btnLogin" CssClass="search_btn" 
                    ImageUrl="~/images/go_button.png" AlternateText="login" />
                </td>
            </tr>
        </table>
    </div>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
    <style type="text/css">
        #homecontainer 
        {
            margin:60px 0px 20px;
        }
        
        #homecontainer .childpic 
        {
            float:left;
            margin-right:20px;
        }
        
        #homecontainer .childpic img { border:0; }
        #homecontainer .homecontent
        {
            font-family:Verdana, Georgia, Helvetica, Arial;
        }
        
        .homecontent h1 
        {
            font-size:30px;
            margin-bottom:10px;
            color:#5B5B5B;
            font-weight:bold;
            font-family:Tahoma, Verdana, Georgia, Helvetica, Arial;
        }
        
        #homecontainer .description
        {
            font-size:12px;
            line-height:18px;
            color:#111;
            text-shadow:1px 1px 0 #fff;            
        }
        
        .searchzip_container 
        {
            margin-top:30px;
        }
        
        .searchzip_container h2 
        {   
            font-size:22px;
            margin-bottom:10px;
            color:#333;
            font-weight:bold;
            font-family:Tahoma, Verdana, Georgia, Helvetica, Arial;
        }
        
        .searchzip .txt
        {
            font-size:20px;
            font-weight:bold;
            width:90px;
            padding:4px 2px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">
    <div id="homecontainer" class="clearfix">
        <div class="childpic">
            <img src="images/home-child.png" alt="mn-daycare.com" />
        </div>
        <div class="homecontent">
            <h1>Find licensed child care near you</h1>
            <div class="description">
                mn-daycare.com is Minnesota's largest and most comprehensive licensed child care search engine.                 
                With over 15,000 listings, we're proud to connect parents with locally licensed child care providers every single day.
            </div>
            <div class="searchzip_container">
                <h2>Find licensed child care now</h2>
                <div class="searchzip">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="txt" MaxLength="5" placeholder="Zip Code" />
                    <asp:Button ID="btnSubmit" runat="server" Text="GO" CssClass="btn"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


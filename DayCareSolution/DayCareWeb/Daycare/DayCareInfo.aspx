<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="DayCareInfo.aspx.cs" Inherits="DayCareInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HC" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <div>
        <div style="width: 66%; float: left;">
            <div style="text-align: center;">
                <div class="DCInfoName">
                    <asp:Label ID="lblDCName" runat="server" Style="font-size: 20px; font-weight: bold;">Delightful Children's House</asp:Label>
                </div>
                <div class="DCInfoAddress">
                    <asp:Label ID="lblDCAddress" runat="server" Style="font-size: 11px; font-weight: bold;">123 Main Street, Minneappolis, MN 55455</asp:Label>
                </div>
                <div class="DCInfoPhone">
                    <asp:Label ID="lblDCPhone" runat="server" Style="font-size: 15px; font-weight: bold;">612-555-5555</asp:Label>
                </div>
            </div>
            <p>
            </p>
            <p>
            </p>
            <asp:Label ID="lblDCBio" runat="server" class="DCBio">
     We have been in business for more than 25 years and are proud  to server families in Northeast Minneapolis. We offer all day care to infants, toodlers, preschool and school aged children. Our friendly and diverse staff is trained in early childhood education, and we warmly welcome your children each morning. We offere a highly structred and age appropriate learning environment, outdoor play time and 
            </asp:Label>
        </div>
        <div style="width: 34%; float: right;">
            <img src="/images/gmap.png" alt="" />
        </div>
    </div>
    <div>
        <div style="float: left; width: 50%;text-align:center;">
          <img src="/images/daycare.png" />
          <br />
          <b>Restriction - no transport of children under 9</b>
          <br />
          <b>Capacity - 14</b>
        </div>
        <div style="width: 50%; float: right;">
            <div style="text-align: center;float:left;margin:15px;">
                <b>Hours of Operation:</b>
                <div>
                    Mon: 6am - 6pm<br />
                    Mon: 6am - 6pm<br />
                    Mon: 6am - 6pm<br />
                </div>
            </div>
            <div style="float:left;margin:15px;">
                <div style="text-align: center;">
                    <b>Ameniteis we provide:</b>
                    <div style="text-align:left; margin: 7px;">
                        infant care<br />
                        toddler care<br />
                        preschool care<br />
                        infant care<br />
                        toddler care<br />
                        preschool care<br />
                    </div>                    
                </div>
                <div>
                </div>
            </div>
            <div class="clear"></div>
            <div style="margin:15px;">
             <b>Openings:</b>
              <div>
               infants yes-capacity 12<br />
               infants yes-capacity 12<br />
               infants yes-capacity 12<br />
               preschool age: no - next opening 6/2/2012 - capacity 14<br />
              </div>
            </div>
            <div class="clear"></div>
            <div >
             <b> Located in school district #: (goes here)</b>
            </div>
            <div>
             <div style="line-height:20px;font-weight:bold;font-size:20px;margin:10px;width:200px;float:left;">Nearby schools:</div>
             <div style="line-height:30px;font-weight:bold;font-size:15px;float:left;"> 
               - Washington elementary<br />
               - Jackson Middle School<br />
               - Washington elementary<br />
               - Jackson Middle School<br />
               </div>
               <div class="clear"></div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
    <script src="//maps.googleapis.com/maps/api/js?key=<%=CommonLib.Util.GetAppSetting(DayCareLib.Common.Constants.AppSettingKeys.GoogleMapsApiKey)%>&sensor=false&libraries=places" type="text/javascript"></script>
<link rel="Stylesheet" href="styles/search.css" type="text/css" />
 <script type="text/javascript">
     var _gMap = null;
     var _geocoder = null;
     var _gCenter = new google.maps.LatLng(44.983334,-93.26667);
     var _gMapBounds = new google.maps.LatLngBounds();
     var _data = <%= _searchResults == null || _searchResults.Count() == 0 ? "{}" : _searchResults %>;
     var _numberOfMarkers = 0;
     var _markers = new Array();
     var infoWindow = null;

     function initgMap() {
         if (document.getElementById('gMapDiv') != null) {
             var mapOptions = {
                 center: _gCenter,
                 zoom: 10,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };
             _geocoder = new google.maps.Geocoder();
             _gMap = new google.maps.Map(document.getElementById('gMapDiv'), mapOptions);
             if (!_gMapBounds.isEmpty()) {
                 _gMap.fitBounds(_gMapBounds);
             }

             infoWindow = new google.maps.InfoWindow({ content: "" });
         }
     }

     function addMarkersTogMap() {
         if(_data.query != "" && _data.results != null) {
             var viewOnMapLinks = $(".gvpointonmap");
             $(".gvpointonmap").each(function() {
                 var $pointonmap = $(this);
                 var license = $pointonmap.data("lno");
                 var latitude = $pointonmap.data("lat");
                 var longitude = $pointonmap.data("lon");
                 

                 if(latitude.length > 0 && longitude.length > 0) {
                     var name = $pointonmap.data("name");
                     var address = $pointonmap.data("address");
                     var phone = $pointonmap.data("phone");
                     var marker = new google.maps.Marker({ 
                         position: new google.maps.LatLng(latitude, longitude), 
                         map: _gMap,
                         title:dc.Name
                     });

                     $pointonmap.click((function (marker) { return function() {
                         google.maps.event.trigger(marker, 'click');
                         $.scrollTop(50);
                         return false;
                     }})(marker));

                     _markers.push(marker);
                     _gMapBounds.extend(new google.maps.LatLng(latitude, longitude));
                     _numberOfMarkers += 1;
                     google.maps.event.addListener(marker, 'click', (function(marker, name, address, phone) {  return function() {                      
                         infoWindow.setContent(getInfoWindowHtml(name, address, phone));
                         infoWindow.open(_gMap, marker);
                     }})(marker, name, address, phone));
                 }
             });
         }
     }

     function getInfoWindowHtml(name, address, phone) {
         var html = $.validator.format("<div style='margin-bottom:10px;font-size:14px;'><b>{0}</b></div>", name);
         html += $.validator.format("<div style='font-style:italic;'>{0}</div>", address);
         if(phone != "") {
             html += $.validator.format("<div style='margin-top:10px;'>Call: {0}</div>", phone);
         }
         return html;
     }

     function addBoundsTogMap() {
         if (!_gMapBounds.isEmpty()) {
             _gMap.fitBounds(_gMapBounds);

             // Zoom after fit bounds finishes
             zoomChangeBoundsListener = google.maps.event.addListenerOnce(_gMap, 'bounds_changed',
                 function (event) {
                     if (_numberOfMarkers == 1 || this.getZoom() == 21)
                         this.setZoom(15);
                 }
             );

             // Remove the bounds change event handler to prevent further zoom changes
             setTimeout(function () { google.maps.event.removeListener(zoomChangeBoundsListener) }, 2000);
         }
     }

     $(window).load(function () {
         initgMap();
         addMarkersTogMap();
         addBoundsTogMap();
     });

</script>
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MC" Runat="Server">  
    <div class="srmaincontainer clearfix">
        <div id="messageBox"><asp:Literal ID="litCurrentMessage" runat="server" EnableViewState="false" /></div>     
        <div class="srtitle">
            <asp:Literal ID="litTitle" runat="server" />
        </div>
        <div class="srcontainer1 clearfix">
            <div class="searchboxcontainer">
                <div class="searchbox">
                    To begin a new search <br />
                    Enter a new zip code: <br />
                    <asp:TextBox ID="txtZip" runat="server" CssClass="txt" MaxLength="5" placeholder="Zip Code"  />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="GO" OnClick="btnSubmit_Click" />
                </div>
            </div>
            <div class="mapcontainer">
                <div id="gMapDiv"></div>
            </div>
        </div>
        <div class="srcontainer2">
            <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false" ShowHeader="false" DataSourceID="objSearchResults" 
                AllowPaging="true" AllowSorting="false" PageSize="10" PagerSettings-Mode="NumericFirstLast" PagerSettings-Position="Bottom">
                <RowStyle CssClass="gvrow" />
                 <Columns>
                    <asp:TemplateField ItemStyle-CssClass="gvcol1">
                        <ItemTemplate>
                            <%#FormatHtml(Container.DataItem, "image")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gvcol2">
                        <ItemTemplate>
                            <div class="gvtitle"><%#FormatHtml(Container.DataItem, "title")%></div>
                            <div class="gvaddr"><%#FormatHtml(Container.DataItem, "address")%></div>
                            <div class="gvdesc"><%#FormatHtml(Container.DataItem, "desc")%></div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gvcol3">
                        <ItemTemplate>
                            <div class="gvphone"><%#FormatHtml(Container.DataItem, "phone")%></div>
                            <div class="gvdetails"><%#FormatHtml(Container.DataItem, "viewdetails")%></div>
                            <a href="#" class="gvpointonmap" data-lno="<%#Eval("LicenseNo")%>" data-lat="<%#Eval("Latitude")%>" 
                                data-lon="<%#Eval("Longitude")%>" data-name="<%#Eval("Name")%>" data-address="<%#Eval("Address")%>" data-phone="<%#Eval("Phone")%>">
                                <%#FormatHtml(Container.DataItem, "viewonmap")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="objSearchResults" runat="server" TypeName="DayCareLib.Services.SearchResultService" SelectMethod="GetSearchResultsFromRepository" OnSelecting="objSearchResults_Selecting">
                <SelectParameters>
                    <asp:Parameter DbType="Double" Name="latitude" DefaultValue="44.292559"/>
                    <asp:Parameter DbType="Double" Name="longitude" DefaultValue="-93.302827" />
                    <asp:Parameter DbType="Double" Name="radiusInMiles" DefaultValue="50" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>       
    </div>
</asp:Content>


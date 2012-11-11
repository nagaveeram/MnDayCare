<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HC" Runat="Server">
<script src="//maps.googleapis.com/maps/api/js?key=<%=CommonLib.Util.GetAppSetting(DayCareLib.Common.Constants.AppSettingKeys.GoogleMapsApiKey)%>&sensor=false&libraries=places" type="text/javascript"></script>
<link rel="Stylesheet" href="styles/search.css" type="text/css" />
 <script type="text/javascript">
     var _gMap = null;
     var _geocoder = null;
     var _gCenter = new google.maps.LatLng(44.983334,-93.26667);
     var _gMapBounds = new google.maps.LatLngBounds();
     var _data = <%= _searchResults %>;
     var _numberOfMarkers = 0;

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
        }
     }

     function addMarkersTogMap() {
        if(_data.query != "" && _data.results != null) {
            for(i = 0; i<_data.results.length; i++) {
                var dc = _data.results[i];
                var latitude = dc.Latitude;
                var longitude = dc.Longitude;

                if (latitude != 0 && longitude != 0) {
                    var marker = new google.maps.Marker({ position: new google.maps.LatLng(latitude, longitude), map: _gMap });
                    _gMapBounds.extend(new google.maps.LatLng(latitude, longitude));
                    _numberOfMarkers += 1;
                }
            }
        }
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
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="GO" />
                </div>
            </div>
            <div class="mapcontainer">
                <div id="gMapDiv"></div>
            </div>
        </div>
        <div class="srcontainer2">
            <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false" ShowHeader="false">
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
                            <div class="gvpointonmap" data-lat="<%#Eval("Latitude")%>" data-lon="<%#Eval("Longitude")%>">
                                <%#FormatHtml(Container.DataItem, "viewonmap")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>       
    </div>
</asp:Content>


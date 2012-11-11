using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;
using NetUtilitiesLib;

namespace DayCareLib.Common.Geography
{
    public class GeoCoder
    {
        #region Location
        [Serializable]
        public class Location
        {
            public string Name { get; set; }
            public string Confidence { get; set; }
            public string EntityType { get; set; }
            public string AddressLine { get; set; }
            public string AdminDistrict { get; set; }
            public string AdminDistrict2 { get; set; }
            public string CountryRegion { get; set; }
            public string Locality { get; set; }
            public string PostalCode { get; set; }
            public string FormattedAddress { get; set; }

            public double Latitude { get; set; }
            public double Longitude { get; set; }

            public string Provider { get; set; }

            public Location()
            {
                Name = Confidence = EntityType = AddressLine = AdminDistrict = AdminDistrict2 = CountryRegion = Locality = PostalCode = FormattedAddress = "";
                Latitude = Longitude = 0;
            }
        }
        #endregion


        private static string _apiUrlGoogleByQuery = "http://maps.googleapis.com/maps/api/geocode/xml?address={query}&sensor=false&region=us";
        private static string _apiUrlGoogleReverse = "http://maps.googleapis.com/maps/api/geocode/xml?latlng={point}&sensor=false&region=us";

        private static int _timeout = 5000;
        private static DateTime _lastOverQueryLimitReachedGoogle = Constants.Values.EmptyDate;


        public List<Location> GetLocationsByUrlFromGoogle(string url)
        {
            List<Location> l = null;

            try
            {
                HttpPage p = HttpPage.GetHttpPage(url, _timeout, "GET", "", "", 1024000, false, 1, true, "", "");

                if (p.ResultMessage == "")
                {
                    l = new List<Location>();

                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(p.Content);
                    string status = GetInnerText(xmlDoc.SelectSingleNode("/GeocodeResponse/status")).ToUpper();

                    if (status == "OVER_QUERY_LIMIT")
                        _lastOverQueryLimitReachedGoogle = DateTime.Now;

                    if (status != "OK")
                        return l;

                    XmlNodeList xmlNodes = xmlDoc.SelectNodes("/GeocodeResponse/result");
                    XmlNode node;

                    foreach (XmlNode xmlNode in xmlNodes)
                    {
                        Location location = new Location();

                        node = xmlNode.SelectSingleNode("formatted_address");
                        if (node != null && node.InnerText != null)
                            location.FormattedAddress = node.InnerText;

                        XmlNodeList addressComponents = xmlNode.SelectNodes("address_component");

                        if (addressComponents != null)
                        {
                            foreach (XmlNode addressComponent in addressComponents)
                            {
                                node = addressComponent.SelectSingleNode("type");
                                string type = GetInnerText(node);
                                if (type != "")
                                {
                                    string longName = GetInnerText(addressComponent.SelectSingleNode("long_name"));
                                    string shortName = GetInnerText(addressComponent.SelectSingleNode("short_name"));
                                    if (type == "locality")
                                        location.Locality = longName;
                                    if (type == "administrative_area_level_1")
                                        location.AdminDistrict = shortName;
                                    if (type == "administrative_area_level_2")
                                        location.AdminDistrict2 = longName;
                                    if (type == "postal_code")
                                        location.PostalCode = longName;
                                    if (type == "country")
                                        location.CountryRegion = shortName;
                                    if (type == "street_number")
                                        location.AddressLine = longName + " ";
                                    if (type == "route")
                                        location.AddressLine += longName;
                                }
                            }
                        }

                        XmlNode locationNode = xmlNode.SelectSingleNode("geometry/location");
                        if (locationNode != null)
                        {
                            string latStr = GetInnerText(locationNode.SelectSingleNode("lat"));
                            string lngStr = GetInnerText(locationNode.SelectSingleNode("lng"));
                            if (latStr != "" && lngStr != "")
                            {
                                location.Latitude = double.Parse(latStr);
                                location.Longitude = double.Parse(lngStr);
                            }
                        }

                        location.Provider = "GOOGLE";

                        l.Add(location);
                    }
                }
            }
            catch
            {
                l = null;
            }

            return l;
        }

        public List<Location> GetLocationsByQueryFromGoogle(string query)
        {
            string url = _apiUrlGoogleByQuery.Replace("{query}", HttpUtility.UrlEncode(query));
            List<Location> locations = GetLocationsByUrlFromGoogle(url);
            if (locations != null)
            {
                //TODO: Logging if necessary                
            }
            return locations;
        }

        private string GetInnerText(XmlNode node)
        {
            if (node != null && node.InnerText != null)
                return node.InnerText;
            return "";
        }
    }
}

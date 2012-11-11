using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Domain
{
    public class SearchResult
    {
        public int LicenseNo { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string DayCareType { get; set; }
        public string Age { get; set; }
        public string Description { get; set; }
        public string Phone { get; set; }
        public string ImageUrl { get; set; }
        public double Distance { get; set; }
        public bool IsSponsored { get; set; }

        public SearchResult()
        {
            LicenseNo = 0;
            Name = Address = DayCareType = Age = Description = "";
            Latitude = Longitude = 0;
            Phone = "";
            Distance = 0;
            IsSponsored = false;
            ImageUrl = "/images/daycare/default.png";
        }
    }
}

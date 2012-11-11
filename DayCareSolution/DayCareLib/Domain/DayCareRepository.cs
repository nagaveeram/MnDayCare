using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DayCareLib.Common;

namespace DayCareLib.Domain
{
    [Serializable]
    public class DayCareRepository
    {  
        public int LicenseNo { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string DayCareType { get; set; }
        public string Age { get; set; }
        public string Description { get; set; }

        public DayCareRepository()
        {
            LicenseNo = 0;
            Name = Address = DayCareType = Age = Description = "";
            Latitude = Longitude = 0;           
        }

        public static DayCareRepository ConvertToRepository(DataRow dr)
        {
            DayCareRepository r = new DayCareRepository();
            r.LicenseNo = Helpers.ConvertToInt(dr, "LicenseNo");
            r.Name = Helpers.ConvertToString(dr, "Name");
            r.Address = Helpers.ConvertToString(dr, "Address");
            r.Latitude = Helpers.ConvertToDouble(dr, "Latitude");
            r.Longitude = Helpers.ConvertToDouble(dr, "Longitude");
            r.DayCareType = Helpers.ConvertToString(dr, "DayCareType");
            r.Age = Helpers.ConvertToString(dr, "Age");
            r.Description = Helpers.ConvertToString(dr, "Description");           
            return r;
        }
    }
}

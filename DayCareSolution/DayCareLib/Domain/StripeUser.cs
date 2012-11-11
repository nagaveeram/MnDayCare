using DayCareLib.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DayCareLib.Domain
{
    public class StripeUser
    {
        public int StripeUserID { get; set; }
        public int UserID { get; set; }
        public string StripeCustomerID { get; set; }
        public string Description { get; set; }
        public bool LiveMode { get; set; }
        public DateTime DateCreated { get; set; }

        public StripeUser()
        {
            StripeUserID = UserID = 0;
            StripeCustomerID = Description = "";
            LiveMode = false;
            DateCreated = Constants.Values.EmptyDate;
        }

        public static StripeUser ConvertToStripeUser(DataRow dr)
        {
            StripeUser su = new StripeUser();
            su.StripeUserID = Helpers.ConvertToInt(dr, "StripeUserID");
            su.UserID = Helpers.ConvertToInt(dr, "UserID");
            su.StripeCustomerID = Helpers.ConvertToString(dr, "StripeCustomerID");
            su.Description = Helpers.ConvertToString(dr, "Description");
            su.LiveMode = Helpers.ConvertToBoolean(dr, "LiveMode");
            su.DateCreated = Helpers.ConvertToDateTime(dr, "DateCreated");

            return su;
        }
    }
}

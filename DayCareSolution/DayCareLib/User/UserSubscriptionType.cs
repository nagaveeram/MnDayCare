using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;

namespace DayCareLib.User
{
    public class UserSubscriptionType
    {
        public int SubscriptionTypeID { get; set; }
        public decimal Amount { get; set; }
        public Constants.Enumerators.DurationType DurationType { get; set; }
        public double DurationTime { get; set; }
        public int TotalCycles { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
        public int Rank { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }

        public UserSubscriptionType()
        {
            SubscriptionTypeID = Status = Rank = 0;
            Amount = 0;
            DurationType = Constants.Enumerators.DurationType.Days;
            DurationTime = 0;
            Name = Description = "";
            DateCreated = DateModified = Constants.Values.EmptyDate;
        }

        public static UserSubscriptionType ConvertToUserSubscriptionType(DataRow dr)
        {
            UserSubscriptionType subType = new UserSubscriptionType();
            subType.SubscriptionTypeID = Helpers.ConvertToInt(dr, "SubscriptionTypeID");
            subType.Amount = Helpers.ConvertToDecimal(dr, "Amount"); 
            subType.DurationTime = Helpers.ConvertToDouble(dr, "DurationTime");
            subType.DurationType = (Constants.Enumerators.DurationType)Helpers.ConvertToInt(dr, "DurationTypeID");
            subType.TotalCycles = Helpers.ConvertToInt(dr, "TotalCycles");
            subType.Name = Helpers.ConvertToString(dr, "Name");
            subType.Description = Helpers.ConvertToString(dr, "Description");
            subType.Status = Helpers.ConvertToInt(dr, "Status");
            subType.Rank = Helpers.ConvertToInt(dr, "Rank");
            subType.DateCreated = Helpers.ConvertToDateTime(dr, "DateCreated");
            subType.DateModified = Helpers.ConvertToDateTime(dr, "DateModified");
            return subType;
        }

        public DateTime GetDateEnd(DateTime dateStart)
        {
            int durationTime = Convert.ToInt32(DurationTime);
            DateTime dateEnd = Constants.Values.EmptyDate;
            if(SubscriptionTypeID == 0 || Status != 1 || DurationTime == 0)
                return dateEnd;

            if (DurationType == Constants.Enumerators.DurationType.Minutes)
                return dateStart.AddMinutes(durationTime);

            if (DurationType == Constants.Enumerators.DurationType.Seconds)
                return dateStart.AddSeconds(durationTime);

            if (DurationType == Constants.Enumerators.DurationType.Days)
                return dateStart.AddDays(durationTime);

            if (DurationType == Constants.Enumerators.DurationType.Months)
                return dateStart.AddMonths(durationTime);

            if (DurationType == Constants.Enumerators.DurationType.Years)
                return dateStart.AddYears(durationTime);

            return dateEnd;
        }
    }
}

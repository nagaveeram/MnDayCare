using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CommonLib;
using DayCareLib.Common;

namespace DayCareLib.User.DAL
{
    public class UserSubscriptionData
    {
        private UserSubscriptionData() { }

        public static bool UpdateUserSubscriptionStatus(int subscriptionID, int userID, int status)
        {
            int resultCode = -1;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionsUpdateStatus,
                            CommonData.SqlParam("@SubscriptionID", SqlDbType.Int, 4, subscriptionID),
                            CommonData.SqlParam("@UserID", SqlDbType.Int, 4, userID),
                            CommonData.SqlParam("@Status", SqlDbType.Int, 4, status),
                            CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, -1));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    resultCode = Convert.ToInt32(dr[0]["Value"]);
            }

            return (resultCode == 0);
        }

        public static List<UserSubscriptionType> GetUserSubscriptionTypes()
        {
            List<UserSubscriptionType> subscriptionTypes = new List<UserSubscriptionType>();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionTypesGet);
            if (ds != null && ds.Tables["Data"] != null)
            {
                DataTable dt = ds.Tables["Data"];
                foreach (DataRow dr in dt.Rows)
                    subscriptionTypes.Add(UserSubscriptionType.ConvertToUserSubscriptionType(dr));

            }

            return subscriptionTypes;
        }      

        public static int AddUserSubscriptionType(decimal amount, int durationTypeID, double durationTime, int totalCycles, string name, string description, int status, int rank)
        {
            int subscriptionTypeID = 0;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionTypesAdd,
              CommonData.SqlParam("@Amount", SqlDbType.Money, 8, amount),
              CommonData.SqlParam("@DurationTypeID", SqlDbType.Int, 4, durationTypeID),
              CommonData.SqlParam("@DurationTime", SqlDbType.Decimal, 10, durationTime),
              CommonData.SqlParam("@TotalCycles", SqlDbType.Int, 4, totalCycles),
              CommonData.SqlParam("@Name", SqlDbType.VarChar, 256, name),
              CommonData.SqlParam("@Description", SqlDbType.NVarChar, 512, description),
              CommonData.SqlParam("@Status", SqlDbType.Int, 4, status),
              CommonData.SqlParam("@Rank", SqlDbType.Int, 4, rank),
              CommonData.SqlParam("@SubscriptionTypeID", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@SubscriptionTypeID'");
                if (dr.Length > 0)
                    subscriptionTypeID = Convert.ToInt32(dr[0]["Value"]);
            }

            return subscriptionTypeID;
        }

        public static bool UpdateUserSubscriptionTypeStatus(int subscriptionTypeID, int status)
        {
            int resultCode = -1;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionTypesUpdateStatus,              
                CommonData.SqlParam("@SubscriptionTypeID", SqlDbType.Int, 4, subscriptionTypeID),
                CommonData.SqlParam("@Status", SqlDbType.Int, 4, status),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, -1));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    resultCode = Convert.ToInt32(dr[0]["Value"]);
            }

            return resultCode == 0;
        }

        public static List<UserSubscription> GetUserSubscriptions(int userID = 0, DateTime? dateStart = null, DateTime? dateEnd = null, int status = 0)
        {
            dateStart = dateStart ?? Constants.Values.EmptyDate;
            dateEnd = dateEnd ?? Constants.Values.EmptyDate;

            List<UserSubscription> subscriptionTypes = new List<UserSubscription>();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionsGet);
            if (ds != null && ds.Tables["Data"] != null)
            {
                DataTable dt = ds.Tables["Data"];
                foreach (DataRow dr in dt.Rows)
                    subscriptionTypes.Add(UserSubscription.ConvertToUserSubscription(dr));
            }

            return subscriptionTypes;
        }        

        public static int AddUserSubscription(int userID, int subscriptionTypeID, DateTime dateStart, DateTime dateEnd, int status)
        {
            int subscriptionID = 0;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionsAdd,
              CommonData.SqlParam("@UserID", SqlDbType.Int, 4, userID),
              CommonData.SqlParam("@SubscriptionTypeID", SqlDbType.Int, 4, subscriptionTypeID),              
              CommonData.SqlParam("@DateStart", SqlDbType.DateTime, 8, dateStart.Date),
              CommonData.SqlParam("@DateEnd", SqlDbType.DateTime, 8, dateEnd.Date),           
              CommonData.SqlParam("@Status", SqlDbType.Int, 4, status),
              CommonData.SqlParam("@SubscriptionID", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@SubscriptionID'");
                if (dr.Length > 0)
                    subscriptionID = Convert.ToInt32(dr[0]["Value"]);
            }

            return subscriptionID;
        }

        public static DateTime GetUserSubscriptionExpiryDate(int userID)
        {
            DateTime expiry = Constants.Values.EmptyDate;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserSubscriptionStatusGet,
                            CommonData.SqlParam("@UserID", SqlDbType.Int, 4, userID));

            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Data"].Rows[0];
                expiry = Convert.ToDateTime(dr["DateEnd"]);
            }

            return expiry;
        }
    }
}

using CommonLib;
using DayCareLib.Common;
using DayCareLib.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DayCareLib.Data
{
    public sealed class StripeUserData
    {
        private StripeUserData() { }

        public static int AddStripeUser(int userID, string stripeCustomerID, string description, bool livemode)
        {
            int stripeUserID = 0;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.StripeUsersAdd,
                CommonData.SqlParam("@UserID", SqlDbType.Int, 4, userID),
                CommonData.SqlParam("@StripeCustomerID", SqlDbType.VarChar, 512, stripeCustomerID),
                CommonData.SqlParam("@Description", SqlDbType.NVarChar, 102400, description),
                CommonData.SqlParam("@LiveMode", SqlDbType.Bit, 1, livemode),
                CommonData.SqlParam("@StripeUserID", ParameterDirection.Output, SqlDbType.Int, 4, stripeUserID));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@stripeUserID'");
                if (dr.Length > 0)
                    stripeUserID = Convert.ToInt32(dr[0]["Value"]);
            }

            return stripeUserID;
        }

        public static List<StripeUser> GetStripeUsers(int userID = 0, string stripeCustomerID = "")
        {
            List<StripeUser> stripeUsers = new List<StripeUser>();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.StripeUsersGet,
                CommonData.SqlParam("@UserID", SqlDbType.Int, 4, userID),
                CommonData.SqlParam("@StripeCustomerID", SqlDbType.VarChar, 512, stripeCustomerID));

            if (ds != null && ds.Tables["Data"] != null)
            {
                DataTable dt = ds.Tables["Data"];
                foreach (DataRow dr in dt.Rows)
                    stripeUsers.Add(StripeUser.ConvertToStripeUser(dr));
            }

            return stripeUsers;
        }
    }
}

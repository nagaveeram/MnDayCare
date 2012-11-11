using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CommonLib;
using DayCareLib.Common;

namespace DayCareLib.User.DAL
{
    public sealed class UserLogData
    {
        private UserLogData() { }

        public static int AddUserLog(Guid aspnetUserID, int userID, string action, string ip, string userAgent, string surferID)
        {
            int userLogID = 0;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserLogAdd,
                CommonData.SqlParam("@aspnetUserID", SqlDbType.UniqueIdentifier, 16, (aspnetUserID == Guid.Empty) ? (object)DBNull.Value : (object)aspnetUserID),
                CommonData.SqlParam("@userID", SqlDbType.Int, 4, userID),
                CommonData.SqlParam("@action", SqlDbType.NVarChar, 2048, action),
                CommonData.SqlParam("@ip", SqlDbType.VarChar, 15, ip),
                CommonData.SqlParam("@userAgent", SqlDbType.VarChar, 255, userAgent),
                CommonData.SqlParam("@surferID", SqlDbType.VarChar, 50, surferID),
                CommonData.SqlParam("@userLogID", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@userLogID'");
                if (dr.Length > 0)
                    userLogID = Convert.ToInt32(dr[0]["Value"]);
            }

            return userLogID;
        }

        public static List<UserLog> GetByAspnetUserID(DateTime dateFrom, DateTime dateTo, Guid aspnetUserID)
        {
            List<UserLog> l = null;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserLogGet,
                CommonData.SqlParam("@dateFrom", SqlDbType.DateTime, 8, dateFrom),
                CommonData.SqlParam("@dateTo", SqlDbType.DateTime, 8, dateTo),
                CommonData.SqlParam("@aspnetUserID", SqlDbType.UniqueIdentifier, 16, aspnetUserID));

            if (ds != null && ds.Tables["Data"] != null)
            {
                l = new List<UserLog>();

                foreach (DataRow dr in ds.Tables["Data"].Rows)
                {
                    l.Add(UserLog.ConvertToUserLogItem(dr));
                }
            }

            return l;
        }

        public static List<UserLog> GetByUserID(DateTime dateFrom, DateTime dateTo, int userID)
        {
            List<UserLog> l = null;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UserLogGet,
                CommonData.SqlParam("@dateFrom", SqlDbType.DateTime, 8, dateFrom),
                CommonData.SqlParam("@dateTo", SqlDbType.DateTime, 8, dateTo),
                CommonData.SqlParam("@userID", SqlDbType.Int, 16, userID));

            if (ds != null && ds.Tables["Data"] != null)
            {
                l = new List<UserLog>();

                foreach (DataRow dr in ds.Tables["Data"].Rows)
                {
                    l.Add(UserLog.ConvertToUserLogItem(dr));
                }
            }

            return l;
        }
    }
}

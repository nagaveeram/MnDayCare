using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommonLib;
using System.Data;
using DayCareLib.Common;

namespace DayCareLib.User.DAL
{
    public sealed class UserData
    {
        private UserData() { }

        public static User GetUserByAspnetUserID(Guid aspnetUserID)
        {
            User user = new User();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UsersGetByAspnetUserID,
                           CommonData.SqlParam("@aspnetUserID", SqlDbType.UniqueIdentifier, 16, aspnetUserID));


            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Data"].Rows[0];
                user = User.ConvertToUser(dr);
            }

            return user;
        }

        public static User GetUser(int userID, string username, string email)
        {
            User user = new User();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UsersGet,
                           CommonData.SqlParam("@userID", SqlDbType.Int, 4, userID),
                           CommonData.SqlParam("@username", SqlDbType.VarChar, 100, username),
                           CommonData.SqlParam("@email", SqlDbType.NVarChar, 256, email));


            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Data"].Rows[0];
                user = User.ConvertToUser(dr);
            }

            return user;
        }

        public static int CreateUser(Guid aspnetUserID, string username, int accessType, int status, string firstName, string lastName, string address1, string address2, string city, string state, string zip, string phone)
        {   
            int userID = 0;
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UsersAdd,                            
                            CommonData.SqlParam("@aspnetUserID", SqlDbType.UniqueIdentifier, 16, aspnetUserID),
                            CommonData.SqlParam("@username", SqlDbType.VarChar, 100, username),
                            CommonData.SqlParam("@accessType", SqlDbType.Int, 4, accessType),
                            CommonData.SqlParam("@status", SqlDbType.Int, 4, status),
                            CommonData.SqlParam("@firstName", SqlDbType.VarChar, 100, firstName),
                            CommonData.SqlParam("@lastName", SqlDbType.VarChar, 100, lastName),
                            CommonData.SqlParam("@address1", SqlDbType.NVarChar, 512, address1),
                            CommonData.SqlParam("@address2", SqlDbType.NVarChar, 512, address2),
                            CommonData.SqlParam("@city", SqlDbType.NVarChar, 200, city),
                            CommonData.SqlParam("@state", SqlDbType.NVarChar, 100, state),
                            CommonData.SqlParam("@zip", SqlDbType.NVarChar, 100, zip),
                            CommonData.SqlParam("@phone", SqlDbType.NVarChar, 100, phone),
                            CommonData.SqlParam("@userID", ParameterDirection.Output, SqlDbType.Int, 4, userID));


            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@userID'");
                if (dr.Length > 0)
                    userID = Convert.ToInt32(dr[0]["Value"]);
            }

            return userID;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommonLib;
using System.Data;
using DayCareLib.Common;

namespace DayCareLib.Provider.DAL
{
    class ProviderData
    {

        private ProviderData() { }

            public static Provider GetProviderByAspnetUserID(Guid aspnetUserID)
            {
                Provider provider = new Provider();
                String sql = "";
                DataTable dt = CommonData.FetchData(sql);


                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    provider = Provider.ConvertToProvider(dr);
                }

                return provider;
            }

            public static Provider GetProvider(int providerID, string username, string email)
            {
                Provider provider = new Provider();
                DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.ProvidersGet,
                               CommonData.SqlParam("@username", SqlDbType.VarChar, 100, username),
                               CommonData.SqlParam("@email", SqlDbType.NVarChar, 256, email));


                if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables["Data"].Rows[0];
                    provider = Provider.ConvertToProvider(dr);
                }

                return provider;
            }

            public static int CreateProvider(Guid aspnetUserID, string username, string licenseNumber, int accessType, int status)
            {
                int providerID = 0;
                DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.UsersAdd,
                                CommonData.SqlParam("@aspnetUserID", SqlDbType.UniqueIdentifier, 16, aspnetUserID),
                                CommonData.SqlParam("@username", SqlDbType.VarChar, 100, username),
                                CommonData.SqlParam("@LicenseNumber", SqlDbType.NVarChar, 100, licenseNumber), 
                                CommonData.SqlParam("@accessType", SqlDbType.Int, 4, accessType),
                                CommonData.SqlParam("@status", SqlDbType.Int, 4, status),                                
                                CommonData.SqlParam("@ProviderID", ParameterDirection.Output, SqlDbType.Int, 4, providerID));


                if (ds != null && ds.Tables["Parameters"] != null)
                {
                    DataRow[] dr = ds.Tables["Parameters"].Select("Name='@providerID'");
                    if (dr.Length > 0)
                        providerID = Convert.ToInt32(dr[0]["Value"]);
                }

                return providerID;
            }
       
    }

}

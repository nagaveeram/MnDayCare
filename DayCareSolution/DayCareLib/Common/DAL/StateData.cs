using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommonLib;
using System.Data;

namespace DayCareLib.Common.DAL
{
    public sealed class StateData
    {
        private StateData()
        {
        }

        public static DataTable GetStatesByCultureID(string cultureID)
        {
            DataTable dt = null;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.StatesGet,
                CommonData.SqlParam("@CULTUREID", SqlDbType.VarChar, 10, cultureID));

            if (ds != null && ds.Tables["Data"] != null)
                dt = ds.Tables["Data"];

            return dt;
        }
    }
}

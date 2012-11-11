using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommonLib;
using DayCareLib.Common;
using System.Data;
using DayCareLib.Domain;

namespace DayCareLib.Data
{
    public sealed class RepositoryData
    {
        private RepositoryData() { }

        public static List<DayCareRepository> GetAllDayCareRepositoryData()
        {
            List<DayCareRepository> repositoryData = new List<DayCareRepository>();
            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.DayCareRepositoryGetAll);

            if (ds != null && ds.Tables["Data"] != null)
            {
                foreach (DataRow dr in ds.Tables["Data"].Rows)
                    repositoryData.Add(DayCareRepository.ConvertToRepository(dr));
            }
            return repositoryData;
        }
    }
}

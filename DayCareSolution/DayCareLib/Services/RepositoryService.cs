using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Domain;
using DayCareLib.Data;

namespace DayCareLib.Services
{
    public sealed class RepositoryService
    {
        private RepositoryService() { }

        public static List<DayCareRepository> GetAllDayCareRepositoryData()
        {
            //TODO: Implement caching

            return RepositoryData.GetAllDayCareRepositoryData();
        }
    }
}

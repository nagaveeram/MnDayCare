using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Domain;
using AutoMapper;

namespace DayCareLib.Common.AutoMapper
{
    public static class MappingExtensions
    {
        public static SearchResult ToSearchResult(this DayCareRepository repository)
        {
            return Mapper.Map<DayCareRepository, SearchResult>(repository);
        }
    }
}

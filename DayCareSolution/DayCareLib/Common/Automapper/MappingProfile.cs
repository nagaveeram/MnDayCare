using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;
using DayCareLib.Domain;

namespace DayCareLib.Common.AutoMapper
{
    public class MappingProfile : Profile
    {
        public override string ProfileName
        {
            get
            {
                return "DayCare.Web";
            }
        }

        protected override void Configure()
        {
            Mapper.CreateMap<DayCareRepository, SearchResult>()
                .ForMember(dest => dest.IsSponsored, a => a.Ignore())
                .ForMember(dest => dest.Distance, a => a.Ignore())
                .ForMember(dest => dest.ImageUrl, a => a.Ignore())
                .ForMember(dest => dest.Phone, a => a.Ignore());
        }
    }

}

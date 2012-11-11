using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;

namespace DayCareLib.Common.AutoMapper
{
    public sealed class AutoMapperConfig
    {
        private AutoMapperConfig() { }

        public static void InitializeMappings()
        {   
            Mapper.Initialize(c => c.AddProfile<MappingProfile>());

            Mapper.AssertConfigurationIsValid();
        }
    }
}

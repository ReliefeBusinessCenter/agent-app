using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class SalesProfile : Profile
    {
        public SalesProfile()
        {
            CreateMap<broker.Models.Sales, SalesDto>()
            .ForMember(dest => dest.SalesId, opt => opt.MapFrom(src => src.SalesId))
            .ForMember(dest => dest.Quantity, opt => opt.MapFrom(src => src.Quantity))
              .ForMember(dest => dest.Color, opt => opt.MapFrom(src => src.Color))
            .ForMember(dest => dest.ProductId, opt => opt.MapFrom(src => src.ProductId));
           
            CreateMap<SalesDto, broker.Models.Sales>();

        }
        //  

    }

}


    
using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class BuysProfile : Profile
    {
        public BuysProfile()
        {
            CreateMap<broker.Models.Buy, BuyDto>()
            .ForMember(dest => dest.BuyId, opt => opt.MapFrom(src => src.BuyId))
            .ForMember(dest => dest.Quantity, opt => opt.MapFrom(src => src.Quantity))
              .ForMember(dest => dest.Color, opt => opt.MapFrom(src => src.Color))
            .ForMember(dest => dest.ProductId, opt => opt.MapFrom(src => src.ProductId));

            CreateMap<BuyDto, broker.Models.Buy>();

        }
        //  

    }

}



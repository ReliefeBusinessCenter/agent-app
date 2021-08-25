



using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class DealsProfile : Profile
    {
        public DealsProfile()
        {
            CreateMap<broker.Models.Deals, DealsDto>()
            .ForMember(dest => dest.DealsId, opt => opt.MapFrom(src => src.DealsId))
            .ForMember(dest => dest.Quantity, opt => opt.MapFrom(src => src.Quantity))
              .ForMember(dest => dest.Location, opt => opt.MapFrom(src => src.Location))
            .ForMember(dest => dest.Color, opt => opt.MapFrom(src => src.Color))
            .ForMember(dest => dest.PaymentOption, opt => opt.MapFrom(src => src.PaymentOption))
            .ForMember(dest => dest.DealsStatus, opt => opt.MapFrom(src => src.DealsStatus));
            
           
             
            CreateMap<DealsDto, broker.Models.Deals>();

        }
        //  







    }

}




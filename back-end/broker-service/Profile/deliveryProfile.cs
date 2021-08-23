


using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class DeliveryProfile : Profile
    {
        public DeliveryProfile()
        {
            CreateMap<broker.Models.Delivery, DeliveryDto>()
            .ForMember(dest => dest.DeliveryId, opt => opt.MapFrom(src => src.DeliveryId))
            .ForMember(dest => dest.DeliveryStatus, opt => opt.MapFrom(src => src.DeliveryStatus))
              .ForMember(dest => dest.Location, opt => opt.MapFrom(src => src.Location));
            // .ForMember(dest => dest.CustomerId, opt => opt.MapFrom(src => src.CustomerId))
            //  .ForMember(dest => dest.Customer, opt => opt.MapFrom(src => src.Customer));
            CreateMap<DeliveryDto, broker.Models.Delivery>();

        }
        //  







    }

}

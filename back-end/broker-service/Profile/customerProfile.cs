using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            CreateMap<broker.Models.Customer, CustomerDto>()
            .ForMember(dest => dest.CustomerId, opt => opt.MapFrom(src => src.CustomerId))
            .ForMember(dest => dest.Reviews, opt => opt.MapFrom(src => src.Reviews))
            .ForMember(dest => dest.Deals, opt => opt.MapFrom(src => src.Deals))
            .ForMember(dest => dest.Sales, opt => opt.MapFrom(src => src.Sales))

            .ForMember(dest => dest.User, opt => opt.MapFrom(src => src.User));


            CreateMap<CustomerDto, broker.Models.Customer>();

        }






    }

}

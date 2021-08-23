using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class BrokerProfile : Profile
    {
        public BrokerProfile()
        {
            CreateMap<broker.Models.Broker, BrokerDto>()
            .ForMember(dest => dest.BrokerId, opt => opt.MapFrom(src => src.BrokerId))
            .ForMember(dest => dest.Portfolios, opt => opt.MapFrom(src => src.Portfolios))
            .ForMember(dest => dest.Deliveries, opt => opt.MapFrom(src => src.Deliveries))
            .ForMember(dest => dest.Deals, opt => opt.MapFrom(src => src.Deals))
            .ForMember(dest => dest.Buys, opt => opt.MapFrom(src => src.Buys))
            .ForMember(dest => dest.Reviews, opt => opt.MapFrom(src => src.Reviews))
            .ForMember(dest => dest.Skills, opt => opt.MapFrom(src => src.Skills))
            .ForMember(dest => dest.UserId, opt => opt.MapFrom(src => src.UserId))
            .ForMember(dest => dest.User, opt => opt.MapFrom(src => src.User))
            .ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.CategoryId))
            .ForMember(dest => dest.Catigory, opt => opt.MapFrom(src => src.Catigory));
           CreateMap<BrokerDto, broker.Models.Broker>();

        }
     

      
        

    
    
 }

    }

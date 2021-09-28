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
            .ForMember(dest => dest.Portfolio, opt => opt.MapFrom(src => src.Portfolio))
            .ForMember(dest => dest.Delivery, opt => opt.MapFrom(src => src.Delivery))
            .ForMember(dest => dest.Deals, opt => opt.MapFrom(src => src.Deals))
            
            .ForMember(dest => dest.Review, opt => opt.MapFrom(src => src.Review))
            .ForMember(dest => dest.Skills, opt => opt.MapFrom(src => src.Skills))
            .ForMember(dest => dest.CategoryId, opt => opt.MapFrom(src => src.CategoryId))
            .ForMember(dest => dest.User, opt => opt.MapFrom(src => src.User))
           
            .ForMember(dest => dest.Category, opt => opt.MapFrom(src => src.Category));
           CreateMap<BrokerDto, broker.Models.Broker>();

        }
     

      
        

    
    
 }

    }

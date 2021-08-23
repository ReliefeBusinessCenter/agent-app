


using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class PortfolioProfile : Profile
    {
        public PortfolioProfile()
        {
            CreateMap<broker.Models.Portfolio, PortfolioDto>()
            .ForMember(dest => dest.PortfolioId, opt => opt.MapFrom(src => src.PortfolioId))
            .ForMember(dest => dest.Image, opt => opt.MapFrom(src => src.Image))
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name))
            .ForMember(dest => dest.Description, opt => opt.MapFrom(src => src.Description));
            CreateMap<PortfolioDto, broker.Models.Portfolio>();

        }
        //  






    }

}

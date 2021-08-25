
using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class ReviewProfile : Profile
    {
        public ReviewProfile()
        {
            CreateMap<broker.Models.Review, ReviewDto>()
            .ForMember(dest => dest.ReviewId, opt => opt.MapFrom(src => src.ReviewId))
            .ForMember(dest => dest.rate, opt => opt.MapFrom(src => src.rate));
           CreateMap<ReviewDto, broker.Models.Review>();
        }
        // 
        
    }

}
 
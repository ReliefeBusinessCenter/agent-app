


using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class CategoryProfile : Profile
    {
        public CategoryProfile()
        {
            CreateMap<broker.Models.Category, CategoryDto>()
            .ForMember(dest => dest.CatigoryId, opt => opt.MapFrom(src => src.CategoryId))
            .ForMember(dest => dest.CatigoryName, opt => opt.MapFrom(src => src.CatigoryName));
            CreateMap<CategoryDto, broker.Models.Category>();

        }
        //  







    }

}

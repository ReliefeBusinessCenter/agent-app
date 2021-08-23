using AutoMapper;
using broker.Dto;
using broker.Models;

namespace broker.Profiles
{
    public class SkillsProfile : Profile
    {
        public SkillsProfile()
        {
            CreateMap<broker.Models.Skills, SkillsDto>()
            .ForMember(dest => dest.SkillsId, opt => opt.MapFrom(src => src.SkillsId))
            .ForMember(dest => dest.CommunicationSkill, opt => opt.MapFrom(src => src.CommunicationSkill))
            .ForMember(dest => dest.BrokingSkill, opt => opt.MapFrom(src => src.BrokingSkill))
            .ForMember(dest => dest.WorkDone, opt => opt.MapFrom(src => src.WorkDone))
            .ForMember(dest => dest.WorkInProgress, opt => opt.MapFrom(src => src.WorkInProgress));
            CreateMap<SkillsDto, broker.Models.Skills>();

        }
        //  
 







    }

}

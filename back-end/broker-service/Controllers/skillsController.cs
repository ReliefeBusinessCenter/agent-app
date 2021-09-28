using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;
using broker.Data;
using broker.Models;
using AutoMapper;
using broker.Dto;
using Microsoft.AspNetCore.Authorization;

namespace Controllers
{   
    //   [Authorize]
    [Route("api/skills")]
    [ApiController]
    public class SkillsController : ControllerBase
    {
        private readonly IRepository<Skills> _skillsRepository;
        private readonly IMapper _mapper;
        public SkillsController(IRepository<Skills> repo, IMapper mapper)
        {
            _skillsRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetSkills()
        {
            var model = await _skillsRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<SkillsDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetSkillsById(int id)
        {
            Console.WriteLine("Returning skills of id" + id);
            var model = await _skillsRepository.GetDataById(id);
            return Ok(_mapper.Map<SkillsDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateSkills(SkillsDto skillsDto)
        {
            Console.WriteLine("Creating brokers");
            var skills = _mapper.Map<Skills>(skillsDto);
            await _skillsRepository.UpdateData(skills);
            return Ok(skillsDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSkills(int id)
        {
            var model = await _skillsRepository.GetDataById(id);
            var skills = _mapper.Map<Skills>(model);
            await _skillsRepository.DeleteData(skills);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateSkills(int id, SkillsDto skillsDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var skills = _mapper.Map<Skills>(skillsDto);
            await _skillsRepository.UpdateData(skills);
            return Ok(skills);
        }
        //   public async Task<IActionResult> GetPaginatedBrokers(int pageNumber,int pageSize, string orderBy,string search)
        // {   
        //     // ServiceRepository _service= new ServiceRepository();
        //      Console.WriteLine("These are the comming constriant");
        //      Console.WriteLine(pageNumber);
        //      Console.WriteLine(orderBy);
        //      Console.WriteLine(search);
       
        //    var model = await _catigoryRepository.GetPaginatedData(pageNumber,pageSize,orderBy,search);

        // var totalPage= await _catigoryRepository.GetTotalPage(pageSize,search);
        // BrokerData broker= new BrokerData(totalPage,model);
             
        //      return Ok(broker);
        // }
        
    }

}
using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;

namespace Controllers
{
    [Route("api/brokers")]
    [ApiController]
    public class BrokerController : ControllerBase
    {
        private readonly IRepository<Technician> _technicianRepository;
        private readonly IMapper _mapper;
        public TechnicianController(IRepository<Technician> repo, IMapper mapper)
        {
            _technicianRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetTechnicians()
        {
            var model = await _technicianRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<TechnicianDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetTechnicianById(int id)
        {
            Console.WriteLine("Returning technician of id" + id);
            var model = await _technicianRepository.GetDataById(id);
            return Ok(_mapper.Map<TechnicianDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateTechnician(TechnicianDto TechnicianDto)
        {
            Console.WriteLine("Creating Technician");
            var Technician = _mapper.Map<Technician>(TechnicianDto);
            await _technicianRepository.UpdateData(Technician);
            return Ok(TechnicianDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTechnicians(int id)
        {
            var model = await _technicianRepository.GetDataById(id);
            var Technician = _mapper.Map<Technician>(model);
            await _technicianRepository.DeleteData(Technician);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateTechnician(int id, TechnicianDto technician)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var Technician = _mapper.Map<Technician>(technician);
            await _technicianRepository.UpdateData(Technician);
            return Ok(technician);
        }
        
    }

}
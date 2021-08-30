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
      [Authorize]
    [Route("api/deals")]
    [ApiController]
    public class DealsController : ControllerBase
    {
        private readonly IRepository<Deals> _dealsRepository;
        private readonly IMapper _mapper;
        public DealsController(IRepository<Deals> repo, IMapper mapper)
        {
            _dealsRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetDeals()
        {
            var model = await _dealsRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<DealsDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetDealsById(int id)
        {
            Console.WriteLine("Returning Deals of id" + id);
            var model = await _dealsRepository.GetDataById(id);
            return Ok(_mapper.Map<DealsDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateDeals(DealsDto dealsDto)
        {
            Console.WriteLine("Creating deals");
            var deals = _mapper.Map<Deals>(dealsDto);
            await _dealsRepository.UpdateData(deals);
            return Ok(dealsDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDeals(int id)
        {
            var model = await _dealsRepository.GetDataById(id);
            var deals = _mapper.Map<Deals>(model);
            await _dealsRepository.DeleteData(deals);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDeals(int id, DealsDto  dealsDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var deals = _mapper.Map<Deals>(dealsDto);
            await _dealsRepository.UpdateData(deals);
            return Ok(deals);
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
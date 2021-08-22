using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;
using broker.Data;
using broker.Models;
using AutoMapper;

namespace Controllers
{
    [Route("api/brokers")]
    [ApiController]
    public class BrokerController : ControllerBase
    {
        private readonly IRepository<Broker> _brokerRepository;
        private readonly IMapper _mapper;
        public BrokerController(IRepository<Broker> repo, IMapper mapper)
        {
            _brokerRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetBrokers()
        {
            var model = await _brokerRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<BrokerDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetBrokerById(int id)
        {
            Console.WriteLine("Returning technician of id" + id);
            var model = await _brokerRepository.GetDataById(id);
            return Ok(_mapper.Map<BrokerDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateTechnician(BrokerDto brokerDto)
        {
            Console.WriteLine("Creating brokers");
            var Broker = _mapper.Map<Broker>(brokerDto);
            await _brokerRepository.UpdateData(Broker);
            return Ok(brokerDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTechnicians(int id)
        {
            var model = await _brokerRepository.GetDataById(id);
            var Technician = _mapper.Map<Broker>(model);
            await _brokerRepository.DeleteData(Technician);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateTechnician(int id, BrokerDto brokerDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var Broker = _mapper.Map<Broker>(brokerDto);
            await _brokerRepository.UpdateData(Broker);
            return Ok(Broker);
        }
          public async Task<IActionResult> GetPaginatedBrokers(int pageNumber,int pageSize, string orderBy,string search)
        {   
            // ServiceRepository _service= new ServiceRepository();
             Console.WriteLine("These are the comming constriant");
             Console.WriteLine(pageNumber);
             Console.WriteLine(orderBy);
             Console.WriteLine(search);
       
           var model = await _brokerRepository.GetPaginatedData(pageNumber,pageSize,orderBy,search);

        var totalPage= await _brokerRepository.GetTotalPage(pageSize,search);
        // Broker broker= new ServiceData(totalPage,model);
             
             
    // var totalRecords = await context.Customers.CountAsync();
    // return Ok(new PagedResponse<List<Customer>>(pagedData, validFilter.PageNumber, validFilter.PageSize));
            //  return Ok(_mapper.Map<ServiceDto>(model));
             return Ok(service);
        }
        
    }

}
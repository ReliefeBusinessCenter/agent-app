using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;
using broker.Data;
using broker.Models;
using AutoMapper;
using broker.Dto;

namespace Controllers
{
    [Route("api/sales")]
    [ApiController]
    public class SalesController : ControllerBase
    {
        private readonly IRepository<Sales> _salesRepository;
        private readonly IMapper _mapper;
        public SalesController(IRepository<Sales> repo, IMapper mapper)
        {
            _salesRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetSales()
        {
            var model = await _salesRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<SalesDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetSalesById(int id)
        {
            Console.WriteLine("Returning Sales of id" + id);
            var model = await _salesRepository.GetDataById(id);
            return Ok(_mapper.Map<SalesDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreatSales(SalesDto salesDto)
        {
            Console.WriteLine("Creating Sales");
            var sales = _mapper.Map<Sales>(salesDto);
            await _salesRepository.UpdateData(sales);
            return Ok(salesDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSales(int id)
        {
            var model = await _salesRepository.GetDataById(id);
            var sales = _mapper.Map<Sales>(model);
            await _salesRepository.DeleteData(sales);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateSales(int id, SalesDto  salesDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var sales = _mapper.Map<Sales>(salesDto);
            await _salesRepository.UpdateData(sales);
            return Ok(sales);
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
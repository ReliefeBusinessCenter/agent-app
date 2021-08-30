using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;
using broker.Data;
using broker.Models;
using AutoMapper;
using broker.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace Controllers
{   
    [Authorize]
     [ApiController]
    [Route("api/buys")]
   
    public class BuysController : ControllerBase
    {
        private readonly IRepository<Buy> _buysRepository;
        private readonly IMapper _mapper;
        public BuysController(IRepository<Buy> repo, IMapper mapper)
        {
            _buysRepository = repo;
            _mapper = mapper;
        } 
        [Authorize(AuthenticationSchemes=JwtBearerDefaults.AuthenticationScheme,Roles = "Customer")]
   
        [HttpGet]
        public async Task<IActionResult> GetBuys()
        {
            var model = await _buysRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<BuyDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetBuysById(int id)
        {
            Console.WriteLine("Returning Sales of id" + id);
            var model = await _buysRepository.GetDataById(id);
            return Ok(_mapper.Map<BuyDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreatBuys(BuyDto buyDto)
        {
            Console.WriteLine("Creating Buys");
            var buys = _mapper.Map<Buy>(buyDto);
            await _buysRepository.UpdateData(buys);
            return Ok(buyDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBuys(int id)
        {
            var model = await _buysRepository.GetDataById(id);
            var buys = _mapper.Map<Buy>(model);
            await _buysRepository.DeleteData(buys);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateSales(int id, BuyDto  buyDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var buys = _mapper.Map<Buy>(buyDto);
            await _buysRepository.UpdateData(buys);
            return Ok(buys);
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
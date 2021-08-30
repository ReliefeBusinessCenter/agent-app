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
    [Route("api/portfolio")]
    [ApiController]
    public class PortfolioController : ControllerBase
    {
        private readonly IRepository<Portfolio> _portfolioRepository;
        private readonly IMapper _mapper;
        public PortfolioController(IRepository<Portfolio> repo, IMapper mapper)
        {
            _portfolioRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetPortfolios()
        {
            var model = await _portfolioRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<PortfolioDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetPortfolioById(int id)
        {
            Console.WriteLine("Returning portfolio  of id" + id);
            var model = await _portfolioRepository.GetDataById(id);
            return Ok(_mapper.Map<PortfolioDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreatePortfolio(PortfolioDto portfolioDto)
        {
            Console.WriteLine("Creating portfolio");
            var portfolio = _mapper.Map<Portfolio>(portfolioDto);
            await _portfolioRepository.UpdateData(portfolio);
            return Ok(portfolioDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePortfolio(int id)
        {
            var model = await _portfolioRepository.GetDataById(id);
            var portfolio = _mapper.Map<Portfolio>(model);
            await _portfolioRepository.DeleteData(portfolio);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdatePortfolio(int id, PortfolioDto  portfolioDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var portfolio = _mapper.Map<Portfolio>(portfolioDto);
            await _portfolioRepository.UpdateData(portfolio);
            return Ok(portfolio);
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
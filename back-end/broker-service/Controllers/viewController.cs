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
    [Route("api/views")]
    [ApiController]
    public class ViewsController : ControllerBase
    {
        private readonly IRepository<Review> _viewsRepository;
        private readonly IMapper _mapper;
        public ViewsController(IRepository<Review> repo, IMapper mapper)
        {
            _viewsRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetViews()
        {
            var model = await _viewsRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<ReviewDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetViewsById(int id)
        {
            Console.WriteLine("Returning skills of id" + id);
            var model = await _viewsRepository.GetDataById(id);
            return Ok(_mapper.Map<ReviewDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateViews(ReviewDto reviewDto)
        {
            Console.WriteLine("Creating View");
            var views = _mapper.Map<Review>(reviewDto);
            await _viewsRepository.UpdateData(views);
            return Ok(reviewDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteViews(int id)
        {
            var model = await _viewsRepository.GetDataById(id);
            var views = _mapper.Map<Review>(model);
            await _viewsRepository.DeleteData(views);
            return Ok(model);
        }
        
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateView(int id, ReviewDto  reviewDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var views = _mapper.Map<Review>(reviewDto);
            await _viewsRepository.UpdateData(views);
            return Ok(views);
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
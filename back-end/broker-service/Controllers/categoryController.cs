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
    [Route("api/categories")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly IRepository<Category> _catigoryRepository;
        private readonly IMapper _mapper;
        public CategoryController(IRepository<Category> repo, IMapper mapper)
        {
            _catigoryRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetCatigories()
        {
            var model = await _catigoryRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<CategoryDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetCategoryById(int id)
        {
            Console.WriteLine("Returning technician of id" + id);
            var model = await _catigoryRepository.GetDataById(id);
            return Ok(_mapper.Map<CategoryDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateCategories(CategoryDto categoryDto)
        {
            Console.WriteLine("Creating brokers");
            var category = _mapper.Map<Category>(categoryDto);
            await _catigoryRepository.UpdateData(category);
            return Ok(categoryDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCategories(int id)
        {
            var model = await _catigoryRepository.GetDataById(id);
            var categories = _mapper.Map<Category>(model);
            await _catigoryRepository.DeleteData(categories);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCategories(int id, CategoryDto categoryDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var category = _mapper.Map<Category>(categoryDto);
            await _catigoryRepository.UpdateData(category);
            return Ok(category);
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
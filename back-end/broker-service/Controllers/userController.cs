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
    [Route("api/users")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IRepository<User> _userRepository;
        private readonly IMapper _mapper;
        public UserController(IRepository<User> repo, IMapper mapper)
        {
            _userRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            var model = await _userRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<UserDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUsersById(int id)
        {
            Console.WriteLine("Returning technician of id" + id);
            var model = await _userRepository.GetDataById(id);
            return Ok(_mapper.Map<UserDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateUsers(UserDto userDto)
        {
            Console.WriteLine("Creating brokers");
            var user = _mapper.Map<User>(userDto);
            await _userRepository.UpdateData(user);
            return Ok(userDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUsers(int id)
        {
            var model = await _userRepository.GetDataById(id);
            var user = _mapper.Map<User>(model);
            await _userRepository.DeleteData(user);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateUser(int id, UserDto userDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var user = _mapper.Map<User>(userDto);
            await _userRepository.UpdateData(user);
            return Ok(user);
        }
        //   public async Task<IActionResult> GetPaginatedBrokers(int pageNumber,int pageSize, string orderBy,string search)
        // {   
        //     // ServiceRepository _service= new ServiceRepository();
        //      Console.WriteLine("These are the comming constriant");
        //      Console.WriteLine(pageNumber);
        //      Console.WriteLine(orderBy);
        //      Console.WriteLine(search);
       
        //    var model = await _userRepository.GetPaginatedData(pageNumber,pageSize,orderBy,search);

        // var totalPage= await _userRepository.GetTotalPage(pageSize,search);
        // BrokerData broker= new BrokerData(totalPage,model);
             
        //      return Ok(broker);
        // }
        
    }

}
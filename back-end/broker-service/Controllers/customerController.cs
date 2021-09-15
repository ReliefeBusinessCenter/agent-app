using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using System;
using broker.Data;
using broker.Models;
using AutoMapper;
using broker.Dto;
using Microsoft.AspNetCore.Authorization;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace Controllers
{   
    //   [Authorize]
    [Route("api/customers")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly IRepository<Customer> _customerRepository;
        private readonly IMapper _mapper;
         private static IHostingEnvironment _environment;
        public CustomerController(IRepository<Customer> repo, IMapper mapper, IHostingEnvironment environment)
        {
            _customerRepository = repo;
            _mapper = mapper;
            _environment=environment;
        }
        [HttpGet]
        public async Task<IActionResult> GetCustomers()
        {
            var model = await _customerRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<CustomerDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetCustomerById(int id)
        {
            Console.WriteLine("Returning technician of id" + id);
            var model = await _customerRepository.GetDataById(id);
            return Ok(_mapper.Map<CustomerDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateCustomer(CustomerDto  customerDto)
        {
            Console.WriteLine("Creating customers");
            var customer = _mapper.Map<Customer>(customerDto);
            Console.WriteLine("Creating Users");
            // var user = _mapper.Map<User>(userDto);
            //  Console.WriteLine("Entered tot he image upload");

            // string fName = customerDto.User.Picture.FileName;
            // Console.WriteLine(fName);
            // string path = Path.Combine(_environment.ContentRootPath, "Images/" + fName);
            // using (var stream = new FileStream(path, FileMode.Create))
            // { 
            //     await customerDto.User.Picture.CopyToAsync(stream);
            // }
            // // return file.FileName;
            // customer.User.Picture=customerDto.User.Picture.FileName;
            await _customerRepository.UpdateData(customer);
            return Ok(customerDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            var model = await _customerRepository.GetDataById(id);
            var customer = _mapper.Map<Customer>(model);
            await _customerRepository.DeleteData(customer);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCustomer(int id, CustomerDto  customerDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var customer = _mapper.Map<Customer>(customerDto);
            await _customerRepository.UpdateData(customer);
            return Ok(customer);
        }
        //   public async Task<IActionResult> GetPaginatedCustomers(int pageNumber,int pageSize, string orderBy,string search)
        // {   
        //     // ServiceRepository _service= new ServiceRepository();
        //      Console.WriteLine("These are the comming constriant");
        //      Console.WriteLine(pageNumber);
        //      Console.WriteLine(orderBy);
        //      Console.WriteLine(search);
       
        //    var model = await _brokerRepository.GetPaginatedData(pageNumber,pageSize,orderBy,search);

        // var totalPage= await _brokerRepository.GetTotalPage(pageSize,search);
        // BrokerData broker= new BrokerData(totalPage,model);
             
        //      return Ok(broker);
        // }
        
    }

}
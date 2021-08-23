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
    [Route("api/delivery")]
    [ApiController]
    public class DeliveryController : ControllerBase
    {
        private readonly IRepository<Delivery> _deliveryRepository;
        private readonly IMapper _mapper;
        public DeliveryController(IRepository<Delivery> repo, IMapper mapper)
        {
            _deliveryRepository = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetDeliveries()
        {
            var model = await _deliveryRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<DeliveryDto>>(model));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetDeliveryById(int id)
        {
            Console.WriteLine("Returning delivery  of id" + id);
            var model = await _deliveryRepository.GetDataById(id);
            return Ok(_mapper.Map<DeliveryDto>(model));
        }
        
        [HttpPost]
        public async Task<IActionResult> CreateDelivery(DeliveryDto deliveryDto)
        {
            Console.WriteLine("Creating delivery");
            var delivery = _mapper.Map<Delivery>(deliveryDto);
            await _deliveryRepository.UpdateData(delivery);
            return Ok(deliveryDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDelivery(int id)
        {
            var model = await _deliveryRepository.GetDataById(id);
            var delivery = _mapper.Map<Delivery>(model);
            await _deliveryRepository.DeleteData(delivery);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDelivery(int id, DeliveryDto  deliveryDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var delivery = _mapper.Map<Delivery>(deliveryDto);
            await _deliveryRepository.UpdateData(delivery);
            return Ok(delivery);
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
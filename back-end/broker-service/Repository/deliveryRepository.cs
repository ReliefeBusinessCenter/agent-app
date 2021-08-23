using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class DeliveryRepository : IRepository<Delivery>
    {
        private readonly DataContext _context;
        public DeliveryRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Delivery delivery)
        {
            Console.WriteLine("Delete delivery method invoked");
            _context.Deliveries.Remove(delivery);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Delivery>> GetData()
        {
            Console.WriteLine("Get  Delivery  method invoked");
            // 
            var data = await _context.Deliveries


           .ToListAsync();
            return data;
            // 

        }

        public async Task<Delivery> GetDataById(int id)
        {
            var data = await _context.Deliveries


               .ToListAsync();

            return data.FirstOrDefault(x => x.DeliveryId == id);
        }

        public Task<List<Delivery>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Delivery> InsertData(Delivery delivery)
        {
            Console.WriteLine("Create Delivery  data  method invoked");
            _context.Deliveries.Add(delivery);

            await _context.SaveChangesAsync();
            return delivery;
        }

        public async Task<Delivery> UpdateData(Delivery delivery)
        {
            _context.Update(delivery).Property(x => x.DeliveryId).IsModified = false;
            await _context.SaveChangesAsync();
            return delivery;
        }
    }
}

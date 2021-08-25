using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class BuyRepository : IRepository<Buy>
    {
        private readonly DataContext _context;
        public BuyRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Buy buy)
        {
           Console.WriteLine("Delete buys method invoked");
            _context.Buys.Remove(buy);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Buy>> GetData()
        {
             Console.WriteLine("Get  Buys method invoked");
             var model = await _context.Buys.ToListAsync();
            return model;
        }

        public async Task<Buy> GetDataById(int id)
        {
            return await _context.Buys.FirstOrDefaultAsync(x => x.BuyId== id);
        }

        public Task<List<Buy>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Buy> InsertData(Buy buy)
        {
            
             Console.WriteLine("Create Buy  data  method invoked");
            _context.Buys.Add(buy);

            await _context.SaveChangesAsync();
            return buy;
        }

        public async Task<Buy> UpdateData(Buy buy)
        {
            _context.Update(buy).Property(x => x.BuyId).IsModified = false;
            await _context.SaveChangesAsync();
            return buy;
        }
    }
}

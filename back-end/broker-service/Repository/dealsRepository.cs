using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class DealsRepository : IRepository<Deals>
    {
        private readonly DataContext _context;
        public DealsRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Deals deals)
        {
            Console.WriteLine("Delete Deals method invoked");
            _context.Deals.Remove(deals);
            await _context.SaveChangesAsync();
            return true;
        }

        public Task<Deals> GetByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Deals>> GetData()
        {
            Console.WriteLine("Get  Deals method invoked");
             var model = await _context.Deals.ToListAsync();
            return model;
        }

        public async Task<Deals> GetDataById(int id)
        {
           return await _context.Deals.FirstOrDefaultAsync(x => x.DealsId== id);
        }

        public Task<List<Deals>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Deals> InsertData(Deals deals)
        {
             Console.WriteLine("Create Deals  data  method invoked");
            _context.Deals.Add(deals);

            await _context.SaveChangesAsync();
            return deals;
        }

        public async Task<Deals> UpdateData(Deals deals)
        {
              _context.Update(deals).Property(x => x.DealsId).IsModified = false;
            await _context.SaveChangesAsync();
            return deals;
        }
    }
}

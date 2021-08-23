using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class PortfolioRepository : IRepository<Portfolio>
    {
        private readonly DataContext _context;
        public PortfolioRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Portfolio portfolio)
        {
           Console.WriteLine("Delete portfolio method invoked");
            _context.Portfolios.Remove(portfolio);
            await _context.SaveChangesAsync();
            return true;
        }
    
        public async Task<List<Portfolio>> GetData()
        {
             Console.WriteLine("Get  portfolio  method invoked");
             var model = await _context.Portfolios.ToListAsync();
            return model;
        }

        public async Task<Portfolio> GetDataById(int id)
        {
            return await _context.Portfolios.FirstOrDefaultAsync(x => x.PortfolioId== id);
        }

        public Task<List<Portfolio>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Portfolio> InsertData(Portfolio portfolio)
        {
             Console.WriteLine("Create portfolio  data  method invoked");
            _context.Portfolios.Add(portfolio);

            await _context.SaveChangesAsync();
            return portfolio;
        }

        public async Task<Portfolio> UpdateData(Portfolio portfolio)
        {
          _context.Update(portfolio).Property(x => x.PortfolioId).IsModified = false;
            await _context.SaveChangesAsync();
            return portfolio;
        }
    }
}

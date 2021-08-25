using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class SalesRepository : IRepository<Sales>
    {
        private readonly DataContext _context;
        public SalesRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Sales sales)
        {
             Console.WriteLine("Delete Sales method invoked");
            _context.Sales.Remove(sales);
            await _context.SaveChangesAsync();
            return true;
        }
    
        public async Task<List<Sales>> GetData()
        {
            Console.WriteLine("Get  Sales method invoked");
             var model = await _context.Sales.ToListAsync();
            return model;
        }

        public async Task<Sales> GetDataById(int id)
        {
              return await _context.Sales.FirstOrDefaultAsync(x => x.SalesId== id);
        }

        public Task<List<Sales>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Sales> InsertData(Sales sales)
        {
            
             Console.WriteLine("Create Sales  data  method invoked");
            _context.Sales.Add(sales);

            await _context.SaveChangesAsync();
            return sales;
        }

        public async Task<Sales> UpdateData(Sales sales)
        {
            _context.Update(sales).Property(x => x.SalesId).IsModified = false;
            await _context.SaveChangesAsync();
            return sales;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class CategoryRepository : IRepository<Category>
    {
        private readonly DataContext _context;
        public CategoryRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Category catigory)
        {
              Console.WriteLine("Delete catogory method invoked");
            _context.Catigories.Remove(catigory);
            await _context.SaveChangesAsync();
            return true;
        }

        public Task<Category> GetByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Category>> GetData()
        {   
            Console.WriteLine("Get  catogory method invoked");
             var model = await _context.Catigories.ToListAsync();
            return model;
        }

        public async Task<Category> GetDataById(int id)
        {
            return await _context.Catigories.FirstOrDefaultAsync(x => x.CategoryId== id);
        }

        public Task<List<Category>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Category> InsertData(Category catigory)
        {
            
            Console.WriteLine("Create catigory  data  method invoked");
            _context.Catigories.Add(catigory);

            await _context.SaveChangesAsync();
            return catigory;
        }

        public async Task<Category> UpdateData(Category catigory)
        {
            _context.Update(catigory).Property(x => x.CategoryId).IsModified = false;
            await _context.SaveChangesAsync();
            return catigory;
        }
    }
}

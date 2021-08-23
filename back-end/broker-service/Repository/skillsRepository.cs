using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class SkillsRepository : IRepository<Skills>
    {
        private readonly DataContext _context;
        public SkillsRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Skills skills)
        {
              Console.WriteLine("Delete skills method invoked");
            _context.Skills.Remove(skills);
            await _context.SaveChangesAsync();
            return true;
        }
    
        public async Task<List<Skills>> GetData()
        {
            Console.WriteLine("Get  Skills  method invoked");
             var model = await _context.Skills.ToListAsync();
            return model;
        }

        public async Task<Skills> GetDataById(int id)
        {
             return await _context.Skills.FirstOrDefaultAsync(x => x.SkillsId== id);
        }

        public Task<List<Skills>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Skills> InsertData(Skills skills)
        {
             Console.WriteLine("Create Skills  data  method invoked");
            _context.Skills.Add(skills);

            await _context.SaveChangesAsync();
            return skills;
        }

        public async Task<Skills> UpdateData(Skills skills)
        {
            _context.Update(skills).Property(x => x.SkillsId).IsModified = false;
            await _context.SaveChangesAsync();
            return skills;
        }
    }
}

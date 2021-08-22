using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class UserRepository : IRepository<User>
    {
        private readonly DataContext _context;
        public UserRepository(DataContext context)
        {
            _context = context;
        }

         async Task<bool>  IRepository<User>.DeleteData(User service)
        {
            _context.Users.Remove(service);
            await _context.SaveChangesAsync();
            return true;
        }

        async Task<List<User>> IRepository<User>.GetData()
        {
            var data = await _context.Users
            // .Include(e => e.Role)
             .ToListAsync();
            return data;
        }

       async Task<User> IRepository<User>.GetDataById(int id)
        {
            return await _context.Users.FirstOrDefaultAsync(x => x.UserId == id);
        }

        async Task<User> IRepository<User>.InsertData(User service)
        {
             _context.Users.Add(service);
            await _context.SaveChangesAsync();
            return service;
        }

        async Task<User> IRepository<User>.UpdateData(User service)
        {
             _context.Update(service).Property(x => x.UserId).IsModified = false;
            await _context.SaveChangesAsync();
            return service;
        }
        

   public async Task<int> GetTotalPage(int pageSize,string search){
       return 0;
   }

        public Task<List<User>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }
    }

}

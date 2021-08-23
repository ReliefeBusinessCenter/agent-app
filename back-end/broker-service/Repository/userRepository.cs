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

         async Task<bool>  IRepository<User>.DeleteData(User user)
        {
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return true;
        }

        async Task<List<User>> IRepository<User>.GetData()
        {
            var data = await _context.Users
             .Include(e => e.Buys)
             .ToListAsync();
            return data;
        }

       async Task<User> IRepository<User>.GetDataById(int id)
        {
            return await _context.Users .Include(e => e.Buys).FirstOrDefaultAsync(x => x.UserId == id);
        }

        async Task<User> IRepository<User>.InsertData(User user)
        {
             _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return user;
        }

        async Task<User> IRepository<User>.UpdateData(User user)
        {
             _context.Update(user).Property(x => x.UserId).IsModified = false;
            await _context.SaveChangesAsync();
            return user;
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

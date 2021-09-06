using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class ViewRepository : IRepository<Review>
    {
        private readonly DataContext _context;
        public ViewRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Review  review)
        {
           Console.WriteLine("Delete Review method invoked");
            _context.Reviews.Remove(review);
            await _context.SaveChangesAsync();
            return true;
        }

        public Task<Review> GetByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Review>> GetData()
        {
             Console.WriteLine("Get  review   method invoked");
             var model = await _context.Reviews.ToListAsync();
            return model;
        }

        public async Task<Review> GetDataById(int id)
        {
            return await _context.Reviews.FirstOrDefaultAsync(x => x.ReviewId== id);
        }

        public Task<List<Review>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public async Task<Review> InsertData(Review review)
        {
             Console.WriteLine("Create View  data  method invoked");
            _context.Reviews.Add(review);

            await _context.SaveChangesAsync();
            return review;
        }

        public async Task<Review> UpdateData(Review  review)
        {
            _context.Update(review).Property(x => x.ReviewId).IsModified = false;
            await _context.SaveChangesAsync();
            return review;
        }
    }
}

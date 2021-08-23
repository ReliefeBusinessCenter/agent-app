using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class BrokerRepository : IRepository<Broker>
    {
        private readonly DataContext _context;
        public BrokerRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteData(Broker service)
        {
           Console.WriteLine("Delete method invoked");
            _context.Brokers.Remove(service);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Broker>> GetData()
        {
            //   var model = await _context.Brokers.ToListAsync();
            // return model;

            var data = await _context.Brokers
             .Include(e => e.User)
            //  .Include(e => e.Portfolios)
            //  .Include(e => e.Deals)
            //  .Include(e => e.Deliveries)
             .ToListAsync();
            return data;
        }

        public async Task<Broker> GetDataById(int id)
        {
            return await _context.Brokers.FirstOrDefaultAsync(x => x.BrokerId == id);
        }

        public async Task<List<Broker>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
           switch (orderBy)
                     {
                        case "Category":
                                if(search=="0"){
                                   return await _context.Brokers
                                    .OrderBy(s=>s.CategoryId)
                                    .Skip((pageNumber - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToListAsync();
                     
                                }else{
                                     return await _context.Brokers
                                    .Where(b => b.User.FullName.Contains(search))
                                    .OrderBy(s=>s.CategoryId)
                                    .Skip((pageNumber - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToListAsync();
                                 }
                            // model=model.orderBy(s=>s.Category).ToListAsync();
                                
                    case "location":
                            if(search=="0"){
                                return await _context.Brokers
                                    .OrderBy(s=>s.BrokerId)
                                    .Skip((pageNumber - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToListAsync();
                            }else{
                                return await _context.Brokers
                                        .Where(b => b.User.FullName.Contains(search))
                                        .OrderBy(s=>s.CategoryId)
                                        .Skip((pageNumber - 1) * pageSize)
                                        .Take(pageSize)
                                        .ToListAsync();
                            }
                            // model=model.orderBy(s=>s.ServiceName).ToListAsync();
                       
                   
                         default:
                            if(search=="0"){
                                return await _context.Brokers
                                    .OrderBy(s=>s.CategoryId)
                                    .Skip((pageNumber - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToListAsync();
                            }else{
                                return await _context.Brokers
                                    .Where(b => b.User.FullName.Contains(search))
                                    .OrderBy(s=>s.CategoryId)
                                    .Skip((pageNumber - 1) * pageSize)
                                    .Take(pageSize)
                                    .ToListAsync();
                            }
                            // model=model.orderBy(s=>s.ServiceName).ToListAsync();
                           

                     }
        }

        public async Task<int> GetTotalPage(int pageSize, string search)
        {
            if(search!="0"){
                // 
                   var count = await _context.Brokers.Where(b => b.User.FullName.Contains(search)).CountAsync();
                   var totalPages = (int)Math.Ceiling(count / (float)pageSize);
                    return totalPages;

            }else{
                // 
                var count = await _context.Brokers.CountAsync();
                var totalPages = (int)Math.Ceiling(count / (float)pageSize);
                return totalPages;
            }
             
             
        }

        public async Task<Broker> InsertData(Broker service)
        {
              Console.WriteLine("Create data  method invoked");
            _context.Brokers.Add(service);

            await _context.SaveChangesAsync();
            return service;
        }

        public async Task<Broker> UpdateData(Broker service)
        {
             Console.WriteLine("Update method  invoked");
                _context.Update(service).Property(x => x.BrokerId).IsModified = false;
            _context.SaveChanges();
             return service;
        }

    }
}

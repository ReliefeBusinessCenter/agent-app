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

        // private  IRepository<User> _userRepository;
        public BrokerRepository(DataContext context )
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

        public Task<Broker> GetByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Broker>> GetData()
        {
            //   var model = await _context.Brokers.ToListAsync();
            // return model;wewewe

            var data = await _context.Brokers
             .Include(e => e.User)
             .Include(e => e.Portfolio)
             .Include(e => e.Review)
             .Include(e=>e.Category)
             .Include(e => e.Deals)
              .Include(e => e.Skills)
             .Include(e => e.Delivery)
             .ToListAsync();
            return data;
        }

        public async Task<Broker> GetDataById(int id)
        {
            // return await _context.Brokers
            //  .Include(e => e.User)
            // .Where(x => x.BrokerId.Equals(id));
            // FirstOrDefaultAsync(x => x.BrokerId == id);
            var data = await _context.Brokers
             .Include(e => e.User)
             .Include(e=>e.Category)
         
             .Include(e => e.Skills)
             .Include(e => e.Portfolio)
             .Include(e => e.Deals)
           
             .Include(broker => broker.Delivery)
             .Include(e => e.Review)
              .AsSingleQuery()
             .ToListAsync();

            return data.FirstOrDefault(x => x.BrokerId == id);
             
        }

        public  Task<List<Broker>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
          throw new System.NotImplementedException();
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

        public async Task<Broker> InsertData(Broker broker)
        {
              Console.WriteLine("Create data  method invoked");
              Console.WriteLine("Broker", broker);
        // Add user
        _context.Users.Add(broker.User);
            await _context.SaveChangesAsync();
             // get user by email
            User user=await _context.Users .Include(e => e.Buys).FirstOrDefaultAsync(x => x.Email == broker.User.Email);
            // Add skills
            _context.Skills.Add(broker.Skills);
              await _context.SaveChangesAsync();
               // get skills by email
            // User user=await _context.Users .Include(e => e.Buys).FirstOrDefaultAsync(x => x.Email == broker.User.Email);
           
            // add broker
            Broker newBroker=new Broker();
            
            


            _context.Brokers.Add(broker);

            await _context.SaveChangesAsync();
            return broker;
        }

        public async Task<Broker> UpdateData(Broker service)
        {
             throw new System.NotImplementedException();
        }

       

        

       

    }
}

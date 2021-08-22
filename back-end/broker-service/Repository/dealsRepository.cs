using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;
using Microsoft.EntityFrameworkCore;

namespace broker.Data
{
    public class DealsRepository : IRepository<Broker>
    {
        private readonly DataContext _context;
        public DealsRepository(DataContext context)
        {
            _context = context;
        }

        public Task<bool> DeleteData(Broker service)
        {
            throw new System.NotImplementedException();
        }
    
        public Task<List<Broker>> GetData()
        {
            throw new System.NotImplementedException();
        }

        public Task<Broker> GetDataById(int id)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<Broker>> GetPaginatedData(int pageNumber, int pageSize, string orderBy, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<int> GetTotalPage(int pageSize, string search)
        {
            throw new System.NotImplementedException();
        }

        public Task<Broker> InsertData(Broker service)
        {
            throw new System.NotImplementedException();
        }

        public Task<Broker> UpdateData(Broker service)
        {
            throw new System.NotImplementedException();
        }
    }
}

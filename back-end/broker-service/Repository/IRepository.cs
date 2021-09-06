using System.Collections.Generic;
using System.Threading.Tasks;
using broker.Models;

namespace broker.Data
{
    public interface IRepository<T>
    {
        Task<List<T>> GetData();
        Task<T> GetDataById(int id);

        Task<T> InsertData(T service);
        Task<T> UpdateData(T service);
        Task<bool> DeleteData(T service);
        Task<List<T>> GetPaginatedData(int pageNumber, int pageSize,string orderBy,string search);
        Task<int> GetTotalPage(int pageSize,string search);
        Task<T> GetByEmail(string email);
    }
}
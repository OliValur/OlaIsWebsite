using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using OlaIs.Models;

namespace OlaIs.Data.Services
{
    public class ProductsService
    {
        private readonly ApplicationDbContext _context;
        private readonly DatabaseService _databaseService;

        public ProductsService(ApplicationDbContext context, DatabaseService databaseService)
        {
            _context = context;
            _databaseService = databaseService;
        }

        public async Task<List<ProductsModel>> GetProducts()
        {
            Console.WriteLine("GetProducts");
            string query = "SELECT * FROM Products";

            return await _databaseService.ExecuteQueryAsync(query, reader => new ProductsModel
            {
                Id = reader.GetInt32(0),
                Title = reader.GetString(1),
                SmallPrice = reader.GetInt32(2),
                MediumPrice = reader.GetInt32(3),
                LargePrice = reader.GetInt32(4),
                ChildSizePrice = reader.GetInt32(5),
                Description = reader.GetString(6),
                ImageUrl = reader.GetString(7)
            });
        }
    }
}

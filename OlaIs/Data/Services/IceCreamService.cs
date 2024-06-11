using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using OlaIs.Models;

namespace OlaIs.Data.Services
{
    public class IceCreamService
    {
        private readonly ApplicationDbContext _context;
        private readonly DatabaseService _databaseService;

        public IceCreamService(ApplicationDbContext context, DatabaseService databaseService)
        {
            _context = context;
            _databaseService = databaseService;
        }

        public async Task<List<IceCreamTypeModel>> GetIceCreams()
        {
            Console.WriteLine("GetIceCreams");
            string query = "SELECT * FROM IceCreamTypes WHERE InStock = 1";

            return await _databaseService.ExecuteQueryAsync(query, reader => new IceCreamTypeModel
            {
                Id = reader.GetInt32(0),
                Title = reader.GetString(1),
                Vegetarian = reader.GetBoolean(2),
                Vegan = reader.GetBoolean(3),
                InStock = reader.GetBoolean(4)
            });
        }
    }
}

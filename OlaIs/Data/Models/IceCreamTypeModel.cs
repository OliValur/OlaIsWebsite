namespace OlaIs.Models
{
    public class IceCreamTypeModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public bool Vegetarian { get; set; }
        public bool Vegan { get; set; }
        public bool InStock { get; set; }
    }
}
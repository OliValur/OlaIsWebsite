namespace OlaIs.Models
{
    public class ProductsModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int SmallPrice { get; set; }
        public int MediumPrice { get; set; }
        public int LargePrice { get; set; }
        public int ChildSizePrice { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
    }
}
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace StationeryStore.Models
{
    public class Products_tb
    {
        [Key]
        public int productID { get; set; }
        public string productName { get; set; }
        public string img {  get; set; }
        public decimal price { get; set; }
        public int stock {  get; set; }
        public int categoryID { get; set; }
        public Categories_tb category { get; set; }

    }
}

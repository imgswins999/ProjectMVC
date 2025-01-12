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
        public float price { get; set; }
        public int stock {  get; set; }
        public string categoryID { get; set; }
        public Categories_tb category { get; set; }

    }
}

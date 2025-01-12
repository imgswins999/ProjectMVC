using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace StationeryStore.Models
{
    public class Categories_tb
    {
        public ICollection<Products_tb> Products { get; set; }
        [Key]
        public int categoryID { get; set; }
        public string categoryName { get; set; }
    }
}

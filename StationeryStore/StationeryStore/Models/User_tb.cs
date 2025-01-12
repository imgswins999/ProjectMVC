using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StationeryStore.Models
{
    public class User_tb
    {
        [Key]
        public int userID { get; set; }
        public string userName { get; set; }
        public string userEmail { get; set; }
        public string userPassword { get; set; }
        public string role { get; set; }
    }
}

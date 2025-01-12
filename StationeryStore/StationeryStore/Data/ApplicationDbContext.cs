using Microsoft.EntityFrameworkCore;
using StationeryStore.Models;
namespace StationeryStore.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        { 
        }
        public DbSet<Categories_tb> Categories_tb {  get; set; }
        public DbSet<Products_tb> Products_tb { get; set; }
        public DbSet<User_tb> User_tb { get; set; }
       
    }
}

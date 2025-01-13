using Microsoft.AspNetCore.Mvc;
using StationeryStore.Data;
using StationeryStore.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Collections.Generic;

namespace StationeryStore.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _context;
        public ProductController(ApplicationDbContext context)
        {
            _context = context;
        }
      
        public IActionResult AllProduct()
        {
            IEnumerable<Products_tb> products = _context.Products_tb
                .Include(a => a.category)
                .ToList();
            return View(products);
        }
        
    }
}

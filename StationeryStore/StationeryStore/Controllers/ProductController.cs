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
      
        public IActionResult AllProduct(string categoryName)
        {
            var productQuery = _context.Products_tb.Include(a => a.category).AsQueryable();

            if (!string.IsNullOrEmpty(categoryName))
            {
                productQuery = productQuery.Where(a => a.category.categoryName == categoryName);
            }


            var products = productQuery.ToList();


            ViewBag.Categories = _context.Categories_tb.ToList();
            ViewBag.SelectedCategory = categoryName; 


            return View(products);
        }

      
    }
}

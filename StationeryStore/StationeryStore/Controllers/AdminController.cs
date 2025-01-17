using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StationeryStore.Data;
using StationeryStore.Models;
using System.Net.Http.Headers;

namespace StationeryStore.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
      

        public AdminController(ApplicationDbContext context)
        {

            _context = context;
          
        }
        public IActionResult Admin()
        {
            IEnumerable<Products_tb> products = _context.Products_tb
                .Include(p => p.category)
                .ToList();

            return View(products);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            var products = _context.Products_tb.Find(id);
            if (products == null)
            {
                return NotFound();
            }
            _context.Products_tb.Remove(products);
            _context.SaveChanges();
            return RedirectToAction("Admin", "Admin");
        }
        // GET: Admin/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products_tb
                .Include(p => p.category)
                .FirstOrDefaultAsync(p => p.productID == id);

            if (product == null)
            {
                return NotFound();
            }

            // Load categories for dropdown
            ViewBag.Categories = new SelectList(_context.Categories_tb, "categoryID", "categoryName", product.categoryID);
            return View(product);
        }

    }
}

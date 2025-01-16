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
        private readonly IWebHostEnvironment _webHostEnvironment;

        public AdminController(ApplicationDbContext context, IWebHostEnvironment webHostEnvironment)
        {

            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Admin()
        {
            IEnumerable<Products_tb> products = _context.Products_tb
                .Include(p => p.category)
                .ToList();

            return View(products);
        }
        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.Categorie = new SelectList(_context.Categories_tb, "CategoryId", "Name");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Products_tb products)
        {
            if (ModelState.IsValid)
            {
                _context.Add(products);
                _context.SaveChanges();
                return RedirectToAction(nameof(Admin));
            }

            ViewBag.Categories = new SelectList(_context.Categories_tb, "CategoryId", "Name", products.categoryID);
            return View(products);
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

        // POST: Admin/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Products_tb product, IFormFile? imageFile)
        {
            if (id != product.productID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images");
                        string uniqueFileName = Guid.NewGuid().ToString() + "_" + imageFile.FileName;
                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(fileStream);
                        }

                        product.img = "/images/" + uniqueFileName;
                    }

                    _context.Update(product);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.productID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }

            ViewBag.Categories = new SelectList(_context.Categories_tb, "categoryID", "categoryName", product.categoryID);
            return View(product);
        }

        private bool ProductExists(int id)
        {
            return _context.Products_tb.Any(e => e.productID == id);
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

    }
}

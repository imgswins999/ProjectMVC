﻿using Microsoft.AspNetCore.Hosting;
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

        public ActionResult Edit(int id)
        {
            var categories = _context.Categories_tb.Select(c => new SelectListItem
            {
                Value = c.categoryID.ToString(),
                Text = c.categoryName
            }).ToList();

            ViewBag.Categories = categories;

            var product = _context.Products_tb.Find(id);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        // GET: Admin/Edit/5
        public IActionResult Edit(int id, Products_tb product)
        {

            if (ModelState.IsValid)
            {
                return View(product);
            }

            var editProduct = _context.Products_tb.Find(id);
            {


                editProduct.productName = product.productName;
                editProduct.price = product.price;
                editProduct.stock = product.stock;
                editProduct.img = product.img;
                editProduct.categoryID = product.categoryID;
                _context.Update(editProduct);
                _context.SaveChanges();
                return RedirectToAction("Admin");
            }
        }

        public IActionResult AddProduct()
        {
            var categories = _context.Categories_tb.Select(c => new SelectListItem
            {
                Value = c.categoryID.ToString(),
                Text = c.categoryName
            }).ToList();

            ViewBag.Categories = categories;
            return View();
        }

        [HttpPost]
     
        public IActionResult AddProduct(string productName ,decimal price,int stock,string img ,int categoryID)
        {
            if (_context.Products_tb.Any(a => a.productName == productName))
            {
                return View();
            }

            try
            {
                var newProduct = new Products_tb
                {
                    productName = productName,
                    price = price,
                    stock = stock,
                    img = img,
                    categoryID = categoryID
                };

                _context.Products_tb.Add(newProduct);
                _context.SaveChanges();
                return RedirectToAction("Admin");
            }
            catch (Exception ex)
            {
                return View();
            }

           
        }
       
    }
}

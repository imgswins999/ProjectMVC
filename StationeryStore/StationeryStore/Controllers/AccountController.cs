using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using StationeryStore.Data;
using StationeryStore.Models;

namespace StationeryStore.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;
        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult Login()
        {
            ViewData["HideNavbar"] = true;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string usernameOrEmail, string password, bool remember)
        {
            var user = _context.User_tb.FirstOrDefault(a => (a.userName == usernameOrEmail ||
                a.userEmail == usernameOrEmail) && a.userPassword == password);
            if (user == null || password == null)
            {
                ViewData["HideNavbar"] = true;
                ViewBag.ErrorMessage = "Invalid username or password.";
                return View();
            }
            var claims = new[]
           {
               new Claim(ClaimTypes.Name, user.userName),
               new Claim(ClaimTypes.Email, user.userEmail),
               new Claim(ClaimTypes.Role,user.role)
            };

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var principal = new ClaimsPrincipal(identity);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
            if (user.role == "Admin")
            {
                return RedirectToAction("Admin", "Admin");
            }
            else
            {
                return RedirectToAction("AllProduct", "Product");
            }

        }
        [HttpGet]
        public IActionResult Register()
        {
            ViewData["HideNavbar"] = true;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(string username, string email, string password, string confirmPassword)
        {
            if (password != confirmPassword)
            {
                ViewBag.ErrorMessage = "Password and confirm password do not match.";
                ViewData["HideNavbar"] = true;
                return View();
            }
           

            if (_context.User_tb.Any(a => a.userName == username || a.userEmail == email))
            {
                ViewBag.ErrorMessage = "This username or email is already taken. Please choose another.";
                ViewData["HideNavbar"] = true;
                return View();
            }
            try
            {
                var newUser = new User_tb
                {
                    userName = username,
                    userEmail = email,
                    userPassword = password,
                    role = "User"
                };
                _context.User_tb.Add(newUser);
                _context.SaveChanges();
                ViewData["HideNavbar"] = true;
                TempData["SuccessMessage"] = "Successful ! Welcome to Stationary Store.";
                return RedirectToAction("Login", "Account");
            }
            catch (Exception ex) {
                ViewData["HideNavbar"] = true;
                return View();
            }
         

        }


    }

}

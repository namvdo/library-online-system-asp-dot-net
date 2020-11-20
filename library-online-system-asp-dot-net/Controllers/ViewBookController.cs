using System;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;

namespace library_online_system_asp_dot_net.Controllers
{
    public class ViewBookController : Controller
    {
        // GET
        public ActionResult ViewBook(string isbn)
        {
            ViewBag.book = BookDao.GetBookByIsbn(isbn);
            if (ViewBag.book == null)
            {
                return RedirectToAction("Error", "Home");
            }

            ViewBag.successfullyRenting = TempData["rentSuccess"];
            Console.WriteLine("something:fdfdfs: " + ViewBag.successfullyRenting);
            return View();
        }

        public ActionResult ViewBookWithProcess()
        {
            string process = Request.QueryString["process"];
            string isbn = Request.QueryString["isbn"];
            Console.WriteLine("process: " + process);
            Console.WriteLine("isbn " + isbn);
            
            if (process.Equals("rent"))
            {
                ViewBag.rented = true;
            }

            if (process.Equals("buy"))
            {
                ViewBag.bought = true;
            }
            if (!process.Equals("rent") && !process.Equals("buy"))
            {
                ViewBag.error = "Invalid option";
                return RedirectToAction("Error", "Home");
            }

            ViewBag.book = BookDao.GetBookByIsbn(isbn);
            if (ViewBag.book == null)
            {
                ViewBag.error = "There is no book with this provided value!";
                return RedirectToAction("Error", "Home");
            }

            return RedirectToAction("ViewBook", new {isbn=isbn});

        }
    }
}
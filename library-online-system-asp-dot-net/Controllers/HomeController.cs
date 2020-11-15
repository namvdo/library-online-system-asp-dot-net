
using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var category = "Novel";
            var booksByCategory = BookDao.GetBooksByCategory(category);
            ViewBag.booksByCategory = booksByCategory;


            var newAddedBooks = BookDao.GetTop10NewAddedBooks();
            ViewBag.newAddedBooks = newAddedBooks;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }


        [HttpGet]
        public ActionResult SearchResult(string keyword)
        {
            var matchedBooks = BookDao.GetTheMatchedBooks(keyword);
            return View(matchedBooks);
        }


        public ActionResult ViewBook()
        {
            var isbn = Request.QueryString["isbn"];
            ViewBag.book = BookDao.GetBookByIsbn(isbn);
            var isRented = false;
            var isBought = false;
            if (Request.QueryString["rent"] != null && Request.QueryString["rent"].Equals("True"))
            {
                ViewBag.rented = true;
                isRented = true;
            }
            

            if (Request.QueryString["buy"] != null && Request.QueryString["buy"].Equals("True"))
            {
                ViewBag.bought = true;
                isBought = true;
            }

            bool isWrongQs = Request.QueryString["buy"] != null || Request.QueryString["rent"] != null &&
                !isBought && !isRented;
            if (!isWrongQs) return View();
            ViewBag.Message = "Invalid request, you can get nothing here.";
            return RedirectToAction("Error");
        }

        public ActionResult Error()
        {
            return View();
        }
        
    }
}
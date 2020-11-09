
using System.Collections.Generic;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
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
            var matchedBooks = BookDAO.GetTheMatchedBooks(keyword);
            return View(matchedBooks);
        }
        
    }
}
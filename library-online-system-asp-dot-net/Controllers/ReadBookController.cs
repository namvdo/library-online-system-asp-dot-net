using System;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.Controllers
{
    public class ReadBookController : Controller
    {
        // GET
        public ActionResult ReadBook(int id, int page)
        {
            Console.WriteLine("From read book: " + page);
            string bookContent = BookDao.ReadBookFromPage(id, page);
            ViewBag.bookContent = bookContent;
            ViewBag.page = page;
            ViewBag.id = id;
            ViewBag.size = (int) Math.Ceiling((float)BookDao.GetTotalBookLength(id) / (int) GeneralInfo.NO_OF_CHARACTERS_PER_PAGE);
            return View();
        }
    }
}
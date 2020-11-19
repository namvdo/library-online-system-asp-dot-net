using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;

namespace library_online_system_asp_dot_net.Controllers
{
    public class ReadBookController : Controller
    {
        // GET
        public ActionResult ReadBook(int id, int page)
        {
            string bookContent = BookDao.ReadBookFromPage(id, page);
            ViewBag.bookContent = bookContent;
            return View();
        }
    }
}
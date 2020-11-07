
using System.Web.Mvc;

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

        public ActionResult Test()
        {
            ViewBag.Title = "This is the test title";
            ViewBag.Message = "This is the test page";
            return View();
        }
    }
}
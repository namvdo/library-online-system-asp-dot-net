using System.Web.Mvc;

namespace library_online_system_asp_dot_net.Controllers
{
    public class BookRentingController : Controller
    {
        // GET
        public ActionResult Transact()
        {
            return RedirectToAction("Index", "Home");
        } 
    }
}
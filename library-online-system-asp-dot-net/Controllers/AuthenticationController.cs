using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace library_online_system_asp_dot_net.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Authentication
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult SubmitRegister(FormCollection form)
        {
            string username = form["username"];
            string password = form["password"];
            string email = form["email"];
            string fullname = form["fullname"];
            Borrower borrower = new Borrower(username, password, fullname, email);
            int count = BorrowerDAO.InsertBorrower(borrower);
            if (count == 1)
            {
                return View();
            }
            else
            {
                return View("There is some error");
            }
        }
    }
}
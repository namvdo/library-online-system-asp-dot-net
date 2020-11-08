using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;

namespace library_online_system_asp_dot_net.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Authentication
        public ActionResult Register()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(FormCollection form)
        {
            string username = form["username"];

            string password = form["password"];
            string passRepeat = form["password-repeat"];

            string email = form["email"];
            string fullname = form["fullname"];
            if (username == null || username.Equals("") || password == null || password.Equals("")
            || passRepeat == null || passRepeat.Equals("") || email == null || email.Equals("") ||
            fullname == null || fullname.Equals(""))
            {
                ViewBag.Error = "All fields are required!";
                return View();
            }

            if (!password.Equals(passRepeat))
            {
                ViewBag.Error = "The repeat password doesn't match";
                return View();
            }
            
            Regex mailRegex = new Regex(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}");
            if (!mailRegex.IsMatch(email))
            {
                ViewBag.Error = "Invalid email address";
                return View();
            }
            var borrower = new Borrower(username, password, fullname, email);
            if (!BorrowerDAO.IsUserExisted(borrower.Username))
            {
                if (BorrowerDAO.InsertBorrower(borrower) == 1)
                {
                    ViewData["Message"] = "Successfully register";
                    return View();
                }
            }

            ViewBag.Error = "The username is already existed";
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            if (ModelState.IsValid)
            {
                if (BorrowerDAO.IsLoginSuccessfully(username, password))
                {
                    return RedirectToRoute("Home");
                }

                ViewBag.Error = "Login failed.";
                return View();
            }

            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToRoute("Home");
        }
    }
}
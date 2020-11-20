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

        public new ActionResult Profile()
        {
            string username = (string) Session["username"];
            ViewBag.borrower = BorrowerDAO.GetBorrowerByUsername(username);
            ViewBag.reservations = ReservationDAO.GetReservationByUsername(username);
            ViewBag.reviews = ReviewDAO.GetReviewByUsername(username);
            ViewBag.message = "";
            return View();
        }

        [HttpPost]
        public ActionResult Profile(FormCollection f)
        {
            string username = (string) Session["username"];
            string name = f["fullname"];
            string email = f["email"];
            double deposit = Convert.ToDouble(f["deposit"]);

            if (BorrowerDAO.UpdateBorrower(name, username, email, deposit) > 0)
            {
                ViewBag.borrower = BorrowerDAO.GetBorrowerByUsername(username);
                ViewBag.reservations = ReservationDAO.GetReservationByUsername(username);
                ViewBag.message = "Update Successful!";
            }
            else
            {
                ViewBag.message = "Update Failed!";
            }

            return View();
        }
        
        public ActionResult AddFund()
        {
            ViewBag.message = "";
            return View();
        }

        [HttpPost]
        public ActionResult AddFund(FormCollection f)
        {
            string username = (string)Session["username"];
            double amount = Convert.ToDouble(f["amount"]);
            string type = f["type"];
            DateTime date = Convert.ToDateTime(f["date"]);
            Payment p = new Payment(amount, username, date, type);
            if (PaymentDAO.InsertPayment(p) > 0)
            {
                Borrower b = BorrowerDAO.GetBorrowerByUsername(username);
                double NewDeposit = amount + b.Deposit;
                BorrowerDAO.UpdateDeposit(username, NewDeposit);
                ViewBag.message = "Payment Successfully !";
            }
            else
            {
                ViewBag.message = "Failed !!";
            }
            return View();
        }


        [HttpGet]
        public ActionResult SearchResult(string keyword)
        {
            var matchedBooks = BookDao.GetTheMatchedBooks(keyword);
            return View(matchedBooks);
        }


        public ActionResult Error()
        {
            return View();
        }
    }
}
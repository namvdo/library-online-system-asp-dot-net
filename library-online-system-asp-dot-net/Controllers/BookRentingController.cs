using System;
using System.Web.Mvc;
using library_online_system_asp_dot_net.DAOs;
using Utils = library_online_system_asp_dot_net.Models.Utils;

namespace library_online_system_asp_dot_net.Controllers
{
    public class BookRentingController : Controller
    {
        // GET
        [HttpPost]
        public ActionResult Transact(FormCollection form)
        {
            string username = form["username"];
            string isbn = form["isbn"];
            DateTime createdAt = DateTime.Now;
            int days = int.Parse(form["renting-days"]);
            DateTime dueDate = createdAt.AddDays(days);
            float amount = Utils.GetAmountBasedOnRentingDays()[days];
            bool isInserted = ReservationDAO.InsertReservation(username, isbn, createdAt, dueDate, amount);
            if (isInserted)
            {
                ReservationDAO.IncreaseBookRentedCount(isbn);
                TempData["rentSuccess"] = true;
            }
            return RedirectToAction("ViewBook", "ViewBook", new {isbn=isbn, rented=ViewBag.rentSuccess});
        } 
    }
}
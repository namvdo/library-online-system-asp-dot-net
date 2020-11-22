using library_online_system_asp_dot_net.DAOs;
using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace library_online_system_asp_dot_net.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search

       
        public ActionResult SearchResult(string keyword)
        {
        
            int page = BookDao.GetNumberPage(keyword);
            int id = Convert.ToInt32(Request.QueryString["i"]);
            if(id <= 0)
            {
                id = 1;
            }
            List<Book> books = BookDao.GetPaging(id, keyword);
            ViewBag.books = books;
            ViewBag.NumberPage = page;
            return View();
        }


    }
}
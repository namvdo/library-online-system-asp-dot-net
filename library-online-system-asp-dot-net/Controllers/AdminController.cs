using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace library_online_system_asp_dot_net.DAOs
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ManageBook()
        {
            List<Book> books = BookDao.GetAllBooks();
            ViewBag.Books = books;
            return View();
        }
        public ActionResult AddBook()
            
        {
            ViewBag.message = "";
            return View();
        }
        [HttpPost]
        public ActionResult AddBook(FormCollection f)
        {
            string isbn = f["isbn"];
            string title = f["title"];
            string publisher = f["publisher"];
            string description = f["description"];
            DateTime date = Convert.ToDateTime(f["date"]);
            string img = f["img"];
            string author_name = f["author_name"];
            string categories = f["categories"];
            BookCategory bc = new BookCategory(isbn, categories);
            Book b = new Book(isbn, title, publisher, description, img, date);
            if(BookDao.InsertBook(b) > 0)
            {
                BookDao.InsertAuthor(author_name);
                Author author = BookDao.GetAuthorByName(author_name);
                int id = author.Author_id;
                BookDao.InsertBookAuthor(isbn, id);
                BookDao.InsertBookCategory(bc);
                ViewBag.message = "Add Successfully !!";

            }
           
            return View();
        }

        public ActionResult UpdateBook()
        {
            string isbn = Request.QueryString["isbn"];
            Book book = BookDao.GetBookByIsbn(isbn);
            ViewBag.book = book;
            ViewBag.message = "";
            return View();
        }

        [HttpPost]
        public ActionResult UpdateBook(FormCollection f)
        {
            string isbn = f["isbn"];
            string title = f["title"];
            string publisher = f["publisher"];
            string des = f["description"];
            DateTime date = Convert.ToDateTime(f["date"]);
            string img = f["img"];
            Book b = new Book(isbn, title, publisher, des, img, date);
            if (BookDao.UpdateBook(b,isbn) > 0)
            {
                Book book = BookDao.GetBookByIsbn(isbn);
                ViewBag.book = book;
                ViewBag.message = "Update Successfully !!";
            }
            return View();
        }

        public ActionResult DeleteBook()
        {
            String isbn = Request.QueryString["isbn"]; 
            BookDao.DeleteBookAuthor(isbn);
            BookDao.DeleteBookCategory(isbn);
            BookDao.DeleteBook(isbn);

            return RedirectToAction("ManageBook");
        }

        public ActionResult ManageUser()
        {
            List<Borrower> list = BorrowerDAO.GetAllBorrowers();
            ViewBag.borrowers = list;
            return View();
        }

    }
}
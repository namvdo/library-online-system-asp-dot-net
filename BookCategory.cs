using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.Models
{
    public class BookCategory
    {
        string isbn, title, publisher, author, description, coverImg, categoryName;

        public string Isbn { get => isbn; set => isbn = value; }
        public string Title { get => title; set => title = value; }
        public string Publisher { get => publisher; set => publisher = value; }
        public string Author { get => author; set => author = value; }
        public string Description { get => description; set => description = value; }
        public string CoverImg { get => coverImg; set => coverImg = value; }
        public string CategoryName { get => categoryName; set => categoryName = value; }

        public BookCategory(string isbn, string title, string publisher, string author, string description, string coverImg, string categoryName)
        {
            this.Isbn = isbn;
            this.Title = title;
            this.Publisher = publisher;
            this.Author = author;
            this.Description = description;
            this.CoverImg = coverImg;
            this.CategoryName = categoryName;
        }

        public BookCategory()
        {
        }

    }
}
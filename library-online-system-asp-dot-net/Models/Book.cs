using System;

namespace library_online_system_asp_dot_net.Models
{
    public class Book
    {
        private string isbn, bookTitle, publisher, description, coverImage;
        private DateTime add_date;

        public Book(string isbn, string bookTitle, string publisher, string description, string coverImage, DateTime add_date)
        {
            this.Isbn = isbn;
            this.BookTitle = bookTitle;
            this.Publisher = publisher;
            this.Description = description;
            this.CoverImage = coverImage;
            this.Add_date = add_date;
        }

        public string Isbn { get => isbn; set => isbn = value; }
        public string BookTitle { get => bookTitle; set => bookTitle = value; }
        public string Publisher { get => publisher; set => publisher = value; }
        public string Description { get => description; set => description = value; }
        public string CoverImage { get => coverImage; set => coverImage = value; }
        public DateTime Add_date { get => add_date; set => add_date = value; }
    }
}
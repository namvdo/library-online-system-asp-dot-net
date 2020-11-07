namespace library_online_system_asp_dot_net.Models
{
    public class Book
    {
        private string isbn, bookTitle, publisher, author, coverImage;

        public Book(string isbn, string bookTitle, string publisher, string author, string coverImage)
        {
            this.isbn = isbn;
            this.bookTitle = bookTitle;
            this.publisher = publisher;
            this.author = author;
            this.coverImage = coverImage;
        }

        public Book()
        {
            
        }

        public string Isbn
        {
            get => isbn;
            set => isbn = value;
        }

        public string BookTitle
        {
            get => bookTitle;
            set => bookTitle = value;
        }

        public string Publisher
        {
            get => publisher;
            set => publisher = value;
        }

        public string Author
        {
            get => author;
            set => author = value;
        }

        public string CoverImage
        {
            get => coverImage;
            set => coverImage = value;
        }
    }
}
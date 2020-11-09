namespace library_online_system_asp_dot_net.Models
{
    public class Book
    {
        private string isbn, bookTitle, publisher, description, coverImage;
        private int authorId;

        public Book(string isbn, string bookTitle, string publisher, int authorId, string description, string coverImage)
        {
            this.isbn = isbn;
            this.bookTitle = bookTitle;
            this.publisher = publisher;
            this.authorId = authorId;
            this.description = description;
            this.coverImage = coverImage;
        }

        public Book()
        {
            
        }

        public string Description
        {
            get => description;
            set => description = value;
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

        public int Author
        {
            get => authorId;
            set => authorId = value;
        }

        public string CoverImage
        {
            get => coverImage;
            set => coverImage = value;
        }
    }
}
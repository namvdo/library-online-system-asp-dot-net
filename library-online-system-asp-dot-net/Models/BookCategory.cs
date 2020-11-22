
namespace library_online_system_asp_dot_net.Models
{
    public class BookCategory
    {
        private string isbn;
        private string name;

        public BookCategory(string isbn, string name)
        {
            this.Isbn = isbn;
            this.Name = name;
        }

        public string Isbn { get => isbn; set => isbn = value; }
        public string Name { get => name; set => name = value; }
    }
}
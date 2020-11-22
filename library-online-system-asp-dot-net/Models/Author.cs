namespace library_online_system_asp_dot_net.Models
{
    public class Author
    {
        private int author_id;
        private string author_name;

        public Author(int author_id, string author_name)
        {
            this.author_id = author_id;
            this.author_name = author_name;
        }

        public int Author_id { get => author_id; set => author_id = value; }
        public string Author_name { get => author_name; set => author_name = value; }
    }
}
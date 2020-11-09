namespace library_online_system_asp_dot_net.Models
{
    public class Category
    {
        private string categoryName;

        public Category(string categoryName)
        {
            this.categoryName = categoryName;
        }

        public string CategoryName
        {
            get => categoryName;
            set => categoryName = value;
        }
    }
}
namespace library_online_system_asp_dot_net.Models
{
    public class Category
    {
        private string categoryName, categoryImage;
        private int categoryId;
        

        public Category(string categoryName, string categoryImage)
        {
            this.categoryName = categoryName;
            this.categoryImage = categoryImage;
        }

        public string CategoryName
        {
            get => categoryName;
            set => categoryName = value;
        }

        public string CategoryImage
        {
            get => categoryImage;
            set => categoryImage = value;
        }

        public int CategoryId
        {
            get => categoryId;
            set => categoryId = value;
        }
    }
}
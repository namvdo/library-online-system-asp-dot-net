using System.Collections.Generic;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public class CategoryDAO
    {
        private static readonly SqlConnection GenericConnection;

        static CategoryDAO()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
        }

        public static List<Category> GetAllCategories()
        {
            List<Category> categories = new List<Category>(); 
            string sql = "select * from Category";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                var categoryName = (string) reader["category_name"];
                var categoryImg = (string) reader["img_link"];
                var category = new Category(categoryName, categoryImg);
                categories.Add(category);
            }

            return categories;
        }
        
    }
}
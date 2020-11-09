using System.Collections.Generic;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public class CategoryDAO
    {
        private static SqlConnection genericConnection;

        static CategoryDAO()
        {
            genericConnection = InitConnection.GetInstance().GetConnection();
        }

        public static List<Category> GetAllCategories()
        {
            List<Category> categories = new List<Category>(); 
            string sql = "select * from Category";
            SqlCommand cmd = new SqlCommand(sql);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
               Category category = new Category((string) reader["category_name"]);
               categories.Add(category);
            }

            return categories;
        }
        
    }
}
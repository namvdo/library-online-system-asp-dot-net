using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public class CategoryDAO
    {

        private static SqlConnection GetConnection()
        {
            var conStr = ConfigurationManager.ConnectionStrings["DBProvider"].ToString();
            return new SqlConnection(conStr);
        }

        private static List<Category> SelectDataBySql(string sql)
        {
            List<Category> categories = new List<Category>();
            
            using(SqlConnection connection = GetConnection())
            using (SqlCommand cmd = new SqlCommand(sql, connection))
            {
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    var categoryName = (string) reader["category_name"];
                    var categoryImg = (string) reader["img_link"];
                    var category = new Category(categoryName, categoryImg);
                    categories.Add(category);
                }
                reader.Dispose();
            }
            return categories;
        }
        public static List<Category> GetAllCategories()
        {
            string sql = "select * from Category";
            return SelectDataBySql(sql);
        }
        
        public static List<Category> GetTop5Categories()
        {
            string sql = "select top 5 * from Category";
            return SelectDataBySql(sql);
        }
    }
}
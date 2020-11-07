using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Security;

namespace library_online_system_asp_dot_net.Models
{
    public class BookDAO
    {
        public static List<Book> GetAllBooks()
        {
            List<Book> books = new List<Book>();
            string sql = "select * from Book";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string isbn = (string) reader["isbn"];
                string title = (string) reader["title"];
                string publisher = (string) reader["publisher"];
                string author = (string) reader["author"];
                string coverImg = (string) reader["cover_img"];
                books.Add(new Book(isbn, title, publisher, author, coverImg));
            }

            return books;
        }
    }
}
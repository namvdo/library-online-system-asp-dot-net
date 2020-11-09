using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.DAOs
{
    public class BookCategoryDAO
    {
        public List<BookCategory> getBookByCategory(string category)
        {
            List<BookCategory> book = new List<BookCategory>();
            string sql = "select b.isbn,book_title,publisher,author,description,cover_img,c.category_name from Book b join Book_Category bc on b.isbn = bc.isbn"+
                " join Category c on bc.category_name = c.category_name where c.category_name like  '%" + category + "%'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            SqlParameter parameter = new SqlParameter("@c.category_name", SqlDbType.NVarChar);
            parameter.Value = category;
            cmd.Parameters.Add(parameter);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string isbn = (string)reader["isbn"];
                string title = (string)reader["book_title"];
                string publisher = (string)reader["publisher"];
                string author = (string)reader["author"];
                string description = (string)reader["description"];
                string coverImg = (string)reader["cover_img"];
                string categoryName1 = (string)reader["category_name"];
                BookCategory bc = new BookCategory(isbn, title, publisher, author, description, coverImg,categoryName1);
                book.Add(bc);
            }
            return book;
        }
    }
    }
}
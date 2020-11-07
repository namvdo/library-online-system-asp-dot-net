using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
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
                string description = (string) reader["description"];
                string coverImg = (string) reader["cover_img"];
                books.Add(new Book(isbn, title, publisher, author, description, coverImg));
            }

            return books;
        }

        public static void Main()
        {
            Console.WriteLine(GetAllBooks());
        }

        public static List<Book> GetTheMatchedBooks(string keyword)
        {
            List<Book> matchedBooks = new List<Book>();
            string sql = "select top 5 * from Book where isbn like '%@isbn%' or book_title like '%@title'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            SqlParameter parameter = new SqlParameter("@isbn", SqlDbType.VarChar);
            SqlParameter parameter2 = new SqlParameter("@title", SqlDbType.NVarChar);
            parameter.Value = keyword;
            parameter2.Value = keyword;
            cmd.Parameters.Add(parameter);
            cmd.Parameters.Add(parameter2);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string isbn = (string) reader["isbn"];
                string title = (string) reader["title"];
                string publisher = (string) reader["publisher"];
                string author = (string) reader["author"];
                string description = (string) reader["description"];
                string coverImg = (string) reader["cover_img"];
                matchedBooks.Add(new Book(isbn, title, publisher, author, description, coverImg));
            }

            return matchedBooks;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public static class BookDao
    {
        private static SqlConnection GetConnection()
        {
            var conStr = ConfigurationManager.ConnectionStrings["DBProvider"].ToString();
            return new SqlConnection(conStr);
        }

        public static List<Book> GetAllBooks()
        {
            List<Book> books = new List<Book>();
            string sql = "select * from Book";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                books = GetBookFromDataReader(reader);
                reader.Dispose();
            }

            return books;
        }

        public static Book GetBookByIsbn(string isbn)
        {
            var sql = "select top 1 * from Book where isbn=@isbn";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                var para = new SqlParameter("@isbn", SqlDbType.VarChar) {Value = isbn};
                cmd.Parameters.Add(para);
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                return GetBookFromDataReader(reader).ElementAt(0);
            }
        }
        public static List<Book> GetTheMatchedBooks(string keyword)
        {
            List<Book> books = new List<Book>();
            string sql = "select top 5 * from Book where isbn like '%@isbn%' or book_title like '%@title'";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Parameters.AddWithValue("@isbn", keyword);
                cmd.Parameters.AddWithValue("@isbn", keyword);
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                books = GetBookFromDataReader(reader);
                reader.Dispose();
            }

            return books;
        }

        public static List<Book> GetBooksByCategory(string categoryName)
        {
            List<Book> books = new List<Book>();
            var sql =
                "select B.* from Book as B inner join Book_Category BC on B.isbn = BC.isbn inner join Category C on BC.category_name = C.category_name where C.category_name = @category";
            using (var cmd = new SqlCommand(sql, GetConnection()))
            {
                var para = new SqlParameter("@category", SqlDbType.VarChar) {Value = categoryName};
                cmd.Parameters.Add(para);
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                books = GetBookFromDataReader(reader);
                reader.Dispose();
            }

            return books;
        }

        public static List<Book> GetTop10NewAddedBooks()
        {
            List<Book> books;
            string sql = "select  top 10 * from Book order by added_time desc";
            using (var command = new SqlCommand(sql, GetConnection()))
            {
               command.Connection.Open();
               SqlDataReader reader = command.ExecuteReader();
               books = GetBookFromDataReader(reader);
            }

            return books;
        }

        public static string GetAuthorNameById(int id)
        {
            string sql = "select author_name from Author where author_id = @id";
            Dictionary<string, int> map = new Dictionary<string, int>()
            {
                {"@id", id}
            };
            SqlDataReader reader = GetDataReader(sql, map);
            if (reader.Read())
            {
                string authorName = (string) reader["author_name"];
                reader.Dispose();
                return authorName;
            }
            reader.Dispose();
            return "";
        }

        public static float GetRatingByIsbn(string isbn)
        {
            string sql =
                "select isbn, cast(sum(score) as float) / cast(count(isbn) as float) as average_rating from Review where isbn=@isbn group by isbn";
            var map = new Dictionary<string, string>()
            {
                {"@isbn", isbn}
            };
            var reader = GetDataReader(sql, map);
            if (reader.Read())
            {
                return (float) reader.GetDouble(1);
            }

            return -1;
        }

        private static SqlDataReader GetDataReader<T>(string sql, Dictionary<string, T> paramsAndValues)
        {
            using (var cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Connection.Open();
                foreach (KeyValuePair<string, T> entry in paramsAndValues)
                {
                    cmd.Parameters.AddWithValue(entry.Key, entry.Value);
                }

                return cmd.ExecuteReader();
            }
        }

        private static List<Book> GetBookFromDataReader(SqlDataReader reader)
        { 
            List<Book> books = new List<Book>();
           while (reader.Read())
           {
               string isbn = (string) reader["isbn"];
               string title = (string) reader["book_title"];
               string publisher = (string) reader["publisher"];
               int author = (int) reader["author_id"];
               string description = (string) reader["description"];
               string coverImg = (string) reader["cover_img"];
               books.Add(new Book(isbn, title, publisher, author, description, coverImg));
           }

           return books;
        } 
    }
}
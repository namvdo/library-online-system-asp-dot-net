using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

        private static readonly SqlConnection GenericConnection;

        static BookDao()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
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
            Console.WriteLine("isbn: " + isbn);
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

        public static string GetAuthorName(string isbn)
        {
            string sql =
                "select top 1 author_name from Author a inner join Book_Author ba on a.author_id = ba.author_id inner join Book b on ba.book_isbn = b.isbn where b.isbn = @isbn";
            using (SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@isbn", isbn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return (string) reader["author_name"];
                }
            }

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
        public static string ReadBookFromPage(int bookCopyId, int page)
        {
            StringBuilder stringBuilder = new StringBuilder();

            string contentFromBook = "";
            string sql = "select content from BookCopy where book_id=@id";
            // bool isLastPage = false;
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Parameters.AddWithValue("@id", bookCopyId);
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    contentFromBook = (string) reader["content"];
                }

                int noOfCharactersPerPage = (int) GeneralInfo.NO_OF_CHARACTERS_PER_PAGE;
                int totalPages = (int) Math.Ceiling((float) GetTotalBookLength(bookCopyId) / noOfCharactersPerPage);
                if (page <= 0 || page > totalPages)
                {
                    return "";
                }
                Console.WriteLine("total length: " + GetTotalBookLength(bookCopyId));
                // int noOfPages = (int) Math.Ceiling((double) contentFromBook.Length / noOfCharactersPerPage);
                // if (page == noOfPages)
                // {
                //     isLastPage = true;
                // }
                int startingPosition = noOfCharactersPerPage * page -
                                       noOfCharactersPerPage;
                // int endingPosition = noOfCharactersPerPage * page - 1;


                Regex regex = new Regex("([\\s.,-]+)");
                // if (!isLastPage)
                // {
                //     while (true)
                //     {
                //         Console.WriteLine("something: " + regex.IsMatch(contentFromBook[endingPosition] + ""));
                //         if (!regex.IsMatch(contentFromBook[endingPosition] + ""))
                //         {
                //             endingPosition++;
                //         }
                //         else
                //         {
                //             break;
                //         }
                //     } 
                // }
                Console.WriteLine("start: " + startingPosition + " end: " + Math.Min(startingPosition + noOfCharactersPerPage, GetTotalBookLength(bookCopyId)));
                if (startingPosition + noOfCharactersPerPage >= GetTotalBookLength(bookCopyId))
                {
                    noOfCharactersPerPage = GetTotalBookLength(bookCopyId) - startingPosition;
                }
                stringBuilder.Append(contentFromBook.Substring(startingPosition,   noOfCharactersPerPage));
                

            }
            Console.WriteLine("content: " + contentFromBook);

            return stringBuilder.ToString();
        }

        public static List<Book> GetBookIRent(string username)
        {
            string sql =
                "select distinct Book.* from Book inner join Reservation R2 on Book.isbn = R2.isbn where R2.username = @username and due_date >= @date";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                SqlDataReader reader = cmd.ExecuteReader();
                return GetBookFromDataReader(reader);
            }
        }

        public static Book GetBookByBookCopyId(int copyId)
        {
            string sql =
                "select top 1 * from Book inner join BookCopy BC on Book.isbn = BC.isbn where BC.book_id = @copyId";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@copyId", copyId);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    if (GetBookFromDataReader(reader).Count != 0)
                    {
                        return GetBookFromDataReader(reader).ElementAt(0);
                    }
                }

                return null;
            }
        }

        public static List<Book> GetBooksByCategoryf(string cName)
        {
            string sql =
                "select * from Category c inner join Book_Category BC on c.category_name = BC.category_name inner join Book on Book.isbn = BC.isbn where c.category_name = @cName";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@cName", cName);
                SqlDataReader read = cmd.ExecuteReader();
                return GetBookFromDataReader(read);
            }
        }
        public static int GetTotalBookLength(int bookCopyId)
        {
            int length = 0;
            Console.WriteLine("copy id: " + bookCopyId);
            string sql = "select datalength(content) as [count] from BookCopy where book_id = @id";
            using (SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@id", bookCopyId);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    length = (int) reader["count"];
                }

                reader.Dispose();
            }

            return length;
        }

        public static int GetBookCopyMediumLengthId(string isbn)
        {
            Console.WriteLine("from getBook: " + isbn);
            string sql = "select top 1 book_id from BookCopy where isbn=@isbn";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@isbn", isbn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return (int) reader["book_id"];
                }
            }

            return -1;

        }

        private static List<Book> GetBookFromDataReader(SqlDataReader reader)
        {
            List<Book> books = new List<Book>();
            while (reader.Read())
            {
                string isbn = (string) reader["isbn"];
                string title = (string) reader["book_title"];
                string publisher = (string) reader["publisher"];
                string description = (string) reader["description"];
                string coverImg = (string) reader["cover_img"];
                DateTime date = (DateTime) reader["added_time"];
                books.Add(new Book(isbn, title, publisher, description, coverImg, date));
            }

            return books;
        }

        private static Author GetAuthorFromDataReader(SqlDataReader reader)
        {
            Author authors = null;
            if (reader.Read())
            {
                int id = (int) reader["author_id"];
                string name = (string) reader["author_name"];

                authors = new Author(id, name);
            }

            return authors;
        }
        //public static List<Book> SearchBookByKeyWord(string keyword)
        //{
        //    List<Book> books = new List<Book>();
        //    string sql = "select * from Book b join Book_Author ba on b.isbn = ba.book_isbn join Author au on" +
        //        " ba.author_id = au.author_id where isbn like @keyword1 or author_name like @keyword2" +
        //        " or book_title  like @keyword3";
        //    using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
        //    {
        //        cmd.Parameters.AddWithValue("@keyword1", "%" + keyword + "%") ;
        //        cmd.Parameters.AddWithValue("@keyword2", "%" + keyword + "%");
        //        cmd.Parameters.AddWithValue("@keyword3", "%" + keyword + "%");
        //        cmd.Connection.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        books = GetBookFromDataReader(reader);
        //        reader.Dispose();
        //    }
        //    return books;

        //}
        public static List<Book> GetPaging(int index, string keyword)
        {
            List<Book> books = new List<Book>();
            string sql = "select * from Book b join Book_Author ba on b.isbn = ba.book_isbn join Author au on" +
                         " ba.author_id = au.author_id where isbn like @keyword1 or author_name like @keyword2" +
                         " or book_title  like @keyword3 " +
                         " order by isbn " +
                         " OFFSET @index ROW  FETCH FIRST 6 ROWS ONLY";

            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Parameters.AddWithValue("@index", (index - 1) * 6);
                cmd.Parameters.AddWithValue("@keyword1", "%" + keyword + "%");
                cmd.Parameters.AddWithValue("@keyword2", "%" + keyword + "%");
                cmd.Parameters.AddWithValue("@keyword3", "%" + keyword + "%");
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                books = GetBookFromDataReader(reader);
                reader.Dispose();
            }

            return books;
        }

        public static int GetNumberPage(string keyword)
        {
            string sql = "select COUNT(*) from Book b join Book_Author ba on b.isbn = ba.book_isbn join Author au on" +
                         " ba.author_id = au.author_id where isbn like @keyword1 or author_name like @keyword2" +
                         " or book_title  like @keyword3";
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddWithValue("@keyword1", "%" + keyword + "%");
            cmd.Parameters.AddWithValue("@keyword2", "%" + keyword + "%");
            cmd.Parameters.AddWithValue("@keyword3", "%" + keyword + "%");
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int total = reader.GetInt32(0);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0)
                {
                    countPage++;
                }

                return countPage;
            }

            reader.Dispose();

            return 0;

        }

        public static int InsertBook(Book book)
        {
            string sql =
                "insert into Book(isbn,book_title,publisher,description,cover_img,added_time) values(@isbn,@title,@pub,@des,@img,@date)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),
                new SqlParameter("@title", SqlDbType.NVarChar),
                new SqlParameter("@pub", SqlDbType.VarChar),
                new SqlParameter("@des", SqlDbType.NVarChar),
                new SqlParameter("@img", SqlDbType.VarChar),
                new SqlParameter("@date", SqlDbType.DateTime),

            };
            para[0].Value = book.Isbn;
            para[1].Value = book.BookTitle;
            para[2].Value = book.Publisher;
            para[3].Value = book.Description;
            para[4].Value = book.CoverImage;
            para[5].Value = book.Add_date;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int InsertBookCategory(BookCategory bc)
        {
            string sql = "insert into Book_Category(isbn,category_name) values (@isbn,@category_name)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),
                new SqlParameter("@category_name", SqlDbType.NVarChar),


            };
            para[0].Value = bc.Isbn;
            para[1].Value = bc.Name;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int InsertAuthor(string authorname)
        {
            string sql = "insert into Author(author_name)  values (@name)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@name", SqlDbType.NVarChar),
            };
            para[0].Value = authorname;
            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int InsertBookAuthor(string isbn, int id)
        {
            string sql = "insert into Book_Author(book_isbn,author_id) values(@isbn,@id)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),
                new SqlParameter("@id", SqlDbType.Int)
            };
            para[0].Value = isbn;
            para[1].Value = id;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static Author GetAuthorByName(string name)
        {
            Author author = null;
            var sql = "select * from Author where author_name=@name";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                var para = new SqlParameter("@name", SqlDbType.NVarChar) {Value = name};
                cmd.Parameters.Add(para);
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                author = GetAuthorFromDataReader(reader);
                reader.Dispose();
            }

            return author;
        }

        public static int UpdateBook(Book b, string isbn)
        {
            string sql = "UPDATE [dbo].[Book]" +
                         "  Set [book_title] = @title" +
                         " ,[publisher] = @publisher" +
                         " ,[description] = @des" +
                         " ,[cover_img] = @img" +
                         " ,[added_time] = @date" +
                         " WHERE[isbn] = @isbn";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@title", SqlDbType.VarChar),
                new SqlParameter("@publisher", SqlDbType.VarChar),
                new SqlParameter("@des", SqlDbType.VarChar),
                new SqlParameter("@img", SqlDbType.VarChar),
                new SqlParameter("@date", SqlDbType.DateTime),
                new SqlParameter("@isbn", SqlDbType.VarChar),

            };
            para[0].Value = b.BookTitle;
            para[1].Value = b.Publisher;
            para[2].Value = b.Description;
            para[3].Value = b.CoverImage;
            para[4].Value = b.Add_date;
            para[5].Value = isbn;


            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int DeleteBook(string isbn)
        {
            string sql = "Delete from [dbo].[Book]" +
                         " WHERE[isbn] = @isbn";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),

            };
            para[0].Value = isbn;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int DeleteBookAuthor(string isbn)
        {
            string sql = "Delete from [dbo].[Book_Author]" +
                         " WHERE[book_isbn] = @isbn";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),

            };
            para[0].Value = isbn;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int DeleteBookCategory(string isbn)
        {
            string sql = "Delete from [dbo].[Book_Category]" +
                         " WHERE[isbn] = @isbn";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para =
            {
                new SqlParameter("@isbn", SqlDbType.VarChar),

            };
            para[0].Value = isbn;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }
    }
}

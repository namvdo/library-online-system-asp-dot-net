using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.DAOs
{
    public class ReviewDAO
    {
        private static readonly SqlConnection GenericConnection;

        static ReviewDAO()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
        }

        public static List<Review> GetReviewByUsername(string username)
        {
            string sql = "select * from Review where username = '" + username + "'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            List<Review> reviews = new List<Review>();
            Review r = null;
            while (reader.Read())
            {
                // get the results of each column
                int id = (int)reader["id"];
                string title = (string)reader["title"];
                string content = (string)reader["content"];
                DateTime date = (DateTime)reader["date"];
                string isbn = (string)reader["isbn"];

                //int score = (int)reader["score"];
                int score = 5;                

                r = new Review(id,title,content,date,isbn,username,score);
                reviews.Add(r);
            }
            return reviews;
        }

        public static List<Review> GetReviewsByIsbn(string isbn)
        {
            List<Review> list = new List<Review>();
            string sql = "select * from Review where isbn=@isbn";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@isbn", isbn);
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    string title = read.GetString(1);
                    string content = read.GetString(2);
                    DateTime date = read.GetDateTime(3);
                    int score = read.GetInt16(6);
                    Review review = new Review();
                    review.Content = content;
                    review.Title = title;
                    review.Date = date;
                    review.Score = score;
                    list.Add(review);
                }
            }

            return list;
        }

        public static bool InsertReview(string title, string content, DateTime date, string isbn, string username,
            int score)
        {
            string sql = "insert into Review values(@a, @b, @c, @d, @e, @f)";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@a", title);
                cmd.Parameters.AddWithValue("@b", content);
                cmd.Parameters.AddWithValue("@c", date);
                cmd.Parameters.AddWithValue("@d", isbn);
                cmd.Parameters.AddWithValue("@e", username);
                cmd.Parameters.AddWithValue("@f", score);
                return cmd.ExecuteNonQuery() == 1;

            }
        }
    }

}
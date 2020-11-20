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

            InitConnection.OpenConnection(GenericConnection);
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
    }

}
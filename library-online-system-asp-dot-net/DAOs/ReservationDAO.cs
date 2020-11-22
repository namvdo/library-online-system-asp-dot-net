using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.DAOs
{
    public static class ReservationDAO
    {
        private static readonly SqlConnection GenericConnection;

        static ReservationDAO()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
        }

        public static bool InsertReservation(string username, string isbn, DateTime reservedTime, DateTime expiredTime,
            float amount)
        {
            Console.WriteLine("isbN fuckkk: " + isbn + " us: " + username);
            string sql =
                "insert into Reservation(username, isbn, created_date, due_date, amount) values (@username, @isbn, @reservedTime, @expiredTime, @amount)";
            using (SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@isbn", isbn);
                cmd.Parameters.AddWithValue("@reservedTime", reservedTime);
                cmd.Parameters.AddWithValue("@expiredTime", expiredTime);
                cmd.Parameters.AddWithValue("@amount", amount);
                return cmd.ExecuteNonQuery() == 1;
            }
        }

        public static void IncreaseBookRentedCount(string isbn)
        {
            string sql = "select count(*) as c from BookRentedCount where isbn=@isbn";
            using (SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@isbn", isbn);
                int count = 0;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader != null && reader.Read())
                {
                    count = reader.GetInt32(0);
                }

                string dml = "";
                if (count != 0)
                {
                    dml =
                        "update BookRentedCount set book_rented_count = @count, date=@date where isbn=@isbn";
                }
                else
                {
                    dml = "insert into BookRentedCount(isbn, book_rented_count, date) values (@isbn, @count, @date)";
                }

                using (SqlCommand command = new SqlCommand(dml, InitConnection.GetInstance().GetConnection()))
                {
                    command.Connection.Open();
                    command.Parameters.AddWithValue("@isbn", isbn);
                    command.Parameters.AddWithValue("@count", count + 1);
                    command.Parameters.AddWithValue("@date", DateTime.Now);
                    int rows = command.ExecuteNonQuery();
                    Console.WriteLine("rows: " + rows);
                }
            }

        }


        public static bool CanReadBookNow(string username, string isbn)
        {
            string sql = "select due_date from Reservation where username=@username and isbn=@isbn";
            using (SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@isbn", isbn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    DateTime dueDate = (DateTime) reader["due_date"];
                    if (dueDate.CompareTo(DateTime.Now) >= 0)
                    {
                        return true;
                    }
                }
            }

            return false;
        }
        public static List<Reservation> GetReservationByUsername(string username)
        {
            string sql = "select * from Reservation where username = '" + username + "'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            List<Reservation> reservations = new List<Reservation>();
            Reservation r = null;
            while (reader.Read())
            {
                // get the results of each column
                int id = (int)reader["id"];
                string isbn = (string)reader["isbn"];
                DateTime create = (DateTime)reader["created_date"];
                DateTime due = (DateTime)reader["due_date"];
                
                double amount = (double)reader["amount"];

                r = new Reservation(id, username, isbn, create, due, 0, amount);
                reservations.Add(r);
            }
            return reservations;
        }
    }
}
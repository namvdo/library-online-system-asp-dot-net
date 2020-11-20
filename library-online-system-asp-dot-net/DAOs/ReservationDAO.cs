using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        public static List<Reservation> GetReservationByUsername(string username)
        {
            string sql = "select * from Reservation where username = '" + username + "'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());

            InitConnection.OpenConnection(GenericConnection);
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
                int status = (int)reader["status"];
                double amount = (double)reader["amount"];

                r = new Reservation(id, username, isbn, create, due, status, amount);
                reservations.Add(r);
            }
            return reservations;
        }
    }
}
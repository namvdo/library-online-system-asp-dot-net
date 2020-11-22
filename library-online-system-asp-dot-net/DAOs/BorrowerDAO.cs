using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public static class BorrowerDAO

    {
        private static readonly SqlConnection GenericConnection;
        private static SqlConnection GetConnection()
        {
            var conStr = ConfigurationManager.ConnectionStrings["DBProvider"].ToString();
            return new SqlConnection(conStr);
        }
        static BorrowerDAO()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
        }
        public static int InsertBorrower(Borrower borrower)
        {
            string sql = "insert into Borrower(username,password,name,email) values (@username,@password,@name,@email)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para = {
                new SqlParameter("@username", SqlDbType.VarChar),
                new SqlParameter("@password", SqlDbType.VarChar),
                new SqlParameter("@name", SqlDbType.VarChar),
                new SqlParameter("@email", SqlDbType.VarChar)
            };
            para[0].Value = borrower.Username;
            para[1].Value = borrower.Password;
            para[2].Value = borrower.Fullname;
            para[3].Value = borrower.Email;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static bool IsUserExisted(string username)
        {
            string sql = "select top 1 username from Borrower where username=@username";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection); 
            SqlParameter para = new SqlParameter("@username", SqlDbType.VarChar) {Value = username};
            cmd.Parameters.Add(para);
            InitConnection.OpenConnection(GenericConnection);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader.Read();
        }

        public static bool IsLoginSuccessfully(string username, string password)
        {
            Console.WriteLine("username: {0}, {1}", username, password );
            string sql = "select top 1 * from Borrower where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection); 
            SqlParameter user = new SqlParameter("@username", SqlDbType.VarChar);
            SqlParameter pass = new SqlParameter("@password", SqlDbType.VarChar);
            user.Value = username;
            cmd.Parameters.Add(user);
            pass.Value = password;
            cmd.Parameters.Add(pass);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteReader().Read();
        }

        public static List<Borrower> GetAllBorrowers()
        {
            List<Borrower> borrowers = new List<Borrower>();
            string sql = "select * from Borrower";
            using (SqlCommand cmd = new SqlCommand(sql, GetConnection()))
            {
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                borrowers = GetBorrowerFromDataReader(reader);
                reader.Dispose();
            }

            return borrowers;
        }
        private static List<Borrower> GetBorrowerFromDataReader(SqlDataReader reader)
        {
            List<Borrower> borrowers = new List<Borrower>();
            while (reader.Read())
            {
                string username = (string)reader["username"];
                string name = (string)reader["name"];
                string email = (string)reader["email"];
                double deposit = (double) reader["deposit"];
                borrowers.Add(new Borrower(username, name, email, deposit));
            }

            return borrowers;
        }
        public static Borrower GetBorrowerByUsername(string username)
        {
            string sql = "select * from Borrower where username = '" + username + "'";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            Borrower b = null;
            if (reader.Read())
            {
                // get the results of each column
                string name = (string)reader["name"];
                string email = (string)reader["email"];
                double deposit = (double)reader["deposit"];

                b = new Borrower(username, name, email, deposit);
            }
            return b;
        }

        public static bool LogInAsAdmin(string username, string pass)
        {
            string sql = "select * from Borrower where username=@username and password=@pass";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@pass", pass);
                SqlDataReader reader = cmd.ExecuteReader();
                return reader.Read();
            }
        }
        public static int UpdateBorrower(string name, string username, string email, double deposit)
        {
            string sql = "update Borrower" +
                " set name=@name, email = @email, deposit = @deposit " +
                " where username = @username";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para = {
                new SqlParameter("@name", SqlDbType.VarChar),
                new SqlParameter("@email", SqlDbType.VarChar),
                new SqlParameter("@deposit", SqlDbType.Float),
                new SqlParameter("@username", SqlDbType.VarChar)
            };
            para[0].Value = name;
            para[1].Value = email;
            para[2].Value = deposit;
            para[3].Value = username;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static int UpdateDeposit(string username,double amount)
        {
            string sql = "update Borrower" +
                " set deposit = @deposit " +
                " where username = @username";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para = {
                new SqlParameter("@deposit", SqlDbType.Float),
                new SqlParameter("@username", SqlDbType.VarChar)
            };
            para[0].Value = amount;
            para[1].Value = username;


            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }

    }
}
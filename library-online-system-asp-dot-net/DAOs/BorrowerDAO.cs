using System.Data;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public class BorrowerDAO

    {
        private static SqlConnection genericConnection;

        static BorrowerDAO()
        {
            genericConnection = InitConnection.GetInstance().GetConnection();
        }
        public static int InsertBorrower(Borrower borrower)
        {
            string sql = "insert into Borrower(username,password,name,email) values (@username,@password,@name,@email)";
            SqlCommand cmd = new SqlCommand(sql, genericConnection);
            SqlParameter[] para = new SqlParameter[]
            {
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
            InitConnection.OpenConnection(genericConnection);
            return cmd.ExecuteNonQuery();
        }

        public static bool IsUserExisted(string username)
        {
            string sql = "select top 1 username from Borrower where username=@username";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            SqlParameter para = new SqlParameter("@username", SqlDbType.VarChar) {Value = username};
            cmd.Parameters.Add(para);
            InitConnection.OpenConnection(genericConnection);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader.HasRows && reader["username"].Equals(username);
        }

        public static bool IsLoginSuccessfully(string username, string password)
        {
            string sql = "select top 1 * from Borrower where username=@username and password=@password";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            SqlParameter user = new SqlParameter("@username", SqlDbType.VarChar);
            SqlParameter pass = new SqlParameter("@password", SqlDbType.VarChar);
            user.Value = username;
            cmd.Parameters.Add(user);
            pass.Value = password;
            cmd.Parameters.Add(pass);
            InitConnection.OpenConnection(genericConnection);
            return cmd.ExecuteNonQuery() == 1;
        }
    }
}
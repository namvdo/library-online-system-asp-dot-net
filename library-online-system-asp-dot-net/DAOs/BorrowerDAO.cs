using System.Data;
using System.Data.SqlClient;

namespace library_online_system_asp_dot_net.Models
{
    public class BorrowerDAO

    {
        public static int InsertBorrower(Borrower borrower)
        {

            string sql = "insert into Borrower(username,password,name,email) values (@username,@password,@name,@email)";
            SqlCommand cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection());
            SqlParameter[] para = new SqlParameter[] {

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
            cmd.Connection.Open();
            int result = cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return result;


        }
    }
}
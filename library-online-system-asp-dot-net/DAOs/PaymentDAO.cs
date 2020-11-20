using library_online_system_asp_dot_net.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.DAOs
{
    public class PaymentDAO
    {
        private static readonly SqlConnection GenericConnection;

        static PaymentDAO()
        {
            GenericConnection = InitConnection.GetInstance().GetConnection();
        }

        public static int InsertPayment(Payment payment)
        {
            string sql = "insert into Payment(payment_amount,username,date,payment_type)" +
                " values(@amount, @username, @date, @type)";
            SqlCommand cmd = new SqlCommand(sql, GenericConnection);
            SqlParameter[] para = {
                new SqlParameter("@amount", SqlDbType.Float),
                new SqlParameter("@username", SqlDbType.VarChar),
                new SqlParameter("@date", SqlDbType.DateTime),
                new SqlParameter("@type", SqlDbType.VarChar)
            };
            para[0].Value = payment.Amount;
            para[1].Value = payment.Username;
            para[2].Value = payment.Date;
            para[3].Value = payment.Type;

            cmd.Parameters.AddRange(para);
            InitConnection.OpenConnection(GenericConnection);
            return cmd.ExecuteNonQuery();
        }
    }
}
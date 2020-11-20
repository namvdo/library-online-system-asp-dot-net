using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace library_online_system_asp_dot_net.DAOs
{
    public class InitConnection
    {
        private static InitConnection _instance;
        private static SqlConnection _connection;
        private InitConnection()
        {
            try
            {
                string connectionStr = ConfigurationManager.ConnectionStrings["DBProvider"].ToString();
                _connection = new SqlConnection(connectionStr);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public static InitConnection GetInstance()
        {
            return new InitConnection();
        }

        public  SqlConnection GetConnection()
        {
            return _connection;
        }

        public static void OpenConnection(SqlConnection connection)
        {
            if (connection != null && connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }
    }
}
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Ajax.Utilities;

namespace library_online_system_asp_dot_net.Models
{
    public class InitConnection
    {
        private static InitConnection _instance;
        private static SqlConnection _connection;
        private InitConnection()
        {
            string connectionStr = ConfigurationManager.ConnectionStrings["DBProvider"].ToString();
            _connection = new SqlConnection(connectionStr);
        }

        public static InitConnection GetInstance()
        {
            return _instance ?? (_instance = new InitConnection());
        }

        public  SqlConnection GetConnection()
        {
            return _connection;
        }
    }
}
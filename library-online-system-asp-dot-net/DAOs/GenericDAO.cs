using System.Collections.Generic;
using System.Data.SqlClient;
using library_online_system_asp_dot_net.Models;

namespace library_online_system_asp_dot_net.DAOs
{
    public class GenericDAO
    {
        private static SqlConnection genericConnection;

        static GenericDAO()
        {
            genericConnection = InitConnection.GetInstance().GetConnection();
        }
    }
}
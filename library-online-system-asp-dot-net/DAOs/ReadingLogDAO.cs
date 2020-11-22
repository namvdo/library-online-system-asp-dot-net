using System.Data.SqlClient;

namespace library_online_system_asp_dot_net.DAOs
{
    public class ReadingLogDAO
    {
        public static bool updateOrInsertReadingLog(string username, string isbn, float percent)
        {
            string sql = "select top 1 * from ReadingLog where username=@username and isbn=@isbn";
            using (var cmd = new SqlCommand(sql, InitConnection.GetInstance().GetConnection()))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@isbn", isbn);
                string nonQuery = "";
                if (cmd.ExecuteReader().Read())
                {
                    nonQuery =
                        "update ReadingLog set percentage = @percent where username=@username and isbn=@isbn";
                }
                else
                {
                    nonQuery = "insert into ReadingLog(username, isbn, percentage) values (@username, @isbn, @percentage)";
                }
                var command = new SqlCommand(nonQuery, InitConnection.GetInstance().GetConnection());
                command.Connection.Open();
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@isbn", isbn);
                command.Parameters.AddWithValue("@percent", percent);
                return command.ExecuteNonQuery() == 1;
            }
        }
    }
}
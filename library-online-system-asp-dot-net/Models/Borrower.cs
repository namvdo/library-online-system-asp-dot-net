namespace library_online_system_asp_dot_net.Models
{
    public class Borrower
    {
        private string username, password, fullname, email;

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public string Fullname { get => fullname; set => fullname = value; }
        public string Email { get => email; set => email = value; }

        public Borrower(string username, string password, string fullname, string email)
        {
            this.Username = username;
            this.Password = password;
            this.Fullname = fullname;
            this.Email = email;
        }

        public Borrower()
        {
        }
    }
}
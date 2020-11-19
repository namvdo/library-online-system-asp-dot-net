using System.ComponentModel.DataAnnotations;

namespace library_online_system_asp_dot_net.Models
{
    public class Borrower
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public string Fullname { get; set; }

        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
        public string Email { get; set; }

        [Required]
        public double Deposit { get; set; }

        public Borrower(string username, string password, string fullname, string email)
        {
            this.Username = username;
            this.Password = password;
            this.Fullname = fullname;
            this.Email = email;
        }

        public Borrower(string username, string fullname, string email, double deposit)
        {
            Username = username;
            Fullname = fullname;
            Email = email;
            Deposit = deposit;
        }

        public Borrower()
        {
        }
    }
}
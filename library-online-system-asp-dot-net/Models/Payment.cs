using System;

namespace library_online_system_asp_dot_net.Models
{
    public class Payment
    {
        private int id;
        private double amount;
        private string username;
        private DateTime date;
        private string type;

        public int Id { get => id; set => id = value; }
        public double Amount { get => amount; set => amount = value; }
        public string Username { get => username; set => username = value; }
        public DateTime Date { get => date; set => date = value; }
        public string Type { get => type; set => type = value; }

        public Payment(int id, double amount, string username, DateTime date, string type)
        {
            this.id = id;
            this.amount = amount;
            this.username = username;
            this.date = date;
            this.type = type;
        }

        public Payment(double amount, string username, DateTime date, string type)
        {
            this.amount = amount;
            this.username = username;
            this.date = date;
            this.type = type;
        }
    }
}
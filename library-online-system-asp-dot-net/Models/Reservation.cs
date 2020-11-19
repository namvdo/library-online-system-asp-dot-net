using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.Models
{
    public class Reservation
    {
        private int id;
        private string username;
        private string isbn;
        private DateTime createDate;
        private DateTime dueDate;
        private int status;
        private double amount;

        public Reservation(int id, string username, string isbn, DateTime createDate, DateTime dueDate, int status, double amount)
        {
            this.Id = id;
            this.Username = username;
            this.Isbn = isbn;
            this.CreateDate = createDate;
            this.DueDate = dueDate;
            this.Status = status;
            this.Amount = amount;
        }

        public int Id { get => id; set => id = value; }
        public string Username { get => username; set => username = value; }
        public string Isbn { get => isbn; set => isbn = value; }
        public DateTime CreateDate { get => createDate; set => createDate = value; }
        public DateTime DueDate { get => dueDate; set => dueDate = value; }
        public int Status { get => status; set => status = value; }
        public double Amount { get => amount; set => amount = value; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace library_online_system_asp_dot_net.Models
{
    public class Review
    {
        private int id;
        private string title;
        private string content;
        private DateTime date;
        private string isbn;
        private string username;
        private int score;

        public Review()
        {
        }

        public Review(int id, string title, string content, DateTime date, string isbn, string username, int score)
        {
            this.Id = id;
            this.Title = title;
            this.Content = content;
            this.Date = date;
            this.Isbn = isbn;
            this.Username = username;
            this.Score = score;
        }

        public int Id { get => id; set => id = value; }
        public string Title { get => title; set => title = value; }
        public string Content { get => content; set => content = value; }
        public DateTime Date { get => date; set => date = value; }
        public string Isbn { get => isbn; set => isbn = value; }
        public string Username { get => username; set => username = value; }
        public int Score { get => score; set => score = value; }
    }
}
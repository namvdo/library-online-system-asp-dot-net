using System;

namespace library_online_system_asp_dot_net.Models
{
    public class Fine
    {
        private int id;
        private string borrowerId;
        private int bookCopyId;
        private DateTime reservedDate, actualReturnDate;
        private double fineAmout;

        public Fine()
        {
        }

        public int Id
        {
            get => id;
            set => id = value;
        }

        public string BorrowerId
        {
            get => borrowerId;
            set => borrowerId = value;
        }

        public int BookCopyId
        {
            get => bookCopyId;
            set => bookCopyId = value;
        }

        public DateTime ReservedDate
        {
            get => reservedDate;
            set => reservedDate = value;
        }

        public DateTime ActualReturnDate
        {
            get => actualReturnDate;
            set => actualReturnDate = value;
        }

        public double FineAmout
        {
            get => fineAmout;
            set => fineAmout = value;
        }
    }
}
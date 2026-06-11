namespace YatraGo.Models
{
    public class DateWiseReport
    {
        public int BookingId { get; set; }

        public string? Username { get; set; }

        public string? BusName { get; set; }

        public string? Source { get; set; }

        public string? Destination { get; set; }

        public string? SeatNumbers { get; set; }

        public decimal TotalAmount { get; set; }

        public string? BookingStatus { get; set; }
    }
}
namespace YatraGo.Models
{
    public class Booking
    {
        public int BookingId { get; set; }

        public int UserId { get; set; }

        public int BusId { get; set; }

        public DateTime JourneyDate { get; set; }

        public string SeatNumbers { get; set; } = string.Empty;

        public decimal TotalAmount { get; set; }

        public string Email
        {
            get;
            set;
        } = string.Empty;

        public string Phone
        {
            get;
            set;
        } = string.Empty;

        public string BusName
        {
            get;
            set;
        } = string.Empty;

        public string BusNumber
        {
            get;
            set;
        } = string.Empty;

        public string Source
        {
            get;
            set;
        } = string.Empty;

        public string Destination
        {
            get;
            set;
        } = string.Empty;

        public string BookingStatus
        {
            get;
            set;
        } = string.Empty;

        public DateTime CreatedAt
        {
            get;
            set;
        }

        public string Username
        {
            get;
            set;
        } = string.Empty;
    }
}

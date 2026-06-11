namespace YatraGo.Models
{
    public class TicketViewModel
    {
        public int BookingId { get; set; }

        public string BusName { get; set; }

        public string Source { get; set; }

        public string Destination { get; set; }

        public DateTime JourneyDate { get; set; }

        public decimal TotalAmount { get; set; }

        public DateTime BookingDate { get; set; }

        public List<Passenger> Passengers
        {
            get;
            set;
        }
        =
        new List<Passenger>();
    }
}
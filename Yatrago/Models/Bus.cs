namespace YatraGo.Models
{
    public class Bus
    {
        public int BusId { get; set; }

        public string BusName { get; set; }

        public string BusNumber { get; set; }

        public string BusType { get; set; }

        public int TotalSeats { get; set; }

        public int RouteId { get; set; }

        public TimeSpan DepartureTime { get; set; }

        public TimeSpan ArrivalTime { get; set; }

        public decimal FareAmount { get; set; }

        public bool Status { get; set; }

        public string Source { get; set; }

        public string Destination { get; set; }

        public int AvailableSeats { get; set; }

        public string? BusImage { get; set; }
    }

    public class SearchBus
    {
        public string Source { get; set; }

        public string Destination { get; set; }

        public DateTime JourneyDate { get; set; }
    }

}
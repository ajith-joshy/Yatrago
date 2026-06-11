namespace YatraGo.Models
{
    public class BookingViewModel
    {
        public int BusId
        {
            get;
            set;
        }

        public DateTime JourneyDate
        {
            get;
            set;
        }

        public string SeatNumbers
        {
            get;
            set;
        } = string.Empty;

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

        public List<Passenger> Passengers
        {
            get;
            set;
        } = new();

        public decimal TotalAmount
        {
            get;
            set;
        }
    }
}
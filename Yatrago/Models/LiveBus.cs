namespace YatraGo.Models
{
    public class LiveBus
    {
        public string BusName
        {
            get;
            set;
        } = string.Empty;

        public string BusType
        {
            get;
            set;
        } = string.Empty;

        public int TotalSeats
        {
            get;
            set;
        } 

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
    }
}
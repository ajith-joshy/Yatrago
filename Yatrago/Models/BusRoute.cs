namespace YatraGo.Models
{
    public class BusRoute
    {
        public int RouteId { get; set; }

        public string Source { get; set; } = string.Empty;

        public string Destination { get; set; } = string.Empty;

        public decimal Distance { get; set; }
    }
}
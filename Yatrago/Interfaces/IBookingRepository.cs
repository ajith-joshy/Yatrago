using Yatrago.Models;
using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IBookingRepository
    {
        int BookSeats(Booking booking);

        List<string> GetBookedSeats
            (                
                int busId,
                DateTime journeyDate
            );

        int GetAvailableSeats
            (
                int busId,
                DateTime journeyDate
            );

        void SavePassengers
            (
                int bookingId,
                List<Passenger> passengers
            );

        List<Booking> GetBookingsByUserId
        (
            int userId
        );

        List<Passenger> GetPassengersByBookingId
        (
            int bookingId
        );

        bool CancelBooking
        (
            int bookingId
        );

        List<Booking> GetAllBookings();

        int GetUpcomingBookingCount
        (
            int userId
        );

        int GetBookingsCount();

        TicketViewModel GetTicketDetails(int bookingId);

        List<Booking>
        FilterBookings
        (
            int? routeId,
            int? busId
        );
    }
}
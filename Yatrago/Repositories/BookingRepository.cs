using Microsoft.Data.SqlClient;
using System.Data;
using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repositories
{
    public class BookingRepository
        : IBookingRepository
    {
        private readonly string _connectionString;

        public BookingRepository
        (
            IConfiguration configuration
        )
        {
            _connectionString =
            configuration.GetConnectionString
            (
                "DefaultConnection"
            )!;
        }

        public int BookSeats(Booking booking)
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_BookSeats",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@UserId",
                    booking.UserId
                );

                cmd.Parameters.AddWithValue
                (
                    "@BusId",
                    booking.BusId
                );

                cmd.Parameters.AddWithValue
                (
                    "@JourneyDate",
                    booking.JourneyDate
                );

                cmd.Parameters.AddWithValue
                (
                    "@SeatNumbers",
                    booking.SeatNumbers
                );

                cmd.Parameters.AddWithValue
                (
                    "@TotalAmount",
                    booking.TotalAmount
                );

                cmd.Parameters.AddWithValue
                (
                    "@Email",
                    booking.Email
                );

                cmd.Parameters.AddWithValue
                (
                    "@Phone",
                    booking.Phone
                );

                con.Open();

                object result =
                cmd.ExecuteScalar();

                return Convert.ToInt32(result);
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<string> GetBookedSeats
        (
        int busId,
        DateTime journeyDate
        )
        {
            try
            {
                List<string> bookedSeats =
                new List<string>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetBookedSeats",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@BusId",
                    busId
                );

                cmd.Parameters.AddWithValue
                (
                    "@JourneyDate",
                    journeyDate
                );

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    string seats =
                    reader["SeatNumbers"]
                    .ToString();

                    if (!string.IsNullOrEmpty(seats))
                    {
                        bookedSeats.AddRange
                        (
                            seats.Split(',')
                        );
                    }
                }

                return bookedSeats;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public int GetAvailableSeats
        (
            int busId,
            DateTime journeyDate
        )
        {
            try
            {
                int availableSeats = 0;

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetAvailableSeats",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@BusId",
                    busId
                );

                cmd.Parameters.AddWithValue
                (
                    "@JourneyDate",
                    journeyDate
                );

                con.Open();

                availableSeats =
                Convert.ToInt32
                (
                    cmd.ExecuteScalar()
                );

                return availableSeats;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public void SavePassengers
        (
            int bookingId,
            List<Passenger> passengers
        )
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                con.Open();

                foreach (var passenger in passengers)
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        @"INSERT INTO PassengerDetails
                (
                    BookingId,
                    PassengerName,
                    Age,
                    Gender,
                    SeatNumber
                )
                VALUES
                (
                    @BookingId,
                    @PassengerName,
                    @Age,
                    @Gender,
                    @SeatNumber
                )",
                        con
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@BookingId",
                        bookingId
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@PassengerName",
                        passenger.PassengerName
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Age",
                        passenger.Age
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Gender",
                        passenger.Gender
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@SeatNumber",
                        passenger.SeatNumber
                    );

                    cmd.ExecuteNonQuery();
                }
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<Booking> GetBookingsByUserId
        (
            int userId
        )
        {
            try
            {
                List<Booking> bookings =
                new List<Booking>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetBookingsByUserId",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@UserId",
                    userId
                );

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    bookings.Add
                    (
                        new Booking
                        {
                            BookingId =
                            Convert.ToInt32
                            (
                                reader["BookingId"]
                            ),

                            JourneyDate =
                            Convert.ToDateTime
                            (
                                reader["JourneyDate"]
                            ),

                            SeatNumbers =
                            reader["SeatNumbers"]
                            .ToString()!,

                            TotalAmount =
                            Convert.ToDecimal
                            (
                                reader["TotalAmount"]
                            ),

                            BookingStatus =
                            reader["BookingStatus"]
                            .ToString()!,

                            BusName =
                            reader["BusName"]
                            .ToString()!,

                            BusNumber =
                            reader["BusNumber"]
                            .ToString()!,

                            Source =
                            reader["Source"]
                            .ToString()!,

                            Destination =
                            reader["Destination"]
                            .ToString()!
                        }
                    );
                }

                return bookings;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<Passenger> GetPassengersByBookingId
        (
            int bookingId
        )
        {
            try
            {
                List<Passenger> passengers =
                new List<Passenger>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetPassengersByBookingId",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@BookingId",
                    bookingId
                );

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    passengers.Add
(
    new Passenger
    {
        PassengerId =
        Convert.ToInt32
        (
            reader["PassengerId"]
        ),

        BookingId =
        Convert.ToInt32
        (
            reader["BookingId"]
        ),

        PassengerName =
        reader["PassengerName"]
        .ToString()!,

        Age =
        Convert.ToInt32
        (
            reader["Age"]
        ),

        Gender =
        reader["Gender"]
        .ToString()!,

        SeatNumber =
        reader["SeatNumber"]
        .ToString()!
    }
);
                }
                return passengers;
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public bool CancelBooking
        (
            int bookingId
        )
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_CancelBooking",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@BookingId",
                    bookingId
                );

                con.Open();

                int rows =
                Convert.ToInt32
                (
                    cmd.ExecuteScalar()
                );

                return rows > 0;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<Booking> GetAllBookings()
        {
            try
            {
                List<Booking> bookings =
                new List<Booking>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetAllBookings",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    bookings.Add
                    (
                        new Booking
                        {
                            BookingId =
                            Convert.ToInt32
                            (
                                reader["BookingId"]
                            ),

                            Username =
                            reader["Username"]
                            .ToString()!,

                            BusName =
                            reader["BusName"]
                            .ToString()!,

                            BusNumber =
                            reader["BusNumber"]
                            .ToString()!,

                            Source =
                            reader["Source"]
                            .ToString()!,

                            Destination =
                            reader["Destination"]
                            .ToString()!,

                            JourneyDate =
                            Convert.ToDateTime
                            (
                                reader["JourneyDate"]
                            ),

                            SeatNumbers =
                            reader["SeatNumbers"]
                            .ToString()!,

                            TotalAmount =
                            Convert.ToDecimal
                            (
                                reader["TotalAmount"]
                            ),

                            BookingStatus =
                            reader["BookingStatus"]
                            .ToString()!
                        }
                    );
                }

                return bookings;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public int GetUpcomingBookingCount
        (
            int userId
        )
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetUpcomingBookingCount",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@UserId",
                    userId
                );

                con.Open();

                return Convert.ToInt32
                (
                    cmd.ExecuteScalar()
                );
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public int GetBookingsCount()
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetBookingsCount",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                con.Open();

                return Convert.ToInt32
                (
                    cmd.ExecuteScalar()
                );
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public TicketViewModel GetTicketDetails(int bookingId)
        {
            try
            {
                TicketViewModel ticket =
                    null;

                List<Passenger> passengers =
                    new List<Passenger>();

                using
                (
                    SqlConnection con =
                    new SqlConnection(_connectionString)
                )
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetTicketDetails",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@BookingId",
                        bookingId
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        if (ticket == null)
                        {
                            ticket =
                            new TicketViewModel
                            {
                                BookingId =
                                Convert.ToInt32
                                (
                                    reader["BookingId"]
                                ),

                                BusName =
                                reader["BusName"]
                                .ToString(),

                                Source =
                                reader["Source"]
                                .ToString(),

                                Destination =
                                reader["Destination"]
                                .ToString(),

                                JourneyDate =
                                Convert.ToDateTime
                                (
                                    reader["JourneyDate"]
                                ),

                                TotalAmount =
                                Convert.ToDecimal
                                (
                                    reader["TotalAmount"]
                                ),

                                BookingDate =
                                Convert.ToDateTime
                                (
                                    reader["CreatedAt"]
                                ),

                                Passengers =
                                passengers
                            };
                        }

                        passengers.Add
                        (
                            new Passenger
                            {
                                PassengerName =
                                reader["PassengerName"]
                                .ToString(),

                                Age =
                                Convert.ToInt32
                                (
                                    reader["Age"]
                                ),

                                Gender =
                                reader["Gender"]
                                .ToString(),

                                SeatNumber =
                                reader["SeatNumber"]
                                .ToString()
                            }
                        );
                    }
                }

                return ticket;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<Booking> FilterBookings
        (
            int? routeId,
            int? busId
        )
        {
            try
            {
                List<Booking> bookings =
                new List<Booking>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_FilterBookings",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@RouteId",
                    (object?)routeId ?? DBNull.Value
                );

                cmd.Parameters.AddWithValue
                (
                    "@BusId",
                    (object?)busId ?? DBNull.Value
                );

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    bookings.Add
                    (
                        new Booking
                        {
                            BookingId =
                            Convert.ToInt32(reader["BookingId"]),

                            Username =
                            reader["Username"].ToString()!,

                            BusName =
                            reader["BusName"].ToString()!,

                            BusNumber =
                            reader["BusNumber"].ToString()!,

                            Source =
                            reader["Source"].ToString()!,

                            Destination =
                            reader["Destination"].ToString()!,

                            JourneyDate =
                            Convert.ToDateTime
                            (
                                reader["JourneyDate"]
                            ),

                            SeatNumbers =
                            reader["SeatNumbers"].ToString()!,

                            TotalAmount =
                            Convert.ToDecimal
                            (
                                reader["TotalAmount"]
                            ),

                            BookingStatus =
                            reader["BookingStatus"].ToString()!,

                            CreatedAt =
                            Convert.ToDateTime
                            (
                                reader["CreatedAt"]
                            )
                        }
                    );
                }

                return bookings;
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
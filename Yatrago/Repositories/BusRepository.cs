using System.Data;
using Microsoft.Data.SqlClient;
using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repositories
{
    public class BusRepository
        : IBusRepository
    {
        private readonly
        string _connectionString;

        public BusRepository
        (
            IConfiguration configuration
        )
        {
            _connectionString =
            configuration.GetConnectionString
            (
                "DefaultConnection"
            );
        }

        public bool AddBus(Bus bus)
        {
            SqlConnection con =
            new SqlConnection(_connectionString);

            try
            {
                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_AddBus",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                // PARAMETERS
                cmd.Parameters.AddWithValue
                (
                    "@BusName",
                    bus.BusName
                );

                cmd.Parameters.AddWithValue
                (
                    "@BusNumber",
                    bus.BusNumber
                );

                cmd.Parameters.AddWithValue
                (
                    "@BusType",
                    bus.BusType
                );

                cmd.Parameters.AddWithValue
                (
                    "@TotalSeats",
                    bus.TotalSeats
                );

                cmd.Parameters.AddWithValue
                (
                    "@RouteId",
                    bus.RouteId
                );

                cmd.Parameters.AddWithValue
                (
                    "@DepartureTime",
                    bus.DepartureTime
                );

                cmd.Parameters.AddWithValue
                (
                    "@ArrivalTime",
                    bus.ArrivalTime
                );

                cmd.Parameters.AddWithValue
                (
                    "@FareAmount",
                    bus.FareAmount
                );

                cmd.Parameters.AddWithValue
                (
                    "@BusImage",
                    bus.BusImage
                );

                cmd.Parameters.AddWithValue
                (
                    "@Status",
                    true
                );

                con.Open();

                int rows =
                cmd.ExecuteNonQuery();

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

        
        public List<Bus> GetBuses()
        {
            try
            {
                List<Bus> buses =
                new List<Bus>();

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetBuses",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        buses.Add
                        (
                            new Bus
                            {
                                BusId =
                                Convert.ToInt32
                                (
                                    reader["BusId"]
                                ),

                                BusName =
                                reader["BusName"]
                                .ToString(),

                                BusNumber =
                                reader["BusNumber"]
                                .ToString(),

                                BusType =
                                reader["BusType"]
                                .ToString(),

                                TotalSeats =
                                Convert.ToInt32
                                (
                                    reader["TotalSeats"]
                                ),

                                DepartureTime =
                                (TimeSpan)
                                reader["DepartureTime"],

                                ArrivalTime =
                                (TimeSpan)
                                reader["ArrivalTime"],

                                FareAmount =
                                Convert.ToDecimal
                                (
                                    reader["FareAmount"]
                                ),

                                Status =
                                Convert.ToBoolean
                                (
                                    reader["Status"]
                                ),

                                Source =
                                reader["Source"]
                                .ToString(),

                                Destination =
                                reader["Destination"]
                                .ToString(),

                                BusImage =
                                reader["BusImage"]
                                .ToString(),
                            }
                        );
                    }
                }

                return buses;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        
        public Bus GetBusById(int busId)
        {
            try
            {
                Bus bus = null;

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetBusById",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@BusId",
                        busId
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        bus = new Bus
                        {
                            BusId =
                            Convert.ToInt32
                            (
                                reader["BusId"]
                            ),

                            BusName =
                            reader["BusName"]
                            .ToString(),

                            BusNumber =
                            reader["BusNumber"]
                            .ToString(),

                            BusType =
                            reader["BusType"]
                            .ToString(),

                            TotalSeats =
                            Convert.ToInt32
                            (
                                reader["TotalSeats"]
                            ),

                            RouteId =
                            Convert.ToInt32
                            (
                                reader["RouteId"]
                            ),

                            DepartureTime =
                            (TimeSpan)
                            reader["DepartureTime"],

                            ArrivalTime =
                            (TimeSpan)
                            reader["ArrivalTime"],

                            BusImage =
                            reader["BusImage"]
                            .ToString(),

                            FareAmount =
                            Convert.ToDecimal
                            (
                                reader["FareAmount"]
                            )
                        };
                    }
                }

                return bus;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        
        public bool UpdateBus(Bus bus)
        {
            try
            {
                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_UpdateBus",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@BusId",
                        bus.BusId
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@BusName",
                        bus.BusName
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@BusNumber",
                        bus.BusNumber
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@BusType",
                        bus.BusType
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@TotalSeats",
                        bus.TotalSeats
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@RouteId",
                        bus.RouteId
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@DepartureTime",
                        bus.DepartureTime
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@ArrivalTime",
                        bus.ArrivalTime
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@BusImage",
                        bus.BusImage
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@FareAmount",
                        bus.FareAmount
                    );

                    con.Open();

                    cmd.ExecuteNonQuery();

                    return true;
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

        public bool DeleteBus(int busId)
        {
            try
            {
                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_DeleteBus",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@BusId",
                        busId
                    );

                    con.Open();

                    int rows =
                    cmd.ExecuteNonQuery();

                    return rows > 0;
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

        public List<Bus> SearchBuses
        (
        string source,
        string destination
        )
        {
            try
            {
                List<Bus> buses =
                new List<Bus>();

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "dbo.SP_SearchBuses",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@Source",
                        source
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Destination",
                        destination
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        buses.Add
                        (
                            new Bus
                            {
                                BusId =
                                Convert.ToInt32
                                (
                                    reader["BusId"]
                                ),

                                BusName =
                                reader["BusName"]
                                .ToString(),

                                BusNumber =
                                reader["BusNumber"]
                                .ToString(),

                                BusType =
                                reader["BusType"]
                                .ToString(),

                                TotalSeats =
                                Convert.ToInt32
                                (
                                    reader["TotalSeats"]
                                ),

                                DepartureTime =
                                TimeSpan.Parse
                                (
                                    reader["DepartureTime"]
                                    .ToString()
                                ),

                                ArrivalTime =
                                TimeSpan.Parse
                                (
                                    reader["ArrivalTime"]
                                    .ToString()
                                ),

                                FareAmount =
                                Convert.ToDecimal
                                (
                                    reader["FareAmount"]
                                ),

                                Source =
                                reader["Source"]
                                .ToString(),

                                Destination =
                                reader["Destination"]
                                .ToString(),

                                BusImage =
                                reader["BusImage"]
                                .ToString(),
                            }
                        );
                    }
                }

                return buses;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public int GetBusesCount()
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetBusesCount",
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


        public List<LiveBus> GetLiveBuses()
        {
            try
            {
                List<LiveBus> buses =
                    new List<LiveBus>();

                using SqlConnection con =
                    new SqlConnection
                    (
                        _connectionString
                    );

                SqlCommand cmd =
                    new SqlCommand
                    (
                        "dbo.SP_GetLiveBuses",
                        con
                    );

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    buses.Add
                    (
                        new LiveBus
                        {
                            BusName =
                            reader["BusName"]
                            .ToString()!,

                            BusType =
                            reader["BusType"]
                            .ToString()!,

                            TotalSeats =
                            Convert.ToInt32
                            (
                                reader["TotalSeats"]
                            ),

                            Source =
                            reader["Source"]
                            .ToString()!,

                            Destination =
                            reader["Destination"]
                            .ToString()!
                        }
                    );
                }

                return buses;
            }

            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
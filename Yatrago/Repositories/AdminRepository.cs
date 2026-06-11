using Microsoft.Data.SqlClient;
using Microsoft.AspNetCore.Identity;
using System.Data;

using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repository
{
    public class AdminRepository
        : IAdminRepository
    {
        private readonly
        string _connectionString;

        public AdminRepository
        (
            IConfiguration configuration
        )
        {
            _connectionString =
            configuration
            .GetConnectionString
            (
                "DefaultConnection"
            );
        }

        public Admin ValidateAdmin
        (
            string username,
            string password
        )
        {
            try
            {
                Admin admin = null;

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_AdminLogin",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@Username",
                        username
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string storedHash =
                        reader["Password"]
                        .ToString();

                        PasswordHasher<Admin> hasher =
                        new PasswordHasher<Admin>();

                        admin = new Admin
                        {
                            AdminId =
                            Convert.ToInt32
                            (
                                reader["AdminId"]
                            ),

                            Username =
                            reader["Username"]
                            .ToString()
                        };

                        var result =
                        hasher.VerifyHashedPassword
                        (
                            admin,
                            storedHash,
                            password
                        );

                        if (result ==
                        PasswordVerificationResult.Success)
                        {
                            return admin;
                        }
                    }
                }

                return null;
            }

            catch (Exception ex)
            {
                throw;
            }
        }

        public void UpdateLastLogin
        (
            int adminId
        )
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_UpdateAdminLastLogin",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@AdminId",
                    adminId
                );

                con.Open();

                cmd.ExecuteNonQuery();
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<DateWiseReport> GetDateWiseReport
        (
            DateTime journeyDate
        )
        {
            try
            {
                List<DateWiseReport> reports =
                new List<DateWiseReport>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_DateWiseReport",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

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
                    reports.Add
                    (
                        new DateWiseReport
                        {
                            BookingId =
                            Convert.ToInt32
                            (
                                reader["BookingId"]
                            ),

                            Username =
                            reader["Username"].ToString(),

                            BusName =
                            reader["BusName"].ToString(),

                            Source =
                            reader["Source"].ToString(),

                            Destination =
                            reader["Destination"].ToString(),

                            SeatNumbers =
                            reader["SeatNumbers"].ToString(),

                            TotalAmount =
                            Convert.ToDecimal
                            (
                                reader["TotalAmount"]
                            ),

                            BookingStatus =
                            reader["BookingStatus"].ToString()
                        }
                    );
                }

                return reports;
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<BusWiseReport> GetBusWiseReport
        (
            int busId
        )
        {
            try
            {
                List<BusWiseReport> reports =
                new List<BusWiseReport>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_BusWiseReport",
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

                while (reader.Read())
                {
                    reports.Add
                    (
                        new BusWiseReport
                        {
                            PassengerName =
                            reader["PassengerName"].ToString(),

                            Age =
                            Convert.ToInt32
                            (
                                reader["Age"]
                            ),

                            Gender =
                            reader["Gender"].ToString(),

                            SeatNumber =
                            reader["SeatNumber"].ToString(),

                            BusName =
                            reader["BusName"].ToString(),

                            JourneyDate =
                            Convert.ToDateTime
                            (
                                reader["JourneyDate"]
                            ),

                            Username =
                            reader["Username"].ToString()
                        }
                    );
                }

                return reports;
            }

            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }


        public List<RevenueReport>
        GetRevenueReport()
        {
            try
            {
                List<RevenueReport> reports =
                new();

                using (SqlConnection con =
                      new SqlConnection
                      (
                          _connectionString
                      ))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetRevenueReport",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        reports.Add
                        (
                            new RevenueReport
                            {
                                JourneyDate =
                                Convert.ToDateTime
                                (
                                    reader["JourneyDate"]
                                ),

                                TotalBookings =
                                Convert.ToInt32
                                (
                                    reader["TotalBookings"]
                                ),

                                TotalRevenue =
                                Convert.ToDecimal
                                (
                                    reader["TotalRevenue"]
                                )
                            }
                        );
                    }
                }

                return reports;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }
    }
}
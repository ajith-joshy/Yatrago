using Microsoft.Data.SqlClient;
using System.Data;
using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repositories
{
    public class BusRouteRepository
        : IBusRouteRepository
    {
        private readonly
        string _connectionString;

        public BusRouteRepository
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

        public bool AddRoute(BusRoute route)
        {
            SqlConnection con =
            new SqlConnection(_connectionString);

            try
            {
                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_AddRoute",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@Source",
                    route.Source
                );

                cmd.Parameters.AddWithValue
                (
                    "@Destination",
                    route.Destination
                );

                cmd.Parameters.AddWithValue
                (
                    "@Distance",
                    route.Distance
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

        public List<BusRoute> GetRoutes()
        {
            try
            {
                List<BusRoute> routes =
                new List<BusRoute>();

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetRoutes",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        routes.Add
                        (
                            new BusRoute
                            {
                                RouteId =
                                Convert.ToInt32
                                (
                                    reader["RouteId"]
                                ),

                                Source =
                                reader["Source"]
                                .ToString(),

                                Destination =
                                reader["Destination"]
                                .ToString(),

                                Distance =
                                Convert.ToDecimal
                                (
                                    reader["Distance"]
                                )
                            }
                        );
                    }
                }

                return routes;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public BusRoute GetRouteById(int routeId)
        {
            try
            {
                BusRoute route = null;

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetRouteById",
                        con
                    );
                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@RouteId",
                        routeId
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        route = new BusRoute
                        {
                            RouteId =
                            Convert.ToInt32
                            (
                                reader["RouteId"]
                            ),

                            Source =
                            reader["Source"]
                            .ToString(),

                            Destination =
                            reader["Destination"]
                            .ToString(),

                            Distance =
                            Convert.ToDecimal
                            (
                                reader["Distance"]
                            )
                        };
                    }
                }

                return route;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public void UpdateRoute(BusRoute route)
        {
            try
            {
                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_UpdateRoute",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@RouteId",
                        route.RouteId
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Source",
                        route.Source
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Destination",
                        route.Destination
                    );

                    cmd.Parameters.AddWithValue
                    (
                        "@Distance",
                        route.Distance
                    );

                    con.Open();

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

        public bool DeleteRoute(int routeId)
        {
            try
            {
                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    con.Open();

                    SqlCommand checkCmd =
                    new SqlCommand
                    (
                        "SP_CheckRouteUsage",
                        con
                    );

                    checkCmd.CommandType =
                    CommandType.StoredProcedure;

                    checkCmd.Parameters.AddWithValue
                    (
                        "@RouteId",
                        routeId
                    );

                    int busCount =
                    Convert.ToInt32
                    (
                        checkCmd.ExecuteScalar()
                    );

                    if (busCount > 0)
                    {
                        return false;
                    }

                    SqlCommand deleteCmd =
                    new SqlCommand
                    (
                        "SP_DeleteRoute",
                        con
                    );

                    deleteCmd.CommandType =
                    CommandType.StoredProcedure;

                    deleteCmd.Parameters.AddWithValue
                    (
                        "@RouteId",
                        routeId
                    );

                    int rowsAffected =
                    deleteCmd.ExecuteNonQuery();

                    return rowsAffected > 0;
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

        public int GetRoutesCount()
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetRoutesCount",
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
    }
}
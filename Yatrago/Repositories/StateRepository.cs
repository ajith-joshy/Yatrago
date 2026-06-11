using System.Data;
using Microsoft.Data.SqlClient;
using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repositories
{
    public class StateRepository
        : IStateRepository
    {
        private readonly
        string _connectionString;

        public StateRepository
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

        public List<State> GetStates()
        {
            try
            {
                List<State> states =
                new List<State>();

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetStates",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        states.Add(new State
                        {
                            StateId =
                            Convert.ToInt32
                            (
                                reader["StateId"]
                            ),

                            StateName =
                            reader["StateName"]
                            .ToString()
                        });
                    }
                }

                return states;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public List<City> GetCitiesByStateId
        (
            int stateId
        )
        {
            try
            {
                List<City> cities =
                new List<City>();

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetCitiesByStateId",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue
                    (
                        "@StateId",
                        stateId
                    );

                    con.Open();

                    SqlDataReader reader =
                    cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        cities.Add(new City
                        {
                            CityId =
                            Convert.ToInt32
                            (
                                reader["CityId"]
                            ),

                            CityName =
                            reader["CityName"]
                            .ToString(),

                            StateId =
                            Convert.ToInt32
                            (
                                reader["StateId"]
                            )
                        });
                    }
                }

                return cities;
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
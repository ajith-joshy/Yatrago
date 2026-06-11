using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Identity;
using YatraGo.Interfaces;
using YatraGo.Models;

namespace YatraGo.Repositories
{
    public class UserRepository
        : IUserRepository
    {
        private readonly
        string _connectionString;

        public UserRepository
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

        public void RegisterUser(User user)
        {
            try
            {
                PasswordHasher<User> hasher =
                new PasswordHasher<User>();

                string hashedPassword =
                hasher.HashPassword
                (
                    user,
                    user.Password
                );

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_RegisterUser",
                        con
                    );

                    cmd.CommandType =
                    CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@FirstName",
                        user.FirstName
                    );

                    cmd.Parameters.AddWithValue(
                        "@LastName",
                        user.LastName
                    );

                    cmd.Parameters.AddWithValue(
                        "@Address",
                        user.Address
                    );

                    cmd.Parameters.AddWithValue(
                        "@Username",
                        user.Username
                    );

                    cmd.Parameters.AddWithValue(
                        "@DOB",
                        user.DOB
                    );

                    cmd.Parameters.AddWithValue(
                        "@Gender",
                        user.Gender
                    );

                    cmd.Parameters.AddWithValue(
                        "@StateId",
                        user.StateId
                    );

                    cmd.Parameters.AddWithValue(
                        "@CityId",
                        user.CityId
                    );

                    cmd.Parameters.AddWithValue(
                        "@Email",
                        user.Email
                    );

                    cmd.Parameters.AddWithValue(
                        "@Phone",
                        user.Phone
                    );

                    cmd.Parameters.AddWithValue(
                        "@Password",
                        hashedPassword
                    );

                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            catch (Exception)
            {
                throw;
            }
        }


public User ValidateUser
        (
            string username,
            string password
        )
        {
            try
            {
                User user = null;

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_UserLogin",
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

                        PasswordHasher<User> hasher =
                        new PasswordHasher<User>();

                        user = new User
                        {
                            UserId =
                            Convert.ToInt32
                            (
                                reader["UserId"]
                            ),

                            Username =
                            reader["Username"]
                            .ToString()
                        };

                        var result =
                        hasher.VerifyHashedPassword
                        (
                            user,
                            storedHash,
                            password
                        );

                        if (result ==
                        PasswordVerificationResult.Success)
                        {
                            return user;
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

        public List<User> GetUsers()
        {
            try
            {
                List<User> users =
                new List<User>();

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetUsers",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                con.Open();

                SqlDataReader reader =
                cmd.ExecuteReader();

                while (reader.Read())
                {
                    users.Add
                    (
                        new User
                        {
                            UserId =
                            Convert.ToInt32
                            (
                                reader["UserId"]
                            ),

                            Username =
                            reader["Username"]
                            .ToString()!,

                            FirstName =
                            reader["FirstName"]
                            .ToString()!,

                            LastName =
                            reader["LastName"]
                            .ToString()!,

                            Email =
                            reader["Email"]
                            .ToString()!,

                            Phone =
                            reader["Phone"]
                            .ToString()!,

                            Gender =
                            reader["Gender"]
                            .ToString()!,

                            DOB =
                            Convert.ToDateTime
                            (
                                reader["DOB"]
                            )
                        }
                    );
                }

                return users;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public User GetUserById
        (
            int userId
        )
        {
            try
            {
                User user =
                null;

                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetUserById",
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

                if (reader.Read())
                {
                    user = new User();

                    user.UserId =
                    Convert.ToInt32
                    (
                        reader["UserId"]
                    );

                    user.FirstName =
                    reader["FirstName"]
                    .ToString()!;

                    user.LastName =
                    reader["LastName"]
                    .ToString()!;

                    user.Address =
                    reader["Address"]
                    .ToString()!;

                    user.Username =
                    reader["Username"]
                    .ToString()!;

                    user.DOB =
                    Convert.ToDateTime
                    (
                        reader["DOB"]
                    );

                    user.Gender =
                    reader["Gender"]
                    .ToString()!;

                    user.StateId =
                    Convert.ToInt32
                    (
                        reader["StateId"]
                    );

                    user.CityId =
                    Convert.ToInt32
                    (
                        reader["CityId"]
                    );

                    user.Email =
                    reader["Email"]
                    .ToString()!;

                    user.Phone =
                    reader["Phone"]
                    .ToString()!;

                    user.ProfileImage =
                    reader["ProfileImage"]
                    .ToString()!;
                }

                return user;
            }
            catch
            {
                throw new Exception
                (
                    "Unable to process your request. Please try again later."
                );
            }
        }

        public User GetUserByUsername
        (
            string username
        )
        {
                User user = null;

                using (SqlConnection con =
                new SqlConnection(_connectionString))
                {
                    SqlCommand cmd =
                    new SqlCommand
                    (
                        "SP_GetUserByUsername",
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
                        user = new User
                        {
                            UserId =
                            Convert.ToInt32
                            (
                                reader["UserId"]
                            ),

                            Username =
                            reader["Username"]
                            .ToString()
                        };
                    }
                }

                return user;
        }

        public bool UpdateUserProfile
        (
            User user
        )
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_UpdateUserProfile",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@UserId",
                    user.UserId
                );

                cmd.Parameters.AddWithValue
                (
                    "@FirstName",
                    user.FirstName
                );

                cmd.Parameters.AddWithValue
                (
                    "@LastName",
                    user.LastName
                );

                cmd.Parameters.AddWithValue
                (
                    "@Address",
                    user.Address
                );

                cmd.Parameters.AddWithValue
                (
                    "@DOB",
                    user.DOB
                );

                cmd.Parameters.AddWithValue
                (
                    "@Gender",
                    user.Gender
                );

                cmd.Parameters.AddWithValue
                (
                    "@StateId",
                    user.StateId
                );

                cmd.Parameters.AddWithValue
                (
                    "@CityId",
                    user.CityId
                );

                cmd.Parameters.AddWithValue
                (
                    "@Email",
                    user.Email
                );

                cmd.Parameters.AddWithValue
                (
                    "@Phone",
                    user.Phone
                );

                cmd.Parameters.AddWithValue
                (
                    "@ProfileImage",
                    user.ProfileImage
                );

                cmd.Parameters.AddWithValue
                (
                    "@ModifiedBy",
                    user.Username
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

        public void UpdateLastLogin
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
                    "dbo.SP_UpdateUserLastLogin",
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

        public int GetUsersCount()
        {
            try
            {
                using SqlConnection con =
                new SqlConnection(_connectionString);

                SqlCommand cmd =
                new SqlCommand
                (
                    "dbo.SP_GetUsersCount",
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

        public bool UpdatePassword
        (
            int userId,
            string newPassword
        )
        {
            try
            {
                PasswordHasher<User> hasher =
                new PasswordHasher<User>();

                string hashedPassword =
                hasher.HashPassword
                (
                    new User(),
                    newPassword
                );

                using SqlConnection con =
                new SqlConnection(_connectionString);
                
                SqlCommand cmd =
                new SqlCommand
                (
                    "SP_UpdatePassword",
                    con
                );

                cmd.CommandType =
                CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue
                (
                    "@UserId",
                    userId
                );

                cmd.Parameters.AddWithValue
                (
                    "@Password",
                    hashedPassword
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
    }
}
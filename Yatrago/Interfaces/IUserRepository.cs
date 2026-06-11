using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IUserRepository
    {
        
        void RegisterUser(User user);


        User ValidateUser
        (
            string username,
            string password
        );

        List<User> GetUsers();

        User GetUserById
        (
            int userId
        );

        bool UpdateUserProfile
        (
            User user
        );

        void UpdateLastLogin
        (
            int userId
        );

        int GetUsersCount();

        bool UpdatePassword
        (
            int userId,
            string newPassword
        );

        User GetUserByUsername
        (
            string username
        );
    }
}
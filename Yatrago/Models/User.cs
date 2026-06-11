namespace YatraGo.Models
{
    public class User
    {
        public int UserId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Address { get; set; }
        
        public string Username { get; set; }

        public DateTime DOB { get; set; }

        public string Gender { get; set; }

        public int StateId { get; set; }

        public int CityId { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public string Password { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string? ModifiedBy { get; set; }

        public string ProfileImage
        {
            get;
            set;
        } = string.Empty;
    }
}
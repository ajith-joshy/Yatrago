using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IAdminRepository
    {
        Admin ValidateAdmin(string username,
                            string password);

        void UpdateLastLogin
        (
            int adminId
        );

        List<DateWiseReport> GetDateWiseReport
        (
            DateTime journeyDate
        );

        List<BusWiseReport> GetBusWiseReport
        (
            int busId
        );

        List<RevenueReport>
        GetRevenueReport();
    
    }
}
    
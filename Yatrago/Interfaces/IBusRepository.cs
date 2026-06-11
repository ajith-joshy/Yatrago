using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IBusRepository
    {
        bool AddBus(Bus bus);

        List<Bus> GetBuses();

        Bus GetBusById(int busId);

        bool UpdateBus(Bus bus);

        bool DeleteBus(int busId);

        List<Bus> SearchBuses
        (
            string source,
            string destination
        );

        int GetBusesCount();

        List<LiveBus> GetLiveBuses();
    }
}
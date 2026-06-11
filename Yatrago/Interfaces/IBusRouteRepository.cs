using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IBusRouteRepository
    {
        bool AddRoute(BusRoute route);

        List<BusRoute> GetRoutes();

        BusRoute GetRouteById(int routeId);

        void UpdateRoute(BusRoute route);

        bool DeleteRoute(int routeId);

        int GetRoutesCount();
    }
}
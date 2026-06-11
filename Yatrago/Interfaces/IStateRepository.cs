using YatraGo.Models;

namespace YatraGo.Interfaces
{
    public interface IStateRepository
    {
        List<State> GetStates();

        List<City> GetCitiesByStateId
        (
            int stateId
        );
    }
}
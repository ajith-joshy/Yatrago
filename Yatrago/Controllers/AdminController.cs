using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using YatraGo.Interfaces;
using YatraGo.Models;
using YatraGo.Repositories;
using YatraGo.Repository;

namespace Yatrago.Controllers
{
    public class AdminController
        : Controller
    {
        private readonly
        IBusRouteRepository _routeRepository;

        private readonly
        IBusRepository _busRepository;

        private readonly
        IUserRepository _userRepository;

        private readonly
        IBookingRepository _bookingRepository;

        private readonly
        IAdminRepository _adminRepository;

        public AdminController
        (
            IBusRouteRepository routeRepository,

            IBusRepository busRepository,

            IUserRepository userRepository,

            IBookingRepository bookingRepository,

            IAdminRepository adminRepository
        )
        {
            _routeRepository =
            routeRepository;

            _busRepository =
            busRepository;

            _userRepository =
            userRepository;

            _bookingRepository =
            bookingRepository;

            _adminRepository =
            adminRepository;

        }

        public IActionResult Dashboard()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                ViewBag.TotalUsers =
                _userRepository.GetUsersCount();

                ViewBag.TotalBuses =
                _busRepository.GetBusesCount();

                ViewBag.TotalRoutes =
                _routeRepository.GetRoutesCount();

                ViewBag.TotalBookings =
                _bookingRepository.GetBookingsCount();

                return View();
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
        }

        [HttpGet]
        public IActionResult AddRoute()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            return View();
        }
        [HttpPost]
        public IActionResult AddRoute(BusRoute route)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
            try
            {
                if
                (
                    string.IsNullOrWhiteSpace(route.Source)
                    ||
                    string.IsNullOrWhiteSpace(route.Destination)
                    ||
                    route.Distance <= 0
                )
                {
                    TempData["Message"] =
                    "Invalid route details";

                    return RedirectToAction
                    (
                        "ManageRoutes"
                    );
                }

                bool added =
                _routeRepository.AddRoute(route);

                if (added)
                {
                    TempData["Message"] =
                    "Route added successfully";
                }
                else
                {
                    TempData["Message"] =
                    "Route addition failed";
                }
            }
            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }
            return RedirectToAction
            (
                "ManageRoutes"
            );
        }


        [HttpGet]
        public IActionResult EditRoute(int id)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                var route =
                _routeRepository.GetRouteById(id);

                return View(route);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "ManageRoutes"
                );
            }
        }
        [HttpPost]
        public IActionResult EditRoute(BusRoute route)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
            try
            {
                _routeRepository.UpdateRoute(route);

                TempData["Message"] =
                "Route updated successfully";
            }
            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }
            return RedirectToAction
            (
                "ManageRoutes"
            );
        }

        public IActionResult DeleteRoute(int routeId)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                bool deleted =
                _routeRepository.DeleteRoute(routeId);

                if (!deleted)
                {
                    TempData["Message"] =
                    "Cannot delete route because buses are assigned.";

                    return RedirectToAction
                    (
                        "ManageRoutes"
                    );
                }

                TempData["Message"] =
                "Route deleted successfully.";
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }

            return RedirectToAction
            (
                "ManageRoutes"
            );
        }

        [HttpGet]
        public IActionResult ManageRoutes()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                var routes =
                _routeRepository.GetRoutes();

                return View(routes);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }


        [HttpGet]
        public IActionResult ManageBuses()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                ViewBag.Routes =
                _routeRepository.GetRoutes();

                var buses =
                _busRepository.GetBuses();

                return View(buses);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }

        [HttpPost]
        public IActionResult AddBus
        (
            Bus bus,
            IFormFile imageFile
        )
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                if
                (
                    string.IsNullOrWhiteSpace(bus.BusName)
                    ||
                    string.IsNullOrWhiteSpace(bus.BusNumber)
                    ||
                    bus.TotalSeats <= 0
                    ||
                    bus.FareAmount <= 0
                    ||
                    bus.RouteId <= 0
                )
                {
                    TempData["Message"] =
                    "Invalid bus details.";

                    return RedirectToAction
                    (
                        "ManageBuses"
                    );
                }

                if (imageFile != null)
                {
                    string folderPath =
                    Path.Combine
                    (
                        Directory.GetCurrentDirectory(),
                        "wwwroot/images/bus"
                    );

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName =
                    Guid.NewGuid().ToString()
                    +
                    Path.GetExtension(imageFile.FileName);

                    string filePath =
                    Path.Combine(folderPath, fileName);

                    using
                    (
                        var stream =
                        new FileStream(filePath, FileMode.Create)
                    )
                    {
                        imageFile.CopyTo(stream);
                    }

                    bus.BusImage =
                    "/images/bus/" + fileName;
                }

                bus.Status = true;

                bool added =
                _busRepository.AddBus(bus);

                if (added)
                {
                    TempData["Message"] =
                    "Bus added successfully.";
                }

                else
                {
                    TempData["Message"] =
                    "Bus addition failed.";
                }
            }

            catch (IOException)
            {
                TempData["Message"] =
                "File upload failed.";
            }

            catch (UnauthorizedAccessException)
            {
                TempData["Message"] =
                "Access denied.";
            }
            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }
            return RedirectToAction
            (
                "ManageBuses"
            );
        }


        [HttpGet]
        public IActionResult EditBus(int id)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                var bus =
                _busRepository.GetBusById(id);

                ViewBag.Routes =
                _routeRepository.GetRoutes();

                return View(bus);
            }
            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }
            return RedirectToAction
            (
                "ManageBuses"
            );
        }
        [HttpPost]
        public IActionResult EditBus
        (
            Bus bus,
            IFormFile imageFile
        )
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                if
                (
                    string.IsNullOrWhiteSpace(bus.BusName)
                    ||
                    string.IsNullOrWhiteSpace(bus.BusNumber)
                    ||
                    bus.TotalSeats <= 0
                    ||
                    bus.FareAmount <= 0
                    ||
                    bus.RouteId <= 0
                )
                {
                    TempData["Message"] =
                    "Invalid bus details.";

                    return RedirectToAction
                    (
                        "ManageBuses"
                    );
                }
                if (imageFile != null)
                {
                    string extension =
                    Path.GetExtension(imageFile.FileName)
                    .ToLower();

                    if
                    (
                        extension != ".jpg"
                        &&
                        extension != ".jpeg"
                        &&
                        extension != ".png"
                    )
                    {
                        TempData["Message"] =
                        "Only JPG and PNG allowed.";

                        return RedirectToAction
                        (
                            "ManageBuses"
                        );
                    }

                    string folderPath =
                    Path.Combine
                    (
                        Directory.GetCurrentDirectory(),
                        "wwwroot/images/bus"
                    );

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName =
                    Guid.NewGuid().ToString()
                    +
                    Path.GetExtension(imageFile.FileName);

                    string filePath =
                    Path.Combine(folderPath, fileName);

                    using
                    (
                        var stream =
                        new FileStream(filePath, FileMode.Create)
                    )
                    {
                        imageFile.CopyTo(stream);
                    }

                    bus.BusImage =
                    "/images/bus/" + fileName;
                }

                else
                {
                  
                    var existingBus =
                    _busRepository.GetBusById(bus.BusId);

                    bus.BusImage =
                    existingBus.BusImage;
                }

                _busRepository.UpdateBus(bus);

                TempData["Message"] =
                "Bus updated successfully.";
            }

            catch (IOException)
            {
                TempData["Message"] =
                "File upload failed.";
            }

            catch (UnauthorizedAccessException)
            {
                TempData["Message"] =
                "Access denied.";
            }
            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }

            return RedirectToAction
            (
                "ManageBuses"
            );
        }

        public IActionResult DeleteBus(int busId)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                bool deleted =
                _busRepository.DeleteBus(busId);

                if (deleted)
                {
                    TempData["Message"] =
                    "Bus deleted successfully.";
                }

                else
                {
                    TempData["Message"] =
                    "Cannot delete bus because bookings exist.";
                }
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;
            }
            return RedirectToAction
            (
                "ManageBuses"
            );
        }


        [HttpGet]
        public IActionResult ManageUsers()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
            try
            {
                var users =
                _userRepository.GetUsers();

                return View(users);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }


        [HttpGet]
        public IActionResult ManageBookings()
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
            try
            {
                var bookings =
                _bookingRepository.GetAllBookings();

                return View(bookings);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }


        [HttpGet]
        public IActionResult PassengerList(int bookingId)
        {
            if (!IsAdminLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                var passengers =
                _bookingRepository
                .GetPassengersByBookingId
                (
                    bookingId
                );

                return View(passengers);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }

        private bool IsAdminLoggedIn()
        {
            return
            HttpContext.Session.GetString("AdminUsername")
            != null;
        }

        public IActionResult DateWiseReport()
        {
            try
            {
                return View();
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }

        [HttpPost]
        public IActionResult DateWiseReport(DateTime journeyDate)
        {
            try
            {
                if
                (
                    journeyDate == DateTime.MinValue
                )
                {
                    return View
                    (
                        new List<DateWiseReport>()
                    );
                }

                var reports =
                _adminRepository.GetDateWiseReport
                (
                    journeyDate
                );

                return View(reports);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }

        [HttpGet]
        public IActionResult BusWiseReport()
        {
            try
            {
                ViewBag.Buses =
                _busRepository.GetBuses();

                return View
                (
                    new List<BusWiseReport>()
                );
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }
        [HttpPost]
        public IActionResult BusWiseReport(int busId)
        {
            try
            {
                ViewBag.Buses =
                _busRepository.GetBuses();

                ViewBag.SearchPerformed =
                true;

                if (busId <= 0)
                {
                    return View
                    (
                        new List<BusWiseReport>()
                    );
                }

                var reports =
                _adminRepository.GetBusWiseReport
                (
                    busId
                );

                return View(reports);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }

        public IActionResult RevenueReport()
        {
            try
            {
                var report =
                _adminRepository
                .GetRevenueReport();

                return View(report);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Dashboard"
                );
            }
        }
    }
}
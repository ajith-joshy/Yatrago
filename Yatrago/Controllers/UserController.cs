using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using YatraGo.Interfaces;
using YatraGo.Models;
using YatraGo.Repositories;

namespace Yatrago.Controllers
{
    public class UserController
        : Controller
    {
        private readonly
        IBusRepository _busRepository;

        private readonly
        IBookingRepository _bookingRepository;

        private readonly
        IUserRepository _userRepository;

        private readonly
        IStateRepository _stateRepository;
        
        public UserController
        (
            IBusRepository busRepository,

            IBookingRepository bookingRepository,

            IUserRepository userRepository,

            IStateRepository stateRepository
        )
        {
            _busRepository =
            busRepository;

            _bookingRepository =
            bookingRepository;

            _userRepository =
            userRepository;

            _stateRepository =
            stateRepository;
        }

        public IActionResult Dashboard()
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                int? userId =
                HttpContext.Session.GetInt32
                (
                    "UserId"
                );

                if (userId == null)
                {
                    return RedirectToAction
                    (
                        "SignIn",
                        "Account"
                    );
                }

                ViewBag.UpcomingBookings =
                _bookingRepository
                .GetUpcomingBookingCount
                (
                    userId.Value
                );

                ViewBag.LiveBuses =
                _busRepository
                .GetLiveBuses();

                return View();
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "Logout",
                    "Account"
                );
            }
        }


        [HttpPost]
        public IActionResult SearchBus
        (
            string source,
            string destination,
            DateTime journeyDate
        )
        {
            if (!IsUserLoggedIn())
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
                    string.IsNullOrWhiteSpace(source)
                    ||
                    string.IsNullOrWhiteSpace(destination)
                )
                {
                    TempData["Message"] =
                    "Invalid search details";

                    return RedirectToAction
                    (
                        "Dashboard"
                    );
                }

                var buses =
                _busRepository.SearchBuses
                (
                    source,
                    destination
                );

                foreach (var bus in buses)
                {
                    bus.AvailableSeats =
                    _bookingRepository.GetAvailableSeats
                    (
                        bus.BusId,
                        journeyDate
                    );
                }

                ViewBag.JourneyDate =
                journeyDate;

                return View
                (
                    "SearchResults",
                    buses
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


        [HttpGet]
        public IActionResult SelectSeats
        (
            int busId,
            DateTime journeyDate
        )
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                if (journeyDate == DateTime.MinValue)
                {
                    TempData["Message"] =
                    "Invalid journey date.";

                    return RedirectToAction
                    (
                        "Dashboard"
                    );
                }

                var bus =
                _busRepository.GetBusById(busId);

                ViewBag.BookedSeats =
                _bookingRepository.GetBookedSeats
                (
                    busId,
                    journeyDate
                );

                ViewBag.JourneyDate =
                journeyDate;

                return View(bus);
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
        public IActionResult PassengerDetails
        (
            int busId,
            string seatNumbers,
            DateTime journeyDate
        )
        {
            if (!IsUserLoggedIn())
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
                    string.IsNullOrWhiteSpace
                    (
                        seatNumbers
                    )
                )
                {
                    TempData["Message"] =
                    "Please select at least one seat.";

                    return RedirectToAction
                    (
                        "SelectSeats",
                        new
                        {
                            busId = busId,
                            journeyDate = journeyDate
                        }
                    );
                }

                BookingViewModel model =
                new BookingViewModel
                {
                    BusId = busId,

                    SeatNumbers = seatNumbers,

                    JourneyDate = journeyDate
                };

                var seats =
                seatNumbers.Split(',');

                var bus =
                _busRepository.GetBusById(busId);

                model.TotalAmount =
                bus.FareAmount * seats.Length;

                foreach (var seat in seats)
                {
                    model.Passengers.Add
                    (
                        new Passenger
                        {
                            SeatNumber = seat
                        }
                    );
                }

                return View(model);
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
        public IActionResult ConfirmBooking
        (
            BookingViewModel model
        )
        {
            if (!IsUserLoggedIn())
            {
                return Json
                (
                    new
                    {
                        success = false,
                        message = "Please login again."
                    }
                );
            }

            try
            {
                int? userId =
                HttpContext.Session.GetInt32
                (
                    "UserId"
                );

                if (userId == null)
                {
                    return Json
                    (
                        new
                        {
                            success = false,
                            message = "Session expired."
                        }
                    );
                }

                var bus =
                _busRepository.GetBusById
                (
                    model.BusId
                );

                decimal totalAmount =
                bus.FareAmount *
                model.Passengers.Count;

                Booking booking =
                new Booking
                {
                    UserId = userId.Value,

                    BusId = model.BusId,

                    JourneyDate = model.JourneyDate,

                    SeatNumbers = model.SeatNumbers,

                    TotalAmount = totalAmount,

                    Email = model.Email,

                    Phone = model.Phone
                };

                int bookingId =
                _bookingRepository.BookSeats
                (
                    booking
                );

                if (bookingId > 0)
                {
                    _bookingRepository.SavePassengers
                    (
                        bookingId,
                        model.Passengers
                    );

                    return Json
                    (
                        new
                        {
                            success = true,
                            message = "Booking successful."
                        }
                    );
                }

                return Json
                (
                    new
                    {
                        success = false,
                        message = "Booking failed."
                    }
                );
            }

            catch (Exception ex)
            {
                return Json
                (
                    new
                    {
                        success = false,
                        message = ex.Message
                    }
                );
            }
        }


        [HttpGet]
        public IActionResult MyBookings()
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                int? userId =
                HttpContext.Session.GetInt32
                (
                    "UserId"
                );

                if (userId == null)
                {
                    return RedirectToAction
                    (
                        "SignIn",
                        "Account"
                    );
                }

                var bookings =
                _bookingRepository.GetBookingsByUserId
                (
                    userId.Value
                );

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
        public IActionResult PassengerList
        (
            int bookingId
        )
        {
            if (!IsUserLoggedIn())
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


        [HttpPost]
        public IActionResult CancelBooking
        (
            int bookingId
        )
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                bool cancelled =
                _bookingRepository.CancelBooking
                (
                    bookingId
                );

                if (cancelled)
                {
                    TempData["Message"] =
                    "Booking cancelled successfully.";
                }

                else
                {
                    TempData["Message"] =
                    "Cancellation failed.";
                }

                return RedirectToAction
                (
                    "MyBookings"
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


        [HttpGet]
        public IActionResult EditProfile()
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }

            try
            {
                int? userId =
                HttpContext.Session.GetInt32
                (
                    "UserId"
                );

                if (userId == null)
                {
                    return RedirectToAction
                    (
                        "SignIn",
                        "Account"
                    );
                }

                var user =
                _userRepository.GetUserById
                (
                    userId.Value
                );

                ViewBag.States =
                _stateRepository.GetStates();

                ViewBag.Cities =
                _stateRepository.GetCitiesByStateId
                (
                    user.StateId
                );

                return View(user);
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
        public IActionResult EditProfile
        (
        User user,
        IFormFile profilePhoto
        )
        {
            try
            {
                if (!IsUserLoggedIn())
                {
                    return RedirectToAction
                    (
                        "SignIn",
                        "Account"
                    );
                }
                int? userId =
                HttpContext.Session.GetInt32
                (
                    "UserId"
                );

                if (userId == null)
                {
                    return RedirectToAction
                    (
                        "SignIn",
                        "Account"
                    );
                }

                user.UserId =
                userId.Value;

                var existingUser =
                _userRepository.GetUserById
                (
                    user.UserId
                );

                user.Username =
                existingUser.Username;
                
                if (profilePhoto != null)
                {
                    string extension =
                    Path.GetExtension
                    (
                        profilePhoto.FileName
                    ).ToLower();

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
                        "Only JPG and PNG images are allowed.";

                        return RedirectToAction
                        (
                            "EditProfile"
                        );
                    }

                    string folder =
                    Path.Combine
                    (
                        Directory.GetCurrentDirectory(),
                        "wwwroot/images/profile"
                    );

                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }

                    string fileName =
                    Guid.NewGuid().ToString()
                    +
                    extension;

                    string filePath =
                    Path.Combine
                    (
                        folder,
                        fileName
                    );

                    using
                    (
                        var stream =
                        new FileStream
                        (
                            filePath,
                            FileMode.Create
                        )
                    )
                    {
                        profilePhoto.CopyTo(stream);
                    }

                    user.ProfileImage =
                    "/images/profile/"
                    + fileName;
                }
                else
                {
                    user.ProfileImage =
                    existingUser.ProfileImage;
                }

                bool updated =
                _userRepository.UpdateUserProfile
                (
                    user
                );

                if (updated)
                {
                    TempData["Message"] =
                    "Profile updated successfully.";
                }

                else
                {
                    TempData["Message"] =
                    "Profile update failed.";
                }

                return RedirectToAction
                (
                    "EditProfile"
                );
            }
            catch (IOException)
            {
                TempData["Message"] =
                "File upload failed.";

                return RedirectToAction
                (
                    "EditProfile"
                );
            }

            catch (UnauthorizedAccessException)
            {
                TempData["Message"] =
                "Access denied.";

                return RedirectToAction
                (
                    "EditProfile"
                );
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "EditProfile"
                );
            }
        }

        public IActionResult Ticket(int bookingId)
        {
            if (!IsUserLoggedIn())
            {
                return RedirectToAction
                (
                    "SignIn",
                    "Account"
                );
            }
            try
            {
                var ticket =
                    _bookingRepository
                    .GetTicketDetails(bookingId);

                if (ticket == null)
                {
                    TempData["Message"] =
                        "Ticket not found";

                    return RedirectToAction
                    (
                        "MyBookings"
                    );
                }

                return View(ticket);
            }

            catch (Exception ex)
            {
                TempData["Message"] =
                ex.Message;

                return RedirectToAction
                (
                    "MyBookings"
                );
            }
        }

        private bool IsUserLoggedIn()
        {
            return
            HttpContext.Session.GetString("Username")
            != null;
        }
    }
}
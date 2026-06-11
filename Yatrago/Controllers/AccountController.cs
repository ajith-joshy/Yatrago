using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using YatraGo.Interfaces;
using YatraGo.Repositories;
using YatraGo.Models;

namespace YatraGo.Controllers
{
    public class AccountController
        : Controller
    {
        private readonly
        IAdminRepository _adminRepository;

        private readonly
        IStateRepository _stateRepository;

        private readonly
        IUserRepository _userRepository;

        public AccountController
        (
            IAdminRepository adminRepository,
            IStateRepository stateRepository,
            IUserRepository userRepository
        )
        {
            _adminRepository = adminRepository;
            _stateRepository = stateRepository;
            _userRepository = userRepository;
        }


        [HttpGet]
        public IActionResult SignIn()
        {
            Response.Headers["Cache-Control"] =
            "no-cache, no-store, must-revalidate";

            Response.Headers["Pragma"] =
            "no-cache";

            Response.Headers["Expires"] =
            "0";

            List<RememberedLogin> rememberedUsers =
            new List<RememberedLogin>();

            string cookieData =
            Request.Cookies["RememberedUsers"];

            if (!string.IsNullOrEmpty(cookieData))
            {
                rememberedUsers =
                JsonSerializer.Deserialize
                <
                    List<RememberedLogin>
                >
                (
                    cookieData
                ) ?? new List<RememberedLogin>();
            }

            ViewBag.RememberedUsers =
            rememberedUsers;

            return View();
        }
        [HttpPost]
        public IActionResult SignIn
        (
            LoginViewModel model
        )
        {
            try
            {
                if
                (
                    string.IsNullOrWhiteSpace(model.Username)
                    ||
                    string.IsNullOrWhiteSpace(model.Password)
                )
                {
                    ViewBag.Message =
                    "Username and Password are required";

                    return View(model);
                }

                // ADMIN LOGIN

                var admin =
                _adminRepository.ValidateAdmin
                (
                    model.Username,
                    model.Password
                );

                if (admin != null)
                {
                    HttpContext.Session.SetInt32
                    (
                        "AdminId",
                        admin.AdminId
                    );

                    HttpContext.Session.SetString
                    (
                        "AdminUsername",
                        admin.Username
                    );
                    if (model.RememberMe)
                    {
                        SaveRememberedLogin
                        (
                            admin.Username,
                            "Admin"
                        );
                    }

                    return RedirectToAction
                    (
                        "Dashboard",
                        "Admin"
                    );
                }

                // USER LOGIN

                var user =
                _userRepository.ValidateUser
                (
                    model.Username,
                    model.Password
                );

                if (user != null)
                {
                    HttpContext.Session.SetInt32
                    (
                        "UserId",
                        user.UserId
                    );

                    HttpContext.Session.SetString
                    (
                        "Username",
                        user.Username
                    );
                    if (model.RememberMe)
                    {
                        SaveRememberedLogin
                        (
                            user.Username,
                            "User"
                        );
                    }
                    return RedirectToAction
                    (
                        "Dashboard",
                        "User"
                    );
                }

                ViewBag.Message =
                "Invalid Username or Password";

                return View(model);
            }

            catch (Exception)
            {
                ViewBag.Message =
                "Unable to process your request. Please try again later.";

                return View(model);
            }
        }


        [HttpGet]
        public IActionResult QuickLogin
        (
            string username,
            string role
        )
        {
            if
            (
                string.IsNullOrEmpty(username)
                ||
                string.IsNullOrEmpty(role)
            )
            {
                return RedirectToAction
                (
                    "SignIn"
                );
            }

            if (role == "Admin")
            {
                HttpContext.Session.SetString
                (
                    "AdminUsername",
                    username
                );

                return RedirectToAction
                (
                    "Dashboard",
                    "Admin"
                );
            }

            var user =
            _userRepository
            .GetUserByUsername
            (
                username
            );

            if (user != null)
            {
                HttpContext.Session.SetInt32
                (
                    "UserId",
                    user.UserId
                );

                HttpContext.Session.SetString
                (
                    "Username",
                    user.Username
                );

                return RedirectToAction
                (
                    "Dashboard",
                    "User"
                );
            }

            RemoveRememberedLogin(username);

            TempData["Message"] =
            "Quick login account no longer exists.";

            return RedirectToAction("SignIn");
        }


        private void SaveRememberedLogin
        (
            string username,
            string role
        )
        {
            List<RememberedLogin> rememberedUsers =
            new List<RememberedLogin>();

            string cookieData =
            Request.Cookies["RememberedUsers"];

            if (!string.IsNullOrEmpty(cookieData))
            {
                rememberedUsers =
                JsonSerializer.Deserialize
                <
                    List<RememberedLogin>
                >
                (
                    cookieData
                ) ?? new List<RememberedLogin>();
            }

            bool alreadyExists =
            rememberedUsers.Any
            (
                x => x.Username == username
            );

            if (!alreadyExists)
            {
                rememberedUsers.Add
                (
                    new RememberedLogin
                    {
                        Username = username,
                        Role = role,
                    }
                );
            }

            CookieOptions options =
            new CookieOptions
            {
                Expires =
                DateTime.Now.AddDays(30)
            };

            Response.Cookies.Append
            (
                "RememberedUsers",
                JsonSerializer.Serialize(rememberedUsers),
                options
            );
        }

        private void RemoveRememberedLogin
        (
            string username
        )
        {
            string cookieData =
            Request.Cookies["RememberedUsers"];

            if (!string.IsNullOrEmpty(cookieData))
            {
                var rememberedUsers =
                JsonSerializer.Deserialize
                <
                    List<RememberedLogin>
                >
                (
                    cookieData
                ) ?? new List<RememberedLogin>();

                rememberedUsers =
                rememberedUsers
                .Where
                (
                    x => x.Username != username
                )
                .ToList();

                Response.Cookies.Append
                (
                    "RememberedUsers",

                    JsonSerializer.Serialize
                    (
                        rememberedUsers
                    ),

                    new CookieOptions
                    {
                        Expires =
                        DateTime.Now.AddDays(30)
                    }
                );
            }
        }

        [HttpGet]
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignUp(User user)
        {
            try
            {
                _userRepository.RegisterUser(user);

                return RedirectToAction("SignIn");
            }

            catch (Exception ex)
            {
                if (ex.Message.Contains("UQ_Username"))
                {
                    ViewBag.Message =
                    "Username already exists";
                }

                else if (ex.Message.Contains("UQ_Email"))
                {
                    ViewBag.Message =
                    "Email already exists";
                }

                else if (ex.Message.Contains("UQ_Phone"))
                {
                    ViewBag.Message =
                    "Phone number already exists";
                }

                else
                {
                    ViewBag.Message =
                    "Registration failed. Please try again.";
                }

                return View(user);
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();

            return RedirectToAction
            (
                "SignIn",
                "Account"
            );
        }

        [HttpGet]
        public JsonResult GetStates()
        {
            try
            {
                var states =
                _stateRepository.GetStates();

                return Json(states);
            }
            catch (Exception)
            {
                return Json
                (
                    new
                    {
                        success = false,
                        message =
                        "Unable to process your request. Please try again later."
                    }
                );
            }
        }


        [HttpGet]
        public JsonResult GetCitiesByStateId
        (
            int stateId
        )
        {
            try
            {
                var cities =
                _stateRepository
                .GetCitiesByStateId(stateId);

                return Json(cities);
            }
            catch (Exception)
            {
                return Json
                (
                    new
                    {
                        success = false,
                        message =
                        "Unable to process your request. Please try again later."
                    }
                );
            }
        }

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ForgotPassword(string loginInput)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(loginInput))
                {
                    ViewBag.Message =
                    "Username is required";

                    return View();
                }

                var user =
                _userRepository
                .GetUserByUsername(loginInput);

                if (user == null)
                {
                    ViewBag.Message =
                    "Not a registered username";

                    return View();
                }

                return RedirectToAction
                (
                    "ResetPassword",
                    new
                    {
                        userId = user.UserId
                    }
                );
            }

            catch (Exception)
            {
                ViewBag.Message =
                "Something went wrong";

                return View();
            }
        }


        [HttpGet]
        public IActionResult ResetPassword
        (
            int userId
        )
        {
            ViewBag.UserId =
            userId;

            return View();
        }
        [HttpPost]
        public IActionResult ResetPassword
        (
            int userId,
            string newPassword,
            string confirmPassword
        )
        {
            try
            {
                if
                (
                    string.IsNullOrWhiteSpace(newPassword)
                    ||
                    string.IsNullOrWhiteSpace(confirmPassword)
                )
                {
                    ViewBag.UserId =
                    userId;

                    ViewBag.Message =
                    "All fields are required";

                    return View();
                }

                if (newPassword != confirmPassword)
                {
                    ViewBag.UserId =
                    userId;

                    ViewBag.Message =
                    "Passwords do not match";

                    return View();
                }

                bool updated =
                _userRepository
                .UpdatePassword
                (
                    userId,
                    newPassword
                );

                if (updated)
                {
                    var user =
                    _userRepository
                    .GetUserById(userId);

                    RemoveRememberedLogin
                    (
                        user.Username
                    );

                    TempData["Message"] =
                    "Password updated successfully";

                    return RedirectToAction
                    (
                        "SignIn"
                    );
                }

                ViewBag.UserId =
                userId;

                ViewBag.Message =
                "Password update failed";

                return View();
            }

            catch (Exception)
            {
                ViewBag.Message =
                "Something went wrong";

                return View();
            }
        }

        [HttpGet]
        public JsonResult RemoveRememberedUser
        (
            string username
        )
        {
            try
            {
                RemoveRememberedLogin
                (
                    username
                );

                return Json
                (
                    new
                    {
                        success = true
                    }
                );
            }

            catch
            {
                return Json
                (
                    new
                    {
                        success = false
                    }
                );
            }
        }
    }
}
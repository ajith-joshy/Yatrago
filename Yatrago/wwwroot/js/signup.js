// JavaScript source code
let firstName;
let lastName;
let address;
let username;
let dob;
let state;
let city;
let email;
let password;
let confirmPassword;
let phone;
let submitBtn;

window.addEventListener("load", function () {
    firstName = document.getElementById("firstName");
    lastName = document.getElementById("lastName");
    address = document.getElementById("address");
    username = document.getElementById("username");
    dob = document.getElementById("date");
    state = document.getElementById("state");
    city = document.getElementById("city");
    email = document.getElementById("email");
    password = document.getElementById("password");
    confirmPassword = document.getElementById("confirmPassword");
    phone = document.getElementById("phone");
    submitBtn = document.getElementById("submitBtn");
    loadStates();
});


async function loadStates() {
    let response = await fetch('/Account/GetStates');
    let data = await response.json();
    let state = document.getElementById("state");
    state.innerHTML = '<option value=\"\">Select State</option>';
    for (let i = 0; i < data.length; i++) {
        let option =
            document.createElement("option");

        option.value =
            data[i].stateId;

        option.text =
            data[i].stateName;

        state.appendChild(option);
    }
}

async function loadCities() {
    let stateId =
        document.getElementById("state").value;

    let response =
        await fetch
            (
                `/Account/GetCitiesByStateId?stateId=${stateId}`
            );

    let data =
        await response.json();

    let city =
        document.getElementById("city");

    city.innerHTML =
        '<option value=\"\">Select City</option>';

    for (let i = 0; i < data.length; i++) {
        let option =
            document.createElement("option");

        option.value =
            data[i].cityId;

        option.text =
            data[i].cityName;

        city.appendChild(option);
    }
}

function validateFirstName() {

    let firstName =
        document.getElementById("firstName")
            .value
            .trim();

    if (firstName === "") {
        showError(
            "firstName",
            "firstNameError",
            "First Name is required"
        );

        return false;
    }

    showSuccess(
        "firstName",
        "firstNameError"
    );

    return true;
}

function validateLastName() {

    let lastName =
        document.getElementById("lastName")
            .value
            .trim();

    if (lastName === "") {
        showError(
            "lastName",
            "lastNameError",
            "Last Name is required"
        );

        return false;
    }

    showSuccess(
        "lastName",
        "lastNameError"
    );

    return true;
}

function validateAddress() {

    let address =
        document.getElementById("address")
            .value
            .trim();

    if (address === "") {
        showError(
            "address",
            "addressError",
            "Address is required"
        );

        return false;
    }

    showSuccess(
        "address",
        "addressError"
    );

    return true;
}

async function validateUsername() {

    let username =
        document.getElementById("username")
            .value
            .trim();

    const usernamePattern =
        /^[A-Za-z0-9]+$/;

    if (username === "") {
        showError(
            "username",
            "usernameError",
            "Username is required"
        );

        return false;
    }

    if (username.length < 3) {
        showError(
            "username",
            "usernameError",
            "Username must contain at least 3 characters"
        );

        return false;
    }

    if (!usernamePattern.test(username)) {
        showError(
            "username",
            "usernameError",
            "Special characters are not allowed"
        );

        return false;
    }

    showSuccess(
        "username",
        "usernameError"
    );

    return true;
}
function validateDOB() {
    let dob = document.getElementById("date").value;
    if (dob === "") {
        showError("date", "DOBError", "Date of Birth is required");
        return false;
    }
    let birthDate = new Date(dob);
    let today = new Date();
    let age = today.getFullYear() - birthDate.getFullYear();
    let monthDifference = today.getMonth() - birthDate.getMonth();
    if (
        monthDifference < 0 ||
        (monthDifference === 0 && today.getDate() < birthDate.getDate())
    ) {
        age--;
    }
    if (age < 18) {
        showError("date", "DOBError", "You are a minor and cannot sign up");
        return false;
    }
    else {
        showSuccess("date", "DOBError");
        return true;
    }
}

function validateGender() {
    let gender = document.querySelector('input[name="Gender"]:checked');
    if (gender === null) {
        showError("genderContainer", "genderError", "Please select a gender");
        return false;
    }
    else {
        showSuccess("genderContainer", "genderError");
        return true;
    }
}

function validateState() {
    let state = document.getElementById("state").value;
    if (state === "") {
        showError("state", "stateError", "Please select a state");
        return false;
    }
    else {
        showSuccess("state", "stateError");
        return true;
    }
}

function validateCity() {
    let city = document.getElementById("city").value;
    if (city === "") {
        showError("city", "cityError", "Please select a city");
        return false;
    }
    else {
        showSuccess("city", "cityError");
        return true;
    }
}

async function validateEmail() {

    let email =
        document.getElementById("email")
            .value
            .trim();

    const emailPattern =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "") {
        showError(
            "email",
            "emailError",
            "Email is required"
        );

        return false;
    }

    if (!emailPattern.test(email)) {
        showError(
            "email",
            "emailError",
            "Enter a valid email"
        );

        return false;
    }

    showSuccess(
        "email",
        "emailError"
    );

    return true;
}

async function validatePhone() {

    let phone =
        document.getElementById("phone")
            .value
            .trim();

    const phonePattern =
        /^[0-9]{10}$/;

    if (phone === "") {
        showError(
            "phone",
            "phoneError",
            "Phone is required"
        );

        return false;
    }

    if (!phonePattern.test(phone)) {
        showError(
            "phone",
            "phoneError",
            "Enter a valid phone number"
        );

        return false;
    }

    showSuccess(
        "phone",
        "phoneError"
    );

    return true;
}

function validatePassword() {

    let password =
        document.getElementById("password")
            .value
            .trim();

    let strength =
        document.getElementById("passwordStrength");

    const strongPattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

    const mediumPattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/;

    if (password === "") {
        showError(
            "password",
            "passwordError",
            "Enter a valid password"
        );

        strength.innerText = "";

        return false;
    }

    else if (strongPattern.test(password)) {
        showSuccess(
            "password",
            "passwordError"
        );

        strength.innerText =
            "Strong Password";

        strength.style.color =
            "green";

        return true;
    }

    else if (mediumPattern.test(password)) {
        showError(
            "password",
            "passwordError",
            "Password should contain minimum 8 characters, atleast one capital letter, one small letter and a special character"
        );

        strength.innerText =
            "Medium Password";

        strength.style.color =
            "orange";

        return false;
    }

    else {
        showError(
            "password",
            "passwordError",
            "Password should contain minimum 8 characters, atleast one capital letter, one small letter and a special character"
        );

        strength.innerText =
            "Weak Password";

        strength.style.color =
            "red";

        return false;
    }
}

function enableConfirmPassword() {
    let password = document.getElementById("password").value.trim();
    let confirmPassword = document.getElementById("confirmPassword");
    if (password === "") {
        confirmPassword.disabled = true;
        confirmPassword.value = "";
        removeError(
            "confirmPassword",
            "confirmPasswordError"
        );
    }
    else {
        confirmPassword.disabled = false;
    }
}

function validateConfirmPassword() {
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    if (confirmPassword.trim() === "") {
        showError("confirmPassword", "confirmPasswordError", "Confirm Password is required");
        return false;
    }
    else if (confirmPassword !== password) {
        showError("confirmPassword", "confirmPasswordError", "Passwords do not match");
        return false;
    }
    else {
        showSuccess("confirmPassword", "confirmPasswordError");
        return true;
    }
}

function togglePassword(fieldId) {
    let field = document.getElementById(fieldId);
    if (field.type === "password") {
        field.type = "text";
    }
    else {
        field.type = "password";
    }
}

function validateTerms() {
    let terms = document.getElementById("terms").checked;
    if (!terms) {
        showError("termsContainer", "termsError", "Please accept Terms and Conditions");
        return false;
    }
    else {
        showSuccess("termsContainer", "termsError");
        return true;
    }
}

function showError(inputId, errorId, message) {

    let input =
        document.getElementById(inputId);

    input.classList.remove("valid");

    input.classList.add("invalid");

    document.getElementById(errorId)
        .innerText = message;
}

function showSuccess(inputId, errorId) {

    let input =
        document.getElementById(inputId);

    input.classList.remove("invalid");

    input.classList.add("valid");

    document.getElementById(errorId)
        .innerText = "";
}

function removeError(inputId, errorId) {
    let input =
        document.getElementById(inputId);

    input.classList.remove("invalid");

    input.classList.remove("valid");

    document.getElementById(errorId)
        .innerText = "";
}

async function checkFormValidity() {

    let isFirstNameValid =
        document.getElementById("firstName").value.trim() !== ""
            ? validateFirstName()
            : false;

    let isLastNameValid =
        document.getElementById("lastName").value.trim() !== ""
            ? validateLastName()
            : false;

    let isAddressValid =
        document.getElementById("address").value.trim() !== ""
            ? validateAddress()
            : false;

    let isUsernameValid =
        document.getElementById("username").value.trim() !== ""
            ? await validateUsername()
            : false;

    let isDOBValid =
        document.getElementById("date").value !== ""
            ? validateDOB()
            : false;

    let isGenderValid =
        document.querySelector('input[name="Gender"]:checked')
            ? validateGender()
            : false;

    let isStateValid =
        document.getElementById("state").value !== ""
            ? validateState()
            : false;

    let isCityValid =
        document.getElementById("city").value !== ""
            ? validateCity()
            : false;

    let isEmailValid =
        document.getElementById("email").value.trim() !== ""
            ? await validateEmail()
            : false;

    let isPasswordValid =
        document.getElementById("password").value.trim() !== ""
            ? validatePassword()
            : false;

    let isConfirmPasswordValid =
        document.getElementById("confirmPassword").value.trim() !== ""
            ? validateConfirmPassword()
            : false;

    let isPhoneValid =
        document.getElementById("phone").value.trim() !== ""
            ? await validatePhone()
            : false;

    let isTermsValid =
        document.getElementById("terms").checked ? validateTerms()
            : false;

    if (
        isFirstNameValid &&
        isLastNameValid &&
        isAddressValid &&
        isUsernameValid &&
        isDOBValid &&
        isGenderValid &&
        isStateValid &&
        isCityValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        isPhoneValid &&
        isTermsValid
    ) {
        submitBtn.disabled = false;
    }
    else {
        submitBtn.disabled = true;
    }
}

async function validateForm() {

    let isFirstNameValid =
        validateFirstName();

    let isLastNameValid =
        validateLastName();

    let isAddressValid =
        validateAddress();

    let isUsernameValid =
        await validateUsername();

    let isDOBValid =
        validateDOB();

    let isGenderValid =
        validateGender();

    let isStateValid =
        validateState();

    let isCityValid =
        validateCity();

    let isEmailValid =
        await validateEmail();

    let isPasswordValid =
        validatePassword();

    let isConfirmPasswordValid =
        validateConfirmPassword();

    let isPhoneValid =
        await validatePhone();

    let isTermsValid =
        validateTerms();

    if (
        isFirstNameValid &&
        isLastNameValid &&
        isAddressValid &&
        isUsernameValid &&
        isDOBValid &&
        isGenderValid &&
        isStateValid &&
        isCityValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        isPhoneValid &&
        isTermsValid
    ) {
        return true;
    }
    return false;
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            // FIRST NAME

            document.getElementById("firstName")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "firstName",
                                "firstNameError"
                            );
                        checkFormValidity();
                    }
                );

            // LAST NAME

            document.getElementById("lastName")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "lastName",
                                "lastNameError"
                            );
                        checkFormValidity();
                    }
                );

            // ADDRESS

            document.getElementById("address")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "address",
                                "addressError"
                            );
                        checkFormValidity();
                    }
                );

            // USERNAME

            document.getElementById("username")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "username",
                                "usernameError"
                            );
                        checkFormValidity();
                    }
                );

            // EMAIL

            document.getElementById("email")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "email",
                                "emailError"
                            );
                        checkFormValidity();
                    }
                );

            // PHONE

            document.getElementById("phone")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "phone",
                                "phoneError"
                            );
                        checkFormValidity();
                    }
                );

            // PASSWORD

            document.getElementById("password")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "password",
                                "passwordError"
                            );
                        checkFormValidity();
                    }
                );

            // CONFIRM PASSWORD

            document.getElementById("confirmPassword")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "confirmPassword",
                                "confirmPasswordError"
                            );
                        checkFormValidity();
                    }
                );
        }
    );
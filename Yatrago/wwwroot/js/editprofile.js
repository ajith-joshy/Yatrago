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


// FIRST NAME

function validateFirstName() {
    let firstName =
        document.getElementById("firstName")
            .value
            .trim();

    if (firstName === "") {
        showError
            (
                "firstName",
                "firstNameError",
                "First Name is required"
            );

        return false;
    }

    showSuccess
        (
            "firstName",
            "firstNameError"
        );

    return true;
}


// LAST NAME

function validateLastName() {
    let lastName =
        document.getElementById("lastName")
            .value
            .trim();

    if (lastName === "") {
        showError
            (
                "lastName",
                "lastNameError",
                "Last Name is required"
            );

        return false;
    }

    showSuccess
        (
            "lastName",
            "lastNameError"
        );

    return true;
}


// ADDRESS

function validateAddress() {
    let address =
        document.getElementById("address")
            .value
            .trim();

    if (address === "") {
        showError
            (
                "address",
                "addressError",
                "Address is required"
            );

        return false;
    }

    showSuccess
        (
            "address",
            "addressError"
        );

    return true;
}


// EMAIL

function validateEmail() {
    let email =
        document.getElementById("email")
            .value
            .trim();

    const emailPattern =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "") {
        showError
            (
                "email",
                "emailError",
                "Email is required"
            );

        return false;
    }

    if (!emailPattern.test(email)) {
        showError
            (
                "email",
                "emailError",
                "Enter a valid email"
            );

        return false;
    }

    showSuccess
        (
            "email",
            "emailError"
        );

    return true;
}


// PHONE

function validatePhone() {
    let phone =
        document.getElementById("phone")
            .value
            .trim();

    const phonePattern =
        /^[0-9]{10}$/;

    if (phone === "") {
        showError
            (
                "phone",
                "phoneError",
                "Phone is required"
            );

        return false;
    }

    if (!phonePattern.test(phone)) {
        showError
            (
                "phone",
                "phoneError",
                "Enter a valid phone number"
            );

        return false;
    }

    showSuccess
        (
            "phone",
            "phoneError"
        );

    return true;
}


// DOB

function validateDOB() {
    let dob =
        document.getElementById("date")
            .value;

    if (dob === "") {
        showError
            (
                "date",
                "DOBError",
                "Date of Birth is required"
            );

        return false;
    }

    let birthDate =
        new Date(dob);

    let today =
        new Date();

    let age =
        today.getFullYear()
        -
        birthDate.getFullYear();

    let monthDifference =
        today.getMonth()
        -
        birthDate.getMonth();

    if
        (
        monthDifference < 0
        ||
        (
            monthDifference === 0
            &&
            today.getDate() < birthDate.getDate()
        )
    ) {
        age--;
    }

    if (age < 18) {
        showError
            (
                "date",
                "DOBError",
                "Age must be above 18"
            );

        return false;
    }

    showSuccess
        (
            "date",
            "DOBError"
        );

    return true;
}


// GENDER

function validateGender() {
    let gender =
        document.getElementById("gender")
            .value;

    if (gender === "") {
        showError
            (
                "gender",
                "genderError",
                "Select gender"
            );

        return false;
    }

    showSuccess
        (
            "gender",
            "genderError"
        );

    return true;
}


// STATE

function validateState() {
    let state =
        document.getElementById("state")
            .value;

    if (state === "") {
        showError
            (
                "state",
                "stateError",
                "Select state"
            );

        return false;
    }

    showSuccess
        (
            "state",
            "stateError"
        );

    return true;
}


// CITY

function validateCity() {
    let city =
        document.getElementById("city")
            .value;

    if (city === "") {
        showError
            (
                "city",
                "cityError",
                "Select city"
            );

        return false;
    }

    showSuccess
        (
            "city",
            "cityError"
        );

    return true;
}


// FORM VALIDATION

function validateEditProfile() {
    let isFirstNameValid =
        validateFirstName();

    let isLastNameValid =
        validateLastName();

    let isAddressValid =
        validateAddress();

    let isDOBValid =
        validateDOB();

    let isGenderValid =
        validateGender();

    let isStateValid =
        validateState();

    let isCityValid =
        validateCity();

    let isEmailValid =
        validateEmail();

    let isPhoneValid =
        validatePhone();

    if
        (
        isFirstNameValid &&
        isLastNameValid &&
        isAddressValid &&
        isDOBValid &&
        isGenderValid &&
        isStateValid &&
        isCityValid &&
        isEmailValid &&
        isPhoneValid
    ) {
        return true;
    }

    return false;
}


// REMOVE ERROR DYNAMICALLY

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
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
                    }
                );

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
                    }
                );

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
                    }
                );

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
                    }
                );

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
                    }
                );

            document.getElementById("date")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "date",
                                "DOBError"
                            );
                    }
                );

            document.getElementById("gender")
                ?.addEventListener
                (
                    "change",

                    function () {
                        removeError
                            (
                                "gender",
                                "genderError"
                            );
                    }
                );

            document.getElementById("state")
                ?.addEventListener
                (
                    "change",

                    function () {
                        removeError
                            (
                                "state",
                                "stateError"
                            );
                    }
                );

            document.getElementById("city")
                ?.addEventListener
                (
                    "change",

                    function () {
                        removeError
                            (
                                "city",
                                "cityError"
                            );
                    }
                );
        }
    );
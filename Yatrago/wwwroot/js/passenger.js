function validatePassengerEmail() {
    let email =
        document.getElementById("Email")
            .value.trim();

    let pattern =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "") {
        showError(
            "Email",
            "emailError",
            "Email is required"
        );

        return false;
    }

    else if (!pattern.test(email)) {
        showError(
            "Email",
            "emailError",
            "Invalid email"
        );

        return false;
    }

    else {
        showSuccess(
            "Email",
            "emailError"
        );

        return true;
    }
}

function validatePassengerPhone() {
    let phone =
        document.getElementById("Phone")
            .value.trim();

    let pattern =
        /^[0-9]{10}$/;

    if (phone === "") {
        showError(
            "Phone",
            "phoneError",
            "Phone number is required"
        );

        return false;
    }

    else if (!pattern.test(phone)) {
        showError(
            "Phone",
            "phoneError",
            "Invalid phone number"
        );

        return false;
    }

    else {
        showSuccess(
            "Phone",
            "phoneError"
        );

        return true;
    }
}

function validatePassengerName(index) {
    let input =
        document.getElementById
            (
                "PassengerName_" + index
            );

    let value =
        input.value.trim();

    if (value === "") {
        showError(
            input.id,
            "passengerNameError_" + index,
            "Passenger name is required"
        );

        return false;
    }

    else {
        showSuccess(
            input.id,
            "passengerNameError_" + index
        );

        return true;
    }
}

function validatePassengerAge(index) {
    let input =
        document.getElementById
            (
                "PassengerAge_" + index
            );

    let age =
        input.value.trim();

    let pattern =
        /^[0-9]+$/;

    if (age === "") {
        showError(
            input.id,
            "passengerAgeError_" + index,
            "Passenger age is required"
        );

        return false;
    }

    else if (!pattern.test(age)) {
        showError(
            input.id,
            "passengerAgeError_" + index,
            "Age should contain only digits"
        );

        return false;
    }

    else {
        showSuccess(
            input.id,
            "passengerAgeError_" + index
        );

        return true;
    }
}

function validatePassengerGender(index) {
    let genders =
        document.getElementsByName
            (
                "Passengers[" + index + "].Gender"
            );

    let checked =
        false;

    for (let gender of genders) {
        if (gender.checked) {
            checked = true;
            break;
        }
    }

    if (!checked) {
        document.getElementById
            (
                "passengerGenderError_" + index
            ).innerText =
            "Select gender";

        return false;
    }

    else {
        document.getElementById
            (
                "passengerGenderError_" + index
            ).innerText = "";

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

    document.getElementById(errorId)
        .innerText = "";
}

function validatePassengerForm() {
    let isEmailValid =
        validatePassengerEmail();

    let isPhoneValid =
        validatePassengerPhone();

    let isPassengerValid =
        true;

    let passengerCount =
        document.querySelectorAll
            (
                ".passenger-card"
            ).length;

    for (let i = 0; i < passengerCount; i++) {
        let nameValid =
            validatePassengerName(i);

        let ageValid =
            validatePassengerAge(i);

        let genderValid =
            validatePassengerGender(i);

        if
            (
            !nameValid ||
            !ageValid ||
            !genderValid
        ) {
            isPassengerValid = false;
        }
    }

    return (
        isEmailValid &&
        isPhoneValid &&
        isPassengerValid
    );
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            // EMAIL

            document.getElementById("Email")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "Email",
                                "emailError"
                            );
                    }
                );

            // PHONE

            document.getElementById("Phone")
                ?.addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "Phone",
                                "phoneError"
                            );
                    }
                );

            // PASSENGERS

            let passengerCards =
                document.querySelectorAll
                    (
                        ".passenger-card"
                    );

            passengerCards.forEach
                (
                    function (card, index) {
                        // NAME

                        document.getElementById
                            (
                                "PassengerName_" + index
                            )

                            ?.addEventListener
                            (
                                "input",

                                function () {
                                    removeError
                                        (
                                            "PassengerName_" + index,
                                            "passengerNameError_" + index
                                        );
                                }
                            );

                        // AGE

                        document.getElementById
                            (
                                "PassengerAge_" + index
                            )

                            ?.addEventListener
                            (
                                "input",

                                function () {
                                    removeError
                                        (
                                            "PassengerAge_" + index,
                                            "passengerAgeError_" + index
                                        );
                                }
                            );
                    }
                );
        }
    );
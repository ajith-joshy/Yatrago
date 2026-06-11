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

function validatePassword() {
    let password =
        document.getElementById("password")
            .value
            .trim();

    let strength =
        document.getElementById
            (
                "passwordStrength"
            );

    const strongPattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

    const mediumPattern =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/;

    if (password === "") {
        showError
            (
                "password",
                "passwordError",
                "Enter a valid password"
            );

        strength.innerText = "";

        return false;
    }

    else if (strongPattern.test(password)) {
        showSuccess
            (
                "password",
                "passwordError"
            );

        strength.innerText = "Strong";
        strength.style.color = "#9ca3af";
        return true;
    }

    else if (mediumPattern.test(password)) {
        showError
            (
                "password",
                "passwordError",
                "Password should contain minimum 8 characters, atleast one capital letter, one small letter and a special character"
            );

        strength.innerText = "Medium";
        strength.style.color = "#9ca3af";

        return false;
    }

    else {
        showError
            (
                "password",
                "passwordError",
                "Password should contain minimum 8 characters, atleast one capital letter, one small letter and a special character"
            );

        strength.innerText = "Weak";
        strength.style.color = "#9ca3af";
        return false;
    }
}

function validateConfirmPassword() {
    let password =
        document.getElementById("password")
            .value;

    let confirmPassword =
        document.getElementById("confirmPassword")
            .value;

    if (confirmPassword.trim() === "") {
        showError
            (
                "confirmPassword",
                "confirmPasswordError",
                "Confirm Password is required"
            );

        return false;
    }

    else if (confirmPassword !== password) {
        showError
            (
                "confirmPassword",
                "confirmPasswordError",
                "Passwords do not match"
            );

        return false;
    }

    else {
        showSuccess
            (
                "confirmPassword",
                "confirmPasswordError"
            );

        return true;
    }
}

function togglePassword(fieldId) {
    let field =
        document.getElementById(fieldId);

    if (field.type === "password") {
        field.type = "text";
    }
    else {
        field.type = "password";
    }
}

function validateResetPassword() {
    let isPasswordValid =
        validatePassword();

    let isConfirmPasswordValid =
        validateConfirmPassword();

    return (
        isPasswordValid &&
        isConfirmPasswordValid
    );
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
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

                        validatePassword();
                    }
                );

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

                        validateConfirmPassword();
                    }
                );
        }
    );
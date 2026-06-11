function showError(inputId, errorId, message) {

    document.getElementById(inputId)
        .classList.add("invalid");

    document.getElementById(inputId)
        .classList.remove("valid");

    document.getElementById(errorId)
        .innerText = message;
}

function showSuccess(inputId, errorId) {

    document.getElementById(inputId)
        .classList.remove("invalid");

    document.getElementById(inputId)
        .classList.add("valid");

    document.getElementById(errorId)
        .innerText = "";
}

function removeError(inputId, errorId) {

    document.getElementById(errorId)
        .innerText = "";

    document.getElementById(inputId)
        .classList.remove("invalid");
}

function togglePassword() {
    let loginPassword = document.getElementById("loginPassword");
    if (loginPassword.type === "password") {
        loginPassword.type = "text";
    }
    else {
        loginPassword.type = "password";
    }
}
function validateLoginUser() {
    let loginUser = document.getElementById("loginUser").value.trim();
    if (loginUser === "") {
        showError(
            "loginUser",
            "loginUserError",
            "Username is required for login"
        );
        return false;
    }
    else {
        showSuccess(
            "loginUser",
            "loginUserError"
        );
        return true;
    }
}

function validateLoginPassword() {

    let loginPassword =
        document.getElementById
            (
                "loginPassword"
            ).value;

    if (loginPassword.trim() === "") {

        showError(
            "loginPassword",
            "loginPasswordError",
            "Password is required for login"
        );

        return false;
    }

    showSuccess(
        "loginPassword",
        "loginPasswordError"
    );

    return true;
}

function saveRememberedUser() {

    let rememberMe =
        document.getElementById("rememberMe");

    if (!rememberMe.checked) {
        return;
    }

    let username =
        document.getElementById("loginUser")
            .value.trim();

    if (username === "") {
        return;
    }

    let users =
        JSON.parse
            (
                localStorage.getItem
                    (
                        "rememberedUsers"
                    )
            ) || [];

    if (!users.includes(username)) {
        users.push(username);
    }

    localStorage.setItem
        (
            "rememberedUsers",
            JSON.stringify(users)
        );
}
function validateLogin() {
    let isUserValid = validateLoginUser();
    let isPasswordValid = validateLoginPassword();
    if
        (
        isUserValid &&
        isPasswordValid
    )
    {
        saveRememberedUser();
        return true;
    }
    return false;
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {

            let users =
                JSON.parse
                    (
                        localStorage.getItem
                            (
                                "rememberedUsers"
                            )
                    ) || [];

            let container =
                document.getElementById
                    (
                        "rememberedUsersContainer"
                    );

            users.forEach(user => {

                let userBox =
                    document.createElement("div");

                userBox.classList.add
                    (
                        "remembered-user"
                    );

                let userText =
                    document.createElement("span");

                userText.innerText = user;

                userText.addEventListener
                    (
                        "click",

                        function () {
                            document.getElementById
                                (
                                    "loginUser"
                                ).value = user;
                        }
                    );

                let deleteBtn =
                    document.createElement("span");

                deleteBtn.innerHTML = " ✖";

                deleteBtn.classList.add
                    (
                        "delete-user"
                    );

                deleteBtn.addEventListener
                    (
                        "click",
                        function (event) {
                            event.stopPropagation();

                            let updatedUsers =
                                users.filter
                                    (
                                        u => u !== user
                                    );

                            localStorage.setItem
                                (
                                    "rememberedUsers",
                                    JSON.stringify(updatedUsers)
                                );
                            userBox.remove();
                        }
                    );
                userBox.appendChild(userText);
                userBox.appendChild(deleteBtn);
                container.appendChild(userBox);
            });

            document.getElementById
                (
                    "loginUser"
                ).addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "loginUser",
                                "loginUserError"
                            );
                    }
                );

            document.getElementById
                (
                    "loginPassword"
                ).addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "loginPassword",
                                "loginPasswordError"
                            );
                    }
                );
        }
);

function quickLogin(select) {
    if (select.value !== "") {
        window.location.href =
            select.value;
    }
}

function removeQuickLogin(username) {
    fetch
        (
            '/Account/RemoveRememberedUser?username='
            + username
        )
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                location.reload();
            }
        });
}

function toggleQuickLoginDropdown() {
    document.getElementById
        (
            "quickLoginMenu"
        )
        .classList.toggle("show-dropdown");
}
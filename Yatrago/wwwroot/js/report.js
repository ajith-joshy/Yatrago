function showError(inputId, errorId, message) {
    document.getElementById
        (
            errorId
        ).innerText = message;

    document.getElementById
        (
            inputId
        ).style.borderColor = "red";
}

function removeError(inputId, errorId) {
    document.getElementById
        (
            errorId
        ).innerText = "";

    document.getElementById
        (
            inputId
        ).style.borderColor = "#ccc";
}

function validateDateWiseReport() {
    let date =
        document.getElementById
            (
                "journeyDate"
            );

    if (date.value === "") {
        showError
            (
                "journeyDate",
                "dateError",
                "Select a date"
            );

        return false;
    }

    return true;
}

function validateBusWiseReport() {
    let bus =
        document.getElementById
            (
                "busId"
            );

    if (bus.value === "") {
        showError
            (
                "busId",
                "busError",
                "Select a bus"
            );

        return false;
    }

    return true;
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            let dateInput =
                document.getElementById
                    (
                        "journeyDate"
                    );

            if (dateInput) {
                dateInput.addEventListener
                    (
                        "input",

                        function () {
                            removeError
                                (
                                    "journeyDate",
                                    "dateError"
                                );
                        }
                    );
            }

            let busSelect =
                document.getElementById
                    (
                        "busId"
                    );

            if (busSelect) {
                busSelect.addEventListener
                    (
                        "change",

                        function () {
                            removeError
                                (
                                    "busId",
                                    "busError"
                                );
                        }
                    );
            }
        }
    );
function showError(inputId, errorId, message) {
    let input =
        document.getElementById(inputId);

    input.classList.add("invalid");

    input.classList.remove("valid");

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

function validateField(id, errorId, message) {
    let value =
        document.getElementById(id)
            .value.trim();

    if (value === "") {
        showError(id, errorId, message);

        return false;
    }

    showSuccess(id, errorId);

    return true;
}

function validateSeats() {
    let seats =
        document.getElementById("totalSeats")
            .value.trim();

    if (seats === "") {
        showError
            (
                "totalSeats",
                "totalSeatsError",
                "Seats required"
            );

        return false;
    }

    if (isNaN(seats) || Number(seats) <= 0) {
        showError
            (
                "totalSeats",
                "totalSeatsError",
                "Enter valid seats"
            );

        return false;
    }

    showSuccess
        (
            "totalSeats",
            "totalSeatsError"
        );

    return true;
}

function validateFare() {
    let fare =
        document.getElementById("fareAmount")
            .value.trim();

    if (fare === "") {
        showError
            (
                "fareAmount",
                "fareAmountError",
                "Fare required"
            );

        return false;
    }

    if (isNaN(fare) || Number(fare) <= 0) {
        showError
            (
                "fareAmount",
                "fareAmountError",
                "Enter valid fare"
            );

        return false;
    }

    showSuccess
        (
            "fareAmount",
            "fareAmountError"
        );

    return true;
}

function viewBusImage(imagePath) {
    if
        (
        imagePath === "/"
        ||
        imagePath === ""
        ||
        imagePath == null
    ) {
        alert("No image uploaded for this bus.");

        return;
    }

    document.getElementById("imageModal")
        .style.display = "flex";

    document.getElementById("modalImage")
        .src = imagePath;
}
function closeImageModal() {
    document.getElementById("imageModal")
        .style.display = "none";
}

function validateBusForm() {
    let isValid = true;

    if
        (
        !validateField
            (
                "busName",
                "busNameError",
                "Bus name required"
            )
    ) {
        isValid = false;
    }

    if
        (
        !validateField
            (
                "busNumber",
                "busNumberError",
                "Bus number required"
            )
    ) {
        isValid = false;
    }

    if
        (
        !validateField
            (
                "busType",
                "busTypeError",
                "Select bus type"
            )
    ) {
        isValid = false;
    }

    if (!validateSeats()) {
        isValid = false;
    }

    if
        (
        !validateField
            (
                "routeId",
                "routeIdError",
                "Select route"
            )
    ) {
        isValid = false;
    }

    if
        (
        !validateField
            (
                "departureTime",
                "departureTimeError",
                "Departure time required"
            )
    ) {
        isValid = false;
    }

    if
        (
        !validateField
            (
                "arrivalTime",
                "arrivalTimeError",
                "Arrival time required"
            )
    ) {
        isValid = false;
    }

    if (!validateFare()) {
        isValid = false;
    }

    return isValid;
}


document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            const fields =
                [
                    {
                        id: "busName",
                        error: "busNameError",
                        event: "input"
                    },

                    {
                        id: "busNumber",
                        error: "busNumberError",
                        event: "input"
                    },

                    {
                        id: "busType",
                        error: "busTypeError",
                        event: "change"
                    },

                    {
                        id: "totalSeats",
                        error: "totalSeatsError",
                        event: "input"
                    },

                    {
                        id: "routeId",
                        error: "routeIdError",
                        event: "change"
                    },

                    {
                        id: "departureTime",
                        error: "departureTimeError",
                        event: "input"
                    },

                    {
                        id: "arrivalTime",
                        error: "arrivalTimeError",
                        event: "input"
                    },

                    {
                        id: "fareAmount",
                        error: "fareAmountError",
                        event: "input"
                    }
                ];

            fields.forEach
                (
                    function (field) {
                        let element =
                            document.getElementById(field.id);

                        if (element) {
                            element.addEventListener
                                (
                                    field.event,

                                    function () {
                                        removeError
                                            (
                                                field.id,
                                                field.error
                                            );
                                    }
                                );
                        }
                    }
                );
        }
    );
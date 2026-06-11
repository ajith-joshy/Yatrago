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
    document.getElementById(inputId)
        .classList.remove("invalid");

    document.getElementById(errorId)
        .innerText = "";
}

function validateSource() {
    let source =
        document.getElementById("source")
            .value.trim();

    if (source === "") {
        showError
            (
                "source",
                "sourceError",
                "Origin is required"
            );

        return false;
    }

    showSuccess
        (
            "source",
            "sourceError"
        );

    return true;
}

function validateDestination() {
    let source =
        document.getElementById("source")
            .value.trim()
            .toLowerCase();

    let destination =
        document.getElementById("destination")
            .value.trim()
            .toLowerCase();

    if (destination === "") {
        showError
            (
                "destination",
                "destinationError",
                "Destination is required"
            );

        return false;
    }

    if (source === destination) {
        showError
            (
                "destination",
                "destinationError",
                "Origin and Destination cannot be same"
            );

        return false;
    }

    showSuccess
        (
            "destination",
            "destinationError"
        );

    return true;
}

function validateDistance() {
    let distance =
        document.getElementById("distance")
            .value.trim();

    if (distance === "") {
        showError
            (
                "distance",
                "distanceError",
                "Distance is required"
            );

        return false;
    }

    if (isNaN(distance) || Number(distance) <= 0) {
        showError
            (
                "distance",
                "distanceError",
                "Enter valid distance"
            );

        return false;
    }

    showSuccess
        (
            "distance",
            "distanceError"
        );

    return true;
}

function validateRouteForm() {
    let isSourceValid =
        validateSource();

    let isDestinationValid =
        validateDestination();

    let isDistanceValid =
        validateDistance();

    return (
        isSourceValid &&
        isDestinationValid &&
        isDistanceValid
    );
}

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            ["source", "destination", "distance"]
                .forEach(function (field) {
                    document.getElementById(field)
                        ?.addEventListener
                        (
                            "input",

                            function () {
                                removeError
                                    (
                                        field,
                                        field + "Error"
                                    );
                            }
                        );
                });
        }
    );
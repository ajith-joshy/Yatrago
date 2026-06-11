function showError(id, inputId, message) {
    document.getElementById(id)
        .innerText = message;

    document.getElementById(inputId)
        .classList.add("invalid");
}

function removeError(id, inputId) {
    document.getElementById(id)
        .innerText = "";

    document.getElementById(inputId)
        .classList.remove("invalid");
}

function validateSearch() {
    let isValid = true;

    let source =
        document.getElementById
            (
                "source"
            ).value.trim();

    let destination =
        document.getElementById
            (
                "destination"
            ).value.trim();

    let journeyDate =
        document.getElementById
            (
                "journeyDate"
            ).value;

    // CLEAR OLD ERRORS

    removeError
        (
            "sourceError",
            "source"
        );

    removeError
        (
            "destinationError",
            "destination"
        );

    removeError
        (
            "dateError",
            "journeyDate"
        );

    // SOURCE

    if (source === "") {
        showError
            (
                "sourceError",
                "source",
                "Enter source"
            );

        isValid = false;
    }

    // DESTINATION

    if (destination === "") {
        showError
            (
                "destinationError",
                "destination",
                "Enter destination"
            );

        isValid = false;
    }

    // SAME SOURCE AND DESTINATION

    if
        (
        source !== ""
        &&
        destination !== ""
        &&
        source.toLowerCase().trim()
        ===
        destination.toLowerCase().trim()
    ) {
        showError
            (
                "destinationError",
                "destination",
                "Source and destination cannot be same"
            );

        isValid = false;
    }

    // DATE

    if (journeyDate === "") {
        showError
            (
                "dateError",
                "journeyDate",
                "Select journey date"
            );

        isValid = false;
    }

    else {
        let selectedDate =
            new Date(journeyDate);

        let today =
            new Date();

        today.setHours(0, 0, 0, 0);

        if (selectedDate < today) {
            showError
                (
                    "dateError",
                    "journeyDate",
                    "Select a future date"
                );

            isValid = false;
        }
    }

    return isValid;
}


// REMOVE ERROR DYNAMICALLY

document.addEventListener
    (
        "DOMContentLoaded",

        function () {
            document.getElementById
                (
                    "source"
                ).addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "sourceError",
                                "source"
                            );
                    }
                );

            document.getElementById
                (
                    "destination"
                ).addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "destinationError",
                                "destination"
                            );
                    }
                );

            document.getElementById
                (
                    "journeyDate"
                ).addEventListener
                (
                    "input",

                    function () {
                        removeError
                            (
                                "dateError",
                                "journeyDate"
                            );
                    }
                );
        }
    );
document.addEventListener("DOMContentLoaded", function () {
    document
        .querySelector(".dropdown-toggle")
        ?.addEventListener("click", function () {
            this.parentElement
                .classList.toggle("open");
        });

    document
        .querySelectorAll(".submenu > a")
        .forEach(function (menu) {
            menu.addEventListener("click", function () {
                this.parentElement
                    .classList.toggle("open");
            });
        });
});
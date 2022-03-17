// Usage: https://github.com/Grsmto/simplebar
import SimpleBar from "simplebar";

document.addEventListener("DOMContentLoaded", () => {
    const simpleBarElement = document.getElementsByClassName("js-simplebar")[0];
    if (simpleBarElement) {
        /* Initialize simplebar */
        const bar = new SimpleBar(simpleBarElement);

        const sidebarElement = document.getElementsByClassName("sidebar")[0];
        const sidebarToggleElement = document.getElementsByClassName("sidebar-toggle")[0];

        simpleBarElement.querySelectorAll('.collapse').forEach((el) => {

            el.addEventListener('shown.bs.collapse', () => bar.recalculate());
            el.addEventListener('hidden.bs.collapse', () => bar.recalculate());
        })

        sidebarToggleElement.addEventListener("click", () => {
            sidebarElement.classList.toggle("collapsed");

            sidebarElement.addEventListener("transitionend", () => {
                window.dispatchEvent(new Event("resize"));
            });
        });
    }

});
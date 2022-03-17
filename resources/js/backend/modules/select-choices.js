import Choices from "choices.js";

window.Choices = Choices;


document.addEventListener('DOMContentLoaded', () => {
    const tagSelects = document.querySelectorAll('.select-choices');


    tagSelects.forEach((el) => {
        new Choices(el, {
            removeItemButton: true
        });

    });


})

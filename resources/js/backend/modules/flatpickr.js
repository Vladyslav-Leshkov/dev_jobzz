// Usage: https://flatpickr.js.org/
import flatpickr from "flatpickr";

window.flatpickr = flatpickr;


const DatePickerComponent = function (){
    this.init = function (){
        const pickerElements = document.querySelectorAll('.date-picker-group');

        pickerElements.forEach((element)=>{
            const input = element.querySelector('.flatpicker');
            flatpickr(input, {
                wrap: true
            });
        });

    }
}

window.DatePickerComponent = DatePickerComponent;

document.addEventListener('DOMContentLoaded',  () =>{
    new DatePickerComponent().init();
});

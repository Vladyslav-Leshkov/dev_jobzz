import Swal from 'sweetalert2/src/sweetalert2.js';
window.Swal = Swal;


const FormOnSubmitMessage = function () {
    const selector = 'form[data-onsubmit-message]';

    this.init = function (){
        let formElements = document.querySelectorAll(selector);
        formElements.forEach( (formElement)=> {
            const button = formElement.querySelector('[type="submit"]');
            button.addEventListener('click', evt => {

                const message = formElement.dataset.onsubmitMessage || '';

                if(message){
                    evt.preventDefault();
                    const confirmText = formElement.dataset.confirmText || 'Да';
                    const cancelText = formElement.dataset.cancelText || 'Отмена';
                    const cancelButton = formElement.dataset.showCancelButton || true;
                    const icon = formElement.dataset.icon || 'warning';
                    Swal.fire({
                        text: message,
                        icon: icon,
                        showCancelButton: cancelButton,
                        confirmButtonText: confirmText,
                        cancelButtonText: cancelText
                    }).then((result) => {
                        if (result.value) {
                            formElement.submit();
                        }
                    })
                }

            });
        });
    }


}


window.FormOnSubmitMessage = FormOnSubmitMessage;


document.addEventListener('DOMContentLoaded',  () =>{
    new FormOnSubmitMessage().init();
});

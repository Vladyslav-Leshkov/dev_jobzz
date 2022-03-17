const ImageUploaderComponent = function (){


    this.init = function (){
        let uploaderElements = document.querySelectorAll('.image-uploader');

        uploaderElements.forEach(function (element) {
            const wrapper = element.closest('.uploader-wrapper');
            const imageElement = wrapper.querySelector('.img-thumbnail');
            const clearButton = wrapper.querySelector('.clear-image');
            const oldFileElement = wrapper.querySelector('.old-file');

            element.addEventListener('change', (evt)=>{
                if(evt.target.files && evt.target.files[0]){
                    const file = evt.target.files[0];
                    const reader = new FileReader();
                    reader.onload = (pe) => {
                        imageElement.setAttribute('src', pe.target.result);
                        clearButton.classList.remove('d-none');
                        clearButton.classList.add('d-block');
                        //console.log(pe.target.result);

                    }
                    reader.readAsDataURL(file);

                }

            });

            clearButton.addEventListener('click', (evt )=> {
                evt.preventDefault();
                element.value = '';
                oldFileElement.value = '';
                imageElement.setAttribute('src', '/img/no-image.png');
                clearButton.classList.remove('d-block');
                clearButton.classList.add('d-none');
            });

        })
    }
}

window.ImageUploaderComponent = ImageUploaderComponent;


document.addEventListener('DOMContentLoaded',  () =>{
    new ImageUploaderComponent().init();
});


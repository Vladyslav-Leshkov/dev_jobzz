
document.addEventListener('DOMContentLoaded', ()=>{
    const sidebarEl = document.querySelector('.sidebar-container');


    if(sidebarEl){
        const sidebarClose = document.querySelectorAll('.sidebar-close');

        const sidebarToggleEl = document.querySelectorAll('.sidebar-toggle');
        sidebarToggleEl.forEach((el)=>{
            el.classList.remove('d-none');

            el.addEventListener('click', (evt => {
                evt.preventDefault();
                sidebarEl.classList.toggle('open');
            }))
        });



        sidebarClose.forEach( (el)=>{
            el.addEventListener('click', (evt => {
                evt.preventDefault();
                sidebarEl.classList.remove('open');
            }))
        });
    }

    const scrollTopEl = document.querySelector('.scroll-to-top');
    if (scrollTopEl) {
        scrollTopEl.addEventListener('click', (evt => {
            evt.preventDefault();
            window.scrollTo({top: 0, behavior: 'smooth'});
        }))
    }


    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));

    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
})

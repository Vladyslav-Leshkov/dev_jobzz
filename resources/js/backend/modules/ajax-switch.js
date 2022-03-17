
const AjaxSwitch = function (wrapper){
    const checkboxEl = wrapper.querySelector('.form-check-input');
    const updateUrl = wrapper.dataset.url;
    const updateProperty = wrapper.dataset.property;

    checkboxEl.addEventListener('change', async (evt)=> {

        const checked = evt.target.checked;
        checkboxEl.disabled = true;
        const data = {};
        data[updateProperty] = checked ? 1 : 0;

        await axios.patch(updateUrl, data);
        checkboxEl.disabled = false;
        toast.success('Запись обновлена');
    })
}


document.addEventListener('DOMContentLoaded',  () =>{
    const switches = document.querySelectorAll('.ajax-switch');
    switches.forEach((el)=>{
        new AjaxSwitch(el);
    })
});

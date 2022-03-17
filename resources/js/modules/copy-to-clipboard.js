import {toast} from './toast';

export const copyToClipboard = str => {
    const el = document.createElement('textarea');
    el.value = str;
    el.setAttribute('readonly', '');
    el.style.position = 'absolute';
    el.style.left = '-9999px';
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
};

window.copyToClipboard = copyToClipboard;


document.addEventListener('DOMContentLoaded', ()=>{
    const clipElements = document.querySelectorAll('[data-clip-copy]');
    clipElements.forEach( (elem)=>{
        elem.addEventListener('click', (evt)=>{
            evt.preventDefault();
            const text = elem.dataset.clipCopy;
            copyToClipboard(text);
            toast.success('Скопировано!');
        })
    })
});

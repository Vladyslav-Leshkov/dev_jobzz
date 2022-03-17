window._ = require('lodash');

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

import Echo from 'laravel-echo';

window.Pusher = require('pusher-js');
//console.log(process.env.MIX_PUSHER_HOST +':'+process.env.MIX_PUSHER_PORT);
console.log(process.env.MIX_PUSHER_DRIVER);
if(process.env.MIX_PUSHER_DRIVER === 'pusher-local'){
    window.Echo = new Echo({
        broadcaster: 'pusher',
        key: process.env.MIX_PUSHER_APP_KEY,
        cluster: process.env.MIX_PUSHER_APP_CLUSTER,
        forceTLS: false,
        disableStats: true,
        wsHost:process.env.MIX_PUSHER_HOST,
        wsPort: process.env.MIX_PUSHER_PORT,
        wssHost:process.env.MIX_PUSHER_HOST,
        wssPort: process.env.MIX_PUSHER_PORT,
    });
}else{
    window.Echo = new Echo({
        broadcaster: 'pusher',
        key: process.env.MIX_PUSHER_APP_KEY,
        cluster: process.env.MIX_PUSHER_APP_CLUSTER,
        forceTLS: true
    });
}





const bootstrap = window.bootstrap || require('bootstrap');

try {
    document.addEventListener('DOMContentLoaded', function (){
        Array.from(document.querySelectorAll('.toast'))
            .forEach(node => {
                const toast = new bootstrap.Toast(node);
                toast.show();
                node.addEventListener('hidden.bs.toast', (evt) =>{
                    node.remove();
                });
            });
    });

}catch (e){
    console.log(e);
}

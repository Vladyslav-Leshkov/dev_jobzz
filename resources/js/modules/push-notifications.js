var isPushEnabled = false;
var isPushGranted = false;
const axios = window.axios;

window.addEventListener('load', function () {
    const btn = document.getElementById('pus-subscribe-btn');


    // if (isPushEnabled && !pushNotificationsEnabled) {
    //     push_unsubscribe();
    // }
    if (btn) {
        btn.addEventListener('click', function (evt) {
            evt.preventDefault();
            if (!isPushEnabled) {
                Notification.requestPermission().then(permission => {
                    if (permission === "granted") {
                        push_subscribe();
                    }
                });
            } else {
                push_unsubscribe();
            }
        })
    }
    if (pushNotificationsEnabled && !isPushEnabled) {
        Notification.requestPermission().then(permission => {
            if (permission === "granted") {
                push_subscribe();
            }
        });
    }

    //
    //
    // if ('serviceWorker' in navigator) {
    //     navigator.serviceWorker.register(window.swPath)
    //         .then(function (sw) {
    //             console.log('[SW] Service worker enregistré');
    //             push_initialiseState();
    //             initPostMessageListener();
    //         }, function (e) {
    //             console.error('[SW] Oups...', e);
    //             changePushButtonState('incompatible');
    //
    //         });
    // } else {
    //     console.warn('[SW] Les service workers ne sont pas encore supportés par ce navigateur.');
    //     changePushButtonState('incompatible');
    // }
});

function changePushButtonState(state) {
    const btn = document.getElementById('pus-subscribe-btn');
    switch (state) {
        case 'blocked':
            isPushEnabled = false;
            if (btn) {
                btn.innerText = 'Уведомления заблокированы на этом устройстве';

                btn.classList.remove('btn-outline-primary');
                btn.classList.add('disabled');
                btn.classList.add('btn-outline-danger');
                btn.classList.remove('d-none');
            }
            break;
        case 'incompatible':
            isPushEnabled = false;
            if (btn) {
                btn.innerText = 'Уведомления не поддерживаются этим устройством';
                btn.classList.remove('btn-outline-primary');
                btn.classList.add('disabled');
                btn.classList.add('btn-outline-danger');
                btn.classList.remove('d-none');
            }
            break;
        case 'disabled':
            isPushEnabled = false;
            if (btn) {
                btn.innerText = 'Подписаться на уведомления на этом устройстве';
                btn.classList.remove('disabled');
                btn.classList.remove('d-none');
            }
            break;

        case 'enabled':
            isPushEnabled = true;
            if (btn) {
                btn.innerText = 'Отписаться от уведомлений на этом устройстве';
                btn.classList.remove('disabled');
                btn.classList.remove('d-none');
            }
            break;
        case 'computing':
            isPushEnabled = false;
            if (btn) {
                btn.innerText = 'Подождите...';
                btn.classList.add('disabled');
            }
            break;
        default:
            console.log(state);

            break;
    }
}

function initPostMessageListener() {
    const onRefreshNotifications = function () {

    };

    const onRemoveNotifications = function () {

    };

    navigator.serviceWorker.addEventListener('message', function (e) {
        var message = e.data;

        switch (message) {
            case 'reload':
                window.location.reload(true);
                break;
            case 'refreshNotifications':
                onRefreshNotifications();
                break;
            case 'removeNotifications':
                onRemoveNotifications();
                break;
            default:
                console.warn("Message '" + message + "' not handled.");
                break;
        }
    });
}


function push_initialiseState() {
    // Are Notifications supported in the service worker?
    if (!('showNotification' in ServiceWorkerRegistration.prototype)) {
        console.warn('[SW] Уведомления не поддерживаются этим браузером.');
        changePushButtonState('incompatible');
        return;
    }

    // Check the current Notification permission.
    // If its denied, it's a permanent block until the
    // user changes the permission
    if (Notification.permission === 'denied') {
        console.warn('[SW] Уведомления не авторизованы пользователем.');
        isPushGranted = false;
        changePushButtonState('blocked');
        return;
    } else {
        isPushGranted = true;
    }

    // Check if push messaging is supported
    if (!('PushManager' in window)) {
        console.warn('[SW] Push-сообщения не поддерживаются этим браузером.');
        changePushButtonState('incompatible');
        return;
    }

    // We need the service worker registration to check for a subscription
    navigator.serviceWorker.ready.then(function (serviceWorkerRegistration) {
        // Do we already have a push message subscription?
        serviceWorkerRegistration.pushManager.getSubscription()
            .then(function (subscription) {
                // Enable any UI which subscribes / unsubscribes from
                // push messages.
                changePushButtonState('disabled');

                if (!subscription) {
                    // We aren't subscribed to push, so set UI
                    // to allow the user to enable push
                    return;
                }

                // Keep your server in sync with the latest endpoint
                push_sendSubscriptionToServer(subscription, 'update');

                // Set your UI to show they have subscribed for push messages
                changePushButtonState('enabled');
            })
            ['catch'](function (err) {
            console.warn('[SW] Ошибка во время getSubscription()', err);
        });
    });
}


function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding)
        .replace(/\-/g, '+')
        .replace(/_/g, '/');

    const rawData = window.atob(base64);
    const outputArray = new Uint8Array(rawData.length);

    for (var i = 0; i < rawData.length; ++i) {
        outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
}


function push_subscribe() {
    // Disable the button so it can't be changed while
    // we process the permission request
    changePushButtonState('computing');

    navigator.serviceWorker.ready.then(function (serviceWorkerRegistration) {
        serviceWorkerRegistration.pushManager.subscribe({
                userVisibleOnly: true,
                applicationServerKey: urlBase64ToUint8Array(vapidPublicKey)
            })
            .then(function (subscription) {
                // The subscription was successful
                changePushButtonState('enabled');

                // on a la subscription, il faut l'enregistrer en BDD
                return push_sendSubscriptionToServer(subscription, 'create');
            })
            ['catch'](function (e) {
            if (Notification.permission === 'denied') {
                // The user denied the notification permission which
                // means we failed to subscribe and the user will need
                // to manually change the notification permission to
                // subscribe to push messages
                console.warn('[SW] Уведомления не авторизованы пользователем.');
                changePushButtonState('blocked');
            } else {
                // A problem occurred with the subscription; common reasons
                // include network errors, and lacking gcm_sender_id and/or
                // gcm_user_visible_only in the manifest.
                console.error('[SW] Невозможно подписаться на уведомления.', e);
                changePushButtonState('disabled');
            }
        });
    });
}

function push_unsubscribe() {
    changePushButtonState('computing');

    navigator.serviceWorker.ready.then(function (serviceWorkerRegistration) {
        // To unsubscribe from push messaging, you need get the
        // subscription object, which you can call unsubscribe() on.
        serviceWorkerRegistration.pushManager.getSubscription().then(
            function (pushSubscription) {
                // Check we have a subscription to unsubscribe
                if (!pushSubscription) {
                    // No subscription object, so set the state
                    // to allow the user to subscribe to push
                    changePushButtonState('disabled');
                    return;
                }

                push_sendSubscriptionToServer(pushSubscription, 'delete');

                // We have a subscription, so call unsubscribe on it
                pushSubscription.unsubscribe().then(function (successful) {
                    changePushButtonState('disabled');
                })['catch'](function (e) {
                    // We failed to unsubscribe, this can lead to
                    // an unusual state, so may be best to remove
                    // the users data from your data store and
                    // inform the user that you have done so

                    console.log('[SW] Ошибка отказа от подписки на уведомления: ', e);
                    changePushButtonState('disabled');
                });
            })['catch'](function (e) {
            console.error('[SW] Ошибка отписки от уведомлений.', e);
        });
    });
}

function push_sendSubscriptionToServer(subscription, action) {
    var req = new XMLHttpRequest();
    var url = '/api/notifications/subscribe';
    req.open('POST', url, true);
    var csrfToken = document.head.querySelector('meta[name="csrf-token"]');

    req.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    req.setRequestHeader("Content-type", "application/json");
    req.setRequestHeader("X-CSRF-TOKEN", csrfToken.content || '');
    req.onreadystatechange = function (e) {
        if (req.readyState == 4) {
            if (req.status != 200) {
                console.error("[SW] Ошибка :" + e.target.status);
            }
        }
    };
    req.onerror = function (e) {
        console.error("[SW] Ошибка :" + e.target.status);
    };

    var key = subscription.getKey('p256dh');
    var token = subscription.getKey('auth');

    req.send(JSON.stringify({
        'action': action,
        'endpoint': getEndpoint(subscription),
        'key': key ? btoa(String.fromCharCode.apply(null, new Uint8Array(key))) : null,
        'token': token ? btoa(String.fromCharCode.apply(null, new Uint8Array(token))) : null
    }));

    return true;
}

function getEndpoint(pushSubscription) {
    var endpoint = pushSubscription.endpoint;
    var subscriptionId = pushSubscription.subscriptionId;

    // fix Chrome < 45
    if (subscriptionId && endpoint.indexOf(subscriptionId) === -1) {
        endpoint += '/' + subscriptionId;
    }

    return endpoint;
}
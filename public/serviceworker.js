var staticCacheName = "pwa-v" + new Date().getTime();
var filesToCache = [
    '/offline',
    '/css/app.css',
    '/js/vendor.js',
    '/js/app.js',
    '/images/favicon.png',
    '/images/logo.png',
    '/images/icons/icon-72x72.png',
    '/images/icons/icon-96x96.png',
    '/images/icons/icon-128x128.png',
    '/images/icons/icon-144x144.png',
    '/images/icons/icon-152x152.png',
    '/images/icons/icon-192x192.png',
    '/images/icons/icon-384x384.png',
    '/images/icons/icon-512x512.png',
];

// Cache on install
self.addEventListener("install", event => {
    this.skipWaiting();
    event.waitUntil(
        caches.open(staticCacheName)
            .then(cache => {
                return cache.addAll(filesToCache);
            })
    )
});

// Clear cache on activate
self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames
                    .filter(cacheName => (cacheName.startsWith("pwa-")))
                    .filter(cacheName => (cacheName !== staticCacheName))
                    .map(cacheName => caches.delete(cacheName))
            );
        })
    );
});

// Serve from Cache
self.addEventListener("fetch", event => {
    if (event.request.url.match('^.*(\/api\/).*$') ||
        event.request.url.match('^.*(\/auth\/).*$') ||
        event.request.url.match('^.*(\/candidates\/).*$') ||
        event.request.url.match('^.*(\/profile\/).*$') ||
        event.request.url.match('^.*(\/messenger\/).*$') ||
        event.request.url.match('^.*(\/vacancies\/).*$')) {
        return false;
    }
    event.respondWith(
        caches.match(event.request)
            .then(response => {
                return response || fetch(event.request);
            })
            .catch(() => {
                return caches.match('offline');
            })
    )
});

var sendNotification = function (message) {
    // on actualise la page des notifications ou/et le compteur de notifications
    self.refreshNotifications();

    console.log(message);

    var title = message.title || "Jobzz",
        icon = message.icon || '/images/icons/icon-192x192.png',
        body = message.body || 'Новое сообщение!',
        tag = message.tag || 'general',
        actions = message.actions || [];

    var options = {
        body: body,
        icon: icon,
        tag: tag,
        vibrate: [200, 100, 200]
    };

    if (actions.length) {
        options.actions = actions;
    }
    return self.registration.showNotification(title, options);

};


self.addEventListener('push', function (event) {

    if (!(self.Notification && self.Notification.permission === 'granted')) {
        console.warn('[SW] Уведомления не авторизованы пользователем.');
        return;
    }


    if (event.data) {
        try {
            const data = event.data.json();
            event.waitUntil(
                sendNotification(data)
            );
        } catch (e) {
            console.log(e);
        }

    } else {
        event.waitUntil(
            self.registration.pushManager.getSubscription().then(function (subscription) {
                if (!subscription) {
                    return;
                }

                return fetch('/api/notifications/last?endpoint=' + encodeURIComponent(subscription.endpoint)).then(function (response) {
                    if (response.status !== 200) {
                        throw new Error();
                    }

                    // Examine the text in the response
                    return response.json().then(function (data) {
                        if (data.error || !data.notification) {
                            throw new Error();
                        }

                        return sendNotification(data.notification.message);
                    });
                }).catch(function () {
                    return sendNotification();
                });
            })
        );
    }
});

self.refreshNotifications = function (clientList) {
    if (clientList == undefined) {
        clients.matchAll({type: "window"}).then(function (clientList) {
            self.refreshNotifications(clientList);
        });
    } else {
        for (var i = 0; i < clientList.length; i++) {
            var client = clientList[i];
            if (client.url.search(/messenger/i) >= 0) {
                // si la page des notifications est ouverte on la recharge
                client.postMessage('reload');
            }

            // si on n'est pas sur la page des notifications on recharge le compteur
            client.postMessage('refreshNotifications');
        }
    }
};

self.addEventListener('notificationclick', function (event) {
    // fix http://crbug.com/463146
    event.notification.close();

    event.waitUntil(
        clients.matchAll({
                type: "window"
            })
            .then(function (clientList) {
                // si la page des notifications est ouverte on l'affiche en priorité
                for (var i = 0; i < clientList.length; i++) {
                    var client = clientList[i];
                    if (client.url.search(/messenger/i) >= 0 && 'focus' in client) {
                        return client.focus();
                    }
                }

                // sinon s'il y a quand même une page du site ouverte on l'affiche
                if (clientList.length && 'focus' in client) {
                    return client.focus();
                }

                // sinon on ouvre la page des notifications
                if (clients.openWindow) {
                    return clients.openWindow('/messenger');
                }
            })
    );
});

self.addEventListener('message', function (event) {
    var message = event.data;
    console.log(event.data);
    switch (message) {
        case 'dispatchRemoveNotifications':
            clients.matchAll({type: "window"}).then(function (clientList) {
                for (var i = 0; i < clientList.length; i++) {
                    clientList[i].postMessage('removeNotifications');
                }
            });
            break;
        default:
            console.warn("Message '" + message + "' not handled.");
            break;
    }
});
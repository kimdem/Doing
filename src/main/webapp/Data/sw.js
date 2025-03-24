self.addEventListener('push', function(event) {
    let data = {};
    if (event.data) {
        data = event.data.json();
    }
    const title = data.title || "알림";
    const options = {
        body: data.body || "프로젝트 데드라인이 다가오고 있습니다.",
        icon: '/Data/Icon/notification-icon.png'
    };
    event.waitUntil(
        self.registration.showNotification(title, options)
    );
});

self.addEventListener('notificationclick', function(event) {
    event.notification.close();
    event.waitUntil(
        clients.openWindow('/Cal.jsp')
    );
});

import { initializeApp } from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-app.js';
import { getMessaging, onMessage, getToken } from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-messaging.js';

const firebaseConfig = {
  apiKey: "AIzaSyCUz2oNdshGZKmWKDn-lH5lyjpdFKo_5Lc",
  authDomain: "do-ing-e07b6.firebaseapp.com",
  projectId: "do-ing-e07b6",
  storageBucket: "do-ing-e07b6.firebasestorage.app",
  messagingSenderId: "650461761662",
  appId: "1:650461761662:web:813ec734f94e9f3a11882f"
};

const app = initializeApp(firebaseConfig);
const messaging = getMessaging(app);
const vapidKey = 'BFREf4Ot5tQlr7CD-w6dzys1hd9UPEKpr-GdYnIR10KQIYLnAxau9CG_aUEaDiTi5SqoTz7e2QGsqio1UljcaQc';

onMessage(messaging, (payload) => {
  console.log('Message received in foreground:', payload);

  const notificationTitle = payload.notification?.title || 'Default Title';
  const notificationOptions = {
    body: payload.notification?.body || 'Default Body',
    icon: payload.notification?.icon || '/icon.png',
  };

  new Notification(notificationTitle, notificationOptions);
});

if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/Project_Doing/firebase-messaging-sw.js')
    .then((registration) => {
      console.log('Service Worker registered with scope:', registration.scope);

      return getToken(messaging, {
        vapidKey: vapidKey,
        serviceWorkerRegistration: registration,
      });
    })
    .then((currentToken) => {
      if (currentToken) {
        console.log('FCM Token:', currentToken);

        sendTokenToServer(currentToken);
      } else {
        console.log('No registration token available.');
      }
    })
    .catch((error) => {
      console.error('An error occurred while retrieving token:', error);
    });
} else {
  console.error('Service Worker is not supported in this browser.');
}

function sendTokenToServer(token) {
  fetch('http://localhost:3000/save-token', { 
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ token }),
  })
    .then((response) => response.json())
    .then((data) => console.log('Token saved on server:', data))
    .catch((error) => console.error('Error sending token to server:', error));
}


document.getElementById('sendNotificationButton').addEventListener('click', () => {
  fetch('http://localhost:3000/send-notification', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      title: 'DO-ING!',
      body: '포그라운드 푸시 알림입니다.',
    }),
  })
    .then((response) => response.json())
    .then((data) => console.log('Notification sent:', data))
    .catch((error) => console.error('Error sending notification:', error));
});

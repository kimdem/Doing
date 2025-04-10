importScripts('https://www.gstatic.com/firebasejs/10.13.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.13.2/firebase-messaging-compat.js');


firebase.initializeApp({
	apiKey: "AIzaSyCUz2oNdshGZKmWKDn-lH5lyjpdFKo_5Lc",
	authDomain: "do-ing-e07b6.firebaseapp.com",
	projectId: "do-ing-e07b6",
	storageBucket: "do-ing-e07b6.firebasestorage.app",
	messagingSenderId: "650461761662",
	appId: "1:650461761662:web:813ec734f94e9f3a11882f"
});


const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
  console.log('[firebase-messaging-sw.js] Received background message:', payload);

  const notificationTitle = payload.notification?.title || 'Default Title';
  const notificationOptions = {
    body: payload.notification?.body || 'Default Body',
    icon: payload.notification?.icon || '/icon.png',
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});


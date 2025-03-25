const publicVapidKey = 'BH3N33Mrgg29RbdObMPT3kYNwc2nBWaFHpdYEXYSD4vcr4ejknlvE2dpvxQbsGkjlAAtxkW5VnnyOmSwZKiDVyQ';

// 알림 권한 요청 및 푸시 구독 처리
async function requestNotificationPermission() {
    const permission = await Notification.requestPermission();
    if (permission === 'granted') {
		alert("알림 허용");
        console.log('알림 권한이 허용되었습니다.');
        await subscribeUserToPush(); // 권한이 허용되면 푸시 구독 처리
    } else {
		alert("알림이 차단되었습니다.");
        console.error('알림 권한이 거부되었습니다.');
    }
}

// 사용자 푸시 구독 처리
async function subscribeUserToPush() {
    const registration = await navigator.serviceWorker.ready;

    const subscribeOptions = {
        userVisibleOnly: true,
        applicationServerKey: urlBase64ToUint8Array(publicVapidKey), // VAPID 공개 키 사용
    };

    const pushSubscription = await registration.pushManager.subscribe(subscribeOptions);
    console.log('푸시 구독 성공:', JSON.stringify(pushSubscription));

    // 서버에 구독 정보 전송
    await fetch('http://localhost:3000/subscribe', { // Node.js 서버의 /subscribe 엔드포인트
        method: 'POST',
        body: JSON.stringify(pushSubscription),
        headers: { 'Content-Type': 'application/json' },
    });

    alert('푸시 알림 구독이 완료되었습니다!');
}

// VAPID 키 변환 함수
function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding).replace(/-/g, '+').replace(/_/g, '/');
    const rawData = window.atob(base64);
    return new Uint8Array([...rawData].map((char) => char.charCodeAt(0)));
}

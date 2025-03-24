function sendTestNotification() {
    // 서비스 워커가 등록되었는지 확인
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.getRegistration().then(function(reg) {
            if (reg) {
                // 푸시 알림을 표시
                reg.showNotification("테스트 알림", {
                    body: "이것은 푸시 알림 테스트입니다!",
                    icon: '/Data/Icon/notification-icon.png',
                    badge: '/Data/Icon/badge-icon.png'
                });
            } else {
                console.error("서비스 워커 등록 안됨!");
            }
        }).catch(function(error) {
            console.error("서비스 워커 등록 실패:", error);
        });
    } else {
        console.log("서비스 워커를 지원하지 않는 브라우저입니다.");
    }
}

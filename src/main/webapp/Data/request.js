function requestN() {
	if (!("Notification" in window)) {
	            alert("데스크톱 알림을 지원하지 않는 브라우저입니다.");
	        }
			Notification.requestPermission().then(function (permission) {
                if (permission === "granted") {
                    alert("알림이 허용되었습니다.");
                } else if(permission === "denied") {
                    alert("알림이 거부되었습니다. 브라우저 설정에서 확인해주세요.");
					return false;
                }
            });
}
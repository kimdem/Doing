async function sendTestNotification() {
            const testPayload = {
                title: '테스트 알림',
                body: '이것은 테스트 푸시 메시지입니다!',
                icon: './Data/icon.png', // 아이콘 경로
            };

            try {
                const response = await fetch('http://localhost:3000/sendNotification', { // Node.js 서버의 /sendNotification 엔드포인트
                    method: 'POST',
                    body: JSON.stringify(testPayload),
                    headers: { 'Content-Type': 'application/json' },
                });

                const data = await response.json();
                console.log('서버 응답:', data);
                alert('테스트 푸시 메시지가 전송되었습니다!');
            } catch (error) {
                console.error('푸시 메시지 전송 중 오류 발생:', error);
            }
        }
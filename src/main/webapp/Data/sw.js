self.addEventListener('push', event => {
	console.log('푸시 이벤트 발생:', event);
    const data = event.data ? event.data.json() : { title: '기본 제목', body: '기본 메시지' };
	console.log('data : ', data);
	
    self.registration.showNotification(data.title, {
        body: data.body,
        icon: './icon.png', // 아이콘 경로
        tag: data.tag || 'default-tag',
    });
});

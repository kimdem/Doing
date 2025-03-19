<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FullCalendar 테스트</title>

    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">

    <!-- FullCalendar 필수 JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
</head>
<body>
    <div id="calendar"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            if (!calendarEl) {
                console.error("캘린더 요소를 찾을 수 없습니다.");
                return;
            }

            var calendar = new FullCalendar.Calendar(calendarEl, {
                locale: 'ko',  // 한글 설정
                initialView: 'dayGridMonth',
                events: [
                    { title: '테스트 일정', start: '2025-03-19' }
                ]
            });

            calendar.render();
        });
    </script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="./Data/css/Main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 확인</title>
    <%@ include file="menubar.jsp" %>
</head>
<body>
	<%
		String tasknumber=request.getParameter("tasknumber");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from task where tasknumber = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tasknumber);
		rs = pstmt.executeQuery();
		if(rs.next()) {
	%>
    <div class="mainbox">
        <h1><strong><%=rs.getString("project") %></strong></h1><hr>
        <div id="calendar">
        	<a href="cal_add.jsp?tasknumber=<%= tasknumber %>" class="btn btn-primary" style="margin-top: 2%;">일정 추가</a>
        </div>
        <script>
	        document.addEventListener('DOMContentLoaded', function() {
	            var calendarEl = document.getElementById('calendar');
	            var calendar = new FullCalendar.Calendar(calendarEl, {
	                locale: 'ko',
	                initialView: 'dayGridMonth',
	                events: "./pro_cal.jsp?tasknumber=<%=tasknumber%>"
	            });
	
	            calendar.render();
	        });
    </script>
    </div>
	<%
	    }
        
        if (rs != null) 
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
     %>
</body>
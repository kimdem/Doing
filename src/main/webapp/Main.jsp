<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="./Data/css/Main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<script type="module" src="./sub.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개발 진행 현황</title>
</head>
<body>
    <div class="mainbox">
        <h1>Doing Develope!</h1>
        <div class="add-btn">
        	<a href="addtask.jsp" class="btn btn-success me-2">추가</a>
        	<a href="removetask.jsp" class="btn btn-danger me-2">삭제</a>
        	<button class="btn btn-primary" onclick="requestFcmToken()">알림 허용</button>
        	<button class="btn btn-info" id="sendNotificationButton">test</button>
        </div>
        	<ul>
            <%
	            PreparedStatement pstmt = null;
	    		ResultSet rs = null;
	    		String sql = "select tasknumber, project from task";
	    		pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		while (rs.next()) {
            %>
            		<li class="task"><a href="./Cal.jsp?tasknumber=<%=rs.getInt("tasknumber") %>" style="color: black;"><strong><%=rs.getString("project")%></strong></a></li>
            		
           <%
	    		}
	    		
	    		if (rs != null) 
	    			rs.close();
	    		if (pstmt != null)
	    			pstmt.close();
	    		if (conn != null)
	    			conn.close();
           %>
           </ul>
        </div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Data/css/Main.css" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 수정</title>
    <%@ include file="menubar.jsp" %>	
</head>
<body>
	<div class="mainbox" style="overflow-y: auto;">
			<h1>일정 List</h1><hr>
			<ul>
			<%
				String tasknumber=session.getAttribute("session_tasknumber").toString();
				PreparedStatement pstmt = null;
	    		ResultSet rs = null;
	    		String sql = "select cal_id, cal_name from cal where tasknum = ?";
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setString(1, tasknumber);
	    		rs = pstmt.executeQuery();
	    		while (rs.next()) {
	    		
			%>
				<li class="task"><a href="./update.jsp?cal_id=<%=rs.getInt("cal_id") %>" style="color: black;"><strong><%=rs.getString("cal_name")%></strong></a></li>
				
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
	<div class="mainbox">
        <h2 style="text-align: center;">수정을 원하는 일정이름을 클릭하세요</h2>
    </div>
</body>
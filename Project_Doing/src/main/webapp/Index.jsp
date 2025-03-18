<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="./Data/css/index.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세정보</title>
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
		<h1><b><%=rs.getString("project") %></b></h1><hr>
		<h3><b>상세 정보</b></h3><br><br>
		<p><b style="color: red;">작업번호 : </b><b><%=rs.getString("tasknumber") %></b></p><br>
		<p><b>총 참여 인원 : <%=rs.getString("people") %></b>
		<p><b>프로젝트 진행 기한 : <%=rs.getString("firstdate") %> ~ <%=rs.getString("seconddate") %></b>
		<p><b>상세설명 : <%=rs.getString("des") %></b>
	</div>
	
	<%
		}
	%>
</body>
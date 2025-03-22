<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script type="text/javascript" src="./Data/cal_check.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Data/css/addtask.css" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 추가</title>
    <%@ include file="menubar.jsp" %>	
</head>
<body>
	<%
		String tasknumber=session.getAttribute("session_tasknumber").toString();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT firstdate, seconddate FROM task where tasknumber=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, tasknumber);
	    rs = pstmt.executeQuery();
	    if (rs.next()) {
	%>
	<div class="mainbox">
	<form name="cal_add" action="./pro_cal_add.jsp" method="post">
		<h1>프로젝트 일정 추가하기</h1>
		<div>
			 <input type="hidden" id="FD" name="FD" value="<%=rs.getDate("firstdate")%>">
			 <input type="hidden" id="SD" name="SD" value="<%=rs.getDate("seconddate")%>">
			 <input type="hidden" name="tasknumber" value="<%=tasknumber_m%>">
			<h3>일정 이름 : </h3>
			<input type="text" id="cal_name" name="cal_name" class="form-control">
		</div>
		<div>
			<h3>일정 기한 : </h3>
			<input type="date" id="cal_f" name="cal_f" class="form-control" style="width: auto; display: inline-block;"> ~ 
			<input type="date" id="cal_s" name="cal_s" class="form-control" style="width: auto; display: inline-block;">
		</div>
		<div>
			<h3>일정 코멘트 : </h3>
		    <textarea name="des" id="des" cols="50" rows="4" class="form-control" placeholder="100자 내로 작성하시오"></textarea>
		</div>
		<div style="text-align: right;">
			<input type="button" class="btn btn-success" value="등록" onclick="cal_check()">
			<a href="Cal.jsp?tasknumber=<%=tasknumber_m %>" class="btn btn-secondary">돌아가기</a>
		</div>
	</form>
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
</html>
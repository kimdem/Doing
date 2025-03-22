<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script type="text/javascript" src="./Data/cal_update.js"></script>
	<script type="text/javascript">
		function alertdelete(n) {
			if (confirm("일정이 삭제됩니다.\n삭제를 진행하시겠습니까?")==true)
				location.href="./pro_cal_delete.jsp?cal_id=" + n;
			else
				alert("삭제를 취소했습니다.");
				return;
		}
	</script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Data/css/addtask.css" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 수정</title>
    <%@ include file="menubar.jsp" %>	
</head>
<body>
	<%
		String cal_id=request.getParameter("cal_id");
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select cal_name, cal_fd, cal_sd, des from cal where cal_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, cal_id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
	%>
	<div class="mainbox">
	<form name="cal_update" action="./pro_cal_update.jsp" method="post">
		<h1><%=rs.getString("cal_name") %></h1>
		<div>
		    <input type="hidden" id="cal_id" name="cal_id" value="<%=cal_id%>">
			<h3>일정 이름 : </h3>
			<input type="text" id="cal_name" name="cal_name" class="form-control" value="<%=rs.getString("cal_name")%>">
		</div>
		<div>
			<h3>일정 기한 : </h3>
			<input type="date" id="cal_fd" name="cal_fd" class="form-control" style="width: auto; display: inline-block;" value="<%=rs.getString("cal_fd")%>"> ~ 
			<input type="date" id="cal_sd" name="cal_sd" class="form-control" style="width: auto; display: inline-block;" value="<%=rs.getString("cal_sd")%>">
		</div>
		<div>
			<h3>일정 코멘트 : </h3>
		    <textarea name="des" id="des" cols="50" rows="4" class="form-control" placeholder="100자 이내로 작성하시오"><%=rs.getString("des")%></textarea>
		</div>
		<%
	        }
	        if (rs != null) 
	            rs.close();
	        if (pstmt != null)
	            pstmt.close();	
	      
	        String tasknumber=session.getAttribute("session_tasknumber").toString();
		    String sql_1 = "SELECT firstdate, seconddate FROM task where tasknumber=?";
		    pstmt = conn.prepareStatement(sql_1);
		    pstmt.setString(1, tasknumber);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		%>
		<input type="hidden" id="firstdate" name="firstdate" value="<%=rs.getString("firstdate")%>">
		<input type="hidden" id="seconddate" name="seconddate" value="<%=rs.getString("seconddate")%>">
		<div style="text-align: right;">
			<input type="button" class="btn btn-success" value="수정" onclick="calupdate()">
			<a href="updatecal.jsp?tasknumber=<%=tasknumber%>" class="btn btn-secondary">돌아가기</a>
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
	<div class="mainbox">
		<h2 style="text-align:center; color:red;">※ Danger Zone ※</h2>
		<form name="cal_delete" action="./pro_cal_delete.jsp" method="post">
		    <input type="hidden" name="cal_id" value="<%=cal_id%>">
        	<a href="#" onclick="alertdelete('<%=cal_id%>')" class="btn btn-danger" style="width:100%;">일정 삭제</a>
        </form>
    </div>

</body>
</html>
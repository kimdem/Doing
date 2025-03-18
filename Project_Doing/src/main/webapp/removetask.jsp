<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Data/css/removetask.css" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 삭제</title>
    <script type="text/javascript">
		function RemoveConfirm(n) {
			if (confirm("삭제를 원하십니까?\n삭제 시 복구가 불가능하며 모든 데이터가 삭제됩니다.")==true)
				location.href="./pro_removetask.jsp?tasknumber=" + n;
			else
				alert("삭제를 취소했습니다.");
				return;
		}
	</script>	
</head>
<body>
	<%@ include file="menubar.jsp" %>
	<div class="mainbox">
		<h1>※ 프로젝트 삭제 ※</h1>
		<ul>
            <%
	            PreparedStatement pstmt = null;
	    		ResultSet rs = null;
	    		String sql = "select tasknumber, project from task";
	    		pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		while (rs.next()) {
            %>
            		<li class="task"><strong><%=rs.getString("project")%></strong>
            			<div style="text-align: right;">
            				<a href="#" onclick="RemoveConfirm('<%=rs.getInt("tasknumber")%>')" class="btn btn-danger">삭제</a>
            			</div> 
            		</li>
            		
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
           <div style="text-align: right;">
           		<br><br>
           		<a href="Main.jsp" class="btn btn-secondary">돌아가기</a>
           </div>
	</div>
</body>
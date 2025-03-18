<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="./Data/css/Main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개발 진행 현황</title>
</head>
<body>
    <%@ include file="menubar.jsp" %>
    <div class="mainbox">
        <h1>Doing Develope!</h1>
        <div class="add-btn">
        	<a href="addtask.jsp" class="btn btn-success me-2">추가</a>
        	<a href="removetask.jsp" class="btn btn-danger">삭제</a>
        </div>
        	<ul>
            <%
	            PreparedStatement pstmt = null;
	    		ResultSet rs = null;
	    		String sql = "select project from task";
	    		pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		while (rs.next()) {
            %>
            		<li class="task"><a href="#"><strong><%=rs.getString("project")%></strong></a></li>
            		
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

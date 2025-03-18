<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String A = request.getParameter("tasknumber");
	int num = Integer.parseInt(A);
	
	PreparedStatement pstmt=null;
	String sql = "DELETE FROM task WHERE tasknumber=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	response.sendRedirect("Itisremoved.jsp");
%>
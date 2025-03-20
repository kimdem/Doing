<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tasknumber = request.getParameter("tasknumber");
	String cal_name = request.getParameter("cal_name");
	String cal_fd = request.getParameter("cal_fd");
	String cal_sd = request.getParameter("cal_sd");
	String des = request.getParameter("des");

	PreparedStatement pstmt=null;
	String sql = "UPDATE cal SET cal_name=?, cal_fd=?, cal_sd=?, des=? WHERE tasknum=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, cal_name);
	pstmt.setString(2, cal_fd);
	pstmt.setString(3, cal_sd);
	pstmt.setString(4, des);
	pstmt.setString(5, tasknumber);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
<script>
    alert("일정이 수정되었습니다.");
</script>
<%
	response.sendRedirect("Cal.jsp?tasknumber=" + tasknumber); 
%>
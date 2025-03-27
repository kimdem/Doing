<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tasknumber = session.getAttribute("session_tasknumber").toString();
	String cal_id = request.getParameter("cal_id");
	String cal_name = request.getParameter("cal_name");
	String cal_fd = request.getParameter("cal_fd");
	String cal_sd = request.getParameter("cal_sd");
	String des = request.getParameter("des");
	String cal_complete = request.getParameter("cal_complete");
	
	Boolean complete = Boolean.parseBoolean(cal_complete);
	
	Integer Intcal_id = Integer.parseInt(cal_id);

	PreparedStatement pstmt=null;
	String sql = "UPDATE cal SET cal_name=?, cal_fd=?, cal_sd=?, des=?, cal_complete=? WHERE cal_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, cal_name);
	pstmt.setString(2, cal_fd);
	pstmt.setString(3, cal_sd);
	pstmt.setString(4, des);
	pstmt.setBoolean(5, complete);
	pstmt.setInt(6, Intcal_id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
<script>
    alert("일정이 수정되었습니다.");
    window.location.href = "Cal.jsp?tasknumber=<%=tasknumber %>";
</script>

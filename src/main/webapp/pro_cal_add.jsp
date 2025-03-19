<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tasknumber = request.getParameter("tasknumber");
	String cal_name = request.getParameter("cal_name");
	String cal_fd = request.getParameter("cal_f");
	String cal_sd = request.getParameter("cal_s");
	String des = request.getParameter("des");

	PreparedStatement pstmt=null;
	String sql = "INSERT INTO cal (tasknum, cal_name, cal_fd, cal_sd, des) VALUES (?, ?, ?, ?, ?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, tasknumber);
	pstmt.setString(2, cal_name);
	pstmt.setString(3, cal_fd);
	pstmt.setString(4, cal_sd);
	pstmt.setString(5, des);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
alert("일정이 추가되었습니다.");
<%
	response.sendRedirect("Cal.jsp?tasknumber=" + tasknumber); 
%>
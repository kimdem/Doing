<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String project = request.getParameter("project");
	String people = request.getParameter("people");
	String firstdate = request.getParameter("firstdate");
	String seconddate = request.getParameter("seconddate");
	String des = request.getParameter("des");
	
	
	
	Integer peo = Integer.valueOf(people);
	if(des.isEmpty()) {
		des = "-";
	}
	
    
	PreparedStatement pstmt=null;
	String sql = "INSERT INTO task (project, people, firstdate, seconddate, des) VALUES (?, ?, ?, ?, ?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, project);
	pstmt.setInt(2, peo);
	pstmt.setString(3, firstdate);
	pstmt.setString(4, seconddate);
	pstmt.setString(5, des);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	response.sendRedirect("Itmade.jsp"); 
%>
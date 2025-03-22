<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tasknumber = session.getAttribute("session_tasknumber").toString();
	String cal_id = request.getParameter("cal_id");
	
	Integer Intcal_id = Integer.parseInt(cal_id);

	PreparedStatement pstmt=null;
	String sql = "DELETE FROM cal WHERE cal_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, Intcal_id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>
<script>
    alert("일정이 삭제되었습니다.");
    window.location.href = "updatecal.jsp?tasknumber=<%=tasknumber %>";
</script>

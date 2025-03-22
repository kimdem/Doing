<%@ page contentType="application/json; charset=UTF-8" %>
<%@ include file="dbconnjson.jsp" %>
<%@ page import="java.sql.*, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    String tasknumber = request.getParameter("tasknumber");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT cal_name, cal_fd, cal_sd FROM cal WHERE tasknum = ?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, tasknumber);
    rs = pstmt.executeQuery();
    out.print("[");
    boolean line = true;
    while (rs.next()) {
        if (!line) out.print(",");
        
        String enddate = rs.getString("cal_sd");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate end = LocalDate.parse(enddate, formatter);
        end = end.plusDays(1);
        out.print("{");
        out.print("\"title\": \"" + rs.getString("cal_name") + "\",");
        out.print("\"start\": \"" + rs.getDate("cal_fd") + "\",");
        out.print("\"end\": \"" + end.toString() + "\"");
        out.print("}");
        line = false;
    }
    out.print("]");

    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
%>

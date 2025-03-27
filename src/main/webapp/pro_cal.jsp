<%@ page contentType="application/json; charset=UTF-8" %>
<%@ include file="dbconnjson.jsp" %>
<%@ page import="java.sql.*, java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%
    String tasknumber = request.getParameter("tasknumber");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT cal_name, cal_fd, cal_sd, cal_complete FROM cal WHERE tasknum = ?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, tasknumber);
    rs = pstmt.executeQuery();
    out.print("[");
    boolean line = true;
    LocalDate today = LocalDate.now();
    while (rs.next()) {
        if (!line) out.print(",");
        
        String enddate = rs.getString("cal_sd");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate end = LocalDate.parse(enddate, formatter);
        end = end.plusDays(1);
        LocalDate start = LocalDate.parse(rs.getString("cal_fd"), formatter);
        
        String color = "#3788d8";
        
        if(rs.getBoolean("cal_complete")) {
            color = "green";
        } else if (end.isBefore(today)) {
            color = "red";
        } else if (!start.isAfter(today) && !end.isBefore(today)) {
            color = "orange";
        }

        out.print("{");
        out.print("\"title\": \"" + rs.getString("cal_name") + "\",");
        out.print("\"start\": \"" + rs.getDate("cal_fd") + "\",");
        out.print("\"end\": \"" + end.toString() + "\",");
        out.print("\"color\": \"" + color + "\"");
        out.print("}");
        line = false;
    }
    out.print("]");

    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
%>

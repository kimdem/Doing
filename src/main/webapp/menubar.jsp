<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String tasknumber_m = request.getParameter("tasknumber");
%>

<link rel="stylesheet" href="./Data/css/menubar.css" />
<div class="menubar">
	<ul class="nav">
	 	<li><a href="Main.jsp"><img src="./Data/Icon/Home_Default.svg" class="Home_Default_icon" alt="H"></a></li>
	 	<li><a href="./Cal.jsp?tasknumber=<%=tasknumber_m %>"><strong>캘린더</strong></a></li>
	 	<li><a href="#"><strong>수정</strong></a></li>
	 	<li><a href="./Index.jsp?tasknumber=<%=tasknumber_m %>" style="color: black;"><strong>상세정보</strong></a></li>
	</ul><hr>
</div>
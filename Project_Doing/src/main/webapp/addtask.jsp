<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script type="text/javascript" src="./Data/checkform.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./Data/css/addtask.css" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개발 추가!!!</title>	
</head>
<body>
	<%@ include file="menubar.jsp" %>
	<div class="mainbox">
	<form name="addtask" action="./pro_addtask.jsp" method="post">
		<h1>생성 양식</h1>
		<div>
			<h3>프로젝트 이름 : </h3>
			<input type="text" id="project" name="project" class="form-control" placeholder="name">
		</div>
		<div>
			<h3>참여 인원 : </h3>
			<input type="number" id="people" name="people" class="form-control" value=1 min="1">
		</div>
		<div>
			<h3>진행 기한 : </h3>
			<input type="date" id="firstdate" name="firstdate" class="form-control" style="width: auto; display: inline-block;"> ~ 
			<input type="date" id="seconddate" name="seconddate" class="form-control" style="width: auto; display: inline-block;">
		</div>
		<div>
			<h3>프로젝트 설명</h3>
		    <textarea name="des" id="des" cols="50" rows="4" class="form-control" placeholder="세부 설명"></textarea>
		</div>
		<div style="text-align: right;">
			<input type="button" class="btn btn-success" value="확인" onclick="checkform()">
			<a href="Main.jsp" class="btn btn-secondary">돌아가기</a>
		</div>
	</form>
	</div>
	
</body>
</html>
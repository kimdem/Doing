<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontisto/css/fontisto.min.css">
	<link rel="stylesheet" href="./Data/css/Main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 수정</title>
    <%@ include file="menubar.jsp" %>
</head>
<body>
	<div class="mainbox">
		<h1>일정 수정</h1>><hr>
		<form action="pro_updatecal.jsp" method="post">
            <div class="mb-3">
                <label for="project" class="form-label">프로젝트명</label>
                <input type="text" class="form-control" id="project" name="project" required>
            </div>
            <div class="mb-3">
                <label for="people" class="form-label">총 참여 인원</label>
                <input type="number" class="form-control" id="people" name="people" required>
            </div>
            <div class="mb-3">
                <label for="firstdate" class="form-label">프로젝트 시작일</label>
                <input type="date" class="form-control" id="firstdate" name="firstdate" required>
            </div>
            <div class="mb-3">
                <label for="seconddate" class="form-label">프로젝트 종료일</label>
                <input type="date" class="form-control" id="seconddate" name="seconddate" required>
            </div>
	</div>
</body>
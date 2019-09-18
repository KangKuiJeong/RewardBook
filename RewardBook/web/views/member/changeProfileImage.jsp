<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필사진 변경</title>
<link rel="stylesheet" href="/RewardBook/resources/css/mainMyPage.css">
</head>
<body>
	<form method="post" action="/RewardBook/m_profileImg" enctype="multipart/form-data" id="profileForm">
		<div class="line"></div>
		<p class="profileUploadsBtn">프로필사진등록</p>
		<input type="file" name="profileImg" id="uploadsBtn">
		<input type="hidden" name="userNo" id="subBtn" value="<%= loginMember.getuNo() %>">
		<input type="submit" value="등록">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String message = (String)request.getAttribute("message");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자문의</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/in_admin.css">
</head>
<body>
	
	<!-- 헤더부분 -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="iq_awrap">
		<div id="line"></div>
		<p id="iq_atitle">관리자문의</p>
		<p id="iq_acontents">문의사항을 남겨주시면 보다 신속하게 답변드리겠습니다.</p>
		<p id="nullMessage"><%= loginMember.getName() %>님의 <%= message %></p>
		<div id="WritebtnArea"><button id="iq_Nullawrite">문의하기</button>
								<button id="iq_Nullawrite" onclick="location.href='index.jsp'">홈으로</button></div>
		
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
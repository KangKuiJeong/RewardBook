<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/member/emailJoin.css">
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	
	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="okWrap">
		<p id="okMessage">회원가입이<br>정상적으로 완료되었습니다.</p>
		<p id="subOkMessage">리워드북의 회원이 되신것을 진심으로 환영합니다.</p>
		<ul>
			<li id="goLogin"><a href="/RewardBook/views/member/mainLoginView.jsp">로그인하기</a></li>
			<li id="goView"><a href="#">프로젝트오픈</a></li>
			<li id="goProject"><a href="#">프로젝트둘러보기</a></li>
		</ul>
	</div>
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
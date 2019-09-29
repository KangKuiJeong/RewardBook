<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/commons.css">
<link rel="stylesheet" href="/RewardBook/resources/css/member/memberView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="joinContainer">
		<p class="title">회원가입</p>
		<p id="JoinMessage">리워드북 회원가입을 진심으로 환영합니다.</p>
		
		<ul>
			<li id="emailJoin"><a href="/RewardBook/views/member/emailJoinView.jsp">
				<img src="/RewardBook/resources/images/index/personalIcon.png">
				개인회원가입하기</a></li>
			<li id="emailJoin"><a href="/RewardBook/views/member/emailJoinCompanyView.jsp">
				<img src="/RewardBook/resources/images/index/companyIcon.png">
				기업회원가입하기</a></li>
			
			<!-- <li id="kakaoJoin" class="snsJoinbtn"><a href="#">카카오톡</a></li>
			<li id="naverJoin" class="snsJoinbtn"><a href="#">네이버</a></li>
			<li id="googleJoin" class="snsJoinbtn"><a href="#" >구글</a></li>
			<li id="companyJoin"><a href="/RewardBook/views/member/emailJoinCompanyView.jsp">기업회원가입</a></li> -->
		</ul>
		
		<p id="joinIntro">이미 계정이 있으신가요? &nbsp;<a href="/RewardBook/views/member/mainLoginView.jsp">로그인</a></p>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
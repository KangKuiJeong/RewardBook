<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/RewardBook/resources/css/member/memberfind.css">
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="findHeader">
		<div id="findWrap">
			<p id="findTitle">아이디ㆍ비밀번호찾기</p>
			<div id="fineLink">
				<a href="findIdView.jsp">아이디 찾기</a>
				<a href="#" id="select">비밀번호 찾기</a>
			</div>
		</div>
	</div>
	
	<div id="findContentsId">
		<p id="findSubTitle">
			가입하셨던 이메일 계정을 입력하시면,<br>
			해당 계정으로 임시번호를 메일로 발송해드립니다.<br>
		</p>
		<form action="/RewardBook/m_findpw" method="post" onsubmit="findpwd();">
			<input type="text" placeholder="이메일 계정입력" id="findPwd" name="findPwd">
			<p id="findPwText">
				<% if(request.getAttribute("message")==null){ %>
				
			<% }else{%>
			
				<%= request.getAttribute("message") %>
				
			<% } %>
			</p>
			<input type="submit" value="메일전송">
		</form>
	</div>

	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
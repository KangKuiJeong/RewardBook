<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/RewardBook/resources/js/member/findId.js"></script>
<link rel="stylesheet" href="/RewardBook/resources/css/member/memberfind.css">
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="findHeader">
		<div id="findWrap">
			<p id="findTitle">아이디ㆍ비밀번호찾기</p>
			<div id="fineLink">
				<a href="#" id="select">아이디 찾기</a>
				<a href="/RewardBook/views/member/findPwView.jsp">비밀번호 찾기</a>
			</div>
		</div>
	</div>
	
	<div id="findContentsId">
		<p id="findSubTitle">
			리워드북은 이메일 계정을 아이디로 사용합니다.<br>
			소유하고 계신 계정을 입력해보세요. 가입여부를 확인해드립니다.
		</p>
		<form action="/RewardBook/m_findid" method="get" onsubmit="findId();">
			<input type="text" placeholder="이메일 계정입력" id="findEmail" name="findEmail">
			<p id="submitReturn">
			<% if(request.getAttribute("message")==null){ %>
				
			<% }else{%>
			
				<%= request.getAttribute("message") %>
				</p>
				
			<% } %>
			
			<input type="submit" value="확인">
		</form>
	</div>

	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
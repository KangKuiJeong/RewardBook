<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 완료</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/member/deleteComplete.css">
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="completeWrap">
		<div id="completeWrapContents">
			<p id="deleteMessage">회원님의 탈퇴가 성공적으로 이루어졌습니다.</p>
			<p id="deleteSubMessage">
				그동안 리워드북을 이용해주셔서 감사합니다. 보다 좋은 서비스로 찾아뵙겠습니다.
			</p>
			<div id="homeBtn">
				<a href="/RewardBook/index.jsp">리워드북 메인으로</a>
			</div>	
		</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member checkMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

.area1 {
	width : 1100px;
	height : 800px;
	position : absolute;
	top : 65px;
	left : 250px;
}

.area1 .line1 {
	text-align : center;
	font-size : 60px;
	font-weight : 700;
	color : white;
	margin : 200px 0px 0px 0px;
}
.area1 .line2, .area1 .line3 {
	width : 350px;
	height : 60px;
	background : #FFB202;
	border-radius : 10px;
	font-size : 30px;
	font-weight : 600;
	text-align : center;
	line-height : 55px;
	color : white;
	float : left;
	margin : 100px 100px 0px 100px;
	cursor : pointer;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="/views/common/header.jsp" %>
	
	<img src="/RewardBook/resources/images/project/완료페이지.jpg" style="width : 100%">
	<div class="area1">
		<div class="line1">프로젝트 등록 신청이<br>성공적으로 완료되었습니다.</div>
		<div class="line2" onclick="location.href='/RewardBook/index.jsp'">리워드북 메인</div>
		<div class="line3" onclick="location.href='/RewardBook/p_list'">프로젝트 둘러보기</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>
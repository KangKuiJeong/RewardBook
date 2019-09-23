<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

.area1 {
	width : 100%;
	position : relative;
}
.area1 .image1 {
	width : 100%;
}
.area1 .text1 {
	position : absolute;
	top : 110px;
	left : 200px;
	color : white;
}

.area1 .text1 .startBtn {
	width : 330px;
	height : 50px;
	background : #FFB202;
	border-radius : 7px;
	font-size : 20px;
	font-weight : 500;
	text-align : center;
	line-height : 50px;
	margin : 20px 0px 0px 50px;
	cursor : pointer;
}

.area2 {
	width : 100%;
	position : relative;
}
.area2 .text1 {
	width : 1000px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="/views/common/header.jsp" %>
	
	<div class="area1">
		<img class="image1" src="/RewardBook/resources/images/project/테스트2.png">
		<div class="text1">
			<div style="font-size : 30px; margin : 0px 0px 50px 0px;">새로움을 원하시나요?</div>
			<div><h1>리워드북과 함께 시작해보세요<br>든든한 지원자가 되어드리겠습니다</h1></div>
			<div class="startBtn" onclick="location.href='/RewardBook/views/project/projectOpen.jsp'">프로젝트 시작하기</div>
		</div>
	</div>
	<div class="area2">
		<div class="text1" style="margin : auto;">
			<div>할룽할룽</div>
		</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>
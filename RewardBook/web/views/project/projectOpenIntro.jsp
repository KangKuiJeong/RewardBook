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

.area2 .text1, .area2 .text2 {
	width : 1000px;
	margin : 30px auto 0px auto;
}
.area2 .text1 .title, .area2 .text2 .title {
	width : 100%;
	height : 90px;
	font-size : 30px;
	font-weight : 600;
}
.area2 .text1 .block {
	width : 45%;
	height : 430px;
	float : left;
	margin : 0px 25px 0px 25px;
}
.area2 .text1 .block .subtitle {
	height : 50px;
	font-size : 25px;
	font-weight : 600;
}
.area2 .text1 .block .img {
	width : 100%;
	height : 250px;
	margin : auto;
}
.area2 .text1 .block .img img {
	width : 100%;
	height : 100%;
}
.area2 .text1 .block .text {
	width : 60%;
	height : 100px;
	font-size : 15px;
	font-weight : 500;
	color : gray;
	text-align : center;
	margin : auto;
}

.area2 .text2 {
	width : 1000px;
	height : 350px;
	margin : 30px auto 0px auto;
	clear : both;
}
.area2 .text2 .category {
	height : 200px;
	margin : auto;
	background : green;
}

.area3 .text1 {
	position : absolute;
	top : 2000px;
	left : 650px;
	color : white;
	text-align : center;
}
.area3 .text1 .startBtn {
	width : 350px;
	height : 60px;
	background : #FFB202;
	border-radius : 10px;
	font-size : 25px;
	font-weight : 600;
	line-height : 60px;
	margin : 20px 0px 0px 0px;
	cursor : pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
<script type="text/javascript">
function moveOpen() {
	<% if (checkMember == null) { %>
		if (confirm("로그인이 필요한 창입니다. 로그인 페이지로 이동하시겠습니까?")) {
			location.href="/RewardBook/views/member/mainLoginView.jsp";
		} else {
			alert("로그인 후 이용해주세요.");
		}
	<% } else { %>
		location.href="/RewardBook/views/project/projectOpen.jsp";
	<% } %>
} 
</script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="/views/common/header.jsp" %>
	
	<div class="area1">
		<img class="image1" src="/RewardBook/resources/images/project/테스트2.png">
		<div class="text1">
			<div style="font-size : 30px; margin : 0px 0px 50px 0px;">새로움을 원하시나요?</div>
			<div><h1>리워드북과 함께 시작해보세요<br>든든한 지원자가 되어드리겠습니다</h1></div>
			<div class="startBtn" onclick="moveOpen();">프로젝트 오픈하기</div>
		</div>
	</div>
	<div class="area2">
		<div class="text1">
			<div class="title">리워드북 펀딩을 하는 이유는 무엇일까요?</div>
			<div class="block">
				<div class="subtitle">제품 제작 비용을 미리 확보할 수 있었어요.</div>
				<div class="img"><img class="image1" src="/RewardBook/resources/images/project/사례1.jpg"></div>
				<div class="text">제품 하나를 개발하는 데에 많은 시간과 비용이 들어요. 초기 양산 비용을 확보하는데 리워드북 펀딩에게 큰 도움을 받았습니다.</div>
			</div>
			<div class="block">
				<div class="subtitle">내 브랜드를 사랑해줄 팬을 모을 수 있어요.</div>
				<div class="img"><img class="image1" src="/RewardBook/resources/images/project/사례2.jpg"></div>
				<div class="text">브랜드의 생각을 알리고, 공감해줄 분들을 만나고 싶었어요. 리워드북에서 만난 슈룹의 팬들이 자연스레 우리의 생각, 가치를 더 널리 알려주실거라 생각했죠.</div>
			</div>
			<div class="block">
				<div class="subtitle">고객의 니즈를 일찍 파악할 수 있었어요.</div>
				<div class="img"><img class="image1" src="/RewardBook/resources/images/project/사례3.jpg"></div>
				<div class="text">본격적으로 생산에 돌입하기 전, 고객의 니즈를 파악하고, 데이터를 확보할 수 있다는게 리워드북펀딩의 가장 큰 장점이에요.</div>
			</div>
			<div class="block">
				<div class="subtitle">펀딩 후, 외부에서 연락이 많이 왔어요.</div>
				<div class="img"><img class="image1" src="/RewardBook/resources/images/project/사례4.jpg"></div>
				<div class="text">리워드북펀딩을 끝내고 나니 외부에서도 연락을 많이 주시더라고요. 전국 카페에서 제휴 문의가 오기도 하고, 기업에서 납품이나 대량 구매 요청을 주기도 해요.</div>
			</div>
		</div>
		<div class="text2">
			<div class="title">다양한 카테고리로 시작 가능합니다.</div>
			<div class="category">
				카테고리~
			</div>
		</div>
	</div>
	<div class="area3">
		<img src="/RewardBook/resources/images/project/모자이크2.png" style="width : 100%">
		<div class="text1">
			<div style="font-size : 20px;"><h1>지금 도전해보세요</h1></div>
			<div class="startBtn" onclick="moveOpen();">프로젝트 오픈하기</div>
		</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>
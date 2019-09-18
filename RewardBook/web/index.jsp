<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 공통 header & footer 스타일시트 연결 -->
<link rel="stylesheet" href="resources/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="views/common/header.jsp" %>
	
	<!-- 슬라이드영역 -->
	<div id="slideBox">
		<div class="slide">
			  <ul class="panel">
			    <li><img src="resources/images/index/main4.png"></li>
			    <li><img src="resources/images/index/main3.png"></li>
			    <li><img src="resources/images/index/main2.jpg"></li>
			  </ul>
			  <ul class="dot">
			    <li class="on">슬라이드 버튼1번</li>
			    <li>슬라이드 버튼2번</li>
			    <li>슬라이드 버튼3번</li>
			  </ul>
			  <div class="prev"><img src="resources/images/index/arrow-left.png"></div>
			  <div class="next"><img src="resources/images/index/arrow-right.png"></div>
		</div>
	</div>
	
	
	<!-- 컨텐츠 영역 -->
	<!-- <div id="contents">
		<table id="table1">
			<tr>
				<td id="pick" >
					<p class="title">이 펀딩 어때요?</p>
					<table id="pickContents">
						<tr><td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td>
						<td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td>
						<td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td></tr>
						<tr><td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td>
						<td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td>
						<td><img src="resources/images/index/sample1.jpg" width="293">세상에 단 120벌, 당신을 위한 수트</td>
					</table>
				</td>
				<td id="ranking">
					<p class="title">실시간랭킹 TOP5</p>
					<ul id="rankingUl">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</td>
			</tr>
		</table>
	</div> -->
	
	<!-- 푸터부분 include -->
	<%@ include file="views/common/footer.jsp" %>
	
</body>
</html>
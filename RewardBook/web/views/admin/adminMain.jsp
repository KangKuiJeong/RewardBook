<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

.container {
	width : 1440px;
	height : 800px;
	font-family: 'Noto Sans KR', sans-serif;
}


.main {
	width : 1240px;
	height : 800px;
	float : left;
}
.main_area1 {
	width : 520px;
	height : 800px;
	float : left;
}
.main_area2, .main_area3 {
	width : 720px;
	height : 400px;
	float : left;
}

.main_area1_section1, .main_area1_section2, .main_area1_section3 {
	width : 100%;
	height : 50px;
	margin : 60px 0px 0px 0px;
	clear : both;
}
.main_area1_section1 .s1Text, .main_area1_section2 .s2Text, .main_area1_section3 .s3Text {
	margin : 0px 0px 0px 80px;
	font-size : 28px;
	font-weight : normal;
}
.main_area1_section1 .s1Count, .main_area1_section2 .s2Count, .main_area1_section3 .s3Count {
	margin : 0px 0px 0px 40px;
	font-size : 30px;
	font-weight : 600;
}

.main_area2_section1{
	margin : 20px 0px 0px 0px;
	width : 100%;
	height : 35px;
	clear : both;
	font-size : 25px;
	font-weight : normal;
}
.main_area3_section1{
	margin : 0px 0px 0px 0px;
	width : 100%;
	height : 35px;
	clear : both;
	font-size : 25px;
	font-weight : normal;
}
.main_area2_section1 #s1Text, .main_area3_section1 #s1Text {
	margin : 0px 0px 0px 20px;
}
.main_area2_section1 #s1Count, .main_area3_section1 #s1Count {
	margin : 0px 0px 0px 20px;
	font-size : 25px;
	font-weight : bold;
}

.main_area2_section2, .main_area3_section2{
	margin : 20px 0px 0px 0px;
}
.main_area2_section2 table, .main_area3_section2 table {
	text-align : center;
	font-size : 20px;
}
.main_area2_section2 table th, .main_area3_section2 table th {
	height : 30px;
	font-size : 19px;
	font-weight : bold;
	border-top : 2px solid black;
	border-bottom : 2px solid black;
	padding-top : 4px;
	padding-bottom : 4px;
}
.main_area2_section2 table td, .main_area3_section2 table td {
	height : 27px;
	font-size : 17px;
	font-weight : normal;
	border-bottom : 1px solid gray;
	padding-top : 3px;
	padding-bottom : 3px;
}

</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		setInterval("count1()", 1000);
		setInterval("count2()", 3500);
		setInterval("count3()", 6000);

		$.ajax({
			url: "/RewardBook/p_unchecked",
			type: "get",
			dataType: "json",
			success: function(data){
				
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				
				var values = "";
				var listcount = 0;
				for (var i in json.list){
					values += "<tr><td>" + json.list[i].p_no + "</td><td>";
					var str = decodeURIComponent(json.list[i].p_title).replace(/\+/gi, " ");
					if (str.length > 25)
						var str = str.substring(0, 25) + "..."
					values += str + "</td><td>" + json.list[i].u_name + "</td><td>2019-09-10</td></tr>";
					listcount++;
					if (listcount >= 7)
						break;
				}
				
				for (var a = listcount; a < 7; a++) {
					values += "<tr><td></td><td></td><td></td><td></td></tr>"
				}

				$(".main_area2_section2 table").html($(".main_area2_section2 table").html() + values);
				$(".main_area2_section1 #s1Count").html(listcount + " 건");
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error");
			}
		});
		
	});
	
	var c1 = 0;
	function count1() {
		c1++;
		$(".main_area1_section1 .s1Count").html(c1 + " 명");
	};

	var c2 = 0;
	function count2() {
		c2++;
		$(".main_area1_section2 .s2Count").html(c2 + " 명");
	};

	var c3 = 0;
	function count3() {
		c3++;
		$(".main_area1_section3 .s3Count").html(c3 + " 명");
	};
</script>
</head>
<body>
<%@ include file="/views/admin/common/adminHeader.jsp" %>
<div class="container">
	<%@ include file="/views/admin/common/adminSideMenu.jsp" %>
	<div class="main">
		<div class="main_area1">
			<div class="main_area1_section1">
				<span class="s1Text">오늘 총 방문자 수</span><span class="s1Count">0 명</span>
			</div>
			<div class="main_area1_section2">
				<span class="s2Text">오늘 총 가입자 수</span><span class="s2Count">0 명</span>
			</div>
			<div class="main_area1_section3">
				<span class="s3Text">오늘 총 탈퇴자 수</span><span class="s3Count">0 명</span>
			</div>
		</div>
		<div class="main_area2">
			<div class="main_area2_section1">
				<span id="s1Text">확인하지 않은 프로젝트 승인 요청</span><span id="s1Count">0 건</span>
			</div>
			<div class="main_area2_section2">
				<table cellspacing="0" cellpadding='0'>
					<tr><th style="width : 60px">번호</th><th style="width : 380px">프로젝트 제목</th><th style="width : 100px">작성자</th><th style="width : 170px">작성일</th></tr>
				</table>
			</div>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<span id="s1Text">확인하지 않은 문의사항</span><span id="s1Count">0 건</span>
			</div>
			<div class="main_area3_section2">
				<table cellspacing="0" cellpadding='0'>
					<tr><th style="width : 60px">번호</th><th style="width : 380px">프로젝트 제목</th><th style="width : 100px">작성자</th><th style="width : 170px">작성일</th></tr>
					<tr><td>121212</td><td>간식좀 주세요</td><td>강아지</td><td>2018-07-10</td></tr>
					<tr><td>232323</td><td>강아지가 괴롭혀요 ㅠ_ㅠ</td><td>고양이</td><td>2018-07-11</td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
					<tr><td></td><td></td><td></td><td></td></tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
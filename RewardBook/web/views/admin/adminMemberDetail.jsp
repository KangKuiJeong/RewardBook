<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	Member memberDetail = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

.container {
	width : 1440px;
	height : 850px;
	font-family: 'Noto Sans KR', sans-serif;
}

.main {
	width : 1240px;
	height : 800px;
	float : left;
}

.main_area1{
	width : 100%;
	height : 100px;
}
.main_area1_section1{
	width : 150px;
	height : 50px;
	margin : 20px 0px 0px 40px;
	float : left;
	font-size : 35px;
	font-weight : 600;
}

.main_area2{
	width : 100%;
	height : 50px;
}
.main_area2_section1{
	width : 800px;
	height : 50px;
	margin : 0px 0px 0px 40px;
	font-size : 25px;
	font-weight : 500;
}
.main_area2_section1 .title{
	width : 150px;
	float : left;
	font-size : 25px;
	font-weight : 500;
}
.main_area2_section1 .close, .main_area2_section1 .update{
	width : 100px;
	float : right;
}
.main_area2_section1 div div{
	width : 80px;
	height : 28px;
	font-size : 15px;
	text-align : center;
	border-bottom : 1px solid black;
}

.main_area3 {
	width : 100%;
	height : 650px;
}
.main_area3_section1 {
	width : 800px;
	height : 650px;
	margin : 0px 0px 0px 40px;
}
.main_area3_section1 .info {
	width : 800px;
	height : 650px;
}
.main_area3_section1 .info div {
	width : 800px;
	height : 50px;
	float : left;
	clear : both;
}
.main_area3_section1 .info div div span {
	width : 100px;
	height : 50px;
	margin : 0px 0px 0px 10px;
}
.main_area3_section1 .info div .input input[type=text], .main_area3_section1 .info div .input input[type=password] {
	width : 150px;
	height : 30px;
	border : 1px solid gray;
	border-radius : 8px;
	font-size : 16px;
	margin : 0px 0px 0px 20px;
	text-align : center;
}
.main_area3_section1 .info .profile div[name=picture] {
	width : 180px;
	height : 180px;
	margin : 0px 9px 9px 9px;
	border : 1px solid gray;
	border-radius : 8px;
}
.main_area3_section1 .info div .input input[name=name], .main_area3_section1 .info div .input input[name=id], .main_area3_section1 .info div .input input[name=pw], .main_area3_section1 .info div .input input[name=phone], .main_area3_section1 .info div .input input[name=address], .main_area3_section1 .info div .input input[name=bankAccount], .main_area3_section1 .info div .input input[name=mileage], .main_area3_section1 .info div .input input[name=homepage], .main_area3_section1 .info div .input input[name=category] {
	width : 300px;
}
.main_area3_section1 .info div .input input[name=intro]{
	width : 600px;
	height : 80px;
}
.main_area3_section1 .info .profile {
	width : 200px;
	height : 200px;
	clear : none;
}
.main_area3_section1 .info .no, .main_area3_section1 .info .bno {
	width : 300px;
	clear : none;
}
.main_area3_section1 .info .name, .main_area3_section1 .info .id, .main_area3_section1 .info .pw {
	width : 600px;
	clear : none;
}
.main_area3_section1 .info .post, .main_area3_section1 .info .bank {
	width : 300px;
	clear : left;
}
.main_area3_section1 .info .address, .main_area3_section1 .info .bankAccount {
	width : 500px;
	clear : right;
}
.main_area3_section1 .info .intro {
	height : 100px;
	clear : none;
}
.main_area3_section1 .info div .text {
	width : 100px;
	height : 50px;
	clear : none;
	text-align : center;
	font-size : 17px;
	font-weight : 600;
	line-height : 30px;
}
.main_area3_section1 .info div .input {
	width : 200px;
	height : 50px;
	clear : none;
}
.main_area3_section1 .info .name .input, .main_area3_section1 .info .id .input, .main_area3_section1 .info .pw .input {
	width : 500px;
}
.main_area3_section1 .info .phone .input, .main_area3_section1 .info .hompage .input, .main_area3_section1 .info .category .input, .main_area3_section1 .info .category .joinDate {
	width : 500px;
}

</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
	});

	var updateFlag = false;
	function update() {
		if (!updateFlag){
			$(".main_area2_section1 .update div").text("저장하기");
			$(".main_area3_section1 .info div .input input").each(function(index, item){
				if($(item).attr("name") != "joinDate" && $(item).attr("name") != "no")
					$(item).attr("disabled", false);
			});
			updateFlag = true;
		} else {
			$(".main_area2_section1 .update div").text("수정하기");
			$(".main_area3_section1 .info div .input input").each(function(index, item){
				if($(item).attr("name") != "joinDate" && $(item).attr("name") != "no")
					$(item).attr("disabled", true);
			});
			alert("저장 하는 척만 했습니다!");
			updateFlag = false;
		}
	}
	
</script>
</head>
<body>
<%@ include file="/views/admin/common/adminHeader.jsp" %>
<div class="container">
	<%@ include file="/views/admin/common/adminSideMenu.jsp" %>
	<div class="main">
		<div class="main_area1">
			<div class="main_area1_section1">
				<span>회원 관리</span>
			</div>
		</div>
		<div class="main_area2">
			<div class="main_area2_section1">
				<div class="title">
					<span>정보보기</span>
				</div>
				<div class="close">
					<div onclick="history.back(-1)" name="close">이전으로</div>
				</div>
				<div class="update">
					<div name="update" onclick="update();">수정하기</div>
				</div>
			</div>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<div class="info">
					<div class="profile">
						<div name="picture"></div>
					</div>
					<div class="no">
						<div class="text"><span>회원 번호</span></div>
						<div class="input"><input type="text" name="no" value="<%= memberDetail.getuNo() == null ? "-" : memberDetail.getuNo() %>" disabled></div>
					</div>
					<div class="bno">
						<div class="text"><span>사업자 번호 </span></div>
						<div class="input"><input type="text" name="bno" value="<%= memberDetail.getuBno() == null ? "-" : memberDetail.getuBno() %>" disabled></div>
					</div>
					<div class="name">
						<div class="text"><span>이름 </span></div>
						<div class="input"><input type="text" name="name" value="<%= memberDetail.getName() == null ? "-" : memberDetail.getName() %>" disabled></div>
					</div>
					<div class="id">
						<div class="text"><span>아이디 </span></div>
						<div class="input"><input type="text" name="id" value="<%= memberDetail.getId() == null ? "-" : memberDetail.getId() %>" disabled></div>
					</div>
					<div class="pw">
						<div class="text"><span>비밀번호 </span></div>
						<div class="input"><input type="password" name="pw" value="<%= memberDetail.getPw() == null ? "-" : memberDetail.getPw() %>" disabled></div>
					</div>
					<div class="phone">
						<div class="text"><span>전화번호</span></div>
						<div class="input"><input type="text" name="phone" value="<%= memberDetail.getPhone() == null ? "-" : memberDetail.getPhone() %>" disabled></div>
					</div>
					<div class="post">
						<div class="text"><span>우편번호</span></div>
						<div class="input"><input type="text" name="post" value="<%= memberDetail.getPost() == null ? "-" : memberDetail.getPost() %>" disabled></div>
					</div>
					<div class="address">
						<div class="text"><span>주소</span></div>
						<div class="input"><input type="text" name="address" value="<%= memberDetail.getAddress() == null ? "-" : memberDetail.getAddress() %>" disabled></div>
					</div>
					<div class="bank">
						<div class="text"><span>은행 명</span></div>
						<div class="input"><input type="text" name="bank" value="<%= memberDetail.getBank() == null ? "-" : memberDetail.getBank() %>" disabled></div>
					</div>
					<div class="bankAccount">
						<div class="text"><span>계좌번호</span></div>
						<div class="input"><input type="text" name="bankAccount" value="<%= memberDetail.getBankAccount() == null ? "-" : memberDetail.getBankAccount() %>" disabled></div>
					</div>
					<div class="mileage">
						<div class="text"><span>마일리지</span></div>
						<div class="input"><input type="text" name="mileage" value="<%= memberDetail.getMileage() < 0 ? "-" : memberDetail.getMileage() %>" disabled></div>
					</div>
					<div class="homepage">
						<div class="text"><span>홈페이지</span></div>
						<div class="input"><input type="text" name="homepage" value="<%= memberDetail.getHomepage() == null ? "-" : memberDetail.getHomepage() %>" disabled></div>
					</div>
					<div class="category">
						<div class="text"><span>카테고리</span></div>
						<div class="input"><input type="text" name="category" value="<%= memberDetail.getCategory() == null ? "-" : memberDetail.getCategory() %>" disabled></div>
					</div>
					<div class="intro">
						<div class="text"><span>소개글</span></div>
						<div class="input"><input type="text" name="intro" value="<%= memberDetail.getIntro() == null ? "-" : memberDetail.getIntro() %>" disabled></div>
					</div>
					<div class="joinDate">
						<div class="text"><span>가입일</span></div>
						<div class="input"><input type="text" name="joinDate" value="<%= memberDetail.getJoinDate() == null ? "-" : memberDetail.getJoinDate() %>" disabled></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
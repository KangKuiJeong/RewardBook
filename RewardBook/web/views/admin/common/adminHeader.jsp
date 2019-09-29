<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin"%>
<%
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
	margin : 0px 0px 0px 0px;
}

.header {
	width : 100%;
	height : 65px;
	background : #0B0A34;
	font-family: 'Noto Sans KR', sans-serif;
}
.header_area {
	width : 1400px;
	height : 100%;
	margin : 0px 20px 0px 20px;
}
.header_area .content[name=order1], .header_area .content[name=order2] {
	height : 100%;
	float : left;
}
.header_area .content[name=order3], .header_area .content[name=order4] {
	height : 100%;
	float : right;
}
.header_area .content[name=order1] {
	width : 150px;
	line-height : 87px;
}
.header_area .content[name=order2] {
	width : 70px;
	font-size : 17px;
	font-weight : normal;
	text-align : center;
	line-height : 65px;
	text-decoration: none;
}
.header_area .content[name=order2] a {
	color : white;
	text-decoration: none;
}
.header_area .content[name=order3] {
	width : 170px;
	font-size : 17px;
	font-weight : normal;
	text-align : center;
	line-height : 65px;
	color : white;
}
.header_area .content[name=order3] a {
	color : white;
	text-decoration: none;
}
.header_area .content[name=order4] {
	width : 270px;
	font-size : 17px;
	font-weight : normal;
	text-align : center;
	line-height : 65px;
	color : white;
}
.header_area .content[name=order4] span {
	color : #ffb202;
}
</style>
</head>
<body>
<% if (loginAdmin != null) { %>
<div class="header">
	<div class="header_area">
		<div class="content" name="order1"><a href="/RewardBook/index.jsp"><img src="/RewardBook/resources/images/admin/admin_sampleLogo.png" width="150" alt="logo"></a></div>
		<div class="content" name="order2"><a href="/RewardBook/views/admin/adminMain.jsp">관리자</a></div>
		<div class="content" name="order3">
			<a href="#" onclick="logoutCheck();">로그아웃</a>
			<script>	
			//로그아웃 confirm 창
			function logoutCheck(){
				
				var check = confirm("정말 로그아웃 하시겠습니까?");
				if(!check) {
					history.go(-1);
				} 
				else {
					location.href = '/RewardBook/logout';
				}
			}	
			</script>
		</div>
		<div class="content" name="order4"><span><%= loginAdmin.getaName() %></span> 님 반갑습니다.</div>
		
	</div>
</div>
<% } %>
</body>
</html>
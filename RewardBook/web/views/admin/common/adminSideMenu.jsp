<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menu = (String)request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sideMenu {
	width : 200px;
	height : 800px;
	float : left;
}
.sideMenu_area {
	width : 100%;
	height : 100%;
	background : #0B0A34;
	float : left;
}
.sideMenu_area .menu {
	padding : 0px;
}
.sideMenu_area .menu .button {
	width : 100%;
	height : 50px;
	list-style : none;
	margin : 20px 0px 0px 0px;
	text-align : center;
	font-size : 20px;
	font-weight : 600;
	line-height : 50px;
}
.sideMenu_area .menu .button a {
	text-decoration : none;
	color : white;
}
<% if (menu != "") { %>
.sideMenu_area .menu .button#b<%= menu %> {
	background : white;
}
.sideMenu_area .menu .button a#a<%= menu %> {
	color : #0B0A34;
}
<% } %>
</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".sideMenu_area .menu .button").on("mouseover", function() {
		$(this).css("text-decoration", "underline");
	});
	$(".sideMenu_area .menu .button").on("mouseout", function() {
		$(this).css("text-decoration", "none");
	});
})
</script>
</head>
<body>
<div class="sideMenu">
	<div class="sideMenu_area">
		<ul class="menu">
			<li class="button" id="bmember"><a id="amember" href="/RewardBook/m_list?page=member&movePage=1">회원</a></li>
			<li class="button" id="bproject"><a id="aproject" href="/RewardBook/p_list_a?page=project&movePage=1">프로젝트</a></li>
			<li class="button" id="bpermission"><a id="apermission" href="/RewardBook/pp_list?page=permission&movePage=1">승인</a></li>
			<li class="button" id="binquiry"><a id="ainquiry" href="/RewardBook/iq_list_a?page=inquiry&movePage=1">문의</a></li>
			<li class="button" id="bdeclare"><a id="adeclare" href="/RewardBook/dc_list_a?page=declare&movePage=1">신고</a></li>
		</ul>
	</div>
</div>
</body>
</html>
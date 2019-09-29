<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member, java.util.ArrayList, java.sql.Date" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int currentPage = (int)request.getAttribute("currentPage");
	int maxPage = (int)request.getAttribute("maxPage");
	int pageCount = (int)request.getAttribute("pageCount");
	String s1check1 = (String)request.getAttribute("s1check1");
	String s1check2 = (String)request.getAttribute("s1check2");
	String s2select1 = (String)request.getAttribute("s2select1");
	String s2text1 = (String)request.getAttribute("s2text1");
	String alertMessage = (String)request.getAttribute("alert");
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
}
.main_area1 .main_area1_section1{
	font-size : 35px;
	font-weight : 600;
}

.main_area2{
	width : 100%;
	height : 70px;
}
.main_area2_section1 .checkbox{
	width : 300px;
	height : 50px;
	margin : 20px 0px 0px 20px;
	float : left;
}
.main_area2_section1 .checkbox span {
	font-size : 20px;
	margin : 0px 0px 0px 20px;
	float : left;
}
.main_area2_section2{
	float : right;
}
.main_area2_section2 .search{
	width : 340px;
	height : 50px;
	margin : 20px 0px 0px 0px;
	float : left;
}
.main_area2_section2 .search select, .main_area2_section2 .search input, .main_area2_section2 .search div{
	margin : 0px 0px 0px 10px;
	float : left;
}

.main .main_area3{
	width : 1240px;
	height : 630px;
}

.main_area3_section1 {
	width : 1200px;
	height : 630px;
	margin : 0px 0px 0px 40px;
}
.main_area3_section1 .table {
	width : 1200px;
	height : 500px;
}
.main_area3_section1 table th {
	width : 50px;
	height : 40px;
	font-size : 19px;
	font-weight : bold;
	border-top : 2px solid black;
	border-bottom : 2px solid black;
	padding-top : 4px;
	padding-bottom : 4px;
	text-align : center;
	word-wrap : break-word;
	word-break : break-all;
}
.main_area3_section1 table td {
	height : 35px;
	font-size : 17px;
	font-weight : normal;
	border-bottom : 1px solid gray;
	padding-top : 3px;
	padding-bottom : 3px;
	text-align : center;
	word-wrap : break-word;
	word-break : break-all;
	table-layout: fixed;
}
.main_area3_section1 .page {
	width : 1200px;
	height : 130px;
	text-align: center;
	display: flex;
	justify-content : center;
}
.main_area3_section1 .pageButton {
	width : 40px;
	height : 30px;
	cursor : pointer;
	line-height : 27px;
	margin : 20px 0px 0px 20px;
	border : 1px solid gray;
	border-radius : 10px;
}
.main_area3_section1 .pageButton#page3 {
	width : 50px;
	border : 2px solid black;
	margin : 18px 0px 0px 20px;
	font-weight : 900;
	cursor : default;
}
.main_area3_section1 .pageEmpty {
	width : 40px;
	height : 30px;
	margin : 20px 0px 0px 20px;
	border-radius : 10px;
}
</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		var alertFlag = true;
		<% if(alertMessage != null) { %>
			if (alertFlag) {
				alert('<%= alertMessage %>');
				alertFlag = false;
			}
		<% } %>
		
		$(".main_area2_section2 .search .submit").on("click", function() {
			var link = "page=member&movePage=1";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});
		
		$(".main_area3_section1 .pageButton#page0").on("click", function() {
			var link = "page=member&movePage=1";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});
		
		$(".main_area3_section1 .pageButton#page1").on("click", function() {
			var link = "page=member&movePage=<%= currentPage - 2 %>";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});

		$(".main_area3_section1 .pageButton#page2").on("click", function() {
			var link = "page=member&movePage=<%= currentPage - 1 %>";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});

		$(".main_area3_section1 .pageButton#page4").on("click", function() {
			var link = "page=member&movePage=<%= currentPage + 1 %>";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});

		$(".main_area3_section1 .pageButton#page5").on("click", function() {
			var link = "page=member&movePage=<%= currentPage + 2 %>";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});
		
		$(".main_area3_section1 .pageButton#page6").on("click", function() {
			var link = "page=member&movePage=<%= maxPage %>";
			link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
			link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
			link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
			link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
			location.href="/RewardBook/m_list?" + link;
		});

		$(".main_area3_section1 .table table tr").on("mouseover", function() {
			var str = $(".main_area3_section1 .table table tr:eq('" + $(".main_area3_section1 .table table tr").index(this) + "')").children("td:eq('0')").text();
			if ($(".main_area3_section1 .table table tr").index(this) != 0 && str != "")
				$(this).css("background", "#cccccc");
		});
		$(".main_area3_section1 .table table tr").on("mouseout", function() {
			$(this).css("background", "none");
		});
		
		//페이지 클릭 함수 하나로 통일시켜보기
		
	});

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
			<form method="get" action="m_list">
			<input type="hidden" name="page" value="member">
				<div class="main_area2_section1">
					<div class="checkbox">
						<span><input type="checkbox" name="s1check1" <% if (s1check1.equals("true")) { %>checked="checked"<% } %>> 개인회원</span>
						<span><input type="checkbox" name="s1check2" <% if (s1check2.equals("true")) { %>checked="checked"<% } %>> 기업회원</span>
					</div>
				</div>
				<div class="main_area2_section2">
					<div class="search">
						<select name="s2select1" style="width : 100px; height : 30px; font-size : 17px;">
							<option value="회원번호" <% if (s2select1.equals("회원번호")) { %>selected<% } %>>회원 번호</option>
							<option value="사업자번호" <% if (s2select1.equals("사업자번호")) { %>selected<% } %>>사업자 번호</option>
							<option value="아이디" <% if (s2select1.equals("아이디")) { %>selected<% } %>>아이디</option>
							<option value="이름" <% if (s2select1.equals("이름")) { %>selected<% } %>>이름</option>
							<option value="전화번호" <% if (s2select1.equals("전화번호")) { %>selected<% } %>>전화번호</option>
						</select>
						<input name="s2text1" type="text"  <% if (!s2text1.equals("")) { %>value="<%= s2text1 %>"<% } %> style="width : 150px; height : 24px; font-size : 17px;">
						<div class="submit" style="width : 30px; height : 30px; cursor : pointer"><img src="resources/images/admin/admin_submit.png" style="width : 30px; height : 30px;"></div>
					</div>
				</div>
			</form>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<div class="table">
					<table cellspacing="0" cellpadding='0' style="width : 1175px; table-layout: fixed;">
						<tr><th style="width : 50px">회원 번호</th><th style="width : 50px">사업자 번호</th><th style="width : 120px">아이디</th><th style="width : 50px">이름</th><th style="width : 50px">전화번호</th><th style="width : 50px">가입일</th></tr>
						<% for (Member member : list) { %>
							<tr OnClick="location.href='/RewardBook/m_detail?page=member&u_no=<%= member.getuNo() %>'" style="cursor : pointer;"><td><%= member.getuNo() %></td><td><%= (member.getuBno() == null ? "-" : member.getuBno()) %></td><td><%= member.getId() %></td><td><%= member.getName() %></td><td><%= member.getPhone() %></td><td><%= member.getJoinDate() %></td></tr>
						<% } %>
						<% for (int a = list.size(); a < 10; a++) { %>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
						<% } %>
					</table>
				</div>
				<div class="page">
					<% if (currentPage > 3) { %>
						<div class="pageButton" id="page0">
							<span><<</span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
					<% if (currentPage > 2) { %>
						<div class="pageButton" id="page1">
							<span><%= currentPage - 2 %></span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
					<% if (currentPage > 1) { %>
						<div class="pageButton" id="page2">
							<span><%= currentPage - 1 %></span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
					<div class="pageButton" id="page3">
						<span><%= currentPage %></span>
					</div>
					<% if (currentPage < maxPage ) { %>
						<div class="pageButton" id="page4">
							<span><%= currentPage + 1 %></span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
					<% if (currentPage + 1 < maxPage) { %>
						<div class="pageButton" id="page5">
							<span><%= currentPage + 2 %></span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
					<% if (currentPage + 2 < maxPage) { %>
						<div class="pageButton" id="page6">
							<span>>></span>
						</div>
					<% } else { %>
						<div class="pageEmpty"></div>
					<% } %>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
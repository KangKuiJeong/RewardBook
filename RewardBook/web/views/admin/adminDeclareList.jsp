<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.model.vo.Inquiry, java.util.ArrayList, java.sql.Date" %>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
	int currentPage = (int)request.getAttribute("currentPage");
	int maxPage = (int)request.getAttribute("maxPage");
	int pageCount = (int)request.getAttribute("pageCount");
	String s1check1 = (String)request.getAttribute("s1check1");
	String s1check2 = (String)request.getAttribute("s1check2");
	String s1check3 = (String)request.getAttribute("s1check3");
	String s1check4 = (String)request.getAttribute("s1check4");
	String s2select1 = (String)request.getAttribute("s2select1");
	String s2text1 = (String)request.getAttribute("s2text1");
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
	width : 300px;
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
	width : 500px;
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

	function linkString (page) {
		var link = "page=inquiry&movePage=" + page;
		link += "&s1check1=" + $(".main_area2_section1 .checkbox span input[name=s1check1]").is(":checked");
		link += "&s1check2=" + $(".main_area2_section1 .checkbox span input[name=s1check2]").is(":checked");
		link += "&s1check3=" + $(".main_area2_section1 .checkbox span input[name=s1check3]").is(":checked");
		link += "&s1check4=" + $(".main_area2_section1 .checkbox span input[name=s1check4]").is(":checked");
		link += "&s2select1=" + $(".main_area2_section2 .search select[name=s2select1]").val();
		link += "&s2text1=" + $(".main_area2_section2 .search input[name=s2text1]").val();
		return link;
	}

	$(function() {

		$(".main_area2_section2 .search .submit").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(1);
		});
		
		$(".main_area3_section1 .pageButton#page0").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(1);
		});
		
		$(".main_area3_section1 .pageButton#page1").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(<%= currentPage - 2 %>);
		});

		$(".main_area3_section1 .pageButton#page2").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(<%= currentPage - 1 %>);
		});

		$(".main_area3_section1 .pageButton#page4").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(<%= currentPage + 1 %>);
		});

		$(".main_area3_section1 .pageButton#page5").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(<%= currentPage + 2 %>);
		});
		
		$(".main_area3_section1 .pageButton#page6").on("click", function() {
			location.href="/RewardBook/dc_list_a?" + linkString(<%= maxPage %>);
		});

		$(".main_area3_section1 .table table tr").on("mouseover", function() {
			if ($(".main_area3_section1 .table table tr").index(this) != 0)
				$(this).css("text-decoration", "underline");
		});
		$(".main_area3_section1 .table table tr").on("mouseout", function() {
			$(this).css("text-decoration", "none");
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
				<span>신고 관리</span>
			</div>
		</div>
		<div class="main_area2">
			<div class="main_area2_section1">
				<div class="checkbox">
					<span><input type="checkbox" name="s1check1" <% if (s1check1.equals("true")) { %>checked="checked"<% } %>> 답변</span>
					<span><input type="checkbox" name="s1check2" <% if (s1check2.equals("true")) { %>checked="checked"<% } %>> 미답변</span>
					<span><input type="checkbox" name="s1check3" <% if (s1check3.equals("true")) { %>checked="checked"<% } %>> 확인</span>
					<span><input type="checkbox" name="s1check4" <% if (s1check4.equals("true")) { %>checked="checked"<% } %>> 미확인</span>
				</div>
			</div>
			<div class="main_area2_section2">
				<div class="search">
					<select name="s2select1" style="width : 100px; height : 30px; font-size : 17px;">
						<option value="번호" <% if (s2select1.equals("번호")) { %>selected<% } %>>번호</option>
						<option value="등록인" <% if (s2select1.equals("등록인")) { %>selected<% } %>>등록인</option>
						<option value="제목" <% if (s2select1.equals("제목")) { %>selected<% } %>>제목</option>
						<option value="답변인" <% if (s2select1.equals("답변인")) { %>selected<% } %>>답변인</option>
					</select>
					<input name="s2text1" type="text"  <% if (!s2text1.equals("")) { %>value="<%= s2text1 %>"<% } %> style="width : 150px; height : 24px; font-size : 17px;">
					<div class="submit" style="width : 30px; height : 30px; cursor : pointer"><img src="resources/images/admin/admin_submit.png" style="width : 30px; height : 30px;"></div>
				</div>
			</div>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<div class="table">
					<table cellspacing="0" cellpadding='0' style="width : 1175px; table-layout: fixed;">
						<tr><th style="width : 40px">번호</th><th style="width : 30px">등록인</th><th style="width : 120px">제목</th><th style="width : 50px">등록일</th><th style="width : 30px">확인여부</th><th style="width : 30px">답변인</th><th style="width : 50px">답변일</th></tr>
						<% for (Inquiry inquiry : list) { %>
							<tr OnClick="location.href='/RewardBook/dc_detail_a?page=declare&iq_no=<%= inquiry.getIq_no() %>'" style="cursor : pointer;"><td><%= inquiry.getIq_no() %></td><td><%= inquiry.getU_name() %></td><td><%= inquiry.getIq_title().length() > 20 ? inquiry.getIq_title().substring(0, 20) + "..." : inquiry.getIq_title() %></td><td><%= inquiry.getIq_date() %></td><td><%= inquiry.getIq_oc() %></td><td><%= inquiry.getA_name() == null ? "-" : inquiry.getA_name() %></td><td><%= inquiry.getIq_rdate() == null ? "-" : inquiry.getIq_rdate() %></td></tr>
						<% } %>
						<% for (int a = list.size(); a < 10; a++) { %>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
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
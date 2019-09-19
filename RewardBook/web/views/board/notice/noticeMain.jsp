<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="board.notice.model.vo.Notice, java.util.ArrayList, member.model.vo.Member, java.sql.Date"%>

<%
	ArrayList<Notice> list = 
		(ArrayList<Notice>)request.getAttribute("list");

 	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
 	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
 	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
 	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
 	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	
 	String resultMessage = (String)session.getAttribute("result");
	session.removeAttribute("result");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewordBook</title>
<!-- 웹폰트 연결 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">

<style type="text/css">
main {
	width: 100%;
	margin: 0 auto;
}

html, body, div, main, section, article, h1, h2, h3, h4, p, blockquote,
	ul, ol, li, dl, dt, dd, table, thead, tbody, tr, th, td {
	margin: 0;
	padding: 0;
}

main, section, article {
	display: block;
}

ul, ol {
	list-style: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

em, i {
	font-style: normal;
}

em.category, em.status close, h3.title, span.author, span.created-at {
	padding: 3px;
}

em.category {
	color: #ffb202;
}

/* //기본 전체 속성*/
.ui-header {
	margin: 0 auto;
	padding-top: 48px;
	padding-bottom: 24px;
	text-align: left;
	width: 100%;
	max-width: 800px;
}

.ui-header .title {
	line-height: 40px;
	color: rgba(0, 0, 0, 0.84);
	font-size: 48px;
	font-weight: 700;
	text-align: center;
}

.ui-tabs ul, .ui-tabs li, .ui-tabs li a {
	display: block;
	height: 100%;
}

.ui-tabs ul {
	margin: 0 auto;
	padding: 0 16px;
	height: 68px;
	text-align: left;
	line-height: 0;
	white-space: nowrap;
	font-size: 0;
}

.ui-tabs ul::after {
	display: block;
	clear: both;
	content: '';
}

.ui-tabs li {
	display: inline-block;
	margin-right: 18px;
	height: 48px;
	margin: 0 9px;
}

.ui-tabs a {
	display: block;
	line-height: 48px;
	letter-spacing: -0.3px;
	color: #16191f;
	font-size: 17px;
	font-weight: 400;
	box-sizing: border-box;
}

.ui-tabs a:hover, .ui-tabs a:focus {
	color: rgba(0, 0, 0, 0.84);
}

.ui-tabs li.active>a {
	border-bottom: 3px solid black;
	color: black;
	font-weight: 500;
}

.ui-tabs ul {
	text-align: center;
	width: 100%;
	max-width: 700px;
}

.noticeboard li {
	width: 50%;
	margin: 0 auto;
	vertical-align: middle;
	border-bottom: 0.1px groove #44484b;
	padding: 20px 0px 45px 0;
}

.board-footer {
	text-align: center;
}

.info {
	display: inline;
	float: right;
}

.thumb {
	display: inline;
	height: 100%;
	width: 100%;
}

.thumb img {
	margin: 0 auto;
	width: 144px;
	height: 108px;
	display: block;
	text-align: center;
}

.board-footer {
	padding: 0 30px 160px;
	text-align: center;
}

.prev-page {
	background-color: #fff;
	color: #8c8c8c;
	border: 1px solid #fff;
	font-size: 20px;
}

.next-page {
	background-color: #fff;
	color: #8c8c8c;
	border: 1px solid #fff;
	font-size: 20px;
}

.board-footer .search .filter-container .filter {
	height: 38px;
	width: 115px;
	background-color: #fff;
	padding: 0 0 0 10px;
	width: 110%;
	text-align: center;
	color: #34383a;
	font-size: 15px;
	display: inline;
}

.filter-container {
	display: inline-block;
}

.field {
	display: inline-block;
}

.ui-header-all {
	background-color: #ffb202;
}

label.text-hidden {
	display: block;
	margin-top: -1px;
	height: 1px;
	overflow: hidden;
	text-indent: -9999px;
}

.searchtext {
	border: 1px solid #dadce0;
	padding-right: 64px;
	padding-left: 10px;
	width: 60%;
	line-height: 36px;
	font-size: 15px;
}

.searchbt {
	position: absolute;
	border: 1px solid #dadce0;
	background-color: #f5f7fa;
	width: 100%;
	max-width: 64px;
	line-height: 36px;
	color: #34383a;
	font-size: 15px;
}

.desktopbutton_pagelist a {
	padding: 0px 9px;
	color: #565656;
}

.bt1 {
	padding: 10px;
	background-color: white;
	border: 1px solid black;
	margin: 10px;
	margin-left: 1100px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<!-- 네비게이션 영역 -->
	<!-- 헤더부분 include -->
	<%@ include file="../../../views/common/header.jsp"%>


	<main class="notice_main">
	<div class=ui-header-all>
		<div class="ui-header">
			<h2 class="title">공지사항</h2>
		</div>
	
		<br><br>

		<!-- 전체/공지/이벤트 탭 -->
		<div class="ui-tabs">
			<ul>
				<li class="active"><a href="#">전체</a></li>
				<li><a href="#1">공지</a></li>
				<li><a href="#2">이벤트</a></li>
			</ul>
		</div>

	</div>
	<!-- //all-ui-header --> <!-- //전체/공지/이벤트 탭 --> <!-- 공지사항게시판 -->
	<div class="noticeboard">
		<ul>

			<% for(Notice n : list){ %>
			<li><a class="article"> <em class="category"><%= n.getNt_type() %></em>
					<em class="status closed">진행중</em>
					<div class="info">
						<a href="/RewardBook/nlist?nt_no=<%= n.getNt_no() %>"></a>
						<div class="thumb">
							<% if(n.getNt_img() != null){ %>
							<img src="/RewardBook/resources/noticeimg/<%= n.getNt_img()%>">
							<% } %>
						</div>
					</div>
					<h3 class="title">
						<a href="/RewardBook/ndetail?nt_no=<%= n.getNt_no() %>"> <%= n.getNt_title() %></a>
					</h3> <span class="author">리워드북</span><span class="created-at"><%=n.getNt_date() %></span>

			</a></li>
			<% } %>

		</ul>

	</div>
	<!-- 글쓰기버튼 -->
	<div>
		<% if(loginAdmin != null && loginAdmin.getaNo().substring(0,1).equals("C")){ %>
		<input class="bt1" type="button" name="noticeinsert" value="글쓰기"
			onclick="location.href='views/board/notice/noticeInsertView.jsp'"></input>
		<% } %>
	</div><!-- //글쓰기버튼 --> 
	<br><br><br>

	<!--// 공지사항게시판 -->
	<!-- 페이징 -->
			<div class="page">
				<div style="text-align: center;">
					<% if(currentPage <= 1){ %>
					<<<&nbsp;
					<% }else{ %>
					<a href="/RewardBook/nlist?page=1"><<<</a>
					<% } %>
					<!-- 가운데 표시할 페이지 그룹 숫자 링크 설정 -->
					<% if((currentPage - 10) < startPage 
		&& (currentPage - 10) > 1){ %>
					<a href="/RewardBook/nlist?page=<%= startPage - 10 %>">이전</a>
					<% }else{ %>
					이전&nbsp;
					<% } %>
					<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
					<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
					<font size="4" color="#ffc107" margin="15px"><b><%= p %></b></font>
					<% }else{ %>
					<a href="/RewardBook/nlist?page=<%= p %>"><%= p %></a>
					<% }} %>
					<!-- 현재 페이지의 다음 그룹 표시 처리 -->
					<% if((currentPage + 10) > endPage 
		&& (currentPage + 10) < maxPage){ %>
					<a href="/RewardBook/nlist?page=<%= endPage + 10 %>">다음</a>
					<% }else{ %>
					다음&nbsp;
					<% } %>
					<% if(currentPage >= maxPage){ %>
					>>>&nbsp;
					<% }else{ %>
					<a href="/RewardBook/nlist?page=<%= maxPage %>">>>></a>
					<% } %>
					&nbsp;
				</div>
			</div>
				<!-- //페이징 -->
				<br><br>
				<div class="board-footer">
				<div class="search">
					<form method="post" id="searchNotice" class="searchform" action="/RewardBook/nsearch">
						<div class="filter-container">
							<select id="searchSelectInBoard" class="filter" name="nt_search">
								<option value="tc">제목+내용</option>
								<option value="t">제목</option>
								<option value="c">내용</option>
							</select>
						</div>
						<div class="field">
							<label class="text-hidden"></label> 
							<input id="searchTextInBoard" 
							name="searchtext"
								class="searchtext"
								 type="text" 
								 placeholder="검색어 입력"></input>
							<button class="searchbt" type="submit">검색</button>
						</div>
					</form>
				</div>
				</div>		
	</main>
	<!-- //컨텐츠 영역 -->

	<!-- 푸터부분 include -->
	<%@ include file="../../../views/common/footer.jsp"%>
</body>
</html>
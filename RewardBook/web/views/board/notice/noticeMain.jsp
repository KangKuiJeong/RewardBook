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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
<link rel="stylesheet" href="resources/css/board/noticeMain.css">


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
			<!-- <ul>
				<li class="active"><a href="#">전체</a></li>
				<li><a href="#1">공지</a></li>
				<li><a href="#2">이벤트</a></li>
			</ul> -->
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
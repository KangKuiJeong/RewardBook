<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchTitle = (String)request.getAttribute("searchTitle");
 	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/board/searchNull.css">
<title>검색결과 없음</title>
</head>
<body>
	
	<!-- 헤더부분 include -->
	<%@ include file="../../common/header.jsp" %>
	
	<div id="nullWrap">
		<p id="okMessage">'<%= searchTitle %>'에 대한 검색결과를 찾을 수 없습니다.</p>
		<ul>
			<li id="goProject"><a href="/RewardBook/nlist">다시검색</a></li>
			<li id="goProject"><a href="/RewardBook/index.jsp">메인으로</a></li>
		</ul>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../../common/footer.jsp" %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<title>검색결과 없음</title>
<style type="text/css">
main{ margin:0 auto !important; width: 50%;}

.nullWrap{margin: 100px 0px 50px 0px;}
.okMessage {font-size: 40px; text-align:center; margin-bottom:80px}
.gogo{margin:0 auto;width:40%;}
.goProject{color: black;  text-decoration: none; border: 1px solid #737070; padding: 10px; margin: 15px; text-align:center; }
a{color: black;  text-decoration: none;}
.goProject:hover{ background-color:#ffb202;  border: 1px solid #ffb202; color:white; }

</style>
</head>
<body>
<!-- 헤더부분 include -->
<%@ include file="../common/header.jsp" %>
	
	<main>	
	
	<div id="nullWrap" class="nullWrap">
		<p id="okMessage" class="okMessage">저장된 메모가 없습니다.</p>
		<ul class="gogo">
		
			<a href="/RewardBook/views/mypage/mypage.jsp"><li id="goProject" class="goProject" >마이페이지로 이동하기</li></a>
			<a href="/RewardBook/index.jsp"><li id="goProject" class="goProject" >메인으로 이동하기</li></a>
			<a href="/RewardBook/p_list"><li id="goProject" class="goProject" >프로젝트 둘러보기로 이동하기</li></a>
		
		</ul>

	
	</main>
	

<!-- 푸터부분 include -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>
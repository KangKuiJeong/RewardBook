<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.faq.model.vo.Faq" %>

  
 <%	
	Faq q = (Faq)request.getAttribute("list");
	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" >
<link rel="stylesheet" href="resources/css/board/faqUpdateView.css">

<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">


</style>
</head>
<body>
<%@ include file="../../../views/common/header.jsp" %>
	
<main id="qinmanin">

	<div class=faqinsert-ui-header-all>

		<div class="ui-header">
			<h1 class="title" align="center" margin="0 auto">FAQ 글 수정</h1>
		</div>


<form action="/RewardBook/fupdate" method="post" >
<input type="hidden" name="faq_no" value="<%= q.getfaq_no() %>">
<div class="insertT">
<ul>
<li class="textT"><h3 style="color:white">제목</h6><input type="text" name="faq_title" placeholder="제목을 입력하세요" name="faq_title" size="50" value="<%= q.getfaq_title() %>"></li>
<li class="textT"><h3 style="color:white">내용</h6><textarea name="faq_text" placeholder="내용을 입력하세요" ><%= q.getFaq_text() %></textarea></li>

	</select>
</li>
<li class="bt">
	<input class="bt1" id="Btn" type="submit" value="수정" onclick="alert('수정했습니다.')" >
	&nbsp; <input class="bt2"type="reset" value="취소" OnClick="javascript:history.back(-1)">
	 &nbsp; <a href="/RewardBook/flist" class="bt3">목록가기</a> 
	
</li>

</ul>
</div>
</form>
</main>
<!-- 푸터부분 include -->
	<%@ include file="../../../views/common/footer.jsp" %>
</body>
</html>
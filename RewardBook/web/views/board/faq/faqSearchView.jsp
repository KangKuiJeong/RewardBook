<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"   import="board.faq.model.vo.Faq, java.util.ArrayList, member.model.vo.Member" %>
	
 <%
	ArrayList<Faq> list = 
		(ArrayList<Faq>)request.getAttribute("list");
 	
%>   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ검색성공페이지</title>

<!-- 웹폰트 연결 -->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
<link rel="stylesheet" href="resources/css/board/faqSearchView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	$(".faq_text").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	$(".faq_title").click(function()
	{
	$(this).next(".faq_text").slideToggle(500);
	});
	});

			   
 </script>
</head>
<body>
<!-- 헤더부분 include -->
	<%@ include file="../../../views/common/header.jsp" %>
	
	<!-- 컨텐츠 영역 -->
<main>
      <div class="ui-header">
         <h2 class="Faqheader">FAQ</h2>
      </div>

 
      <div>
   <% if(loginAdmin != null && loginAdmin.getaNo().substring(0,1).equals("C")){ %>
      <input type="button" class="faqinsert" name="faqinsert" value="글쓰기" onclick="location.href='views/board/faq/faqInsertView.jsp'"></input>
      <% } %>
      </div>
<br><br>
		<div id="accordion">
	<% for(Faq q : list){ %>
			
		<div class="faq_title"><%= q.getfaq_title() %> <a href="/RewardBook/flist?faq_no=<%= q.getfaq_no() %>"></a></div>
			
		<div class="faq_text"><%= q.getFaq_text() %>		
		<% if(loginAdmin != null && loginAdmin.getaNo().substring(0,1).equals("C")){ %>		
				<div class="delup">	
				<a href="/RewardBook/fupdate?faq_no=<%= q.getfaq_no() %>&faq_title=<%= q.getfaq_title() %>&faq_text=<%= q.getFaq_text() %>&faq_oc=<%= q.getFaq_oc() %>">수정</a> 
				<a href="/RewardBook/fdelete?faq_no=<%= q.getfaq_no() %>">삭제</a>
			<% } %>	
				</div>
</div>			

	<% } %>
			</div>
		<!-- faqlist -->
		<br>
		<br>
		<ul>
			<li class="backLi"><a id="back" href="/RewardBook/flist">목록으로돌아가기</a></li>
		</ul>
		


				
				
	</main>

	<!-- //컨텐츠 영역 -->

	<!-- 하단 영역 -->

	<!-- 푸터부분 include -->
	<%@ include file="../../../views/common/footer.jsp" %>

</body>
</html>
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
<title>RewordBook</title>

<!-- 웹폰트 연결 -->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
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
<style type="text/css">
.Faqheader{
	text-align:center;
    padding-top: 100px;
    font-size: 50px;
    margin-bottom: 70px;
}
.faq_title:hover{
	color:#ffb202;
}
.faq_text{

height:150px;
  padding: 50px;
  background-color: #ffffff;
  border-bottom: solid 1px #9e9e9e5c;
  
}

.faq_title {
  padding: 5px;  
  background-color: #ffffff;
  border-bottom: solid 1px #9e9e9e5c;
 	padding: 10px 15px 17px 20px;
    margin: 10px 15px 10px 15px;

}


.faq_text {
  padding:20px 0px 20px 35px;
  display: none;
  
}
main {
	
	margin: 0 auto;
	width:50%;

}
.faqinsert input{text-align: center;float:right;padding: 8px;margin: 0px 15px 5px 3px;}
.faqinsert{
    text-decoration: none;
    padding: 10px 10px 10px 10px;
    float:right;
    
}
.board-footer {padding: 0 30px 160px;text-align: center;}
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

.filter-container {display: inline-block;}
.search-form {
	border: 1px solid #dadce0;
	padding-right: 64px;
	padding-left: 10px;
	width: 20%;
	line-height: 36px;
	font-size: 15px;
}

.field { display:inline-block !important;}
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

.fdel, .fupdate{float:right;margin :4px;padding :4px;}
.delup {float:right; margin-top:30px;}
.delup a {
    background-color: white;
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #000;
    color: black;
}
.delup a:hover {background:#FCFCFC;}
.backLi { width:150px; margin:0 auto; margin-bottom:55px;}

#back{
    text-decoration: none;
    border: 1px solid #353333;
    color: #353333;
    padding: 10px;
}
</style>
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
				<a href="/RewardBook/fupdate?faq_no=<%= q.getfaq_no() %>&faq_title=<%= q.getfaq_title() %>&faq_text=<%= q.getFaq_text() %>">수정</a> 
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
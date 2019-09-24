<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"   import="board.faq.model.vo.Faq, java.util.ArrayList, member.model.vo.Member" %>
   
 <%
   ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
    
/*   String resultMessage = (String)session.getAttribute("result");
   session.removeAttribute("result"); 
 */
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ메인페이지</title>

<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
<link rel="stylesheet" href="resources/css/board/faqMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="../../../resources/js/jquery-3.4.1.min.js"></script> -->

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
<div class="accordion">
<% for(Faq q : list){ %>

<div class="faq_title"><%= q.getfaq_title() %><a href="/RewardBook/flist?faq_no=<%= q.getfaq_no() %>"></a></div>
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
<br><br>
<!-- 검색 -->
 <!-- 검색 -->
         
         <div class="board-footer">
         <div class="search">
            <form method="post" id="news-board-search" class="searchform" action="/RewardBook/fsearch">
               <div class="filter-container">
                  <select id="searchSelectInBoard" class="filter" name="faq_search">
                     <option value="tc">제목+내용</option>
                     <option value="t">제목</option>
                     <option value="c">내용</option>
                  </select>
               </div>

               <div class="field">
                  <label class="text-hidden"></label>
                   <input id="searchTextInBoard" 
                         name="searchtext"
                        class="search-form" 
                        type="text" 
                        placeholder="검색어 입력"></input>
                  <button class="searchbt" type="submit">검색</button>
               </div>
            </form>
            </div>
            </div>
            <br>
      		<br>
</main>

   <!-- 푸터부분 include -->
   <%@ include file="../../../views/common/footer.jsp" %>

</body>
</html>
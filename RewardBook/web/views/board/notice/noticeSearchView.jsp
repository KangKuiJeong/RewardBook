<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    import="board.notice.model.vo.Notice, java.util.ArrayList, member.model.vo.Member, java.sql.Date" %>
    
<%
	ArrayList<Notice> list = 
		(ArrayList<Notice>)request.getAttribute("list");
%>   	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 검색성공 페이지</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
<link rel="stylesheet" href="resources/css/board/noticeSearchView.css">
</head>
<body>
 <!-- 네비게이션 영역 -->
 <!-- 헤더부분 include -->
	<%@ include file="../../../views/common/header.jsp" %>
   

 <main class="notice_main">
    <div class = ui-header-all>
 
      <div class="ui-header">
        <h2 class="title">공지사항</h2>
      </div>
    
      <br>
      <br>
    
   <!-- 전체/공지/이벤트 탭 -->
      <div class="ui-tabs">
        <ul>
        
          <li class="active">
          	<a href="#">전체</a>
          </li>
          
           <li >
              <a href="#1">공지</a>
           </li>
          
           <li >
              <a href="#2">이벤트</a>
           </li>
          
          
        </ul>
      </div>
  
     </div><!-- //all-ui-header -->
      <!-- //전체/공지/이벤트 탭 -->
   
	  
	  <!-- 공지사항게시판 -->
      <div class="noticeboard">
        <ul>
        
          <% for(Notice n : list){ %>
            <li>
              <a class="article">
              <em class="category"><%= n.getNt_type() %></em>
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
                  <a href="/RewardBook/ndetail?nt_no=<%= n.getNt_no() %>"><%= n.getNt_title() %></a></h3>
                  <span class="author">리워드북</span><span class="created-at"><%=n.getNt_date() %></span> 
              </a>
            </li>          
<% } %>

        </ul>
        
      </div>
      <!-- 글쓰기버튼 -->
		<div>
		<% if(loginAdmin != null && loginAdmin.getaNo().substring(0,1).equals("C")){ %>
		<input class="bt1" type="button" name="noticeinsert" value="글쓰기" onclick="location.href='views/board/notice/noticeInsertView.jsp'"></input>
		<% } %>
		</div> 
 	  <!-- //글쓰기버튼 -->
 <br><br><br>
 
<ul>
			<li class="backLi"><a id="back" href="/RewardBook/nlist">목록으로돌아가기</a></li>
		</ul>


    </main>
<!-- //컨텐츠 영역 -->


	<!-- 푸터부분 include -->
	<%@ include file="../../../views/common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, member.model.vo.Member"  %>
<%@ page import="board.notice.model.vo.Notice" %>
 <%
   Notice notice = (Notice)request.getAttribute("notice");
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
   String resultMessage = (String)session.getAttribute("result");
    session.removeAttribute("result");
%>      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/board/noticeDetailView.css">
</head>
<body>
<!-- 헤더부분 include -->
   <%@ include file="../../../views/common/header.jsp" %>
   
<div class="main">
   
   <div><input class="beforebt" type='button' value="<이전으로" onclick="location.href='/RewardBook/nlist'"></div>
   
   <h2><%=notice.getNt_title()  %></h2>
   
   
   <div class="topbar"> <!-- 아이콘닉네임날짜수정삭제 -->
   <% if(loginAdmin != null && loginAdmin.getaNo().substring(0,1).equals("C")){ %>
   <div class="udbt">
   <a class="upbt" href="/RewardBook/nupdatev?nt_no=<%= notice.getNt_no() %>">수정</a>
   
   
   <a class="delbt"  href="/RewardBook/ndelete?nt_no=<%= notice.getNt_no() %>&nt_img=<%= notice.getNt_img() %>">삭제</a>
   </div>
   <% } %>
   
   <div>
   
   <div class="ind">
   <img class="ricon" src="/RewardBook/resources/noticeimg/Ricon.png" width="75px" >
   <h6>리워드북</h6>
   <h6><%=notice.getNt_date() %></h6>
   </div>

   </div> <!-- //아이콘닉네임날짜수정삭제 -->

<div class="contents"><!-- 내용부분 -->

   <% if(notice.getNt_img() != null){ %>
   <img width="960px" src="/RewardBook/resources/noticeimg/<%= notice.getNt_img()%>">
<% } %>


<% if(notice.getNt_text() != null && !(notice.getNt_text().equals("null"))){ %>
   <div class="imagebox"><%= notice.getNt_text() %></div>
   <% } %>
   
</div><!-- //내용부분 -->
<div class="d1">
   <a class="nlistbt" href="/RewardBook/nlist">목록으로 돌아가기</a>
</div>
   </div>
</div>
<%@ include file="../../../views/common/footer.jsp" %>
</body>
</html>
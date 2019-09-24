<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"  import="board.faq.model.vo.Faq, java.util.ArrayList"%>
    
<%--  <%	Member loginMember = (Member)session.getAttribute("loginMember");
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
 	Faq  faq = (Faq)request.getAttribute("list");	 
 %>    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 추가 페이지</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" >
<link rel="stylesheet" href="../../../resources/css/board/faqInsertView.css">

</head>
<body> 
<%@ include file="../../../views/common/header.jsp" %>
<main id="qinmanin">

	<div class=faqinsert-ui-header-all>

		<div class="ui-header">
			<h1 class="title" align="center" margin="0 auto">FAQ 글 등록</h1>
		</div>

<div id="faqWrap">
<form action="/RewardBook/finsert" method="post" >
<input type="hidden" name="a_no" value="<%= loginAdmin.getaNo() %>">

<div class="insertT">
<ul>
<li class="textT"><h3 style="color:white">제목</h6><input type="text" name="faq_title" placeholder="제목을 입력하세요"></li>
<li class="textT"><h3 style="color:white">내용</h6><textarea name="faq_text" placeholder="내용을 입력하세요" ></textarea></li>
<li><select id="faq_oc" class="faq_oc" name="faq_oc">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
					</select></li>
<li class="button"><input class="bt1" type="submit" value="등록">
	&nbsp; <input class="bt2" type="reset" value="취소"  OnClick="javascript:history.back(-1)"></li>

</ul>
</div>
</div>
</form>
</main>
<%@ include file="../../../views/common/footer.jsp" %>

</body>
</html>
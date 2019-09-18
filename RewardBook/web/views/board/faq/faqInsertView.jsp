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
<title>RewardBook</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">

body{
 background-color : #ababab;
}
h1{
	padding:100px;
	color:white;

}
.submitdiv{
	float:right;
	padding: 10px 15px 10px 1px;
}

.insertT { border:2px solid #fff !important;}
.insertT input[type="text"] {border:1px solid #fff; border-bottom:1px solid #8c8c8c; width:90%; height:30px }
.insertT textarea {border:1px solid #fff; width:99%; height:300px; }
.insertT ul{
	margin : 0px;
	padding: 0px;

}

.insertT{
	margin:0 auto;
	width:50%;
}
li{
list-style:none;

}

.button{
	float:right;
	margin: 15px 5px 15px 5px;

}

.textT input[type="text"]::placeholder {
 font-size:16px; color:#8c8c8c; padding-left:5px;}
.textT textarea::placeholder {
 font-size:16px; color:#8c8c8c; padding-left:5px;}

.textT textarea{
font-size : 18px;
margin:5px 0px 5px 0px ;
}

.textT input{
	font-size : 18px;

}
.textT{
padding: 15px;
background-color:#grey;
}
.textT input{
	font-size : 18px;
	margin-left: 10px;

}

li.textT{
padding:15px
}

.bt1, .bt2{
    background-color: white;
    border: 0;
    padding: 10px 11px 10px 11px;
}

#faqWrap{ margin-bottom:150px;}
</style>





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

<li class="button"><input class="bt1" type="submit" value="등록">
	&nbsp; <input class="bt2" type="reset" value="취소"  OnClick="javascript:history.back(-1)"></li>

</ul>
</div>
</div>
<!-- <table align="center" width="750" border="1" >
<tr>
<th>제목</th>
<td><input type="text" name="faq_title" size="90"></td>
</tr>

<tr>
<th>내용</th>
<td><textarea name="faq_text" rows="10" cols="90" ></textarea></td>
</tr> -->

<!-- <tr>
<th>공개여부</th>
<td>
<select id="faqoc" class="faq_oc" name="fac_oc">
							<option value="tc">공개</option>
							<option value="t">비공개</option>
</td>
</tr> -->

<!-- <tr><th colspan="2">
<div class="submitdiv">
	<input type="submit" value="등록">
	&nbsp; <input type="reset" value="취소"  OnClick="javascript:history.back(-1)">
</div>
</th></tr>



</th></tr>
</table> -->
</form>
</main>
<%@ include file="../../../views/common/footer.jsp" %>

</body>
</html>
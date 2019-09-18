<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.faq.model.vo.Faq" %>
<%@ page import="member.model.vo.Member"

 %>
    
 <%	Member loginMember = (Member)session.getAttribute("loginMember");
	Faq q = (Faq)request.getAttribute("list");
	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
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
   	margin: 0px 0px 25px 0px;
}

.bt3{
    border: 1px solid white;
    padding: 8px;
    background-color: white;
    color: black;
    text-decoration: none;
    font-size: 13px;
}

.bt{
	text-align: center;

}
form{
	margin-bottom: 300px;
}
}
</style>
</head>
<body>
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

<li class="bt">
	<input class="bt1" id="Btn" type="submit" value="수정" onclick="alert('수정했습니다.')" >
	&nbsp; <input class="bt2"type="reset" value="취소" OnClick="javascript:history.back(-1)">
	 &nbsp; <a href="/RewardBook/flist" class="bt3">목록가기</a> 
	
</li>

</ul>
</div>
</form>
</main>
</body>
</html>




<!-- <tr>
<th>공개여부</th>
<td>
<select id="faqoc" class="faq_oc" name="fac_oc">
							<option value="tc">공개</option>
							
							<option value="t">비공개</option>
</td>
</tr> -->



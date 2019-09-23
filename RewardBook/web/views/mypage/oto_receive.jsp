<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/common.css">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/oto.css">
</head>
<body>
	<div id="otoSendWrap">
		<form action="/RewardBook/oreceive" method="post">
			<div class="line"></div>
			<p id="sendTitles"><span>황지우</span>님에게 답변하기</p>
			<ul>
				<li class="slist" id="sendTitle">
					<p>제목</p>
					<input type="text" id="sendTitleInput" name="sendTitleInput">
				</li>
				<li class="slist" id="sendText">
					<p>내용</p>
					<textarea id="sendTextInput" name="sendTextInput"></textarea>
				</li>
				<li class="slist" id="sendSubmit">
					<input type="submit" id="sendSubmitBtn" value="문의하기">
					<!--  답변 여부 'N'으로 넘김 -->
					<input type="hidden" value="N" name="yn">
					<!-- 작성자 회원번호 넘김 -->
					<input type="hidden" value="<%= loginMember.getuNo() %>" name="u_no">
					<!-- 메이커 회원번호 넘김 -->
					<input type="hidden" value="A0000104" name="s_no">
				</li>	
			</ul>
		</form>
	</div>
</body>
</html>
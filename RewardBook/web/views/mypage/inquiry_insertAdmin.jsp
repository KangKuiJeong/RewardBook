<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 등록</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/in_admin.css">
</head>
<body>
	
	<!-- 헤더부분 -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="iq_awrap">
		<div id="insertLine"></div>
		<p id="iq_aInsertT">관리자문의 등록</p>
		<p id="iq_aInsertC">문의사항을 남겨주시면 보다 신속하게 답변드리겠습니다.</p>
		
		<div id="insertAwrap">
			<p id="sendAdmin"><span>To.</span>관리자</p>
			<form action="/RewardBook/iq_cinsert" method="post" id="adminInsertForm">
				<ul>
					<li><p>제 목</p><input type="text" id="iq_inputTitle" name="iq_inputTitle"></li>
					<li><p class="pcontents">내 용</p><textarea id="iq_inputText" name="iq_inputText"></textarea></li>
					<li id="submitBtnli">
						<input type="reset" value="취소">
						<input type="submit" value="전송">
						<input type="hidden" name="u_no" value="<%= loginMember.getuNo() %>">
					</li>
				</ul>
				
			</form>
		</div>
		
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
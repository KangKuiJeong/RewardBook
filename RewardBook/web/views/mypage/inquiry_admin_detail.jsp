<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="inquiry.model.vo.Inquiry"%>
<%
   Inquiry inq = (Inquiry)request.getAttribute("inq");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세보기</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/in_admin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function back(){
		
		history.back();
	}
</script>
</head>
<body>

	<!-- 헤더부분 -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="iq_awrapDetail">
		<div id="qDeatil">
			<p id="iq_atitleDeatil"><span>Q.</span><%= inq.getIq_text() %></p>
			<p id="iq_qdate"> <%= inq.getIq_date() %></p>
			<p id="iq_acontentsDetail">
				<%= inq.getIq_text() %>
			</p>
		</div>
		
		<div id="answerDeatil">
			<p id="iq_answertitleDeatil"><span>A.</span>
				<% if(inq.getIq_reply() == null){ %>
					관리자의 답변이 아직 등록되지 않았습니다.
				<% }else { %>
					관리자의 답변입니다.
				<% } %>
			</p>
			<p id="iq_answercontentsDetail">
				<% if(inq.getIq_reply() == null){ %>
					고객님의 답변에 빠른시일내에 답변드릴 수 있도록 노력하겠습니다.
				<% }else { %>
					<%= inq.getIq_reply() %>
				<% } %>
				
			</p>
		</div>
		
		<div id="listbtn"><button id="backListBtn" onclick="back();">문의목록으로</button></div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
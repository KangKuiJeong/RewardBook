<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="inquiry.model.vo.Oto"%>
<% 
	Oto o = (Oto)request.getAttribute("oto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나에게 문의한 글 상세보기</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/in_admin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function back(){
		
		history.back();
	}
	
	function goReceive(){
		
		var url = "/RewardBook/views/mypage/oto_receive.jsp";
	    var name = "답변하기";
	    var option = "width = 600, height = 500, top = 200, left = 800, location = no";
	    		
		window.open(url, name, option);
		
	}
</script>
</script>
</head>
<body>
		<!-- 헤더부분 -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="iq_awrapDetail">
		<div id="qDeatil">
			<p id="iq_atitleDeatil"><span>Q.</span><%= o.getOto_qtitle() %></p>
			<p id="iq_qdate"> <%= o.getOto_qdate() %><span><%= o.getOto_makerName() %></span> </p>
			<p id="iq_acontentsDetail">
				<%= o.getOto_qtext() %>
			</p>
		</div>
		
		<% if(o.getOto_atitle() != null) {%>	<!-- 답변이 있을 때 -->
		
		<div id="answerDeatil">
			<p id="iq_answertitleDeatil"><span>A.</span>
				<% if(o.getOto_atitle() == null){ %>
					메이커의 답변이 아직 등록되지 않았습니다.
				<% }else { %>
					<%= o.getOto_atitle() %>
				<% } %>
			</p>
			<p id="makerName">	
				
			</p>	
			<p id="iq_answercontentsDetail">
				<% if(o.getOto_atext() == null){ %>
					고객님의 답변에 빠른시일내에 답변드릴 수 있도록 노력하겠습니다.
				<% }else { %>
					<%= o.getOto_atext() %>
				<% } %>
				
			</p>
		</div>
		<% }else { %>
			<ul>
				<li class="receiveLi"><button onclick="goReceive();" id="receiveBtn">답변하기</button></li>
			</ul>
			
		<% } %>
		<div id="listbtn"><button id="backListBtn" onclick="back();">문의목록으로</button></div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>
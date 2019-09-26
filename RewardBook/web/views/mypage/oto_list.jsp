<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,inquiry.model.vo.Oto"%>
<%
   ArrayList<Oto> list = (ArrayList<Oto>)request.getAttribute("list");
   int i = 1;
   String message = (String)request.getAttribute("message");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 보낸문의</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/oto.css">
<script>
	function goOto(){
		
		var url = "/RewardBook/views/mypage/oto_send.jsp";
	    var name = "메이커에게 질문하기";
	    var option = "width = 600, height = 500, top = 200, left = 800, location = no";
	    		
		window.open(url, name, option);
		
	}
</script>	
</head>
<body>
	
	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	<div id="oto_awrap">
		<div id="line"></div>
		<p id="oto_atitle">1대1문의내역</p>
		<p id="oto_acontents">메이커에게 질문한 문의내역과 답변을 확인하실 수 있습니다.</p>
		
			
		<div id="sendContainer">
			<ul class="tab">
				<li class="click"><a href="#">내가보낸문의</a></li>
				<li class="notclick"><a href="/RewardBook/orlist?u_no=<%= loginMember.getuNo() %>">내가받은문의</a></li>
			</ul>
			<!-- 내가 보낸문의 -->
			<div id="send" class="tabcontent current">
					<ul>
						<li id="iq_title">
							<ul>
								<li class="iq_subTitle" id="sNo">No</li>
								<li class="iq_subTitle" id="sTit">제목</li>
								<li class="iq_subTitle" id="sDate">날짜</li>
								<li class="iq_subTitle" id="qName">메이커</li>
								<li class="iq_subTitle" id="sYN">답변여부</li>
							</ul>
						</li>
						<% if(list != null && message == null) { %>
							<% for(Oto o : list) { %>
								<li class="iq_con">
									<ul>
										<li class="iq_subTitle" id="sNo"><%= i++ %></li>
										<li class="iq_subTitle" id="sTit">
											<a href="/RewardBook/odetail?oto_no=<%= o.getOto_no() %>"><%= o.getOto_qtitle() %></a>
										</li>
										<li class="iq_subTitle" id="sDate"><%= o.getOto_qdate() %></li>
										<li class="iq_subTitle" id="qName"><%= o.getOto_makerName() %></li>
										<li class="iq_subTitle" id="sYN">
											<% if(o.getOto_yn().equals("Y")){ %>
												<p id="yncheck" style="color:rgb(242, 85, 85);">답변완료</p>
											<% }else{ %>
												<p id="yncheck">미답변</p>
											<% } %>	
										</li>
									</ul>
								</li>
							<% } %>
						<% }else{ %>
							<li><p class="messages"><%= message %></p></li>
						<% } %>
					</ul>
			</div>
		</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
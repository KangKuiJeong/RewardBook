<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,inquiry.model.vo.Inquiry"%>
<%
   ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
   int i = 1; 

%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자문의</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/mypage/in_admin.css">
</head>
<body>

	<!-- 헤더부분 -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="iq_awrap">
		<div id="line"></div>
		<p id="iq_atitle">관리자문의</p>
		<p id="iq_acontents">문의사항을 남겨주시면 보다 신속하게 답변드리겠습니다.</p>
		<button id="iq_awrite" onclick="location.href='views/mypage/inquiry_insertAdmin.jsp'">문의하기</button>
		<p id="nameCountWrap"><%= loginMember.getName() %>님이 남기신 문의 <span><%= list.size() %>개</span></p>
		<div id="iq_wrap">
			<ul>
				<li id="iq_title">
					<ul>
						<li class="iq_subTitle" id="sNo">No</li>
						<li class="iq_subTitle" id="sTit">제목</li>
						<li class="iq_subTitle" id="sDate">날짜</li>
						<li class="iq_subTitle" id="sYN">답변여부</li>
					</ul>
				</li>
				<% for(Inquiry iq : list) {%>
				<li class="iq_con">
					<ul>
						<li class="iq_subTitle" id="sNo"><%= i++ %></li>
						<li class="iq_subTitle" id="sTit">
							<a href="/RewardBook/iq_cdetail?iq_no=<%= iq.getIq_no() %>"><%= iq.getIq_title() %></a>
						</li>
						<li class="iq_subTitle" id="sDate"><%= iq.getIq_date() %></li>
						<li class="iq_subTitle" id="sYN">
								<% if(iq.getIq_oc().equals("Y")){ %>
									<p id="yncheck" style="color:rgb(242, 85, 85);">답변완료</p>
								<% }else{ %>	
									<p id="yncheck">미답변</p>
								<% } %>
						</li>
					</ul>
				</li>
				<% } %>
				
			</ul>
		</div>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
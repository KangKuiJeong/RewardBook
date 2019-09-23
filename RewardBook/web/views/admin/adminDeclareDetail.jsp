<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.model.vo.Inquiry" %>
<%
	Inquiry inquiryDetail = (Inquiry)request.getAttribute("inquiry");
	String a_no = ((Admin)session.getAttribute("loginAdmin")).getaNo();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

.container {
	width : 1440px;
	height : 850px;
	font-family: 'Noto Sans KR', sans-serif;
}

.main {
	width : 1240px;
	height : 800px;
	float : left;
}

.main_area1 {
	width : 100%;
	height : 100px;
}
.main_area1_section1 {
	width : 300px;
	height : 50px;
	margin : 20px 0px 0px 40px;
	float : left;
	font-size : 35px;
	font-weight : 600;
}

.main_area2 {
	width : 100%;
	height : 50px;
}
.main_area2_section1 {
	width : 800px;
	height : 50px;
	margin : 0px 0px 0px 40px;
	font-size : 25px;
	font-weight : 500;
}
.main_area2_section1 .title {
	width : 150px;
	float : left;
	font-size : 25px;
	font-weight : 500;
}
.main_area2_section1 .close, .main_area2_section1 .reply {
	width : 100px;
	float : right;
	cursor : pointer;
}
.main_area2_section1 div div {
	width : 80px;
	height : 28px;
	font-size : 15px;
	text-align : center;
	border-bottom : 1px solid black;
}

.main_area3 {
	width : 100%;
	height : 650px;
}
.main_area3_section1 {
	width : 800px;
	height : 650px;
	margin : 0px 0px 0px 40px;
}
.main_area3_section1 .info {
	width : 800px;
	height : 650px;
}
.main_area3_section1 .info div {
	width : 800px;
	height : 50px;
	float : left;
	clear : both;
}
.main_area3_section1 .info .no, .main_area3_section1 .info .category, .main_area3_section1 .info .name, .main_area3_section1 .info .date, .main_area3_section1 .info .aname, .main_area3_section1 .info .rdate {
	width : 400px;
	float : left;
	clear : none;
}
.main_area3_section1 .info .text, .main_area3_section1 .info .reply {
	height : 112px;
}
.main_area3_section1 .info div div span {
	width : 100px;
	height : 50px;
	margin : 0px 0px 0px 10px;
}
.main_area3_section1 .info div .input input[type=text] {
	width : 650px;
	height : 30px;
	border : 1px solid gray;
	border-radius : 8px;
	font-size : 16px;
	margin : 0px 0px 0px 20px;
	text-align : center;
}
.main_area3_section1 .info div .input input[name=no], .main_area3_section1 .info div .input input[name=category], .main_area3_section1 .info div .input input[name=name], .main_area3_section1 .info div .input input[name=date], .main_area3_section1 .info div .input input[name=aname], .main_area3_section1 .info div .input input[name=rdate] {
	width : 250px;
}
.main_area3_section1 .info div .textarea textarea {
	width : 650px;
	border : 1px solid gray;
	border-radius : 8px;
	font-size : 16px;
	margin : 0px 0px 0px 20px;
}
.main_area3_section1 .info div .text {
	width : 100px;
	height : 50px;
	clear : none;
	text-align : center;
	font-size : 17px;
	font-weight : 600;
	line-height : 30px;
}
.main_area3_section1 .info div .input, .main_area3_section1 .info div .textarea {
	width : 700px;
	height : 50px;
	clear : none;
}
.main_area3_section1 .info .no .input, .main_area3_section1 .info .name .input, .main_area3_section1 .info .category .input, .main_area3_section1 .info .date .input, .main_area3_section1 .info .aname .input, .main_area3_section1 .info .rdate .input {
	width : 300px;
}
.main_area3_section1 .info .story .textarea {
	height : 100px;
}

</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
	});

	var updateFlag = false;
	function p_reply() {
		location.href="/RewardBook/iq_reply_a?page=declare&no="
				+ $(".main_area3_section1 .info .no .input input").val()
				+ "&reply=" + $(".main_area3_section1 .info .reply .textarea textarea").val()
				+ "&ano=" + '<%= a_no %>';
	}
	
</script>
</head>
<body>
<%@ include file="/views/admin/common/adminHeader.jsp" %>
<div class="container">
	<%@ include file="/views/admin/common/adminSideMenu.jsp" %>
	<div class="main">
		<div class="main_area1">
			<div class="main_area1_section1">
				<span>신고 관리</span>
			</div>
		</div>
		<div class="main_area2">
			<div class="main_area2_section1">
				<div class="title">
					<span>정보보기</span>
				</div>
				<div class="close">
					<div onclick="history.back(-1)" name="close">이전으로</div>
				</div>
				<div class="reply">
					<div onclick="p_reply();" name="reply">답변하기</div>
				</div>
			</div>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<div class="info">
					<div class="no">
						<div class="text"><span>번호 </span></div>
						<div class="input"><input type="text" name="no" value="<%= inquiryDetail.getIq_no() == null ? "-" : inquiryDetail.getIq_no() %>" disabled></div>
					</div>
					<div class="category">
						<div class="text"><span>분류 </span></div>
						<div class="input"><input type="text" name="category" value="<%= inquiryDetail.getIq_dcategory() == null ? "-" : inquiryDetail.getIq_dcategory() %>" disabled></div>
					</div>
					<div class="name">
						<div class="text"><span>작성자 </span></div>
						<div class="input"><input type="text" name="name" value="<%= inquiryDetail.getU_name() == null ? "-" : inquiryDetail.getU_name() %>" disabled></div>
					</div>
					<div class="date">
						<div class="text"><span>등록일 </span></div>
						<div class="input"><input type="text" name="date" value="<%= inquiryDetail.getIq_date() == null ? "-" : inquiryDetail.getIq_date() %>" disabled></div>
					</div>
					<div class="title">
						<div class="text"><span>제목 </span></div>
						<div class="input"><input type="text" name="title" value="<%= inquiryDetail.getIq_title() == null ? "-" : inquiryDetail.getIq_title() %>" disabled></div>
					</div>
					<div class="text">
						<div class="text"><span>본문</span></div>
						<div class="textarea"><textarea name="text" rows="5" disabled><%= inquiryDetail.getIq_text() == null ? "-" : inquiryDetail.getIq_text() %></textarea></div>
					</div>
					<div class="aname">
						<div class="text"><span>답변자 </span></div>
						<div class="input"><input type="text" name="aname" value="<%= inquiryDetail.getA_name() == null ? "-" : inquiryDetail.getA_name() %>" disabled></div>
					</div>
					<div class="rdate">
						<div class="text"><span>답변일 </span></div>
						<div class="input"><input type="text" name="rdate" value="<%= inquiryDetail.getIq_rdate() == null ? "-" : inquiryDetail.getIq_rdate() %>" disabled></div>
					</div>
					<div class="reply">
						<div class="text"><span>답변</span></div>
						<div class="textarea"><textarea name="reply" rows="5"><%= inquiryDetail.getIq_reply() == null ? "" : inquiryDetail.getIq_reply() %></textarea></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
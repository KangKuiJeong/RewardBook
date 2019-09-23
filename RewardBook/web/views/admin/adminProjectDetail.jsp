<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.vo.Project" %>
<%
	Project projectDetail = (Project)request.getAttribute("project");
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
.main_area2_section1 .close, .main_area2_section1 .update {
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
.main_area3_section1 .info .no, .main_area3_section1 .info .name, .main_area3_section1 .info .count {
	width : 255px;
	float : left;
	clear : none;
}
.main_area3_section1 .info .nprice, .main_area3_section1 .info .tprice, .main_area3_section1 .info .sdate, .main_area3_section1 .info .edate, .main_area3_section1 .info .secondary, .main_area3_section1 .info .edate, .main_area3_section1 .info .ddate, .main_area3_section1 .info .permission, .main_area3_section1 .info .pdate {
	width : 400px;
	float : left;
	clear : none;
}
.main_area3_section1 .info .story {
	height : 112px;
}
.main_area3_section1 .info .info, .main_area3_section1 .info .return {
	height : 76px;
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
.main_area3_section1 .info div .input input[name=no], .main_area3_section1 .info div .input input[name=name], .main_area3_section1 .info div .input input[name=count] {
	width : 150px;
}
.main_area3_section1 .info div .input input[name=nprice], .main_area3_section1 .info div .input input[name=tprice], .main_area3_section1 .info div .input input[name=sdate], .main_area3_section1 .info div .input input[name=edate], .main_area3_section1 .info div .input input[name=secondary], .main_area3_section1 .info div .input input[name=ddate], .main_area3_section1 .info div .input input[name=permission], .main_area3_section1 .info div .input input[name=pdate] {
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
.main_area3_section1 .info .no .text, .main_area3_section1 .info .name .text, .main_area3_section1 .info .count .text {
	width : 80px;
}
.main_area3_section1 .info div .input, .main_area3_section1 .info div .textarea {
	width : 700px;
	height : 50px;
	clear : none;
}
.main_area3_section1 .info .no .input, .main_area3_section1 .info .name .input, .main_area3_section1 .info .count .input {
	width : 175px;
}
.main_area3_section1 .info .nprice .input, .main_area3_section1 .info .tprice .input, .main_area3_section1 .info .sdate .input, .main_area3_section1 .info .edate .input, .main_area3_section1 .info .secondary .input, .main_area3_section1 .info .ddate .input, .main_area3_section1 .info .permission .input, .main_area3_section1 .info .pdate .input {
	width : 300px;
}
.main_area3_section1 .info .story .textarea {
	height : 100px;
}
.main_area3_section1 .info .story .info, .main_area3_section1 .info .story .return {
	hieght : 60px;
}

</style>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
	});

	var updateFlag = false;
	function update() {
		if (!updateFlag){
			$(".main_area2_section1 .update div").text("저장하기");
			$(".main_area3_section1 .info div .input input").each(function(index, item){
				if($(item).attr("name") != "name" && $(item).attr("name") != "no" && $(item).attr("name") != "count" && $(item).attr("name") != "sdate" && $(item).attr("name") != "secondary" && $(item).attr("name") != "permission" && $(item).attr("name") != "pdate")
					$(item).attr("disabled", false);
			});
			$(".main_area3_section1 .info div .textarea textarea").each(function(index, item){
				if($(item).attr("name") != "return")
					$(item).attr("disabled", false);
			});
			updateFlag = true;
		} else {
			str = 'page=project';
			str += "&no=" + $(".main_area3_section1 .info .no .input input").val();
			str += "&title=" + encodeURI($('.main_area3_section1 .info .title .input input').val());
			str += "&category=" + $(".main_area3_section1 .info .category .input input").val();
			str += "&tprice=" + $(".main_area3_section1 .info .tprice .input input").val();
			str += "&edate=" + $(".main_area3_section1 .info .edate .input input").val();
			str += "&ddate=" + $(".main_area3_section1 .info .ddate .input input").val();
			str += "&story=" + $(".main_area3_section1 .info .story .textarea textarea").val();
			str += "&info=" + $(".main_area3_section1 .info .info .textarea textarea").val();
			location.href="/RewardBook/p_update?" + str;
		}
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
				<span>프로젝트 관리</span>
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
				<div class="update">
					<div name="update" onclick="update();">수정하기</div>
				</div>
			</div>
		</div>
		<div class="main_area3">
			<div class="main_area3_section1">
				<div class="info">
					<div class="no">
						<div class="text"><span>번호 </span></div>
						<div class="input"><input type="text" name="no" value="<%= projectDetail.getP_no() == null ? "-" : projectDetail.getP_no() %>" disabled></div>
					</div>
					<div class="name">
						<div class="text"><span>메이커 </span></div>
						<div class="input"><input type="text" name="name" value="<%= projectDetail.getU_name() == null ? "-" : projectDetail.getU_name() %>" disabled></div>
					</div>
					<div class="count">
						<div class="text"><span>조회수 </span></div>
						<div class="input"><input type="text" name="count" value="<%= projectDetail.getP_count() < 0 ? "-" : projectDetail.getP_count() %>" disabled></div>
					</div>
					<div class="title">
						<div class="text"><span>제목 </span></div>
						<div class="input"><input type="text" name="title" value="<%= projectDetail.getP_title() == null ? "-" : projectDetail.getP_title() %>" disabled></div>
					</div>
					<div class="category">
						<div class="text"><span>카테고리 </span></div>
						<div class="input"><input type="text" name="category" value="<%= projectDetail.getP_category() == null ? "-" : projectDetail.getP_category() %>" disabled></div>
					</div>
					<div class="nprice">
						<div class="text"><span>현재 금액 </span></div>
						<div class="input"><input type="text" name="nprice" value="<%= projectDetail.getP_nprice() < 0 ? "-" : projectDetail.getP_nprice() %>" disabled></div>
					</div>
					<div class="tprice">
						<div class="text"><span>목표 금액 </span></div>
						<div class="input"><input type="text" name="tprice" value="<%= projectDetail.getP_tprice() < 0 ? "-" : projectDetail.getP_tprice() %>" disabled></div>
					</div>
					<div class="sdate">
						<div class="text"><span>시작일 </span></div>
						<div class="input"><input type="text" name="sdate" value="<%= projectDetail.getP_sdate() == null ? "-" : projectDetail.getP_sdate() %>" disabled></div>
					</div>
					<div class="edate">
						<div class="text"><span>마감일 </span></div>
						<div class="input"><input type="text" name="edate" value="<%= projectDetail.getP_edate() == null ? "-" : projectDetail.getP_edate() %>" disabled></div>
					</div>
					<div class="secondary">
						<div class="text"><span>차수 </span></div>
						<div class="input"><input type="text" name="secondary" value="<%= projectDetail.getP_secondary() == null ? "-" : projectDetail.getP_secondary() %>" disabled></div>
					</div>
					<div class="ddate">
						<div class="text"><span>발송일 </span></div>
						<div class="input"><input type="text" name="ddate" value="<%= projectDetail.getP_ddate() == null ? "-" : projectDetail.getP_ddate() %>" disabled></div>
					</div>
					<div class="story">
						<div class="text"><span>본문</span></div>
						<div class="textarea"><textarea name="story" rows="5" disabled><%= projectDetail.getP_story() == null ? "-" : projectDetail.getP_story() %></textarea></div>
					</div>
					<div class="info">
						<div class="text"><span>안내</span></div>
						<div class="textarea"><textarea name="info" rows="3" disabled><%= projectDetail.getP_info() == null ? "-" : projectDetail.getP_info() %></textarea></div>
					</div>
					<div class="permission">
						<div class="text"><span>승인여부</span></div>
						<div class="input"><input type="text" name="permission" value="<%= projectDetail.getP_permission() == null ? "-" : projectDetail.getP_permission() %>" disabled></div>
					</div>
					<div class="pdate">
						<div class="text"><span>처리일</span></div>
						<div class="input"><input type="text" name="pdate" value="<%= projectDetail.getP_pdate() == null ? "-" : projectDetail.getP_pdate() %>" disabled></div>
					</div>
					<div class="return">
						<div class="text"><span>반려사유</span></div>
						<div class="textarea"><textarea name="return" rows="3" disabled><%= projectDetail.getP_return() == null ? "" : projectDetail.getP_return() %></textarea></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
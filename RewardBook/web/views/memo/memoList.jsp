<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, memo.model.vo.Memo" %>
<%@ page import="java.util.ArrayList, project.model.vo.Project" %>
<% 

	ArrayList<Memo> listm = (ArrayList<Memo>)request.getAttribute("listm");
	int result = ((Integer)request.getAttribute("result")).intValue();


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 메모보기</title>
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 프로젝트 메인 스타일시트 연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/memo/memoList.css">
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="categoryWrap">
<div id="projectListWrap">
	<div class="projectListHeader">
		<div class="categoryName"><h2>내가 메모한 프로젝트</h2></div>
	
		</div>
	</div>
	<div class="invest_list">
	
			<% for(Memo m : listm){ %>
			
			<% int percent = (int)((double)(m.getP_nprice()) / (double)(m.getP_tprice()) * 100); %>
			
		<div class="invest_box invest_item">
			<div class="invest_img">
				<a class="invest_imgtag" href="/RewardBook//p_sel?p_no=<%= m.getP_no() %>"><img src="/RewardBook/resources/images/bgimg.jpg"></a></div>
			<div class="invest_title">
				<div class="investap"><a href="/RewardBook//p_sel?p_no=<%= m.getP_no() %>" class="invest_titlelink"><p><%= m.getP_title() %></p></a></div>		
				<div class="invest_name">
					<span class="invest_category"><%= m.getP_category() %></span>
					<span class="invest_maker"><%= m.getU_name() %></span>			
				</div>
			</div>
			<div class="target_gauge"><span class="gauge" style="width:<%= percent %>;"></span></div>
			<span class="percentage"><%= percent %>%</span>
			<span class="invest_info nowprice"><%= m.getP_nprice() %>원</span>
			<span class="invest_info enddate"><%= m.getP_rdate() %>일 남음</span>
		<a  class="memobt" href="/RewardBook/mdetail?p_no=<%= m.getP_no() %>&u_no=<%= m.getU_no() %> ">메모</a>
		<!-- 	<input class="memobt" type="button" value="메모" onclick="showPopup();"> -->
		</div>
	
			<% } %>
</div>




</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
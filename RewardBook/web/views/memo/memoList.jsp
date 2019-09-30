<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, memo.model.vo.Memo" %>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".memotext").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	$(".memobt").click(function()
	{
	$(this).next(".memotext").slideToggle(500);
	});
	});

</script>
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
				<a class="invest_imgtag" href="/RewardBook//p_sel?p_no=<%= m.getP_no() %>"><img src="/RewardBook/resources/upfiles/project/<%= m.getP_img() %>"></a></div>
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
		<button  class="memobt">메모</button>			
			<div class="memotext">
			<form onsubmit="upfunc();">
				<input type="hidden" id="u_no" name="u_no" value="<%= loginMember.getuNo() %>">		
				<input type="hidden" id="p_no" name="p_no" value="<%= m.getP_no() %>">		
			<textarea id="m_text" name="m_text" class="mtext" required style="width: 100%; height: 130px;" ><%= m.getM_text() %></textarea>
			<div class="btbt">
			<input class="upbt" id="upbt"type="submit" value="저장">
			<a class="delbt" href="/RewardBook/mdelete?p_no=<%= m.getP_no() %>&u_no=<%= loginMember.getuNo() %>">삭제</a>
			</div>
			</form>	
			</div>
		</div>
	
			<% } %>
</div>
<script>
	function upfunc(){
	
	$.ajax({
		url: "/RewardBook/minsert",
		data: { u_no: $("#u_no").val(),
				p_no: $("#p_no").val(),
				m_text: $("#m_text").val()
				},
		type: "get",
		success: function(data){
			
	alert('메모가 저장되었습니다.');
		}
	});
}

	</script>

<div class="mar"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
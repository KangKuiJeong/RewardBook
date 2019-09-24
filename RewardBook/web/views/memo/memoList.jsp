<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, memo.model.vo.Memo" %>
<%@ page import="java.util.ArrayList, project.model.vo.Project" %>
<% 
	ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list"); 
	ArrayList<Memo> listm = (ArrayList<Memo>)request.getAttribute("list");
	int result = ((Integer)request.getAttribute("result")).intValue();
	int listcount = 3;

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
<script type="text/javascript">
function showPopup() { window.open("/RewardBook/views/memo/memoDetail.jsp", "프로젝트 메모", "width=450, height=500, left=300, top=300"); }
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
			<% for(int i = 0; i < listcount; i++){ %>
			<% int percent = (int)((double)(list.get(i).getP_nprice()) / (double)(list.get(i).getP_tprice()) * 100); %>
		<div class="invest_box invest_item<%= i+1 %>">
			<div class="invest_img">
				<a class="invest_imgtag" href="/RewardBook//p_sel?p_no=<%= list.get(i).getP_no() %>"><img src="/RewardBook/resources/images/bgimg.jpg"></a></div>
			<div class="invest_title">
				<div class="investap"><a href="/RewardBook//p_sel?p_no=<%= list.get(i).getP_no() %>" class="invest_titlelink"><p><%= list.get(i).getP_title() %></p></a></div>		
				<div class="invest_name">
					<span class="invest_category"><%= list.get(i).getP_category() %></span>
					<span class="invest_maker"><%= list.get(i).getU_name() %></span>			
				</div>
			</div>
			<div class="target_gauge"><span class="gauge" style="width:<%= percent %>;"></span></div>
			<span class="percentage"><%= percent %>%</span>
			<span class="invest_info nowprice"><%= list.get(i).getP_nprice() %>원</span>
			<span class="invest_info enddate"><%= list.get(i).getP_rdate() %>일 남음</span>
			<input class="memobt" type="button" value="메모" onclick="showPopup();"></input>
		</div>
		
			<% } %>
</div>

<div class="load_btn_box txt_center">
	<a href="javascript:;" class="invest_plus">더 불러오기</a>
</div>

<script type="text/javascript">
	var maxlength = (<%= result %> / 3);
	var start_number = 0;
	var count = 3;

	$(".invest_plus").on("click", function() {
		start_number = start_number + 1;
		if(start_number > maxlength) {
			return false;
		}
		$(".load_btn_box").fadeOut("fast");
		$.ajax({
			url: '/RewardBook/p_majax', //주소
			type: 'get', // get 또는 post 방식으로
			dataType: "json",
			success : function(data) { 
				console.log("success");
				//성공시 동작
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				
				for(var i = 0; i < 3; i++){
					
					$(".invest_list").append(
						"<div class='invest_box invest_item'>"
						+ "<div class='invest_img'>"
						+ "<a class='invest_imgtag' href='/RewardBook//p_sel?p_no="+ json.list[count].no +"'><img src='/RewardBook/resources/images/bgimg.jpg'></a></div>"
						+ "<div class='invest_title'>"
						+ "<a href='/RewardBook//p_sel?p_no="+ json.list[count].no +"' class='invest_titlelink'><p>"+ decodeURIComponent(json.list[count].title).replace(/\+/gi, " ") +"</p></a>"
						+ "<div class='invest_name'>"
						+ "<span class='invest_category'>"+ decodeURIComponent(json.list[count].category).replace(/\+/gi, " ") +"</span>"
						+ "<span class='invest_maker'>IT세준</span>"
						+ "</div></div>"
						+ "<div class='target_gauge'><span class='gauge' style='width:" + (json.list[count].nprice / json.list[count].tprice) * 100 + "%'></span></div>"
						+ "<span class='percentage'>"+ parseInt((json.list[count].nprice / json.list[count].tprice) * 100) +"%</span>"
						+ "<span class='invest_info nowprice'>"+ json.list[count].nprice +"원</span>"
						+ "<span class='invest_info enddate'>"+ json.list[count].rdate +"일 남음</span>"
						+ "<input class='memobt' type='button' value='메모' onclick='showPopup();'></input></div>"
					);
					count++;
					
				}
				if(start_number >= maxlength) {
					$(".load_btn_box").fadeOut("fast");
					return false;
				}
				$(".load_btn_box").fadeIn("fast");
				
			},
			error: function(textStatus) {
				console.log("error : " + textStatus);
			}
		});
	});

</script>	


</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
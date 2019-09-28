<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
    
<%@ page import="java.util.ArrayList, project.model.vo.Project" %>
<% 
	ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list"); 
	int result = ((Integer)request.getAttribute("result")).intValue();
	int listcount = 3;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>

<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 프로젝트 메인 스타일시트 연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/project/projectMain.css">
<!-- 공통 header & footer 스타일시트 연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/index.css">
<link rel="stylesheet" href="/RewardBook/resources/css/mainMyPage.css">
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>


</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="slideBox">
		<div class="slide">
			  <ul class="panel">
			    <li><img src="/RewardBook/resources/images/index/main4.png"></li>
			    <li><img src="/RewardBook/resources/images/index/main3.png"></li>
			    <li><img src="/RewardBook/resources/images/index/main2.jpg"></li>
			  </ul>
			  <ul class="dot">
			    <li class="on">슬라이드 버튼1번</li>
			    <li>슬라이드 버튼2번</li>
			    <li>슬라이드 버튼3번</li>
			  </ul>
			  <div class="prev"><img src="/RewardBook/resources/images/index/arrow-left.png"></div>
			  <div class="next"><img src="/RewardBook/resources/images/index/arrow-right.png"></div>
		</div>
	</div>
<div class="categoryWrap">
	<div class="categoryList">
		<a class="category fashionIcon" href="/RewardBook/p_list?category=fashion">
			<span class="categoryIcon">
				<span class="iconImage fashion"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">패션</span>
			</span>
		</a>
		<a class="category techIcon" href="/RewardBook/p_list?category=tech">
			<span class="categoryIcon">
				<span class="iconImage fashion"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">테크</span>
			</span>
		</a>
		<a class="category livingIcon" href="/RewardBook/p_list?category=living">
			<span class="categoryIcon">
				<span class="iconImage living"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">리빙</span>
			</span>
		</a>
		<a class="category concertIcon" href="/RewardBook/p_list?category=art_show">
			<span class="categoryIcon">
				<span class="iconImage concert"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">공연,예술</span>
			</span>
		</a>
		<a class="category beautyIcon" href="/RewardBook/p_list?category=beauty">
			<span class="categoryIcon">
				<span class="iconImage beauty"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">뷰티</span>
			</span>
		</a>
		<a class="category travalIcon" href="/RewardBook/p_list?category=travel">
			<span class="categoryIcon">
				<span class="iconImage traval"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png";></span><br>
				<span class="imageName">여행</span>
			</span>
		</a>
		<a class="category concertIcon" href="/RewardBook/p_list?category=food">
			<span class="categoryIcon">
				<span class="iconImage concert"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">식품</span>
			</span>
		</a>
		<a class="category beautyIcon" href="/RewardBook/p_list?category=design">
			<span class="categoryIcon">
				<span class="iconImage beauty"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png"></span><br>
				<span class="imageName">디자인</span>
			</span>
		</a>
		<a class="category travalIcon" href="/RewardBook/p_list?category=sports">
			<span class="categoryIcon">
				<span class="iconImage traval"><img src="/RewardBook/resources/images/icons8-fashion-trend-48.png";></span><br>
				<span class="imageName">스포츠</span>
			</span>
		</a>
	</div>
</div>

<div id="projectListWrap">
	<div class="projectListHeader">
		<div class="searchArea">
			<h3 class="categoryName">테크</h3>
			<form class="searchForm" action="/RewardBook/indexSearch">
				<label for="searchProject">
					<input id="searchProject"  type="text" name="searchText"  placeholder="검색" >
				<button class="searchButton" type="submit"><i class="icon search"></i></button>
				</label>
			</form>
		</div>
	</div>
	<div class="invest_list">
			<% for(int i = 0; i < listcount; i++){ %>
			<% int percent = (int)((double)(list.get(i).getP_nprice()) / (double)(list.get(i).getP_tprice()) * 100); %>
		<div class="invest_box invest_item<%= i+1 %>">
			<div class="invest_img">
				<a class="invest_imgtag" href="/RewardBook/p_sel?p_no=<%= list.get(i).getP_no() %>"><img src="/RewardBook/resources/images/bgimg.jpg"></a></div>
			<div class="invest_title">
				<a href="/RewardBook//p_sel?p_no=<%= list.get(i).getP_no() %>" class="invest_titlelink"><p><%= list.get(i).getP_title() %></p></a>
				<div class="invest_name">
					<span class="invest_category"><%= list.get(i).getP_category() %></span>
					<span class="invest_maker"><%= list.get(i).getU_name() %></span>
				</div>
			</div>
			<div class="target_gauge"><span class="gauge" style="width:<%= percent %>%;"></span></div>
			<span class="percentage"><%= percent %>%</span>
			<span class="invest_info nowprice"><%= list.get(i).getP_nprice() %>원</span>
			<span class="invest_info enddate"><%= list.get(i).getP_rdate() %>일 남음</span>
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
			url: '/RewardBook/p_cajax', //주소
			type: 'get', // get 또는 post 방식으로
			data: {category: 'tech'},
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
						+ "<a class='invest_imgtag' href='/RewardBook/p_sel?p_no="+ json.list[count].no +"'><img src='/RewardBook/resources/images/bgimg.jpg'></a></div>"
						+ "<div class='invest_title'>"
						+ "<a href='/RewardBook//p_sel?p_no="+ json.list[count].no +"' class='invest_titlelink'><p>"+ decodeURIComponent(json.list[count].title).replace(/\+/gi, " ") +"</p></a>"
						+ "<div class='invest_name'>"
						+ "<span class='invest_category'>"+ decodeURIComponent(json.list[count].category).replace(/\+/gi, " ") +"</span>"
						+ "<span class='invest_maker'>"+ decodeURIComponent(json.list[count].name).replace(/\+/gi, " ") +"</span>"
						+ "</div></div>"
						+ "<div class='target_gauge'><span class='gauge' style='width:" + (json.list[count].nprice / json.list[count].tprice) * 100 + "%'></span></div>"
						+ "<span class='percentage'>"+ parseInt((json.list[count].nprice / json.list[count].tprice) * 100) +"%</span>"
						+ "<span class='invest_info nowprice'>"+ json.list[count].nprice +"원</span>"
						+ "<span class='invest_info enddate'>"+ json.list[count].rdate +"일 남음</span>"
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


<%@ include file="/views/common/footer.jsp" %>

</body>
</html>
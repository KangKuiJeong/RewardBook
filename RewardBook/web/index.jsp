<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, project.model.vo.Project"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<!-- 웹폰트 연결 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- 공통 header & footer 스타일시트 연결 -->
<link rel="stylesheet" href="resources/css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
<script>
	$(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

		//조회수 랭킹 top5
		
				$.ajax({
					url : "hipTop5",
					type : "get",
					dataType : "json",
					success : function(data) {
						//객체를 문자열로 변환 처리함
						var jsonStr = JSON.stringify(data);
						//문자열을 배열 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var j = 1;
						var values = "";
						for ( var i in json.list) {

							var stringTitle_length = Object
									.keys(decodeURIComponent(
											json.list[i].hit5_title).replace(
											/\+/gi, " ")).length;

							if (stringTitle_length > 28) {

								var cutTitle = (decodeURIComponent(json.list[i].hit5_title)
										.replace(/\+/gi, " ")).substr(0, 28);
								
								values += "<a href='/RewardBook//p_sel?p_no="
										+ json.list[i].hit5_no
										+ "'>"
										+ "<li class='rankingList'><p class='rankNum'>"
										+ (j++)
										+ "</p><p class='rankp'>"
										+ cutTitle
										+ ".."
										+ "<br><span class='hitCategory'>"
										+ decodeURIComponent(
												json.list[i].hit5_category)
												.replace(/\+/gi, " ")
										+ "</span>&nbsp;&nbsp;<span class='percent'>"
										+ json.list[i].percent
										+ "% 달성</span>&nbsp;&nbsp;"
										+ "<span class='hitcount'><img src='/RewardBook/resources/images/index/hitcount.png' width='12'>&nbsp;&nbsp;"
										+ parseInt(json.list[i].hit_count)
										+ "<span></p></li></a>"

							} else {

								values += "<a href='/RewardBook//p_sel?p_no="
										+ json.list[i].hit5_no
										+ "'>"
										+ "<li class='rankingList'><p class='rankNum'>"
										+ (j++)
										+ "</p><p class='rankp'>"
										+ decodeURIComponent(
												json.list[i].hit5_title)
												.replace(/\+/gi, " ")
										+ "<br><span class='hitCategory'>"
										+ decodeURIComponent(
												json.list[i].hit5_category)
												.replace(/\+/gi, " ")
										+ "</span>&nbsp;&nbsp;<span class='percent'>"
										+ json.list[i].percent
										+ "% 달성</span>&nbsp;&nbsp;"
										+ "<span class='hitcount'><img src='/RewardBook/resources/images/index/hitcount.png' width='12'>&nbsp;&nbsp;"
										+ parseInt(json.list[i].hit_count)
										+ "<span></p></li></a>"

							}
						}
						$("#tab-1>ul").html($("#tab-1>ul").html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});

		//좋아요 랭킹 top5
		
				$.ajax({
					url : "likeTop5",
					type : "get",
					dataType : "json",
					success : function(data) {
						//객체를 문자열로 변환 처리함
						var jsonStr = JSON.stringify(data);
						//문자열을 배열 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var j = 1;
						var values = "";
						for ( var i in json.list) {

							var stringTitle_length = Object
									.keys(decodeURIComponent(
											json.list[i].like_title).replace(
											/\+/gi, " ")).length;
							if (stringTitle_length > 28) {

								var cutTitle = (decodeURIComponent(json.list[i].like_title)
										.replace(/\+/gi, " ")).substr(0, 28);
								
								values += "<a href='/RewardBook//p_sel?p_no="
										+ json.list[i].like_no
										+ "'>"
										+ "<li class='rankingList'><p class='rankNum'>"
										+ (j++)
										+ "</p><p class='rankp'>"
										+ cutTitle
										+ ".."
										+ "<br><span class='hitCategory'>"
										+ decodeURIComponent(
												json.list[i].like_category)
												.replace(/\+/gi, " ")
										+ "</span>&nbsp;&nbsp;<span class='percent'>"
										+ json.list[i].percent
										+ "% 달성</span>"
										+ "<span class='likeNum'>&nbsp;&nbsp;"
										+ "<img src='/RewardBook/resources/images/mypage/like2.png' width='12'> "
										+ json.list[i].like_count
										+ "<span></p></li></a>"

							} else {

								values += "<a href='/RewardBook//p_sel?p_no="
										+ json.list[i].like_no
										+ "'>"
										+ "<li class='rankingList'><p class='rankNum'>"
										+ (j++)
										+ "</p><p class='rankp'>"
										+ decodeURIComponent(
												json.list[i].like_title)
												.replace(/\+/gi, " ")
										+ "<br><span class='hitCategory'>"
										+ decodeURIComponent(
												json.list[i].like_category)
												.replace(/\+/gi, " ")
										+ "</span>&nbsp;&nbsp;<span class='percent'>"
										+ json.list[i].percent
										+ "% 달성</span>"
										+ "<span class='likeNum'>&nbsp;&nbsp;"
										+ "<img src='/RewardBook/resources/images/mypage/like2.png' width='12'> "
										+ json.list[i].like_count
										+ "<span></p></li></a>"

							}

						}

						$("#tab-2>ul").html($("#tab-2>ul").html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});

		//최근등록된 프로젝트
		
				$.ajax({
					url : "recentTop5",
					type : "get",
					dataType : "json",
					success : function(data) {
						//객체를 문자열로 변환 처리함
						var jsonStr = JSON.stringify(data);
						//문자열을 배열 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var times = 0;
						var mins = 0;
						var hours = 0;
						var days = 0;
						var values = "";

						for ( var i in json.list) {

							var stringTitle_length = Object
									.keys(decodeURIComponent(
											json.list[i].recent_title).replace(
											/\+/gi, " ")).length;

							if (stringTitle_length > 34) {

								var cutTitle = (decodeURIComponent(json.list[i].recent_title)
										.replace(/\+/gi, " ")).substr(0, 34);
								
								times = json.list[i].recent_time;
								mins = times / 60;
								hours = mins / 60;
								days = hours / 24;
								times = times % 60;
								mins = mins % 60;
								hours = hours % 24;

								if (days > 0) {
									values += "<a href='/RewardBook//p_sel?p_no="
											+ json.list[i].recent_no
											+ "'>"
											+ "<li class='recentli'>"
											+ "<img src='/RewardBook/resources/upfiles/project/"
											+ decodeURIComponent(json.list[i].recent_img)
											+ "' width='240' height='132' class='liImg'><br>"
											+ cutTitle
											+ ".."
											+ "<br> <span>"
											+ parseInt(days)
											+ "일 "
											+ parseInt(hours)
											+ "시간 "
											+ parseInt(mins)
											+ "분전 등록"
											+ "</span></li></a>"

								
								} else {

									values += "<li class='recentli'>"
											+ cutTitle + "<br>"
											+ parseInt(hours) + "시간 "
											+ parseInt(mins) + "분전 등록"
											+ "</li>"

								}

							} else {

								times = json.list[i].recent_time;
								mins = times / 60;
								hours = mins / 60;
								days = hours / 24;
								times = times % 60;
								mins = mins % 60;
								hours = hours % 24;

								if (days > 0) {
									values += "<a href='/RewardBook//p_sel?p_no="
											+ json.list[i].recent_no
											+ "'>"
											+ "<li class='recentli'>"
											+ "<img src='/RewardBook/resources/upfiles/project/"
											+ decodeURIComponent(json.list[i].recent_img)
											+ "' width='240' height='132' class='liImg'><br>"
											+ decodeURIComponent(
													json.list[i].recent_title)
													.replace(/\+/gi, " ")
											+ "<br> <span>"
											+ parseInt(days)
											+ "일 "
											+ parseInt(hours)
											+ "시간 "
											+ parseInt(mins)
											+ "분전 등록"
											+ "</span></li></a>"

									
								} else {

									values += "<li class='recentli'>"
											+ decodeURIComponent(
													json.list[i].recent_title)
													.replace(/\+/gi, " ")
											+ "<br>" + parseInt(hours) + "시간 "
											+ parseInt(mins) + "분전 등록"
											+ "</li>"

								}

							}
						}

						$(".recentProject").html(
								$(".recentProject").html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});

		//마감 임박 프로젝트
		
				$.ajax({
					url : "endTop5",
					type : "get",
					dataType : "json",
					success : function(data) {
						//객체를 문자열로 변환 처리함
						var jsonStr = JSON.stringify(data);
						//문자열을 배열 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var times = 0;
						var mins = 0;
						var hours = 0;
						var days = 0;

						var values = "";
						for ( var i in json.list) {

							var stringTitle_length = Object
									.keys(decodeURIComponent(
											json.list[i].end_title).replace(
											/\+/gi, " ")).length;

							if (stringTitle_length > 34) {

								var cutTitle = (decodeURIComponent(json.list[i].end_title)
										.replace(/\+/gi, " ")).substr(0, 34);
						
								times = json.list[i].end_time;
								mins = times / 60;
								hours = mins / 60;
								days = hours / 24;
								times = times % 60;
								mins = mins % 60;
								hours = hours % 24;

								if (days > 0) {

									values += "<a href='/RewardBook//p_sel?p_no="
											+ json.list[i].end_no
											+ "'>"
											+ "<li class='endli'>"
											+ "<img src='/RewardBook/resources/upfiles/project/"
											+ decodeURIComponent(json.list[i].end_img)
											+ "' width='240' height='132' class='liImg'><br>"
											+ cutTitle
											+ ".."
											+ "<br> <span>"
											+ parseInt(days)
											+ "일 "
											+ parseInt(hours)
											+ "시간 "
											+ parseInt(mins)
											+ "분후 마감"
											+ "</span></li></a>"

								} else {

									values += "<li class='endli'>" + cutTitle
											+ ".." + "<br>" + parseInt(hours)
											+ "시간 " + parseInt(mins) + "분후 마감"
											+ "</li>"

								}
							} else {

								times = json.list[i].end_time;
								mins = times / 60;
								hours = mins / 60;
								days = hours / 24;
								times = times % 60;
								mins = mins % 60;
								hours = hours % 24;

								if (days > 0) {

									values += "<a href='/RewardBook//p_sel?p_no="
											+ json.list[i].end_no
											+ "'>"
											+ "<li class='endli'>"
											+ "<img src='/RewardBook/resources/upfiles/project/"
											+ decodeURIComponent(json.list[i].end_img)
											+ "' width='240' height='132' class='liImg'><br>"
											+ decodeURIComponent(
													json.list[i].end_title)
													.replace(/\+/gi, " ")
											+ "<br> <span>"
											+ parseInt(days)
											+ "일 "
											+ parseInt(hours)
											+ "시간 "
											+ parseInt(mins)
											+ "분후 마감"
											+ "</span></li></a>"

								} else {

									values += "<li class='endli'>"
											+ decodeURIComponent(
													json.list[i].end_title)
													.replace(/\+/gi, " ")
											+ "<br>" + parseInt(hours) + "시간 "
											+ parseInt(mins) + "분후 마감"
											+ "</li>"

								}

							}

						}

						$(".endProject").html($(".endProject").html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
		
		
		//IT/테크 최신등록된 프로젝트
		$.ajax({
					url : "itTop3",
					type : "get",
					dataType : "json",
					success : function(data) {
						//객체를 문자열로 변환 처리함
						var jsonStr = JSON.stringify(data);
						//문자열을 배열 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var values = "";
						for ( var i in json.list) {

							var stringTitle_length = Object
									.keys(decodeURIComponent(
											json.list[i].it3_title).replace(/\+/gi, " ")).length;

							if (stringTitle_length > 28) {

								var cutTitle = (decodeURIComponent(json.list[i].it3_title)
										.replace(/\+/gi, " ")).substr(0, 28);
								
								values += "<a href='/RewardBook//p_sel?p_no="
										+ json.list[i].it3_no
										+ "'>"
										+ "<li class='newList'>"
										+ "<p class='rankList'>"
										+ cutTitle
										+ ".."
										+ "<span class='percentList'>"
										+ json.list[i].percent
										+ "% 달성</span></p></li></a>"

							} else {

								values += "<a href='/RewardBook//p_sel?p_no="
									+ json.list[i].it3_no
									+ "'>"
									+ "<li class='newList'>"
									+ "<p class='rankList'>"
									+ decodeURIComponent(
											json.list[i].it3_title).replace(
													/\+/gi, " ")
									+ "<span class='percentList'>"
									+ json.list[i].percent
									+ "% 달성</span></p></li></a>"

							}
						}
						$("#itList").html($("#itList").html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}

			});
	
	//뷰티카테고리 최신등록된 프로젝트
	$.ajax({
				url : "btTop3",
				type : "get",
				dataType : "json",
				success : function(data) {
					//객체를 문자열로 변환 처리함
					var jsonStr = JSON.stringify(data);
					//문자열을 배열 객체로 바꿈
					var json = JSON.parse(jsonStr);
					var values = "";
					for ( var i in json.list) {

						var stringTitle_length = Object
								.keys(decodeURIComponent(
										json.list[i].bt3_title).replace(/\+/gi, " ")).length;

						if (stringTitle_length > 28) {

							var cutTitle = (decodeURIComponent(json.list[i].bt3_title)
									.replace(/\+/gi, " ")).substr(0, 28);
							
							values += "<a href='/RewardBook//p_sel?p_no="
									+ json.list[i].bt3_no
									+ "'>"
									+ "<li class='newList'>"
									+ "<p class='rankList'>"
									+ cutTitle
									+ ".."
									+ "<span class='percentList'>"
									+ json.list[i].percent
									+ "% 달성</span></p></li></a>"

						} else {

							values += "<a href='/RewardBook//p_sel?p_no="
								+ json.list[i].bt3_no
								+ "'>"
								+ "<li class='newList'>"
								+ "<p class='rankList'>"
								+ decodeURIComponent(
										json.list[i].bt3_title).replace(
												/\+/gi, " ")
								+ "<span class='percentList'>"
								+ json.list[i].percent
								+ "% 달성</span></p></li></a>"

						}
					}
					$("#beList").html($("#beList").html() + values);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error : " + jqXHR + ", " + textStatus
							+ ", " + errorThrown);
				}

		});
	
	//의류 최근 등록 top3
	$.ajax({
				url : "fsTop3",
				type : "get",
				dataType : "json",
				success : function(data) {
					//객체를 문자열로 변환 처리함
					var jsonStr = JSON.stringify(data);
					//문자열을 배열 객체로 바꿈
					var json = JSON.parse(jsonStr);
					var values = "";
					for ( var i in json.list) {

						var stringTitle_length = Object
								.keys(decodeURIComponent(
										json.list[i].fs3_title).replace(/\+/gi, " ")).length;
						
						if (stringTitle_length > 28) {

							var cutTitle = (decodeURIComponent(json.list[i].fs3_title)
									.replace(/\+/gi, " ")).substr(0, 28);
							
							values += "<a href='/RewardBook//p_sel?p_no="
									+ json.list[i].fs3_no
									+ "'>"
									+ "<li class='newList'>"
									+ "<p class='rankList'>"
									+ cutTitle
									+ ".."
									+ "<span class='percentList'>"
									+ json.list[i].percent
									+ "% 달성</span></p></li></a>"

						} else {

							values += "<a href='/RewardBook//p_sel?p_no="
								+ json.list[i].fs3_no
								+ "'>"
								+ "<li class='newList'>"
								+ "<p class='rankList'>"
								+ decodeURIComponent(
										json.list[i].fs3_title).replace(
												/\+/gi, " ")
								+ "<span class='percentList'>"
								+ json.list[i].percent
								+ "% 달성</span></p></li></a>"

						}
					}
					$("#faList").html($("#faList").html() + values);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error : " + jqXHR + ", " + textStatus
							+ ", " + errorThrown);
				}

		});
	
	// 조회수 1 증가 ajax

	$.ajax({
		url: "/RewardBook/s_insert"
	});
});	
</script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="views/common/header.jsp"%>

	<!-- 슬라이드영역 -->
	<div id="slideBox">
		<div class="slide">
			<ul class="panel">
				<li><img src="resources/images/index/main4.png"></li>
				<li><img src="resources/images/index/main3.png"></li>
				<li><img src="resources/images/index/main2.jpg"></li>
			</ul>
			<ul class="dot">
				<li class="on">슬라이드 버튼1번</li>
				<li>슬라이드 버튼2번</li>
				<li>슬라이드 버튼3번</li>
			</ul>
			<div class="prev">
				<img src="resources/images/index/arrow-left.png">
			</div>
			<div class="next">
				<img src="resources/images/index/arrow-right.png">
			</div>
		</div>
	</div>


	<!-- 컨텐츠 영역 -->

	<!--  md추천 프로젝트 -->
	<div class="mainContent">
		<table id="firstTable">
			<tr>
				<td id="firstTd">
					<div class="mdPick">
						<p class="mainSubtitle">이런 프로젝트는 어때요?</p>
						<table id="mdPickTable">
							<tr>
								<td><a href="/RewardBook//p_sel?p_no=34"> <img
										src="/RewardBook/resources/upfiles/project/pSample4.jpg">
										[앵콜펀딩]나만을 위한 맞춤 큐레이션 샐러드 정기구독 서비스
								</a></td>
								<td><a href="/RewardBook//p_sel?p_no=42"> <img
										src="/RewardBook/resources/upfiles/project/t8.PNG">
										영화관을 집으로, 빔프로젝터의 새로운 기준, 10만원대 '올뷰 시네마'
								</a></td>
								<td><a href="/RewardBook//p_sel?p_no=35"> <img
										src="/RewardBook/resources/upfiles/project/pSample5.PNG">
										[리워드북 MD추천]실제로 모르는 사람이 물어봤어요 , 랫어릿 섬유향수
								</a></td>
							</tr>
							<tr id="tdline2">
								<td><a href="#"> <img
										src="/RewardBook/resources/images/index/t4.PNG"> 
										다양한 스마트 디바이스를 충전할 수 있는 올인원 무선 충전 보조배터리!
								</a></td>
								<td colspan="2" id="tdline2Right"><a href="#"> <img
										src="/RewardBook/resources/images/index/t5.png">
										★초음파렌즈세척기★ 지금까지 렌즈관리 어떻게 하셨나요? 주머니 쏙~!! 렌즈 관리하기 어려운 당신에게 추천드리는
										단 하나의 솔루션!
								</a></td>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<!--  실시간 랭킹  -->
					<div class="rankTop5">
						<p class="mainSubtitle" id="top5TabsTtile">실시간 랭킹 TOP5</p>
						<div class="tabContainer">

							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">조회수</li>
								<li class="tab-link" data-tab="tab-2">좋아요</li>
							</ul>

							<div id="tab-1" class="tab-content current">
								<ul>

								</ul>
							</div>
							<div id="tab-2" class="tab-content">
								<ul>

								</ul>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<!-- 최근등록된 프로젝트 -->
		<div class="recentProject">
			<p class="mainSubtitle"> &nbsp;최근 오픈된 프로젝트</p>
			<p id="projectMore">
				<a href="/RewardBook/p_list">더보기 ></a>
			</p>
			<ul>
				<li class="recentli">

					<p></p>
				</li>
				<li class="recentli">

					<p></p>
				</li>
				<li class="recentli">

					<p></p>
				</li>
				<li class="recentli">

					<p></p>
				</li>
				<li class="recentli">

					<p></p>
				</li>
			</ul>
		</div>

		<!-- 카테고리별 프로젝트 보기 -->
		<div class="indexCategory">
			<p class="newCategoryTitle">카테고리별 방금 오픈한 펀딩 TOP3</p>
			<ul class="indexUl">
				<li>
					<div class="cateBack" id="cateBackIt">
						<p class="cateTitle">IT &amp; Tech</p>
					</div>
					<ul id="itList">
					</ul>
					<button class="top3Listbtn" onclick="location.href='/RewardBook/p_list?category=tech'">더보기</button>
				</li>
				<li>
					<div class="cateBack" id="cateBackBu">
						<p class="cateTitle">Beauty</p>
					</div>
					<ul id="beList">
					</ul>
					<button class="top3Listbtn" onclick="location.href='/RewardBook/p_list?category=beauty'">더보기</button>
				<li>
					<div class="cateBack" id="cateBackFa">
						<p class="cateTitle">Fashion</p>
					</div>
					<ul id="faList">
					</ul>
					<button class="top3Listbtn" onclick="location.href='/RewardBook/p_list?category=fashion'">더보기</button>					
			</ul>
		</div>

		<!-- 마감임박프로젝트 -->
		<div class="endProject">
			<p class="mainSubtitle"> &nbsp;서두르세요! 마감임박 프로젝트</p>
			<p id="projectMore">
				<a href="/RewardBook/p_list">더보기 ></a>
			</p>
			<ul>
				<li class="endli">

					<p></p>
				</li>
				<li class="endli">

					<p></p>
				</li>
				<li class="endli">

					<p></p>
				</li>
				<li class="endli">
					<p></p>
				</li>
				<li class="endli">
					<p></p>
				</li>
			</ul>
		</div>

		<!-- 배너영역 -->
		<div class="bannerArea">
			<a href="/RewardBook/views/project/projectOpenIntro.jsp"> <img
				src="/RewardBook/resources/images/index/mainBanner1.png">
			</a>
		</div>
	</div>


	<!-- 푸터부분 include -->
	<%@ include file="views/common/footer.jsp"%>

</body>
</html>
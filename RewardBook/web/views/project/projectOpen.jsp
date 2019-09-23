<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberNo = ((Member)session.getAttribute("loginMember")).getuNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
.area1 {
	width : 100%;
}
.area1 .index {
	width : 800px;
	height : 1000px;
	background : green;
	margin : auto;
	display : none; /* 지울 것 */
}

.area1 .edit {
	width : 1000px;
	margin : auto;
	/* display : none; */
}
.area1 .edit .tab {
	width : 100%;
	height : 60px;
}
.area1 .edit ul {
	margin : auto;
	margin : 20px 0px 0px 10px;
}
.area1 .edit ul li, .area1 .edit ul li input[type=submit] {
	width : 130px;
	height : 40px;
	border-top : 1px solid #E8DEDC;
	border-bottom : 1px solid #E8DEDC;
	border-left : 1px solid #E8DEDC;
	float : left;
	font-size : 16px;
	font-weght : 400;
	text-align : center;
	line-height : 40px;
	cursor : pointer;
}
.area1 .edit ul li[name=one] {
	border-top-left-radius : 5px;
	border-bottom-left-radius : 5px;
}
.area1 .edit ul li[name=five] {
	border-right : 1px solid #E8DEDC;
	border-top-right-radius : 5px;
	border-bottom-right-radius : 5px;
}
.area1 .edit ul li[name=six] {
	background : gray;
	margin : 0px 0px 0px 30px;
	border-right : 1px solid #E8DEDC;
	border-radius : 5px;
}
.area1 .edit ul li[name=seven] {
	margin : 0px 0px 0px 30px;
	border : none;
}
.area1 .edit ul li[name=seven] input[type=submit] {
	height : 42px;
	background : #FFB202;
	border-right : 1px solid #E8DEDC;
	border-radius : 5px;
}

.area1 .edit .container .text {
	width : 100%;
	height : 500px;
	border : 1px solid #E8DEDC;
	display : none;
}
.area1 .edit .container .text[name=one] {
	height : 2300px;
	display : block;
}

.area1 .edit .container .text div {
	width : 90%;
	height : 200px;
	margin: 30px 5% 0px 5%;
}

.area1 .edit .container .text div .title {
	width : 250px;
	height : 100%;
	background : yellow;
	margin : 0px 0px 0px 0px;
	float : left;
	font-size : 18px;
	font-weight : 600;
}
.area1 .edit .container .text div .title .subtitle {
	font-size : 18px;
	font-weight : 600;
	clear : both;
}
.area1 .edit .container .text div .title .explain {
	font-size : 16px;
	font-weight : 500;
}

.area1 .edit .container .text div .input {
	width : 648px;
	height : 100%;
	border : 1px solid #E8DEDC;
	margin : 0px 0px 0px 0px;
	float : left;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
<script type="text/javascript">
function showEdit() {
	$(".area1 .index").css("display", "none");
	$(".area1 .edit").css("display", "block");
};

$(function() {
	
	$(".tabMenu li").on("click", function() {
		if ($(this).index() < 5) {
			
			$(".tabMenu li").each(function(index, item) {
				if (index < 5){
					$(item).css("background", "white");
				}
			});
			$(this).css("background", "#C9C1B5");
			
			$(".edit .container .text").each(function(index, item) {
				$(item).css("display", "none");
			});
			$(".edit .container .text").eq($(this).index()).css("display", "block");
			
		} else {
			if ($(this).index() == 5) {
				
			}
		}
	});
});
</script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="/views/common/header.jsp" %>
	
	<div class="area1">
		<div class="index">
			<div><h2>몇 가지 세부사항을 미리 확인하고, 프로젝트를 시작하세요.</h2></div>
			<div>펀딩 진행 중에는 제공할 리워드를 다른 온∙오프라인에서 펀딩하거나 판매하지 않습니다.</div>
			<div>제공할 리워드는 현금, 지분 등의 수익이 아닌 제품 또는 서비스입니다.</div>
			<div>진행할 프로젝트가 지적 재산권을 침해하지 않습니다.</div>
			<div>서포터에게 프로젝트 진행 과정을 안내하고, 배송 약속을 지킬 수 있습니다.</div>
			<div>서포터와의 신뢰를 위해 펀딩 진행∙제품 제작∙배송 등 모든 과정에서 겪는 어려움들을 서포터에게 진솔하게 전달하고 문제를 해결합니다.</div>
			<div onclick="showEdit()">계속하기</div>
		</div>
		<form method="post" action="/RewardBook/p_insert">
		<input type="hidden" name="no" value="<%= memberNo %>">
		<div class="edit">
			<div class="tab">
				<ul class="tabMenu">
					<li name="one">기본정보</li>
					<li name="two">리워드</li>
					<li name="three">스토리</li>
					<li name="four">메이커정보</li>
					<li name="five">정산</li>
					<li name="six">미리보기</li>
					<li name="seven"><input type="submit" value="신청하기"></li>
				</ul>
			</div>
			<div class="container">
				<div class="text" name="one">
					<div class="part1">
						<div class="title">
							<div class="subtitle">프로젝트 번호</div>
							<div class="explain">리워드북 관리자와의 소통은 프로젝트 번호로 진행됩니다.</div>
						</div>
						<div class="input">
							<span>???????</span>
							<span>/RewardBook//p_sel?p_no=</span><span>???????</span><span>으로 주소가 설정되며 프로젝트 오픈 후 진입 가능합니다.</span>
						</div>
					</div>
					<div class="part2">
						<div class="title">
							<div class="subtitle">연락처</div>
							<div class="explain">주요 안내를 받으실 이메일을 등록해 주세요. 정보 변경은 회원정보설정에서 가능합니다.</div>
						</div>
						<div class="input">
							<span>????</span><span>인증됨</span>
						</div>
					</div>
					<div class="part3">
						<div class="title">
							<div class="subtitle">프로젝트 제목</div>
							<div class="explain">프로젝트 성격과 리워드를 짐작할 수 있게 간결하고 직관적으로 작성해주세요.</div>
						</div>
						<div class="input">
							<input type="text" name="title" placeholder="40자 내외로 작성해주세요.">
						</div>
					</div>
					<div class="part4">
						<div class="title">
							<div class="subtitle">목표 금액</div>
						</div>
						<div class="input">
							<input type="text" name="tprice" value="0">원
						</div>
					</div>
					<div class="part5">
						<div class="title">
							<div class="subtitle">카테고리</div>
						</div>
						<div class="input">
							<select name="category">
								<option value="반려동물" selected>반려동물</option>
								<option value="IT">IT</option>
								<option value="생활용품">생활용품</option>
								<option value="음식">음식</option>
								<option value="하나">하나</option>
								<option value="두시기">두시기</option>
								<option value="석삼">석삼</option>
								<option value="너구리">너구리</option>
							</select>
						</div>
					</div>
					<div class="part6">
						<div class="title">
							<div class="subtitle">필수 확인사항</div>
						</div>
						<div class="input">
							<span>Q1. 리워드가 타 크라우드펀딩사 및 온라인 커머스, 자사 홈페이지 등 다른 판매처에서 유통된 적이 있거나 현재 유통 중인가요?</span>
							<span>선택하신 답변이 사실과 다를 경우 약정서에 근거하여 프로젝트 취소 및 위약벌이 부과될 수 있습니다.</span>
							<span>아니요. 다른 곳에서 유통한 적이 없으며 와디즈를 통해 처음 선보이는 제품입니다.</span>
							<span>예, 다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.</span>
						</div>
					</div>
					<div class="part7">
						<div class="title">
							<div class="subtitle">종료일</div>
						</div>
						<div class="input">
							<input type="date" name="sdate">
						</div>
					</div>
					<div class="part8">
						<div class="title">
							<div class="subtitle">발송 예정일</div>
						</div>
						<div class="input">
							<input type="date" name="ddate">
						</div>
					</div>
				</div>
				<div class="text" name="two">
					<div>리워드 추가</div>
				</div>
				<div class="text" name="three">
					<div class="part1">
						<div class="title">소개 글 작성하기</div>
						<div class="input">
							<input type="text" name="story">
						</div>
					</div>
					<div class="part2">
						<div class="title">안내 글 작성하기</div>
						<div class="input">
							<input type="text" name="info">
						</div>
					</div>
				</div>
				<div class="text" name="four">
					메이커정보
				</div>
				<div class="text" name="five">
					정산
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>
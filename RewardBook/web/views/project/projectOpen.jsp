<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberNo = ((Member)session.getAttribute("loginMember")).getuNo();
	String memberId = ((Member)session.getAttribute("loginMember")).getId();
	String memberBno = ((Member)session.getAttribute("loginMember")).getuBno();
	int rewardCount = 1;
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
	width : 150px;
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
	background : #C9C1B5;
	border-top-left-radius : 5px;
	border-bottom-left-radius : 5px;
}
.area1 .edit ul li[name=four] {
	border-right : 1px solid #E8DEDC;
	border-top-right-radius : 5px;
	border-bottom-right-radius : 5px;
}
.area1 .edit ul li[name=five] {
	background : #bdbdbd;
	margin : 0px 0px 0px 32px;
	border-right : 1px solid #E8DEDC;
	border-radius : 5px;
}
.area1 .edit ul li[name=six] {
	margin : 0px 0px 0px 32px;
	border : none;
}
.area1 .edit ul li[name=six] input[type=submit] {
	height : 42px;
	background : #FFB202;
	border-right : 1px solid #E8DEDC;
	border-radius : 5px;
}

.area1 .edit .container .text {
	width : 100%;
	height : 430px;
	border : 1px solid #E8DEDC;
	display : none;
}
.area1 .edit .container .text[name=one] {
	height : 1400px;
	display : block;
}
.area1 .edit .container .text[name=two] {
	height : 520px;
}
.area1 .edit .container .text[name=three] {
	height : 740px;
}

.area1 .edit .container .text div {
	width : 90%;
	height : 200px;
	margin: 30px 5% 0px 5%;
}
.area1 .edit .container .text[name=two] .rewardList {
	width : 600px;
	height : 420px;
	clear : both;
	margin: 0px 200px 0px 200px;
}
.area1 .edit .container .text[name=two] .rewardList .reward {
	width : 550px;
	height : 330px;
	border : 2px solid #c9c9c9;
	float : left;
	font-size : 16px;
	color : #6B5D4E;
	background : #eeeeee;
	padding : 25px;
	margin : 30px 0px 0px 0px;
}
.area1 .edit .container .text[name=two] .rewardButton {
	width : 200px;
	height : 50px;
	margin : 20px auto 0px auto;
}
.area1 .edit .container .text[name=two] .rewardButton .button {
	width : 200px;
	height : 50px;
	border-radius : 5px;
	margin : auto;
	background : #FFB202;
	font-size : 20px;
	font-weight : 600;
	text-align : center;
	line-height : 50px;
	color : #6B5D4E;
	cursor : pointer;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_index {
	width : 275px;
	height : 50px;
	margin: 0px;
	font-size : 18px;
	font-weight : 500;
	color : #6B5D4E;
	clear : both;
}
 .area1 .edit .container .text[name=two] .rewardList .reward .r_price,  .area1 .edit .container .text[name=two] .rewardList .reward .r_amount {
	width : 275px;
	height : 50px;
	margin: 0px;
	float : left;
	font-size : 18px;
	font-weight : 500;
	color : #6B5D4E;
	text-align : right;
 }
.area1 .edit .container .text[name=two] .rewardList .reward .r_title {
	width : 550px;
	height : 80px;
	margin: 0px;
	font-size : 18px;
	font-weight : 500;
	color : #6B5D4E;
	clear : both;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_detail {
	width : 550px;
	height : 150px;
	margin: 0px;
	font-size : 18px;
	font-weight : 500;
	color : #6B5D4E;
	clear : both;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_index {
	font-size : 18px;
	font-weight : 600;
	color : black;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_price input, .area1 .edit .container .text[name=two] .rewardList .reward .r_amount input {
	width : 150px;
	height : 30px;
	font-size : 18px;
	margin : 0px 10px 0px 20px;
	border : 2px solid #c9c9c9;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_title input {
	width : 546px;
	height : 30px;
	font-size : 18px;
	margin : 0px 0px 0px 0px;
	border : 2px solid #c9c9c9;
}
.area1 .edit .container .text[name=two] .rewardList .reward .r_detail textarea {
	width : 546px;
	height : 120px;
	font-size : 18px;
	margin : 0px 0px 0px 0px;
	border : 2px solid #c9c9c9;
}
#cke_p_content, .cke_inner.cke_reset {
	margin : 0px;
}


.area1 .edit .container .text div .title {
	width : 250px;
	height : 100%;
	margin : 0px 0px 0px 0px;
	float : left;
	font-size : 18px;
	font-weight : 600;
}
.area1 .edit .container .text div .title .subtitle {
	width : 100%;
	height : 30px;
	font-size : 18px;
	font-weight : 600;
	margin : 0px;
	clear : both;
}
.area1 .edit .container .text div .title .explain {
	width : 100%;
	height : 50px;
	font-size : 16px;
	font-weight : 500;
	color : #6B5D4E;
	margin : 0px;
}

.area1 .edit .container .text div .input {
	width : 566px;
	height : 140px;
	border : 2px solid #c9c9c9;
	margin : 0px 0px 0px 30px;
	float : left;
	font-size : 16px;
	color : #6B5D4E;
	background : #eeeeee;
	padding : 25px;
}

.area1 .edit .container .text div .input input[type=text] {
	width : 400px;
	height : 30px;
	font-size : 18px;
	margin : 0px 20px 0px 0px;
	border : 2px solid #c9c9c9;
}

.area1 .edit .container .text div .input select {
	width : 200px;
	height : 30px;
	font-size : 18px;
	margin : 0px 20px 0px 0px;
	border : 2px solid #c9c9c9;
	padding : 0px 0px 0px 10px;
}

.area1 .edit .container .text div .input input[type=date] {
	width : 200px;
	height : 30px;
	font-size : 18px;
	margin : 0px 20px 0px 0px;
	border : 2px solid #c9c9c9;
	padding : 0px 0px 0px 10px;
}

.area1 .edit .container .text .part1 {
	height : 154px;
}
.area1 .edit .container .text .part1 .input {
	height : 90px;
}
.area1 .edit .container .text .part2 {
	height : 124px;
}
.area1 .edit .container .text .part2 .input {
	height : 60px;
}
.area1 .edit .container .text .part3 {
	height : 124px;
}
.area1 .edit .container .text .part3 .input {
	height : 60px;
}
.area1 .edit .container .text .part4 {
	height : 124px;
}
.area1 .edit .container .text .part4 .input {
	height : 60px;
}
.area1 .edit .container .text .part5 {
	height : 104px;
}
.area1 .edit .container .text .part5 .input {
	height : 40px;
}
.area1 .edit .container .text .part6 {
	height : 244px;
}
.area1 .edit .container .text .part6 .input {
	height : 180px;
}
.area1 .edit .container .text .part7 {
	height : 104px;
}
.area1 .edit .container .text .part7 .input {
	height : 40px;
}
.area1 .edit .container .text .part8 {
	height : 104px;
}
.area1 .edit .container .text .part8 .input {
	height : 40px;
}

.area1 .edit .container .text[name=three] .part1 {
	height : 104px;
}
.area1 .edit .container .text[name=three] .part1 .input {
	height : 40px;
}
.area1 .edit .container .text[name=three] .part2 {
	height : 104px;
}
.area1 .edit .container .text[name=three] .part2 .input {
	height : 40px;
}

.area1 .edit .container .text[name="three"] .part3 .input div {
	width : 565px;
	height : 310px;
	margin : 0px;
}

.area1 .edit .container .text[name=three] .part1 .input input, .area1 .edit .container .text[name=three] .part2 .input input {
	font-size : 18px;
}

.area1 .edit .container .text[name="four"] .part1 {
	height : 220px;
}
.area1 .edit .container .text[name="four"] .part1 .input {
	height : 170px;
}
.area1 .edit .container .text[name="four"] .part1 .input div {
	width : 550px;
	height : 30px;
	margin : 15px 0px 0px 0px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>
<script type="text/javascript" src="/RewardBook/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

function showEdit() {
	$(".area1 .index").css("display", "none");
	$(".area1 .edit").css("display", "block");
};

function addReward() {
	var count = $(".area1 input[name=rewardcount]").val() * 1 + 1;
	var str = "<div class='reward'>" + 
			"<div class='r_index'>리워드 #" + count + "</div>" + 
			"<div class='r_price'>금액<input type='text' name='r_price[" + count + "]' value='0' style='text-align : right; padding-right : 10px'>원</div>" +
			"<div class='r_amount'>수량<input type='text' name='r_amount[" + count + "]' value='0' style='text-align : right; padding-right : 10px'>개</div>" + 
			"<div class='r_title'>리워드 제목<input type='text' name='r_title[" + count + "]' placeholder='리워드를 간단히 설명할 수 있는 제목을 작성해주세요.' style='padding-left : 10px'></div>" +
			"<div class='r_detail'>리워드 설명<textarea name='r_detail[" + count + "]' placeholder='리워드의 구성품, 특성 등 자세한 설명을 작성해주세요.' style='padding-left : 10px'></textarea></div>" +
			"</div>";
	$(".area1 .edit .container .text[name=two] .rewardList").append(str);
	var height1 = 414 * count + 100;
	$(".area1 .edit .container .text[name=two]").css("height", height1);
	var height2 = 414 * count;
	$(".area1 .edit .container .text[name=two] .rewardList").css("height", height2);
	$(".area1 input[name=rewardcount]").val(count);
}

$(function() {

	$.ajax({
		url: "/RewardBook/p_getseq",
		type: "get",
		dataType: "json",
		success: function(data){

			var val = data.projectNo * 1 + 1;
			
			$(".area1 .edit .container .text .part1 .input .projectNo").text(val);
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error");
		}
	});
	
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
	
	$(".edit .container .text[name=one] .part3 .input input").on("keyup", function() {
		$(".edit .container .text[name=one] .part3 .input span").text($(".edit .container .text[name=one] .part3 .input input").val().length + " / 40");
	})
	
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
		<form method="post" enctype="multipart/form-data" action="/RewardBook/p_insert">
		<input type="hidden" name="no" value="<%= memberNo %>">
		<input type="hidden" name="rewardcount" value="1">
		<div class="edit">
			<div class="tab">
				<ul class="tabMenu">
					<li name="one">기본정보</li>
					<li name="two">리워드</li>
					<li name="three">스토리</li>
					<li name="four">정산</li>
					<li name="five">미리보기</li>
					<li name="six"><input type="submit" value="신청하기"></li>
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
							<span style="font-size : 22px;">"/RewardBook/p_sel?p_no=<span class="projectNo"></span>"</span><br>
							<span style="font-size : 18px; line-height : 40px;">위 주소로 프로젝트 주소가 설정되며 프로젝트 오픈 후 진입 가능합니다.</span>
						</div>
					</div>
					<div class="part2">
						<div class="title">
							<div class="subtitle">연락처</div>
							<div class="explain">주요 안내를 받으실 이메일을 등록해 주세요. 정보 변경은 회원정보설정에서 가능합니다.</div>
						</div>
						<div class="input">
							<span style="font-size : 18px;"><%= memberId %></span><span style="font-size : 18px; font-weight : 600; color : blue; margin : 0px 0px 0px 20px">인증됨</span>
						</div>
					</div>
					<div class="part3">
						<div class="title">
							<div class="subtitle">프로젝트 제목</div>
							<div class="explain">프로젝트 성격과 리워드를 짐작할 수 있게 간결하고 직관적으로 작성해주세요.</div>
						</div>
						<div class="input">
							<input type="text" name="title" placeholder="40자 내외로 작성해주세요." style="padding-left : 10px">
							<span style="font-size : 18px;">0 / 40</span>
						</div>
					</div>
					<div class="part4">
						<div class="title">
							<div class="subtitle">목표 금액</div>
						</div>
						<div class="input">
							<input type="text" name="tprice" value="0" style="text-align : right; padding-right : 10px">원
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
							<span style="font-size : 18px; font-weight : 600;">Q. 리워드가 타 크라우드펀딩사 및 온라인 커머스,자사 홈페이지 등 다른<br>판매처에서 유통된 적이 있거나 현재 유통 중인가요?<br></span>
							<div style="width : 540px; height : 48px; margin : 10px 0px 0px 0px;"><span>선택하신 답변이 사실과 다를 경우 약정서에 근거하여 프로젝트 취소 및 위약벌이 부과될 수 있습니다.</span></div>
							<div style="width : 560px; height : 30px; margin : 10px 0px 0px 0px;"><input type="radio" class="radio" name="radio" style="margin : 0px 5px 0px 0px"><span>아니요. 다른 곳에서 유통한 적이 없으며 와디즈를 통해 처음 선보이는 제품입니다.</span></div>
							<div style="width : 560px; height : 30px; margin : 0px 0px 0px 0px;"><input type="radio" class="radio" name="radio" style="margin : 0px 5px 0px 0px"><span>예, 다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.</span></div>
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
					<div class="rewardList">
						<div class="reward">
							<div class="r_index">
								리워드 #1
							</div>
							<div class="r_price">
								금액<input type="text" name="r_price[1]" value="0" style="text-align : right; padding-right : 10px">원
							</div>
							<div class="r_amount">
								수량<input type="text" name="r_amount[1]" value="0" style="text-align : right; padding-right : 10px">개
							</div>
							<div class="r_title">
								리워드 제목<input type="text" name="r_title[1]" placeholder="리워드를 간단히 설명할 수 있는 제목을 작성해주세요." style="padding-left : 10px">
							</div>
							<div class="r_detail">
								리워드 설명<textarea name="r_detail[1]" placeholder="리워드의 구성품, 특성 등 자세한 설명을 작성해주세요." style="padding-left : 10px"></textarea>
							</div>
						</div>
					</div>
					<div class="rewardButton">
						<div class="button" onclick="addReward();">추가하기</div>
					</div>
				</div>
				<div class="text" name="three">
					<div class="part1">
						<div class="title">썸네일 사진</div>
						<div class="input">
							<input type="file" name="thumbnail" size=40>
						</div>
					</div>
					<div class="part2">
						<div class="title">스토리 사진</div>
						<div class="input">
							<input type="file" name="story" size=40>
						</div>
					</div>
					<div class="part3">
						<div class="title">안내 글 작성하기</div>
						<div class="input" style="height : 320px;">
							<textarea class="form-control" id="p_content" name="info" style="display : block; margin : 0px 0px 0px 0px;"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {height: 200});
							</script>
						</div>
					</div>
				</div>
				<div class="text" name="four">
					<div class="part1">
						<div class="title">수수료</div>
						<div class="input" style="font-size : 18px;">
							<div style="margin : 0px 0px 0px 0px;">리워드 오픈 수수료는 7%(VAT별도)입니다.</div>
							<div>・ 부가 서비스 이용 시, 추가 수수료가 발생될 수 있습니다.</div>
							<div>・ 리워드가 없는 기부후원 프로젝트의 경우, 수수료가 다르게 적용됩니다.</div>
							<div>・ 자세한 내용은 리워드북 수수료 정책을 확인해주세요.</div>
						</div>
					</div>
					<div class="part2">
						<div class="title">
							<div class="subtitle">사업자 정보</div>
							<div class="explain">정보 변경은 회원정보설정에서 가능합니다.</div>
						</div>
						<div class="input">
							<span style="font-size : 18px;"><%= (memberBno == null ? "정보가 없습니다." : memberBno) %></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>